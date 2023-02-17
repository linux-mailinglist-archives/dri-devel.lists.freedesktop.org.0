Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BB69B2AF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3685210E3E3;
	Fri, 17 Feb 2023 18:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866210E3E0;
 Fri, 17 Feb 2023 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676660089; x=1708196089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ueIi6GmB2j6g4ZCvzua4zNkqADw0/gfzmFHTVPoKCo4=;
 b=fvz77Avs7QIk3T+CxP6QPFe0Nx/ydrfz7RAQ6ln/VTj8ARNJ0TOD/ans
 i/nNyhZoYlPJcjUqkIlUKiI8sdKbozcMPOuopsiYsY1KapBAX8yTrzHzm
 dlZwyRrezHUkij4LWh1Pi3OqdBZYsafkYZLn1HOtPhNtvjOXMVTQq0d2L
 uNWy0kgQAStY3h3Uf2y8T1kdbT0XOB9exCc+XxS0EJzUGK/WTNN3Pko2I
 NeIT9Sjs/vO2ayF/J/7RbiE45JrcfQvZ1P3/oH3vz6JU1O7N4QfGdqIh2
 4zThSfpevpAsQFkvdfWRHO7bBGZodPqjn6ATT8zlboToeEr/2XSn0PBv2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="315776202"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="315776202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 10:54:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703033019"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="703033019"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 10:54:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Add engine TLB invalidation
Date: Fri, 17 Feb 2023 10:54:33 -0800
Message-Id: <20230217185433.2418370-1-matthew.d.roper@intel.com>
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
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
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

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 52 ++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  1 +
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index f3a91e7f85f7..af8e158fbd84 100644
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
+	if (class == OTHER_CLASS) {
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

