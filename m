Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8346A1493
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 02:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72DD10E07F;
	Fri, 24 Feb 2023 01:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A47D10E07F;
 Fri, 24 Feb 2023 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677201613; x=1708737613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uw2gIuHfWoXyYi//WTRiYCW+wqD6Vh01lb9dxaDg4Gc=;
 b=jYgFv40m59+hY6tGuRMgUyWromAS+tzYBEYxxOminasyAmQFl1RFdum5
 qi5leSpRlIpkqACL24tRkARS7UM+33PHX4K8wVVtvMzkWenKyt57V9uEV
 RV4FiaIvfkFcdcBmGbtg4Bs4rD6rdSX8oyLLhKDvgDPwN6vnkNb9fIgeV
 apGA4WIRjpjEzmSEMFnYsYKR8otInT82hVW3nzvyEqiWgHJcqemqjwvH5
 T6z4oiTwX5g22ABmIszEc4nkca3OrgOw5V38eLNm85J5+r6gsTqjBuuWz
 LXcggIF41GjA/3ZKrEPhFxBMFU4uyQlUVohtacDMIsMuZVDFAnqM2YW0P w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313760659"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="313760659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 17:20:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="761612634"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="761612634"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 17:20:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mtl: Add engine TLB invalidation
Date: Thu, 23 Feb 2023 17:20:09 -0800
Message-Id: <20230224012009.3594691-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTL's primary GT can continue to use the same engine TLB invalidation
programming as past Xe_HP-based platforms.  However the media GT needs
some special handling:
 * Invalidation registers on the media GT are singleton registers
   (unlike the primary GT where they are still MCR).
 * Since the GSC is now exposed as an engine, there's a new register to
   use for TLB invalidation.  The offset is identical to the compute
   engine offset, but this is expected --- compute engines only exist on
   the primary GT while the GSC only exists on the media GT.
 * Although there's only a single GSC engine instance, it inexplicably
   uses bit 1 to request invalidations rather than bit 0.

v2:
 - Add a 'regs == xelpmp_regs' condition to the GSC instance handling.
   If the registers change on a future platform, the GSC-specific
   handling is likely to change as well.  (Andrzej)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 52 ++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  1 +
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index f3a91e7f85f7..4aa08fac1465 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1166,6 +1166,11 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
 		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
 		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
 	};
+	static const union intel_engine_tlb_inv_reg xelpmp_regs[] = {
+		[VIDEO_DECODE_CLASS].reg	  = GEN12_VD_TLB_INV_CR,
+		[VIDEO_ENHANCEMENT_CLASS].reg     = GEN12_VE_TLB_INV_CR,
+		[OTHER_CLASS].reg		  = XELPMP_GSC_TLB_INV_CR,
+	};
 	struct drm_i915_private *i915 = engine->i915;
 	const unsigned int instance = engine->instance;
 	const unsigned int class = engine->class;
@@ -1185,19 +1190,28 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
 	 * 12.00 -> 12.50 transition multi cast handling is required too.
 	 */
 
-	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
-	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
-		regs = xehp_regs;
-		num = ARRAY_SIZE(xehp_regs);
-	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
-		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
-		regs = gen12_regs;
-		num = ARRAY_SIZE(gen12_regs);
-	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
-		regs = gen8_regs;
-		num = ARRAY_SIZE(gen8_regs);
-	} else if (GRAPHICS_VER(i915) < 8) {
-		return 0;
+	if (engine->gt->type == GT_MEDIA) {
+		if (MEDIA_VER_FULL(i915) == IP_VER(13, 0)) {
+			regs = xelpmp_regs;
+			num = ARRAY_SIZE(xelpmp_regs);
+		}
+	} else {
+		if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 71) ||
+		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 70) ||
+		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
+		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
+			regs = xehp_regs;
+			num = ARRAY_SIZE(xehp_regs);
+		} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
+			   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
+			regs = gen12_regs;
+			num = ARRAY_SIZE(gen12_regs);
+		} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
+			regs = gen8_regs;
+			num = ARRAY_SIZE(gen8_regs);
+		} else if (GRAPHICS_VER(i915) < 8) {
+			return 0;
+		}
 	}
 
 	if (gt_WARN_ONCE(engine->gt, !num,
@@ -1212,7 +1226,14 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
 
 	reg = regs[class];
 
-	if (regs == gen8_regs && class == VIDEO_DECODE_CLASS && instance == 1) {
+	if (regs == xelpmp_regs && class == OTHER_CLASS) {
+		/*
+		 * There's only a single GSC instance, but it uses register bit
+		 * 1 instead of either 0 or OTHER_GSC_INSTANCE.
+		 */
+		GEM_WARN_ON(instance != OTHER_GSC_INSTANCE);
+		val = 1;
+	} else if (regs == gen8_regs && class == VIDEO_DECODE_CLASS && instance == 1) {
 		reg.reg = GEN8_M2TCR;
 		val = 0;
 	} else {
@@ -1228,7 +1249,8 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
 	if (GRAPHICS_VER(i915) >= 12 &&
 	    (engine->class == VIDEO_DECODE_CLASS ||
 	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
-	     engine->class == COMPUTE_CLASS))
+	     engine->class == COMPUTE_CLASS ||
+	     engine->class == OTHER_CLASS))
 		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
 	else
 		engine->tlb_inv.request = val;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 416976d396ba..423e3e9c564b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1090,6 +1090,7 @@
 #define XEHP_BLT_TLB_INV_CR			MCR_REG(0xcee4)
 #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
 #define XEHP_COMPCTX_TLB_INV_CR			MCR_REG(0xcf04)
+#define XELPMP_GSC_TLB_INV_CR			_MMIO(0xcf04)   /* media GT only */
 
 #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
 #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
-- 
2.39.1

