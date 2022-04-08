Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FB4F9C35
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C33C10E746;
	Fri,  8 Apr 2022 18:03:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F3C10E746;
 Fri,  8 Apr 2022 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649441007; x=1680977007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Rxcomwqw0jDk5xQMRS84Tv1dMoG/3u+092YfjBk0Xo=;
 b=GaUhKJGVU+XIts7W1k/xIldQiRZNBmgvVYsi+HI1rmnfHHYxr0KG4s/7
 ajaL+AZEZaMIKB3pepb0FJ5Y2WYcv4V1xWqHJGCtjlnZhZ19/bISoboMw
 nPcS5BL2LMJR0HGoDf9vYvClpu22yPw3J1MOgUcLPfXLlp3cygU+LDA0H
 1nMfJZrz6SgY6ReQE1V/bmQqVOZxu2e4Qt3uSkQhmQvQUfKcBmliNvyDM
 AuI3kjxknlMvvnGLT1JWQaMy9zJz5j1hVlf7+NQC9Tzg1MRah/QQOPs7j
 ZmbSE7nAbizY2q6/dqUXmIm1YXIJ+Uv9yDOj1xKTv4TA7w9s/04OG2DeC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="241592239"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="241592239"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 11:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="557869594"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2022 11:03:26 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Update context registration to new GuC API
Date: Fri,  8 Apr 2022 11:03:24 -0700
Message-Id: <20220408180326.1454951-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The latest GuC firmware drops the context descriptor pool in favour of
passing all creation data in the create H2G. It also greatly simplifies
the work queue and removes the process descriptor used for multi-LRC
submission. So, remove all mention of LRC and process descriptors and
update the registration code accordingly.

Unfortunately, the new API also removes the ability to set default
values for the scheduling policies at context registration time.
Instead, a follow up H2G must be sent. This will be addressed in the
next patch.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   5 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  52 ++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 221 ++++++++----------
 3 files changed, 116 insertions(+), 162 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 4e431c14b118..3f3373f68123 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -170,11 +170,6 @@ struct intel_guc {
 	/** @ads_engine_usage_size: size of engine usage in the ADS */
 	u32 ads_engine_usage_size;
 
-	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
-	struct i915_vma *lrc_desc_pool;
-	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
-	void *lrc_desc_pool_vaddr;
-
 	/**
 	 * @context_lookup: used to resolve intel_context from guc_id, if a
 	 * context is present in this structure it is registered with the GuC
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index f21b6de46a99..0e1e8d0079b5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -197,20 +197,28 @@ struct guc_wq_item {
 	u32 fence_id;
 } __packed;
 
-struct guc_process_desc {
-	u32 stage_id;
-	u64 db_base_addr;
+struct guc_sched_wq_desc {
 	u32 head;
 	u32 tail;
 	u32 error_offset;
-	u64 wq_base_addr;
-	u32 wq_size_bytes;
 	u32 wq_status;
-	u32 engine_presence;
-	u32 priority;
-	u32 reserved[36];
+	u32 reserved[28];
 } __packed;
 
+/* Helper for context registration H2G */
+struct guc_ctxt_registration_info {
+	u32 flags;
+	u32 context_idx;
+	u32 engine_class;
+	u32 engine_submit_mask;
+	u32 wq_desc_lo;
+	u32 wq_desc_hi;
+	u32 wq_base_lo;
+	u32 wq_base_hi;
+	u32 wq_size;
+	u32 hwlrca_lo;
+	u32 hwlrca_hi;
+};
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
 
 #define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
@@ -219,34 +227,6 @@ struct guc_process_desc {
 /* Preempt to idle on quantum expiry */
 #define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE	BIT(0)
 
-/*
- * GuC Context registration descriptor.
- * FIXME: This is only required to exist during context registration.
- * The current 1:1 between guc_lrc_desc and LRCs for the lifetime of the LRC
- * is not required.
- */
-struct guc_lrc_desc {
-	u32 hw_context_desc;
-	u32 slpm_perf_mode_hint;	/* SPLC v1 only */
-	u32 slpm_freq_hint;
-	u32 engine_submit_mask;		/* In logical space */
-	u8 engine_class;
-	u8 reserved0[3];
-	u32 priority;
-	u32 process_desc;
-	u32 wq_addr;
-	u32 wq_size;
-	u32 context_flags;		/* CONTEXT_REGISTRATION_* */
-	/* Time for one workload to execute. (in micro seconds) */
-	u32 execution_quantum;
-	/* Time to wait for a preemption request to complete before issuing a
-	 * reset. (in micro seconds).
-	 */
-	u32 preemption_timeout;
-	u32 policy_flags;		/* CONTEXT_POLICY_* */
-	u32 reserved1[19];
-} __packed;
-
 #define GUC_POWER_UNSPECIFIED	0
 #define GUC_POWER_D0		1
 #define GUC_POWER_D1		2
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e1612c393781..bd0584d7d489 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -396,12 +396,12 @@ struct sync_semaphore {
 };
 
 struct parent_scratch {
-	struct guc_process_desc pdesc;
+	struct guc_sched_wq_desc wq_desc;
 
 	struct sync_semaphore go;
 	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
 
-	u8 unused[WQ_OFFSET - sizeof(struct guc_process_desc) -
+	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
 		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
 
 	u32 wq[WQ_SIZE / sizeof(u32)];
@@ -438,15 +438,15 @@ __get_parent_scratch(struct intel_context *ce)
 		   LRC_STATE_OFFSET) / sizeof(u32)));
 }
 
