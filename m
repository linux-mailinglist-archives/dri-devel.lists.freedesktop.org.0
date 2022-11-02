Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43214616A08
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF5810E51C;
	Wed,  2 Nov 2022 17:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422510E518;
 Wed,  2 Nov 2022 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408904; x=1698944904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JgEbmgvbEuVuFh4XOK2rnobFkSPgf3Fl+/5YzIKfIhY=;
 b=UoIzmMLpxWnHevYc0IiTomnEnf0HbAfY6fLMdUK81w9yz5T94YSr4GU1
 +c61wqYR6zyi3Q9CKMcKXpdSorVXiEQgoshGkgXSswPcuo/lqwfNrX+CB
 hacXnDSxCTHQILaYRrSqx9PBNaMkwA4n3+sTffyO/5A9Ovlw174yWfGKP
 +GWX10XGJHugVrsi1E/tphKJunqzb2Nx/pkrwlvgM8HVsl90Yb2HcGZRW
 GZAA/r76B3vnjk2+q9ogEW5AzH/AKw3klFiB7prfjHnC/LCYJW4BAtV0G
 fExwOK1wLWKML8ajK+Men4h4ONmrnBR/SMD6IfISQ4ZasHGs41FVuysGJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777141"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835340"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835340"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/i915/mtl: add GSC CS interrupt support
Date: Wed,  2 Nov 2022 10:10:45 -0700
Message-Id: <20221102171047.2787951-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GSC CS re-uses the same interrupt bits that the GSC used in older
platforms. This means that we can now have an engine interrupt coming
out of OTHER_CLASS, so we need to handle that appropriately.

v2: clean up the if statement for the engine irq (Tvrtko)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> #v1
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c | 75 ++++++++++++++------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index f26882fdc24c..b197f0e9794f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 		  instance, iir);
 }
 
-static void
-gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
-			 const u8 instance, const u16 iir)
+static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
 {
-	struct intel_engine_cs *engine;
-
-	/*
-	 * Platforms with standalone media have their media engines in another
-	 * GT.
-	 */
-	if (MEDIA_VER(gt->i915) >= 13 &&
-	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
-		if (!gt->i915->media_gt)
-			goto err;
+	struct intel_gt *media_gt = gt->i915->media_gt;
 
-		gt = gt->i915->media_gt;
+	/* we expect the non-media gt to be passed in */
+	GEM_BUG_ON(gt == media_gt);
+
+	if (!media_gt)
+		return gt;
+
+	switch (class) {
+	case VIDEO_DECODE_CLASS:
+	case VIDEO_ENHANCEMENT_CLASS:
+		return media_gt;
+	case OTHER_CLASS:
+		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
+			return media_gt;
+		fallthrough;
+	default:
+		return gt;
 	}
-
-	if (instance <= MAX_ENGINE_INSTANCE)
-		engine = gt->engine_class[class][instance];
-	else
-		engine = NULL;
-
-	if (likely(engine))
-		return intel_engine_cs_irq(engine, iir);
-
-err:
-	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
-		  class, instance);
 }
 
 static void
@@ -122,8 +114,17 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 	if (unlikely(!intr))
 		return;
 
-	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
-		return gen11_engine_irq_handler(gt, class, instance, intr);
+	/*
+	 * Platforms with standalone media have the media and GSC engines in
+	 * another GT.
+	 */
+	gt = pick_gt(gt, class, instance);
+
+	if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE) {
+		struct intel_engine_cs *engine = gt->engine_class[class][instance];
+		if (engine)
+			return intel_engine_cs_irq(engine, intr);
+	}
 
 	if (class == OTHER_CLASS)
 		return gen11_other_irq_handler(gt, instance, intr);
@@ -206,7 +207,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
 	if (CCS_MASK(gt))
 		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
-	if (HAS_HECI_GSC(gt->i915))
+	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
 
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
@@ -233,7 +234,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
 	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
-	if (HAS_HECI_GSC(gt->i915))
+	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
 
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
@@ -249,7 +250,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
-	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+	u32 gsc_mask = 0;
 	u32 dmask;
 	u32 smask;
 
@@ -261,6 +262,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
+	if (HAS_ENGINE(gt, GSC0))
+		gsc_mask = irqs;
+	else if (HAS_HECI_GSC(gt->i915))
+		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+
 	BUILD_BUG_ON(irqs & 0xffff0000);
 
 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
@@ -268,9 +274,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
 	if (CCS_MASK(gt))
 		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
-	if (HAS_HECI_GSC(gt->i915))
-		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE,
-				   gsc_mask);
+	if (gsc_mask)
+		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
@@ -296,7 +301,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
 	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
-	if (HAS_HECI_GSC(gt->i915))
+	if (gsc_mask)
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
 
 	/*
-- 
2.37.3

