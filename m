Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89F5B42FF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 01:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B5210E0A1;
	Fri,  9 Sep 2022 23:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B3610E134;
 Fri,  9 Sep 2022 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662765520; x=1694301520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BuHPbNUuOqPahBu/qz+aXBzD3CKhEPHToDJTq/ZAZkc=;
 b=WptpcJqoHO/DxxadZuXL4R66K70ApzSp7O+CmJZazKCrQh5NrKcdgFWU
 fpoDx4cLq9OTeHBT6mHtmrFEKChRP5+9MS82Ao708xZtXL2AnVCwoFYVm
 KKj/mAF0fhe9EKq8GWATlPUnjP8RGPMPB6deZ1+lC/RBBlKUUZSHJeLRL
 L0fWM4C83lQ4pPGIRRUScZL+k07sxxX34uVDuckGnPtCWCeDq7be/OJGa
 b8qHVV+iTHvjLJLzO7bMGaBUJ5ZrzxOV+Js0H66ZBRjVN7lXzHUYHAjrp
 xnCvrXRsoRgmM9IU8ByGNxa/zqmm7ywLLSubH55jIA9HJpZlslxmGd4N4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295171543"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="295171543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="741210084"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:18:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gt: Extract function to apply media fuses
Date: Fri,  9 Sep 2022 16:18:16 -0700
Message-Id: <20220909-media-v2-2-6f20f322b4ef@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909-media-v2-0-6f20f322b4ef@intel.com>
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just like is done for compute and copy engines, extract a function to
handle media engines. While at it, be consistent on using or not the
uncore/gt/info variable aliases.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b6602439224d..814f83b5fe59 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -663,6 +663,74 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 	return false;
 }
 
+static void engine_mask_apply_media_fuses(struct intel_gt *gt)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	unsigned int logical_vdbox = 0;
+	unsigned int i;
+	u32 media_fuse, fuse1;
+	u16 vdbox_mask;
+	u16 vebox_mask;
+
+	if (MEDIA_VER(gt->i915) < 11)
+		return;
+
+	/*
+	 * On newer platforms the fusing register is called 'enable' and has
+	 * enable semantics, while on older platforms it is called 'disable'
+	 * and bits have disable semantices.
+	 */
+	media_fuse = intel_uncore_read(gt->uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
+	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
+		media_fuse = ~media_fuse;
+
+	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
+	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
+		      GEN11_GT_VEBOX_DISABLE_SHIFT;
+
+	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
+		fuse1 = intel_uncore_read(gt->uncore, HSW_PAVP_FUSE1);
+		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
+	} else {
+		gt->info.sfc_mask = ~0;
+	}
+
+	for (i = 0; i < I915_MAX_VCS; i++) {
+		if (!HAS_ENGINE(gt, _VCS(i))) {
+			vdbox_mask &= ~BIT(i);
+			continue;
+		}
+
+		if (!(BIT(i) & vdbox_mask)) {
+			gt->info.engine_mask &= ~BIT(_VCS(i));
+			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
+			continue;
+		}
+
+		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
+			gt->info.vdbox_sfc_access |= BIT(i);
+		logical_vdbox++;
+	}
+	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
+		vdbox_mask, VDBOX_MASK(gt));
+	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
+
+	for (i = 0; i < I915_MAX_VECS; i++) {
+		if (!HAS_ENGINE(gt, _VECS(i))) {
+			vebox_mask &= ~BIT(i);
+			continue;
+		}
+
+		if (!(BIT(i) & vebox_mask)) {
+			gt->info.engine_mask &= ~BIT(_VECS(i));
+			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
+		}
+	}
+	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
+		vebox_mask, VEBOX_MASK(gt));
+	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
+}
+
 static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -671,6 +739,9 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	unsigned long ccs_mask;
 	unsigned int i;
 
+	if (GRAPHICS_VER(i915) < 11)
+		return;
+
 	if (hweight32(CCS_MASK(gt)) <= 1)
 		return;
 
@@ -726,75 +797,11 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
  */
 static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 {
-	struct drm_i915_private *i915 = gt->i915;
 	struct intel_gt_info *info = &gt->info;
-	struct intel_uncore *uncore = gt->uncore;
-	unsigned int logical_vdbox = 0;
-	unsigned int i;
-	u32 media_fuse, fuse1;
-	u16 vdbox_mask;
-	u16 vebox_mask;
 
 	GEM_BUG_ON(!info->engine_mask);
 
-	if (GRAPHICS_VER(i915) < 11)
-		return info->engine_mask;
-
-	/*
-	 * On newer platforms the fusing register is called 'enable' and has
-	 * enable semantics, while on older platforms it is called 'disable'
-	 * and bits have disable semantices.
-	 */
-	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
-	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
-		media_fuse = ~media_fuse;
-
-	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
-	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
-		      GEN11_GT_VEBOX_DISABLE_SHIFT;
-
-	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
-		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
-		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
-	} else {
-		gt->info.sfc_mask = ~0;
-	}
-
-	for (i = 0; i < I915_MAX_VCS; i++) {
-		if (!HAS_ENGINE(gt, _VCS(i))) {
-			vdbox_mask &= ~BIT(i);
-			continue;
-		}
-
-		if (!(BIT(i) & vdbox_mask)) {
-			info->engine_mask &= ~BIT(_VCS(i));
-			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
-			continue;
-		}
-
-		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
-			gt->info.vdbox_sfc_access |= BIT(i);
-		logical_vdbox++;
-	}
-	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
-		vdbox_mask, VDBOX_MASK(gt));
-	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
-
-	for (i = 0; i < I915_MAX_VECS; i++) {
-		if (!HAS_ENGINE(gt, _VECS(i))) {
-			vebox_mask &= ~BIT(i);
-			continue;
-		}
-
-		if (!(BIT(i) & vebox_mask)) {
-			info->engine_mask &= ~BIT(_VECS(i));
-			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
-		}
-	}
-	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
-		vebox_mask, VEBOX_MASK(gt));
-	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
-
+	engine_mask_apply_media_fuses(gt);
 	engine_mask_apply_compute_fuses(gt);
 	engine_mask_apply_copy_fuses(gt);
 

-- 
b4 0.10.0-dev-df873
