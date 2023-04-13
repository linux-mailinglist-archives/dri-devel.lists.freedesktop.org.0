Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8C6E0A08
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10B410E12A;
	Thu, 13 Apr 2023 09:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1207C10E12A;
 Thu, 13 Apr 2023 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681377663; x=1712913663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kshmf7HOU1J5+/GB++4/A9uZL9gr9dS8UYb6DXsRsgU=;
 b=C7JUkK23k28fGBkpqCb31rktCkTRDEm1XQ48XqAVpve8PCmKkbNNgsxq
 gjyWV7M5AKt912M7ejMhCQvOiozP175p4OGyAQ9HjNF9Qs08ZM9mu1XLA
 UmESQACzI7Z9S/52W53nTmen4ZOOu8bCLu52hI7IFbE02q4q7eDU2t86g
 hNjrm3i6LbhLd6yNqv7nkUzjKAH82S7Pm2yBIJB/8nirskScgR/zmyRbM
 cPSZtPuDUr2GY7g9BnWnZ8OOFCyZxwZSglPCjysns4/NA5YTPqwfX3SOp
 Gdhlts+v3ugfEGtvs9vuROkSM9YHtvaoFwm9amAkDCR7xAjQDAMgmN2QD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406972432"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="406972432"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 02:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813389967"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="813389967"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 02:20:58 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [PATCH v2] drm/i915: Make IRQ reset and postinstall multi-gt aware
Date: Thu, 13 Apr 2023 11:20:06 +0200
Message-Id: <20230413092006.931861-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paulo Zanoni <paulo.r.zanoni@intel.com>

In multitile systems IRQ need to be reset and enabled per GT.

Although in MTL the GUnit misc interrupts register set are
available only in GT-0, we need to loop through all the GT's
in order to initialize the media engine which lies on a different
GT.

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

proposing again this patch, apparently GuC needs this patch to
initialize the media GT.

Andi

Changelog
=========
v1 -> v2
 - improve description in the commit log.

 drivers/gpu/drm/i915/i915_irq.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index d24bdea65a3dc..524d64bf5d186 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2764,14 +2764,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
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
@@ -3425,13 +3430,16 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
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
@@ -3440,8 +3448,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
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

