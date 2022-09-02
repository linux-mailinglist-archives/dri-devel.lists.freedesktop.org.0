Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3795AA4A6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 02:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73C110E42A;
	Fri,  2 Sep 2022 00:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAC210E3E8;
 Fri,  2 Sep 2022 00:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662079677; x=1693615677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJZ3x2LpsrwUGJ+q7WXbsPusFsyZznHOMNzh2izdcwE=;
 b=R3pGhsADAfm4CUzsv82gbzyFmDeLAe7j/xuVwmMaQJMGlLycK3+YGD/Y
 RzrLeBPTKT1y4c0hs0CwCCIUDWQYI+p3As2pMZIIhxMClEzxYYJBj6hc/
 0uMabxnuFyKdlU+LzPVhuaQciEZam722f/K7pqsxRKx/aq0hM4APdNhre
 uKFOlIpeU27EynZNF6RylmdtY1wshPj0dpgAdUZ4dkqGF+i+vFg2UHgmM
 0ubqEu6mNYJa8ZWRDWy7REuiMzIxuGdhCUdwFVKdtNgxGfzAKtKaTLyoE
 Y+7Qg2i2WrNdhxCylPv9Yter76eK3G8FyQhwjq9BBsCr6B5vQChqGMAMR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278880328"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="278880328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642641441"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/gt: Correct prefix on a few registers
Date: Thu,  1 Sep 2022 17:47:37 -0700
Message-Id: <20220902004740.2849371-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902004740.2849371-1-matthew.d.roper@intel.com>
References: <20220902004740.2849371-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a few registers that have existed for several hardware
generations, but are only used by the driver on Xe_HP and beyond.  In
cases where the Xe_HP version of the register is now replicated and uses
multicast behavior, but earlier generations were singleton, let's change
the register prefix to "XEHP_" to help clarify that we're using the
newer multicast form of the register.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index bf5f21d334f3..94a1f964eaba 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -479,7 +479,7 @@
 
 #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
 
-#define GEN12_SQCM				_MMIO(0x8724)
+#define XEHP_SQCM				_MMIO(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
 #define HSW_IDICR				_MMIO(0x9008)
@@ -980,7 +980,7 @@
 #define GEN11_SCRATCH2				_MMIO(0xb140)
 #define   GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE	(1 << 19)
 
-#define GEN11_L3SQCREG5				_MMIO(0xb158)
+#define XEHP_L3SQCREG5				_MMIO(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
 #define MLTICTXCTL				_MMIO(0xb170)
@@ -1036,7 +1036,7 @@
 #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
 #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
 
-#define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
+#define XEHP_MERT_MOD_CTRL			_MMIO(0xcf28)
 #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
 #define COMP_MOD_CTRL				_MMIO(0xcf30)
 #define VDBX_MOD_CTRL				_MMIO(0xcf34)
@@ -1138,7 +1138,7 @@
 #define EU_PERF_CNTL1				_MMIO(0xe558)
 #define EU_PERF_CNTL5				_MMIO(0xe55c)
 
-#define GEN12_HDC_CHICKEN0			_MMIO(0xe5f0)
+#define XEHP_HDC_CHICKEN0			_MMIO(0xe5f0)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define ICL_HDC_MODE				_MMIO(0xe5f4)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index eff5f4f85374..3d48189021ad 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -569,7 +569,7 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 				   struct i915_wa_list *wal)
 {
 	wa_masked_en(wal, CHICKEN_RASTER_2, TBIMR_FAST_CLIP);
-	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+	wa_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
 	wa_add(wal,
 	       XEHP_FF_MODE2,
@@ -1504,7 +1504,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * recommended tuning settings documented in the bspec's
 	 * performance guide section.
 	 */
-	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
+	wa_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
 
 	/* Wa_14015795083 */
 	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
@@ -2163,7 +2163,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * Wa_22010960976:dg2
 		 * Wa_14013347512:dg2
 		 */
-		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
+		wa_masked_dis(wal, XEHP_HDC_CHICKEN0,
 			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
 	}
 
@@ -2216,7 +2216,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
 	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14012362059:dg2 */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
@@ -2757,7 +2757,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		}
 
 		/* Wa_14012362059:xehpsdv */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 
 		/* Wa_14014368820:xehpsdv */
 		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-- 
2.37.2

