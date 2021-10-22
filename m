Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C44743701A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 04:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E66E52E;
	Fri, 22 Oct 2021 02:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C6B6E527;
 Fri, 22 Oct 2021 02:40:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252707257"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="252707257"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="527768610"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Subject: [PATCH 2/2] drm/i915/guc: Add delay to disable scheduling after pin
 count goes to zero
Date: Thu, 21 Oct 2021 19:35:38 -0700
Message-Id: <20211022023538.20908-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211022023538.20908-1-matthew.brost@intel.com>
References: <20211022023538.20908-1-matthew.brost@intel.com>
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

Add a delay, configurable via debugs (default 100ms), to disable
scheduling of a context after the pin count goes to zero. Disable
scheduling is somewhat costly operation so the idea is a delay allows
the resubmit something before doing this operation. This delay is only
done if the context isn't close and less than 3/4 of the guc_ids are in
use.

As temporary WA disable this feature for the selftests. Selftests are
very timing sensitive and any change in timing can cause failure. A
follow up patch will fixup the selftests to understand this delay.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   9 ++
 drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  10 ++
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |  28 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 127 ++++++++++++++----
 drivers/gpu/drm/i915/i915_selftest.h          |   2 +
 drivers/gpu/drm/i915/i915_trace.h             |  10 ++
 8 files changed, 170 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ebd775cb1661..761d25d11864 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1393,7 +1393,7 @@ static void engines_idle_release(struct i915_gem_context *ctx,
 		int err;
 
 		/* serialises with execbuf */
-		set_bit(CONTEXT_CLOSED_BIT, &ce->flags);
+		intel_context_close(ce);
 		if (!intel_context_pin_if_active(ce))
 			continue;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 246c37d72cd7..291b6d0d49c3 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -273,6 +273,15 @@ static inline bool intel_context_is_barrier(const struct intel_context *ce)
 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
 }
 
