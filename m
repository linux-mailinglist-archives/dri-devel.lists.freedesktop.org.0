Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E8636A19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03DD10E605;
	Wed, 23 Nov 2022 19:51:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EFC10E244;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233090; x=1700769090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p4MNiZehm/0ffJM6pvn+/HcOltc7aqw6d6KNYxMlRmU=;
 b=kp8jB2Hvxcc4ceH3l12VhSobejtPw/cWyJcBQUK3gkgVfABV3a6GPROU
 6otJ9MPOzq49ml0Rv3p9mWrd0ouE9Gc14dNo9kw255lftUUmKWe3zKxut
 tZTOFeBz1ckU9wDXAdnJrbVRLKmBqZ6ooQmtt1e5ckVC/nr4pYzOy0KtS
 JFl0qFbLgeZ50YiGh3mQ/3QzXdaHJE719hESmrUdtJXhEeRv915VtBfLL
 RPtXY75E6Fl/Es1g+rmH6JnStYGgjylkKIoZZu8OuvjDOJlUUvrKup4kD
 k0Ss7J51AIAj1OLzfsdrliHX/s1qT8tG2p3ggj5zs3UEX0J7d+ZvBoXpD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="301709234"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="301709234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597806"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597806"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:29 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 5/5] drm/i915/uc: Update the gt/uc code to use gt_err and
 friends
Date: Wed, 23 Nov 2022 11:51:23 -0800
Message-Id: <20221123195123.1525100-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
References: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Use the new module oriented output message helpers where possible.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c    | 110 +++++++++++------------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c |  99 ++++++++++----------
 2 files changed, 102 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 1d28286e6f066..f56fa0ff0f969 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -6,9 +6,11 @@
 #include <linux/string_helpers.h>
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_reset.h"
 #include "intel_guc.h"
 #include "intel_guc_ads.h"
+#include "intel_guc_print.h"
 #include "intel_guc_submission.h"
 #include "gt/intel_rps.h"
 #include "intel_uc.h"
@@ -65,29 +67,29 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
 
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
 
 static void __confirm_options(struct intel_uc *uc)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
+	struct drm_i915_private *i915 = gt->i915;
 
-	drm_dbg(&i915->drm,
-		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
-		i915->params.enable_guc,
-		str_yes_no(intel_uc_wants_guc(uc)),
-		str_yes_no(intel_uc_wants_guc_submission(uc)),
-		str_yes_no(intel_uc_wants_huc(uc)),
-		str_yes_no(intel_uc_wants_guc_slpc(uc)));
+	gt_dbg(gt, "enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
+	       i915->params.enable_guc,
+	       str_yes_no(intel_uc_wants_guc(uc)),
+	       str_yes_no(intel_uc_wants_guc_submission(uc)),
+	       str_yes_no(intel_uc_wants_huc(uc)),
+	       str_yes_no(intel_uc_wants_guc_slpc(uc)));
 
 	if (i915->params.enable_guc == 0) {
 		GEM_BUG_ON(intel_uc_wants_guc(uc));
@@ -98,26 +100,22 @@ static void __confirm_options(struct intel_uc *uc)
 	}
 
 	if (!intel_uc_supports_guc(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "GuC is not supported!");
+		gt_info(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "GuC is not supported!");
 
 	if (i915->params.enable_guc & ENABLE_GUC_LOAD_HUC &&
 	    !intel_uc_supports_huc(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "HuC is not supported!");
+		gt_info(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "HuC is not supported!");
 
 	if (i915->params.enable_guc & ENABLE_GUC_SUBMISSION &&
 	    !intel_uc_supports_guc_submission(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "GuC submission is N/A");
+		gt_info(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "GuC submission is N/A");
 
 	if (i915->params.enable_guc & ~ENABLE_GUC_MASK)
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "undocumented flag");
+		gt_info(gt, "Incompatible option enable_guc=%d - %s\n",
+			i915->params.enable_guc, "undocumented flag");
 }
 
 void intel_uc_init_early(struct intel_uc *uc)
@@ -249,15 +247,13 @@ static int guc_enable_communication(struct intel_guc *guc)
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
@@ -277,7 +273,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_get_mmio_msg(guc);
 
-	drm_dbg(&i915->drm, "GuC communication disabled\n");
+	guc_dbg(guc, "communication disabled\n");
 }
 
 static void __uc_fetch_firmwares(struct intel_uc *uc)
