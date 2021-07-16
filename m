Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A13CBD63
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCA86E9F5;
	Fri, 16 Jul 2021 19:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACC06EA09;
 Fri, 16 Jul 2021 19:59:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596757"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596757"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507239039"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 43/51] drm/i915/guc: Support request cancellation
Date: Fri, 16 Jul 2021 13:17:16 -0700
Message-Id: <20210716201724.54804-44-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds GuC backend support for i915_request_cancel(), which in turn
makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   9 +
 drivers/gpu/drm/i915/gt/intel_context.h       |   7 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
 .../drm/i915/gt/intel_execlists_submission.c  |  18 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 169 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.c           |  14 +-
 6 files changed, 211 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index dd078a80c3a3..b1e3d00fb1f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -366,6 +366,12 @@ static int __intel_context_active(struct i915_active *active)
 	return 0;
 }
 
+static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
+				 enum i915_sw_fence_notify state)
+{
+	return NOTIFY_DONE;
+}
+
 void
 intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 {
@@ -399,6 +405,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->guc_id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id_link);
 
+	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
+	i915_sw_fence_commit(&ce->guc_blocked);
+
 	i915_active_init(&ce->active,
 			 __intel_context_active, __intel_context_retire, 0);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 814d9277096a..876bdb08303c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -70,6 +70,13 @@ intel_context_is_pinned(struct intel_context *ce)
 	return atomic_read(&ce->pin_count);
 }
 
+static inline void intel_context_cancel_request(struct intel_context *ce,
+						struct i915_request *rq)
+{
+	GEM_BUG_ON(!ce->ops->cancel_request);
+	return ce->ops->cancel_request(ce, rq);
+}
+
 /**
  * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
  * @ce - the context
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 57c19ee3e313..005a64f2afa7 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 
 #include "i915_active_types.h"
+#include "i915_sw_fence.h"
 #include "i915_utils.h"
 #include "intel_engine_types.h"
 #include "intel_sseu.h"
@@ -42,6 +43,9 @@ struct intel_context_ops {
 	void (*unpin)(struct intel_context *ce);
 	void (*post_unpin)(struct intel_context *ce);
 
+	void (*cancel_request)(struct intel_context *ce,
+			       struct i915_request *rq);
+
 	void (*enter)(struct intel_context *ce);
 	void (*exit)(struct intel_context *ce);
 
@@ -184,6 +188,9 @@ struct intel_context {
 	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
 	 */
 	struct list_head guc_id_link;
+
+	/* GuC context blocked fence */
+	struct i915_sw_fence guc_blocked;
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index f9b5f54a5abe..8f6dc0fb49a6 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -114,6 +114,7 @@
 #include "gen8_engine_cs.h"
 #include "intel_breadcrumbs.h"
 #include "intel_context.h"
+#include "intel_engine_heartbeat.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_stats.h"
 #include "intel_execlists_submission.h"
@@ -2536,11 +2537,26 @@ static int execlists_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void execlists_context_cancel_request(struct intel_context *ce,
+					     struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = NULL;
+
+	i915_request_active_engine(rq, &engine);
+
+	if (engine && intel_engine_pulse(engine))
+		intel_gt_handle_error(engine->gt, engine->mask, 0,
+				      "request cancellation by %s",
+				      current->comm);
+}
+
 static const struct intel_context_ops execlists_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
 	.alloc = execlists_context_alloc,
 
+	.cancel_request = execlists_context_cancel_request,
+
 	.pre_pin = execlists_context_pre_pin,
 	.pin = execlists_context_pin,
 	.unpin = lrc_unpin,
@@ -3558,6 +3574,8 @@ static const struct intel_context_ops virtual_context_ops = {
 
 	.alloc = virtual_context_alloc,
 
+	.cancel_request = execlists_context_cancel_request,
+
 	.pre_pin = virtual_context_pre_pin,
 	.pin = virtual_context_pin,
 	.unpin = lrc_unpin,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 149990196e3a..1c30d04733ff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -81,6 +81,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
  */
 #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
 #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
+#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		2
+#define SCHED_STATE_NO_LOCK_BLOCKED \
+	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
+#define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
+	(0xffff << SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
 static inline bool context_enabled(struct intel_context *ce)
 {
 	return (atomic_read(&ce->guc_sched_state_no_lock) &
@@ -116,6 +121,27 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
 		   &ce->guc_sched_state_no_lock);
 }
 
+static inline u32 context_blocked(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_BLOCKED_MASK) >>
+		SCHED_STATE_NO_LOCK_BLOCKED_SHIFT;
+}
+
+static inline void incr_context_blocked(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->engine->sched_engine->lock);
+	atomic_add(SCHED_STATE_NO_LOCK_BLOCKED,
+		   &ce->guc_sched_state_no_lock);
+}
+
+static inline void decr_context_blocked(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->engine->sched_engine->lock);
+	atomic_sub(SCHED_STATE_NO_LOCK_BLOCKED,
+		   &ce->guc_sched_state_no_lock);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock, aside from the special case where the functions are called
@@ -403,6 +429,10 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		if (unlikely(err))
 			goto out;
 	}
+
+	if (unlikely(context_blocked(ce)))
+		goto out;
+
 	enabled = context_enabled(ce);
 
 	if (!enabled) {
@@ -531,6 +561,7 @@ static void __guc_context_destroy(struct intel_context *ce);
 static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
 static void guc_signal_context_fence(struct intel_context *ce);
 static void guc_cancel_context_requests(struct intel_context *ce);
+static void guc_blocked_fence_complete(struct intel_context *ce);
 
 static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 {
@@ -578,6 +609,10 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 			}
 			intel_context_sched_disable_unpin(ce);
 			atomic_dec(&guc->outstanding_submission_g2h);
+			spin_lock_irqsave(&ce->guc_state.lock, flags);
+			guc_blocked_fence_complete(ce);
+			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
 			intel_context_put(ce);
 		}
 	}
