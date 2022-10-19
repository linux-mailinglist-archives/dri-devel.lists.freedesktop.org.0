Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868326044AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C110F20C;
	Wed, 19 Oct 2022 12:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57AB10E084;
 Wed, 19 Oct 2022 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666181465; x=1697717465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vs+mzAt/beJ+Q9lcIb7QxDpZvUu7rOq8x/BFGHmFwBQ=;
 b=cJPqUCibbEXW0p4HJVbikrh6AbCVtvr4wrJu6bqon8OTaatFgl+Kis7n
 mWmDGrp7gkvIVW3aWUGGh6ntRW0A+nIgTtYM66F17SIVILN7b8FoCQMdM
 5037fpWam1tBTcgMJi99XeeyPr8YnXQxqdk3pkmtDhG9huCTLBoE41Tzb
 hzgfzUcCtnAYFyDEamS8/6eJhnReTzmJn8odgRk6TxeaehYqdW+GNgmhx
 K5MC00AirzO+FLpdSbw3FT/J+fDbfEJ6GzRfkhvBKYa4jHyXsWyKIRvQ9
 fsExOkxoVyG2vn2Yn6Vy3d+vJhVrsQNGcp1sJdD1a3tqW2rTgw8Lg4sY8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392692153"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392692153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874405226"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="874405226"
Received: from mjmcener-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:14 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/selftests: Fix waiting for threads to start
Date: Wed, 19 Oct 2022 13:10:06 +0100
Message-Id: <20221019121007.3229024-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
References: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Tests which want to make sure all threads have started have to do that
explicitly since one yield() can not guarantee it. Issue is that many
tests then proceed to call kthread_stop() which can therefore return even
before the thread has been started and will instead just return an error
status.

Add a simple macro helper which can wait on a bunch of threads to start
and use it. Also refactor some tests so the helper can be used.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c |   5 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  10 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   5 +-
 drivers/gpu/drm/i915/i915_selftest.h          |  12 ++
 drivers/gpu/drm/i915/selftests/i915_request.c | 126 ++++++++++++------
 5 files changed, 111 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index c6ad67b90e8a..f5dc7ba2cdd7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -181,6 +181,7 @@ static int live_nop_switch(void *arg)
 struct parallel_switch {
 	struct task_struct *tsk;
 	struct intel_context *ce[2];
+	bool running;
 };
 
 static int __live_parallel_switch1(void *data)
@@ -189,6 +190,7 @@ static int __live_parallel_switch1(void *data)
 	IGT_TIMEOUT(end_time);
 	unsigned long count;
 
