Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BE940D095
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 02:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B536EA7F;
	Thu, 16 Sep 2021 00:06:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC826EA7D;
 Thu, 16 Sep 2021 00:06:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222507675"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="222507675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 17:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="610393329"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2021 17:06:20 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/i915/guc: Add fetch of hwconfig table
Date: Wed, 15 Sep 2021 17:06:19 -0700
Message-Id: <20210916000620.2588179-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916000620.2588179-1-John.C.Harrison@Intel.com>
References: <20210916000620.2588179-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Implement support for fetching the hardware description table from the
GuC. The call is made twice - once without a destination buffer to
query the size and then a second time to fill in the buffer.

Note that the table is only available on ADL-P and later platforms.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 156 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 8 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c1e9f7369fb5..3789f03a1021 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -190,6 +190,7 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_guc_rc.o \
 	  gt/uc/intel_guc_slpc.o \
 	  gt/uc/intel_guc_submission.o \
+	  gt/uc/intel_guc_hwconfig.o \
 	  gt/uc/intel_huc.o \
 	  gt/uc/intel_huc_debugfs.o \
 	  gt/uc/intel_huc_fw.o
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 8ff582222aff..72fd492b726a 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -137,6 +137,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
 	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
+	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index 488b6061ee89..f9e2a6aaef4a 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -8,6 +8,10 @@
 
 enum intel_guc_response_status {
 	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
+	INTEL_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
+	INTEL_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
+	INTEL_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
+	INTEL_GUC_RESPONSE_DECRYPTION_FAILED = 0x204,
 	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index fbfcae727d7f..82c0ce0090c6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -422,13 +422,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	/*
 	 * No GuC command should ever take longer than 10ms.
 	 * Fast commands should still complete in 10us.
+	 * Except for the hwconfig table query, which takes ~50ms.
 	 */
 	ret = __intel_wait_for_register_fw(uncore,
 					   guc_send_reg(guc, 0),
 					   GUC_HXG_MSG_0_ORIGIN,
 					   FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
 						      GUC_HXG_ORIGIN_GUC),
-					   10, 10, &header);
+					   10, 100, &header);
 	if (unlikely(ret)) {
 timeout:
 		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 5dd174babf7a..ec38a69ca3fe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -13,6 +13,7 @@
 #include "intel_guc_fw.h"
 #include "intel_guc_fwif.h"
 #include "intel_guc_ct.h"
+#include "intel_guc_hwconfig.h"
 #include "intel_guc_log.h"
 #include "intel_guc_reg.h"
 #include "intel_guc_slpc_types.h"
@@ -37,6 +38,7 @@ struct intel_guc {
 	struct intel_guc_ct ct;
 	/** @slpc: sub-structure containing SLPC related data and objects */
 	struct intel_guc_slpc slpc;
+	struct intel_guc_hwconfig hwconfig;
 
 	/** @sched_engine: Global engine used to submit requests to GuC */
 	struct i915_sched_engine *sched_engine;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
new file mode 100644
index 000000000000..af4fc9fdbaaf
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "gt/intel_gt.h"
+#include "i915_drv.h"
+#include "i915_memcpy.h"
+#include "intel_guc_hwconfig.h"
+
+static inline struct intel_guc *hwconfig_to_guc(struct intel_guc_hwconfig *hwconfig)
+{
+	return container_of(hwconfig, struct intel_guc, hwconfig);
+}
+
+/*
+ * GuC has a blob containing hardware configuration information (HWConfig).
+ * This is formatted as a simple and flexible KLV (Key/Length/Value) table.
+ *
+ * For example, a minimal version could be:
+ *   enum device_attr {
+ *     ATTR_SOME_VALUE = 0,
+ *     ATTR_SOME_MASK  = 1,
+ *   };
+ *
+ *   static const u32 hwconfig[] = {
+ *     ATTR_SOME_VALUE,
+ *     1,		// Value Length in DWords
+ *     8,		// Value
+ *
+ *     ATTR_SOME_MASK,
+ *     3,
+ *     0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
+ *   };
+ *
+ * The attribute ids are defined in a hardware spec.
+ */
+
+static int __guc_action_get_hwconfig(struct intel_guc_hwconfig *hwconfig,
+				     u32 ggtt_offset, u32 ggtt_size)
+{
+	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	u32 action[] = {
+		INTEL_GUC_ACTION_GET_HWCONFIG,
+		ggtt_offset,
+		ggtt_size,
+		(INTEL_DEVID(i915) << 16) | INTEL_REVID(i915),
+	};
+	int ret;
+
+	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
+	if (ret == -ENXIO)
+		return -ENOENT;
+
+	if (!ggtt_size && !ret)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
+{
+	int ret;
+
+	/* Sending a query with too small a table will return the size of the table */
+	ret = __guc_action_get_hwconfig(hwconfig, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	hwconfig->size = ret;
+	return 0;
+}
+
+static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
+{
+	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct i915_vma *vma;
+	u32 ggtt_offset;
+	void *vaddr;
+	int ret;
+
+	GEM_BUG_ON(!hwconfig->size);
+
+	ret = intel_guc_allocate_and_map_vma(guc, hwconfig->size, &vma, &vaddr);
+	if (ret)
+		return ret;
+
+	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
+
+	ret = __guc_action_get_hwconfig(hwconfig, ggtt_offset, hwconfig->size);
+	if (ret >= 0)
+		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
+
+	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
+
+	return ret;
+}
+
+static bool has_table(struct drm_i915_private *i915)
+{
+	if (IS_ALDERLAKE_P(i915)) {
+		if (IS_ADLP_GT_STEP(i915, STEP_A0, STEP_A0))
+			return false;
+
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * intel_guc_hwconfig_fini - Finalize the HWConfig
+ *
+ * Free up the memory allocation holding the table.
+ */
+void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig)
+{
+	kfree(hwconfig->ptr);
+	hwconfig->size = 0;
+	hwconfig->ptr = NULL;
+}
+
+/**
+ * intel_guc_hwconfig_init - Initialize the HWConfig
+ *
+ * Retrieve the HWConfig table from the GuC and save it away in a local memory
+ * allocation. It can then be queried on demand by other users later on.
+ */
+int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
+{
+	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	int ret;
+
+	if (!has_table(i915))
+		return 0;
+
+	ret = guc_hwconfig_discover_size(hwconfig);
+	if (ret)
+		return ret;
+
+	hwconfig->ptr = kmalloc(hwconfig->size, GFP_KERNEL);
+	if (!hwconfig->ptr) {
+		hwconfig->size = 0;
+		return -ENOMEM;
+	}
+
+	ret = guc_hwconfig_fill_buffer(hwconfig);
+	if (ret < 0) {
+		intel_guc_hwconfig_fini(hwconfig);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
new file mode 100644
index 000000000000..fdd7f0d6e938
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_HWCONFIG_H_
+#define _INTEL_GUC_HWCONFIG_H_
+
+#include <linux/types.h>
+
+struct intel_guc_hwconfig {
+	u32 size;
+	void *ptr;
+};
+
+int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig);
+void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig);
+
+#endif /* _INTEL_GUC_HWCONFIG_H_ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 86c318516e14..44c4adf58609 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -486,6 +486,10 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (ret)
 		goto err_log_capture;
 
+	ret = intel_guc_hwconfig_init(&guc->hwconfig);
+	if (ret)
+		drm_err(&i915->drm, "Failed to retrieve hwconfig table: %d\n", ret);
+
 	ret = guc_enable_communication(guc);
 	if (ret)
 		goto err_log_capture;
@@ -553,6 +557,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
 	if (intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_disable(guc);
 
+	intel_guc_hwconfig_fini(&guc->hwconfig);
+
 	__uc_sanitize(uc);
 }
 
-- 
2.25.1

