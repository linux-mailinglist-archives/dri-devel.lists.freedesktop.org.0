Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49325FF678
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241110E122;
	Fri, 14 Oct 2022 23:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE32C10E136;
 Fri, 14 Oct 2022 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788583; x=1697324583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XmbNYnfA3aAzzRQ7bRwMZp7i1FbtZp2mm86a0/zPMjo=;
 b=F98Hu9zbHFR5yBfHRCYepIpqEt6g3jo8yD80L+mc9jIf/E/fcD2RP6M9
 Df4x1p+SOt17+DPqLFcasWT3Z80vB4v6LdCm5lG/rzpPGZrgf8OsUr/yE
 uaN8yP0g5Rt1xxctuq2PKFsmAJxjE60BWxI0fV1hEcnGhCT/p6NHEL3Ow
 Btu2VZFqRQDW4XpYw4bq6AEPBhKXgMPU+fOj3nSsv0suS3IDBd7JyMphj
 H9eAwRsyVvHmkdnE9hy5lNSDvdeqWrWS9L7v0s8LFnaqsBT9iEy/dCD5p
 SJ6+zI99Uty5klzrhzfxMZeKXtdp9tvzHyS/6BS4iNeGJL4GGqjn7x2oN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216967"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216967"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471700"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471700"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 04/14] drm/i915/gt: Correct prefix on a few registers
Date: Fri, 14 Oct 2022 16:02:29 -0700
Message-Id: <20221014230239.1023689-5-matthew.d.roper@intel.com>
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
index 71d8787230c1..890960b56b9e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -486,7 +486,7 @@
 
 #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
 
-#define GEN12_SQCM				_MMIO(0x8724)
+#define XEHP_SQCM				_MMIO(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
 #define HSW_IDICR				_MMIO(0x9008)
@@ -989,7 +989,7 @@
 #define GEN11_SCRATCH2				_MMIO(0xb140)
 #define   GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE	(1 << 19)
 
-#define GEN11_L3SQCREG5				_MMIO(0xb158)
+#define XEHP_L3SQCREG5				_MMIO(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
 #define MLTICTXCTL				_MMIO(0xb170)
@@ -1053,7 +1053,7 @@
 #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
 #define XEHP_COMPCTX_TLB_INV_CR			_MMIO(0xcf04)
 
-#define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
+#define XEHP_MERT_MOD_CTRL			_MMIO(0xcf28)
 #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
 #define COMP_MOD_CTRL				_MMIO(0xcf30)
 #define VDBX_MOD_CTRL				_MMIO(0xcf34)
@@ -1155,7 +1155,7 @@
 #define EU_PERF_CNTL1				_MMIO(0xe558)
 #define EU_PERF_CNTL5				_MMIO(0xe55c)
 
-#define GEN12_HDC_CHICKEN0			_MMIO(0xe5f0)
+#define XEHP_HDC_CHICKEN0			_MMIO(0xe5f0)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define ICL_HDC_MODE				_MMIO(0xe5f4)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3056b099dd17..96b9f02a2284 100644
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
@@ -1514,7 +1514,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * recommended tuning settings documented in the bspec's
 	 * performance guide section.
 	 */
-	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
+	wa_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
 
 	/* Wa_14015795083 */
 	wa_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
@@ -2170,7 +2170,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * Wa_22010960976:dg2
 		 * Wa_14013347512:dg2
 		 */
-		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
+		wa_masked_dis(wal, XEHP_HDC_CHICKEN0,
 			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
 	}
 
@@ -2223,7 +2223,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
 	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14012362059:dg2 */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
@@ -2816,7 +2816,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		}
 
 		/* Wa_14012362059:xehpsdv */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 
 		/* Wa_14014368820:xehpsdv */
 		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-- 
2.37.3

