Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFE43F56F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21506E9CC;
	Fri, 29 Oct 2021 03:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51E6E9BC;
 Fri, 29 Oct 2021 03:28:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230438549"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="230438549"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="538557530"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 07/10] drm/i915/xehp: Determine which tile raised an
 interrupt
Date: Thu, 28 Oct 2021 20:28:14 -0700
Message-Id: <20211029032817.3747750-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029032817.3747750-1-matthew.d.roper@intel.com>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paulo Zanoni <paulo.r.zanoni@intel.com>

The first step of interrupt handling is to read a tile0 register that
tells us in which tile the interrupt happened; we can then read the
usual interrupt registers from the appropriate tile.

Note that this is just the first step of handling interrupts properly on
multi-tile platforms.  Subsequent patches will convert other parts of
the interrupt handling flow.

v2:
 - Simplify init of t0_regs.  (Lucas)
 - Fix handling of display and GSE interrupts.  Although we only expect
   to receive these on tile 0, we should still process them inside the
   gt loop to ensure the proper tile's master_ctl value is used.

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 41 ++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 038a9ec563c1..57a58151eaae 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2771,40 +2771,45 @@ static inline void dg1_master_intr_enable(void __iomem * const regs)
 static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private * const i915 = arg;
+	void __iomem * const t0_regs = i915->gt.uncore->regs;
 	struct intel_gt *gt = &i915->gt;
-	void __iomem * const regs = gt->uncore->regs;
 	u32 master_tile_ctl, master_ctl;
-	u32 gu_misc_iir;
+	u32 gu_misc_iir = 0;
+	unsigned int i;
 
 	if (!intel_irqs_enabled(i915))
 		return IRQ_NONE;
 
-	master_tile_ctl = dg1_master_intr_disable(regs);
+	master_tile_ctl = dg1_master_intr_disable(t0_regs);
 	if (!master_tile_ctl) {
-		dg1_master_intr_enable(regs);
+		dg1_master_intr_enable(t0_regs);
 		return IRQ_NONE;
 	}
 
-	/* FIXME: we only support tile 0 for now. */
-	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
+	for_each_gt(i915, i, gt) {
+		void __iomem *const regs = gt->uncore->regs;
+
+		if ((master_tile_ctl & DG1_MSTR_TILE(i)) == 0)
+			continue;
+
 		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
 		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
-	} else {
-		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
-		dg1_master_intr_enable(regs);
-		return IRQ_NONE;
-	}
 
-	gen11_gt_irq_handler(gt, master_ctl);
+		gen11_gt_irq_handler(gt, master_ctl);
 
-	if (master_ctl & GEN11_DISPLAY_IRQ)
-		gen11_display_irq_handler(i915);
-
-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+		/*
+		 * In practice we'll only get display and gu_misc interrupts
+		 * for the GSE on tile0, but it's still simplest to process
+		 * them inside the loop.
+		 */
+		if (master_ctl & GEN11_DISPLAY_IRQ)
+			gen11_display_irq_handler(i915);
 
-	dg1_master_intr_enable(regs);
+		gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+		gen11_gu_misc_irq_handler(gt, gu_misc_iir);
+	}
 
-	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
+	dg1_master_intr_enable(t0_regs);
 
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
-- 
2.33.0

