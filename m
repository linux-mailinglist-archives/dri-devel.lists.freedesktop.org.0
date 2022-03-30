Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8D4ED00E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1A10E303;
	Wed, 30 Mar 2022 23:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DBE10E1CF;
 Wed, 30 Mar 2022 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682956; x=1680218956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYeoJBwDfKtT6yAFRROHJXdvOLw6HpKJU3BdOIoqvNs=;
 b=PWy9s/I0iwbnLccR5KFlu7eaKeHGbF2QDRwrNpB/13lHA1pPGWy5URl3
 ZL2Vq9tKH2O012efzmn2jqU4nvL6eV7fHu00CW5ojeqEO7btHug+G7xhU
 fNi5ERvN7r46bYNlWTbszTvKP2isO/G3TwR8Plv3dCytVcPp29yWaP+y7
 sihYW9IouLf+8VVrV4amvPOzVMgdXc2QT9rTujWm4aNQXw/JfP3WGKoRd
 +Zhq75xWUEEOmg65ujcrCzAtGTzAUudHUF1pTsuqNGt5y+mMU6vxSa9pw
 lyno1yRiobG7/iAPhgURwzLwzKbuK3u6lz/6R94iOkF0Hr2UPvt66x9LB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582507"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547051997"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/15] drm/i915/gt: Correct prefix on a few registers
Date: Wed, 30 Mar 2022 16:28:47 -0700
Message-Id: <20220330232858.3204283-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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
index 9e236397397f..0f05bbda773e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -466,7 +466,7 @@
 
 #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
 
-#define GEN12_SQCM				_MMIO(0x8724)
+#define XEHP_SQCM				_MMIO(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
 #define HSW_IDICR				_MMIO(0x9008)
@@ -934,7 +934,7 @@
 #define GEN11_SCRATCH2				_MMIO(0xb140)
 #define   GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE	(1 << 19)
 
-#define GEN11_L3SQCREG5				_MMIO(0xb158)
+#define XEHP_L3SQCREG5				_MMIO(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
 #define MLTICTXCTL				_MMIO(0xb170)
@@ -982,7 +982,7 @@
 #define GEN12_VE_TLB_INV_CR			_MMIO(0xcee0)
 #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
 
-#define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
+#define XEHP_MERT_MOD_CTRL			_MMIO(0xcf28)
 #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
 #define COMP_MOD_CTRL				_MMIO(0xcf30)
 #define VDBX_MOD_CTRL				_MMIO(0xcf34)
@@ -1077,7 +1077,7 @@
 #define EU_PERF_CNTL1				_MMIO(0xe558)
 #define EU_PERF_CNTL5				_MMIO(0xe55c)
 
-#define GEN12_HDC_CHICKEN0			_MMIO(0xe5f0)
+#define XEHP_HDC_CHICKEN0			_MMIO(0xe5f0)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define ICL_HDC_MODE				_MMIO(0xe5f4)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 27807bc70610..544097c56619 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -567,7 +567,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 				   struct i915_wa_list *wal)
 {
-	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+	wa_write_clr_set(wal, XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
 	wa_add(wal,
 	       XEHP_FF_MODE2,
@@ -1486,7 +1486,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * recommended tuning settings documented in the bspec's
 	 * performance guide section.
 	 */
-	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
+	wa_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
 }
 
 static void
@@ -2095,7 +2095,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * Wa_22010960976:dg2
 		 * Wa_14013347512:dg2
 		 */
-		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
+		wa_masked_dis(wal, XEHP_HDC_CHICKEN0,
 			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
 	}
 
@@ -2157,7 +2157,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
 	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14012362059:dg2 */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 
 	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
@@ -2618,7 +2618,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		}
 
 		/* Wa_14012362059:xehpsdv */
-		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 
 		/* Wa_14014368820:xehpsdv */
 		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-- 
2.34.1

