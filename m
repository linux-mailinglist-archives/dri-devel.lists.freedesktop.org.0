Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A366675A3D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964F10EAAC;
	Fri, 20 Jan 2023 16:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660E510EAAC;
 Fri, 20 Jan 2023 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232893; x=1705768893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9MB3zjJZuPl6eTSb0o/zxh2hOkds/UGrCDypYzuaUs=;
 b=PMYPetDs8tGphXYUWrfX4zg09FosAX/ZH5jX8oHLHu6xt6WLFVqj7ItC
 1KsjpMv7MBbgNJUDO5O78uQodvqUn8+tD0B2S0zYh/biQ6tx6Mx2HeC6I
 d3mcHqOgnhTz7KupN0vo0R6uTip1jVzSlhHJRRRJYihEWh1yrhQelenjc
 suWQpdHcaL3yj75TIR1eU6g9/WBDOjCZCuEFpIXoXihsEJQRM4XRCQHSe
 IetHeyBCKAjpLrKO/lklXfp/DhSspVQHnsAOtYgL3fgR6H7OG6hXMX+yd
 Ot+ohUOPCSg4sg4C8ZSsS6NdvCxngIjTnZf0L4JMsXh03dIn3bShaGMnD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325656840"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="325656840"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749398901"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="749398901"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 08:41:32 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfi023485; Fri, 20 Jan 2023 16:41:31 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/guc: Update GT/GuC messages in intel_uc.c
Date: Fri, 20 Jan 2023 17:40:50 +0100
Message-Id: <20230120164050.1765-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 74 +++++++++++++--------------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 9a8a1abf71d7..e94f0d7119c4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -6,11 +6,13 @@
 #include <linux/string_helpers.h>
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_reset.h"
 #include "intel_gsc_fw.h"
 #include "intel_gsc_uc.h"
 #include "intel_guc.h"
 #include "intel_guc_ads.h"
+#include "intel_guc_print.h"
 #include "intel_guc_submission.h"
 #include "gt/intel_rps.h"
 #include "intel_uc.h"
@@ -67,14 +69,14 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
 
 	ret = intel_reset_guc(gt);
 	if (ret) {
-		DRM_ERROR("Failed to reset GuC, ret = %d\n", ret);
+		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
 		return ret;
 	}
 
 	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
-	WARN(!(guc_status & GS_MIA_IN_RESET),
-	     "GuC status: 0x%x, MIA core expected to be in reset\n",
-	     guc_status);
+	gt_WARN(gt, !(guc_status & GS_MIA_IN_RESET),
+		"GuC status: 0x%x, MIA core expected to be in reset\n",
+		guc_status);
 
 	return ret;
 }
@@ -252,15 +254,13 @@ static int guc_enable_communication(struct intel_guc *guc)
 	intel_guc_ct_event_handler(&guc->ct);
 	spin_unlock_irq(gt->irq_lock);
 
