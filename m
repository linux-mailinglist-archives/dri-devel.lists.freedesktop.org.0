Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27609375B34
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D87F6EE07;
	Thu,  6 May 2021 18:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9606ED92;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: +X2dgqH4DkJgpk8dIJRZaSq8Bdi5uoUn+ErS79IfjwgF9KutSopTb/KLFw2ph6GWnWazQ2Ab8b
 2JzBhNIzHMIA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195467"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 16LU94TUwpVVoNggrAzwa0xY63rZugP0vJtzgLXggyikLpkQf4DrglbiskQlXFckRqeLm7xANy
 S7XJbrI1PB0A==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583656"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 90/97] drm/i915/guc: Non-static lrc descriptor
 registration buffer
Date: Thu,  6 May 2021 12:14:44 -0700
Message-Id: <20210506191451.77768-91-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dynamically allocate space for lrc descriptor registration with the GuC
rather than using a large static buffer indexed by the guc_id. If no
space is available to register a context, fall back to tasklet flow
control mechanism. Only allow 1/2 of the space to be allocated outside
the tasklet to prevent unready requests/contexts from consuming all
registration space.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   9 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 198 +++++++++++++-----
 3 files changed, 150 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index cd2ea5b98fc3..0d7173d3eabd 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -182,6 +182,9 @@ struct intel_context {
 	/* GuC scheduling state that does not require a lock. */
 	atomic_t guc_sched_state_no_lock;
 
+	/* GuC lrc descriptor registration buffer */
+	unsigned int guc_lrcd_reg_idx;
+
 	/* GuC lrc descriptor ID */
 	u16 guc_id;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 96849a256be8..97bb262f8a13 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -68,8 +68,13 @@ struct intel_guc {
 	u32 ads_regset_size;
 	u32 ads_golden_ctxt_size;
 
-	struct i915_vma *lrc_desc_pool;
-	void *lrc_desc_pool_vaddr;
+	/* GuC LRC descriptor registration */
+	struct {
+		struct i915_vma *vma;
+		void *vaddr;
+		struct ida ida;
+		unsigned int max_idx;
+	} lrcd_reg;
 
 	/* guc_id to intel_context lookup */
 	struct xarray context_lookup;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 608b30907f4c..79caf9596084 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -437,65 +437,54 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
-static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
+static u32 __get_lrc_desc_offset(struct intel_guc *guc, int index)
 {
-	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
-
+	GEM_BUG_ON(index >= guc->lrcd_reg.max_idx);
 	GEM_BUG_ON(index >= guc->max_guc_ids);
 
-	return &base[index];
+	return intel_guc_ggtt_offset(guc, guc->lrcd_reg.vma) +
+		(index * sizeof(struct guc_lrc_desc));
 }
 
-static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
+static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, int index)
 {
-	struct intel_context *ce = xa_load(&guc->context_lookup, id);
+	struct guc_lrc_desc *desc;
 
-	GEM_BUG_ON(id >= guc->max_guc_ids);
+	GEM_BUG_ON(index >= guc->lrcd_reg.max_idx);
+	GEM_BUG_ON(index >= guc->max_guc_ids);
 
-	return ce;
+	desc = guc->lrcd_reg.vaddr;
+	desc = &desc[index];
+	memset(desc, 0, sizeof(*desc));
+
+	return desc;
 }
 
-static int guc_lrc_desc_pool_create(struct intel_guc *guc)
+static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
-	u32 size;
-	int ret;
-
-	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
-	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
-					     (void **)&guc->lrc_desc_pool_vaddr);
-	if (ret)
-		return ret;
+	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
-	return 0;
-}
+	GEM_BUG_ON(id >= guc->max_guc_ids);
 
-static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
-{
-	guc->lrc_desc_pool_vaddr = NULL;
-	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
+	return ce;
 }
 
 static inline bool guc_submission_initialized(struct intel_guc *guc)
 {
-	return guc->lrc_desc_pool_vaddr != NULL;
+	return guc->lrcd_reg.max_idx != 0;
 }
 
-static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
+static inline void clr_lrc_desc_registered(struct intel_guc *guc, u32 id)
 {
-	if (likely(guc_submission_initialized(guc))) {
-		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
-		unsigned long flags;
-
-		memset(desc, 0, sizeof(*desc));
+	unsigned long flags;
 
-		/*
-		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
-		 * the lower level functions directly.
-		 */
-		xa_lock_irqsave(&guc->context_lookup, flags);
-		__xa_erase(&guc->context_lookup, id);
-		xa_unlock_irqrestore(&guc->context_lookup, flags);
-	}
+	/*
+	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
+	 * the lower level functions directly.
+	 */
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	__xa_erase(&guc->context_lookup, id);
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
@@ -1373,6 +1362,9 @@ static void retire_worker_func(struct work_struct *w)
 	}
 }
 
