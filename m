Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D174219A0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E866E221;
	Mon,  4 Oct 2021 22:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6C06E221;
 Mon,  4 Oct 2021 22:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854262"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735454"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 02/26] drm/i915/guc: Take GT PM ref when deregistering context
Date: Mon,  4 Oct 2021 15:06:13 -0700
Message-Id: <20211004220637.14746-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

Taking a PM reference to prevent intel_gt_wait_for_idle from short
circuiting while a deregister context H2G is in flight. To do this must
issue the deregister H2G from a worker as context can be destroyed from
an atomic context and taking GT PM ref blows up. Previously we took a
runtime PM from this atomic context which worked but will stop working
once runtime pm autosuspend in enabled.

So this patch is two fold, stop intel_gt_wait_for_idle from short
circuting and fix runtime pm autosuspend.

v2:
 (John Harrison)
  - Split structure changes out in different patch
 (Tvrtko)
  - Don't drop lock in deregister_destroyed_contexts

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   5 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 146 +++++++++++-------
 6 files changed, 121 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index e9a0cad5c34d..1076066f41e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -399,6 +399,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->guc_id.id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id.link);
 
+	INIT_LIST_HEAD(&ce->destroyed_link);
+
 	/*
 	 * Initialize fence to be complete as this is expected to be complete
 	 * unless there is a pending schedule disable outstanding.
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e7e3984aab78..4613d027cbc3 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -213,6 +213,13 @@ struct intel_context {
 		struct list_head link;
 	} guc_id;
 
+	/**
+	 * @destroyed_link: link in guc->submission_state.destroyed_contexts, in
+	 * list when context is pending to be destroyed (deregistered with the
+	 * GuC), protected by guc->submission_state.lock
+	 */
+	struct list_head destroyed_link;
+
 #ifdef CONFIG_DRM_I915_SELFTEST
 	/**
 	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 8520c595f5e1..6fdeae668e6e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -16,6 +16,11 @@ intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
 	return intel_wakeref_is_active(&engine->wakeref);
 }
 
+static inline void __intel_engine_pm_get(struct intel_engine_cs *engine)
+{
+	__intel_wakeref_get(&engine->wakeref);
+}
+
 static inline void intel_engine_pm_get(struct intel_engine_cs *engine)
 {
 	intel_wakeref_get(&engine->wakeref);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index d0588d8aaa44..05de6c1af25b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -41,6 +41,10 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
 	intel_wakeref_put_async(&gt->wakeref);
 }
 
+#define with_intel_gt_pm(gt, tmp) \
+	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
+	     intel_gt_pm_put(gt), tmp = 0)
+
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 65b5e8eeef96..25a598e2b6e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -84,6 +84,17 @@ struct intel_guc {
 		 * refs
 		 */
 		struct list_head guc_id_list;
+		/**
+		 * @destroyed_contexts: list of contexts waiting to be destroyed
+		 * (deregistered with the GuC)
+		 */
+		struct list_head destroyed_contexts;
+		/**
+		 * @destroyed_worker: worker to deregister contexts, need as we
+		 * need to take a GT PM reference and can't from destroy
+		 * function as it might be in an atomic context (no sleeping)
+		 */
+		struct work_struct destroyed_worker;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ad5c18119d92..17da2fea1bff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -90,8 +90,8 @@
  * used for all of GuC submission but that could change in the future.
  *
  * guc->submission_state.lock
- * Protects guc_id allocation for the given GuC, i.e. only one context can be
- * doing guc_id allocation operations at a time for each GuC in the system.
+ * Global lock for GuC submission state. Protects guc_ids and destroyed contexts
+ * list.
  *
  * ce->guc_state.lock
  * Protects everything under ce->guc_state. Ensures that a context is in the
@@ -719,6 +719,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 			if (deregister)
 				guc_signal_context_fence(ce);
 			if (destroyed) {
+				intel_gt_pm_put_async(guc_to_gt(guc));
 				release_guc_id(guc, ce);
 				__guc_context_destroy(ce);
 			}
@@ -797,6 +798,8 @@ static void guc_flush_submissions(struct intel_guc *guc)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+static void guc_flush_destroyed_contexts(struct intel_guc *guc);
+
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
 	int i;
@@ -815,6 +818,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
 
 	guc_flush_submissions(guc);
+	guc_flush_destroyed_contexts(guc);
 
 	/*
 	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
@@ -1126,6 +1130,8 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
+static void destroyed_worker_func(struct work_struct *w);
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1151,6 +1157,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	spin_lock_init(&guc->submission_state.lock);
 	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
 	ida_init(&guc->submission_state.guc_ids);
+	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
+	INIT_WORK(&guc->submission_state.destroyed_worker,
+		  destroyed_worker_func);
 
 	return 0;
 }
@@ -1161,6 +1170,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 		return;
 
 	guc_lrc_desc_pool_destroy(guc);
+	guc_flush_destroyed_contexts(guc);
 	i915_sched_engine_put(guc->sched_engine);
 }
 
@@ -1859,11 +1869,30 @@ static void guc_context_sched_disable(struct intel_context *ce)
 static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
+	struct intel_gt *gt = guc_to_gt(guc);
+	unsigned long flags;
+	bool disabled;
 
+	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
 	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
 	GEM_BUG_ON(context_enabled(ce));
 
+	/* Seal race with Reset */
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	disabled = submission_disabled(guc);
+	if (likely(!disabled)) {
+		__intel_gt_pm_get(gt);
+		set_context_destroyed(ce);
+		clr_context_registered(ce);
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(disabled)) {
+		release_guc_id(guc, ce);
+		__guc_context_destroy(ce);
+		return;
+	}
+
 	deregister_context(ce, ce->guc_id.id);
 }
 
