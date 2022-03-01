Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8D4C9911
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82410E846;
	Tue,  1 Mar 2022 23:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1CE10E7CE;
 Tue,  1 Mar 2022 23:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176588; x=1677712588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dB3HrxEiwbkZlwDtEO/Yi6s8HkXEW1s2nYFjSxpmNZU=;
 b=Psr29mbvC+vMfHUVSi8iRscOCiYII2rVfCL+kOxx8c2t8yyMsFU5JhPL
 JfVxLgzaMN9cZkjQXzmBe3ID30uwXHUWX/qGSTiLGNH/OAZ6lqmjqj2rj
 5Ky9JKEsGPuPCHGkmCVVikQC8gfojf6mSYS/smm/HiTzqV1II/0Xjv4Zi
 Vy2ApPOii4x/3FmKUX06zcyN3hWBmbjv4LyRC2Fg5nBpIj4YRv6dveUNM
 NvsN+lW1T0aOsJmzz7/jwNoY7nP9dKJ3yDKukKsTzXThRRwpzAThvQdG2
 AeCIdWfLzmI/5xMZ2gZLMVuhFoW7BSkaq2OME/jSlKdK4/HP2BO1vWSGn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479057"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479057"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253463"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/i915/xehp: CCS should use RCS setup functions
Date: Tue,  1 Mar 2022 15:15:41 -0800
Message-Id: <20220301231549.1817978-6-matthew.d.roper@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The compute engine handles the same commands the render engine can
(except 3D pipeline), so it makes sense that CCS is more similar to RCS
than non-render engines.

The CCS context state (lrc) is also similar to the render one, so reuse
it. Note that the compute engine has its own CTX_R_PWR_CLK_STATE
register.

In order to avoid having multiple RCS && CCS checks, add the following
engine flag:
 - I915_ENGINE_HAS_RCS_REG_STATE - use the render (larger) reg state ctx.

BSpec: 46260
Original-author: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 8 +++++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c             | 6 ++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h          | 1 +
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c  | 2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                   | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c     | 2 +-
 6 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index bd60d42238fb..7609db87df05 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -885,7 +885,9 @@ static int igt_shared_ctx_exec(void *arg)
 	return err;
 }
 
-static int rpcs_query_batch(struct drm_i915_gem_object *rpcs, struct i915_vma *vma)
+static int rpcs_query_batch(struct drm_i915_gem_object *rpcs,
+			    struct i915_vma *vma,
+			    struct intel_engine_cs *engine)
 {
 	u32 *cmd;
 
@@ -896,7 +898,7 @@ static int rpcs_query_batch(struct drm_i915_gem_object *rpcs, struct i915_vma *v
 		return PTR_ERR(cmd);
 
 	*cmd++ = MI_STORE_REGISTER_MEM_GEN8;
-	*cmd++ = i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE(RENDER_RING_BASE));
+	*cmd++ = i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE(engine->mmio_base));
 	*cmd++ = lower_32_bits(vma->node.start);
 	*cmd++ = upper_32_bits(vma->node.start);
 	*cmd = MI_BATCH_BUFFER_END;
@@ -957,7 +959,7 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 	if (err)
 		goto err_vma;
 
-	err = rpcs_query_batch(rpcs, vma);
+	err = rpcs_query_batch(rpcs, vma, ce->engine);
 	if (err)
 		goto err_batch;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3150c0847f65..edba18c942cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -208,6 +208,8 @@ u32 intel_engine_context_size(struct intel_gt *gt, u8 class)
 	BUILD_BUG_ON(I915_GTT_PAGE_SIZE != PAGE_SIZE);
 
 	switch (class) {
+	case COMPUTE_CLASS:
+		fallthrough;
 	case RENDER_CLASS:
 		switch (GRAPHICS_VER(gt->i915)) {
 		default:
@@ -431,6 +433,10 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
 		engine->props.preempt_timeout_ms = 0;
 
+	/* features common between engines sharing EUs */
+	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS)
+		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
+
 	engine->defaults = engine->props; /* never to change again */
 
 	engine->context_size = intel_engine_context_size(gt, engine->class);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index f4533ccafbaf..5fa5f21bbf2d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -524,6 +524,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
 #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
 #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
+#define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 961d795220a3..47fca5ebfa76 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3480,7 +3480,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	logical_ring_default_vfuncs(engine);
 	logical_ring_default_irqs(engine);
 
-	if (engine->class == RENDER_CLASS)
+	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
 		rcs_submission_override(engine);
 
 	lrc_init_wa_ctx(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 004e1216e654..d333400d29fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -623,7 +623,7 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
 	GEM_BUG_ON(GRAPHICS_VER(engine->i915) >= 12 &&
 		   !intel_engine_has_relative_mmio(engine));
 
-	if (engine->class == RENDER_CLASS) {
+	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
 		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
 			return dg2_rcs_offsets;
 		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
@@ -1619,7 +1619,7 @@ void lrc_init_wa_ctx(struct intel_engine_cs *engine)
 	unsigned int i;
 	int err;
 
-	if (engine->class != RENDER_CLASS)
+	if (!(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
 		return;
 
 	switch (GRAPHICS_VER(engine->i915)) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b0de9110884a..891b98236155 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3776,7 +3776,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	guc_default_irqs(engine);
 	guc_init_breadcrumbs(engine);
 
-	if (engine->class == RENDER_CLASS)
+	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE)
 		rcs_submission_override(engine);
 
 	lrc_init_wa_ctx(engine);
-- 
2.34.1