+static int guc_lrcd_reg_init(struct intel_guc *guc);
+static void guc_lrcd_reg_fini(struct intel_guc *guc);
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1381,17 +1373,12 @@ int intel_guc_submission_init(struct intel_guc *guc)
 {
 	int ret;
 
-	if (guc->lrc_desc_pool)
+	if (guc_submission_initialized(guc))
 		return 0;
 
-	ret = guc_lrc_desc_pool_create(guc);
+	ret = guc_lrcd_reg_init(guc);
 	if (ret)
 		return ret;
-	/*
-	 * Keep static analysers happy, let them know that we allocated the
-	 * vma after testing that it didn't exist earlier.
-	 */
-	GEM_BUG_ON(!guc->lrc_desc_pool);
 
 	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
 
@@ -1407,10 +1394,10 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 {
 	int i;
 
-	if (!guc->lrc_desc_pool)
+	if (!guc_submission_initialized(guc))
 		return;
 
-	guc_lrc_desc_pool_destroy(guc);
+	guc_lrcd_reg_fini(guc);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
 		struct i915_sched_engine *sched_engine =
@@ -1481,6 +1468,7 @@ static bool need_tasklet(struct guc_submit_engine *gse, struct intel_context *ce
 	return guc_ids_exhausted(gse) || submission_disabled(gse->guc) ||
 		gse->stalled_rq || gse->stalled_context ||
 		!lrc_desc_registered(gse->guc, ce->guc_id) ||
+		context_needs_register(ce) ||
 		!i915_sched_engine_is_empty(sched_engine);
 }
 
@@ -1533,7 +1521,7 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	if (!context_guc_id_invalid(ce)) {
 		ida_simple_remove(&guc->guc_ids, ce->guc_id);
-		reset_lrc_desc(guc, ce->guc_id);
+		clr_lrc_desc_registered(guc, ce->guc_id);
 		set_context_guc_id_invalid(ce);
 	}
 	if (!list_empty(&ce->guc_id_link))
@@ -1723,14 +1711,14 @@ static void unpin_guc_id(struct intel_guc *guc,
 }
 
 static int __guc_action_register_context(struct intel_guc *guc,
+					 struct intel_context *ce,
 					 u32 guc_id,
-					 u32 offset,
 					 bool loop)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_REGISTER_CONTEXT,
 		guc_id,
-		offset,
+		__get_lrc_desc_offset(guc, ce->guc_lrcd_reg_idx),
 	};
 
 	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, loop);
@@ -1739,13 +1727,11 @@ static int __guc_action_register_context(struct intel_guc *guc,
 static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
-		ce->guc_id * sizeof(struct guc_lrc_desc);
 	int ret;
 
 	trace_intel_context_register(ce);
 
-	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
+	ret = __guc_action_register_context(guc, ce, ce->guc_id, loop);
 	set_context_registered(ce);
 	return ret;
 }
@@ -1804,6 +1790,86 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 
 static inline u8 map_i915_prio_to_guc_prio(int prio);
 
