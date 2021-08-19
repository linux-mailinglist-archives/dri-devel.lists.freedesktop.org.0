Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF83F137B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAC36E993;
	Thu, 19 Aug 2021 06:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997D6E94D;
 Thu, 19 Aug 2021 06:21:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216220773"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216220773"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="511675192"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 27/27] drm/i915/guc: Drop static inline functions
 intel_guc_submission.c
Date: Wed, 18 Aug 2021 23:16:39 -0700
Message-Id: <20210819061639.21051-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819061639.21051-1-matthew.brost@intel.com>
References: <20210819061639.21051-1-matthew.brost@intel.com>
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

s/static inline/static/g + fix function argument alignment to make
checkpatch happy.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 116 +++++++++---------
 1 file changed, 57 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7e0a32e729c2..ad4420100908 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -139,7 +139,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 #define SCHED_STATE_BLOCKED_SHIFT			7
 #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
-static inline void init_sched_state(struct intel_context *ce)
+static void init_sched_state(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
@@ -156,14 +156,14 @@ static bool sched_state_is_init(struct intel_context *ce)
 		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
 }
 
-static inline bool
+static bool
 context_wait_for_deregister_to_register(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state &
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline void
+static void
 set_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
@@ -171,7 +171,7 @@ set_context_wait_for_deregister_to_register(struct intel_context *ce)
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline void
+static void
 clr_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
@@ -179,111 +179,111 @@ clr_context_wait_for_deregister_to_register(struct intel_context *ce)
 		~SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline bool
+static bool
 context_destroyed(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_DESTROYED;
 }
 
-static inline void
+static void
 set_context_destroyed(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
 }
 
-static inline bool context_pending_disable(struct intel_context *ce)
+static bool context_pending_disable(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
 }
 
-static inline void set_context_pending_disable(struct intel_context *ce)
+static void set_context_pending_disable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_PENDING_DISABLE;
 }
 
-static inline void clr_context_pending_disable(struct intel_context *ce)
+static void clr_context_pending_disable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
 }
 
-static inline bool context_banned(struct intel_context *ce)
+static bool context_banned(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
 }
 
-static inline void set_context_banned(struct intel_context *ce)
+static void set_context_banned(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
 }
 
-static inline void clr_context_banned(struct intel_context *ce)
+static void clr_context_banned(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
 }
 
-static inline bool context_enabled(struct intel_context *ce)
+static bool context_enabled(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_ENABLED;
 }
 
-static inline void set_context_enabled(struct intel_context *ce)
+static void set_context_enabled(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_ENABLED;
 }
 
-static inline void clr_context_enabled(struct intel_context *ce)
+static void clr_context_enabled(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= ~SCHED_STATE_ENABLED;
 }
 
-static inline bool context_pending_enable(struct intel_context *ce)
+static bool context_pending_enable(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_PENDING_ENABLE;
 }
 
-static inline void set_context_pending_enable(struct intel_context *ce)
+static void set_context_pending_enable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_PENDING_ENABLE;
 }
 
-static inline void clr_context_pending_enable(struct intel_context *ce)
+static void clr_context_pending_enable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_ENABLE;
 }
 
-static inline bool context_registered(struct intel_context *ce)
+static bool context_registered(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_REGISTERED;
 }
 
-static inline void set_context_registered(struct intel_context *ce)
+static void set_context_registered(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state |= SCHED_STATE_REGISTERED;
 }
 
-static inline void clr_context_registered(struct intel_context *ce)
+static void clr_context_registered(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
 }
 
-static inline u32 context_blocked(struct intel_context *ce)
+static u32 context_blocked(struct intel_context *ce)
 {
 	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
 		SCHED_STATE_BLOCKED_SHIFT;
 }
 
-static inline void incr_context_blocked(struct intel_context *ce)
+static void incr_context_blocked(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
@@ -292,7 +292,7 @@ static inline void incr_context_blocked(struct intel_context *ce)
 	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
 }
 
-static inline void decr_context_blocked(struct intel_context *ce)
+static void decr_context_blocked(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
@@ -301,41 +301,41 @@ static inline void decr_context_blocked(struct intel_context *ce)
 	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
 }
 
-static inline bool context_has_committed_requests(struct intel_context *ce)
+static bool context_has_committed_requests(struct intel_context *ce)
 {
 	return !!ce->guc_state.number_committed_requests;
 }
 
-static inline void incr_context_committed_requests(struct intel_context *ce)
+static void incr_context_committed_requests(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	++ce->guc_state.number_committed_requests;
 	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
 }
 
-static inline void decr_context_committed_requests(struct intel_context *ce)
+static void decr_context_committed_requests(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	--ce->guc_state.number_committed_requests;
 	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
 }
 
-static inline bool context_guc_id_invalid(struct intel_context *ce)
+static bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return ce->guc_id.id == GUC_INVALID_LRC_ID;
 }
 
-static inline void set_context_guc_id_invalid(struct intel_context *ce)
+static void set_context_guc_id_invalid(struct intel_context *ce)
 {
 	ce->guc_id.id = GUC_INVALID_LRC_ID;
 }
 
