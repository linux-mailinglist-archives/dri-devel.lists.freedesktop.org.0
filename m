Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5683F8125
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1EA6E4D2;
	Thu, 26 Aug 2021 03:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209016E4F4;
 Thu, 26 Aug 2021 03:28:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811084"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811084"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738597"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 27/27] drm/i915/guc: Drop static inline functions
 intel_guc_submission.c
Date: Wed, 25 Aug 2021 20:23:27 -0700
Message-Id: <20210826032327.18078-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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
index 3fe45eca95ff..f921763eb7a4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -144,7 +144,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
 
-static inline void init_sched_state(struct intel_context *ce)
+static void init_sched_state(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
@@ -161,14 +161,14 @@ static bool sched_state_is_init(struct intel_context *ce)
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
@@ -176,7 +176,7 @@ set_context_wait_for_deregister_to_register(struct intel_context *ce)
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
 
-static inline void
+static void
 clr_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
@@ -184,111 +184,111 @@ clr_context_wait_for_deregister_to_register(struct intel_context *ce)
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
 
@@ -297,7 +297,7 @@ static inline void incr_context_blocked(struct intel_context *ce)
 	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
 }
 
-static inline void decr_context_blocked(struct intel_context *ce)
+static void decr_context_blocked(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
@@ -306,41 +306,41 @@ static inline void decr_context_blocked(struct intel_context *ce)
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
@@ -354,7 +354,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
 	return &base[index];
 }
 
-static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
+static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
 {
 	struct intel_context *ce = xa_load(&guc->context_lookup, id);
 
@@ -384,12 +384,12 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
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
@@ -407,13 +407,13 @@ static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
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
 
@@ -576,13 +576,13 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
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
@@ -749,7 +749,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
-static inline bool
+static bool
 submission_disabled(struct intel_guc *guc)
 {
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
@@ -830,7 +830,7 @@ guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
 	return NULL;
 }
 
-static inline struct intel_engine_cs *
+static struct intel_engine_cs *
 __context_to_physical_engine(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
@@ -1146,9 +1146,9 @@ void intel_guc_submission_fini(struct intel_guc *guc)
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
@@ -1838,7 +1838,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	intel_context_sched_disable_unpin(ce);
 }
 
-static inline void guc_lrc_desc_unpin(struct intel_context *ce)
+static void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
@@ -1978,7 +1978,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
 	trace_intel_context_set_prio(ce);
 }
 
-static inline u8 map_i915_prio_to_guc_prio(int prio)
+static u8 map_i915_prio_to_guc_prio(int prio)
 {
 	if (prio == I915_PRIORITY_NORMAL)
 		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
@@ -1990,8 +1990,7 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
 		return GUC_CLIENT_PRIORITY_KMD_HIGH;
 }
 
-static inline void add_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void add_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
@@ -2002,8 +2001,7 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
 	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 }
 
-static inline void sub_context_inflight_prio(struct intel_context *ce,
-					     u8 guc_prio)
+static void sub_context_inflight_prio(struct intel_context *ce, u8 guc_prio)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
@@ -2014,7 +2012,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
 	--ce->guc_state.prio_count[guc_prio];
 }
 
-static inline void update_context_prio(struct intel_context *ce)
+static void update_context_prio(struct intel_context *ce)
 {
 	struct intel_guc *guc = &ce->engine->gt->uc.guc;
 	int i;
@@ -2032,7 +2030,7 @@ static inline void update_context_prio(struct intel_context *ce)
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
@@ -3085,8 +3083,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
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

