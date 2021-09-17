Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A180940FDA7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C236EE49;
	Fri, 17 Sep 2021 16:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1766EE49;
 Fri, 17 Sep 2021 16:14:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="209917776"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="209917776"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="530886223"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, matthew.d.roper@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/2] drm/i915/xehp: Check new fuse bits for SFC availability
Date: Fri, 17 Sep 2021 09:14:06 -0700
Message-Id: <20210917161407.812335-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917161407.812335-1-matthew.d.roper@intel.com>
References: <20210917161407.812335-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_HP adds some new bits to the FUSE1 register to let us know whether a
given SFC unit is present.  We should take this into account while
initializing SFC availability to our VCS and VECS engines.

While we're at it, update the FUSE1 register definition to use
REG_GENMASK / REG_FIELD_GET notation.

Note that, the bspec confusingly names the fuse bits "disable" despite
the register reflecting the *enable* status of the SFC units.  The
original architecture documents which the bspec is based on do properly
name this field "SFC_ENABLE."

Bspec: 52543
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 25 ++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 +++
 drivers/gpu/drm/i915/gt/intel_sseu.c      |  5 ++---
 drivers/gpu/drm/i915/i915_reg.h           |  4 ++--
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 332efea696a5..06dfe7f38953 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -398,7 +398,8 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
 			engine->uabi_capabilities |=
 				I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC;
 	} else if (engine->class == VIDEO_ENHANCEMENT_CLASS) {
-		if (GRAPHICS_VER(i915) >= 9)
+		if (GRAPHICS_VER(i915) >= 9 &&
+		    engine->gt->info.sfc_mask & BIT(engine->instance))
 			engine->uabi_capabilities |=
 				I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC;
 	}
@@ -474,18 +475,25 @@ void intel_engines_free(struct intel_gt *gt)
 }
 
 static
-bool gen11_vdbox_has_sfc(struct drm_i915_private *i915,
+bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 			 unsigned int physical_vdbox,
 			 unsigned int logical_vdbox, u16 vdbox_mask)
 {
+	struct drm_i915_private *i915 = gt->i915;
+
 	/*
 	 * In Gen11, only even numbered logical VDBOXes are hooked
 	 * up to an SFC (Scaler & Format Converter) unit.
 	 * In Gen12, Even numbered physical instance always are connected
 	 * to an SFC. Odd numbered physical instances have SFC only if
 	 * previous even instance is fused off.
+	 *
+	 * Starting with Xe_HP, there's also a dedicated SFC_ENABLE field
+	 * in the fuse register that tells us whether a specific SFC is present.
 	 */
-	if (GRAPHICS_VER(i915) == 12)
+	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
+		return false;
+	else if (GRAPHICS_VER(i915) == 12)
 		return (physical_vdbox % 2 == 0) ||
 			!(BIT(physical_vdbox - 1) & vdbox_mask);
 	else if (GRAPHICS_VER(i915) == 11)
@@ -512,7 +520,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	struct intel_uncore *uncore = gt->uncore;
 	unsigned int logical_vdbox = 0;
 	unsigned int i;
-	u32 media_fuse;
+	u32 media_fuse, fuse1;
 	u16 vdbox_mask;
 	u16 vebox_mask;
 
@@ -534,6 +542,13 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
 		      GEN11_GT_VEBOX_DISABLE_SHIFT;
 
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
+		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
+	} else {
+		gt->info.sfc_mask = ~0;
+	}
+
 	for (i = 0; i < I915_MAX_VCS; i++) {
 		if (!HAS_ENGINE(gt, _VCS(i))) {
 			vdbox_mask &= ~BIT(i);
@@ -546,7 +561,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 			continue;
 		}
 
-		if (gen11_vdbox_has_sfc(i915, i, logical_vdbox, vdbox_mask))
+		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
 			gt->info.vdbox_sfc_access |= BIT(i);
 		logical_vdbox++;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 6fdcde64c180..4492de7f79fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -184,6 +184,9 @@ struct intel_gt {
 
 		u8 num_engines;
 
+		/* General presence of SFC units */
+		u8 sfc_mask;
+
 		/* Media engine access to SFC per instance */
 		u8 vdbox_sfc_access;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index b0e09b58005e..bdf09051b8a0 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -514,10 +514,9 @@ static void hsw_sseu_info_init(struct intel_gt *gt)
 	}
 
 	fuse1 = intel_uncore_read(gt->uncore, HSW_PAVP_FUSE1);
-	switch ((fuse1 & HSW_F1_EU_DIS_MASK) >> HSW_F1_EU_DIS_SHIFT) {
+	switch (REG_FIELD_GET(HSW_F1_EU_DIS_MASK, fuse1)) {
 	default:
-		MISSING_CASE((fuse1 & HSW_F1_EU_DIS_MASK) >>
-			     HSW_F1_EU_DIS_SHIFT);
+		MISSING_CASE(REG_FIELD_GET(HSW_F1_EU_DIS_MASK, fuse1));
 		fallthrough;
 	case HSW_F1_EU_DIS_10EUS:
 		sseu->eu_per_subslice = 10;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c2853cc005ee..280902bfa2ce 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3112,8 +3112,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 
 /* Fuse readout registers for GT */
 #define HSW_PAVP_FUSE1			_MMIO(0x911C)
-#define   HSW_F1_EU_DIS_SHIFT		16
-#define   HSW_F1_EU_DIS_MASK		(0x3 << HSW_F1_EU_DIS_SHIFT)
+#define   XEHP_SFC_ENABLE_MASK		REG_GENMASK(27, 24)
+#define   HSW_F1_EU_DIS_MASK		REG_GENMASK(17, 16)
 #define   HSW_F1_EU_DIS_10EUS		0
 #define   HSW_F1_EU_DIS_8EUS		1
 #define   HSW_F1_EU_DIS_6EUS		2
-- 
2.33.0

