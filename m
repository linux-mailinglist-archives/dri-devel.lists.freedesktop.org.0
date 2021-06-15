Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30E3A7B24
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 11:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7E189BD5;
	Tue, 15 Jun 2021 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A389B67;
 Tue, 15 Jun 2021 09:49:40 +0000 (UTC)
IronPort-SDR: gBZeAEp0pjus2DWDyCZtQCzTSIDTScixrW0nQef1Tvq4dwzTeoNXvgBi8a5BAUrO7qxjTBb++9
 EDT+51Th0MjA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205777077"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="205777077"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 02:49:40 -0700
IronPort-SDR: fW30U/dN4g/w2Lri5Y2SzG7+SnfgPdB5EZAZ4X7409PgJFUlKsh18krKy/X+3w8pYcBrtqMirE
 f/PL7aqRi23g==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="450195652"
Received: from jmelinn-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.219.14])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 02:49:38 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v4] drm/i915: Be more gentle with exiting non-persistent
 context
Date: Tue, 15 Jun 2021 10:49:30 +0100
Message-Id: <20210615094930.1863351-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210614120906.1616120-1-tvrtko.ursulin@linux.intel.com>
References: <20210614120906.1616120-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Zhen Han <zhen.han@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

When a non-persistent context exits we currently mark it as banned in
order to trigger fast termination of any outstanding GPU jobs it may have
left running.

In doing so we apply a very strict 1ms limit in which the left over job
has to preempt before we issues an engine resets.

Some workloads are not able to cleanly preempt in that time window and it
can be argued that it would instead be better to give them a bit more
grace since avoiding engine resets is generally preferrable.

To achieve this the patch splits handling of banned contexts from simply
exited non-persistent ones and then applies different timeouts for both
and also extends the criteria which determines if a request should be
scheduled back in after preemption or not.

15ms preempt timeout grace is given to exited non-persistent contexts
which have been empirically tested to satisfy customers requirements
and still provides reasonably quick cleanup post exit.

v2:
 * Streamline fast path checks.

v3:
 * Simplify by using only schedulable status.
 * Increase timeout to 20ms.

v4:
 * Fix live_execlists selftest.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Zhen Han <zhen.han@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 16 +++++++++------
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
 drivers/gpu/drm/i915/gt/intel_context.h       | 11 ++++++++++
 drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  | 11 ++++++++--
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 20 ++++++++++++-------
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 7 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7720b8c22c81..463d4aa9cf63 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -426,7 +426,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
 	return engine;
 }
 
-static void kill_engines(struct i915_gem_engines *engines, bool ban)
+static void
+kill_engines(struct i915_gem_engines *engines, bool ban, bool persistent)
 {
 	struct i915_gem_engines_iter it;
 	struct intel_context *ce;
@@ -443,6 +444,9 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 
 		if (ban && intel_context_set_banned(ce))
 			continue;
+		else if (!persistent &&
+			 !intel_context_clear_schedulable(ce))
+			continue;
 
 		/*
 		 * Check the current active state of this context; if we
@@ -454,7 +458,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 		engine = active_engine(ce);
 
 		/* First attempt to gracefully cancel the context */
-		if (engine && !__cancel_engine(engine) && ban)
+		if (engine && !__cancel_engine(engine) && (ban || !persistent))
 			/*
 			 * If we are unable to send a preemptive pulse to bump
 			 * the context from the GPU, we have to resort to a full
@@ -466,8 +470,6 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 
 static void kill_context(struct i915_gem_context *ctx)
 {
-	bool ban = (!i915_gem_context_is_persistent(ctx) ||
-		    !ctx->i915->params.enable_hangcheck);
 	struct i915_gem_engines *pos, *next;
 
 	spin_lock_irq(&ctx->stale.lock);
@@ -480,7 +482,8 @@ static void kill_context(struct i915_gem_context *ctx)
 
 		spin_unlock_irq(&ctx->stale.lock);
 
-		kill_engines(pos, ban);
+		kill_engines(pos, !ctx->i915->params.enable_hangcheck,
+			     i915_gem_context_is_persistent(ctx));
 
 		spin_lock_irq(&ctx->stale.lock);
 		GEM_BUG_ON(i915_sw_fence_signaled(&pos->fence));
@@ -526,7 +529,8 @@ static void engines_idle_release(struct i915_gem_context *ctx,
 
 kill:
 	if (list_empty(&engines->link)) /* raced, already closed */
-		kill_engines(engines, true);
+		kill_engines(engines, true,
+			     i915_gem_context_is_persistent(ctx));
 
 	i915_sw_fence_commit(&engines->fence);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 4033184f13b9..9d539f48d7c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -373,6 +373,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->sseu = engine->sseu;
 	ce->ring = __intel_context_ring_size(SZ_4K);
 
+	__set_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+
 	ewma_runtime_init(&ce->runtime.avg);
 
 	ce->vm = i915_vm_get(engine->gt->vm);
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index f83a73a2b39f..2d00ccd2a865 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -217,9 +217,20 @@ static inline bool intel_context_is_banned(const struct intel_context *ce)
 
 static inline bool intel_context_set_banned(struct intel_context *ce)
 {
+	clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
 	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
 }
 
+static inline bool intel_context_clear_schedulable(struct intel_context *ce)
+{
+	return test_and_clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+}
+
+static inline bool intel_context_is_schedulable(const struct intel_context *ce)
+{
+	return test_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+}
+
 static inline bool
 intel_context_force_single_submission(const struct intel_context *ce)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index ed8c447a7346..79d0bff7927a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -95,6 +95,7 @@ struct intel_context {
 #define CONTEXT_BANNED			6
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
+#define CONTEXT_SCHEDULABLE		9  /* Unless banned or non-persistent closed. */
 
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index fc77592d88a9..ed9c4f6969f5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -479,7 +479,7 @@ __execlists_schedule_in(struct i915_request *rq)
 		     !intel_engine_has_heartbeat(engine)))
 		intel_context_set_banned(ce);
 