@@ -290,8 +286,8 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
 	if (err) {
 		/* Make sure we transition out of transient "SELECTED" state */
 		if (intel_uc_wants_huc(uc)) {
-			drm_dbg(&uc_to_gt(uc)->i915->drm,
-				"Failed to fetch GuC: %d disabling HuC\n", err);
+			gt_dbg(uc_to_gt(uc),
+			       "Failed to fetch GuC: %d disabling HuC\n", err);
 			intel_uc_fw_change_status(&uc->huc.fw,
 						  INTEL_UC_FIRMWARE_ERROR);
 		}
@@ -364,7 +360,7 @@ static int uc_init_wopcm(struct intel_uc *uc)
 	int err;
 
 	if (unlikely(!base || !size)) {
-		i915_probe_error(gt->i915, "Unsuccessful WOPCM partitioning\n");
+		gt_probe_error(gt, "Unsuccessful WOPCM partitioning\n");
 		return -E2BIG;
 	}
 
@@ -395,13 +391,13 @@ static int uc_init_wopcm(struct intel_uc *uc)
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
@@ -433,18 +429,19 @@ static int __uc_check_hw(struct intel_uc *uc)
 
 static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
 
-	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
-		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
-		 fw->file_selected.major_ver,
-		 fw->file_selected.minor_ver,
-		 fw->file_selected.patch_ver);
+	gt_info(gt, "%s firmware %s version %u.%u.%u\n",
+		intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
+		fw->file_selected.major_ver,
+		fw->file_selected.minor_ver,
+		fw->file_selected.patch_ver);
 }
 
 static int __uc_init_hw(struct intel_uc *uc)
 {
-	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+	struct intel_gt *gt = uc_to_gt(uc);
+	struct drm_i915_private *i915 = gt->i915;
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
 	int ret, attempts;
@@ -496,8 +493,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 		if (ret == 0)
 			break;
 
-		DRM_DEBUG_DRIVER("GuC fw load failed: %d; will reset and "
-				 "retry %d more time(s)\n", ret, attempts);
+		gt_dbg(gt, "GuC fw load failed: %d; will reset and retry %d more time(s)\n",
+		       ret, attempts);
 	}
 
 	/* Did we succeded or run out of retries? */
@@ -531,10 +528,10 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
-	drm_info(&i915->drm, "GuC submission %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
-	drm_info(&i915->drm, "GuC SLPC %s\n",
-		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
+	gt_info(gt, "GuC submission %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
+	gt_info(gt, "GuC SLPC %s\n",
+		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
 	return 0;
 
@@ -552,12 +549,12 @@ static int __uc_init_hw(struct intel_uc *uc)
 	__uc_sanitize(uc);
 
 	if (!ret) {
-		drm_notice(&i915->drm, "GuC is uninitialized\n");
+		gt_notice(gt, "GuC is uninitialized\n");
 		/* We want to run without GuC submission */
 		return 0;
 	}
 
-	i915_probe_error(i915, "GuC initialization failed %d\n", ret);
+	gt_probe_error(gt, "GuC initialization failed %d\n", ret);
 
 	/* We want to keep KMS alive */
 	return -EIO;
@@ -656,6 +653,7 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
 void intel_uc_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
+	struct intel_gt *gt = uc_to_gt(uc);
 	intel_wakeref_t wakeref;
 	int err;
 
@@ -664,10 +662,10 @@ void intel_uc_suspend(struct intel_uc *uc)
 		return;
 	}
 
-	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
 		err = intel_guc_suspend(guc);
 		if (err)
-			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
+			guc_dbg(guc, "failed to suspend, err=%d\n", err);
 	}
 }
 
@@ -695,7 +693,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 
 	err = intel_guc_resume(guc);
 	if (err) {
-		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
+		guc_dbg(guc, "failed to resume, err=%d\n", err);
 		return err;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 0c80ba51a4bdc..b377481b6a8b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -11,6 +11,8 @@
 #include <drm/drm_print.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "intel_uc_fw.h"
 #include "intel_uc_fw_abi.h"
 #include "i915_drv.h"
@@ -37,11 +39,10 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 			       enum intel_uc_fw_status status)
 {
 	uc_fw->__status =  status;
-	drm_dbg(&__uc_fw_to_gt(uc_fw)->i915->drm,
-		"%s firmware -> %s\n",
-		intel_uc_fw_type_repr(uc_fw->type),
-		status == INTEL_UC_FIRMWARE_SELECTED ?
-		uc_fw->file_selected.path : intel_uc_fw_status_repr(status));
+	gt_dbg(__uc_fw_to_gt(uc_fw), "%s firmware -> %s\n",
+	       intel_uc_fw_type_repr(uc_fw->type),
+	       status == INTEL_UC_FIRMWARE_SELECTED ?
+	       uc_fw->file_selected.path : intel_uc_fw_status_repr(status));
 }
 #endif
 
@@ -482,15 +483,14 @@ static int check_ccs_header(struct intel_gt *gt,
 			    const struct firmware *fw,
 			    struct intel_uc_fw *uc_fw)
 {
-	struct drm_i915_private *i915 = gt->i915;
 	struct uc_css_header *css;
 	size_t size;
 
 	/* Check the size of the blob before examining buffer contents */
 	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, sizeof(struct uc_css_header));
+		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, sizeof(struct uc_css_header));
 		return -ENODATA;
 	}
 
