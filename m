Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B623B975E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695D6EC3E;
	Thu,  1 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893096EBFF;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436150"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436150"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564408"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/53] drm/i915: Fork DG1 interrupt handler
Date: Thu,  1 Jul 2021 13:23:37 -0700
Message-Id: <20210701202427.1547543-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paulo Zanoni <paulo.r.zanoni@intel.com>

The current interrupt handler is getting increasingly complicated and
Xe_HP changes will bring even more complexity.  Let's split off a new
interrupt handler starting with DG1 (i.e., when the master tile
interrupt register was added to the design) and use that as the basis
for the new Xe_HP changes.

Now that we track the hardware IP's release number as well as the
version number, we can also properly define DG1 has version "12.10" and
replace the has_master_unit_irq feature flag with an IP version test.

Bspec: 50875
Cc: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |   2 -
 drivers/gpu/drm/i915/i915_irq.c          | 139 +++++++++++++++--------
 drivers/gpu/drm/i915/i915_pci.c          |   2 +-
 drivers/gpu/drm/i915/i915_reg.h          |   4 +-
 drivers/gpu/drm/i915/intel_device_info.h |   1 -
 5 files changed, 95 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 9639800485b9..519cce702f4b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1601,8 +1601,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_LOGICAL_RING_ELSQ(dev_priv) \
 		(INTEL_INFO(dev_priv)->has_logical_ring_elsq)
 
-#define HAS_MASTER_UNIT_IRQ(dev_priv) (INTEL_INFO(dev_priv)->has_master_unit_irq)
-
 #define HAS_EXECLISTS(dev_priv) HAS_LOGICAL_RING_CONTEXTS(dev_priv)
 
 #define INTEL_PPGTT(dev_priv) (INTEL_INFO(dev_priv)->ppgtt_type)
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 7d0ce8b9f8ed..9d47ffa39093 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2699,11 +2699,9 @@ gen11_display_irq_handler(struct drm_i915_private *i915)
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 }
 
