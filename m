Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CC5326B5
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BA910EB9B;
	Tue, 24 May 2022 09:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD2F10EA89;
 Tue, 24 May 2022 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653385426; x=1684921426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DSsLSWBOO23ps/MNWY2AWTqElhquRE1B6bLf0n90B1I=;
 b=Ob2NUm7k2caJfy4cRPcJkhwRcyGwpC/3PlW0otaVzHTxggXEGMFaGdPf
 EdlChiby09SCTS+PZCKRk2/cDrPHacuanktcr8VZNhq0Rk79l33pgirqB
 RjtI6+KteSpkOWJxS6LwWOisn+aPH7L2Lw2pIErCdYT06s82bv598XTao
 A/q8ysYw54J6eU29RLW0AJcq0tgzvSzYm6uin5p2Odv9JQR49Um1bhiSF
 jDE5elPCju5b9WLPe2w8LwX2zjVmSR1fdJxDQnVR2DvEbvedqE57GFpL7
 f/NnhhCfyE9pXFdZsHE/XKg+cOhGcZ51IFJsMJw+5CXRcT7b7208Npejy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="359878107"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="359878107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 02:43:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="526336453"
Received: from cennis-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.213.170])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 02:43:43 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Date: Tue, 24 May 2022 10:43:39 +0100
Message-Id: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Catch and log any garbage in the register, including no tiles marked, or
multiple tiles marked.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
during glmark and more badness. So I thought lets log all possible failure
modes from here and also use per device logging.
---
 drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
 drivers/gpu/drm/i915/i915_reg.h |  1 +
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 73cebc6aa650..79853d3fc1ed 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	u32 gu_misc_iir;
 
 	if (!intel_irqs_enabled(i915))
-		return IRQ_NONE;
+		goto none;
 
 	master_tile_ctl = dg1_master_intr_disable(regs);
-	if (!master_tile_ctl) {
-		dg1_master_intr_enable(regs);
-		return IRQ_NONE;
+	if (!master_tile_ctl)
+		goto enable_none;
+
+	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
+		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
+			 master_tile_ctl);
+		goto enable_none;
 	}
 
 	/* FIXME: we only support tile 0 for now. */
-	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
-		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
-		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
-	} else {
-		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
-		dg1_master_intr_enable(regs);
-		return IRQ_NONE;
+	if (REG_FIELD_GET(DG1_MSTR_TILE_MASK, master_tile_ctl) !=
+	    DG1_MSTR_TILE(0)) {
+		drm_warn(&i915->drm, "Unexpected irq from tile %u!\n",
+			 ilog2(REG_FIELD_GET(DG1_MSTR_TILE_MASK,
+					     master_tile_ctl)));
+		goto enable_none;
 	}
 
+	master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
+	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
+
 	gen11_gt_irq_handler(gt, master_ctl);
 
 	if (master_ctl & GEN11_DISPLAY_IRQ)
@@ -2810,6 +2816,11 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
 	return IRQ_HANDLED;
+
+enable_none:
+	dg1_master_intr_enable(regs);
+none:
+	return IRQ_NONE;
 }
 
 /* Called from drm generic code, passed 'crtc' which
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d8579ab9384c..eefa301c6430 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -5774,6 +5774,7 @@
 
 #define DG1_MSTR_TILE_INTR		_MMIO(0x190008)
 #define   DG1_MSTR_IRQ			REG_BIT(31)
+#define   DG1_MSTR_TILE_MASK		REG_GENMASK(3, 0)
 #define   DG1_MSTR_TILE(t)		REG_BIT(t)
 
 #define GEN11_DISPLAY_INT_CTL		_MMIO(0x44200)
-- 
2.32.0

