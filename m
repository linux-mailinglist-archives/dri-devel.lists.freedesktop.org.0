Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F16688B8E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268D10E6C5;
	Fri,  3 Feb 2023 00:11:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77C10E6B1;
 Fri,  3 Feb 2023 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675383101; x=1706919101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7d23xchK7aoIhWWkEHCsFlWqnFg74AtfYhPxQaidkuI=;
 b=iob8WJwQdiSISbAgERno9RWVw2aslOZLHVB5s2I3Sh8vZnq2GDxbIPl9
 HWYaN99fYKjnA/cDM5HtCit6ikc5STlkMnkpLPb+oNVH1AbgPkXWbS/Jm
 YdULi6Lm75Icgte/GefqQyC5uRx/C7EqYjUHReNNmUUd/LpUUEFvToKTg
 Tzutj+Sw90hVuLRgNN5TTCojC9jHvpDo0JpRmL+5vpU4fo9sVXzFU9lwO
 GJGsHvs07B3BXZ47RQ7zjrRZcw9c2I7ZddwF4tSMiQ+qVnzEaVDKlL14y
 IgxuVAMsVHo/c+6J+UHDuO4dlwsoz0XvSCC7dhU6uccgJtcp4XgTNEdD6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393204044"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393204044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789487431"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="789487431"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 16:11:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/6] drm/i915/guc: More debug print updates - UC firmware
Date: Thu,  2 Feb 2023 16:11:38 -0800
Message-Id: <20230203001143.3323433-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
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

Update a bunch more debug prints to use the new GT based scheme.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c    |  42 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 116 +++++++++++------------
 2 files changed, 73 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index de7f987cf6111..6648691bd6450 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -83,15 +83,15 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
 
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
@@ -102,26 +102,22 @@ static void __confirm_options(struct intel_uc *uc)
 	}
 
 	if (!intel_uc_supports_guc(uc))
-		drm_info(&i915->drm,
-			 "Incompatible option enable_guc=%d - %s\n",
-			 i915->params.enable_guc, "GuC is not supported!");
+		gt_info(gt,  "Incompatible option enable_guc=%d - %s\n",
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
@@ -549,10 +545,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 
 	intel_gsc_uc_load_start(&uc->gsc);
 
-	gt_info(gt, "GuC submission %s\n",
-		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
-	gt_info(gt, "GuC SLPC %s\n",
-		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
+	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
+	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 65672ff826054..7d2558d53e972 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -11,6 +11,7 @@
 #include <drm/drm_print.h>
 
 #include "gem/i915_gem_lmem.h"
+#include "gt/intel_gt_print.h"
 #include "intel_uc_fw.h"
 #include "intel_uc_fw_abi.h"
 #include "i915_drv.h"
@@ -44,11 +45,10 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
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
 
@@ -562,15 +562,14 @@ static int check_ccs_header(struct intel_gt *gt,
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
 
@@ -580,10 +579,9 @@ static int check_ccs_header(struct intel_gt *gt,
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
 
@@ -596,18 +594,18 @@ static int check_ccs_header(struct intel_gt *gt,
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
 
@@ -635,20 +633,20 @@ static bool guc_check_version_range(struct intel_uc_fw *uc_fw)
 	 */
 
 	if (!is_ver_8bit(&uc_fw->file_selected.ver)) {
-		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
-			 intel_uc_fw_type_repr(uc_fw->type),
-			 uc_fw->file_selected.ver.major,
-			 uc_fw->file_selected.ver.minor,
-			 uc_fw->file_selected.ver.patch);
+		gt_warn(__uc_fw_to_gt(uc_fw), "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
+			intel_uc_fw_type_repr(uc_fw->type),
+			uc_fw->file_selected.ver.major,
+			uc_fw->file_selected.ver.minor,
+			uc_fw->file_selected.ver.patch);
 		return false;
 	}
 
 	if (!is_ver_8bit(&guc->submission_version)) {
-		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
-			 intel_uc_fw_type_repr(uc_fw->type),
-			 guc->submission_version.major,
-			 guc->submission_version.minor,
-			 guc->submission_version.patch);
+		gt_warn(__uc_fw_to_gt(uc_fw), "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
+			intel_uc_fw_type_repr(uc_fw->type),
+			guc->submission_version.major,
+			guc->submission_version.minor,
+			guc->submission_version.patch);
 		return false;
 	}
 
@@ -687,10 +685,9 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
 		return err;
 
 	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
-		drm_err(&gt->i915->drm,
-			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
-			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			(*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
+		gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
+		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+		       (*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
 
 		/* try to find another blob to load */
 		release_firmware(*fw);
@@ -768,10 +765,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
-			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
-				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
+			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+				  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
+				  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
@@ -786,16 +783,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		drm_notice(&i915->drm,
-			   "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
-			   intel_uc_fw_type_repr(uc_fw->type),
-			   uc_fw->file_wanted.path,
-			   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
-			   uc_fw->file_selected.path,
-			   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
-		drm_info(&i915->drm,
-			 "Consider updating your linux-firmware pkg or downloading from %s\n",
-			 INTEL_UC_FIRMWARE_URL);
+		gt_notice(gt, "%s firmware %s (%d.%d) is recommended, but only %s (%d.%d) was found\n",
+			  intel_uc_fw_type_repr(uc_fw->type),
+			  uc_fw->file_wanted.path,
+			  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor,
+			  uc_fw->file_selected.path,
+			  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor);
+		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
+			INTEL_UC_FIRMWARE_URL);
 	}
 
 	if (HAS_LMEM(i915)) {
@@ -823,10 +818,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
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
@@ -932,9 +927,9 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, u32 dma_flags)
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
@@ -950,9 +945,8 @@ int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err)
 
 	GEM_BUG_ON(!intel_uc_fw_is_loadable(uc_fw));
 
-	i915_probe_error(gt->i915, "Failed to load %s firmware %s (%d)\n",
-			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 err);
+	gt_probe_error(gt, "Failed to load %s firmware %s (%d)\n",
+		       intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path, err);
 	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 
 	return err;
@@ -1078,15 +1072,15 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
 
 	err = i915_gem_object_pin_pages_unlocked(uc_fw->obj);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw pin-pages err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		gt_dbg(__uc_fw_to_gt(uc_fw), "%s fw pin-pages err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out;
 	}
 
 	err = uc_fw_rsa_data_create(uc_fw);
 	if (err) {
-		DRM_DEBUG_DRIVER("%s fw rsa data creation failed, err=%d\n",
-				 intel_uc_fw_type_repr(uc_fw->type), err);
+		gt_dbg(__uc_fw_to_gt(uc_fw), "%s fw rsa data creation failed, err=%d\n",
+		       intel_uc_fw_type_repr(uc_fw->type), err);
 		goto out_unpin;
 	}
 
-- 
2.39.1

