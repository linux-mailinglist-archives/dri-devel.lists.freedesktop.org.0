Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIl7GyEZl2nKugIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:07:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B242515F538
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D0A10E6DB;
	Thu, 19 Feb 2026 14:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uVrTZFJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FFB10E6DB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:07:21 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771510037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GLL0hMMb2bPLV0tfTIggik125ECVperRQtqT9MYhWvA=;
 b=uVrTZFJm+ukVTXzzPDVGP0KElyNdCbQ4/7SOqVYPlN5fC15jZFTpwA8zzYMHGdTNMLsCWw
 oB7xr13GB+Nyi2s9V5PcApq9DpVzRIwsMEyhnIIgxaAcLHzv+eXAVEzK5hM2nel0IZEA0a
 ppIfCMKwXErHS+YB5YpnRCJs/pGk5Zs=
From: Marco Pagani <marco.pagani@linux.dev>
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Marco Pagani <marco.pagani@linux.dev>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Add new KUnit test suite for concurrent job
 submission
Date: Thu, 19 Feb 2026 15:07:10 +0100
Message-ID: <20260219140711.3296237-1-marco.pagani@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ursulin.net,intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:marco.pagani@linux.dev,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B242515F538
X-Rspamd-Action: no action

Add a new test suite to simulate concurrent job submissions to the DRM
scheduler. The suite includes two initial test cases: (i) a primary test
case for parallel job submission and (ii) a secondary test case for
interleaved job submission and completion. In the first test case, worker
threads concurrently submit jobs to the scheduler and then the timeline is
manually advanced. In the second test case, worker threads periodically
submit a sequence of jobs to the mock scheduler. Periods are chosen as
harmonic, starting from a base period, to allow interleaving between
submission and completion. To avoid impractically large execution times,
periods are cycled. The timeline is advanced automatically when the jobs
completes. This models how job submission from userspace (in process
context) may interleave with job completion (hrtimer callback interrupt
context, in the test case) by a physical device.

Signed-off-by: Marco Pagani <marco.pagani@linux.dev>
---
Changes in v1:
- Split the original suite into two test cases (Tvrtko Ursulin).
- General test refactoring and variable renaming for clarity.
- Changed parameters to have a fairer workload distribution.
- Improved cleanup logic.
- Added kunit_info() prints for tracing workers.
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 338 ++++++++++++++++++
 1 file changed, 338 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 82a41a456b0a..391edcbaf43a 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2025 Valve Corporation */
 
 #include <linux/delay.h>
+#include <linux/completion.h>
+#include <linux/workqueue.h>
 
 #include "sched_tests.h"
 
@@ -235,6 +237,341 @@ static void drm_sched_basic_cancel(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
 }
 
