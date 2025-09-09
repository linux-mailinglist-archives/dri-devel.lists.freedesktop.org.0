Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67EB4A6A7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A9710E659;
	Tue,  9 Sep 2025 09:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcYgCNQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7152B10E659;
 Tue,  9 Sep 2025 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757408831; x=1788944831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MkxsAdTEJmJsDiCKMPCldb+NMVDFehPl4KcO15Fe9zY=;
 b=LcYgCNQY3uiDw3RHt9EXzWRWdnCZ3OHEXVNgS7i0Q7czLJO/oRu6CIsu
 O94XFCxSkch7MnUPuO1eJnhfNLKDhutVNCuQdFXkdCPHl9v4zAWmYJeiX
 dTabf+p8soBf2VT4KBePZJEz/WYl3oNDdlVYujRofaCLS/3ImmtzR0Z6d
 UybNLdi4TfvWUK4LADdP26uWRA3df+YtWDccRWQA8MesWWEUmGso0RiI5
 xyx0csnp3mKo2GgPrBVOW+iqQkhW7OXT/1kDNBQl1fYM2NgON7wHO2fBr
 Eh2iKsBERM9LlPz1X5hhLFJ19xuLxkjkaRU5OVvNEQlLRnoKCVBKxzwTa g==;
X-CSE-ConnectionGUID: t37YPbqcQdWehpP8sMn7Qg==
X-CSE-MsgGUID: pRnSF0Z8SRaCc9e44evmkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85132635"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="85132635"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:06:57 -0700
X-CSE-ConnectionGUID: fCf8j0SIRzeeoh61yevYEA==
X-CSE-MsgGUID: 852nW14FSe6wiwC0Vod1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172628953"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2025 02:06:56 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v2 1/2] drm: Add GPU frequency tracepoint at DRM level
Date: Tue,  9 Sep 2025 14:29:18 +0530
Message-Id: <20250909085919.168658-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909085919.168658-1-s.sebinraj@intel.com>
References: <20250909085919.168658-1-s.sebinraj@intel.com>
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

