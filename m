Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8449831B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C9110EB57;
	Mon, 24 Jan 2022 15:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4810E820;
 Mon, 24 Jan 2022 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036868; x=1674572868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wHCckjnvAuEpexwfVDyu5N2SqpjsII4qZHJkSK/HbCU=;
 b=mlZKSpIaBpBYSl6FBWDwspaVvlt2kuFKPtF9C4kFUe1p2l5bPbAXr4Aw
 hxXXY8xo7aSk6fwvBZ9txrZ54adqIsFpiCMIbfBTtbuOnRgjI+mwrt0eA
 7cVwITFV857wLJUx7pLybKPSDEeOrGiuNDSXnuoer8bjagz0SUFN8ca37
 2rFcywfDrAPDk2yDrAc2OmIhnGXwaa11+J9L76HWQrnS58pDnCvU2rwUF
 DEQZh4O65aEK3e3p1DvmAianxs5g5LXrvgPLNlgSUGbt6JOsPYex3kEQh
 HHAG/VNjngjLEaVV9hQ0Dksv4Mcutv8g+2tVs1kbPxN2tCVMKPcP4po1a Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282842"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="246282842"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532104898"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/i915/execlists: Fix execlists request cancellation
 corner case
Date: Mon, 24 Jan 2022 07:01:56 -0800
Message-Id: <20220124150157.15758-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124150157.15758-1-matthew.brost@intel.com>
References: <20220124150157.15758-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

More than 1 request can be submitted to a single ELSP at a time if
multiple requests are ready run to on the same context. When a request
is canceled it is marked bad, an idle pulse is triggered to the engine
(high priority kernel request), the execlists scheduler sees that
running request is bad and sets preemption timeout to minimum value (1
ms). This fails to work if multiple requests are combined on the ELSP as
only the most recent request is stored in the execlists schedule (the
request stored in the ELSP isn't marked bad, thus preemption timeout
isn't set to the minimum value). If the preempt timeout is configured to
zero, the engine is permanently hung. This is shown by an upcoming
selftest.

To work around this, mark the idle pulse with a flag to force a preempt
with the minimum value.

Fixes: 38b237eab2bc7 ("drm/i915: Individual request cancellation")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 23 +++++++++++++++----
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  | 18 ++++++++++-----
 drivers/gpu/drm/i915/i915_request.h           |  6 +++++
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a3698f611f457..efd1c719b4072 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -243,7 +243,8 @@ void intel_engine_init_heartbeat(struct intel_engine_cs *engine)
 	INIT_DELAYED_WORK(&engine->heartbeat.work, heartbeat);
 }
 
-static int __intel_engine_pulse(struct intel_engine_cs *engine)
+static int __intel_engine_pulse(struct intel_engine_cs *engine,
+				bool force_preempt)
 {
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_BARRIER };
 	struct intel_context *ce = engine->kernel_context;
@@ -258,6 +259,8 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
 		return PTR_ERR(rq);
 
 	__set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
+	if (force_preempt)
+		__set_bit(I915_FENCE_FLAG_FORCE_PREEMPT, &rq->fence.flags);
 
 	heartbeat_commit(rq, &attr);
 	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
@@ -299,7 +302,7 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
 
 		/* recheck current execution */
 		if (intel_engine_has_preemption(engine)) {
-			err = __intel_engine_pulse(engine);
+			err = __intel_engine_pulse(engine, false);
 			if (err)
 				set_heartbeat(engine, saved);
 		}
@@ -312,7 +315,8 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
 	return err;
 }
 
-int intel_engine_pulse(struct intel_engine_cs *engine)
+static int _intel_engine_pulse(struct intel_engine_cs *engine,
+			       bool force_preempt)
 {
 	struct intel_context *ce = engine->kernel_context;
 	int err;
@@ -325,7 +329,7 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
 
 	err = -EINTR;
 	if (!mutex_lock_interruptible(&ce->timeline->mutex)) {
-		err = __intel_engine_pulse(engine);
+		err = __intel_engine_pulse(engine, force_preempt);
 		mutex_unlock(&ce->timeline->mutex);
 	}
 
@@ -334,6 +338,17 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
 	return err;
 }
 