-static struct guc_process_desc *
-__get_process_desc(struct intel_context *ce)
+static struct guc_sched_wq_desc *
+__get_wq_desc(struct intel_context *ce)
 {
 	struct parent_scratch *ps = __get_parent_scratch(ce);
 
-	return &ps->pdesc;
+	return &ps->wq_desc;
 }
 
-static u32 *get_wq_pointer(struct guc_process_desc *desc,
+static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
 			   struct intel_context *ce,
 			   u32 wqi_size)
 {
@@ -458,7 +458,7 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
 #define AVAILABLE_SPACE	\
 	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
 	if (wqi_size > AVAILABLE_SPACE) {
-		ce->parallel.guc.wqi_head = READ_ONCE(desc->head);
+		ce->parallel.guc.wqi_head = READ_ONCE(wq_desc->head);
 
 		if (wqi_size > AVAILABLE_SPACE)
 			return NULL;
@@ -468,15 +468,6 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
 	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
 }
 
-static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
-{
-	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
-
-	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
-
-	return &base[index];
-}
-
 static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
@@ -486,39 +477,11 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 	return ce;
 }
 
-static int guc_lrc_desc_pool_create(struct intel_guc *guc)
-{
-	u32 size;
-	int ret;
-
-	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
-			  GUC_MAX_CONTEXT_ID);
-	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
-					     (void **)&guc->lrc_desc_pool_vaddr);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
-{
-	guc->lrc_desc_pool_vaddr = NULL;
-	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
-}
-
 static inline bool guc_submission_initialized(struct intel_guc *guc)
 {
 	return guc->submission_initialized;
 }
 