@@ -1891,78 +1920,86 @@ static void __guc_context_destroy(struct intel_context *ce)
 	}
 }
 
+static void guc_flush_destroyed_contexts(struct intel_guc *guc)
+{
+	struct intel_context *ce, *cn;
+	unsigned long flags;
+
+	GEM_BUG_ON(!submission_disabled(guc) &&
+		   guc_submission_initialized(guc));
+
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	list_for_each_entry_safe(ce, cn,
+				 &guc->submission_state.destroyed_contexts,
+				 destroyed_link) {
+		list_del_init(&ce->destroyed_link);
+		__release_guc_id(guc, ce);
+		__guc_context_destroy(ce);
+	}
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+}
+
+static void deregister_destroyed_contexts(struct intel_guc *guc)
+{
+	struct intel_context *ce, *cn;
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	list_for_each_entry_safe(ce, cn,
+				 &guc->submission_state.destroyed_contexts,
+				 destroyed_link) {
+		list_del_init(&ce->destroyed_link);
+		guc_lrc_desc_unpin(ce);
+	}
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+}
+
+static void destroyed_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc,
+					     submission_state.destroyed_worker);
+	struct intel_gt *gt = guc_to_gt(guc);
+	int tmp;
+
+	with_intel_gt_pm(gt, tmp)
+		deregister_destroyed_contexts(guc);
+}
+
 static void guc_context_destroy(struct kref *kref)
 {
 	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
-	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
 	struct intel_guc *guc = ce_to_guc(ce);
-	intel_wakeref_t wakeref;
 	unsigned long flags;
-	bool disabled;
+	bool destroy;
 
 	/*
 	 * If the guc_id is invalid this context has been stolen and we can free
 	 * it immediately. Also can be freed immediately if the context is not
 	 * registered with the GuC or the GuC is in the middle of a reset.
 	 */
-	if (context_guc_id_invalid(ce)) {
-		__guc_context_destroy(ce);
-		return;
-	} else if (submission_disabled(guc) ||
-		   !lrc_desc_registered(guc, ce->guc_id.id)) {
-		release_guc_id(guc, ce);
-		__guc_context_destroy(ce);
-		return;
-	}
-
-	/*
-	 * We have to acquire the context spinlock and check guc_id again, if it
-	 * is valid it hasn't been stolen and needs to be deregistered. We
-	 * delete this context from the list of unpinned guc_id available to
-	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
-	 * returns indicating this context has been deregistered the guc_id is
-	 * returned to the pool of available guc_id.
-	 */
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
-	if (context_guc_id_invalid(ce)) {
-		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
-		__guc_context_destroy(ce);
-		return;
+	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
+		!lrc_desc_registered(guc, ce->guc_id.id);
+	if (likely(!destroy)) {
+		if (!list_empty(&ce->guc_id.link))
+			list_del_init(&ce->guc_id.link);
+		list_add_tail(&ce->destroyed_link,
+			      &guc->submission_state.destroyed_contexts);
+	} else {
+		__release_guc_id(guc, ce);
 	}
-
-	if (!list_empty(&ce->guc_id.link))
-		list_del_init(&ce->guc_id.link);
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
-
-	/* Seal race with Reset */
-	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	disabled = submission_disabled(guc);
-	if (likely(!disabled)) {
-		set_context_destroyed(ce);
-		clr_context_registered(ce);
-	}
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-	if (unlikely(disabled)) {
-		release_guc_id(guc, ce);
+	if (unlikely(destroy)) {
 		__guc_context_destroy(ce);
 		return;
 	}
 
 	/*
-	 * We defer GuC context deregistration until the context is destroyed
-	 * in order to save on CTBs. With this optimization ideally we only need
-	 * 1 CTB to register the context during the first pin and 1 CTB to
-	 * deregister the context when the context is destroyed. Without this
-	 * optimization, a CTB would be needed every pin & unpin.
-	 *
-	 * XXX: Need to acqiure the runtime wakeref as this can be triggered
-	 * from context_free_worker when runtime wakeref is not held.
-	 * guc_lrc_desc_unpin requires the runtime as a GuC register is written
-	 * in H2G CTB to deregister the context. A future patch may defer this
-	 * H2G CTB if the runtime wakeref is zero.
+	 * We use a worker to issue the H2G to deregister the context as we can
+	 * take the GT PM for the first time which isn't allowed from an atomic
+	 * context.
 	 */
-	with_intel_runtime_pm(runtime_pm, wakeref)
-		guc_lrc_desc_unpin(ce);
+	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -2798,6 +2835,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
+		intel_gt_pm_put_async(guc_to_gt(guc));
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
 	}
-- 
2.32.0

