Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806BE4CC917
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912D10E35F;
	Thu,  3 Mar 2022 22:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F002710E2BA;
 Thu,  3 Mar 2022 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646346909; x=1677882909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9NZXAzt/GBziYPODX5wvsFxdwPeKig22L2/9PD3WTkE=;
 b=no9diBbXU6KQ7EfMMmdAlA0pf6XYgYuAnMmZ6wKVsHqNAa2xyzUxR5oh
 P8QEDH1yOk4/mBwnwBuuyXG5bya4mOVwIu1tAPe3zP4/Kni/ladDtfYFI
 ppanaB97yrs+SdAYBIUzV5eUDOxfOYUdFjkMGa9yGKr/O+Q2SIm3DLtfJ
 vft6RaEDdhtVJYU0XOuUbMrHcginp5082pZSQKpmOupe246fn5A8rMv5Y
 NeHyK89k9cGsflVO6vezyahVNAjAWxbhLwmaX90NcVNp/dHoXgGNZUBet
 m+BwoywUeGn5xjdtHs1f4rNSG1SfJ4wRwwKd+RjtePu/eTTTU3kQ2Nyki A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="254025407"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="254025407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:35:09 -0800
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="536043486"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:35:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/xehp: Support platforms with CCS engines but no
 RCS
Date: Thu,  3 Mar 2022 14:34:34 -0800
Message-Id: <20220303223435.2793124-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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

In the past we've always assumed that an RCS engine is present on every
platform.  However now that we have compute engines there may be
platforms that have CCS engines but no RCS, or platforms that are
designed to have both, but have the RCS engine fused off.

Various engine-centric initialization that only needs to be done a
single time for the group of RCS+CCS engines can't rely on being setup
with the RCS now; instead we add a I915_ENGINE_FIRST_RENDER_COMPUTE flag
that will be assigned to a single engine in the group; whichever engine
has this flag will be responsible for some of the general setup
(RCU_MODE programming, initialization of certain workarounds, etc.).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 5 +++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h         | 2 ++
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c          | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 2 +-
 drivers/gpu/drm/i915/i915_drv.h                      | 2 ++
 7 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7447411a5b26..8080479f27aa 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -436,6 +436,11 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
 		engine->props.preempt_timeout_ms = 0;
 
+	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
+	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
+	     engine->class == RENDER_CLASS)
+		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
+
 	/* features common between engines sharing EUs */
 	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 19ff8758e34d..4fbf45a74ec0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -97,6 +97,7 @@ struct i915_ctx_workarounds {
 #define I915_MAX_VCS	8
 #define I915_MAX_VECS	4
 #define I915_MAX_CCS	4
+#define I915_MAX_RCS	1
 
 /*
  * Engine IDs definitions.
@@ -526,6 +527,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
+#define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 1c602d4ae297..e1470bb60f34 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2912,7 +2912,7 @@ static int execlists_resume(struct intel_engine_cs *engine)
 
 	enable_execlists(engine);
 
-	if (engine->class == RENDER_CLASS)
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
 		xehp_enable_ccs_engines(engine);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index c014b40d2e9f..beca8735bae5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2633,7 +2633,7 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 	 * to a single RCS/CCS engine's workaround list since
 	 * they're reset as part of the general render domain reset.
 	 */
-	if (engine->class == RENDER_CLASS)
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
 		general_render_compute_wa_init(engine, wal);
 
 	if (engine->class == RENDER_CLASS)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 9bb551b83e7a..32c2053f2f08 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -335,7 +335,7 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
 	ret |= GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
 
-	if (engine->class == RENDER_CLASS &&
+	if ((engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) &&
 	    CCS_MASK(engine->gt))
 		ret |= GUC_MMIO_REG_ADD(regset, GEN12_RCU_MODE, true);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1ce7e04aa837..8a8bb87e77a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3595,7 +3595,7 @@ static int guc_resume(struct intel_engine_cs *engine)
 	setup_hwsp(engine);
 	start_engine(engine);
 
-	if (engine->class == RENDER_CLASS)
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
 		xehp_enable_ccs_engines(engine);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 457bc1993d19..5ac5792c9cb4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1245,6 +1245,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	((gt)->info.engine_mask &						\
 	 GENMASK(first__ + count__ - 1, first__)) >> first__;		\
 })
+#define RCS_MASK(gt) \
+	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
 #define VDBOX_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, VCS0, I915_MAX_VCS)
 #define VEBOX_MASK(gt) \
-- 
2.34.1

