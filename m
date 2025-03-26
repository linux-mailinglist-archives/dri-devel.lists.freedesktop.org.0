Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B96A70FA9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 04:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704CD10E64D;
	Wed, 26 Mar 2025 03:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KhU1OF4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5710E310
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 03:51:14 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-224364f2492so97643305ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742961074; x=1743565874;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ctVsz7hgWpIU/uH3VF5e2aMQbQTrsjnfwBUoye3blFY=;
 b=KhU1OF4is7ACoB5iv3fDnGgA7FoMKjVKROnl6P1iSYSwR7BV53AXBLo7T9IhIwesS1
 0PQyRLJfdgZHIzBoe7cWgp2fIfF+2lVDw8yINAE3ED5Q/c2dImOx0LMtvTDmBIBkwaUN
 NG+C+dp986ePJYeRMS+j3lbm4MiCNJTGXYLzkh/dXbwjw4jWzyHTsw0jaBP17KyNrrkd
 MjfqvyIiyUuFgqtTt/2NJyBagzCm5B+3ApK0qFIL+vg2+LBaUfEk9/5RyvuJHFOKM0w7
 Yy9y26Tbl552gtKeM9jWOCzM1xVTFzi3Xkw9hT2kT/j48bBS0haljF7FrgTlOWi7jq8J
 Excw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742961074; x=1743565874;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ctVsz7hgWpIU/uH3VF5e2aMQbQTrsjnfwBUoye3blFY=;
 b=eAv1HkYxvV+5GV63FA+2SjJrk59FQt2g+qNvBBXMGgvOm4sh337V9h7CbUsGyeblmw
 yOtO36tH0Nl5MytZ74OzAEAoqCYXnnY0Bc/kP/QNRc0v4Q+Utiq74InH4PM/cdTFJ9dn
 zTGfyICA17HclZQmW25d/EhVPjPfCMPQ03Ntm7ssazd+84at6crbvOvk1JKHpPv5trUz
 rl1jpdvX30W1VyCcMq/yc/pDvUZ+T9MW93eeto74sNbzFZj0TvePlm89eyQwqcYKSOJY
 aGxCsJZlDFser2otX66Q+Ells3pdWeFMd2sJAMPRE3VNWfxCAlyT+BsuoaRs+OWmujFc
 O0Gw==
X-Gm-Message-State: AOJu0YwPrQUW6P0NBWgquilRXuMPXedV8dTacJ33fnBU+Q8e5TxggYMs
 HWW8ogxrVkbRppQTl+T+5Lz22ALnoRMoG6uPZH/4SSXmKKn+Iegt/JBE2J/Ixa/uPOM6lzmYHaf
 ASzIRDQ==
X-Google-Smtp-Source: AGHT+IFuIYPt5fZK8YyYW50wNwsUW0E0QHMb5IXd5j8+kU/hV6iPRt1mTz1isNYFhwUfLx1ZPXqwltN8EATv
X-Received: from pffx4.prod.google.com ([2002:aa7:93a4:0:b0:736:47b8:9b89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:888a:0:b0:736:3c2f:acdd
 with SMTP id d2e1a72fcca58-739059c1873mr29119546b3a.14.1742961074328; Tue, 25
 Mar 2025 20:51:14 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:50:45 -0700
In-Reply-To: <20250326035045.129440-1-irogers@google.com>
Mime-Version: 1.0
References: <20250326035045.129440-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326035045.129440-5-irogers@google.com>
Subject: [PATCH v2 4/4] perf tests: Add a DRM PMU test
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
 tools/perf/tests/shell/drm_pmu.sh | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh

diff --git a/tools/perf/tests/shell/drm_pmu.sh b/tools/perf/tests/shell/drm_pmu.sh
new file mode 100755
index 000000000000..55477603a80f
--- /dev/null
+++ b/tools/perf/tests/shell/drm_pmu.sh
@@ -0,0 +1,77 @@
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
2.49.0.395.g12beb8f557-goog

