Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC63375B08
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CDA6EDF5;
	Thu,  6 May 2021 18:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912F56ED8F;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: PUuJNI4WVxbgnOo6cMIQIUJ+qgLVryUJz9quiqWimNCRoJWGd4nrPcmHTv24SkDIjXB8viBPbm
 aOE9kJEXZGZw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219439490"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="219439490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: HMfjKbna0MWJUtWgj7/yTxdvKZ/VUlsJnAMbK88LomLU4dwdbXeQhTDKUvd2ZnNkVcYm+ds24Y
 WJQ2wYQfFKAA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583603"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 75/97] drm/i915/guc: Fix for error capture after full GPU
 reset with GuC
Date: Thu,  6 May 2021 12:14:29 -0700
Message-Id: <20210506191451.77768-76-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

In the case of a full GPU reset (e.g. because GuC has died or because
GuC's hang detection has been disabled), the driver can't rely on GuC
reporting the guilty context. Instead, the driver needs to scan all
active contexts and find one that is currently executing, as per the
execlist mode behaviour. In GuC mode, this scan is different to
execlist mode as the active request list is handled very differently.

Similarly, the request state dump in debugfs needs to be handled
differently when in GuC submission mode.

Also refactured some of the request scanning code to avoid duplication
across the multiple code paths that are now replicating it.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h        |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 139 ++++++++++++------
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   8 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  67 +++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   3 +
 drivers/gpu/drm/i915/i915_request.c           |  41 ++++++
 drivers/gpu/drm/i915/i915_request.h           |  11 ++
 9 files changed, 229 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index bb94963a9fa2..2e69be3bb1cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -237,6 +237,9 @@ __printf(3, 4)
 void intel_engine_dump(struct intel_engine_cs *engine,
 		       struct drm_printer *m,
 		       const char *header, ...);
+void intel_engine_dump_active_requests(struct list_head *requests,
+				       struct i915_request *hung_rq,
+				       struct drm_printer *m);
 
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
 				   ktime_t *now);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index ad3987289f09..e34a61600c8c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1680,6 +1680,97 @@ static void print_properties(struct intel_engine_cs *engine,
 			   read_ul(&engine->defaults, p->offset));
 }
 
+static void engine_dump_request(struct i915_request *rq, struct drm_printer *m, const char *msg)
+{
+	struct intel_timeline *tl = get_timeline(rq);
+
+	i915_request_show(m, rq, msg, 0);
+
+	drm_printf(m, "\t\tring->start:  0x%08x\n",
+		   i915_ggtt_offset(rq->ring->vma));
+	drm_printf(m, "\t\tring->head:   0x%08x\n",
+		   rq->ring->head);
+	drm_printf(m, "\t\tring->tail:   0x%08x\n",
+		   rq->ring->tail);
+	drm_printf(m, "\t\tring->emit:   0x%08x\n",
+		   rq->ring->emit);
+	drm_printf(m, "\t\tring->space:  0x%08x\n",
+		   rq->ring->space);
+
+	if (tl) {
+		drm_printf(m, "\t\tring->hwsp:   0x%08x\n",
+			   tl->hwsp_offset);
+		intel_timeline_put(tl);
+	}
+
+	print_request_ring(m, rq);
+
+	if (rq->context->lrc_reg_state) {
+		drm_printf(m, "Logical Ring Context:\n");
+		hexdump(m, rq->context->lrc_reg_state, PAGE_SIZE);
+	}
+}
+
+void intel_engine_dump_active_requests(struct list_head *requests,
+				       struct i915_request *hung_rq,
+				       struct drm_printer *m)
+{
+	struct i915_request *rq;
+	const char *msg;
+	enum i915_request_state state;
+
+	list_for_each_entry(rq, requests, sched.link) {
+		if (rq == hung_rq)
+			continue;
+
+		state = i915_test_request_state(rq);
+		if (state < I915_REQUEST_QUEUED)
+			continue;
+
+		if (state == I915_REQUEST_ACTIVE)
+			msg = "\t\tactive on engine";
+		else
+			msg = "\t\tactive in queue";
+
+		engine_dump_request(rq, m, msg);
+	}
+}
+
+static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
+{
+	struct i915_request *hung_rq = NULL;
+	struct intel_context *ce;
+	bool guc;
+
+	/*
+	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
+	 * The GPU is still running so requests are still executing and any
+	 * hardware reads will be out of date by the time they are reported.
+	 * But the intention here is just to report an instantaneous snapshot
+	 * so that's fine.
+	 */
+	lockdep_assert_held(&engine->sched_engine->lock);
+
+	drm_printf(m, "\tRequests:\n");
+
+	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
+	if (guc) {
+		ce = intel_engine_get_hung_context(engine);
+		if (ce)
+			hung_rq = intel_context_find_active_request(ce);
+	} else
+		hung_rq = intel_engine_execlist_find_hung_request(engine);
+
+	if (hung_rq)
+		engine_dump_request(hung_rq, m, "\t\thung");
+
+	if (guc)
+		intel_guc_dump_active_requests(engine, hung_rq, m);
+	else
+		intel_engine_dump_active_requests(&engine->sched_engine->requests,
+						  hung_rq, m);
+}
+
 void intel_engine_dump(struct intel_engine_cs *engine,
 		       struct drm_printer *m,
 		       const char *header, ...)
