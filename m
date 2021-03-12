Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BC339237
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2556F8A0;
	Fri, 12 Mar 2021 15:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C7D6F8A0;
 Fri, 12 Mar 2021 15:49:15 +0000 (UTC)
IronPort-SDR: vM4YWABgz/Oh5x7oay8S9YagkTUHEFrCfw7VvZLvUytA0dSFdOUrmtQAAGkulD60Of+gsNz79R
 VddOsan3/QJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="186473783"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="186473783"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:15 -0800
IronPort-SDR: oI3C4auTtooiYcpw+sT18jSiRuZ5yrtZD8tY1d5Wt0VvXoby0FXvshQKyRySMs4GE3+6HHsw9r
 f4pAQAr6BeWQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="448655403"
Received: from nstrumtz-desk02.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.213.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 07:49:12 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 1/6] drm/i915: Individual request cancellation
Date: Fri, 12 Mar 2021 15:46:17 +0000
Message-Id: <20210312154622.1767865-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Currently, we cancel outstanding requests within a context when the
context is closed. We may also want to cancel individual requests using
the same graceful preemption mechanism.

v2 (Tvrtko):
 * Cancel waiters carefully considering no timeline lock and RCU.
 * Fixed selftests.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
 .../drm/i915/gt/intel_execlists_submission.c  |   9 +-
 drivers/gpu/drm/i915/i915_request.c           |  77 ++++-
 drivers/gpu/drm/i915/i915_request.h           |   4 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 275 ++++++++++++++++++
 5 files changed, 360 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 0b062fad1837..e2fb3ae2aaf3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -314,6 +314,7 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
 		mutex_unlock(&ce->timeline->mutex);
 	}
 
+	intel_engine_flush_scheduler(engine);
 	intel_engine_pm_put(engine);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 85ff5fe861b4..4c2acb5a6c0a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -421,6 +421,11 @@ static void reset_active(struct i915_request *rq,
 	ce->lrc.lrca = lrc_update_regs(ce, engine, head);
 }
 
+static bool bad_request(const struct i915_request *rq)
+{
+	return rq->fence.error && i915_request_started(rq);
+}
+
 static struct intel_engine_cs *
 __execlists_schedule_in(struct i915_request *rq)
 {
@@ -433,7 +438,7 @@ __execlists_schedule_in(struct i915_request *rq)
 		     !intel_engine_has_heartbeat(engine)))
 		intel_context_set_banned(ce);
 
-	if (unlikely(intel_context_is_banned(ce)))
+	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
 		reset_active(rq, engine);
 
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
@@ -1112,7 +1117,7 @@ static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
 		return 0;
 
 	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
-	if (unlikely(intel_context_is_banned(rq->context)))
+	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
 		return 1;
 
 	return READ_ONCE(engine->props.preempt_timeout_ms);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index e7b4c4bc41a6..fb9c5bb1fe41 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -33,7 +33,10 @@
 #include "gem/i915_gem_context.h"
 #include "gt/intel_breadcrumbs.h"
 #include "gt/intel_context.h"
+#include "gt/intel_engine.h"
+#include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gpu_commands.h"
+#include "gt/intel_reset.h"
 #include "gt/intel_ring.h"
 #include "gt/intel_rps.h"
 
@@ -429,20 +432,22 @@ void __i915_request_skip(struct i915_request *rq)
 	rq->infix = rq->postfix;
 }
 
-void i915_request_set_error_once(struct i915_request *rq, int error)
+bool i915_request_set_error_once(struct i915_request *rq, int error)
 {
 	int old;
 
 	GEM_BUG_ON(!IS_ERR_VALUE((long)error));
 
 	if (i915_request_signaled(rq))
-		return;
+		return false;
 
 	old = READ_ONCE(rq->fence.error);
 	do {
 		if (fatal_error(old))
-			return;
+			return false;
 	} while (!try_cmpxchg(&rq->fence.error, &old, error));
+
+	return true;
 }
 
 struct i915_request *i915_request_mark_eio(struct i915_request *rq)
@@ -609,6 +614,72 @@ void i915_request_unsubmit(struct i915_request *request)
 	spin_unlock_irqrestore(&se->lock, flags);
 }
 
+static struct intel_engine_cs *active_engine(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine, *locked;
+
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched.lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched.lock);
+		locked = engine;
+		spin_lock(&locked->sched.lock);
+	}
+
+	engine = NULL;
+	if (i915_request_is_active(rq) && !__i915_request_is_complete(rq))
+		engine = locked;
+
+	spin_unlock_irq(&locked->sched.lock);
+
+	return engine;
+}
+
+static void __cancel_request(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = active_engine(rq);
+
+	if (engine && intel_engine_pulse(engine))
+		intel_gt_handle_error(engine->gt, engine->mask, 0,
+				      "request cancellation by %s",
+				      current->comm);
+}
+
+void i915_request_cancel(struct i915_request *rq, int error)
+{
+	if (!i915_request_set_error_once(rq, error))
+		return;
+
+	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
+
+	if (i915_sw_fence_signaled(&rq->submit)) {
+		struct i915_dependency *p;
+
+restart:
+		rcu_read_lock();
+		for_each_waiter(p, rq) {
+			struct i915_request *w =
+				container_of(p->waiter, typeof(*w), sched);
+
+			if (__i915_request_is_complete(w) ||
+			    fatal_error(w->fence.error))
+				continue;
+
+			w = i915_request_get(w);
+			rcu_read_unlock();
+			/* Recursion bound by the number of engines */
+			i915_request_cancel(w, error);
+			i915_request_put(w);
+
+			/* Restart after having to drop rcu lock. */
+			goto restart;
+		}
+		rcu_read_unlock();
+	}
+
+	__cancel_request(rq);
+}
+
 static int __i915_sw_fence_call
 submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index dd10a6db3d21..64869a313b3e 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -312,7 +312,7 @@ struct i915_request * __must_check
 i915_request_create(struct intel_context *ce);
 
 void __i915_request_skip(struct i915_request *rq);
