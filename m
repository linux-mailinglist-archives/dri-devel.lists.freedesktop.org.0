Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377782F304
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1D110E5B4;
	Tue, 16 Jan 2024 17:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3717B10E596;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=si4qkqBB5adyNAGP0JeWSzTFOfJf6adqQHg1pHF0eYE=;
 b=AxYuKhZkalPdj2EQUR29RFty6ugjU0vI9GkCP4J4skQ29sTHw52cpRHg
 L4Ouzixvqn56NJRKoEJSG9nZ3cvxXs18pWw8FLeAFJVbyeA7lDG9/qttw
 O7ja7V9IRF66pZi3A7p4m5GEq6ZHabWloKKut7YRdWna1G2EIQolsLSAi
 cvunn1HjNqBi/hk27tJ7o0cPs/gTvZUWRHLCR3Of5c6tccr0cTic9MrEJ
 PhNqwhvSLyyNhsuzlaDNOoIxDqOBTTf9GmiPXwDYSqgnHOMEBGl5w6l0j
 q5zwA0edowXl+SyHSlp0Z3p0vUQwv8iUH6MbxD8wbU3v7njOhfflNvotl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593356"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869623"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:46 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Add capture size check in GuC log buffer
Date: Tue, 16 Jan 2024 09:12:33 -0800
Message-Id: <20240116171237.118463-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The capture-nodes is included in GuC log buffer, add the size check
for capture region in the whole GuC log buffer.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h     |   3 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  48 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c       | 179 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h       |  15 +++
 drivers/gpu/drm/xe/xe_guc_log_types.h |  26 ++++
 5 files changed, 271 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 6894d4a2dfa7..ea78496c9a73 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -22,6 +22,9 @@
 #define xe_gt_notice(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_info(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 227500c98825..f742073fede4 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -243,6 +243,54 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* GuC logging structures */
