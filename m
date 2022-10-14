Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE875FF67D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C691810E13F;
	Fri, 14 Oct 2022 23:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5C110E122;
 Fri, 14 Oct 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788584; x=1697324584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7EleniTuFJ71WdlMSQBDeHBZE0YXti1a06FLp6ShX8=;
 b=aqVcLOWF8VTHvBIYppvJuJkMPxEx4/hW57IOM2P0CypeyrputGV8dfrT
 U+7nHCAc0Zlgac0QLCcaw9eTFFX+pKpVbOy/xUzB/Cbd2gIndpUtptFT4
 ppNoMMbu/idbLAOk+t0S2MXOYudYBL+ItUS70QJHh1gDcoUOVdstv3NVK
 HN54JxIp5f7Fld/OzJy7/6mF86q2DYVQo11UToi/rRGSMKzduNWQKFBhN
 0BnVLYC88uPVbx3/LaVF24+ZlEc8EqCyj6mj2LVd+8zCVClycJmm6oNwg
 fCUL82Zw0MYHqX4xO7xODHkaDr9hnRsreSouwOU9+lvIDw+DSARx9UArV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216972"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471714"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471714"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/14] drm/i915/gt: Always use MCR functions on multicast
 registers
Date: Fri, 14 Oct 2022 16:02:34 -0700
Message-Id: <20221014230239.1023689-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014230239.1023689-1-matthew.d.roper@intel.com>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than relying on the implicit behavior of intel_uncore_*()
functions, let's always use the intel_gt_mcr_*() functions to operate on
multicast/replicated registers.

v2:
 - Add TLB invalidation registers

v3:
 - Switch more uncore operations in mmio_invalidate_full() to MCR
   operations for Xe_HP.  (Bala)

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c        | 58 ++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_mocs.c      | 13 ++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 12 +++--
 drivers/gpu/drm/i915/intel_pm.c           | 19 ++++----
 4 files changed, 65 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e14f159ad9fc..3df0d0336dbc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1017,6 +1017,32 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
 	return rb;
 }
 
+/*
+ * HW architecture suggest typical invalidation time at 40us,
+ * with pessimistic cases up to 100us and a recommendation to
+ * cap at 1ms. We go a bit higher just in case.
+ */
+#define TLB_INVAL_TIMEOUT_US 100
+#define TLB_INVAL_TIMEOUT_MS 4
+
+/*
+ * On Xe_HP the TLB invalidation registers are located at the same MMIO offsets
+ * but are now considered MCR registers.  Since they exist within a GAM range,
+ * the primary instance of the register rolls up the status from each unit.
+ */
+static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
+{
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
+		return intel_gt_mcr_wait_for_reg_fw(gt, rb.reg, rb.bit, 0,
+						    TLB_INVAL_TIMEOUT_US,
+						    TLB_INVAL_TIMEOUT_MS);
+	else
+		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
+						    TLB_INVAL_TIMEOUT_US,
+						    TLB_INVAL_TIMEOUT_MS,
+						    NULL);
+}
+
 static void mmio_invalidate_full(struct intel_gt *gt)
 {
 	static const i915_reg_t gen8_regs[] = {
@@ -1048,7 +1074,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	unsigned int num = 0;
 
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
-		regs = xehp_regs;
+		regs = NULL;
 		num = ARRAY_SIZE(xehp_regs);
 	} else if (GRAPHICS_VER(i915) == 12) {
 		regs = gen12_regs;
@@ -1075,11 +1101,17 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		if (!intel_engine_pm_is_awake(engine))
 			continue;
 
-		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
-		if (!i915_mmio_reg_offset(rb.reg))
-			continue;
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+			intel_gt_mcr_multicast_write_fw(gt,
+							xehp_regs[engine->class],
+							BIT(engine->instance));
+		} else {
+			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
+			if (!i915_mmio_reg_offset(rb.reg))
+				continue;
 
-		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
+			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
+		}
 		awake |= engine->mask;
 	}
 
@@ -1099,22 +1131,12 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	for_each_engine_masked(engine, gt, awake, tmp) {
 		struct reg_and_bit rb;
 
-		/*
-		 * HW architecture suggest typical invalidation time at 40us,
-		 * with pessimistic cases up to 100us and a recommendation to
-		 * cap at 1ms. We go a bit higher just in case.
-		 */
-		const unsigned int timeout_us = 100;
-		const unsigned int timeout_ms = 4;
-
 		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
-		if (__intel_wait_for_register_fw(uncore,
-						 rb.reg, rb.bit, 0,
-						 timeout_us, timeout_ms,
-						 NULL))
+
+		if (wait_for_invalidate(gt, rb))
 			drm_err_ratelimited(&gt->i915->drm,
 					    "%s TLB invalidation did not complete in %ums!\n",
-					    engine->name, timeout_ms);
+					    engine->name, TLB_INVAL_TIMEOUT_MS);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index ecfa5baa5e3f..49fdd509527a 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -7,6 +7,7 @@
 
 #include "intel_engine.h"
 #include "intel_gt.h"
