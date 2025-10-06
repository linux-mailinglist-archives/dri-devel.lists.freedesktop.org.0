Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD8BBE098
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669910E06B;
	Mon,  6 Oct 2025 12:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECqVf6WV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D8110E06B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759754025; x=1791290025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PADTH9sK7B55j6KgpHnnj5DFwgLJqfvprH+XlV1LZxM=;
 b=ECqVf6WV9Z4WWkBm/IKgLFvur/6TnXoeWA2rtMpssuidEUR1mwJdUaJb
 24F/ffYGouFy+8VleUgkJHmUh0HdmcW1HEsM6+t1ww4gifUdScI13SPIg
 1b9obMwfo27RIQtYY3sVFpEa/6aTum9WbwMEgQMF9enGeV/8Rrd3BpjXH
 5mcxkMP3SVN8OTjKYotjFAzZosM/ezQ39VmLsscNlbNe9jz+8JvBbau/1
 7shpbZ+A2uIrteM4fw6f0HhY6etMjVsauXJSHOr3APhs490mzb3RjlQsO
 L62H6F3FGjFaha68LssDibIerZxBtwiMIXJ6Lq4tYZ6o9j1u3bbLkDkeW w==;
X-CSE-ConnectionGUID: pfDKQR5sRU2mQSsy1y4LlQ==
X-CSE-MsgGUID: hyJJ37WGTKen+IRfTOpD7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="64544766"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="64544766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 05:33:45 -0700
X-CSE-ConnectionGUID: VAWjOYKxS/aQYleBG0UndA==
X-CSE-MsgGUID: Y+eenKFMQlaZJqa5wM5U1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179485871"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 05:33:41 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH] gpu/trace: add a gpu work period tracepoint
Date: Mon,  6 Oct 2025 11:57:39 +0000
Message-ID: <20251006115741.3687113-1-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patch adds the GPU work period kernel tracepoint as required
by the Android platforms. GPU work period event defines a
non-overlapping, non-zero period of time from start_time_ns
(inclusive) until end_time_ns (exclusive) for a given uid, and
includes details of how much work the GPU was performing for uid
during the period.

The GPU work period event is required to have the following format:

Defines the structure of the kernel tracepoint:
/sys/kernel/tracing/events/power/gpu_work_period

A value that uniquely identifies the GPU within the system.
  uint32_t gpu_id;

The UID of the application (i.e. persistent, unique ID of the Android
app) that submitted work to the GPU.
  uint32_t uid;

The start time of the period in nanoseconds. The clock must be
CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
  uint64_t start_time_ns;

The end time of the period in nanoseconds. The clock must be
CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
  uint64_t end_time_ns;

The amount of time the GPU was running GPU work for |uid| during the
period, in nanoseconds, without double-counting parallel GPU work for the
same |uid|. For example, this might include the amount of time the GPU
spent performing shader work (vertex work, fragment work, etc.) for
|uid|.
  uint64_t total_active_duration_ns;

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/trace/Kconfig       | 12 +++++++
 include/trace/gpu_work_period.h | 59 +++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 include/trace/gpu_work_period.h

diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index cd3d19c4a201..33ffe865739b 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -11,3 +11,15 @@ config TRACE_GPU_MEM
 	  Tracepoint availability varies by GPU driver.
 
 	  If in doubt, say "N".
+
+config TRACE_GPU_WORK_PERIOD
+        bool "Enable GPU work period tracepoint"
+        default n
+        help
+          Choose this option to enable tracepoint for tracking
+          GPU usage based on the UID. Intended for performance
+          profiling and required for Android.
+
+          Tracepoint availability varies by GPU driver.
+
+          If in doubt, say "N".
diff --git a/include/trace/gpu_work_period.h b/include/trace/gpu_work_period.h
new file mode 100644
index 000000000000..e06467625705
--- /dev/null
+++ b/include/trace/gpu_work_period.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+
+#if !defined(_TRACE_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_GPU_WORK_PERIOD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(gpu_work_period,
+
+	TP_PROTO(
+		u32 gpu_id,
+		u32 uid,
+		u64 start_time_ns,
+		u64 end_time_ns,
+		u64 total_active_duration_ns
+	),
+
+	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
+
+	TP_STRUCT__entry(
+		__field(u32, gpu_id)
+		__field(u32, uid)
+		__field(u64, start_time_ns)
+		__field(u64, end_time_ns)
+		__field(u64, total_active_duration_ns)
+	),
+
+	TP_fast_assign(
+		__entry->gpu_id = gpu_id;
+		__entry->uid = uid;
+		__entry->start_time_ns = start_time_ns;
+		__entry->end_time_ns = end_time_ns;
+		__entry->total_active_duration_ns = total_active_duration_ns;
+	),
+
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,
+		__entry->uid,
+		__entry->start_time_ns,
+		__entry->end_time_ns,
+		__entry->total_active_duration_ns)
+);
+
+#endif /* _TRACE_GPU_WORK_PERIOD_H */
+
+/* This part must be outside protection */
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE gpu_work_period
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#include <trace/define_trace.h>
-- 
2.49.0

