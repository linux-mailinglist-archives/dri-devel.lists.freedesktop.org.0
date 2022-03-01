Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8274C9919
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246E10E897;
	Tue,  1 Mar 2022 23:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282DE10E861;
 Tue,  1 Mar 2022 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176590; x=1677712590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7mSfCcyl+IdgcRanqe/lXRYMaN7qVyRphUhw1Ni7Tfg=;
 b=dBMsQvB5sJc3eMP5Q+UVEVn6G2uwzSPalx91gnSCEn+xyR9wzugBVglH
 vnKQjGF9g8WkcYgOQ4+BKx7c6T9o/AxYw/o4b97yB2fS3DGzlXQwIoBxI
 FTews6jQ961FBW8QmLtvWf1vu1YsMjl0ZEGkRnyiEC4Ozmqd9tC+GPfWf
 bDrJqetvLrRtizRRSYoQTRGyu6ChpkK0PXJX5DAILYIXzcVWTBKl1dUOT
 Lt5QGzY2fEbPcWGeRx5oo7iiCstr0WYDAhFlZaSV1QyEEBdBS+kCFyUVZ
 EYHEKOMFRY6RerC8Z/zIDOS8PVbZe3mM79OK4F4EOgvcZhsdiGOPF6wtr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479064"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479064"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253481"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 08/13] drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
Date: Tue,  1 Mar 2022 15:15:44 -0800
Message-Id: <20220301231549.1817978-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have to specify in the Render Control Unit Mode register
when CCS is enabled.

v2:
 - Move RCU_MODE programming to a helper function.  (Tvrtko)
 - Clean up and clarify comments.  (Tvrtko)
 - Add RCU_MODE to the GuC save/restore list.  (Daniele)
v3:
 - Move this patch before the GuC ADS update to enable compute engines;
   the definition of RCU_MODE and its insertion into the save/restore
   list moves to this patch.  (Daniele)

Bspec: 46034
Original-author: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h          |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 17 +++++++++++++++++
 .../drm/i915/gt/intel_execlists_submission.c    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h         |  3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c      |  4 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 16 ++++++++++++++++
 6 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index be4b1e65442f..1c0ab05c3c40 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -265,6 +265,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
 
 void intel_engine_destroy_pinned_context(struct intel_context *ce);
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine);
+
 #define ENGINE_PHYSICAL	0
 #define ENGINE_MOCK	1
 #define ENGINE_VIRTUAL	2
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2136c56d3abc..92f4cf9833ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2070,6 +2070,23 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 	return active;
 }
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
+{
+	/*
+	 * If there are any non-fused-off CCS engines, we need to enable CCS
+	 * support in the RCU_MODE register.  This only needs to be done once,
+	 * so for simplicity we'll take care of this in the RCS engine's
+	 * resume handler; since the RCS and all CCS engines belong to the
+	 * same reset domain and are reset together, this will also take care
+	 * of re-applying the setting after i915-triggered resets.
+	 */
+	if (!CCS_MASK(engine->gt))
+		return;
+
+	intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "mock_engine.c"
 #include "selftest_engine.c"
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c8407cc96c42..574c0542c92f 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2914,6 +2914,19 @@ static int execlists_resume(struct intel_engine_cs *engine)
 	return 0;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = execlists_resume(engine);
+	if (ret)
+		return ret;
+
+	xehp_enable_ccs_engines(engine);
+
+	return 0;
+}
+
 static void execlists_reset_prepare(struct intel_engine_cs *engine)
 {
 	ENGINE_TRACE(engine, "depth<-%d\n",
@@ -3468,6 +3481,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 int intel_execlists_submission_setup(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 84f189738a68..e629443e07ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1327,6 +1327,9 @@
 #define   ECOBITS_PPGTT_CACHE64B		(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B			(0 << 8)
 
+#define GEN12_RCU_MODE				_MMIO(0x14800)
+#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+
 #define CHV_FUSE_GT				_MMIO(VLV_DISPLAY_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
 #define   CHV_FGT_DISABLE_SS1			(1 << 11)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 847e00390b00..29fbe4681ca7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -335,6 +335,10 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
 	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
 
+	if (engine->class == RENDER_CLASS &&
+	    CCS_MASK(engine->gt))
+		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
+
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
 		ret |= GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 891b98236155..7e248e2001de 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3603,6 +3603,19 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
 	return !sched_engine->tasklet.callback;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = guc_resume(engine);
+	if (ret)
+		return ret;
+
+	xehp_enable_ccs_engines(engine);
+
+	return 0;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -3723,6 +3736,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 static inline void guc_default_irqs(struct intel_engine_cs *engine)
-- 
2.34.1

