Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BADAE72FA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3F10E63D;
	Tue, 24 Jun 2025 23:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dYwf+Q9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5456D10E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:19:09 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-740774348f6so536904b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750807148; x=1751411948;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=B1kPy2JCJb4zSJWeggG32MlvxkW2zq73XjOq2Ztu1jk=;
 b=dYwf+Q9ExsDBm2rfeDKKpgdcDDqJJNA5RzSGfhd3RJRTvCX7M8lz8NUNe+m2nIESC8
 3ikZhN3azi9nOOjFmlTUcf/07JPZjZuTqZrmMC/TYvDoYSQYnVAitjwShPPpJdRshD3V
 2u6aWKp2rB8CHS49rfQTfw8x5hDYyHFmOKakiF7QDWYYR3dncQr8dgBd2KjKzxxz7uye
 AUvh5yloCTKr11Su7X3J7ILcueELzBMKDau0a54iwpu4SkEEnFEBSIl8+pRmB9ul6Nfr
 Tqs969auumWr2kqUmJXorXgrpIb9Mcv+VEOzldgvBpaaFArw+OynorlfMI/KAOlDzYWR
 T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750807148; x=1751411948;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B1kPy2JCJb4zSJWeggG32MlvxkW2zq73XjOq2Ztu1jk=;
 b=qHTHJZ7Ekt9/Y4lcEpYmKaisuBSrcI1mo37fOr/FUT/nDC66MjZqF4nH1HfBN317jW
 wQXkOU+dN/VtnVwjpiW3nZxUrBsxGdgzsFzibaQFRnVSLYRazWUgBqdSPB2u5VoIYaB4
 JaX1Ty6mz3+z1Q/nwWa3p/76IkJOcd7rPK8wxKQC2+8LSubVrWyN9J5mSZ3G9Q6zKor6
 lOiUScZMtYqDJfk/w3+khrhVk4z9bdioRdur1dQT5lMNyYfO6+IUrBZC2ngO8rfqrYm0
 R0/KYCbq4P0vnZ4Ky+c1JfFT7kWjmLZm3GEomhnDTgYXcvWHPxZeSXLg2MWIttZwG0En
 QehA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmBb1mcUq5U+5Rd76MdZlHLNuagqeXAwtI5eAsxhhjb/VhfMzyAQ8UQXOUmIiIFy1tQMV0NvSg+uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVbDjxJEUIfvbQWrfnEMv4R+2eTYMaGz6Pt6EjxR+ZzitJH9GE
 uSu0+XKkkEntr6uE/+aGQ772g4n1pQmiua4u2v1sos2UdhnASGLsXEtHL6R51cenZJe+Es3EMMh
 ogMpAMMNhaA==
X-Google-Smtp-Source: AGHT+IFM/3RFuKFIfuGzUEOUqlkqwyLCKg/Cqd+4H1d7Z9aSC+KCwBKw4SxuPZ/gbvXQWKoQuXWIxobHNqhB
X-Received: from pfbfa15.prod.google.com
 ([2002:a05:6a00:2d0f:b0:749:2cc7:bd89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1826:b0:748:fcfa:8bd5
 with SMTP id d2e1a72fcca58-74ad4462622mr1658511b3a.3.1750807148521; Tue, 24
 Jun 2025 16:19:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:18:37 -0700
In-Reply-To: <20250624231837.179536-1-irogers@google.com>
Mime-Version: 1.0
References: <20250624231837.179536-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250624231837.179536-4-irogers@google.com>
Subject: [PATCH v4 3/3] perf tests: Add a DRM PMU test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 matthew.olson@intel.com, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: Ian Rogers <irogers@google.com>
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
2.50.0.727.gbf7dc18ff4-goog