+struct sched_concurrent_context {
+	struct drm_mock_scheduler *sched;
+	struct workqueue_struct *sub_wq;
+	struct kunit *test;
+	struct completion wait_go;
+};
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fini,
+			    struct drm_mock_scheduler *);
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sched_entity_free,
+			    struct drm_mock_sched_entity *);
+
+static void complete_destroy_workqueue(void *context)
+{
+	struct sched_concurrent_context *ctx = (struct sched_concurrent_context *)context;
+
+	complete_all(&ctx->wait_go);
+
+	destroy_workqueue(ctx->sub_wq);
+}
+
+static int drm_sched_concurrent_init(struct kunit *test)
+{
+	struct sched_concurrent_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	init_completion(&ctx->wait_go);
+
+	ctx->sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+
+	ret = kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx->sched);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Use an unbounded workqueue to maximize job submission concurrency */
+	ctx->sub_wq = alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND,
+				      WQ_UNBOUND_MAX_ACTIVE);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
+
+	ret = kunit_add_action_or_reset(test, complete_destroy_workqueue, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->test = test;
+	test->priv = ctx;
+
+	return 0;
+}
+
+struct drm_sched_parallel_params {
+	const char *description;
+	unsigned int num_jobs;
+	unsigned int num_workers;
+};
+
+static const struct drm_sched_parallel_params drm_sched_parallel_cases[] = {
+	{
+		.description = "Workers submitting multiple jobs against a single entity",
+		.num_jobs = 4,
+		.num_workers = 16,
+	},
+};
+
+static void
+drm_sched_parallel_desc(const struct drm_sched_parallel_params *params, char *desc)
+{
+	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_sched_parallel, drm_sched_parallel_cases, drm_sched_parallel_desc);
+
+struct parallel_worker {
+	struct work_struct work;
+	struct sched_concurrent_context *ctx;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job **jobs;
+	unsigned int id;
+};
+
+static void drm_sched_parallel_worker(struct work_struct *work)
+{
+	const struct drm_sched_parallel_params *params;
+	struct sched_concurrent_context *test_ctx;
+	struct parallel_worker *worker;
+	unsigned int i;
+
+	worker = container_of(work, struct parallel_worker, work);
+	test_ctx = worker->ctx;
+	params = test_ctx->test->param_value;
+
+	wait_for_completion(&test_ctx->wait_go);
+
+	kunit_info(test_ctx->test, "Parallel worker %u started\n", worker->id);
+
+	for (i = 0; i < params->num_jobs; i++)
+		drm_mock_sched_job_submit(worker->jobs[i]);
+}
+
+/*
+ * Spawns workers that submit a sequence of jobs to the mock scheduler.
+ * Once all jobs are submitted, the timeline is manually advanced.
+ */
+static void drm_sched_parallel_submit_test(struct kunit *test)
+{
+	struct sched_concurrent_context *ctx = test->priv;
+	const struct drm_sched_parallel_params *params = test->param_value;
+	struct parallel_worker *workers;
+	unsigned int i, j, completed_jobs;
+	bool done;
+	int ret;
+
+	workers = kunit_kcalloc(test, params->num_workers, sizeof(*workers),
+				GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, workers);
+
+	/*
+	 * Init workers only after all jobs and entities have been successfully
+	 * allocated. In this way, the cleanup logic for when an assertion fail
+	 * can be simplified.
+	 */
+	for (i = 0; i < params->num_workers; i++) {
+		workers[i].id = i;
+		workers[i].ctx = ctx;
+		workers[i].entity = drm_mock_sched_entity_new(test,
+							      DRM_SCHED_PRIORITY_NORMAL,
+							      ctx->sched);
+
+		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
+						workers[i].entity);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		workers[i].jobs = kunit_kcalloc(test, params->num_jobs,
+						sizeof(*workers[i].jobs), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
+
+		for (j = 0; j < params->num_jobs; j++)
+			workers[i].jobs[j] = drm_mock_sched_job_new(test,
+								    workers[i].entity);
+	}
+
+	for (i = 0; i < params->num_workers; i++) {
+		INIT_WORK(&workers[i].work, drm_sched_parallel_worker);
+		queue_work(ctx->sub_wq, &workers[i].work);
+	}
+
+	complete_all(&ctx->wait_go);
+	flush_workqueue(ctx->sub_wq);
+
+	for (i = 0; i < params->num_workers; i++) {
+		for (j = 0; j < params->num_jobs; j++) {
+			done = drm_mock_sched_job_wait_scheduled(workers[i].jobs[j],
+								 HZ);
+			KUNIT_ASSERT_TRUE(test, done);
+
+			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
+			KUNIT_ASSERT_FALSE(test, done);
+		}
+	}
+
+	completed_jobs = drm_mock_sched_advance(ctx->sched,
+						params->num_workers * params->num_jobs);
+	KUNIT_ASSERT_EQ(test, completed_jobs, params->num_workers * params->num_jobs);
+
+	for (i = 0; i < params->num_workers; i++) {
+		for (j = 0; j < params->num_jobs; j++) {
+			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
+			KUNIT_ASSERT_TRUE(test, done);
+		}
+	}
+}
+
+struct drm_sched_interleaved_params {
+	const char *description;
+	unsigned int job_base_period_us;
+	unsigned int periods_cycle;
+	unsigned int num_jobs;
+	unsigned int num_workers;
+};
+
+static const struct drm_sched_interleaved_params drm_sched_interleaved_cases[] = {
+	{
+		.description = "Workers submitting single jobs against a single entity",
+		.job_base_period_us = 100,
+		.periods_cycle = 10,
+		.num_jobs = 1,
+		.num_workers = 32,
+	},
+	{
+		.description = "Workers submitting multiple jobs against a single entity",
+		.job_base_period_us = 100,
+		.periods_cycle = 10,
+		.num_jobs = 4,
+		.num_workers = 16,
+	},
+};
+
+static void
+drm_sched_interleaved_desc(const struct drm_sched_interleaved_params *params, char *desc)
+{
+	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_sched_interleaved, drm_sched_interleaved_cases,
+		  drm_sched_interleaved_desc);
+
+struct interleaved_worker {
+	struct work_struct work;
+	struct sched_concurrent_context *ctx;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job **jobs;
+	unsigned int id;
+	unsigned int period_us;
+	unsigned int timeout_us;
+};
+
+static void drm_sched_interleaved_worker(struct work_struct *work)
+{
+	const struct drm_sched_interleaved_params *params;
+	struct sched_concurrent_context *test_ctx;
+	struct interleaved_worker *worker;
+	unsigned int i;
+	bool done;
+
+	worker = container_of(work, struct interleaved_worker, work);
+	test_ctx = worker->ctx;
+	params = test_ctx->test->param_value;
+
+	wait_for_completion(&test_ctx->wait_go);
+
+	kunit_info(test_ctx->test, "Interleaved worker %u with period %u us started\n",
+		   worker->id, worker->period_us);
+
+	/* Release jobs as a periodic sequence */
+	for (i = 0; i < params->num_jobs; i++) {
+		drm_mock_sched_job_set_duration_us(worker->jobs[i], worker->period_us);
+		drm_mock_sched_job_submit(worker->jobs[i]);
+
+		done = drm_mock_sched_job_wait_finished(worker->jobs[i],
+							usecs_to_jiffies(worker->timeout_us));
+		if (!done)
+			kunit_info(test_ctx->test, "Job %u of worker %u timedout\n",
+				   i, worker->id);
+	}
+}
+
+/*
+ * Spawns workers that submit a periodic sequence of jobs to the mock scheduler.
+ * Uses harmonic periods to allow interleaving and cycles through them to prevent
+ * excessively large execution times. Since the scheduler serializes jobs from all
+ * workers, the timeout is set to the hyperperiod with a 2x safety factor. Entities
+ * and jobs are pre-allocated in the main thread to avoid using KUnit assertions in
+ * the workers.
+ */
+static void drm_sched_interleaved_submit_test(struct kunit *test)
+{
+	struct sched_concurrent_context *ctx = test->priv;
+	const struct drm_sched_interleaved_params *params = test->param_value;
+	struct interleaved_worker *workers;
+	unsigned int period_max_us, timeout_us;
+	unsigned int i, j;
+	bool done;
+	int ret;
+
+	workers = kunit_kcalloc(test, params->num_workers, sizeof(*workers),
+				GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, workers);
+
+	period_max_us = params->job_base_period_us * (1 << params->periods_cycle);
+	timeout_us = params->num_workers * period_max_us * 2;
+
+	/*
+	 * Init workers only after all jobs and entities have been successfully
+	 * allocated. In this way, the cleanup logic for when an assertion fail
+	 * can be simplified.
+	 */
+	for (i = 0; i < params->num_workers; i++) {
+		workers[i].id = i;
+		workers[i].ctx = ctx;
+		workers[i].timeout_us = timeout_us;
+
+		if (i % params->periods_cycle == 0)
+			workers[i].period_us = params->job_base_period_us;
+		else
+			workers[i].period_us = workers[i - 1].period_us * 2;
+
+		workers[i].entity = drm_mock_sched_entity_new(test,
+							      DRM_SCHED_PRIORITY_NORMAL,
+							      ctx->sched);
+
+		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
+						workers[i].entity);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		workers[i].jobs = kunit_kcalloc(test, params->num_jobs,
+						sizeof(*workers[i].jobs), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
+
+		for (j = 0; j < params->num_jobs; j++) {
+			workers[i].jobs[j] = drm_mock_sched_job_new(test,
+								    workers[i].entity);
+			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
+			KUNIT_ASSERT_FALSE(test, done);
+		}
+	}
+
+	for (i = 0; i < params->num_workers; i++) {
+		INIT_WORK(&workers[i].work, drm_sched_interleaved_worker);
+		queue_work(ctx->sub_wq, &workers[i].work);
+	}
+
+	complete_all(&ctx->wait_go);
+	flush_workqueue(ctx->sub_wq);
+
+	for (i = 0; i < params->num_workers; i++) {
+		for (j = 0; j < params->num_jobs; j++) {
+			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
+			KUNIT_ASSERT_TRUE(test, done);
+		}
+	}
+}
+
+static struct kunit_case drm_sched_concurrent_tests[] = {
+	KUNIT_CASE_PARAM(drm_sched_parallel_submit_test, drm_sched_parallel_gen_params),
+	KUNIT_CASE_PARAM(drm_sched_interleaved_submit_test, drm_sched_interleaved_gen_params),
+	{}
+};
+
+static struct kunit_suite drm_sched_concurrent = {
+	.name = "drm_sched_concurrent_tests",
+	.init = drm_sched_concurrent_init,
+	.test_cases = drm_sched_concurrent_tests,
+};
+
 static struct kunit_case drm_sched_cancel_tests[] = {
 	KUNIT_CASE(drm_sched_basic_cancel),
 	{}
@@ -556,6 +893,7 @@ static struct kunit_suite drm_sched_credits = {
 };
 
 kunit_test_suites(&drm_sched_basic,
+		  &drm_sched_concurrent,
 		  &drm_sched_timeout,
 		  &drm_sched_cancel,
 		  &drm_sched_priority,
-- 
2.52.0

