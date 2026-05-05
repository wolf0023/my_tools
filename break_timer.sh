#!/bin/bash
TITLE="休憩の時間だよ"
MESSAGE="2〜3分でいいから目を閉じよう"

# Usage: ./break_timer.sh <minutes>
if [ -z "$1" ]; then
    echo "Usage: $0 <minutes>"
    exit 1
fi

# Check if the input is a valid number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number of minutes."
    exit 1
fi

MINUTES="$1"

while true; do
    sleep $((MINUTES * 60))

    notify-send "$TITLE" "$MESSAGE"
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    echo "$(date): Notification sent: $TITLE - $MESSAGE"

    read -p "Press Enter to resume the timer after your break..."
    echo "$(date): Timer resumed after break."
done
