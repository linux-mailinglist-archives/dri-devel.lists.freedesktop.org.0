Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6608A7AE44
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AD310EA5C;
	Thu,  3 Apr 2025 20:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1ImIVetd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0110EA5C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:24:57 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-af953100791so902405a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743711897; x=1744316697;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5JjsjFOUC3YO0iochXENC9eaId60vwka6iugGNbtu6g=;
 b=1ImIVetdnz8awFoJKnLiDi0iLcPf9735tc+XwTlBmlAjR9hhx5pjEMWK74TlCm7nD4
 jSO82njXe33H3hwKqJ+Z2mpOH6I2S+RoCgbozW4zmjgL5k7tb4DkEFQXK5l4Zxr1G5Ya
 JglMsFwzlmHsuBtr90vZQucnOdfIaibc9I+2o0MCcaHX3iGOPxYBy9+4WiN0Muc066qZ
 APG4lGO1jLtaydwv/mSmCIER8YL+ROiVdyEgndVZSGZUHEAzsymwlRKpdFP66XN0BeSs
 B7u/sIIGH0OoIT0w+remBI/qqNBAj3O+j2/zj0aLfy0gb5FXDfOI+S1LxuuFF4xmCy9o
 Xhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743711897; x=1744316697;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5JjsjFOUC3YO0iochXENC9eaId60vwka6iugGNbtu6g=;
 b=g6j0PHKJ+Gg4xAYsS062thdSkEVz7T55NccAk1zqwe5R61z9L5MP0iOc2zWQiWh0j/
 idj/41Q7nyL5lqafJIBaW/aLlI8IscmOzph6aABj1sEgX5g1baU9vxTHX42UfSnL5/S8
 QAAzBYj4oP6N5MJQbWr+fcLghag/cXRddHm/geXKfQ0WVHthRpopS8ewV5N9WDGIErgO
 c5qlUW6m1rhMD8lbkNb8oVmK83Ba9qdMXlDDrUnoMhkxT6rWjxEufSo7w2hLfDryhJPL
 nUyuB3u7b0BKLqrT9eYX+XtZwuYcpsO1ODTNDsCkJMNSHusbKAOPaiA2wShdpzHGfkMr
 mfNQ==
X-Gm-Message-State: AOJu0Yx/u3Fu93xNReX2Sd0uSqJ1+UF12UwJCa9XAvxS6noOPc+S7Bl0
 upE0HMWFKGLkItjvrh3p43AGb3K8yvyfIvXxQamx+7kuAD8K2c/7Qa442QUqa/tWzZXmj4Ol4a8
 7Wv+KFA==
X-Google-Smtp-Source: AGHT+IHRfFDzCYIPq5Bp5DbUlRqc8I14sxeIBKF4QG8mXK1Q6lEJ5VL4ONiwvatjg5A7PeaRVPG/gKZbjZDM
X-Received: from plbja4.prod.google.com ([2002:a17:902:efc4:b0:223:52c5:17f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:94e:b0:229:1619:ab58
 with SMTP id d9443c01a7336-22a8a0b33e8mr7237285ad.43.1743711896952; Thu, 03
 Apr 2025 13:24:56 -0700 (PDT)
Date: Thu,  3 Apr 2025 13:24:39 -0700
In-Reply-To: <20250403202439.57791-1-irogers@google.com>
Mime-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403202439.57791-5-irogers@google.com>
Subject: [PATCH v3 4/4] perf tests: Add a DRM PMU test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test opens any DRM devices so that the shell has fdinfo files
containing the DRM data. The test then uses perf stat to make sure the
events can be read.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/drm_pmu.sh | 78 +++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh

diff --git a/tools/perf/tests/shell/drm_pmu.sh b/tools/perf/tests/shell/drm_pmu.sh
new file mode 100755
index 000000000000..e629fe0e8463
--- /dev/null
+++ b/tools/perf/tests/shell/drm_pmu.sh
@@ -0,0 +1,78 @@
+#!/bin/bash
+# DRM PMU
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+output=$(mktemp /tmp/perf.drm_pmu.XXXXXX.txt)
+
+cleanup() {
+  rm -f "${output}"
+
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  echo "Unexpected signal in ${FUNCNAME[1]}"
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+# Array to store file descriptors and device names
+declare -A device_fds
+
+# Open all devices and store file descriptors. Opening the device will create a
+# /proc/$$/fdinfo file containing the DRM statistics.
+fd_count=3 # Start with file descriptor 3
+for device in /dev/dri/*
+do
+  if [[ ! -c "$device" ]]
+  then
+    continue
+  fi
+  major=$(stat -c "%Hr" "$device")
+  if [[ "$major" != 226 ]]
+  then
+    continue
+  fi
+  echo "Opening $device"
+  eval "exec $fd_count<\"$device\""
+  echo "fdinfo for: $device (FD: $fd_count)"
+  cat "/proc/$$/fdinfo/$fd_count"
+  echo
+  device_fds["$device"]="$fd_count"
+  fd_count=$((fd_count + 1))
+done
+
+if [[ ${#device_fds[@]} -eq 0 ]]
+then
+  echo "No DRM devices found [Skip]"
+  cleanup
+  exit 2
+fi
+
+# For each DRM event
+err=0
+for p in $(perf list --raw-dump drm-)
+do
+  echo -n "Testing perf stat of $p. "
+  perf stat -e "$p" --pid=$$ true > "$output" 2>&1
+  if ! grep -q "$p" "$output"
+  then
+    echo "Missing DRM event in: [Failed]"
+    cat "$output"
+    err=1
+  else
+    echo "[OK]"
+  fi
+done
+
+# Close all file descriptors
+for fd in "${device_fds[@]}"; do
+  eval "exec $fd<&-"
+done
+
+# Finished
+cleanup
+exit $err
-- 
2.49.0.504.g3bcea36a83-goog

