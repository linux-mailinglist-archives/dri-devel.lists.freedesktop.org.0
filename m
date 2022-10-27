Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14962610575
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 00:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70510E722;
	Thu, 27 Oct 2022 22:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40510E00E;
 Thu, 27 Oct 2022 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666908804; x=1698444804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0pVpnVC4i2ldRUn4y1hizuESSQzBeLhwpkM2UUWuI2U=;
 b=KJQ6t4HFWb7K4oMcxpXXZuCRWJq3Q9B7+T/P50DtxbjooBWBsVyn51A/
 Y6gxj/SIIuehGVfkN6RsehV8MjR6oJ1gNj/RyAX1PJneI5xzdIju6G7JW
 xAzZMmUVkk9WDQ61ak8ElhUHWT1a2kj2907TJnp6HNS4gzn0AfcS77K7y
 0CN2E5oeZZwKGmkPrMEZBKWMLIfBYXxUncRj9pKdLK7z7PjFHItAmhx8Q
 QTGuYIYTZI7zh9Y90+mymbBUpU7rLs3DZW0DppszLEU1Kd7hcsMrRvEdb
 wIXmhsTsBwPUz6yIYWHXBiRdnqnbDHWCiURYqyD0IWg0lvYu/6wYa8Kg2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295763443"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="295763443"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610528955"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="610528955"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
Date: Thu, 27 Oct 2022 15:15:52 -0700
Message-Id: <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GSC CS re-uses the same interrupt bits that the GSC used in older
platforms. This means that we can now have an engine interrupt coming
out of OTHER_CLASS, so we need to handle that appropriately.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 ++++++++++++++------------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index f26882fdc24c..34ff1ee7e931 100644
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
@@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 	const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
 	const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
 	const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
+	struct intel_engine_cs *engine;
 
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
+	if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
+		engine = gt->engine_class[class][instance];
+	else
+		engine = NULL;
+
+	if (engine)
+		return intel_engine_cs_irq(engine, intr);
 
 	if (class == OTHER_CLASS)
 		return gen11_other_irq_handler(gt, instance, intr);
@@ -206,7 +210,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
 	if (CCS_MASK(gt))
 		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
-	if (HAS_HECI_GSC(gt->i915))
+	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
 
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
@@ -233,7 +237,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
 	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
-	if (HAS_HECI_GSC(gt->i915))
+	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
 
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
@@ -249,7 +253,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
-	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+	u32 gsc_mask = 0;
 	u32 dmask;
 	u32 smask;
 
@@ -261,6 +265,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
+	if (HAS_ENGINE(gt, GSC0))
+		gsc_mask = irqs;
+	else if (HAS_HECI_GSC(gt->i915))
+		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+
 	BUILD_BUG_ON(irqs & 0xffff0000);
 
 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
@@ -268,9 +277,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
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
@@ -296,7 +304,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
 	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
-	if (HAS_HECI_GSC(gt->i915))
+	if (gsc_mask)
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
 
 	/*
-- 
2.37.3