-void i915_request_set_error_once(struct i915_request *rq, int error);
+bool i915_request_set_error_once(struct i915_request *rq, int error);
 struct i915_request *i915_request_mark_eio(struct i915_request *rq);
 
 struct i915_request *__i915_request_commit(struct i915_request *request);
@@ -368,6 +368,8 @@ void i915_request_submit(struct i915_request *request);
 void __i915_request_unsubmit(struct i915_request *request);
 void i915_request_unsubmit(struct i915_request *request);
 
+void i915_request_cancel(struct i915_request *rq, int error);
+
 long i915_request_wait(struct i915_request *rq,
 		       unsigned int flags,
 		       long timeout)
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 8035ea7565ed..e63609ec5b97 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -608,6 +608,280 @@ static int live_nop_request(void *arg)
 	return err;
 }
 
+static int __cancel_inactive(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq;
+	int err = 0;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		return -ENOMEM;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+
+	pr_debug("%s: Cancelling inactive request\n", engine->name);
+	i915_request_cancel(rq, -EINTR);
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	if (i915_request_wait(rq, 0, HZ / 5) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel inactive request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	if (rq->fence.error != -EINTR) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+	}
+
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+	if (err)
+		pr_err("%s: __cancel_inactive error %d\n", engine->name, err);
+	return err;
+}
+
+static int __cancel_active(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq;
+	int err = 0;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		return -ENOMEM;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+
+	pr_debug("%s: Cancelling active request\n", engine->name);
+	i915_request_get(rq);
+	i915_request_add(rq);
+	if (!igt_wait_for_spinner(&spin, rq)) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("Failed to start spinner on %s\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+	i915_request_cancel(rq, -EINTR);
+
+	if (i915_request_wait(rq, 0, HZ / 5) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel active request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	if (rq->fence.error != -EINTR) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+	}
+
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+	if (err)
+		pr_err("%s: __cancel_active error %d\n", engine->name, err);
+	return err;
+}
+
+static int __cancel_active_chain(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq[2];
+	int err = 0;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		return -ENOMEM;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq[0] = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	if (IS_ERR(rq[0])) {
+		err = PTR_ERR(rq[0]);
+		goto out_ce;
+	}
+	i915_request_get(rq[0]);
+	i915_request_add(rq[0]);
+
+	rq[1] = intel_context_create_request(ce);
+	if (IS_ERR(rq[1])) {
+		err = PTR_ERR(rq[1]);
+		goto out_spinner;
+	}
+	i915_request_get(rq[1]);
+	i915_request_add(rq[1]);
+
+	pr_debug("%s: Cancelling active chain\n", engine->name);
+	intel_engine_flush_scheduler(engine);
+	i915_request_cancel(rq[0], -EINTR);
+	igt_spinner_end(&spin);
+
+	if (i915_request_wait(rq[1], 0, HZ / 5) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel chained request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_waiter;
+	}
+
+	if (rq[0]->fence.error != -EINTR) {
+		pr_err("%s: first fence not cancelled (%u)\n",
+		       engine->name, rq[0]->fence.error);
+		err = -EINVAL;
+	}
+
+	if (rq[1]->fence.error != -EINTR) {
+		pr_err("%s: second fence not cancelled (%u)\n",
+		       engine->name, rq[1]->fence.error);
+		err = -EINVAL;
+	}
+
+out_waiter:
+	i915_request_put(rq[1]);
+out_spinner:
+	i915_request_put(rq[0]);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+	if (err)
+		pr_err("%s: __cancel_active_chain error %d\n",
+		       engine->name, err);
+	return err;
+}
+
+static int __cancel_completed(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq;
+	int err = 0;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		return -ENOMEM;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+	igt_spinner_end(&spin);
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	if (i915_request_wait(rq, 0, HZ / 5) < 0) {
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	pr_debug("%s: Cancelling completed request\n", engine->name);
+	i915_request_cancel(rq, -EINTR);
+	if (rq->fence.error) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+	}
+
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+	if (err)
+		pr_err("%s: __cancel_completed error %d\n", engine->name, err);
+	return err;
+}
+
+static int live_cancel_request(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_engine_cs *engine;
+
+	/*
+	 * Check cancellation of requests. We expect to be able to immediately
+	 * cancel active requests, even if they are currently on the GPU.
+	 */
+
+	for_each_uabi_engine(engine, i915) {
+		struct igt_live_test t;
+		int err, err2;
+
+		if (!intel_engine_has_preemption(engine))
+			continue;
+
+		err = igt_live_test_begin(&t, i915, __func__, engine->name);
+		if (err)
+			return err;
+
+		err = __cancel_inactive(engine);
+		if (err == 0)
+			err = __cancel_active(engine);
+		if (err == 0)
+			err = __cancel_active_chain(engine);
+		if (err == 0)
+			err = __cancel_completed(engine);
+
+		err2 = igt_live_test_end(&t);
+		if (err)
+			return err;
+		if (err2)
+			return err2;
+	}
+
+	return 0;
+}
+
 static struct i915_vma *empty_batch(struct drm_i915_private *i915)
 {
 	struct drm_i915_gem_object *obj;
@@ -1485,6 +1759,7 @@ int i915_request_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_sequential_engines),
 		SUBTEST(live_parallel_engines),
 		SUBTEST(live_empty_request),
+		SUBTEST(live_cancel_request),
 		SUBTEST(live_breadcrumbs_smoketest),
 	};
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
