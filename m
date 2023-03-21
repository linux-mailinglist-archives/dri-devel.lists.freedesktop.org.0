Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE56C3E67
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 00:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CEE10E090;
	Tue, 21 Mar 2023 23:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9710E090;
 Tue, 21 Mar 2023 23:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679440849; x=1710976849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UsqKTo91wUQK7ceAEqYtePGKnFrbM2iP61CwVRfFsDo=;
 b=A7LiYjRLFf87ckBzLllHf7QaLlMo5IkVrJcDzYrEAXnZK1OS7GON1pDX
 SsPQ9C+7pT8IGIBrqMSFxnnfhu7R2+ub8ZBL7zKZXqM4/Owfa7KvxqvaH
 kFT2Ca2OnxbbD79XeI+P1TzbmvZcHkAA49I3yCVdu/X1VrkSB14cXvY4/
 EVu2EsbJeOZdWQN2EoTT8C6By171Ca7cxB8rGRCsEo97VY32H6EFZPGOR
 bBY86wZnuAapwAI48dxzIy/+z6q86aSQ2QFPWtimhJbVh1clb5gcRUCVD
 dka+bkRy36wH+GIV7npnnA/RsBuQ+NLTlmUidBzcXiuSOnLKfearQgl+C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327460155"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="327460155"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714184207"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="714184207"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:20:39 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [PATCH] drm/i915: Make IRQ reset and postinstall multi-gt aware
Date: Wed, 22 Mar 2023 00:20:09 +0100
Message-Id: <20230321232009.541585-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paulo Zanoni <paulo.r.zanoni@intel.com>

In multitile systems IRQ need to be reset and enabled per GT.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 31271c30a8cf4..ee4530ec14de3 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2762,14 +2762,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
+	unsigned int i;
 
 	dg1_master_intr_disable(dev_priv->uncore.regs);
 
-	gen11_gt_irq_reset(gt);
-	gen11_display_irq_reset(dev_priv);
+	for_each_gt(gt, dev_priv, i) {
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
@@ -3423,13 +3428,16 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_uncore *uncore = gt->uncore;
 	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+	struct intel_gt *gt;
+	unsigned int i;
 
-	gen11_gt_irq_postinstall(gt);
+	for_each_gt(gt, dev_priv, i) {
+		gen11_gt_irq_postinstall(gt);
 
-	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
+		GEN3_IRQ_INIT(gt->uncore, GEN11_GU_MISC_, ~gu_misc_masked,
+			      gu_misc_masked);
+	}
 
 	if (HAS_DISPLAY(dev_priv)) {
 		icp_irq_postinstall(dev_priv);
@@ -3438,8 +3446,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 				   GEN11_DISPLAY_IRQ_ENABLE);
 	}
 
-	dg1_master_intr_enable(uncore->regs);
-	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
+	dg1_master_intr_enable(to_gt(dev_priv)->uncore->regs);
+	intel_uncore_posting_read(to_gt(dev_priv)->uncore, DG1_MSTR_TILE_INTR);
 }
 
 static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
-- 
2.39.2