@@ -1724,39 +1815,9 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 		   i915_reset_count(error));
 	print_properties(engine, m);
 
-	drm_printf(m, "\tRequests:\n");
-
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-	rq = intel_engine_execlist_find_hung_request(engine);
-	if (rq) {
-		struct intel_timeline *tl = get_timeline(rq);
-
-		i915_request_show(m, rq, "\t\tactive ", 0);
-
-		drm_printf(m, "\t\tring->start:  0x%08x\n",
-			   i915_ggtt_offset(rq->ring->vma));
-		drm_printf(m, "\t\tring->head:   0x%08x\n",
-			   rq->ring->head);
-		drm_printf(m, "\t\tring->tail:   0x%08x\n",
-			   rq->ring->tail);
-		drm_printf(m, "\t\tring->emit:   0x%08x\n",
-			   rq->ring->emit);
-		drm_printf(m, "\t\tring->space:  0x%08x\n",
-			   rq->ring->space);
-
-		if (tl) {
-			drm_printf(m, "\t\tring->hwsp:   0x%08x\n",
-				   tl->hwsp_offset);
-			intel_timeline_put(tl);
-		}
-
-		print_request_ring(m, rq);
+	engine_dump_active_requests(engine, m);
 
-		if (rq->context->lrc_reg_state) {
-			drm_printf(m, "Logical Ring Context:\n");
-			hexdump(m, rq->context->lrc_reg_state, PAGE_SIZE);
-		}
-	}
 	drm_printf(m, "\tOn hold?: %lu\n",
 		   list_count(&engine->sched_engine->hold));
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
@@ -1830,13 +1891,6 @@ intel_engine_create_virtual(struct intel_engine_cs **siblings,
 	return siblings[0]->cops->create_virtual(siblings, count);
 }
 
