Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398DB42734E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6889650;
	Fri,  8 Oct 2021 21:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0EF6E882;
 Fri,  8 Oct 2021 21:57:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206715332"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="206715332"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="489625471"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 08/11] drm/i915/xehp: Make IRQ reset and postinstall
 multi-tile aware
Date: Fri,  8 Oct 2021 14:56:32 -0700
Message-Id: <20211008215635.2026385-9-matthew.d.roper@intel.com>
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

Loop through all the tiles when initializing and resetting interrupts.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 9f99ad56cde6..e788e283d4a8 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -3190,14 +3190,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_gt *gt = &dev_priv->gt;
 	struct intel_uncore *uncore = gt->uncore;
+	unsigned int i;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(gt);
-	gen11_display_irq_reset(dev_priv);
+	for_each_gt(dev_priv, i, gt) {
+		gen11_gt_irq_reset(gt);
 
-	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
-	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
+		uncore = gt->uncore;
+		GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
+		GEN3_IRQ_RESET(uncore, GEN8_PCU_);
+	}
+
+	gen11_display_irq_reset(dev_priv);
 }
 
 void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
@@ -3890,13 +3895,16 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = &dev_priv->gt;
-	struct intel_uncore *uncore = gt->uncore;
+	struct intel_gt *gt;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	unsigned int i;
 
-	gen11_gt_irq_postinstall(gt);
+	for_each_gt(dev_priv, i, gt) {
+		gen11_gt_irq_postinstall(gt);
 
-	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
+		GEN3_IRQ_INIT(gt->uncore, GEN11_GU_MISC_, ~gu_misc_masked,
+			      gu_misc_masked);
+	}
 
 	if (HAS_DISPLAY(dev_priv)) {
 		icp_irq_postinstall(dev_priv);
@@ -3905,8 +3913,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 				   GEN11_DISPLAY_IRQ_ENABLE);
 	}
 
-	dg1_master_intr_enable(uncore->regs);
-	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
+	dg1_master_intr_enable(dev_priv->gt.uncore->regs);
+	intel_uncore_posting_read(dev_priv->gt.uncore, DG1_MSTR_TILE_INTR);
 }
 
 static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
-- 
2.33.0

