Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90A5F179A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90A10EE0F;
	Sat,  1 Oct 2022 00:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4810EDF5;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vguiR+jg2pUs0BfJJSFKOHSBSzlLpraa1sqFvKJtA/8=;
 b=BekcBIOAS/faeMJyVC6adu6aL7XpX8qOLEcEzyAIDLvEupg2aottkycS
 9HM6Mxdx5RQuTaTighK/XYuS3qFu3zLX9PFC42Cp0sid0RRM6FFusLg2K
 zhYtBYmEF4fVD2wiYcAabII8UKSbxLLXu83udBcLyuiUOX7q8notuKXEd
 OSPNbN9YbWkHOoWh/lLON1KxgSFzHPB/MV7EVVlmQC+RmYfhBK7ykK300
 jrudsRkkR8WhaMFZK4KwMxHp619X8NIw23nnLLbaZk2VbGo3v0yAb6Svg
 RkcAUaa0H4Z/c4BOPsiOpbv7gkUBCK1ZgwuDJKjVZ/PWX/hDmi4rIkfME w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607928"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477637"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477637"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/14] drm/i915/gt: Always use MCR functions on multicast
 registers
Date: Fri, 30 Sep 2022 17:45:45 -0700
Message-Id: <20221001004550.3031431-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001004550.3031431-1-matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than relying on the implicit behavior of intel_uncore_*()
functions, let's always use the intel_gt_mcr_*() functions to operate on
multicast/replicated registers.

v2:
 - Add TLB invalidation registers

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c        | 42 ++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_mocs.c      | 13 +++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 12 ++++---
 drivers/gpu/drm/i915/intel_pm.c           | 20 ++++++-----
 4 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e14f159ad9fc..e763dc719d3a 100644
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
@@ -1099,22 +1125,12 @@ static void mmio_invalidate_full(struct intel_gt *gt)
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
index 06643701bf24..89ef1e06bf1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -7,6 +7,7 @@
 
 #include "intel_engine.h"
 #include "intel_gt.h"
+#include "intel_gt_mcr.h"
 #include "intel_gt_regs.h"
 #include "intel_mocs.h"
 #include "intel_ring.h"
@@ -601,17 +602,17 @@ static u32 l3cc_combine(u16 low, u16 high)
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
@@ -631,7 +632,7 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
 		init_mocs_table(engine, &table);
 
 	if (flags & HAS_RENDER_L3CC && engine->class == RENDER_CLASS)
-		init_l3cc_table(engine->uncore, &table);
+		init_l3cc_table(engine->gt, &table);
 }
 
 static u32 global_mocs_offset(void)
@@ -667,7 +668,7 @@ void intel_mocs_init(struct intel_gt *gt)
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
index c694433a7da5..381f3d7ef8a7 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -30,6 +30,8 @@
 #include "display/skl_watermark.h"
 
 #include "gt/intel_engine_regs.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
 
 #include "i915_drv.h"
@@ -4339,22 +4341,23 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	/* WaTempDisableDOPClkGating:bdw */
-	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
-	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
+	misccpctl = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_MISCCPCTL);
+	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL,
+				     misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
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
@@ -4514,8 +4517,9 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 	gen9_init_clock_gating(dev_priv);
 
 	/* WaDisableDopClockGating:skl */
-	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
-		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
+	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL,
+				     intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_MISCCPCTL) &
+				     ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
 	/* WAC6entrylatency:skl */
 	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
-- 
2.37.3