+static int alloc_lrcd_reg_idx_buffer(struct intel_guc *guc, int num_per_vma)
+{
+	u32 size = num_per_vma * sizeof(struct guc_lrc_desc);
+	struct i915_vma **vma = &guc->lrcd_reg.vma;
+	void **vaddr = &guc->lrcd_reg.vaddr;
+	int ret;
+
+	GEM_BUG_ON(!is_power_of_2(size));
+
+	ret = intel_guc_allocate_and_map_vma(guc, size, vma, vaddr);
+	if (unlikely(ret))
+		return ret;
+
+	guc->lrcd_reg.max_idx += num_per_vma;
+
+	return 0;
+}
+
+static int alloc_lrcd_reg_idx(struct intel_guc *guc, bool tasklet)
+{
+	int ret;
+	gfp_t gfp = tasklet ? GFP_ATOMIC :
+		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
+
+	might_sleep_if(!tasklet);
+
+	/*
+	 * We only allow 1/2 of the space to be allocated outside of tasklet
+	 * (flow control) to ensure requests that are not ready don't consume
+	 * all context registration space.
+	 */
+	ret = ida_simple_get(&guc->lrcd_reg.ida, 0,
+			     tasklet ? guc->lrcd_reg.max_idx :
+			     guc->lrcd_reg.max_idx / 2, gfp);
+	if (unlikely(ret < 0))
+		return -EBUSY;
+
+	return ret;
+}
+
+static void __free_lrcd_reg_idx(struct intel_guc *guc, struct intel_context *ce)
+{
+	if (ce->guc_lrcd_reg_idx && guc->lrcd_reg.max_idx) {
+		ida_simple_remove(&guc->lrcd_reg.ida, ce->guc_lrcd_reg_idx);
+		ce->guc_lrcd_reg_idx = 0;;
+	}
+}
+
+static void free_lrcd_reg_idx(struct intel_guc *guc, struct intel_context *ce)
+{
+	__free_lrcd_reg_idx(guc, ce);
+}
+
+static int guc_lrcd_reg_init(struct intel_guc *guc)
+{
+	unsigned buffer_size = I915_GTT_PAGE_SIZE_4K * 16;
+	int ret;
+
+	ida_init(&guc->lrcd_reg.ida);
+
+	ret = alloc_lrcd_reg_idx_buffer(guc, buffer_size /
+					sizeof(struct guc_lrc_desc));
+	if (unlikely(ret))
+		return ret;
+
+	/* Zero is reserved */
+	ret = alloc_lrcd_reg_idx(guc, false);
+	GEM_BUG_ON(ret);
+
+	return ret;
+}
+
+static void guc_lrcd_reg_fini(struct intel_guc *guc)
+{
+	i915_vma_unpin_and_release(&guc->lrcd_reg.vma,
+				   I915_VMA_RELEASE_MAP);
+	ida_destroy(&guc->lrcd_reg.ida);
+	guc->lrcd_reg.max_idx = 0;
+}
+
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_runtime_pm *runtime_pm =
@@ -1828,6 +1894,14 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
+	/* Allocate space for registeration */
+	if (likely(!ce->guc_lrcd_reg_idx)) {
+		ret = alloc_lrcd_reg_idx(guc, !loop);
+		if (unlikely(ret < 0))
+			return ret;
+		ce->guc_lrcd_reg_idx = ret;
+	}
+
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
 	rcu_read_lock();
@@ -1836,12 +1910,11 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		prio = ctx->sched.priority;
 	rcu_read_unlock();
 
-	reset_lrc_desc(guc, desc_idx);
 	ret = set_lrc_desc_registered(guc, desc_idx, ce);
 	if (unlikely(ret))
 		return ret;
 
-	desc = __get_lrc_desc(guc, desc_idx);
+	desc = __get_lrc_desc(guc, ce->guc_lrcd_reg_idx);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
@@ -1879,7 +1952,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			}
 			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 			if (unlikely(disabled)) {
-				reset_lrc_desc(guc, desc_idx);
+				clr_lrc_desc_registered(guc, desc_idx);
 				return 0;	/* Will get registered later */
 			}
 		}
@@ -1905,7 +1978,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			ret = register_context(ce, loop);
 		if (unlikely(ret == -EBUSY))
-			reset_lrc_desc(guc, desc_idx);
+			clr_lrc_desc_registered(guc, desc_idx);
 		else if (unlikely(ret == -ENODEV))
 			ret = 0;	/* Will get registered later */
 	}
@@ -2146,6 +2219,7 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 		guc_id = prep_context_pending_disable(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
+		free_lrcd_reg_idx(guc, ce);
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			__guc_context_sched_disable(guc, ce, guc_id);
 	} else {
@@ -2224,6 +2298,7 @@ static void __guc_context_destroy(struct intel_context *ce)
 
 	lrc_fini(ce);
 	intel_context_fini(ce);
+	__free_lrcd_reg_idx(ce_to_guc(ce), ce);
 
 	if (intel_engine_is_virtual(ce->engine)) {
 		struct guc_virtual_engine *ve =
@@ -2726,11 +2801,14 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	if (context_needs_lrc_desc_pin(ce, !!ret)) {
 		ret = guc_lrc_desc_pin(ce, true);
-		if (unlikely(ret)) {	/* unwind */
+		if (unlikely(ret == -EBUSY)) {
+			set_context_needs_register(ce);
+		} else if (unlikely(ret)) {	/* unwind */
 			if (ret == -EDEADLK)
 				disable_submission(guc);
 			atomic_dec(&ce->guc_id_ref);
 			unpin_guc_id(guc, ce, true);
+
 			return ret;
 		}
 	}
@@ -3370,6 +3448,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
+
+		free_lrcd_reg_idx(guc, ce);
 	} else if (context_pending_disable(ce)) {
 		bool banned;
 
@@ -3618,6 +3698,8 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
 		   atomic_read(&guc->outstanding_submission_g2h));
 	drm_printf(p, "GuC Number GuC IDs: %d\n", guc->num_guc_ids);
 	drm_printf(p, "GuC Max Number GuC IDs: %d\n\n", guc->max_guc_ids);
+	drm_printf(p, "GuC max context registered: %u\n\n",
+		   guc->lrcd_reg.max_idx);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
 		gse_log_submission_info(guc->gse[i], p, i);
-- 
2.28.0

