Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29B3F137E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708E76E973;
	Thu, 19 Aug 2021 06:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89C6E4B5;
 Thu, 19 Aug 2021 06:21:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216220765"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216220765"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="511675184"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 20/27] drm/i915/guc: Rework and simplify locking
Date: Wed, 18 Aug 2021 23:16:32 -0700
Message-Id: <20210819061639.21051-21-matthew.brost@intel.com>
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

Rework and simplify the locking with GuC subission. Drop
sched_state_no_lock and move all fields under the guc_state.sched_state
and protect all these fields with guc_state.lock . This requires
changing the locking hierarchy from guc_state.lock -> sched_engine.lock
to sched_engine.lock -> guc_state.lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   5 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 186 ++++++++----------
 drivers/gpu/drm/i915/i915_trace.h             |   6 +-
 3 files changed, 89 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index c06171ee8792..d5d643b04d54 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -161,7 +161,7 @@ struct intel_context {
 		 * sched_state: scheduling state of this context using GuC
 		 * submission
 		 */
-		u16 sched_state;
+		u32 sched_state;
 		/*
 		 * fences: maintains of list of requests that have a submit
 		 * fence related to GuC submission
@@ -178,9 +178,6 @@ struct intel_context {
 		struct list_head requests;
 	} guc_active;
 
-	/* GuC scheduling state flags that do not require a lock. */
-	atomic_t guc_sched_state_no_lock;
-
 	/* GuC LRC descriptor ID */
 	u16 guc_id;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 053f4485d6e9..509b298e7cf3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -72,86 +72,23 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
-/*
- * Below is a set of functions which control the GuC scheduling state which do
- * not require a lock as all state transitions are mutually exclusive. i.e. It
- * is not possible for the context pinning code and submission, for the same
- * context, to be executing simultaneously. We still need an atomic as it is
- * possible for some of the bits to changing at the same time though.
- */
-#define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
-#define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
-#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
-static inline bool context_enabled(struct intel_context *ce)
-{
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_ENABLED);
-}
-
-static inline void set_context_enabled(struct intel_context *ce)
-{
-	atomic_or(SCHED_STATE_NO_LOCK_ENABLED, &ce->guc_sched_state_no_lock);
-}
-
-static inline void clr_context_enabled(struct intel_context *ce)
-{
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
-		   &ce->guc_sched_state_no_lock);
-}
-
-static inline bool context_pending_enable(struct intel_context *ce)
-{
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_PENDING_ENABLE);
-}
-
-static inline void set_context_pending_enable(struct intel_context *ce)
-{
-	atomic_or(SCHED_STATE_NO_LOCK_PENDING_ENABLE,
-		  &ce->guc_sched_state_no_lock);
-}
-
-static inline void clr_context_pending_enable(struct intel_context *ce)
-{
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_PENDING_ENABLE,
-		   &ce->guc_sched_state_no_lock);
-}
-
-static inline bool context_registered(struct intel_context *ce)
-{
-	return (atomic_read(&ce->guc_sched_state_no_lock) &
-		SCHED_STATE_NO_LOCK_REGISTERED);
-}
-
-static inline void set_context_registered(struct intel_context *ce)
-{
-	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
-		  &ce->guc_sched_state_no_lock);
-}
-
-static inline void clr_context_registered(struct intel_context *ce)
-{
-	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
-		   &ce->guc_sched_state_no_lock);
-}
-
 /*
  * Below is a set of functions which control the GuC scheduling state which
- * require a lock, aside from the special case where the functions are called
- * from guc_lrc_desc_pin(). In that case it isn't possible for any other code
- * path to be executing on the context.
+ * require a lock.
  */
 #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
 #define SCHED_STATE_DESTROYED				BIT(1)
 #define SCHED_STATE_PENDING_DISABLE			BIT(2)
 #define SCHED_STATE_BANNED				BIT(3)