-	drm_dbg(&i915->drm, "GuC communication enabled\n");
+	guc_dbg(guc, "communication enabled\n");
 
 	return 0;
 }
 
 static void guc_disable_communication(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
-
 	/*
 	 * Events generated during or after CT disable are logged by guc in
 	 * via mmio. Make sure the register is clear before disabling CT since
@@ -280,11 +280,12 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_get_mmio_msg(guc);
 
-	drm_dbg(&i915->drm, "GuC communication disabled\n");
+	guc_dbg(guc, "communication disabled\n");
 }
 
 static void __uc_fetch_firmwares(struct intel_uc *uc)
 {
+	struct intel_gt *gt = uc_to_gt(uc);
 	int err;
 
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
@@ -293,15 +294,13 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
 	if (err) {
 		/* Make sure we transition out of transient "SELECTED" state */
 		if (intel_uc_wants_huc(uc)) {
-			drm_dbg(&uc_to_gt(uc)->i915->drm,
-				"Failed to fetch GuC: %d disabling HuC\n", err);
+			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling HuC\n", ERR_PTR(err));
 			intel_uc_fw_change_status(&uc->huc.fw,
 						  INTEL_UC_FIRMWARE_ERROR);
 		}
 
 		if (intel_uc_wants_gsc_uc(uc)) {
-			drm_dbg(&uc_to_gt(uc)->i915->drm,
-				"Failed to fetch GuC: %d disabling GSC\n", err);
+			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling GSC\n", ERR_PTR(err));
 			intel_uc_fw_change_status(&uc->gsc.fw,
 						  INTEL_UC_FIRMWARE_ERROR);
 		}
@@ -382,7 +381,7 @@ static int uc_init_wopcm(struct intel_uc *uc)
 	int err;
 
 	if (unlikely(!base || !size)) {
-		i915_probe_error(gt->i915, "Unsuccessful WOPCM partitioning\n");
+		gt_probe_error(gt, "Unsuccessful WOPCM partitioning\n");
 		return -E2BIG;
 	}
 
@@ -413,13 +412,13 @@ static int uc_init_wopcm(struct intel_uc *uc)
 	return 0;
 
 err_out:
-	i915_probe_error(gt->i915, "Failed to init uC WOPCM registers!\n");
-	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
-			 i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
-			 intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
-	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
-			 i915_mmio_reg_offset(GUC_WOPCM_SIZE),
-			 intel_uncore_read(uncore, GUC_WOPCM_SIZE));
+	gt_probe_error(gt, "Failed to init uC WOPCM registers!\n");
+	gt_probe_error(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
+		       i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
+		       intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
+	gt_probe_error(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
+		       i915_mmio_reg_offset(GUC_WOPCM_SIZE),
+		       intel_uncore_read(uncore, GUC_WOPCM_SIZE));
 
 	return err;
 }
@@ -451,18 +450,17 @@ static int __uc_check_hw(struct intel_uc *uc)
 
 static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
-
-	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
-		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.ver.major,
-		 fw->file_selected.ver.minor,
-		 fw->file_selected.ver.patch);
+	gt_info(uc_to_gt(uc), "%s firmware %s version %u.%u.%u\n",
+		intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
+		fw->file_selected.ver.major,
+		fw->file_selected.ver.minor,
+		fw->file_selected.ver.patch);
 }
 
 static int __uc_init_hw(struct intel_uc *uc)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
+	struct drm_i915_private *i915 = gt->i915;
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
 	int ret, attempts;
@@ -514,8 +512,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 		if (ret == 0)
 			break;
 
-		DRM_DEBUG_DRIVER("GuC fw load failed: %d; will reset and "
-				 "retry %d more time(s)\n", ret, attempts);
+		gt_dbg(gt, "GuC fw load failed (%pe) will reset and retry %d more time(s)\n",
+		       ERR_PTR(ret), attempts);
 	}
 
 	/* Did we succeded or run out of retries? */
@@ -551,10 +549,10 @@ static int __uc_init_hw(struct intel_uc *uc)
 
 	intel_gsc_uc_load_start(&uc->gsc);
 
-	drm_info(&i915->drm, "GuC submission %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
-	drm_info(&i915->drm, "GuC SLPC %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
+	gt_info(gt, "GuC submission %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
+	gt_info(gt, "GuC SLPC %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
 	return 0;
 
@@ -572,12 +570,12 @@ static int __uc_init_hw(struct intel_uc *uc)
 	__uc_sanitize(uc);
 
 	if (!ret) {
-		drm_notice(&i915->drm, "GuC is uninitialized\n");
+		gt_notice(gt, "GuC is uninitialized\n");
 		/* We want to run without GuC submission */
 		return 0;
 	}
 
-	i915_probe_error(i915, "GuC initialization failed %d\n", ret);
+	gt_probe_error(gt, "GuC initialization failed %pe\n", ERR_PTR(ret));
 
 	/* We want to keep KMS alive */
 	return -EIO;
@@ -690,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
 	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
 		if (err)
-			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
+			gt_dbg(uc_to_gt(uc), "Failed to suspend GuC, %pe", ERR_PTR(err));
 	}
 }
 
@@ -718,7 +716,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 
 	err = intel_guc_resume(guc);
 	if (err) {
-		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
+		gt_dbg(gt, "Failed to resume GuC, %pe", ERR_PTR(err));
 		return err;
 	}
 
-- 
2.25.1

