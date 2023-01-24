Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C97679FB3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AD510E6E6;
	Tue, 24 Jan 2023 17:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A0510E6D4;
 Tue, 24 Jan 2023 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674579993; x=1706115993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QX7TH5iaheFBBljVoBEhMQIZLKT5aiWcHnjrxWpPJCQ=;
 b=IsAWdiHSC9DMt7KcyRGJvSl0Irtlaey9udeDiaBoosCMkzSR2GBgJ38B
 8EAuhSwyCquRw11vf/MbgF7rGg5NA5L+xk21fh86R5VlPGMyLsebZbx/K
 afaMmrEzOab9oc2u3hCnPaGiZIMYw/Ay7CL16H3mnkgt/EgMxHkN6YpWq
 3Rh/VTAXznCLbMWBHXeNn8h7FfSBYM9/n6hf4aqJwje7UbDUuw8OvWxuN
 0QeDGsapAK60qabKoFwWWRmfgZMsYNuqUSkiS253bBJUN60YvhHKr0SNV
 ZKotnozWU64iZDAWRa6Nsa1tZA1/c1CEOMiUBTHT8qw6l8GaK80v0/ap0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306007412"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306007412"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750895806"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750895806"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 09:05:26 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 547FF37E26;
 Tue, 24 Jan 2023 17:05:26 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/i915/guc: Update GT/GuC messages in intel_uc.c
Date: Tue, 24 Jan 2023 18:05:22 +0100
Message-Id: <20230124170522.1808-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230124170522.1808-1-michal.wajdeczko@intel.com>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

v2: pass gt to print_fw_ver

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 80 +++++++++++++--------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 9a8a1abf71d7..a750966ddcab 100644
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
@@ -449,20 +448,19 @@ static int __uc_check_hw(struct intel_uc *uc)
 	return 0;
 }
 
-static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
+static void print_fw_ver(struct intel_gt *gt, struct intel_uc_fw *fw)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
-
-	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
-		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.ver.major,
-		 fw->file_selected.ver.minor,
-		 fw->file_selected.ver.patch);
+	gt_info(gt, "%s firmware %s version %u.%u.%u\n",
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
@@ -470,10 +468,10 @@ static int __uc_init_hw(struct intel_uc *uc)
 	GEM_BUG_ON(!intel_uc_supports_guc(uc));
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
 
-	print_fw_ver(uc, &guc->fw);
+	print_fw_ver(gt, &guc->fw);
 
 	if (intel_uc_uses_huc(uc))
-		print_fw_ver(uc, &huc->fw);
+		print_fw_ver(gt, &huc->fw);
 
 	if (!intel_uc_fw_is_loadable(&guc->fw)) {
 		ret = __uc_check_hw(uc) ||
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