-static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
-{
-	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
-
-	memset(desc, 0, sizeof(*desc));
-}
-
 static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
 {
 	return __get_context(guc, id);
@@ -545,8 +508,6 @@ static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
-	_reset_lrc_desc(guc, id);
-
 	/*
 	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
 	 * the lower level functions directly.
@@ -751,7 +712,7 @@ static u32 wq_space_until_wrap(struct intel_context *ce)
 	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
 }
 
-static void write_wqi(struct guc_process_desc *desc,
+static void write_wqi(struct guc_sched_wq_desc *wq_desc,
 		      struct intel_context *ce,
 		      u32 wqi_size)
 {
@@ -764,13 +725,13 @@ static void write_wqi(struct guc_process_desc *desc,
 
 	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
 		(WQ_SIZE - 1);
-	WRITE_ONCE(desc->tail, ce->parallel.guc.wqi_tail);
+	WRITE_ONCE(wq_desc->tail, ce->parallel.guc.wqi_tail);
 }
 
 static int guc_wq_noop_append(struct intel_context *ce)
 {
-	struct guc_process_desc *desc = __get_process_desc(ce);
-	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
+	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
+	u32 *wqi = get_wq_pointer(wq_desc, ce, wq_space_until_wrap(ce));
 	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
 
 	if (!wqi)
@@ -789,7 +750,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
 	struct intel_context *child;
-	struct guc_process_desc *desc = __get_process_desc(ce);
+	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
 	unsigned int wqi_size = (ce->parallel.number_children + 4) *
 		sizeof(u32);
 	u32 *wqi;
@@ -809,7 +770,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
 			return ret;
 	}
 
-	wqi = get_wq_pointer(desc, ce, wqi_size);
+	wqi = get_wq_pointer(wq_desc, ce, wqi_size);
 	if (!wqi)
 		return -EBUSY;
 
@@ -824,7 +785,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
 	for_each_child(ce, child)
 		*wqi++ = child->ring->tail / sizeof(u64);
 
-	write_wqi(desc, ce, wqi_size);
+	write_wqi(wq_desc, ce, wqi_size);
 
 	return 0;
 }
@@ -1812,20 +1773,10 @@ static void reset_fail_worker_func(struct work_struct *w);
 int intel_guc_submission_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	int ret;
 
 	if (guc->submission_initialized)
 		return 0;
 
-	ret = guc_lrc_desc_pool_create(guc);
-	if (ret)
-		return ret;
-	/*
-	 * Keep static analysers happy, let them know that we allocated the
-	 * vma after testing that it didn't exist earlier.
-	 */
-	GEM_BUG_ON(!guc->lrc_desc_pool);
-
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
 	if (!guc->submission_state.guc_ids_bitmap)
@@ -1844,7 +1795,6 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 		return;
 
 	guc_flush_destroyed_contexts(guc);
-	guc_lrc_desc_pool_destroy(guc);
 	i915_sched_engine_put(guc->sched_engine);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
 	guc->submission_initialized = false;
@@ -2104,63 +2054,88 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 
 static int __guc_action_register_multi_lrc(struct intel_guc *guc,
 					   struct intel_context *ce,
-					   u32 guc_id,
-					   u32 offset,
+					   struct guc_ctxt_registration_info *info,
 					   bool loop)
 {
 	struct intel_context *child;
-	u32 action[4 + MAX_ENGINE_INSTANCE];
+	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
 	int len = 0;
+	u32 next_id;
 
 	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
 
 	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
-	action[len++] = guc_id;
+	action[len++] = info->flags;
+	action[len++] = info->context_idx;
+	action[len++] = info->engine_class;
+	action[len++] = info->engine_submit_mask;
+	action[len++] = info->wq_desc_lo;
+	action[len++] = info->wq_desc_hi;
+	action[len++] = info->wq_base_lo;
+	action[len++] = info->wq_base_hi;
+	action[len++] = info->wq_size;
 	action[len++] = ce->parallel.number_children + 1;
-	action[len++] = offset;
+	action[len++] = info->hwlrca_lo;
+	action[len++] = info->hwlrca_hi;
+
+	next_id = info->context_idx + 1;
 	for_each_child(ce, child) {
-		offset += sizeof(struct guc_lrc_desc);
-		action[len++] = offset;
+		GEM_BUG_ON(next_id++ != child->guc_id.id);
+
+		/*
+		 * NB: GuC interface supports 64 bit LRCA even though i915
+		 * only supports 32 bit currently.
+		 */
+		action[len++] = lower_32_bits(child->lrc.lrca);
+		action[len++] = upper_32_bits(child->lrc.lrca);
 	}
 
+	GEM_BUG_ON(len > ARRAY_SIZE(action));
+
 	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
 }
 
 static int __guc_action_register_context(struct intel_guc *guc,
-					 u32 guc_id,
-					 u32 offset,
+					 struct guc_ctxt_registration_info *info,
 					 bool loop)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_REGISTER_CONTEXT,
-		guc_id,
-		offset,
+		info->flags,
+		info->context_idx,
+		info->engine_class,
+		info->engine_submit_mask,
+		info->wq_desc_lo,
+		info->wq_desc_hi,
+		info->wq_base_lo,
+		info->wq_base_hi,
+		info->wq_size,
+		info->hwlrca_lo,
+		info->hwlrca_hi,
 	};
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
 					     0, loop);
 }
 
-static void prepare_context_registration_info(struct intel_context *ce);
+static void prepare_context_registration_info(struct intel_context *ce,
+					      struct guc_ctxt_registration_info *info);
 
 static int register_context(struct intel_context *ce, bool loop)
 {
+	struct guc_ctxt_registration_info info;
 	struct intel_guc *guc = ce_to_guc(ce);
-	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
-		ce->guc_id.id * sizeof(struct guc_lrc_desc);
 	int ret;
 
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
-	prepare_context_registration_info(ce);
+	prepare_context_registration_info(ce, &info);
 
 	if (intel_context_is_parent(ce))
-		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
-						      offset, loop);
+		ret = __guc_action_register_multi_lrc(guc, ce, &info, loop);
 	else
