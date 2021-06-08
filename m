Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC13A011C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301A96EC3B;
	Tue,  8 Jun 2021 19:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279CC6EC2B;
 Tue,  8 Jun 2021 19:00:19 +0000 (UTC)
IronPort-SDR: SycJhcxZNoh/NrgjdMhlgvUGknBdTk6GLIR9rRwN479Y9l+KcGiuYMREM1P8uVwdLmdmRfaYXs
 nT88Q77uCTAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="201893715"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="201893715"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:00:06 -0700
IronPort-SDR: nPtZfWselqnscXaPTIPv8HyYSCKa1Mh0QcoyOiaYXMZRLX91FdqVGSNnnZDhLqBcxjFfbPwrVk
 IlHV/LJ6t1Pg==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="485391344"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 12:00:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/i915: Add kick_backend function to i915_sched_engine
Date: Tue,  8 Jun 2021 12:17:52 -0700
Message-Id: <20210608191754.127059-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608191754.127059-1-matthew.brost@intel.com>
References: <20210608191754.127059-1-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than touching execlist specific structures in the generic
scheduling code, add a callback function in the backend.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 52 ++++++++++++++++
 drivers/gpu/drm/i915/i915_scheduler.c         | 62 +------------------
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  6 ++
 3 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 8a3d4014fd2c..9487d9e0be62 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3116,10 +3116,61 @@ static bool can_preempt(struct intel_engine_cs *engine)
 	return engine->class != RENDER_CLASS;
 }
 
+static void kick_execlists(const struct i915_request *rq, int prio)
+{
+	struct intel_engine_cs *engine = rq->engine;
+	struct i915_sched_engine *sched_engine = engine->sched_engine;
+	const struct i915_request *inflight;
+
+	/*
+	 * We only need to kick the tasklet once for the high priority
+	 * new context we add into the queue.
+	 */
+	if (prio <= sched_engine->queue_priority_hint)
+		return;
+
+	rcu_read_lock();
+
+	/* Nothing currently active? We're overdue for a submission! */
+	inflight = execlists_active(&engine->execlists);
+	if (!inflight)
+		goto unlock;
+
+	/*
+	 * If we are already the currently executing context, don't
+	 * bother evaluating if we should preempt ourselves.
+	 */
+	if (inflight->context == rq->context)
+		goto unlock;
+
+	ENGINE_TRACE(engine,
+		     "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
+		     prio,
+		     rq->fence.context, rq->fence.seqno,
+		     inflight->fence.context, inflight->fence.seqno,
+		     inflight->sched.attr.priority);
+
+	sched_engine->queue_priority_hint = prio;
+
+	/*
+	 * Allow preemption of low -> normal -> high, but we do
+	 * not allow low priority tasks to preempt other low priority
+	 * tasks under the impression that latency for low priority
+	 * tasks does not matter (as much as background throughput),
+	 * so kiss.
+	 */
+	if (prio >= max(I915_PRIORITY_NORMAL, rq_prio(inflight)))
+		tasklet_hi_schedule(&engine->execlists.tasklet);
+
+unlock:
+	rcu_read_unlock();
+}
+
 static void execlists_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = execlists_submit_request;
 	engine->sched_engine->schedule = i915_schedule;
+	engine->sched_engine->kick_backend = kick_execlists;
 	engine->execlists.tasklet.callback = execlists_submission_tasklet;
 }
 
@@ -3702,6 +3753,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 	ve->base.request_alloc = execlists_request_alloc;
 
 	ve->base.sched_engine->schedule = i915_schedule;
+	ve->base.sched_engine->kick_backend = kick_execlists;
 	ve->base.submit_request = virtual_submit_request;
 	ve->base.bond_execute = virtual_bond_execute;
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 4bc6969f6a97..035b88f2e4aa 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -157,65 +157,6 @@ sched_lock_engine(const struct i915_sched_node *node,
 	return locked;
 }
 
-static inline int rq_prio(const struct i915_request *rq)
-{
-	return rq->sched.attr.priority;
-}
-
-static inline bool need_preempt(int prio, int active)
-{
-	/*
-	 * Allow preemption of low -> normal -> high, but we do
-	 * not allow low priority tasks to preempt other low priority
-	 * tasks under the impression that latency for low priority
-	 * tasks does not matter (as much as background throughput),
-	 * so kiss.
-	 */
-	return prio >= max(I915_PRIORITY_NORMAL, active);
-}
-
-static void kick_submission(struct intel_engine_cs *engine,
-			    const struct i915_request *rq,
-			    int prio)
-{
-	const struct i915_request *inflight;
-
-	/*
-	 * We only need to kick the tasklet once for the high priority
-	 * new context we add into the queue.
-	 */
-	if (prio <= engine->sched_engine->queue_priority_hint)
-		return;
-
-	rcu_read_lock();
-
-	/* Nothing currently active? We're overdue for a submission! */
-	inflight = execlists_active(&engine->execlists);
-	if (!inflight)
-		goto unlock;
-
-	/*
-	 * If we are already the currently executing context, don't
-	 * bother evaluating if we should preempt ourselves.
-	 */
-	if (inflight->context == rq->context)
-		goto unlock;
-
-	ENGINE_TRACE(engine,
-		     "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
-		     prio,
-		     rq->fence.context, rq->fence.seqno,
-		     inflight->fence.context, inflight->fence.seqno,
-		     inflight->sched.attr.priority);
-
-	engine->sched_engine->queue_priority_hint = prio;
-	if (need_preempt(prio, rq_prio(inflight)))
-		tasklet_hi_schedule(&engine->execlists.tasklet);
-
-unlock:
-	rcu_read_unlock();
-}
-
 static void __i915_schedule(struct i915_sched_node *node,
 			    const struct i915_sched_attr *attr)
 {
@@ -335,7 +276,8 @@ static void __i915_schedule(struct i915_sched_node *node,
 		}
 
 		/* Defer (tasklet) submission until after all of our updates. */
-		kick_submission(engine, node_to_request(node), prio);
+		if (engine->sched_engine->kick_backend)
+			engine->sched_engine->kick_backend(node_to_request(node), prio);
 	}
 
 	spin_unlock(&engine->sched_engine->lock);
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 0c1e417b0164..8bd07d0c27e1 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -153,6 +153,12 @@ struct i915_sched_engine {
 	 */
 	bool no_priolist;
 
+	/**
+	 * @kick_backend: kick backend after a request's priority has changed
+	 */
+	void	(*kick_backend)(const struct i915_request *rq,
+				int prio);
+
 	/**
 	 * @schedule: adjust priority of request
 	 *
-- 
2.28.0