+	WRITE_ONCE(arg->running, true);
 	count = 0;
 	do {
 		struct i915_request *rq = NULL;
@@ -233,6 +235,7 @@ static int __live_parallel_switchN(void *data)
 	unsigned long count;
 	int n;
 
+	WRITE_ONCE(arg->running, true);
 	count = 0;
 	do {
 		for (n = 0; n < ARRAY_SIZE(arg->ce); n++) {
@@ -370,7 +373,7 @@ static int live_parallel_switch(void *arg)
 			get_task_struct(data[n].tsk);
 		}
 
-		yield(); /* start all threads before we kthread_stop() */
+		__igt_start_threads(data, count, tsk, running);
 
 		for (n = 0; n < count; n++) {
 			int status;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 56b7d5b5fea0..07f572ee9923 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3479,6 +3479,7 @@ struct preempt_smoke {
 	unsigned int ncontext;
 	struct rnd_state prng;
 	unsigned long count;
+	bool running;
 };
 
 static struct i915_gem_context *smoke_context(struct preempt_smoke *smoke)
@@ -3544,6 +3545,7 @@ static int smoke_crescendo_thread(void *arg)
 	IGT_TIMEOUT(end_time);
 	unsigned long count;
 
+	WRITE_ONCE(smoke->running, true);
 	count = 0;
 	do {
 		struct i915_gem_context *ctx = smoke_context(smoke);
@@ -3576,23 +3578,25 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 	if (!arg)
 		return -ENOMEM;
 
+	memset(arg, 0, I915_NUM_ENGINES * sizeof(*arg));
+
 	for_each_engine(engine, smoke->gt, id) {
 		arg[id] = *smoke;
-		arg[id].engine = engine;
 		if (!(flags & BATCH))
 			arg[id].batch = NULL;
 		arg[id].count = 0;
 
-		tsk[id] = kthread_run(smoke_crescendo_thread, arg,
+		tsk[id] = kthread_run(smoke_crescendo_thread, &arg[id],
 				      "igt/smoke:%d", id);
 		if (IS_ERR(tsk[id])) {
 			err = PTR_ERR(tsk[id]);
 			break;
 		}
+		arg[id].engine = engine;
 		get_task_struct(tsk[id]);
 	}
 
-	yield(); /* start all threads before we kthread_stop() */
+	__igt_start_threads(arg, I915_NUM_ENGINES, engine, running);
 
 	count = 0;
 	for_each_engine(engine, smoke->gt, id) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 7f3bb1d34dfb..ea1542e6b157 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -870,6 +870,7 @@ struct active_engine {
 	struct intel_engine_cs *engine;
 	unsigned long resets;
 	unsigned int flags;
+	bool running;
 };
 
 #define TEST_ACTIVE	BIT(0)
@@ -910,6 +911,8 @@ static int active_engine(void *data)
 	unsigned long count;
 	int err = 0;
 
+	WRITE_ONCE(arg->running, true);
+
 	for (count = 0; count < ARRAY_SIZE(ce); count++) {
 		ce[count] = intel_context_create(engine);
 		if (IS_ERR(ce[count])) {
@@ -1048,7 +1051,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			get_task_struct(tsk);
 		}
 
-		yield(); /* start all threads before we begin */
+		__igt_start_threads(threads, I915_NUM_ENGINES, task, running);
 
 		st_engine_heartbeat_disable_no_pm(engine);
 		GEM_BUG_ON(test_and_set_bit(I915_RESET_ENGINE + id,
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index f54de0499be7..e4fcb71fb0ee 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -137,4 +137,16 @@ bool __igt_timeout(unsigned long timeout, const char *fmt, ...);
 
 void igt_hexdump(const void *buf, size_t len);
 
+#define __igt_start_threads(array, num, cond, flag) \
+({ \
+	unsigned int n; \
+\
+restart: \
+	cond_resched(); \
+	for (n = 0; n < (num); n++) { \
+		if (array[n].cond && !READ_ONCE(array[n].running)) \
+			goto restart; \
+	} \
+})
+
 #endif /* !__I915_SELFTEST_H__ */
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 818a4909c1f3..9c313e9a771b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -299,9 +299,16 @@ __live_request_alloc(struct intel_context *ce)
 	return intel_context_create_request(ce);
 }
 
+struct smoke_thread {
+	struct smoketest *t;
+	struct task_struct *task;
+	bool running;
+};
+
 static int __igt_breadcrumbs_smoketest(void *arg)
 {
-	struct smoketest *t = arg;
+	struct smoke_thread *thread = arg;
+	struct smoketest *t = thread->t;
 	const unsigned int max_batch = min(t->ncontexts, t->max_batch) - 1;
 	const unsigned int total = 4 * t->ncontexts + 1;
 	unsigned int num_waits = 0, num_fences = 0;
@@ -319,6 +326,8 @@ static int __igt_breadcrumbs_smoketest(void *arg)
 	 * that the fences were marked as signaled.
 	 */
 
+	WRITE_ONCE(thread->running, true);
+
 	requests = kcalloc(total, sizeof(*requests), GFP_KERNEL);
 	if (!requests)
 		return -ENOMEM;
@@ -450,7 +459,7 @@ static int mock_breadcrumbs_smoketest(void *arg)
 		.request_alloc = __mock_request_alloc
 	};
 	unsigned int ncpus = num_online_cpus();
-	struct task_struct **threads;
+	struct smoke_thread *threads;
 	unsigned int n;
 	int ret = 0;
 
@@ -479,28 +488,30 @@ static int mock_breadcrumbs_smoketest(void *arg)
 	}
 
 	for (n = 0; n < ncpus; n++) {
-		threads[n] = kthread_run(__igt_breadcrumbs_smoketest,
-					 &t, "igt/%d", n);
-		if (IS_ERR(threads[n])) {
-			ret = PTR_ERR(threads[n]);
+		threads[n].task = kthread_run(__igt_breadcrumbs_smoketest,
+					      &threads[n], "igt/%d", n);
+		if (IS_ERR(threads[n].task)) {
+			ret = PTR_ERR(threads[n].task);
 			ncpus = n;
 			break;
+		} else {
+			threads[n].t = &t;
 		}
 
-		get_task_struct(threads[n]);
+		get_task_struct(threads[n].task);
 	}
 
-	yield(); /* start all threads before we begin */
+	__igt_start_threads(threads, ncpus, t, running);
 	msleep(jiffies_to_msecs(i915_selftest.timeout_jiffies));
 
 	for (n = 0; n < ncpus; n++) {
 		int err;
 
-		err = kthread_stop(threads[n]);
+		err = kthread_stop(threads[n].task);
 		if (err < 0 && !ret)
 			ret = err;
 
-		put_task_struct(threads[n]);
+		put_task_struct(threads[n].task);
 	}
 	pr_info("Completed %lu waits for %lu fence across %d cpus\n",
 		atomic_long_read(&t.num_waits),
@@ -1419,13 +1430,21 @@ static int live_sequential_engines(void *arg)
 	return err;
 }
 
+struct parallel_thread {
+	struct task_struct *task;
+	struct intel_engine_cs *engine;
+	bool running;
+};
+
 static int __live_parallel_engine1(void *arg)
 {
-	struct intel_engine_cs *engine = arg;
+	struct parallel_thread *thread = arg;
+	struct intel_engine_cs *engine = thread->engine;
 	IGT_TIMEOUT(end_time);
 	unsigned long count;
 	int err = 0;
 
+	WRITE_ONCE(thread->running, true);
 	count = 0;
 	intel_engine_pm_get(engine);
 	do {
@@ -1457,11 +1476,13 @@ static int __live_parallel_engine1(void *arg)
 
 static int __live_parallel_engineN(void *arg)
 {
-	struct intel_engine_cs *engine = arg;
+	struct parallel_thread *thread = arg;
+	struct intel_engine_cs *engine = thread->engine;
 	IGT_TIMEOUT(end_time);
 	unsigned long count;
 	int err = 0;
 
+	WRITE_ONCE(thread->running, true);
 	count = 0;
 	intel_engine_pm_get(engine);
 	do {
@@ -1507,7 +1528,8 @@ static int wait_for_all(struct drm_i915_private *i915)
 
 static int __live_parallel_spin(void *arg)
 {
-	struct intel_engine_cs *engine = arg;
+	struct parallel_thread *thread = arg;
+	struct intel_engine_cs *engine = thread->engine;
 	struct igt_spinner spin;
 	struct i915_request *rq;
 	int err = 0;
@@ -1518,6 +1540,8 @@ static int __live_parallel_spin(void *arg)
 	 * able to start in time.
 	 */
 
+	WRITE_ONCE(thread->running, true);
+
 	if (igt_spinner_init(&spin, engine->gt)) {
 		wake_all(engine->i915);
 		return -ENOMEM;
@@ -1566,9 +1590,9 @@ static int live_parallel_engines(void *arg)
 		NULL,
 	};
 	const unsigned int nengines = num_uabi_engines(i915);
+	struct parallel_thread *threads;
 	struct intel_engine_cs *engine;
 	int (* const *fn)(void *arg);
-	struct task_struct **tsk;
 	int err = 0;
 
 	/*
@@ -1576,8 +1600,8 @@ static int live_parallel_engines(void *arg)
 	 * tests that we load up the system maximally.
 	 */
 
-	tsk = kcalloc(nengines, sizeof(*tsk), GFP_KERNEL);
-	if (!tsk)
+	threads = kcalloc(nengines, sizeof(*threads), GFP_KERNEL);
+	if (!threads)
 		return -ENOMEM;
 
 	for (fn = func; !err && *fn; fn++) {
@@ -1594,37 +1618,39 @@ static int live_parallel_engines(void *arg)
 
 		idx = 0;
 		for_each_uabi_engine(engine, i915) {
-			tsk[idx] = kthread_run(*fn, engine,
-					       "igt/parallel:%s",
-					       engine->name);
-			if (IS_ERR(tsk[idx])) {
-				err = PTR_ERR(tsk[idx]);
+			threads[idx].running = false;
+			threads[idx].task =
+				kthread_run(*fn, &threads[idx],
+					    "igt/parallel:%s", engine->name);
+			if (IS_ERR(threads[idx].task)) {
+				err = PTR_ERR(threads[idx].task);
+				threads[idx].task = NULL;
 				break;
 			}
-			get_task_struct(tsk[idx++]);
+			get_task_struct(threads[idx++].task);
 		}
 
-		yield(); /* start all threads before we kthread_stop() */
+		__igt_start_threads(threads, nengines, task, running);
 
 		idx = 0;
 		for_each_uabi_engine(engine, i915) {
 			int status;
 
-			if (IS_ERR(tsk[idx]))
+			if (!threads[idx].task)
 				break;
 
-			status = kthread_stop(tsk[idx]);
+			status = kthread_stop(threads[idx].task);
 			if (status && !err)
 				err = status;
 
-			put_task_struct(tsk[idx++]);
+			put_task_struct(threads[idx++].task);
 		}
 
 		if (igt_live_test_end(&t))
 			err = -EIO;
 	}
 
-	kfree(tsk);
+	kfree(threads);
 	return err;
 }
 
@@ -1672,7 +1698,7 @@ static int live_breadcrumbs_smoketest(void *arg)
 	const unsigned int ncpus = num_online_cpus();
 	unsigned long num_waits, num_fences;
 	struct intel_engine_cs *engine;
-	struct task_struct **threads;
+	struct smoke_thread *threads;
 	struct igt_live_test live;
 	intel_wakeref_t wakeref;
 	struct smoketest *smoke;
@@ -1749,20 +1775,22 @@ static int live_breadcrumbs_smoketest(void *arg)
 			struct task_struct *tsk;
 
 			tsk = kthread_run(__igt_breadcrumbs_smoketest,
-					  &smoke[idx], "igt/%d.%d", idx, n);
+					  &threads[idx * ncpus + n],
+					  "igt/%d.%d", idx, n);
 			if (IS_ERR(tsk)) {
 				ret = PTR_ERR(tsk);
 				goto out_flush;
 			}
 
 			get_task_struct(tsk);
-			threads[idx * ncpus + n] = tsk;
+			threads[idx * ncpus + n].task = tsk;
+			threads[idx * ncpus + n].t = &smoke[idx];
 		}
 
 		idx++;
 	}
 
-	yield(); /* start all threads before we begin */
+	__igt_start_threads(threads, ncpus * nengines, t, running);
 	msleep(jiffies_to_msecs(i915_selftest.timeout_jiffies));
 
 out_flush:
@@ -1771,7 +1799,7 @@ static int live_breadcrumbs_smoketest(void *arg)
 	num_fences = 0;
 	for_each_uabi_engine(engine, i915) {
 		for (n = 0; n < ncpus; n++) {
-			struct task_struct *tsk = threads[idx * ncpus + n];
+			struct task_struct *tsk = threads[idx * ncpus + n].task;
 			int err;
 
 			if (!tsk)
@@ -2891,9 +2919,17 @@ static int perf_series_engines(void *arg)
 	return err;
 }
 
+struct p_thread {
+	struct perf_stats p;
+	struct task_struct *tsk;
+	struct intel_engine_cs *engine;
+	bool running;
+};
+
 static int p_sync0(void *arg)
 {
-	struct perf_stats *p = arg;
+	struct p_thread *thread = arg;
+	struct perf_stats *p = &thread->p;
 	struct intel_engine_cs *engine = p->engine;
 	struct intel_context *ce;
 	IGT_TIMEOUT(end_time);
@@ -2901,6 +2937,8 @@ static int p_sync0(void *arg)
 	bool busy;
 	int err = 0;
 
+	WRITE_ONCE(thread->running, true);
+
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
@@ -2963,7 +3001,8 @@ static int p_sync0(void *arg)
 
 static int p_sync1(void *arg)
 {
-	struct perf_stats *p = arg;
+	struct p_thread *thread = arg;
+	struct perf_stats *p = &thread->p;
 	struct intel_engine_cs *engine = p->engine;
 	struct i915_request *prev = NULL;
 	struct intel_context *ce;
@@ -2972,6 +3011,8 @@ static int p_sync1(void *arg)
 	bool busy;
 	int err = 0;
 
+	WRITE_ONCE(thread->running, true);
+
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
@@ -3036,7 +3077,8 @@ static int p_sync1(void *arg)
 
 static int p_many(void *arg)
 {
-	struct perf_stats *p = arg;
+	struct p_thread *thread = arg;
+	struct perf_stats *p = &thread->p;
 	struct intel_engine_cs *engine = p->engine;
 	struct intel_context *ce;
 	IGT_TIMEOUT(end_time);
@@ -3044,6 +3086,8 @@ static int p_many(void *arg)
 	int err = 0;
 	bool busy;
 
+	WRITE_ONCE(thread->running, true);
+
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
@@ -3108,10 +3152,7 @@ static int perf_parallel_engines(void *arg)
 	struct intel_engine_cs *engine;
 	int (* const *fn)(void *arg);
 	struct pm_qos_request qos;
-	struct {
-		struct perf_stats p;
-		struct task_struct *tsk;
-	} *engines;
+	struct p_thread *engines;
 	int err = 0;
 
 	engines = kcalloc(nengines, sizeof(*engines), GFP_KERNEL);
@@ -3137,19 +3178,20 @@ static int perf_parallel_engines(void *arg)
 			intel_engine_pm_get(engine);
 
 			memset(&engines[idx].p, 0, sizeof(engines[idx].p));
-			engines[idx].p.engine = engine;
 
-			engines[idx].tsk = kthread_run(*fn, &engines[idx].p,
+			engines[idx].tsk = kthread_run(*fn, &engines[idx],
 						       "igt:%s", engine->name);
 			if (IS_ERR(engines[idx].tsk)) {
 				err = PTR_ERR(engines[idx].tsk);
 				intel_engine_pm_put(engine);
 				break;
 			}
+			engines[idx].p.engine = engine;
+			engines[idx].engine = engine;
 			get_task_struct(engines[idx++].tsk);
 		}
 
-		yield(); /* start all threads before we kthread_stop() */
+		__igt_start_threads(engines, nengines, engine, running);
 
 		idx = 0;
 		for_each_uabi_engine(engine, i915) {
-- 
2.34.1