-static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
+static struct intel_guc *ce_to_guc(struct intel_context *ce)
 {
 	return &ce->engine->gt->uc.guc;
 }
 
-static inline struct i915_priolist *to_priolist(struct rb_node *rb)
+static struct i915_priolist *to_priolist(struct rb_node *rb)
 {
 	return rb_entry(rb, struct i915_priolist, node);
 }
@@ -349,7 +349,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 	return &base[index];
 }
 
-static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
+static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
@@ -379,12 +379,12 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
-static inline bool guc_submission_initialized(struct intel_guc *guc)
+static bool guc_submission_initialized(struct intel_guc *guc)
 {
 	return !!guc->lrc_desc_pool_vaddr;
 }
 
-static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
+static void reset_lrc_desc(struct intel_guc *guc, u32 id)
 {
 	if (likely(guc_submission_initialized(guc))) {
 		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
@@ -402,13 +402,13 @@ static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
 	}
 }
 
-static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
+static bool lrc_desc_registered(struct intel_guc *guc, u32 id)
 {
 	return __get_context(guc, id);
 }
 
-static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
-					   struct intel_context *ce)
+static void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
+				    struct intel_context *ce)
 {
 	unsigned long flags;
 
@@ -572,13 +572,13 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	return err;
 }
 
-static inline void guc_set_lrc_tail(struct i915_request *rq)
+static void guc_set_lrc_tail(struct i915_request *rq)
 {
 	rq->context->lrc_reg_state[CTX_RING_TAIL] =
 		intel_ring_set_tail(rq->ring, rq->tail);
 }
 
-static inline int rq_prio(const struct i915_request *rq)
+static int rq_prio(const struct i915_request *rq)
 {
 	return rq->sched.attr.priority;
 }
@@ -745,7 +745,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
-static inline bool
+static bool
 submission_disabled(struct intel_guc *guc)
 {
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
@@ -826,7 +826,7 @@ guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
 	return NULL;
 }
 
-static inline struct intel_engine_cs *
+static struct intel_engine_cs *
 __context_to_physical_engine(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
@@ -1144,9 +1144,9 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	i915_sched_engine_put(guc->sched_engine);
 }
 
-static inline void queue_request(struct i915_sched_engine *sched_engine,
-				 struct i915_request *rq,
-				 int prio)
+static void queue_request(struct i915_sched_engine *sched_engine,
+			  struct i915_request *rq,
+			  int prio)
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
@@ -1842,7 +1842,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	intel_context_sched_disable_unpin(ce);
 }
 
-static inline void guc_lrc_desc_unpin(struct intel_context *ce)
+static void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
@@ -1982,7 +1982,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
 	trace_intel_context_set_prio(ce);
 }
 
-static inline u8 map_i915_prio_to_guc_prio(int prio)
+static u8 map_i915_prio_to_guc_prio(int prio)
 {
 	if (prio == I915_PRIORITY_NORMAL)
 		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
@@ -1994,8 +1994,7 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
 		return GUC_CLIENT_PRIORITY_KMD_HIGH;
 }
 
-static inline void add_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void add_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
@@ -2006,8 +2005,7 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
 	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 }
 
-static inline void sub_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void sub_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
@@ -2018,7 +2016,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
 	--ce->guc_state.prio_count[guc_prio];
 }
 
-static inline void update_context_prio(struct intel_context *ce)
+static void update_context_prio(struct intel_context *ce)
 {
 	struct intel_guc *guc = &ce->engine->gt->uc.guc;
 	int i;
@@ -2036,7 +2034,7 @@ static inline void update_context_prio(struct intel_context *ce)
 	}
 }
 
-static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
+static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
 {
 	/* Lower value is higher priority */
 	return new_guc_prio < old_guc_prio;
@@ -2506,15 +2504,15 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 	engine->submit_request = guc_submit_request;
 }
 
-static inline void guc_kernel_context_pin(struct intel_guc *guc,
-					  struct intel_context *ce)
+static void guc_kernel_context_pin(struct intel_guc *guc,
+				   struct intel_context *ce)
 {
 	if (context_guc_id_invalid(ce))
 		pin_guc_id(guc, ce);
 	guc_lrc_desc_pin(ce, true);
 }
 
-static inline void guc_init_lrc_mapping(struct intel_guc *guc)
+static void guc_init_lrc_mapping(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -2617,7 +2615,7 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 	}
 }
 
-static inline void guc_default_irqs(struct intel_engine_cs *engine)
+static void guc_default_irqs(struct intel_engine_cs *engine)
 {
 	engine->irq_keep_mask = GT_RENDER_USER_INTERRUPT;
 	intel_engine_set_irq_handler(engine, cs_irq_handler);
@@ -2713,7 +2711,7 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
-static inline struct intel_context *
+static struct intel_context *
 g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 {
 	struct intel_context *ce;
@@ -3086,8 +3084,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 	drm_printf(p, "\n");
 }
 
-static inline void guc_log_context_priority(struct drm_printer *p,
-					    struct intel_context *ce)
+static void guc_log_context_priority(struct drm_printer *p,
+				     struct intel_context *ce)
 {
 	int i;
 
-- 
2.32.0

