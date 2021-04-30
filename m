Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A827836FBE9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38DB6F52D;
	Fri, 30 Apr 2021 14:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E636F52D;
 Fri, 30 Apr 2021 14:11:03 +0000 (UTC)
IronPort-SDR: JSWGsMvI9I2uRVVW/CarGYrHR3jefV823h9lxHgbmKfK5rTt2SpTx4Su2QbXxDFXDrZqit2ERg
 XYZ21hpfBSbw==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="184754591"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="184754591"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 07:11:02 -0700
IronPort-SDR: ANoXQRbwtgWbA3aoO2EI8Kh0y9zwoeIKAN5IEDAlmq7Whm8DxtRVp323qUnJX1TDS82vM8dGGG
 jcNXHPBHLVJA==
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="425020807"
Received: from redickin-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 07:11:00 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Be more gentle with exiting non-persistent
 context
Date: Fri, 30 Apr 2021 15:10:51 +0100
Message-Id: <20210430141051.1138439-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429094640.859825-1-tvrtko.ursulin@linux.intel.com>
References: <20210429094640.859825-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Zhen Han <zhen.han@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 16 +++++++++------
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
 drivers/gpu/drm/i915/gt/intel_context.h       | 20 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
 .../drm/i915/gt/intel_execlists_submission.c  | 11 ++++++++--
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 6 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index fd8ee52e17a4..090c891f029b 100644
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
+			 intel_context_set_closed_non_persistent(ce))
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
index 17cf2640b082..efbda677a0a8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -374,6 +374,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->sseu = engine->sseu;
 	ce->ring = __intel_context_ring_size(SZ_4K);
 
+	__set_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+
 	ewma_runtime_init(&ce->runtime.avg);
 
 	ce->vm = i915_vm_get(engine->gt->vm);
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index f83a73a2b39f..a6d4c2d7f2f5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -217,9 +217,29 @@ static inline bool intel_context_is_banned(const struct intel_context *ce)
 
 static inline bool intel_context_set_banned(struct intel_context *ce)
 {
+	clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
 	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
 }
 
+static inline bool
+intel_context_is_closed_non_persistent(const struct intel_context *ce)
+{
+	return test_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
+}
+
+static inline bool
+intel_context_set_closed_non_persistent(struct intel_context *ce)
+{
+	GEM_BUG_ON(!intel_context_is_closed(ce));
+	clear_bit(CONTEXT_SCHEDULABLE, &ce->flags);
+	return test_and_set_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
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
index ed8c447a7346..2d07b821a20e 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -95,6 +95,8 @@ struct intel_context {
 #define CONTEXT_BANNED			6
 #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
 #define CONTEXT_NOPREEMPT		8
+#define CONTEXT_SCHEDULABLE		9  /* Unless banned or non-persistent closed. */
+#define CONTEXT_NON_PERSISTENT		10 /* Only if also closed. */
 
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de124870af44..3f3e2ee6a24d 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -478,7 +478,7 @@ __execlists_schedule_in(struct i915_request *rq)
 		     !intel_engine_has_heartbeat(engine)))
 		intel_context_set_banned(ce);
 
-	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
+	if (unlikely(!intel_context_is_schedulable(ce) || bad_request(rq)))
 		reset_active(rq, engine);
 
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
@@ -1204,12 +1204,19 @@ static void record_preemption(struct intel_engine_execlists *execlists)
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
+	else if (unlikely(intel_context_is_closed_non_persistent(ce)))
+		return 15;
 
 	return READ_ONCE(engine->props.preempt_timeout_ms);
 }
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index bec9c3652188..bbac87535923 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