-		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
-						    loop);
+		ret = __guc_action_register_context(guc, &info, loop);
 	if (likely(!ret)) {
 		unsigned long flags;
 
@@ -2216,6 +2191,8 @@ static inline u32 get_children_join_value(struct intel_context *ce,
 	return __get_parent_scratch(ce)->join[child_index].semaphore;
 }
 
+#if 0
+/* FIXME: This needs to be updated for new v70 interface... */
 static void guc_context_policy_init(struct intel_engine_cs *engine,
 				    struct guc_lrc_desc *desc)
 {
@@ -2228,14 +2205,14 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
+#endif
 
-static void prepare_context_registration_info(struct intel_context *ce)
+static void prepare_context_registration_info(struct intel_context *ce,
+					      struct guc_ctxt_registration_info *info)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 ctx_id = ce->guc_id.id;
-	struct guc_lrc_desc *desc;
-	struct intel_context *child;
 
 	GEM_BUG_ON(!engine->mask);
 
@@ -2246,47 +2223,49 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
-	desc = __get_lrc_desc(guc, ctx_id);
-	desc->engine_class = engine_class_to_guc_class(engine->class);
-	desc->engine_submit_mask = engine->logical_mask;
-	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = ce->guc_state.prio;
-	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-	guc_context_policy_init(engine, desc);
+	memset(info, 0, sizeof(*info));
+	info->context_idx = ctx_id;
+	info->engine_class = engine_class_to_guc_class(engine->class);
+	info->engine_submit_mask = engine->logical_mask;
+	/*
+	 * NB: GuC interface supports 64 bit LRCA even though i915
+	 * only supports 32 bit currently.
+	 */
+	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
+	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
+	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
+	/* FIXME: This needs to be updated for new v70 interface... */
+	//desc->priority = ce->guc_state.prio;
+	//guc_context_policy_init(engine, desc);
 
 	/*
 	 * If context is a parent, we need to register a process descriptor
 	 * describing a work queue and register all child contexts.
 	 */
 	if (intel_context_is_parent(ce)) {
-		struct guc_process_desc *pdesc;
+		struct guc_sched_wq_desc *wq_desc;
+		u64 wq_desc_offset, wq_base_offset;
 
 		ce->parallel.guc.wqi_tail = 0;
 		ce->parallel.guc.wqi_head = 0;
 
-		desc->process_desc = i915_ggtt_offset(ce->state) +
-			__get_parent_scratch_offset(ce);
-		desc->wq_addr = i915_ggtt_offset(ce->state) +
-			__get_wq_offset(ce);
-		desc->wq_size = WQ_SIZE;
-
-		pdesc = __get_process_desc(ce);
-		memset(pdesc, 0, sizeof(*(pdesc)));
-		pdesc->stage_id = ce->guc_id.id;
-		pdesc->wq_base_addr = desc->wq_addr;
-		pdesc->wq_size_bytes = desc->wq_size;
-		pdesc->wq_status = WQ_STATUS_ACTIVE;
-
-		for_each_child(ce, child) {
-			desc = __get_lrc_desc(guc, child->guc_id.id);
-
-			desc->engine_class =
-				engine_class_to_guc_class(engine->class);
-			desc->hw_context_desc = child->lrc.lrca;
-			desc->priority = ce->guc_state.prio;
-			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
-			guc_context_policy_init(engine, desc);
-		}
+		wq_desc_offset = i915_ggtt_offset(ce->state) +
+				 __get_parent_scratch_offset(ce);
+		wq_base_offset = i915_ggtt_offset(ce->state) +
+				 __get_wq_offset(ce);
+		info->wq_desc_lo = lower_32_bits(wq_desc_offset);
+		info->wq_desc_hi = upper_32_bits(wq_desc_offset);
+		info->wq_base_lo = lower_32_bits(wq_base_offset);
+		info->wq_base_hi = upper_32_bits(wq_base_offset);
+		info->wq_size = WQ_SIZE;
+
+		wq_desc = __get_wq_desc(ce);
+		memset(wq_desc, 0, sizeof(*wq_desc));
+		wq_desc->wq_status = WQ_STATUS_ACTIVE;
+
+		/* FIXME: This needs to be updated for new v70 interface... */
+		//desc->priority = ce->guc_state.prio;
+		//guc_context_policy_init(engine, desc);
 
 		clear_children_join_go_memory(ce);
 	}
@@ -4360,17 +4339,17 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 		guc_log_context_priority(p, ce);
 
 		if (intel_context_is_parent(ce)) {
-			struct guc_process_desc *desc = __get_process_desc(ce);
+			struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
 			struct intel_context *child;
 
 			drm_printf(p, "\t\tNumber children: %u\n",
 				   ce->parallel.number_children);
 			drm_printf(p, "\t\tWQI Head: %u\n",
-				   READ_ONCE(desc->head));
+				   READ_ONCE(wq_desc->head));
 			drm_printf(p, "\t\tWQI Tail: %u\n",
-				   READ_ONCE(desc->tail));
+				   READ_ONCE(wq_desc->tail));
 			drm_printf(p, "\t\tWQI Status: %u\n\n",
-				   READ_ONCE(desc->wq_status));
+				   READ_ONCE(wq_desc->wq_status));
 
 			if (ce->engine->emit_bb_start ==
 			    emit_bb_start_parent_no_preempt_mid_batch) {
-- 
2.25.1