-static bool match_ring(struct i915_request *rq)
-{
-	u32 ring = ENGINE_READ(rq->engine, RING_START);
-
-	return ring == i915_ggtt_offset(rq->ring->vma);
-}
-
 struct i915_request *
 intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 {
@@ -1880,14 +1934,7 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 
 	list_for_each_entry(request, &engine->sched_engine->requests,
 			    sched.link) {
-		if (__i915_request_is_complete(request))
-			continue;
-
-		if (!__i915_request_has_started(request))
-			continue;
-
-		/* More than one preemptible request may match! */
-		if (!match_ring(request))
+		if (i915_test_request_state(request) != I915_REQUEST_ACTIVE)
 			continue;
 
 		active = request;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a8495364d906..f0768824de6f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -90,6 +90,14 @@ reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
 		show_heartbeat(rq, engine);
 
+	if (intel_engine_uses_guc(engine))
+		/*
+		 * GuC itself is toast or GuC's hang detection
+		 * is disabled. Either way, need to find the
+		 * hang culprit manually.
+		 */
+		intel_guc_find_hung_context(engine);
+
 	intel_gt_handle_error(engine->gt, engine->mask,
 			      I915_ERROR_CAPTURE,
 			      "stopped heartbeat on %s",
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index ce3ef26ffe2d..c35c4b529ce5 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -156,7 +156,7 @@ void __i915_request_reset(struct i915_request *rq, bool guilty)
 	if (guilty) {
 		i915_request_set_error_once(rq, -EIO);
 		__i915_request_skip(rq);
-		if (mark_guilty(rq))
+		if (mark_guilty(rq) && !intel_engine_uses_guc(rq->engine))
 			skip_context(rq);
 	} else {
 		i915_request_set_error_once(rq, -EAGAIN);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 097687937cec..10b48b9f7603 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -269,6 +269,8 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len);
 
+void intel_guc_find_hung_context(struct intel_engine_cs *engine);
+
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
 void intel_guc_submission_reset_finish(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 6b3b74e50b31..ad3d2326a81d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2267,6 +2267,73 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+void intel_guc_find_hung_context(struct intel_engine_cs *engine)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_context *ce;
+	struct i915_request *rq;
+	unsigned long index;
+
+	/* Reset called during driver load? GuC not yet initialised! */
+	if (unlikely(!guc_submission_initialized(guc)))
+		return;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!intel_context_is_pinned(ce))
+			continue;
+
+		if (intel_engine_is_virtual(ce->engine)) {
+			if (!(ce->engine->mask & engine->mask))
+				continue;
+		} else {
+			if (ce->engine != engine)
+				continue;
+		}
+
+		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
+			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
+				continue;
+
+			intel_engine_set_hung_context(engine, ce);
+
+			/* Can only cope with one hang at a time... */
+			return;
+		}
+	}
+}
+
+void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
+				    struct i915_request *hung_rq,
+				    struct drm_printer *m)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_context *ce;
+	unsigned long index;
+	unsigned long flags;
+
+	/* Reset called during driver load? GuC not yet initialised! */
+	if (unlikely(!guc_submission_initialized(guc)))
+		return;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!intel_context_is_pinned(ce))
+			continue;
+
+		if (intel_engine_is_virtual(ce->engine)) {
+			if (!(ce->engine->mask & engine->mask))
+				continue;
+		} else {
+			if (ce->engine != engine)
+				continue;
+		}
+
+		spin_lock_irqsave(&ce->guc_active.lock, flags);
+		intel_engine_dump_active_requests(&ce->guc_active.requests,
+						  hung_rq, m);
+		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+	}
+}
+
 void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index b9b9f0f60f91..a2a3fad72be1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -24,6 +24,9 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine);
 void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p);
 void intel_guc_log_context_info(struct intel_guc *guc, struct drm_printer *p);
+void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
+				    struct i915_request *hung_rq,
+				    struct drm_printer *m);
 
 bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 4855cf7ebe21..ef9eb91ec84c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2076,6 +2076,47 @@ void i915_request_show(struct drm_printer *m,
 		   name);
 }
 
+static bool engine_match_ring(struct intel_engine_cs *engine, struct i915_request *rq)
+{
+	u32 ring = ENGINE_READ(engine, RING_START);
+
+	return ring == i915_ggtt_offset(rq->ring->vma);
+}
+
+static bool match_ring(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine;
+	bool found;
+	int i;
+
+	if (!intel_engine_is_virtual(rq->engine))
+		return engine_match_ring(rq->engine, rq);
+
+	found = false;
+	i = 0;
+	while ((engine = intel_engine_get_sibling(rq->engine, i++))) {
+		found = engine_match_ring(engine, rq);
+		if (found)
+			break;
+	}
+
+	return found;
+}
+
+enum i915_request_state i915_test_request_state(struct i915_request *rq)
+{
+	if (i915_request_completed(rq))
+		return I915_REQUEST_COMPLETE;
+
+	if (!i915_request_started(rq))
+		return I915_REQUEST_PENDING;
+
+	if (match_ring(rq))
+		return I915_REQUEST_ACTIVE;
+
+	return I915_REQUEST_QUEUED;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_request.c"
 #include "selftests/i915_request.c"
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index bcc6340c505e..f98385f72782 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -651,4 +651,15 @@ i915_request_active_engine(struct i915_request *rq,
 
 void i915_request_notify_execute_cb_imm(struct i915_request *rq);
 
+enum i915_request_state
+{
+	I915_REQUEST_UNKNOWN = 0,
+	I915_REQUEST_COMPLETE,
+	I915_REQUEST_PENDING,
+	I915_REQUEST_QUEUED,
+	I915_REQUEST_ACTIVE,
+};
+
+enum i915_request_state i915_test_request_state(struct i915_request *rq);
+
 #endif /* I915_REQUEST_H */
-- 
2.28.0