-#define SCHED_STATE_BLOCKED_SHIFT			4
+#define SCHED_STATE_ENABLED				BIT(4)
+#define SCHED_STATE_PENDING_ENABLE			BIT(5)
+#define SCHED_STATE_REGISTERED				BIT(6)
+#define SCHED_STATE_BLOCKED_SHIFT			7
 #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
 static inline void init_sched_state(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
-	atomic_set(&ce->guc_sched_state_no_lock, 0);
 	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
 }
 
@@ -162,9 +99,8 @@ static bool sched_state_is_init(struct intel_context *ce)
 	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
 	 * suspend.
 	 */
-	return !(atomic_read(&ce->guc_sched_state_no_lock) &
-		 ~SCHED_STATE_NO_LOCK_REGISTERED) &&
-		!(ce->guc_state.sched_state &= ~SCHED_STATE_BLOCKED_MASK);
+	return !(ce->guc_state.sched_state &=
+		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
 }
 
 static inline bool
@@ -237,6 +173,57 @@ static inline void clr_context_banned(struct intel_context *ce)
 	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
 }
 
+static inline bool context_enabled(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_ENABLED;
+}
+
+static inline void set_context_enabled(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_ENABLED;
+}
+
+static inline void clr_context_enabled(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_ENABLED;
+}
+
+static inline bool context_pending_enable(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_PENDING_ENABLE;
+}
+
+static inline void set_context_pending_enable(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_PENDING_ENABLE;
+}
+
+static inline void clr_context_pending_enable(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_ENABLE;
+}
+
+static inline bool context_registered(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_REGISTERED;
+}
+
+static inline void set_context_registered(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_REGISTERED;
+}
+
+static inline void clr_context_registered(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
+}
+
 static inline u32 context_blocked(struct intel_context *ce)
 {
 	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
@@ -245,7 +232,6 @@ static inline u32 context_blocked(struct intel_context *ce)
 
 static inline void incr_context_blocked(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->engine->sched_engine->lock);
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	ce->guc_state.sched_state += SCHED_STATE_BLOCKED;
@@ -255,7 +241,6 @@ static inline void incr_context_blocked(struct intel_context *ce)
 
 static inline void decr_context_blocked(struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->engine->sched_engine->lock);
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	GEM_BUG_ON(!context_blocked(ce));	/* Underflow check */
@@ -450,6 +435,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	u32 g2h_len_dw = 0;
 	bool enabled;
 
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+
 	/*
 	 * Corner case where requests were sitting in the priority list or a
 	 * request resubmitted after the context was banned.
@@ -457,7 +444,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	if (unlikely(intel_context_is_banned(ce))) {
 		i915_request_put(i915_request_mark_eio(rq));
 		intel_engine_signal_breadcrumbs(ce->engine);
-		goto out;
+		return 0;
 	}
 
 	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
@@ -470,9 +457,11 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
 		err = guc_lrc_desc_pin(ce, false);
 		if (unlikely(err))
-			goto out;
+			return err;
 	}
 
+	spin_lock(&ce->guc_state.lock);
+
 	/*
 	 * The request / context will be run on the hardware when scheduling
 	 * gets enabled in the unblock.
@@ -507,6 +496,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		trace_i915_request_guc_submit(rq);
 
 out:
+	spin_unlock(&ce->guc_state.lock);
 	return err;
 }
 
@@ -727,8 +717,6 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
 	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
 
-	guc_flush_submissions(guc);
-
 	flush_work(&guc->ct.requests.worker);
 
 	scrub_guc_desc_for_outstanding_g2h(guc);
@@ -1133,7 +1121,11 @@ static int steal_guc_id(struct intel_guc *guc)
 
 		list_del_init(&ce->guc_id_link);
 		guc_id = ce->guc_id;
+
+		spin_lock(&ce->guc_state.lock);
 		clr_context_registered(ce);
+		spin_unlock(&ce->guc_state.lock);
+
 		set_context_guc_id_invalid(ce);
 		return guc_id;
 	} else {
@@ -1169,6 +1161,8 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 try_again:
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 
+	might_lock(&ce->guc_state.lock);
+
 	if (context_guc_id_invalid(ce)) {
 		ret = assign_guc_id(guc, &ce->guc_id);
 		if (ret)
@@ -1248,8 +1242,13 @@ static int register_context(struct intel_context *ce, bool loop)
 	trace_intel_context_register(ce);
 
 	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
-	if (likely(!ret))
+	if (likely(!ret)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		set_context_registered(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	}
 
 	return ret;
 }
@@ -1525,7 +1524,6 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
 static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
 	unsigned long flags;
 	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
 	intel_wakeref_t wakeref;
@@ -1534,13 +1532,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
-	/*
-	 * Sync with submission path, increment before below changes to context
-	 * state.
-	 */
-	spin_lock(&sched_engine->lock);
 	incr_context_blocked(ce);
-	spin_unlock(&sched_engine->lock);
 
 	enabled = context_enabled(ce);
 	if (unlikely(!enabled || submission_disabled(guc))) {
@@ -1569,7 +1561,6 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 static void guc_context_unblock(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
 	unsigned long flags;
 	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
 	intel_wakeref_t wakeref;
@@ -1594,13 +1585,7 @@ static void guc_context_unblock(struct intel_context *ce)
 		intel_context_get(ce);
 	}
 
-	/*
-	 * Sync with submission path, decrement after above changes to context
-	 * state.
-	 */
-	spin_lock(&sched_engine->lock);
 	decr_context_blocked(ce);
-	spin_unlock(&sched_engine->lock);
 
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
@@ -1710,7 +1695,9 @@ static void guc_context_sched_disable(struct intel_context *ce)
 
 	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
 	    !lrc_desc_registered(guc, ce->guc_id)) {
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		clr_context_enabled(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		goto unpin;
 	}
 
@@ -1760,7 +1747,6 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
 	GEM_BUG_ON(context_enabled(ce));
 
-	clr_context_registered(ce);
 	deregister_context(ce, ce->guc_id, true);
 }
 
@@ -1833,8 +1819,10 @@ static void guc_context_destroy(struct kref *kref)
 	/* Seal race with Reset */
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	disabled = submission_disabled(guc);
-	if (likely(!disabled))
+	if (likely(!disabled)) {
 		set_context_destroyed(ce);
+		clr_context_registered(ce);
+	}
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	if (unlikely(disabled)) {
 		release_guc_id(guc, ce);
@@ -2697,8 +2685,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, 0x%x, desc_idx %u",
-			atomic_read(&ce->guc_sched_state_no_lock),
+			"Bad context sched_state 0x%x, desc_idx %u",
 			ce->guc_state.sched_state, desc_idx);
 		return -EPROTO;
 	}