@@ -1339,6 +1374,21 @@ static void guc_context_post_unpin(struct intel_context *ce)
 	lrc_post_unpin(ce);
 }
 
+static void __guc_context_sched_enable(struct intel_guc *guc,
+				       struct intel_context *ce)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
+		ce->guc_id,
+		GUC_CONTEXT_ENABLE
+	};
+
+	trace_intel_context_sched_enable(ce);
+
+	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
+				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
+}
+
 static void __guc_context_sched_disable(struct intel_guc *guc,
 					struct intel_context *ce,
 					u16 guc_id)
@@ -1357,17 +1407,131 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
 }
 
+static void guc_blocked_fence_complete(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+
+	if (!i915_sw_fence_done(&ce->guc_blocked))
+		i915_sw_fence_complete(&ce->guc_blocked);
+}
+
+static void guc_blocked_fence_reinit(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
+	i915_sw_fence_fini(&ce->guc_blocked);
+	i915_sw_fence_reinit(&ce->guc_blocked);
+	i915_sw_fence_await(&ce->guc_blocked);
+	i915_sw_fence_commit(&ce->guc_blocked);
+}
+
 static u16 prep_context_pending_disable(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	set_context_pending_disable(ce);
 	clr_context_enabled(ce);
+	guc_blocked_fence_reinit(ce);
 	intel_context_get(ce);
 
 	return ce->guc_id;
 }
 
+static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+	unsigned long flags;
+	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
+	intel_wakeref_t wakeref;
+	u16 guc_id;
+	bool enabled;
+
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	incr_context_blocked(ce);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	enabled = context_enabled(ce);
+	if (unlikely(!enabled || submission_disabled(guc))) {
+		if (enabled)
+			clr_context_enabled(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return &ce->guc_blocked;
+	}
+
+	/*
+	 * We add +2 here as the schedule disable complete CTB handler calls
+	 * intel_context_sched_disable_unpin (-2 to pin_count).
+	 */
+	atomic_add(2, &ce->pin_count);
+
+	guc_id = prep_context_pending_disable(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_disable(guc, ce, guc_id);
+
+	return &ce->guc_blocked;
+}
+
+static void guc_context_unblock(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+	unsigned long flags;
+	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
+	intel_wakeref_t wakeref;
+
+	GEM_BUG_ON(context_enabled(ce));
+
+	if (unlikely(context_blocked(ce) > 1)) {
+		spin_lock_irqsave(&sched_engine->lock, flags);
+		if (likely(context_blocked(ce) > 1))
+			goto decrement;
+		spin_unlock_irqrestore(&sched_engine->lock, flags);
+	}
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (unlikely(submission_disabled(guc) ||
+		     !intel_context_is_pinned(ce) ||
+		     context_pending_disable(ce) ||
+		     context_blocked(ce) > 1)) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		goto out;
+	}
+
+	set_context_pending_enable(ce);
+	set_context_enabled(ce);
+	intel_context_get(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_enable(guc, ce);
+
+out:
+	spin_lock_irqsave(&sched_engine->lock, flags);
+decrement:
+	decr_context_blocked(ce);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+}
+
+static void guc_context_cancel_request(struct intel_context *ce,
+				       struct i915_request *rq)
+{
+	if (i915_sw_fence_signaled(&rq->submit)) {
+		struct i915_sw_fence *fence = guc_context_block(ce);
+
+		i915_sw_fence_wait(fence);
+		if (!i915_request_completed(rq)) {
+			__i915_request_skip(rq);
+			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
+					true);
+		}
+		guc_context_unblock(ce);
+	}
+}
+
 static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 						 u16 guc_id,
 						 u32 preemption_timeout)
@@ -1626,6 +1790,8 @@ static const struct intel_context_ops guc_context_ops = {
 
 	.ban = guc_context_ban,
 
+	.cancel_request = guc_context_cancel_request,
+
 	.enter = intel_context_enter_engine,
 	.exit = intel_context_exit_engine,
 
@@ -1821,6 +1987,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.ban = guc_context_ban,
 
+	.cancel_request = guc_context_cancel_request,
+
 	.enter = guc_virtual_context_enter,
 	.exit = guc_virtual_context_exit,
 
@@ -2290,6 +2458,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		clr_context_banned(ce);
 		clr_context_pending_disable(ce);
 		__guc_signal_context_fence(ce);
+		guc_blocked_fence_complete(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		if (banned) {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index eb109f93ebcb..f3552642b8a1 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -708,18 +708,6 @@ void i915_request_unsubmit(struct i915_request *request)
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
-static void __cancel_request(struct i915_request *rq)
-{
-	struct intel_engine_cs *engine = NULL;
-
-	i915_request_active_engine(rq, &engine);
-
-	if (engine && intel_engine_pulse(engine))
-		intel_gt_handle_error(engine->gt, engine->mask, 0,
-				      "request cancellation by %s",
-				      current->comm);
-}
-
 void i915_request_cancel(struct i915_request *rq, int error)
 {
 	if (!i915_request_set_error_once(rq, error))
@@ -727,7 +715,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
 
 	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
 
-	__cancel_request(rq);
+	intel_context_cancel_request(rq->context, rq);
 }
 
 static int __i915_sw_fence_call
-- 
2.28.0

