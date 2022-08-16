Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102AA596430
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 23:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938310E138;
	Tue, 16 Aug 2022 21:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60AB10E0D9;
 Tue, 16 Aug 2022 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660683977; x=1692219977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIr1juTtvFbl3G7D6BGoHem5dTsyCHBzoQV/fy1pPwE=;
 b=G6pcfXHeNwwiIMIxuWriczvdRbxb9BKzfdyaoJqu736U+NRidZm0Jk4y
 JiAi2kc3DcpiUPQDLV8uvHBxsvWIZkMCPxQbVAH/ZhV5zmg5gj9hxyqLF
 kJkPFZGxq9NN6oMIb1iwuALZFsWj6XRxdaO9IQSzJbFqbOez4bhRWjEd7
 zk37JIr/CqGTDR/q7CNRABm1bRw4Rm22F/ovsSNB8IFMvP9XNIV+JVbXG
 yGjCqRo5+CPahcAjSFSBvCbPKC2zyi/to7+htRK5SIbXh4Mm5ZwhaPJrQ
 QbWUjfGCwTCmP9lwcaH2IaKlrxJTqReVaLq4zXkzXCuINJzpPuXm8VdZj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292325486"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="292325486"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 14:06:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="733440960"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 14:06:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/dg2: Add additional tuning settings
Date: Tue, 16 Aug 2022 14:06:01 -0700
Message-Id: <20220816210601.2041572-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816210601.2041572-1-matthew.d.roper@intel.com>
References: <20220816210601.2041572-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some additional MMIO tuning settings have appeared in the bspec's
performance tuning guide section.

One of the tuning settings here is also documented as formal workaround
Wa_22012654132 for some steppings of DG2.  However the tuning setting
applies to all DG2 variants and steppings, making it a superset of the
workaround.

v2:
 - Move DRAW_WATERMARK to engine workaround section.  It only moves into
   the engine context on future platforms.  (Lucas)
 - CHICKEN_RASTER_2 needs to be handled as a masked register.  (Lucas)

Bspec: 68331
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  8 ++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 ++++++++++++++-------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index b3b49f6d6d1c..f64fafe28f72 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -259,6 +259,9 @@
 #define   GEN9_PREEMPT_GPGPU_COMMAND_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(1, 0)
 #define   GEN9_PREEMPT_GPGPU_LEVEL_MASK		GEN9_PREEMPT_GPGPU_LEVEL(1, 1)
 
+#define DRAW_WATERMARK				_MMIO(0x26c0)
+#define   VERT_WM_VAL				REG_GENMASK(9, 0)
+
 #define GEN12_GLOBAL_MOCS(i)			_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
 
 #define RENDER_HWS_PGA_GEN7			_MMIO(0x4080)
@@ -374,6 +377,9 @@
 #define CHICKEN_RASTER_1			_MMIO(0x6204)
 #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
 
+#define CHICKEN_RASTER_2			_MMIO(0x6208)
+#define   TBIMR_FAST_CLIP			REG_BIT(5)
+
 #define VFLSKPD					_MMIO(0x62a8)
 #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
 #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
@@ -1124,6 +1130,8 @@
 
 #define RT_CTRL					_MMIO(0xe530)
 #define   DIS_NULL_QUERY			REG_BIT(10)
+#define   STACKID_CTRL				REG_GENMASK(6, 5)
+#define   STACKID_CTRL_512			REG_FIELD_PREP(STACKID_CTRL, 0x2)
 
 #define EU_PERF_CNTL1				_MMIO(0xe558)
 #define EU_PERF_CNTL5				_MMIO(0xe55c)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a68d279b01f0..31e129329fb0 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -568,6 +568,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 				   struct i915_wa_list *wal)
 {
+	wa_masked_en(wal, CHICKEN_RASTER_2, TBIMR_FAST_CLIP);
 	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
 	wa_add(wal,
@@ -2195,15 +2196,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
 	}
 
-	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_C0) ||
-	    IS_DG2_G11(i915)) {
-		/* Wa_22012654132:dg2 */
-		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
-		       _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
-		       0 /* write-only, so skip validation */,
-		       true);
-	}
-
 	/* Wa_14013202645:dg2 */
 	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) ||
 	    IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0))
@@ -2692,6 +2684,23 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 
 	if (IS_DG2(i915)) {
 		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+		wa_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
+		wa_write_clr_set(wal, DRAW_WATERMARK, VERT_WM_VAL,
+				 REG_FIELD_PREP(VERT_WM_VAL, 0x3FF));
+
+		/*
+		 * This is also listed as Wa_22012654132 for certain DG2
+		 * steppings, but the tuning setting programming is a superset
+		 * since it applies to all DG2 variants and steppings.
+		 *
+		 * Note that register 0xE420 is write-only and cannot be read
+		 * back for verification on DG2 (due to Wa_14012342262), so
+		 * we need to explicitly skip the readback.
+		 */
+		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
+		       _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
+		       0 /* write-only, so skip validation */,
+		       true);
 	}
 }
 
-- 
2.37.1

