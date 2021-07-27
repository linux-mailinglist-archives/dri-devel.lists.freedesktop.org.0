Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A373D6AB6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C365873344;
	Tue, 27 Jul 2021 00:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD23F731CA;
 Tue, 27 Jul 2021 00:06:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932139"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932139"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339188"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/33] drm/i915/guc: Capture error state on context reset
Date: Mon, 26 Jul 2021 17:23:33 -0700
Message-Id: <20210727002348.97202-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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

We receive notification of an engine reset from GuC at its
completion. Meaning GuC has potentially cleared any HW state
we may have been interested in capturing. GuC resumes scheduling
on the engine post-reset, as the resets are meant to be transparent,
further muddling our error state.

There is ongoing work to define an API for a GuC debug state dump. The
suggestion for now is to manually disable FW initiated resets in cases
where debug state is needed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 20 +++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h       |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 11 ++++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  2 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++----------
 drivers/gpu/drm/i915/i915_gpu_error.c         | 25 ++++++++++---
 7 files changed, 91 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 0bf4a13e9759..237b70e98744 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -509,6 +509,26 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 	return rq;
 }
 
+struct i915_request *intel_context_find_active_request(struct intel_context *ce)
+{
+	struct i915_request *rq, *active = NULL;
+	unsigned long flags;
+
+	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
+
+	spin_lock_irqsave(&ce->guc_active.lock, flags);
+	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
+				    sched.link) {
+		if (i915_request_completed(rq))
+			break;
+
+		active = rq;
+	}
+	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+
+	return active;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 974ef85320c2..2ed9bf5f91a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -200,6 +200,9 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
 
 struct i915_request *intel_context_create_request(struct intel_context *ce);
 
+struct i915_request *
+intel_context_find_active_request(struct intel_context *ce);
+
 static inline bool intel_context_is_barrier(const struct intel_context *ce)
 {
 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 8fc76dc8bf98..1db2d3efc71f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -245,7 +245,7 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
 				   ktime_t *now);
 
 struct i915_request *
-intel_engine_find_active_request(struct intel_engine_cs *engine);
+intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
 struct intel_context *
@@ -313,4 +313,23 @@ intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
 	return engine->cops->get_sibling(engine, sibling);
 }
 
+static inline void
+intel_engine_set_hung_context(struct intel_engine_cs *engine,
+			      struct intel_context *ce)
+{
+	engine->hung_ce = ce;
+}
+
+static inline void
+intel_engine_clear_hung_context(struct intel_engine_cs *engine)
+{
+	intel_engine_set_hung_context(engine, NULL);
+}
+
+static inline struct intel_context *
+intel_engine_get_hung_context(struct intel_engine_cs *engine)
+{
+	return engine->hung_ce;
+}
+
 #endif /* _INTEL_RINGBUFFER_H_ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 1eaa658507e1..0da7868c5a13 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1731,7 +1731,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	drm_printf(m, "\tRequests:\n");
 
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-	rq = intel_engine_find_active_request(engine);
+	rq = intel_engine_execlist_find_hung_request(engine);
 	if (rq) {
 		struct intel_timeline *tl = get_timeline(rq);
 
@@ -1842,10 +1842,17 @@ static bool match_ring(struct i915_request *rq)
 }
 
 struct i915_request *
-intel_engine_find_active_request(struct intel_engine_cs *engine)
+intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 {
 	struct i915_request *request, *active = NULL;
 
+	/*
+	 * This search does not work in GuC submission mode. However, the GuC
+	 * will report the hanging context directly to the driver itself. So
+	 * the driver should never get here when in GuC mode.
+	 */
+	GEM_BUG_ON(intel_uc_uses_guc_submission(&engine->gt->uc));
+
 	/*
 	 * We are called by the error capture, reset and to dump engine
 	 * state at random points in time. In particular, note that neither is
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 1c7e2724cdae..260cce15cb62 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -298,6 +298,8 @@ struct intel_engine_cs {
 	/* keep a request in reserve for a [pm] barrier under oom */
 	struct i915_request *request_pool;
 
+	struct intel_context *hung_ce;
+
 	struct llist_head barrier_tasks;
 
 	struct intel_context *kernel_context; /* pinned */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d76494e3e271..7d6ca0d54f9e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -726,24 +726,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
-static struct i915_request *context_find_active_request(struct intel_context *ce)
-{
-	struct i915_request *rq, *active = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ce->guc_active.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
-				    sched.link) {
-		if (i915_request_completed(rq))
-			break;
-
-		active = rq;
-	}
-	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
-
-	return active;
-}
-
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
 	struct i915_request *rq;
@@ -757,7 +739,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	 */
 	clr_context_enabled(ce);
 
-	rq = context_find_active_request(ce);
+	rq = intel_context_find_active_request(ce);
 	if (!rq) {
 		head = ce->ring->tail;
 		stalled = false;
@@ -2201,6 +2183,20 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static void capture_error_state(struct intel_guc *guc,
+				struct intel_context *ce)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+	intel_wakeref_t wakeref;
+
+	intel_engine_set_hung_context(engine, ce);
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		i915_capture_error_state(gt, engine->mask);
+	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
+}
+
 static void guc_context_replay(struct intel_context *ce)
 {
 	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
@@ -2213,6 +2209,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 				     struct intel_context *ce)
 {
 	trace_intel_context_reset(ce);
+	capture_error_state(guc, ce);
 	guc_context_replay(ce);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index a2c58b54a592..0f08bcfbe964 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1429,20 +1429,37 @@ capture_engine(struct intel_engine_cs *engine,
 {
 	struct intel_engine_capture_vma *capture = NULL;
 	struct intel_engine_coredump *ee;
-	struct i915_request *rq;
+	struct intel_context *ce;
+	struct i915_request *rq = NULL;
 	unsigned long flags;
 
 	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
 	if (!ee)
 		return NULL;
 
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-	rq = intel_engine_find_active_request(engine);
+	ce = intel_engine_get_hung_context(engine);
+	if (ce) {
+		intel_engine_clear_hung_context(engine);
+		rq = intel_context_find_active_request(ce);
+		if (!rq || !i915_request_started(rq))
+			goto no_request_capture;
+	} else {
+		/*
+		 * Getting here with GuC enabled means it is a forced error capture
+		 * with no actual hang. So, no need to attempt the execlist search.
+		 */
+		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
+			spin_lock_irqsave(&engine->sched_engine->lock, flags);
+			rq = intel_engine_execlist_find_hung_request(engine);
+			spin_unlock_irqrestore(&engine->sched_engine->lock,
+					       flags);
+		}
+	}
 	if (rq)
 		capture = intel_engine_coredump_add_request(ee, rq,
 							    ATOMIC_MAYFAIL);
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 	if (!capture) {
+no_request_capture:
 		kfree(ee);
 		return NULL;
 	}
-- 
2.28.0

