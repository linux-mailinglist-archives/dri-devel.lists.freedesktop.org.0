Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63895B0E48
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D6E10E888;
	Wed,  7 Sep 2022 20:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511EC10E886;
 Wed,  7 Sep 2022 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662583198; x=1694119198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Es94cPlBI1UtJu0XM1Ub/OYzKlHKnZthHBNo4s9nQcU=;
 b=Bs0xnRevUnjCi7UDNEaIBkZcXHY06XSQaqAp1QS98MSat2WPIlS+19yC
 yuBhLQ/0flFAI7/D+ax+qnkm5jLavuU91/TCORIEDgDB93h3897QjJO9R
 /9llb66REGo8DLjnhDJEy6PLBY9rbVVVXbXW/HY5nbPJ0gHE5/8Mk7aoN
 bUeL0CpADptLjerCXdJsRYClwEXthXLUsFYIUuuY2WjFG33RstJxnxGWR
 BoFTLHAyeXcKIZ9dthjND7ZIxlySzb/tJbz+Vg+qxSKZ3myCHNSre8wao
 hBcf0JfPH/U6A3OqSJkIiEqYQNMu1G7KEV+qw+w//2vfWBUlf1MyzH99J g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297798407"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="297798407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:39:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="859778759"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:39:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gt: Extract function to apply media fuses
Date: Wed,  7 Sep 2022 13:39:11 -0700
Message-Id: <20220907203911.1662804-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907203911.1662804-1-lucas.demarchi@intel.com>
References: <20220907203911.1662804-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just like is done for compute and copy engines, extract a function to
handle media engines. While at it, be consistent on using or not the
uncore/gt/info variable aliases.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 136 ++++++++++++----------
 1 file changed, 72 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 5cddee7c2f1d..5b9dfa0cd467 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -665,6 +665,74 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
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
@@ -673,6 +741,9 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	unsigned long ccs_mask;
 	unsigned int i;
 
+	if (GRAPHICS_VER(i915) < 11)
+		return;
+
 	if (hweight32(CCS_MASK(gt)) <= 1)
 		return;
 
@@ -730,73 +801,10 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_gt_info *info = &gt->info;
-	struct intel_uncore *uncore = gt->uncore;
-	unsigned int logical_vdbox = 0;
-	unsigned int i;
-	u32 media_fuse, fuse1;
-	u16 vdbox_mask;
-	u16 vebox_mask;
 
 	info->engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
 
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
2.37.2

