Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA363D02D2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2D56E513;
	Tue, 20 Jul 2021 20:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAE66E3DA;
 Tue, 20 Jul 2021 20:40:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421881"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421881"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906066"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 09/42] drm/i915/guc: Take GT PM ref when deregistering
 context
Date: Tue, 20 Jul 2021 13:57:29 -0700
Message-Id: <20210720205802.39610-10-matthew.brost@intel.com>
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

Taking a PM reference to prevent intel_gt_wait_for_idle from short
circuiting while a deregister context H2G is in flight.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |  5 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 13 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 98 +++++++++++++++----
 4 files changed, 101 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 70ea46d6cfb0..17a5028ea177 100644
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
index d0588d8aaa44..a17bf0d4592b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -41,6 +41,19 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
 	intel_wakeref_put_async(&gt->wakeref);
 }
 
+#define with_intel_gt_pm(gt, tmp) \
+	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
+	     intel_gt_pm_put(gt), tmp = 0)
+#define with_intel_gt_pm_async(gt, tmp) \
+	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
+	     intel_gt_pm_put_async(gt), tmp = 0)
+#define with_intel_gt_pm_if_awake(gt, tmp) \
+	for (tmp = intel_gt_pm_get_if_awake(gt); tmp; \
+	     intel_gt_pm_put(gt), tmp = 0)
+#define with_intel_gt_pm_if_awake_async(gt, tmp) \
+	for (tmp = intel_gt_pm_get_if_awake(gt); tmp; \
+	     intel_gt_pm_put_async(gt), tmp = 0)
+
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 3198480f717c..4fe7fd4ce10e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -61,6 +61,10 @@ struct intel_guc {
 	struct list_head guc_id_list_no_ref;
 	struct list_head guc_id_list_unpinned;
 
+	spinlock_t destroy_lock;
+	struct list_head destroyed_contexts;
+	struct work_struct destroy_worker;
+
 	bool submission_supported;
 	bool submission_selected;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e1a35f647025..f13558adc142 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -908,6 +908,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 			if (deregister)
 				guc_signal_context_fence(ce);
 			if (destroyed) {
+				intel_gt_pm_put_async(guc_to_gt(guc));
 				release_guc_id(guc, ce);
 				__guc_context_destroy(ce);
 			}
@@ -1026,6 +1027,8 @@ static void guc_flush_submissions(struct intel_guc *guc)
 			gse_flush_submissions(guc->gse[i]);
 }
 
+static void guc_flush_destroyed_contexts(struct intel_guc *guc);
+
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
 	int i;
@@ -1043,6 +1046,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
 
 	guc_flush_submissions(guc);
+	guc_flush_destroyed_contexts(guc);
 
 	/*
 	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
@@ -1368,6 +1372,8 @@ static void retire_worker_func(struct work_struct *w)
 static int guc_lrcd_reg_init(struct intel_guc *guc);
 static void guc_lrcd_reg_fini(struct intel_guc *guc);
 
+static void destroy_worker_func(struct work_struct *w);
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1390,6 +1396,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->guc_id_list_unpinned);
 	ida_init(&guc->guc_ids);
 
+	spin_lock_init(&guc->destroy_lock);
+	INIT_LIST_HEAD(&guc->destroyed_contexts);
+	INIT_WORK(&guc->destroy_worker, destroy_worker_func);
+
 	return 0;
 }
 
@@ -1400,6 +1410,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	if (!guc_submission_initialized(guc))
 		return;
 
+	guc_flush_destroyed_contexts(guc);
 	guc_lrcd_reg_fini(guc);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
@@ -2326,11 +2337,29 @@ static void guc_context_sched_disable(struct intel_context *ce)
 static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
+	struct intel_gt *gt = guc_to_gt(guc);
+	unsigned long flags;
+	bool disabled;
 
+	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
 	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
 	GEM_BUG_ON(context_enabled(ce));
 
+	/* Seal race with Reset */
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	disabled = submission_disabled(guc);
+	if (likely(!disabled)) {
+		__intel_gt_pm_get(gt);
+		set_context_destroyed(ce);
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(disabled)) {
+		release_guc_id(guc, ce);
+		__guc_context_destroy(ce);
+		return;
+	}
+
 	clr_context_registered(ce);
 	deregister_context(ce, ce->guc_id, true);
 }
@@ -2359,12 +2388,51 @@ static void __guc_context_destroy(struct intel_context *ce)
 	}
 }
 
+static void guc_flush_destroyed_contexts(struct intel_guc *guc)
+{
+	struct intel_context *ce, *cn;
+	unsigned long flags;
+	spin_lock_irqsave(&guc->destroy_lock, flags);
+	list_for_each_entry_safe(ce, cn,
+				 &guc->destroyed_contexts, guc_id_link) {
+		list_del_init(&ce->guc_id_link);
+		release_guc_id(guc, ce);
+		__guc_context_destroy(ce);
+	}
+	spin_unlock_irqrestore(&guc->destroy_lock, flags);
+}
+
+static void deregister_destroyed_contexts(struct intel_guc *guc)
+{
+	struct intel_context *ce, *cn;
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->destroy_lock, flags);
+	list_for_each_entry_safe(ce, cn,
+				 &guc->destroyed_contexts, guc_id_link) {
+		list_del_init(&ce->guc_id_link);
+		spin_unlock_irqrestore(&guc->destroy_lock, flags);
+		guc_lrc_desc_unpin(ce);
+		spin_lock_irqsave(&guc->destroy_lock, flags);
+	}
+	spin_unlock_irqrestore(&guc->destroy_lock, flags);
+}
+
+static void destroy_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc =
+		container_of(w, struct intel_guc, destroy_worker);
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
 	bool disabled;
 
@@ -2404,12 +2472,12 @@ static void guc_context_destroy(struct kref *kref)
 		list_del_init(&ce->guc_id_link);
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 
-	/* Seal race with Reset */
-	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	/* Seal race with reset */
+	spin_lock_irqsave(&guc->destroy_lock, flags);
 	disabled = submission_disabled(guc);
 	if (likely(!disabled))
-		set_context_destroyed(ce);
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		list_add_tail(&ce->guc_id_link, &guc->destroyed_contexts);
+	spin_unlock_irqrestore(&guc->destroy_lock, flags);
 	if (unlikely(disabled)) {
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
@@ -2417,20 +2485,11 @@ static void guc_context_destroy(struct kref *kref)
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
+	queue_work(system_unbound_wq, &guc->destroy_worker);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -3441,6 +3500,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
+		intel_gt_pm_put_async(guc_to_gt(guc));
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
 	}
-- 
2.28.0

