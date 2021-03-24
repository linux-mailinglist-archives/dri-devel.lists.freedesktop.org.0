Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDC3477F8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658ED6E9EF;
	Wed, 24 Mar 2021 12:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DA46E9EE;
 Wed, 24 Mar 2021 12:13:48 +0000 (UTC)
IronPort-SDR: ILRqEzzVWdYdfh2m6mEkj55636p6n3zv+dngTHBrWUNap1COMUXA9kKp9/hGpPFz3zdmIsg8m4
 X/qvW/SnW7Fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386160"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:48 -0700
IronPort-SDR: rBmyX/SQijEX6ScYCV/ikghUyvHdRRdx989dWOdMXV6gz7WNW0q7FqM65riKuqbj9lwBQqjtY+
 usLqrbLCIJeA==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277129"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:47 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915: Individual request cancellation
Date: Wed, 24 Mar 2021 12:13:30 +0000
Message-Id: <20210324121335.2307063-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
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

v3 (Tvrtko):
 * Remove error propagation to waiters for now.

v4 (Tvrtko):
 * Rebase for extracted i915_request_active_engine. (Matt)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v3
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
 .../drm/i915/gt/intel_execlists_submission.c  |   9 +-
 drivers/gpu/drm/i915/i915_request.c           |  33 ++-
 drivers/gpu/drm/i915/i915_request.h           |   4 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
 5 files changed, 242 insertions(+), 6 deletions(-)

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
index 8416b0bc4eb3..d1a4a3fa7425 100644
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
 
@@ -473,20 +476,22 @@ void __i915_request_skip(struct i915_request *rq)
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
@@ -653,6 +658,28 @@ void i915_request_unsubmit(struct i915_request *request)
 	spin_unlock_irqrestore(&se->lock, flags);
 }
 
+static void __cancel_request(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = NULL;
+
+	i915_request_active_engine(rq, &engine);
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
+	__cancel_request(rq);
+}
+
 static int __i915_sw_fence_call
 submit_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index f5374bab7e69..2dea55ea69e1 100644
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
index 8035ea7565ed..72f85d9d5e8b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -608,6 +608,206 @@ static int live_nop_request(void *arg)
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
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
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
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
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
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
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
@@ -1485,6 +1685,7 @@ int i915_request_live_selftests(struct drm_i915_private *i915)
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