+int intel_engine_pulse(struct intel_engine_cs *engine)
+{
+	return _intel_engine_pulse(engine, false);
+}
+
+
+int intel_engine_pulse_force_preempt(struct intel_engine_cs *engine)
+{
+	return _intel_engine_pulse(engine, true);
+}
+
 int intel_engine_flush_barriers(struct intel_engine_cs *engine)
 {
 	struct i915_sched_attr attr = { .priority = I915_PRIORITY_MIN };
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
index 5da6d809a87a2..d9c8386754cb3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
@@ -21,6 +21,7 @@ void intel_gt_park_heartbeats(struct intel_gt *gt);
 void intel_gt_unpark_heartbeats(struct intel_gt *gt);
 
 int intel_engine_pulse(struct intel_engine_cs *engine);
+int intel_engine_pulse_force_preempt(struct intel_engine_cs *engine);
 int intel_engine_flush_barriers(struct intel_engine_cs *engine);
 
 #endif /* INTEL_ENGINE_HEARTBEAT_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 960a9aaf4f3a3..f0c2024058731 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1222,26 +1222,29 @@ static void record_preemption(struct intel_engine_execlists *execlists)
 }
 
 static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
-					    const struct i915_request *rq)
+					    const struct i915_request *rq,
+					    bool force_preempt)
 {
 	if (!rq)
 		return 0;
 
 	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
-	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
+	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq) ||
+		     force_preempt))
 		return 1;
 
 	return READ_ONCE(engine->props.preempt_timeout_ms);
 }
 
 static void set_preempt_timeout(struct intel_engine_cs *engine,
-				const struct i915_request *rq)
+				const struct i915_request *rq,
+				bool force_preempt)
 {
 	if (!intel_engine_has_preempt_reset(engine))
 		return;
 
 	set_timer_ms(&engine->execlists.preempt,
-		     active_preempt_timeout(engine, rq));
+		     active_preempt_timeout(engine, rq, force_preempt));
 }
 
 static bool completed(const struct i915_request *rq)
@@ -1584,12 +1587,15 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 	    memcmp(active,
 		   execlists->pending,
 		   (port - execlists->pending) * sizeof(*port))) {
+		bool force_preempt = test_bit(I915_FENCE_FLAG_FORCE_PREEMPT,
+					      &last->fence.flags);
+
 		*port = NULL;
 		while (port-- != execlists->pending)
 			execlists_schedule_in(*port, port - execlists->pending);
 
 		WRITE_ONCE(execlists->yield, -1);
-		set_preempt_timeout(engine, *active);
+		set_preempt_timeout(engine, *active, force_preempt);
 		execlists_submit_ports(engine);
 	} else {
 		ring_set_paused(engine, 0);
@@ -2594,7 +2600,7 @@ static void execlists_context_cancel_request(struct intel_context *ce,
 
 	i915_request_active_engine(rq, &engine);
 
-	if (engine && intel_engine_pulse(engine))
+	if (engine && intel_engine_pulse_force_preempt(engine))
 		intel_gt_handle_error(engine->gt, engine->mask, 0,
 				      "request cancellation by %s",
 				      current->comm);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db54875..7e6312233d4c7 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -170,6 +170,12 @@ enum {
 	 * fence (dma_fence_array) and i915 generated for parallel submission.
 	 */
 	I915_FENCE_FLAG_COMPOSITE,
+
+	/*
+	 * I915_FENCE_FLAG_FORCE_PREEMPT - Force preempt immediately regardless
+	 * of preempt timeout configuration
+	 */
+	I915_FENCE_FLAG_FORCE_PREEMPT,
 };
 
 /**
-- 
2.34.1

