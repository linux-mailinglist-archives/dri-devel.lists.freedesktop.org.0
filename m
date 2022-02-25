Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE74C3BB1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 03:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D41D10E74B;
	Fri, 25 Feb 2022 02:24:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2726F10E748;
 Fri, 25 Feb 2022 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645755880; x=1677291880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yQzRlC2bbyH3FwHj+fqjTfBwQ8H3gL+RXkchbtXPQy4=;
 b=i6bithCo7hadbcBL1+0hge20RvUYDR6jh3oaW5uiFRfwLn4ngw6C1l+Q
 6Qpwf2/qddcYl5VdPJAjzSNDbBlMKY44Fp+YcB25U0+27UPxNpDJzkVye
 xQWeT3V6CCtKJR9npCRnJ0ho9A2nmM+he4vdkLNqiM/gxTeO4Wsvt46r0
 Zxe9hgRtBLOUuia493ilavPgSiRiksJ7a6WOEsNEsompTh5BiEV7zeXaT
 NGlUauLYAsbyw8+e04xGGk+RIVXTOKQEz7pEn+M6gT/UdnIThHRaHHKJE
 lc3iN2iiBcQk7lQXnISAJzG3TOTB5Ci4GI2xzIi1D+8puLrHp1jTNKIda Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252595949"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252595949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="506546213"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 24 Feb 2022 18:24:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Add fetch of hwconfig table
Date: Thu, 24 Feb 2022 18:24:39 -0800
Message-Id: <20220225022439.1941865-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
References: <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Implement support for fetching the hardware description table from the
GuC. The call is made twice - once without a destination buffer to
query the size and then a second time to fill in the buffer.

The table is stored in the GT structure so that it can be fetched once
at driver load time. Keeping inside a GuC structure would mean it
would be release and reloaded on a GuC reset (part of a full GT
reset). However, the table does not change just because the GT has been
reset and the GuC reloaded. Also, dynamic memory allocations inside
the reset path are a problem.

Note that the table is only available on ADL-P and later platforms.

v2: Move to GT level to avoid memory allocation during reset path (and
unnecessary re-read of the table on a reset).

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> (v1)

Mush: hwconf
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   4 +
 drivers/gpu/drm/i915/gt/intel_hwconfig.h      |  21 +++
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 160 ++++++++++++++++++
 7 files changed, 197 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 713f59a88312..8da4a1fe8b36 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -193,6 +193,7 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_guc_rc.o \
 	  gt/uc/intel_guc_slpc.o \
 	  gt/uc/intel_guc_submission.o \
+	  gt/uc/intel_guc_hwconfig.o \
 	  gt/uc/intel_huc.o \
 	  gt/uc/intel_huc_debugfs.o \
 	  gt/uc/intel_huc_fw.o
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e6f6bf7c3926..2ad55d7ffe53 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -711,6 +711,11 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		goto err_uc_init;
 
+	/* Table failure is bad but not currently fatal */
+	err = intel_gt_init_hwconfig(gt);
+	if (err)
+		drm_err(&gt->i915->drm, "Failed to retrieve hwconfig table: %d\n", err);
+
 	err = __engines_record_defaults(gt);
 	if (err)
 		goto err_gt;
@@ -792,6 +797,7 @@ void intel_gt_driver_release(struct intel_gt *gt)
 	intel_gt_pm_fini(gt);
 	intel_gt_fini_scratch(gt);
 	intel_gt_fini_buffer_pool(gt);