+
+enum guc_log_buffer_type {
+	GUC_DEBUG_LOG_BUFFER,
+	GUC_CRASH_DUMP_LOG_BUFFER,
+	GUC_CAPTURE_LOG_BUFFER,
+	GUC_MAX_LOG_BUFFER
+};
+
+/*
+ * struct guc_log_buffer_state - GuC log buffer state
+ *
+ * Below state structure is used for coordination of retrieval of GuC firmware
+ * logs. Separate state is maintained for each log buffer type.
+ * read_ptr points to the location where i915 read last in log buffer and
+ * is read only for GuC firmware. write_ptr is incremented by GuC with number
+ * of bytes written for each log entry and is read only for i915.
+ * When any type of log buffer becomes half full, GuC sends a flush interrupt.
+ * GuC firmware expects that while it is writing to 2nd half of the buffer,
+ * first half would get consumed by Host and then get a flush completed
+ * acknowledgment from Host, so that it does not end up doing any overwrite
+ * causing loss of logs. So when buffer gets half filled & i915 has requested
+ * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
+ * to the value of write_ptr and raise the interrupt.
+ * On receiving the interrupt i915 should read the buffer, clear flush_to_file
+ * field and also update read_ptr with the value of sample_write_ptr, before
+ * sending an acknowledgment to GuC. marker & version fields are for internal
+ * usage of GuC and opaque to i915. buffer_full_cnt field is incremented every
+ * time GuC detects the log buffer overflow.
+ */
+struct guc_log_buffer_state {
+	u32 marker[2];
+	u32 read_ptr;
+	u32 write_ptr;
+	u32 size;
+	u32 sampled_write_ptr;
+	u32 wrap_offset;
+	union {
+		struct {
+			u32 flush_to_file:1;
+			u32 buffer_full_cnt:4;
+			u32 reserved:27;
+		};
+		u32 flags;
+	};
+	u32 version;
+} __packed;
+
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum xe_guc_recv_message {
 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081..93d44d2d6ac8 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,9 +9,30 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
+#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
+#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
+
+struct guc_log_section {
+	u32 max;
+	u32 flag;
+	u32 default_val;
+	const char *name;
+};
+
+static struct xe_gt *
+guc_to_gt(struct xe_guc *guc)
+{
+	return container_of(guc, struct xe_gt, uc.guc);
+}
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -95,3 +116,161 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+
+static void _guc_log_init_sizes(struct xe_guc_log *log)
+{
+	struct xe_guc *guc = log_to_guc(log);
+	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
+		{
+			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
+			"crash dump"
+		},
+		{
+			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
+			"debug",
+		},
+		{
+			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
+			GUC_LOG_CAPTURE_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
+			"capture",
+		}
+	};
+	int i;
+
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
+		log->sizes[i].bytes = sections[i].default_val;
+
+	/* If debug size > 1MB then bump default crash size to keep the same units */
+	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
+	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
+		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
+
+	/* Prepare the GuC API structure fields: */
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
+		/* Convert to correct units */
+		if ((log->sizes[i].bytes % SZ_1M) == 0) {
+			log->sizes[i].units = SZ_1M;
+			log->sizes[i].flag = sections[i].flag;
+		} else {
+			log->sizes[i].units = SZ_4K;
+			log->sizes[i].flag = 0;
+		}
+
+		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
+			xe_gt_err(guc_to_gt(guc), "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
+				  sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
+		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
+
+		if (!log->sizes[i].count) {
+			xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
+		} else {
+			/* Size is +1 unit */
+			log->sizes[i].count--;
+		}
+
+		/* Clip to field size */
+		if (log->sizes[i].count > sections[i].max) {
+			xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
+				  sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
+			log->sizes[i].count = sections[i].max;
+		}
+	}
+
+	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
+		xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs %d!\n",
+			  log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+			  log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
+		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
+		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
+	}
+
+	log->sizes_initialised = true;
+}
+
+static void guc_log_init_sizes(struct xe_guc_log *log)
+{
+	if (log->sizes_initialised)
+		return;
+
+	_guc_log_init_sizes(log);
+}
+
+static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
+}
+
+static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
+}
+
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
+}
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
+				   unsigned int full_cnt)
+{
+	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
+	bool overflow = false;
+
+	if (full_cnt != prev_full_cnt) {
+		overflow = true;
+
+		log->stats[type].overflow = full_cnt;
+		log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
+
+		if (full_cnt < prev_full_cnt) {
+			/* buffer_full_cnt is a 4 bit counter */
+			log->stats[type].sampled_overflow += 16;
+		}
+		xe_gt_notice_ratelimited(log_to_gt(log), "log buffer overflow\n");
+	}
+
+	return overflow;
+}
+
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type)
+{
+	switch (type) {
+	case GUC_DEBUG_LOG_BUFFER:
+		return xe_guc_log_section_size_debug(log);
+	case GUC_CRASH_DUMP_LOG_BUFFER:
+		return xe_guc_log_section_size_crash(log);
+	case GUC_CAPTURE_LOG_BUFFER:
+		return xe_guc_log_section_size_capture(log);
+	default:
+		MISSING_CASE(type);
+	}
+
+	return 0;
+}
+
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type)
+{
+	enum guc_log_buffer_type i;
+	size_t offset = PAGE_SIZE;/* for the log_buffer_states */
+
+	for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
+		if (i == type)
+			break;
+		offset += xe_guc_get_log_buffer_size(log, i);
+	}
+
+	return offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..6a70185ce306 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_LOG_H_
 
 #include "xe_guc_log_types.h"
+#include "xe_guc_types.h"
 
 struct drm_printer;
 
@@ -36,6 +37,11 @@ struct drm_printer;
 #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
 #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
 
+static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
 
@@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
+				   enum guc_log_buffer_type type,
+				   unsigned int full_cnt);
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type);
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..0d9489ff69aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -6,7 +6,17 @@
 #ifndef _XE_GUC_LOG_TYPES_H_
 #define _XE_GUC_LOG_TYPES_H_
 
+#include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
+#include "xe_guc_fwif.h"
+
+enum {
+	GUC_LOG_SECTIONS_CRASH,
+	GUC_LOG_SECTIONS_DEBUG,
+	GUC_LOG_SECTIONS_CAPTURE,
+	GUC_LOG_SECTIONS_LIMIT
+};
 
 struct xe_bo;
 
@@ -18,6 +28,22 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+
+	/* Allocation settings */
+	struct {
+		s32 bytes;	/* Size in bytes */
+		s32 units;	/* GuC API units - 1MB or 4KB */
+		s32 count;	/* Number of API units */
+		u32 flag;	/* GuC API units flag */
+	} sizes[GUC_LOG_SECTIONS_LIMIT];
+	bool sizes_initialised;
+
+	/* logging related stats */
+	struct {
+		u32 sampled_overflow;
+		u32 overflow;
+		u32 flush;
+	} stats[GUC_MAX_LOG_BUFFER];
 };
 
 #endif
-- 
2.34.1

