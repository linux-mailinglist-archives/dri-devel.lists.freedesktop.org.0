Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C329402DA9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468E06E0A0;
	Tue,  7 Sep 2021 17:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E56E08C;
 Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322737"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322737"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352263"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH 7/8] drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
Date: Tue,  7 Sep 2021 10:19:15 -0700
Message-Id: <20210907171916.2548047-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have to specify in the Render Control Unit Mode register
when CCS is enabled.

Bspec: 46034
Original-patch-by: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 26 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               |  3 +++
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 2b36ec7f3a04..046f7da67ba6 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2874,6 +2874,29 @@ static int execlists_resume(struct intel_engine_cs *engine)
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
+	/*
+	 * Multi Context programming.
+	 * just need to program this register once no matter how many CCS
+	 * engines there are. Since some of the CCS engines might be fused off,
+	 * we can't do this as part of the init of a specific CCS and we do
+	 * it during RCS init instead. RCS and all CCS engines are reset
+	 * together, so post-reset re-init is covered as well.
+	 */
+	if (CCS_MASK(engine->gt))
+		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+
+	return 0;
+}
+
 static void execlists_reset_prepare(struct intel_engine_cs *engine)
 {
 	ENGINE_TRACE(engine, "depth<-%d\n",
@@ -3394,6 +3417,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 int intel_execlists_submission_setup(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2f5bf7aa7e3b..db956255d076 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2350,6 +2350,29 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
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
+	/*
+	 * Multi Context programming.
+	 * just need to program this register once no matter how many CCS
+	 * engines there are. Since some of the CCS engines might be fused off,
+	 * we can't do this as part of the init of a specific CCS and we do
+	 * it during RCS init instead. RCS and all CCS engines are reset
+	 * together, so post-reset re-init is covered as well.
+	 */
+	if (CCS_MASK(engine->gt))
+		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+
+	return 0;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -2464,6 +2487,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 static inline void guc_default_irqs(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5b68c02c35af..57f9456f8c61 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -498,6 +498,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ECOBITS_PPGTT_CACHE64B	(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B		(0 << 8)
 
+#define GEN12_RCU_MODE			_MMIO(0x14800)
+#define   GEN12_RCU_MODE_CCS_ENABLE	REG_BIT(0)
+
 #define GAB_CTL				_MMIO(0x24000)
 #define   GAB_CTL_CONT_AFTER_PAGEFAULT	(1 << 8)
 
-- 
2.25.4

