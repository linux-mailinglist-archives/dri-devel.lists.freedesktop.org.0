Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97B3C2C67
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 03:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE35E6EAB7;
	Sat, 10 Jul 2021 01:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F656EAB5;
 Sat, 10 Jul 2021 01:23:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="209842220"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="209842220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439832"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:23:05 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/16] drm/i915/guc/slpc: Adding slpc communication interfaces
Date: Fri,  9 Jul 2021 18:20:15 -0700
Message-Id: <20210710012026.19705-6-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replicate the SLPC header file in GuC for the most part. There are
some SLPC mode based parameters which haven't been included since
we are not using them.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h  | 255 ++++++++++++++++++
 4 files changed, 263 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index b9a809f2d221..9d61b2d54de4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -202,11 +202,15 @@ static u32 guc_ctl_debug_flags(struct intel_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
 	u32 flags = 0;
 
 	if (!intel_guc_submission_is_used(guc))
 		flags |= GUC_CTL_DISABLE_SCHEDULER;
 
+	if (intel_uc_uses_guc_slpc(&gt->uc))
+		flags |= GUC_CTL_ENABLE_SLPC;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 94bb1ca6f889..19e2504d7a36 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -114,6 +114,8 @@
 #define   GUC_ADS_ADDR_SHIFT		1
 #define   GUC_ADS_ADDR_MASK		(0xFFFFF << GUC_ADS_ADDR_SHIFT)
 
+#define GUC_CTL_ENABLE_SLPC            BIT(2)
+
 #define GUC_CTL_MAX_DWORDS		(SOFT_SCRATCH_COUNT - 2) /* [1..14] */
 
 /* Generic GT SysInfo data types */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 74fd86769163..98036459a1a3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -6,6 +6,8 @@
 #ifndef _INTEL_GUC_SLPC_H_
 #define _INTEL_GUC_SLPC_H_
 
+#include "intel_guc_slpc_fwif.h"
+
 struct intel_guc_slpc {
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h
new file mode 100644
index 000000000000..2a5e71428374
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_fwif.h
@@ -0,0 +1,255 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2020 Intel Corporation
+ */
+#ifndef _INTEL_GUC_SLPC_FWIF_H_
+#define _INTEL_GUC_SLPC_FWIF_H_
+
+#include <linux/types.h>
+
+/* This file replicates the header in GuC code for handling SLPC related
+ * data structures and sizes
+ */
+
+/* SLPC exposes certain parameters for global configuration by the host.
+ * These are referred to as override parameters, because in most cases
+ * the host will not need to modify the default values used by SLPC.
+ * SLPC remembers the default values which allows the host to easily restore
+ * them by simply unsetting the override. The host can set or unset override
+ * parameters during SLPC (re-)initialization using the SLPC Reset event.
+ * The host can also set or unset override parameters on the fly using the
+ * Parameter Set and Parameter Unset events
+ */
+#define SLPC_MAX_OVERRIDE_PARAMETERS	256
+#define SLPC_OVERRIDE_BITFIELD_SIZE \
+		(SLPC_MAX_OVERRIDE_PARAMETERS / 32)
+
+#define SLPC_PAGE_SIZE_BYTES			4096
+#define SLPC_CACHELINE_SIZE_BYTES		64
+#define SLPC_SHARE_DATA_SIZE_BYTE_HEADER	SLPC_CACHELINE_SIZE_BYTES
+#define SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO	SLPC_CACHELINE_SIZE_BYTES
+#define SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE	SLPC_CACHELINE_SIZE_BYTES
+#define SLPC_SHARE_DATA_MODE_DEFN_TABLE_SIZE	SLPC_PAGE_SIZE_BYTES
+
+#define SLPC_SHARE_DATA_SIZE_BYTE_MAX		(2 * SLPC_PAGE_SIZE_BYTES)
+
+/* Cacheline size aligned (Total size needed for
+ * SLPM_KMD_MAX_OVERRIDE_PARAMETERS=256 is 1088 bytes)
+ */
+#define SLPC_SHARE_DATA_SIZE_BYTE_PARAM		(((((SLPC_MAX_OVERRIDE_PARAMETERS * 4) \
+						+ ((SLPC_MAX_OVERRIDE_PARAMETERS / 32) * 4)) \
+		+ (SLPC_CACHELINE_SIZE_BYTES-1)) / SLPC_CACHELINE_SIZE_BYTES)*SLPC_CACHELINE_SIZE_BYTES)
+
+#define SLPC_SHARE_DATA_SIZE_BYTE_OTHER		(SLPC_SHARE_DATA_SIZE_BYTE_MAX - \
+					(SLPC_SHARE_DATA_SIZE_BYTE_HEADER \
+					+ SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO \
+					+ SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE \
+					+ SLPC_SHARE_DATA_SIZE_BYTE_PARAM \
+					+ SLPC_SHARE_DATA_MODE_DEFN_TABLE_SIZE))
+
+#define SLPC_EVENT(id, argc)			((u32)(id) << 8 | (argc))
+
+#define SLPC_PARAM_TASK_DEFAULT			0
+#define SLPC_PARAM_TASK_ENABLED			1
+#define SLPC_PARAM_TASK_DISABLED		2
+#define SLPC_PARAM_TASK_UNKNOWN			3
+
+enum slpc_status {
+	SLPC_STATUS_OK = 0,
+	SLPC_STATUS_ERROR = 1,
+	SLPC_STATUS_ILLEGAL_COMMAND = 2,
+	SLPC_STATUS_INVALID_ARGS = 3,
+	SLPC_STATUS_INVALID_PARAMS = 4,
+	SLPC_STATUS_INVALID_DATA = 5,
+	SLPC_STATUS_OUT_OF_RANGE = 6,
+	SLPC_STATUS_NOT_SUPPORTED = 7,
+	SLPC_STATUS_NOT_IMPLEMENTED = 8,
+	SLPC_STATUS_NO_DATA = 9,
+	SLPC_STATUS_EVENT_NOT_REGISTERED = 10,
+	SLPC_STATUS_REGISTER_LOCKED = 11,
+	SLPC_STATUS_TEMPORARILY_UNAVAILABLE = 12,
+	SLPC_STATUS_VALUE_ALREADY_SET = 13,
+	SLPC_STATUS_VALUE_ALREADY_UNSET = 14,
+	SLPC_STATUS_VALUE_NOT_CHANGED = 15,
+	SLPC_STATUS_MEMIO_ERROR = 16,
+	SLPC_STATUS_EVENT_QUEUED_REQ_DPC = 17,
+	SLPC_STATUS_EVENT_QUEUED_NOREQ_DPC = 18,
+	SLPC_STATUS_NO_EVENT_QUEUED = 19,
+	SLPC_STATUS_OUT_OF_SPACE = 20,
+	SLPC_STATUS_TIMEOUT = 21,
+	SLPC_STATUS_NO_LOCK = 22,
+	SLPC_STATUS_MAX
+};
+
+enum slpc_event_id {
+	SLPC_EVENT_RESET = 0,
+	SLPC_EVENT_SHUTDOWN = 1,
+	SLPC_EVENT_PLATFORM_INFO_CHANGE = 2,
+	SLPC_EVENT_DISPLAY_MODE_CHANGE = 3,
+	SLPC_EVENT_FLIP_COMPLETE = 4,
+	SLPC_EVENT_QUERY_TASK_STATE = 5,
+	SLPC_EVENT_PARAMETER_SET = 6,
+	SLPC_EVENT_PARAMETER_UNSET = 7,
+};
+
+enum slpc_param_id {
+	SLPC_PARAM_TASK_ENABLE_GTPERF = 0,
+	SLPC_PARAM_TASK_DISABLE_GTPERF = 1,
+	SLPC_PARAM_TASK_ENABLE_BALANCER = 2,
+	SLPC_PARAM_TASK_DISABLE_BALANCER = 3,
+	SLPC_PARAM_TASK_ENABLE_DCC = 4,
+	SLPC_PARAM_TASK_DISABLE_DCC = 5,
+	SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ = 6,
+	SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ = 7,
+	SLPC_PARAM_GLOBAL_MIN_GT_SLICE_FREQ_MHZ = 8,
+	SLPC_PARAM_GLOBAL_MAX_GT_SLICE_FREQ_MHZ = 9,
+	SLPC_PARAM_GTPERF_THRESHOLD_MAX_FPS = 10,
+	SLPC_PARAM_GLOBAL_DISABLE_GT_FREQ_MANAGEMENT = 11,
+	SLPC_PARAM_GTPERF_ENABLE_FRAMERATE_STALLING = 12,
+	SLPC_PARAM_GLOBAL_DISABLE_RC6_MODE_CHANGE = 13,
+	SLPC_PARAM_GLOBAL_OC_UNSLICE_FREQ_MHZ = 14,
+	SLPC_PARAM_GLOBAL_OC_SLICE_FREQ_MHZ = 15,
+	SLPC_PARAM_GLOBAL_ENABLE_IA_GT_BALANCING = 16,
+	SLPC_PARAM_GLOBAL_ENABLE_ADAPTIVE_BURST_TURBO = 17,
+	SLPC_PARAM_GLOBAL_ENABLE_EVAL_MODE = 18,
+	SLPC_PARAM_GLOBAL_ENABLE_BALANCER_IN_NON_GAMING_MODE = 19,
+	SLPC_PARAM_GLOBAL_RT_MODE_TURBO_FREQ_DELTA_MHZ = 20,
+	SLPC_PARAM_PWRGATE_RC_MODE = 21,
+	SLPC_PARAM_EDR_MODE_COMPUTE_TIMEOUT_MS = 22,
+	SLPC_PARAM_EDR_QOS_FREQ_MHZ = 23,
+	SLPC_PARAM_MEDIA_FF_RATIO_MODE = 24,
+	SLPC_PARAM_ENABLE_IA_FREQ_LIMITING = 25,
+	SLPC_PARAM_STRATEGIES = 26,
+	SLPC_PARAM_POWER_PROFILE = 27,
+	SLPC_IGNORE_EFFICIENT_FREQUENCY = 28,
+	SLPC_MAX_PARAM = 32,
+};
+
+enum slpc_global_state {
+	SLPC_GLOBAL_STATE_NOT_RUNNING = 0,
+	SLPC_GLOBAL_STATE_INITIALIZING = 1,
+	SLPC_GLOBAL_STATE_RESETTING = 2,
+	SLPC_GLOBAL_STATE_RUNNING = 3,
+	SLPC_GLOBAL_STATE_SHUTTING_DOWN = 4,
+	SLPC_GLOBAL_STATE_ERROR = 5
+};
+
+enum slpc_platform_sku {
+	SLPC_PLATFORM_SKU_UNDEFINED = 0,
+	SLPC_PLATFORM_SKU_ULX = 1,
+	SLPC_PLATFORM_SKU_ULT = 2,
+	SLPC_PLATFORM_SKU_T = 3,
+	SLPC_PLATFORM_SKU_MOBL = 4,
+	SLPC_PLATFORM_SKU_DT = 5,
+	SLPC_PLATFORM_SKU_UNKNOWN = 6,
+};
+
+struct slpc_platform_info {
+	union {
+		u32 sku;  /**< SKU info */
+		struct {
+			u32 reserved:8;
+			u32 fused_slice_count:8;
+			u32 reserved1:16;
+		};
+	};
+        union
+	{
+		u32 bitfield2;       /**< IA capability info*/
+		struct {
+			u32 max_p0_freq_bins:8;
+			u32 p1_freq_bins:8;
+			u32 pe_freq_bins:8;
+			u32 pn_freq_bins:8;
+		};
+	};
+	u32 reserved2[2];
+} __packed;
+
+struct slpc_task_state_data {
+	union {
+		u32 bitfield1;
+		struct {
+			u32 gtperf_task_active:1;
+			u32 gtperf_stall_possible:1;
+			u32 gtperf_gaming_mode:1;
+			u32 gtperf_target_fps:8;
+			u32 dcc_task_active:1;
+			u32 in_dcc:1;
+			u32 in_dct:1;
+			u32 freq_switch_active:1;
+			u32 ibc_enabled:1;
+			u32 ibc_active:1;
+			u32 pg1_enabled:1;
+			u32 pg1_active:1;
+		};
+	};
+	union {
+		u32 bitfield2;
+		struct {
+			u32 max_unslice_freq:8;
+			u32 min_unslice_freq:8;
+			u32 max_slice_freq:8;
+			u32 min_slice_freq:8;
+		};
+	};
+} __packed;
+
+struct slpc_shared_data {
+	union {
+		struct {
+			/* Total size in bytes of this buffer. */
+			u32 shared_data_size;
+			u32 global_state;
+			u32 display_data_addr;
+		};
+		unsigned char reserved_header[SLPC_SHARE_DATA_SIZE_BYTE_HEADER];
+	};
+
+	union {
+		struct slpc_platform_info platform_info;
+		unsigned char reserved_platform[SLPC_SHARE_DATA_SIZE_BYTE_PLATFORM_INFO];
+	};
+
+	union {
+		struct slpc_task_state_data task_state_data;
+		unsigned char reserved_task_state[SLPC_SHARE_DATA_SIZE_BYTE_TASK_STATE];
+	};
+
+	union {
+		struct {
+		u32 override_params_set_bits[SLPC_OVERRIDE_BITFIELD_SIZE];
+		u32 override_params_values[SLPC_MAX_OVERRIDE_PARAMETERS];
+		};
+		unsigned char reserved_override_parameter[SLPC_SHARE_DATA_SIZE_BYTE_PARAM];
+	};
+
+	unsigned char reserved_other[SLPC_SHARE_DATA_SIZE_BYTE_OTHER];
+
+	/* PAGE 2 (4096 bytes), mode based parameter will be removed soon */
+	unsigned char reserved_mode_definition[4096];
+} __packed;
+
+enum slpc_reset_flags {
+	SLPC_RESET_FLAG_TDR_OCCURRED = (1 << 0)
+};
+
+#define SLPC_EVENT_MAX_INPUT_ARGS  9
+#define SLPC_EVENT_MAX_OUTPUT_ARGS 1
+
+union slpc_event_input_header {
+	u32 value;
+	struct {
+		u32 num_args:8;
+		u32 event_id:8;
+	};
+};
+
+struct slpc_event_input {
+	u32 h2g_action_id;
+	union slpc_event_input_header header;
+	u32 args[SLPC_EVENT_MAX_INPUT_ARGS];
+} __packed;
+
+#endif
-- 
2.25.0