-	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
+	if (unlikely(!intel_context_is_schedulable(ce) || bad_request(rq)))
 		reset_active(rq, engine);
 
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
@@ -1205,12 +1205,19 @@ static void record_preemption(struct intel_engine_execlists *execlists)
 static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
 					    const struct i915_request *rq)
 {
+	struct intel_context *ce;
+
 	if (!rq)
 		return 0;
 
+	ce = rq->context;
+
 	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
-	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
+	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
 		return 1;
+	/* Longer grace for closed non-persistent contexts to avoid resets. */
+	else if (unlikely(!intel_context_is_schedulable(ce)))
+		return 20;
 
 	return READ_ONCE(engine->props.preempt_timeout_ms);
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 1c8108d30b85..0fdc706058e0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2050,6 +2050,12 @@ struct live_preempt_cancel {
 	struct preempt_client a, b;
 };
 
+static void context_clear_banned(struct intel_context *ce)
+{
+	clear_bit(CONTEXT_BANNED, &ce->flags);
+	set_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+}
+
 static int __cancel_active0(struct live_preempt_cancel *arg)
 {
 	struct i915_request *rq;
@@ -2068,7 +2074,7 @@ static int __cancel_active0(struct live_preempt_cancel *arg)
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
 
-	clear_bit(CONTEXT_BANNED, &rq->context->flags);
+	context_clear_banned(rq->context);
 	i915_request_get(rq);
 	i915_request_add(rq);
 	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
@@ -2112,7 +2118,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
 	if (IS_ERR(rq[0]))
 		return PTR_ERR(rq[0]);
 
-	clear_bit(CONTEXT_BANNED, &rq[0]->context->flags);
+	context_clear_banned(rq[0]->context);
 	i915_request_get(rq[0]);
 	i915_request_add(rq[0]);
 	if (!igt_wait_for_spinner(&arg->a.spin, rq[0])) {
@@ -2128,7 +2134,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
 		goto out;
 	}
 
-	clear_bit(CONTEXT_BANNED, &rq[1]->context->flags);
+	context_clear_banned(rq[1]->context);
 	i915_request_get(rq[1]);
 	err = i915_request_await_dma_fence(rq[1], &rq[0]->fence);
 	i915_request_add(rq[1]);
@@ -2183,7 +2189,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
 	if (IS_ERR(rq[0]))
 		return PTR_ERR(rq[0]);
 
-	clear_bit(CONTEXT_BANNED, &rq[0]->context->flags);
+	context_clear_banned(rq[0]->context);
 	i915_request_get(rq[0]);
 	i915_request_add(rq[0]);
 	if (!igt_wait_for_spinner(&arg->a.spin, rq[0])) {
@@ -2197,7 +2203,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
 		goto out;
 	}
 
-	clear_bit(CONTEXT_BANNED, &rq[1]->context->flags);
+	context_clear_banned(rq[1]->context);
 	i915_request_get(rq[1]);
 	err = i915_request_await_dma_fence(rq[1], &rq[0]->fence);
 	i915_request_add(rq[1]);
@@ -2273,7 +2279,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
 
-	clear_bit(CONTEXT_BANNED, &rq->context->flags);
+	context_clear_banned(rq->context);
 	i915_request_get(rq);
 	i915_request_add(rq);
 	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
@@ -2329,7 +2335,7 @@ static int __cancel_fail(struct live_preempt_cancel *arg)
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
 
-	clear_bit(CONTEXT_BANNED, &rq->context->flags);
+	context_clear_banned(rq->context);
 	i915_request_get(rq);
 	i915_request_add(rq);
 	if (!igt_wait_for_spinner(&arg->a.spin, rq)) {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 1014c71cf7f5..5beaa18d6c7a 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -660,7 +660,7 @@ bool __i915_request_submit(struct i915_request *request)
 		goto active;
 	}
 
-	if (unlikely(intel_context_is_banned(request->context)))
+	if (unlikely(!intel_context_is_schedulable(request->context)))
 		i915_request_set_error_once(request, -EIO);
 
 	if (unlikely(fatal_error(request->fence.error)))
-- 
2.30.2