-static __always_inline irqreturn_t
-__gen11_irq_handler(struct drm_i915_private * const i915,
-		    u32 (*intr_disable)(void __iomem * const regs),
-		    void (*intr_enable)(void __iomem * const regs))
+static irqreturn_t gen11_irq_handler(int irq, void *arg)
 {
+	struct drm_i915_private *i915 = arg;
 	void __iomem * const regs = i915->uncore.regs;
 	struct intel_gt *gt = &i915->gt;
 	u32 master_ctl;
@@ -2712,9 +2710,9 @@ __gen11_irq_handler(struct drm_i915_private * const i915,
 	if (!intel_irqs_enabled(i915))
 		return IRQ_NONE;
 
-	master_ctl = intr_disable(regs);
+	master_ctl = gen11_master_intr_disable(regs);
 	if (!master_ctl) {
-		intr_enable(regs);
+		gen11_master_intr_enable(regs);
 		return IRQ_NONE;
 	}
 
@@ -2727,7 +2725,7 @@ __gen11_irq_handler(struct drm_i915_private * const i915,
 
 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
 
-	intr_enable(regs);
+	gen11_master_intr_enable(regs);
 
 	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
 
@@ -2736,51 +2734,69 @@ __gen11_irq_handler(struct drm_i915_private * const i915,
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t gen11_irq_handler(int irq, void *arg)
-{
-	return __gen11_irq_handler(arg,
-				   gen11_master_intr_disable,
-				   gen11_master_intr_enable);
-}
-
-static u32 dg1_master_intr_disable_and_ack(void __iomem * const regs)
+static inline u32 dg1_master_intr_disable(void __iomem * const regs)
 {
 	u32 val;
 
 	/* First disable interrupts */
-	raw_reg_write(regs, DG1_MSTR_UNIT_INTR, 0);
+	raw_reg_write(regs, DG1_MSTR_TILE_INTR, 0);
 
 	/* Get the indication levels and ack the master unit */
-	val = raw_reg_read(regs, DG1_MSTR_UNIT_INTR);
+	val = raw_reg_read(regs, DG1_MSTR_TILE_INTR);
 	if (unlikely(!val))
 		return 0;
 
-	raw_reg_write(regs, DG1_MSTR_UNIT_INTR, val);
-
-	/*
-	 * Now with master disabled, get a sample of level indications
-	 * for this interrupt and ack them right away - we keep GEN11_MASTER_IRQ
-	 * out as this bit doesn't exist anymore for DG1
-	 */
-	val = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ) & ~GEN11_MASTER_IRQ;
-	if (unlikely(!val))
-		return 0;
-
-	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, val);
+	raw_reg_write(regs, DG1_MSTR_TILE_INTR, val);
 
 	return val;
 }
 
 static inline void dg1_master_intr_enable(void __iomem * const regs)
 {
-	raw_reg_write(regs, DG1_MSTR_UNIT_INTR, DG1_MSTR_IRQ);
+	raw_reg_write(regs, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
 }
 
 static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
-	return __gen11_irq_handler(arg,
-				   dg1_master_intr_disable_and_ack,
-				   dg1_master_intr_enable);
+	struct drm_i915_private * const i915 = arg;
+	struct intel_gt *gt = &i915->gt;
+	void __iomem * const regs = i915->uncore.regs;
+	u32 master_tile_ctl, master_ctl;
+	u32 gu_misc_iir;
+
+	if (!intel_irqs_enabled(i915))
+		return IRQ_NONE;
+
+	master_tile_ctl = dg1_master_intr_disable(regs);
+	if (!master_tile_ctl) {
+		dg1_master_intr_enable(regs);
+		return IRQ_NONE;
+	}
+
+	/* FIXME: we only support tile 0 for now. */
+	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
+		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
+		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
+	} else {
+		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
+		dg1_master_intr_enable(regs);
+		return IRQ_NONE;
+	}
+
+	gen11_gt_irq_handler(gt, master_ctl);
+
+	if (master_ctl & GEN11_DISPLAY_IRQ)
+		gen11_display_irq_handler(i915);
+
+	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
+
+	dg1_master_intr_enable(regs);
+
+	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
+
+	pmu_irq_stats(i915, IRQ_HANDLED);
+
+	return IRQ_HANDLED;
 }
 
 /* Called from drm generic code, passed 'crtc' which
@@ -3168,10 +3184,20 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
-	if (HAS_MASTER_UNIT_IRQ(dev_priv))
-		dg1_master_intr_disable_and_ack(dev_priv->uncore.regs);
-	else
-		gen11_master_intr_disable(dev_priv->uncore.regs);
+	gen11_master_intr_disable(dev_priv->uncore.regs);
+
+	gen11_gt_irq_reset(&dev_priv->gt);
+	gen11_display_irq_reset(dev_priv);
+
+	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
+	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
+}
+
+static void dg1_irq_reset(struct drm_i915_private *dev_priv)
+{
+	struct intel_uncore *uncore = &dev_priv->uncore;
+
+	dg1_master_intr_disable(dev_priv->uncore.regs);
 
 	gen11_gt_irq_reset(&dev_priv->gt);
 	gen11_display_irq_reset(dev_priv);
@@ -3863,13 +3889,28 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-	if (HAS_MASTER_UNIT_IRQ(dev_priv)) {
-		dg1_master_intr_enable(uncore->regs);
-		intel_uncore_posting_read(&dev_priv->uncore, DG1_MSTR_UNIT_INTR);
-	} else {
-		gen11_master_intr_enable(uncore->regs);
-		intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
+	gen11_master_intr_enable(uncore->regs);
+	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
+}
+
+static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
+{
+	struct intel_uncore *uncore = &dev_priv->uncore;
+	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+
+	gen11_gt_irq_postinstall(&dev_priv->gt);
+
+	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
+
+	if (HAS_DISPLAY(dev_priv)) {
+		icp_irq_postinstall(dev_priv);
+		gen8_de_irq_postinstall(dev_priv);
+		intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL,
+				   GEN11_DISPLAY_IRQ_ENABLE);
 	}
+
+	dg1_master_intr_enable(dev_priv->uncore.regs);
+	intel_uncore_posting_read(&dev_priv->uncore, DG1_MSTR_TILE_INTR);
 }
 
 static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
@@ -4408,9 +4449,9 @@ static irq_handler_t intel_irq_handler(struct drm_i915_private *dev_priv)
 		else
 			return i8xx_irq_handler;
 	} else {
-		if (HAS_MASTER_UNIT_IRQ(dev_priv))
+		if (GRAPHICS_VER_FULL(dev_priv) >= IP_VER(12, 10))
 			return dg1_irq_handler;
-		if (GRAPHICS_VER(dev_priv) >= 11)
+		else if (GRAPHICS_VER(dev_priv) >= 11)
 			return gen11_irq_handler;
 		else if (GRAPHICS_VER(dev_priv) >= 8)
 			return gen8_irq_handler;
@@ -4433,7 +4474,9 @@ static void intel_irq_reset(struct drm_i915_private *dev_priv)
 		else
 			i8xx_irq_reset(dev_priv);
 	} else {
-		if (GRAPHICS_VER(dev_priv) >= 11)
+		if (GRAPHICS_VER_FULL(dev_priv) >= IP_VER(12, 10))
+			dg1_irq_reset(dev_priv);
+		else if (GRAPHICS_VER(dev_priv) >= 11)
 			gen11_irq_reset(dev_priv);
 		else if (GRAPHICS_VER(dev_priv) >= 8)
 			gen8_irq_reset(dev_priv);
@@ -4456,7 +4499,9 @@ static void intel_irq_postinstall(struct drm_i915_private *dev_priv)
 		else
 			i8xx_irq_postinstall(dev_priv);
 	} else {
-		if (GRAPHICS_VER(dev_priv) >= 11)
+		if (GRAPHICS_VER_FULL(dev_priv) >= IP_VER(12, 10))
+			dg1_irq_postinstall(dev_priv);
+		else if (GRAPHICS_VER(dev_priv) >= 11)
 			gen11_irq_postinstall(dev_priv);
 		else if (GRAPHICS_VER(dev_priv) >= 8)
 			gen8_irq_postinstall(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index dc0883bad9cf..9684b647fd04 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -907,7 +907,6 @@ static const struct intel_device_info rkl_info = {
 
 #define DGFX_FEATURES \
 	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
-	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
 	.has_snoop = 1, \
 	.is_dgfx = 1
@@ -915,6 +914,7 @@ static const struct intel_device_info rkl_info = {
 static const struct intel_device_info dg1_info __maybe_unused = {
 	GEN12_FEATURES,
 	DGFX_FEATURES,
+	.graphics_ver_release = 10,
 	PLATFORM(INTEL_DG1),
 	.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),
 	.require_force_probe = 1,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 16a19239d86d..f7dad8541417 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7985,9 +7985,9 @@ enum {
 #define  GEN11_GT_DW1_IRQ		(1 << 1)
 #define  GEN11_GT_DW0_IRQ		(1 << 0)
 
-#define DG1_MSTR_UNIT_INTR		_MMIO(0x190008)
+#define DG1_MSTR_TILE_INTR		_MMIO(0x190008)
 #define   DG1_MSTR_IRQ			REG_BIT(31)
-#define   DG1_MSTR_UNIT(u)		REG_BIT(u)
+#define   DG1_MSTR_TILE(t)		REG_BIT(t)
 
 #define GEN11_DISPLAY_INT_CTL		_MMIO(0x44200)
 #define  GEN11_DISPLAY_IRQ_ENABLE	(1 << 31)
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 944a5ff4df49..b00249906c28 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -127,7 +127,6 @@ enum intel_ppgtt_type {
 	func(has_llc); \
 	func(has_logical_ring_contexts); \
 	func(has_logical_ring_elsq); \
-	func(has_master_unit_irq); \
 	func(has_pooled_eu); \
 	func(has_rc6); \
 	func(has_rc6p); \
-- 
2.25.4