+#include "intel_gt_mcr.h"
 #include "intel_gt_regs.h"
 #include "intel_mocs.h"
 #include "intel_ring.h"
@@ -609,17 +610,17 @@ static u32 l3cc_combine(u16 low, u16 high)
 	     0; \
 	     i++)
 
-static void init_l3cc_table(struct intel_uncore *uncore,
+static void init_l3cc_table(struct intel_gt *gt,
 			    const struct drm_i915_mocs_table *table)
 {
 	unsigned int i;
 	u32 l3cc;
 
 	for_each_l3cc(l3cc, table, i)
-		if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50))
-			intel_uncore_write_fw(uncore, XEHP_LNCFCMOCS(i), l3cc);
+		if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
+			intel_gt_mcr_multicast_write_fw(gt, XEHP_LNCFCMOCS(i), l3cc);
 		else
-			intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
+			intel_uncore_write_fw(gt->uncore, GEN9_LNCFCMOCS(i), l3cc);
 }
 
 void intel_mocs_init_engine(struct intel_engine_cs *engine)
@@ -639,7 +640,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
 		init_mocs_table(engine, &table);
 
 	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
-		init_l3cc_table(engine->uncore, &table);
+		init_l3cc_table(engine->gt, &table);
 }
 
 static u32 global_mocs_offset(void)
@@ -675,7 +676,7 @@ void intel_mocs_init(struct intel_gt *gt)
 	 * memory transactions including guc transactions
 	 */
 	if (flags & HAS_RENDER_L3CC)
-		init_l3cc_table(gt->uncore, &table);
+		init_l3cc_table(gt, &table);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 9229243992c2..5b86b2e286e0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -10,12 +10,15 @@
  */
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
 #include "intel_guc_fw.h"
 #include "i915_drv.h"
 
-static void guc_prepare_xfer(struct intel_uncore *uncore)
+static void guc_prepare_xfer(struct intel_gt *gt)
 {
+	struct intel_uncore *uncore = gt->uncore;
+
 	u32 shim_flags = GUC_ENABLE_READ_CACHE_LOGIC |
 			 GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA |
 			 GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA |
@@ -35,8 +38,9 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
 
 	if (GRAPHICS_VER(uncore->i915) == 9) {
 		/* DOP Clock Gating Enable for GuC clocks */
-		intel_uncore_rmw(uncore, GEN8_MISCCPCTL,
-				 0, GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
+		intel_gt_mcr_multicast_write(gt, GEN8_MISCCPCTL,
+					     GEN8_DOP_CLOCK_GATE_GUC_ENABLE |
+					     intel_gt_mcr_read_any(gt, GEN8_MISCCPCTL));
 
 		/* allows for 5us (in 10ns units) before GT can go to RC6 */
 		intel_uncore_write(uncore, GUC_ARAT_C6DIS, 0x1FF);
@@ -168,7 +172,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	struct intel_uncore *uncore = gt->uncore;
 	int ret;
 
-	guc_prepare_xfer(uncore);
+	guc_prepare_xfer(gt);
 
 	/*
 	 * Note that GuC needs the CSS header plus uKernel code to be copied
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 390802245514..cb18e45f6adf 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -30,6 +30,8 @@
 #include "display/skl_watermark.h"
 
 #include "gt/intel_engine_regs.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
 
 #include "i915_drv.h"
@@ -4321,22 +4323,22 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	/* WaTempDisableDOPClkGating:bdw */
-	misccpctl = intel_uncore_rmw(&dev_priv->uncore, GEN8_MISCCPCTL, ~GEN8_DOP_CLOCK_GATE_ENABLE,
-				     0);
+	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
+					       ~GEN8_DOP_CLOCK_GATE_ENABLE, 0);
 
-	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
+	val = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
 	val &= ~L3_PRIO_CREDITS_MASK;
 	val |= L3_GENERAL_PRIO_CREDITS(general_prio_credits);
 	val |= L3_HIGH_PRIO_CREDITS(high_prio_credits);
-	intel_uncore_write(&dev_priv->uncore, GEN8_L3SQCREG1, val);
+	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_L3SQCREG1, val);
 
 	/*
 	 * Wait at least 100 clocks before re-enabling clock gating.
 	 * See the definition of L3SQCREG1 in BSpec.
 	 */
-	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
+	intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
 	udelay(1);
-	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
+	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL, misccpctl);
 }
 
 static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
@@ -4496,9 +4498,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 	gen9_init_clock_gating(dev_priv);
 
 	/* WaDisableDopClockGating:skl */
-	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL,
-			   intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
-			   ~GEN8_DOP_CLOCK_GATE_ENABLE);
+	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
+				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
 
 	/* WAC6entrylatency:skl */
 	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
-- 
2.37.3

