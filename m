Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8CB58F48
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B4410E6D8;
	Tue, 16 Sep 2025 07:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P96B513c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EAF10E08A;
 Tue, 16 Sep 2025 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758008133; x=1789544133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MkxsAdTEJmJsDiCKMPCldb+NMVDFehPl4KcO15Fe9zY=;
 b=P96B513ctCY9arIywnyJ0p241zSHY3JwfxVqjGnl4NIv/J4N5YR6saZ5
 WLvuxkHKsxvnazMk2odUjxoxP4xiB3zu5WSXx5QpH9ctwa/ozDG2/Y8b3
 KKLC3mGynpoxy+T/dumj48/p6/K2YgIhuJRSvjpWX8+8lBuXuj6F228GK
 y98LQ442VTh9oaYoy4v61hZt3ybSfnNFrdty/H0On4iV9ZwmlvuotdptA
 A3B7B4hIfKu3QUmPPsCXncUNMhCQR/csOrusJiKhTcnSD3OsYmT6mt5wy
 0YFZEnCJCvFALzXS/OilL0+bes8aqPAk/P9CKTqK8rK4lwR43TBVWTTwb g==;
X-CSE-ConnectionGUID: 7azxKO00SpKcAAcYdVmQFw==
X-CSE-MsgGUID: eJZosFcZTgeURskyCHmwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70960408"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70960408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:35:31 -0700
X-CSE-ConnectionGUID: FFHARF7wSKe4gjNUJv0n3g==
X-CSE-MsgGUID: keLBqBomQDyz9p1jfB25wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179250740"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 00:35:29 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v3 1/3] drm: Add GPU frequency tracepoint at DRM level
Date: Tue, 16 Sep 2025 12:57:02 +0530
Message-Id: <20250916072704.2351591-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916072704.2351591-1-s.sebinraj@intel.com>
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
MIME-Version: 1.0
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

Add a GPU frequency tracepoint at the DRM subsystem level

The implementation includes:
- DRM-level tracepoint exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/
- CONFIG_DRM_GPU_FREQUENCY_TRACE Kconfig option (default=n)

The tracepoint follows kernel tracing and provides kHz frequency
values with GPU identification for power analysis and
performance monitoring tools.

The tracepoint is only active when CONFIG_DRM_GPU_FREQUENCY_TRACE=y
and can be integrated by GPU drivers for frequency reporting.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/Kconfig                   | 11 ++++++
 drivers/gpu/drm/Makefile                  |  1 +
 drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
 drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..975cc7b2581d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,6 +53,17 @@ config DRM_DRAW
 	bool
 	depends on DRM
 
+config DRM_GPU_FREQUENCY_TRACE
+	bool "Enable GPU frequency tracepoints"
+	depends on DRM && TRACEPOINTS
+	default n
+	help
+	  Enable GPU frequency tracepoints in the power trace subsystem.
+	  This provides kernel tracing support for GPU frequency changes
+	  that will be exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/.
+
+	  If unsure, say N.
+
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86a..12c81b6a750d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
 	drm_client_event.o \
 	drm_client_modeset.o
+drm-$(CONFIG_DRM_GPU_FREQUENCY_TRACE) += drm_gpu_frequency_trace.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
new file mode 100644
index 000000000000..b5fa5134226d
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPU frequency trace points for DRM subsystem
+ *
+ * This provides GPU frequency tracing support that will be exposed at:
+ * /sys/kernel/debug/tracing/events/power/gpu_frequency/
+ */
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+
+#define CREATE_TRACE_POINTS
+#include "drm_gpu_frequency_trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
+
+#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/drivers/gpu/drm/drm_gpu_frequency_trace.h
new file mode 100644
index 000000000000..cf6337847b3a
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpu_frequency_trace.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_GPU_FREQUENCY_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _GPU_FREQUENCY_TRACE_H
+
+#include <linux/tracepoint.h>
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+#define TRACE_INCLUDE_FILE drm_gpu_frequency_trace
+
+/*
+ * Tracepoint for GPU frequency changes
+ * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
+ *
+ * location: /sys/kernel/debug/tracing/events/power/gpu_frequency
+ * format: {unsigned int state, unsigned int gpu_id}
+ * where state holds the frequency(in KHz) and the gpu_id holds the GPU clock domain.
+ */
+TRACE_EVENT(gpu_frequency,
+	    TP_PROTO(unsigned int state, unsigned int gpu_id),
+	    TP_ARGS(state, gpu_id),
+	    TP_STRUCT__entry(
+		    __field(unsigned int, state)
+		    __field(unsigned int, gpu_id)
+		    ),
+	    TP_fast_assign(
+		    __entry->state = state;
+		    __entry->gpu_id = gpu_id;
+		    ),
+	    TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
+);
+
+#else /* !CONFIG_DRM_GPU_FREQUENCY_TRACE */
+
+static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id) { }
+
+#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
+
+#endif /* _GPU_FREQUENCY_TRACE_H */
+
+#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
+#include <trace/define_trace.h>
+#endif
-- 
2.34.1

