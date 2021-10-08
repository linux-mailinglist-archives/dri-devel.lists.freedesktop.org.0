Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C7427345
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577056E878;
	Fri,  8 Oct 2021 21:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8E96E878;
 Fri,  8 Oct 2021 21:57:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206715323"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="206715323"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="489625442"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 01/11] drm/i915: rework some irq functions to take intel_gt as
 argument
Date: Fri,  8 Oct 2021 14:56:25 -0700
Message-Id: <20211008215635.2026385-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008215635.2026385-1-matthew.d.roper@intel.com>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
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

We'll be adding multi-tile support soon; on multi-tile platforms
interrupts are per-tile and every tile has the full set of
interrupt registers.

In this commit we start passing intel_gt instead of dev_priv for the
functions that are related to Xe_HP irq handling. Right now we're still
passing tile 0 everywhere, but in later patches we'll start actually
passing the correct tile.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Co-authored-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 77680bca46ee..038a9ec563c1 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2772,7 +2772,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private * const i915 = arg;
 	struct intel_gt *gt = &i915->gt;
-	void __iomem * const regs = i915->uncore.regs;
+	void __iomem * const regs = gt->uncore->regs;
 	u32 master_tile_ctl, master_ctl;
 	u32 gu_misc_iir;
 
@@ -3173,11 +3173,12 @@ static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 
 static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_uncore *uncore = &dev_priv->uncore;
+	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_uncore *uncore = gt->uncore;
 
 	gen11_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(&dev_priv->gt);
+	gen11_gt_irq_reset(gt);
 	gen11_display_irq_reset(dev_priv);
 
 	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
@@ -3186,11 +3187,12 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
-	struct intel_uncore *uncore = &dev_priv->uncore;
+	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_uncore *uncore = gt->uncore;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(&dev_priv->gt);
+	gen11_gt_irq_reset(gt);
 	gen11_display_irq_reset(dev_priv);
 
 	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
@@ -3869,13 +3871,14 @@ static void gen11_de_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_uncore *uncore = &dev_priv->uncore;
+	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
 	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		icp_irq_postinstall(dev_priv);
 
-	gen11_gt_irq_postinstall(&dev_priv->gt);
+	gen11_gt_irq_postinstall(gt);
 	gen11_de_irq_postinstall(dev_priv);
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
@@ -3886,10 +3889,11 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_uncore *uncore = &dev_priv->uncore;
+	struct intel_gt *gt = &dev_priv->gt;
+	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
-	gen11_gt_irq_postinstall(&dev_priv->gt);
+	gen11_gt_irq_postinstall(gt);
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
@@ -3900,8 +3904,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 				   GEN11_DISPLAY_IRQ_ENABLE);
 	}
 
-	dg1_master_intr_enable(dev_priv->uncore.regs);
-	intel_uncore_posting_read(&dev_priv->uncore, DG1_MSTR_TILE_INTR);
+	dg1_master_intr_enable(uncore->regs);
+	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
 }
 
 static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
-- 
2.33.0

