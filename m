Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D343B542087
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 02:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE510E598;
	Wed,  8 Jun 2022 00:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A879910E598;
 Wed,  8 Jun 2022 00:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654649471; x=1686185471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NeUon+I41dZZ9Ikd8BPpxcpK3Zp+I5SU/mDLgw1DSSE=;
 b=X0tb6hp2PDgM1oqaK7oVGNFieXsoAPo0qHcu/5kXr+I18FccMnMFudDh
 RkrsiUw22TWaQgwnJzo8SWhqmfKh9zPVS/ApCoho+Z67qhVmJPbSUnjzr
 Js9D4L++sOQA57a5Xu4EZpQUqmcyzem6jL8SQ3JjQUSCto2sMHqBkzwzC
 +r7mGbLZGwOcvyKzhcsJw7gpZrChjvOqtkhYDyRoEDedwILgPRS0PV6mQ
 3KJyZD0vxM1xpLebAsXtEGGbQUpKqmPZay9wVKScLsHYHwBfPO+CnLhEo
 2d9nUF1bP+uY019FedmvE94r74fv88GB9SC1TcjC+LWzChhtfMgCYrd8T w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="275542590"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="275542590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 17:51:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="609435748"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 17:51:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: More PVC+DG2 workarounds
Date: Tue,  7 Jun 2022 17:51:08 -0700
Message-Id: <20220608005108.3717895-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new PVC+DG2 workaround has appeared recently:
 - Wa_16015675438

And a couple existing DG2 workarounds have been extended to PVC:
 - Wa_14015795083
 - Wa_18018781329

Note that Wa_16015675438 asks us to program a register that is in the
0x2xxx range typically associated with the RCS engine, even though PVC
does not have an RCS.  By default the GuC will think we've made a
mistake and throw an exception when it sees this register on a CCS
engine's save/restore list, so we need to pass an extra GuC control flag
to tell it that this is expected and not a problem.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 +++++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  1 +
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index c8129a351731..226557018037 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -140,6 +140,7 @@
 #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
 #define   GEN9_TSG_BARRIER_ACK_DISABLE		(1 << 8)
 #define   GEN9_POOLED_EU_LOAD_BALANCING_FIX_DISABLE	(1 << 10)
+#define   GEN12_PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
 
 #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 1e7ca3863f20..e1e70eff9aac 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1491,13 +1491,20 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
 }
 
+static void
+pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	/* Wa_14015795083 */
+	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
 	if (IS_PONTEVECCHIO(i915))
-		; /* none yet */
+		pvc_gt_workarounds_init(gt, wal);
 	else if (IS_DG2(i915))
 		dg2_gt_workarounds_init(gt, wal);
 	else if (IS_XEHPSDV(i915))
@@ -2082,12 +2089,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * performance guide section.
 		 */
 		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
-
-		/* Wa_18018781329:dg2 */
-		wa_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
@@ -2700,6 +2701,15 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 
 		/* Wa_22014226127:dg2,pvc */
 		wa_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
+
+		/* Wa_16015675438:dg2,pvc */
+		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2, GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
+
+		/* Wa_18018781329:dg2,pvc */
+		wa_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2c4ad4a65089..35887cb53201 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -327,6 +327,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_FOREVER))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
+	/* Wa_16015675438 */
+	if (!RCS_MASK(gt))
+		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 42cb7a9a6199..b3c9a9327f76 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -105,6 +105,7 @@
 #define   GUC_WA_PRE_PARSER		BIT(14)
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
+#define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
-- 
2.35.3

