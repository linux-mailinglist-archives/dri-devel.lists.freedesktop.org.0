Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DE3D02E1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9766E52E;
	Tue, 20 Jul 2021 20:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352AA6E50C;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885366"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906065"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 08/42] drm/i915/guc: Non-static lrc descriptor
 registration buffer
Date: Tue, 20 Jul 2021 13:57:28 -0700
Message-Id: <20210720205802.39610-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 204 ++++++++++++------
 3 files changed, 152 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 7536129c9a5a..aabc1b349044 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -179,6 +179,9 @@ struct intel_context {
 	/* GuC scheduling state flags that do not require a lock. */
 	atomic_t guc_sched_state_no_lock;
 
+	/* GuC lrc descriptor registration buffer */
+	unsigned int guc_lrcd_reg_idx;
+
 	/* GuC LRC descriptor ID */
 	u16 guc_id;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index e278ad376986..3198480f717c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -69,8 +69,13 @@ struct intel_guc {
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
index 2873018eb36e..e1a35f647025 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -436,65 +436,54 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
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
@@ -1376,6 +1365,9 @@ static void retire_worker_func(struct work_struct *w)
 	}
 }
 
+static int guc_lrcd_reg_init(struct intel_guc *guc);
+static void guc_lrcd_reg_fini(struct intel_guc *guc);
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1384,17 +1376,12 @@ int intel_guc_submission_init(struct intel_guc *guc)
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
 
@@ -1410,10 +1397,10 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 {
 	int i;
 
-	if (!guc->lrc_desc_pool)
+	if (!guc_submission_initialized(guc))
 		return;
 
-	guc_lrc_desc_pool_destroy(guc);
+	guc_lrcd_reg_fini(guc);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
 		struct i915_sched_engine *sched_engine =
@@ -1486,6 +1473,7 @@ static bool need_tasklet(struct guc_submit_engine *gse, struct intel_context *ce
 	return guc_ids_exhausted(gse) || submission_disabled(guc) ||
 		gse->stalled_rq || gse->stalled_context ||
 		!lrc_desc_registered(guc, ce->guc_id) ||
+		context_needs_register(ce) ||
 		!i915_sched_engine_is_empty(sched_engine);
 }
 
@@ -1537,7 +1525,7 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 {
 	if (!context_guc_id_invalid(ce)) {
 		ida_simple_remove(&guc->guc_ids, ce->guc_id);
-		reset_lrc_desc(guc, ce->guc_id);
+		clr_lrc_desc_registered(guc, ce->guc_id);
 		set_context_guc_id_invalid(ce);
 	}
 	if (!list_empty(&ce->guc_id_link))
@@ -1731,14 +1719,14 @@ static void unpin_guc_id(struct intel_guc *guc,
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
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
@@ -1748,13 +1736,11 @@ static int __guc_action_register_context(struct intel_guc *guc,
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
@@ -1814,6 +1800,86 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 
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
 	struct intel_engine_cs *engine = ce->engine;
@@ -1837,6 +1903,14 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
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
@@ -1845,12 +1919,11 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
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
@@ -1888,7 +1961,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			}
 			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 			if (unlikely(disabled)) {
-				reset_lrc_desc(guc, desc_idx);
+				clr_lrc_desc_registered(guc, desc_idx);
 				return 0;	/* Will get registered later */
 			}
 		}
@@ -1915,7 +1988,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			ret = register_context(ce, loop);
 		if (unlikely(ret == -EBUSY))
-			reset_lrc_desc(guc, desc_idx);
+			clr_lrc_desc_registered(guc, desc_idx);
 		else if (unlikely(ret == -ENODEV))
 			ret = 0;	/* Will get registered later */
 	}
@@ -2176,6 +2249,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 		guc_id = prep_context_pending_disable(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
+		free_lrcd_reg_idx(guc, ce);
+
 		/*
 		 * In addition to disabling scheduling, set the preemption
 		 * timeout to the minimum value (1 us) so the banned context
@@ -2269,6 +2344,7 @@ static void __guc_context_destroy(struct intel_context *ce)
 
 	lrc_fini(ce);
 	intel_context_fini(ce);
+	__free_lrcd_reg_idx(ce_to_guc(ce), ce);
 
 	if (intel_engine_is_virtual(ce->engine)) {
 		struct guc_virtual_engine *ve =
@@ -2775,11 +2851,11 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	if (context_needs_lrc_desc_pin(ce, !!ret)) {
 		ret = guc_lrc_desc_pin(ce, true);
-		if (unlikely(ret)) {	/* unwind */
-			if (ret == -EPIPE) {
-				disable_submission(guc);
-				goto out;	/* GPU will be reset */
-			}
+		if (unlikely(ret == -EBUSY))
+			set_context_needs_register(ce);
+		else if (ret == -EPIPE)
+			disable_submission(guc); /* GPU will be reset */
+		else if (unlikely(ret)) {	/* unwind */
 			atomic_dec(&ce->guc_id_ref);
 			unpin_guc_id(guc, ce, true);
 			return ret;
@@ -3405,6 +3481,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
+
+		free_lrcd_reg_idx(guc, ce);
 	} else if (context_pending_disable(ce)) {
 		bool banned;
 
@@ -3673,6 +3751,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 		   atomic_read(&guc->outstanding_submission_g2h));
 	drm_printf(p, "GuC Number GuC IDs: %d\n", guc->num_guc_ids);
 	drm_printf(p, "GuC Max Number GuC IDs: %d\n\n", guc->max_guc_ids);
+	drm_printf(p, "GuC max context registered: %u\n\n",
+		   guc->lrcd_reg.max_idx);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
 		gse_log_submission_info(guc->gse[i], p, i);
-- 
2.28.0