+	intel_gt_fini_hwconfig(gt);
 }
 
 void intel_gt_driver_late_release(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f20687796490..514b92cff9b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -20,6 +20,7 @@
 #include "i915_vma.h"
 #include "intel_engine_types.h"
 #include "intel_gt_buffer_pool_types.h"
+#include "intel_hwconfig.h"
 #include "intel_llc_types.h"
 #include "intel_reset_types.h"
 #include "intel_rc6_types.h"
@@ -199,6 +200,9 @@ struct intel_gt {
 		struct sseu_dev_info sseu;
 
 		unsigned long mslice_mask;
+
+		/** @hwconfig: hardware configuration data */
+		struct intel_hwconfig hwconfig;
 	} info;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gt/intel_hwconfig.h b/drivers/gpu/drm/i915/gt/intel_hwconfig.h
new file mode 100644
index 000000000000..322290780b67
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_hwconfig.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _INTEL_HWCONFIG_H_
+#define _INTEL_HWCONFIG_H_
+
+#include <linux/types.h>
+
+struct intel_gt;
+
+struct intel_hwconfig {
+	u32 size;
+	void *ptr;
+};
+
+int intel_gt_init_hwconfig(struct intel_gt *gt);
+void intel_gt_fini_hwconfig(struct intel_gt *gt);
+
+#endif /* _INTEL_HWCONFIG_H_ */
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 7afdadc7656f..a9a329e53c35 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -129,6 +129,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
 	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
+	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index c20658ee85a5..8085fb181274 100644
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
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
new file mode 100644
index 000000000000..d2dcd1e538ce
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "gt/intel_gt.h"
+#include "gt/intel_hwconfig.h"
+#include "i915_drv.h"
+#include "i915_memcpy.h"
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
+static int __guc_action_get_hwconfig(struct intel_guc *guc,
+				     struct intel_hwconfig *hwconfig,
+				     u32 ggtt_offset, u32 ggtt_size)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_GET_HWCONFIG,
+		ggtt_offset,
+		0, /* upper 32 bits of address */
+		ggtt_size,
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
+static int guc_hwconfig_discover_size(struct intel_guc *guc, struct intel_hwconfig *hwconfig)
+{
+	int ret;
+
+	/* Sending a query with zero offset/size will return the size of the table */
+	ret = __guc_action_get_hwconfig(guc, hwconfig, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	hwconfig->size = ret;
+	return 0;
+}
+
+static int guc_hwconfig_fill_buffer(struct intel_guc *guc, struct intel_hwconfig *hwconfig)
+{
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
+	ret = __guc_action_get_hwconfig(guc, hwconfig, ggtt_offset, hwconfig->size);
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
+	if (IS_ALDERLAKE_P(i915))
+		return true;
+
+	return false;
+}
+
+/**
+ * intel_guc_hwconfig_init - Initialize the HWConfig
+ *
+ * Retrieve the HWConfig table from the GuC and save it away in a local memory
+ * allocation. It can then be queried on demand by other users later on.
+ */
+static int guc_hwconfig_init(struct intel_gt *gt)
+{
+	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
+	struct intel_guc *guc = &gt->uc.guc;
+	int ret;
+
+	if (!has_table(gt->i915))
+		return 0;
+
+	ret = guc_hwconfig_discover_size(guc, hwconfig);
+	if (ret)
+		return ret;
+
+	hwconfig->ptr = kmalloc(hwconfig->size, GFP_KERNEL);
+	if (!hwconfig->ptr) {
+		hwconfig->size = 0;
+		return -ENOMEM;
+	}
+
+	ret = guc_hwconfig_fill_buffer(guc, hwconfig);
+	if (ret < 0) {
+		intel_gt_fini_hwconfig(gt);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * intel_gt_init_hwconfig - Initialize the HWConfig if available
+ *
+ * Retrieve the HWConfig table if available on the current platform.
+ */
+int intel_gt_init_hwconfig(struct intel_gt *gt)
+{
+	if (!intel_uc_uses_guc(&gt->uc))
+		return 0;
+
+	return guc_hwconfig_init(gt);
+}
+
+/**
+ * intel_gt_fini_hwconfig - Finalize the HWConfig
+ *
+ * Free up the memory allocation holding the table.
+ */
+void intel_gt_fini_hwconfig(struct intel_gt *gt)
+{
+	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
+
+	kfree(hwconfig->ptr);
+	hwconfig->size = 0;
+	hwconfig->ptr = NULL;
+}
-- 
2.25.1