+static inline void intel_context_close(struct intel_context *ce)
+{
+	set_bit(CONTEXT_CLOSED_BIT, &ce->flags);
+
+	trace_intel_context_close(ce);
+	if (ce->ops->close)
+		ce->ops->close(ce);
+}
+
 static inline bool intel_context_is_closed(const struct intel_context *ce)
 {
 	return test_bit(CONTEXT_CLOSED_BIT, &ce->flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 9e0177dc5484..3874a4efcda0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -38,6 +38,7 @@ struct intel_context_ops {
 	int (*alloc)(struct intel_context *ce);
 
 	void (*ban)(struct intel_context *ce, struct i915_request *rq);
+	void (*close)(struct intel_context *ce);
 
 	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
 	int (*pin)(struct intel_context *ce, void *vaddr);
@@ -225,6 +226,12 @@ struct intel_context {
 	 */
 	struct list_head destroyed_link;
 
+	/**
+	 * @guc_sched_disable_delay: worker to disable scheduling on this
+	 * context
+	 */
+	struct delayed_work guc_sched_disable_delay;
+
 	/** @parallel: sub-structure for parallel submission members */
 	struct {
 		union {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 31cf9fb48c7e..5d651f876dd7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -103,6 +103,10 @@ struct intel_guc {
 		 * refs
 		 */
 		struct list_head guc_id_list;
+		/**
+		 * @guc_ids_in_use: Number single-lrc guc_ids in use
+		 */
+		u16 guc_ids_in_use;
 		/**
 		 * @destroyed_contexts: list of contexts waiting to be destroyed
 		 * (deregistered with the GuC)
@@ -114,6 +118,12 @@ struct intel_guc {
 		 * function as it might be in an atomic context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
+#define SCHED_DISABLE_DELAY_MS	100
+		/**
+		 * @sched_disable_delay_ms: schedule disable delay, in ms, for
+		 * contexts
+		 */
+		u64 sched_disable_delay_ms;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index 25f09a420561..28470fc67b6d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -71,12 +71,40 @@ static bool intel_eval_slpc_support(void *data)
 	return intel_guc_slpc_is_used(guc);
 }
 
+static int guc_sched_disable_delay_ms_get(void *data, u64 *val)
+{
+	struct intel_guc *guc = data;
+
+	if (!intel_guc_submission_is_used(guc))
+		return -ENODEV;
+
+	*val = guc->submission_state.sched_disable_delay_ms;
+
+	return 0;
+}
+
+static int guc_sched_disable_delay_ms_set(void *data, u64 val)
+{
+	struct intel_guc *guc = data;
+
+	if (!intel_guc_submission_is_used(guc))
+		return -ENODEV;
+
+	guc->submission_state.sched_disable_delay_ms = val;
+
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(guc_sched_disable_delay_ms_fops,
+			guc_sched_disable_delay_ms_get,
+			guc_sched_disable_delay_ms_set, "%lld\n");
+
 void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "guc_info", &guc_info_fops, NULL },
 		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
 		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
+		{ "guc_sched_disable_delay_ms", &guc_sched_disable_delay_ms_fops, NULL },
 	};
 
 	if (!intel_guc_is_supported(guc))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d7710debcd47..9e5fef453f8c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -60,7 +60,13 @@
  * corresponding G2H returns indicating the scheduling disable operation has
  * completed it is safe to unpin the context. While a disable is in flight it
  * isn't safe to resubmit the context so a fence is used to stall all future
- * requests of that context until the G2H is returned.
+ * requests of that context until the G2H is returned. Because this interaction
+ * with the GuC takes a non-zero amount of time / GuC cycles we delay the
+ * disabling of scheduling after the pin count goes to zero by configurable
+ * (default 100 ms) period of time. The thought is this gives the user a window
+ * of time to resubmit something on the context before doing a somewhat costly
+ * operation. This delay is only done if the context is close and less than 3/4
+ * of the guc_ids are in use.
  *
  * Context deregistration:
  * Before a context can be destroyed or if we steal its guc_id we must
@@ -1506,6 +1512,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
+	guc->submission_state.sched_disable_delay_ms = SCHED_DISABLE_DELAY_MS;
 
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
@@ -1610,6 +1617,9 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	if (unlikely(ret < 0))
 		return ret;
 
+	if (!intel_context_is_parent(ce))
+		guc->submission_state.guc_ids_in_use++;
+
 	ce->guc_id.id = ret;
 	return 0;
 }
@@ -1619,14 +1629,16 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	GEM_BUG_ON(intel_context_is_child(ce));
 
 	if (!context_guc_id_invalid(ce)) {
-		if (intel_context_is_parent(ce))
+		if (intel_context_is_parent(ce)) {
 			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
 					      ce->guc_id.id,
 					      order_base_2(ce->parallel.number_children
 							   + 1));
-		else
+		} else {
+			guc->submission_state.guc_ids_in_use--;
 			ida_simple_remove(&guc->submission_state.guc_ids,
 					  ce->guc_id.id);
+		}
 		reset_lrc_desc(guc, ce->guc_id.id);
 		set_context_guc_id_invalid(ce);
 	}
@@ -2329,41 +2341,98 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	}
 }
 
-static void guc_context_sched_disable(struct intel_context *ce)
+static void do_sched_disable(struct intel_guc *guc, struct intel_context *ce,
+			     unsigned long flags)
+	__releases(ce->guc_state.lock)
 {
-	struct intel_guc *guc = ce_to_guc(ce);
-	unsigned long flags;
 	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
 	intel_wakeref_t wakeref;
 	u16 guc_id;
 
+	lockdep_assert_held(&ce->guc_state.lock);
+	guc_id = prep_context_pending_disable(ce);
+
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_disable(guc, ce, guc_id);
+}
+
+static bool bypass_sched_disable(struct intel_guc *guc,
+				 struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
 	GEM_BUG_ON(intel_context_is_child(ce));
 
+	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
+	    !lrc_desc_registered(guc, ce->guc_id.id)) {
+		clr_context_enabled(ce);
+		return true;
+	}
+
+	return !context_enabled(ce);
+}
+
+static void __delay_sched_disable(struct work_struct *wrk)
+{
+	struct intel_context *ce =
+		container_of(wrk, typeof(*ce), guc_sched_disable_delay.work);
+	struct intel_guc *guc = ce_to_guc(ce);
+	unsigned long flags;
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
-	/*
-	 * We have to check if the context has been disabled by another thread,
-	 * check if submssion has been disabled to seal a race with reset and
-	 * finally check if any more requests have been committed to the
-	 * context ensursing that a request doesn't slip through the
-	 * 'context_pending_disable' fence.
-	 */
-	if (unlikely(!context_enabled(ce) || submission_disabled(guc) ||
-		     context_has_committed_requests(ce))) {
-		clr_context_enabled(ce);
+	if (bypass_sched_disable(guc, ce)) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		goto unpin;
+		intel_context_sched_disable_unpin(ce);
+	} else {
+		do_sched_disable(guc, ce, flags);
 	}
-	guc_id = prep_context_pending_disable(ce);
+}
 
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+static bool guc_id_pressure(struct intel_guc *guc, struct intel_context *ce)
+{
+	/*
+	 * parent contexts are perma-pinned, if we are unpinning do schedule
+	 * disable immediately.
+	 */
+	if (intel_context_is_parent(ce))
+		return true;
 
-	with_intel_runtime_pm(runtime_pm, wakeref)
-		__guc_context_sched_disable(guc, ce, guc_id);
+	/*
+	 * If more than 3/4 of guc_ids in use, do schedule disable immediately.
+	 */
+	return guc->submission_state.guc_ids_in_use >
+		((GUC_MAX_LRC_DESCRIPTORS - NUMBER_MULTI_LRC_GUC_ID) / 4) * 3;
+}
+
+static void guc_context_sched_disable(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	u64 delay = guc->submission_state.sched_disable_delay_ms;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+
+	if (bypass_sched_disable(guc, ce)) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		intel_context_sched_disable_unpin(ce);
+	} else if (!intel_context_is_closed(ce) && !guc_id_pressure(guc, ce) &&
+		   delay) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		mod_delayed_work(system_unbound_wq,
+				 &ce->guc_sched_disable_delay,
+				 msecs_to_jiffies(delay));
+	} else {
+		do_sched_disable(guc, ce, flags);
+	}
+}
 