@@ -500,10 +500,9 @@ static int check_ccs_header(struct intel_gt *gt,
 	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
 		css->exponent_size_dw) * sizeof(u32);
 	if (unlikely(size != sizeof(struct uc_css_header))) {
-		drm_warn(&i915->drm,
-			 "%s firmware %s: unexpected header size: %zu != %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, sizeof(struct uc_css_header));
+		gt_warn(gt, "%s firmware %s: unexpected header size: %zu != %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, sizeof(struct uc_css_header));
 		return -EPROTO;
 	}
 
@@ -516,18 +515,18 @@ static int check_ccs_header(struct intel_gt *gt,
 	/* At least, it should have header, uCode and RSA. Size of all three. */
 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->rsa_size;
 	if (unlikely(fw->size < size)) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 fw->size, size);
+		gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size, size);
 		return -ENOEXEC;
 	}
 
 	/* Sanity check whether this fw is not larger than whole WOPCM memory */
 	size = __intel_uc_fw_get_upload_size(uc_fw);
 	if (unlikely(size >= gt->wopcm.size)) {
-		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 size, (size_t)gt->wopcm.size);
+		gt_warn(gt, "%s firmware %s: invalid size: %zu > %zu\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			size, (size_t)gt->wopcm.size);
 		return -E2BIG;
 	}
 
@@ -578,10 +577,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
 
 	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
-		drm_err(&i915->drm,
-			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
-			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
+		gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
+		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+		       fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
 
 		/* try to find another blob to load */
 		release_firmware(fw);
@@ -624,10 +622,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->file_wanted.major_ver) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
-			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
-				   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
+			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+				  uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver,
+				  uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
@@ -642,16 +640,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		drm_notice(&i915->drm,
-			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
-			   intel_uc_fw_type_repr(uc_fw->type),
-			   uc_fw->file_wanted.path,
-			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
-			   uc_fw->file_selected.path,
-			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
-		drm_info(&i915->drm,
-			 "Consider updating your linux-firmware pkg or downloading from %s\n",
-			 INTEL_UC_FIRMWARE_URL);
+		gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
+			  intel_uc_fw_type_repr(uc_fw->type),
+			  uc_fw->file_wanted.path,
+			  uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
+			  uc_fw->file_selected.path,
+			  uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
+		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
+			INTEL_UC_FIRMWARE_URL);
 	}
 
 	if (HAS_LMEM(i915)) {
@@ -679,10 +675,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 				  INTEL_UC_FIRMWARE_MISSING :
 				  INTEL_UC_FIRMWARE_ERROR);
 
-	i915_probe_error(i915, "%s firmware %s: fetch failed with error %d\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path, err);
-	drm_info(&i915->drm, "%s firmware(s) can be downloaded from %s\n",
-		 intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
+	gt_probe_error(gt, "%s firmware %s: fetch failed with error %d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path, err);
+	gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
+		intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
 	return err;
@@ -788,9 +784,9 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	/* Wait for DMA to finish */
 	ret = intel_wait_for_register_fw(uncore, DMA_CTRL, START_DMA, 0, 100);
 	if (ret)
-		drm_err(&gt->i915->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
-			intel_uc_fw_type_repr(uc_fw->type),
-			intel_uncore_read_fw(uncore, DMA_CTRL));
+		gt_err(gt, "DMA for %s fw failed, DMA_CTRL=%u\n",
+		       intel_uc_fw_type_repr(uc_fw->type),
+		       intel_uncore_read_fw(uncore, DMA_CTRL));
 
 	/* Disable the bits once DMA is over */
 	intel_uncore_write_fw(uncore, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
@@ -836,9 +832,9 @@ int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
 	return 0;
 
 fail:
-	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 err);
+	gt_probe_error(gt, "Failed to load %s firmware %s (%d)\n",
+		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+		       err);
 	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
@@ -914,6 +910,7 @@ static void uc_fw_rsa_data_destroy(struct intel_uc_fw *uc_fw)
 
 int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 {
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	int err;
 
 	/* this should happen before the load! */
@@ -924,15 +921,15 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 
 	err = i915_gem_object_pin_pages_unlocked(uc_fw->obj);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw pin-pages err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		gt_dbg(gt, "%s fw pin-pages err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out;
 	}
 
 	err = uc_fw_rsa_data_create(uc_fw);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw rsa data creation failed, err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		gt_dbg(gt, "%s fw rsa data creation failed, err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out_unpin;
 	}
 
-- 
2.37.3