@@ -2713,7 +2700,9 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		}
 #endif
 
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		clr_context_pending_enable(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	} else if (context_pending_disable(ce)) {
 		bool banned;
 
@@ -2987,9 +2976,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 			   atomic_read(&ce->pin_count));
 		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
 			   atomic_read(&ce->guc_id_ref));
-		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
-			   ce->guc_state.sched_state,
-			   atomic_read(&ce->guc_sched_state_no_lock));
+		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
+			   ce->guc_state.sched_state);
 
 		guc_log_context_priority(p, ce);
 	}
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 806ad688274b..0a77eb2944b5 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -903,7 +903,6 @@ DECLARE_EVENT_CLASS(intel_context,
 			     __field(u32, guc_id)
 			     __field(int, pin_count)
 			     __field(u32, sched_state)
-			     __field(u32, guc_sched_state_no_lock)
 			     __field(u8, guc_prio)
 			     ),
 
@@ -911,15 +910,12 @@ DECLARE_EVENT_CLASS(intel_context,
 			   __entry->guc_id = ce->guc_id;
 			   __entry->pin_count = atomic_read(&ce->pin_count);
 			   __entry->sched_state = ce->guc_state.sched_state;
-			   __entry->guc_sched_state_no_lock =
-			   atomic_read(&ce->guc_sched_state_no_lock);
 			   __entry->guc_prio = ce->guc_prio;
 			   ),
 
-		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
+		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
 			      __entry->guc_id, __entry->pin_count,
 			      __entry->sched_state,
-			      __entry->guc_sched_state_no_lock,
 			      __entry->guc_prio)
 );
 
-- 
2.32.0