-	return;
-unpin:
-	intel_context_sched_disable_unpin(ce);
+static void guc_context_close(struct intel_context *ce)
+{
+	if (test_bit(CONTEXT_GUC_INIT, &ce->flags) &&
+	    cancel_delayed_work(&ce->guc_sched_disable_delay))
+		__delay_sched_disable(&ce->guc_sched_disable_delay.work);
 }
 
 static inline void guc_lrc_desc_unpin(struct intel_context *ce)
@@ -2662,6 +2731,7 @@ static const struct intel_context_ops guc_context_ops = {
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
+	.close = guc_context_close,
 
 	.cancel_request = guc_context_cancel_request,
 
@@ -2738,6 +2808,10 @@ static void guc_context_init(struct intel_context *ce)
 	rcu_read_unlock();
 
 	ce->guc_state.prio = map_i915_prio_to_guc_prio(prio);
+
+	INIT_DELAYED_WORK(&ce->guc_sched_disable_delay,
+			  __delay_sched_disable);
+
 	set_bit(CONTEXT_GUC_INIT, &ce->flags);
 }
 
@@ -2775,6 +2849,9 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))
 		guc_context_init(ce);
 
+	if (cancel_delayed_work(&ce->guc_sched_disable_delay))
+		intel_context_sched_disable_unpin(ce);
+
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
@@ -2911,6 +2988,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
+	.close = guc_context_close,
 
 	.cancel_request = guc_context_cancel_request,
 
@@ -3002,6 +3080,7 @@ static const struct intel_context_ops virtual_parent_context_ops = {
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
+	.close = guc_context_close,
 
 	.cancel_request = guc_context_cancel_request,
 
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index f54de0499be7..9e5d84c425a5 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -92,12 +92,14 @@ int __i915_subtests(const char *caller,
 			T, ARRAY_SIZE(T), data)
 #define i915_live_subtests(T, data) ({ \
 	typecheck(struct drm_i915_private *, data); \
+	(data)->gt.uc.guc.submission_state.sched_disable_delay_ms = 0; \
 	__i915_subtests(__func__, \
 			__i915_live_setup, __i915_live_teardown, \
 			T, ARRAY_SIZE(T), data); \
 })
 #define intel_gt_live_subtests(T, data) ({ \
 	typecheck(struct intel_gt *, data); \
+	(data)->uc.guc.submission_state.sched_disable_delay_ms = 0; \
 	__i915_subtests(__func__, \
 			__intel_gt_live_setup, __intel_gt_live_teardown, \
 			T, ARRAY_SIZE(T), data); \
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 9795f456cccf..dd30396704b1 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -929,6 +929,11 @@ DEFINE_EVENT(intel_context, intel_context_reset,
 	     TP_ARGS(ce)
 );
 
+DEFINE_EVENT(intel_context, intel_context_close,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
 DEFINE_EVENT(intel_context, intel_context_ban,
 	     TP_PROTO(struct intel_context *ce),
 	     TP_ARGS(ce)
@@ -1031,6 +1036,11 @@ trace_intel_context_reset(struct intel_context *ce)
 {
 }
 
+static inline void
+trace_intel_context_close(struct intel_context *ce)
+{
+}
+
 static inline void
 trace_intel_context_ban(struct intel_context *ce)
 {
-- 
2.32.0

