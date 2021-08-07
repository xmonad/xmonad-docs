#!/usr/bin/env bash

set -eu

function o { printf -->&2 "%s:%s\\n" "${0##*/}" "$(printf " %q" "$@")"; "$@"; }

cd "${1:?}"

for dir in */; do
	if [[ $dir =~ ^(([[:alnum:]]*[[:alpha:]][[:alnum:]]*-)+)[0-9\.]+/$ ]]; then
		o ln -sf "${dir%/}" "${BASH_REMATCH[1]%-}"
	fi
done
