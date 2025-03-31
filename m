Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54737A76EEA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1BA10E480;
	Mon, 31 Mar 2025 20:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YCxqHWu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0710E47E;
 Mon, 31 Mar 2025 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cvqcnUTGixSXd8sEJm9ij3tsrxHA4UT/dcdcK7ntKWs=; b=YCxqHWu1WqeQSbGs2Y+O5Dc9kI
 jcjMfKTwaCYWiw01kEdgxpOHWodj5fYiyCqTwG8IZaGqMlwgFQkSYeJ7vI7CQF8t2lJJA+OyQoqIC
 Wx8gxuJ3Z5BoqBSFcIOQTBS34H3XVvWsjHeG/uaMDTGthLBmmlRfeiR4yVdEiUlA8BXKShzFy5eCg
 ltv7cKqlPYTOnB5vDYJqSi0VXtpEkyojpRr/h1ZlbtdEiHQp1GKdmFOQTtcorVCu2ZXAsRp4KIYLB
 5H1Uh/R5oMZlAYE8fOk/zbfV8jlopk9KmPtBDSRAq2Je49K2jEdvzZvDzZT1CNJWtVrod+c9rIdS5
 oAHr6tbA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZW-009M2k-Lb; Mon, 31 Mar 2025 22:17:26 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [RFC v3 01/14] drm/sched: Add some scheduling quality unit tests
Date: Mon, 31 Mar 2025 21:16:52 +0100
Message-ID: <20250331201705.60663-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 548 ++++++++++++++++++
 2 files changed, 550 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

diff --git a/drivers/gpu/drm/scheduler/tests/Makefile b/drivers/gpu/drm/scheduler/tests/Makefile
index 5bf707bad373..9ec185fbbc15 100644
--- a/drivers/gpu/drm/scheduler/tests/Makefile
+++ b/drivers/gpu/drm/scheduler/tests/Makefile
@@ -2,6 +2,7 @@
 
 drm-sched-tests-y := \
         mock_scheduler.o \
-        tests_basic.o
+        tests_basic.o \
+        tests_scheduler.o
 
 obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += drm-sched-tests.o
diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
new file mode 100644
index 000000000000..aa37c0dc8d66
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Valve Corporation */
+
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/ktime.h>
+
+#include "sched_tests.h"
+
+/*
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity
+ * selection logic.
+ */
+
+static int drm_sched_scheduler_init(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched;
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	sched->base.credit_limit = 1;
+
+	test->priv = sched;
+
+	return 0;
+}
+
+static void drm_sched_scheduler_exit(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+
+	drm_mock_sched_fini(sched);
+}
+
+static void drm_sched_scheduler_queue_overhead(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity;
+	const unsigned int job_us = 1000;
+	const unsigned int jobs = 1000;
+	const unsigned int total_us = jobs * job_us;
+	struct drm_mock_sched_job *job, *first;
+	ktime_t start, end;
+	bool done;
+	int i;
+
+	/*
+	 * Deep queue job at a time processing (single credit).
+	 *
+	 * This measures the overhead of picking and processing a job at a time
+	 * by comparing the ideal total "GPU" time of all submitted jobs versus
+	 * the time actually taken.
+	 */
+
+	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
+
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	for (i = 0; i <= jobs; i++) {
+		job = drm_mock_sched_job_new(test, entity);
+		if (i == 0)
+			first = job; /* Extra first job blocks the queue */
+		else
+			drm_mock_sched_job_set_duration_us(job, job_us);
+		drm_mock_sched_job_submit(job);
+	}
+
+	done = drm_mock_sched_job_wait_scheduled(first, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	start = ktime_get();
+	i = drm_mock_sched_advance(sched, 1); /* Release the queue */
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_finished(job,
+						usecs_to_jiffies(total_us) * 5);
+	end = ktime_get();
+	KUNIT_ASSERT_TRUE(test, done);
+
+	pr_info("Expected %uus, actual %lldus\n",
+		total_us,
+		ktime_to_us(ktime_sub(end, start)));
+
+	drm_mock_sched_entity_free(entity);
+}
+
+static void drm_sched_scheduler_ping_pong(struct kunit *test)
+{
+	struct drm_mock_sched_job *job, *first, *prev = NULL;
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity[2];
+	const unsigned int job_us = 1000;
+	const unsigned int jobs = 1000;
+	const unsigned int total_us = jobs * job_us;
+	ktime_t start, end;
+	bool done;
+	int i;
+
+	/*
+	 * Two entitites in inter-dependency chain.
+	 *
+	 * This measures the overhead of picking and processing a job at a time,
+	 * where each job depends on the previous one from the diffferent
+	 * entity, by comparing the ideal total "GPU" time of all submitted jobs
+	 * versus the time actually taken.
+	 */
+
+	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		entity[i] = drm_mock_sched_entity_new(test,
+						      DRM_SCHED_PRIORITY_NORMAL,
+						      sched);
+
+	for (i = 0; i <= jobs; i++) {
+		job = drm_mock_sched_job_new(test, entity[i & 1]);
+		if (i == 0)
+			first = job; /* Extra first job blocks the queue */
+		else
+			drm_mock_sched_job_set_duration_us(job, job_us);
+		if (prev)
+			drm_sched_job_add_dependency(&job->base,
+						     dma_fence_get(&prev->base.s_fence->finished));
+		drm_mock_sched_job_submit(job);
+		prev = job;
+	}
+
+	done = drm_mock_sched_job_wait_scheduled(first, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	start = ktime_get();
+	i = drm_mock_sched_advance(sched, 1); /* Release the queue */
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_finished(job,
+						usecs_to_jiffies(total_us) * 5);
+	end = ktime_get();
+	KUNIT_ASSERT_TRUE(test, done);
+
+	pr_info("Expected %uus, actual %lldus\n",
+		total_us,
+		ktime_to_us(ktime_sub(end, start)));
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		drm_mock_sched_entity_free(entity[i]);
+}
+
+static struct kunit_case drm_sched_scheduler_overhead_tests[] = {
+	KUNIT_CASE_SLOW(drm_sched_scheduler_queue_overhead),
+	KUNIT_CASE_SLOW(drm_sched_scheduler_ping_pong),
+	{}
+};
+
+static struct kunit_suite drm_sched_scheduler_overhead = {
+	.name = "drm_sched_scheduler_overhead_tests",
+	.init = drm_sched_scheduler_init,
+	.exit = drm_sched_scheduler_exit,
+	.test_cases = drm_sched_scheduler_overhead_tests,
+};
+
+struct drm_sched_client_params {
+	enum drm_sched_priority priority;
+	unsigned int job_cnt;
+	unsigned int job_us;
+	unsigned int wait_us;
+	bool sync;
+};
+
+struct drm_sched_test_params {
+	const char *description;
+	struct drm_sched_client_params client[2];
+};
+
+static const struct drm_sched_test_params drm_sched_cases[] = {
+	{
+		.description = "Normal and normal",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+	},
+	{
+		.description = "Normal and low",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_LOW,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+	},
+	{
+		.description = "High and normal",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_HIGH,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+	},
+	{
+		.description = "High and low",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_HIGH,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_LOW,
+			.job_cnt = 1,
+			.job_us = 8000,
+			.wait_us = 0,
+			.sync = false,
+		},
+	},
+	{
+		.description = "50 and 50",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 1500,
+			.wait_us = 1500,
+			.sync = true,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 2500,
+			.wait_us = 2500,
+			.sync = true,
+		},
+	},
+	{
+		.description = "50 and 50 low",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 1500,
+			.wait_us = 1500,
+			.sync = true,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_LOW,
+			.job_cnt = 1,
+			.job_us = 2500,
+			.wait_us = 2500,
+			.sync = true,
+		},
+	},
+	{
+		.description = "50 high and 50",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_HIGH,
+			.job_cnt = 1,
+			.job_us = 1500,
+			.wait_us = 1500,
+			.sync = true,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 2500,
+			.wait_us = 2500,
+			.sync = true,
+		},
+	},
+	{
+		.description = "Low hog and interactive",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_LOW,
+			.job_cnt = 3,
+			.job_us = 2500,
+			.wait_us = 500,
+			.sync = false,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 500,
+			.wait_us = 10000,
+			.sync = true,
+		},
+	},
+	{
+		.description = "Heavy and interactive",
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 3,
+			.job_us = 2500,
+			.wait_us = 2500,
+			.sync = true,
+		},
+		.client[1] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 1,
+			.job_us = 1000,
+			.wait_us = 9000,
+			.sync = true,
+		},
+	},
+};
+
+static void
+drm_sched_desc(const struct drm_sched_test_params *params, char *desc)
+{
+	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_sched_scheduler_two_clients,
+		  drm_sched_cases,
+		  drm_sched_desc);
+
+struct test_client {
+	struct kunit *test;
+
+	struct drm_mock_sched_entity	*entity;
+
+	struct kthread_worker	*worker;
+	struct kthread_work	work;
+
+	unsigned int id;
+	ktime_t duration;
+
+	struct drm_sched_client_params params;
+
+	ktime_t ideal_duration;
+	unsigned int cycles;
+	unsigned int cycle;
+	ktime_t	start;
+	ktime_t	end;
+	bool done;
+
+};
+
+static void drm_sched_client_work(struct kthread_work *work)
+{
+	struct test_client *client = container_of(work, typeof(*client), work);
+	unsigned int cycle, work_us, period_us, sync_wait, exit_wait;
+	struct drm_mock_sched_job *job = NULL;
+
+	work_us = client->params.job_cnt * client->params.job_us;
+	period_us = work_us + client->params.wait_us;
+	client->cycles = DIV_ROUND_UP(ktime_to_us(client->duration), period_us);
+	client->ideal_duration = us_to_ktime(client->cycles * period_us);
+	sync_wait = msecs_to_jiffies(work_us / 1000) * 3;
+	exit_wait = msecs_to_jiffies(ktime_to_ms(client->duration)) * 5;
+
+	client->start = ktime_get();
+
+	for (cycle = 0; cycle < client->cycles; cycle++) {
+		unsigned int batch;
+
+		if (READ_ONCE(client->done))
+			break;
+
+		for (batch = 0; batch < client->params.job_cnt; batch++) {
+			job = drm_mock_sched_job_new(client->test,
+						     client->entity);
+			drm_mock_sched_job_set_duration_us(job,
+							   client->params.job_us);
+			drm_mock_sched_job_submit(job);
+		}
+
+		if (client->params.sync)
+			drm_mock_sched_job_wait_finished(job, sync_wait);
+
+		WRITE_ONCE(client->cycle, cycle);
+
+		if (READ_ONCE(client->done))
+			break;
+
+		if (client->params.wait_us)
+			fsleep(client->params.wait_us);
+		else
+			cond_resched();
+	}
+
+	client->done = drm_mock_sched_job_wait_finished(job, exit_wait);
+	client->end = ktime_get();
+}
+
+static const char *prio_str(enum drm_sched_priority prio)
+{
+	switch (prio) {
+	case DRM_SCHED_PRIORITY_KERNEL:
+		return "kernel";
+	case DRM_SCHED_PRIORITY_LOW:
+		return "low";
+	case DRM_SCHED_PRIORITY_NORMAL:
+		return "normal";
+	case DRM_SCHED_PRIORITY_HIGH:
+		return "high";
+	default:
+		return "???";
+	}
+}
+
+static void drm_sched_scheduler_two_clients_test(struct kunit *test)
+{
+	const struct drm_sched_test_params *params = test->param_value;
+	struct drm_mock_scheduler *sched = test->priv;
+	struct test_client client[2] = { };
+	unsigned int prev_cycle[2] = { };
+	unsigned int i, j;
+	ktime_t start;
+
+	/*
+	 * Same job stream from from two clients.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(client); i++)
+		client[i].entity =
+			drm_mock_sched_entity_new(test,
+						  params->client[i].priority,
+						  sched);
+
+	for (i = 0; i < ARRAY_SIZE(client); i++) {
+		client[i].test = test;
+		client[i].id = i;
+		client[i].duration = ms_to_ktime(1000);
+		client[i].params = params->client[i];
+		client[i].worker =
+			kthread_create_worker(0, "%s-%u", __func__, i);
+		if (IS_ERR(client[i].worker)) {
+			for (j = 0; j < i; j++)
+				kthread_destroy_worker(client[j].worker);
+			KUNIT_FAIL(test, "Failed to create worker!\n");
+		}
+
+		kthread_init_work(&client[i].work, drm_sched_client_work);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(client); i++)
+		kthread_queue_work(client[i].worker, &client[i].work);
+
+	/*
+	 * The clients (workers) can be a mix of async (deep submission queue),
+	 * sync (one job at a time), or something in between. Therefore it is
+	 * difficult to display a single metric representing their progress.
+	 *
+	 * Each struct drm_sched_client_params describes the actual submission
+	 * pattern which happens in the following steps:
+	 *  1. Submit N jobs
+	 *  2. Wait for last submitted job to finish
+	 *  3. Sleep for U micro-seconds
+	 *  4. Goto 1. for C cycles
+	 *
+	 * Where number of cycles is calculated to match the target client
+	 * duration from the respective struct drm_sched_test_params.
+	 *
+	 * To asses scheduling behaviour what we output for both clients is:
+	 *  - pct: Percentage progress of the jobs submitted
+	 *  - cps: "Cycles" per second (where one cycle is one 1.-4. above)
+	 *  -  qd: Number of outstanding jobs in the client/entity
+	 */
+
+	start = ktime_get();
+	pr_info("%s:\n\t            pct1 cps1 qd1;  pct2 cps2 qd2\n",
+		params->description);
+	while (!READ_ONCE(client[0].done) || !READ_ONCE(client[1].done)) {
+		unsigned int pct[2], qd[2], cycle[2], cps[2];
+
+		for (i = 0; i < ARRAY_SIZE(client); i++) {
+			qd[i] = spsc_queue_count(&client[i].entity->base.job_queue);
+			cycle[i] = READ_ONCE(client[i].cycle);
+			cps[i] = DIV_ROUND_UP(1000 * (cycle[i] - prev_cycle[i]),
+					      100);
+			if (client[i].cycles)
+				pct[i] = DIV_ROUND_UP(100 * cycle[i],
+						      client[i].cycles);
+			else
+				pct[i] = 0;
+			prev_cycle[i] = cycle[i];
+		}
+		pr_info("\t+%6lldms: %3u %5u %4u; %3u %5u %4u\n",
+			ktime_to_ms(ktime_sub(ktime_get(), start)),
+			pct[0], cps[0], qd[0],
+			pct[1], cps[1], qd[1]);
+		msleep(100);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(client); i++) {
+		kthread_flush_work(&client[i].work);
+		kthread_destroy_worker(client[i].worker);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(client); i++)
+		KUNIT_ASSERT_TRUE(test, client[i].done);
+
+	for (i = 0; i < ARRAY_SIZE(client); i++) {
+		pr_info("    %u: prio=%s sync=%u elapsed_ms=%lldms (ideal_ms=%lldms)",
+			i,
+			prio_str(params->client[i].priority),
+			params->client[i].sync,
+			ktime_to_ms(ktime_sub(client[i].end, client[i].start)),
+			ktime_to_ms(client[i].ideal_duration));
+		drm_mock_sched_entity_free(client[i].entity);
+	}
+}
+
+static const struct kunit_attributes drm_sched_scheduler_two_clients_attr = {
+	.speed = KUNIT_SPEED_SLOW,
+};
+
+static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
+	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
+			      drm_sched_scheduler_two_clients_gen_params,
+			      drm_sched_scheduler_two_clients_attr),
+	{}
+};
+
+static struct kunit_suite drm_sched_scheduler_two_clients = {
+	.name = "drm_sched_scheduler_two_clients_tests",
+	.init = drm_sched_scheduler_init,
+	.exit = drm_sched_scheduler_exit,
+	.test_cases = drm_sched_scheduler_two_clients_tests,
+};
+
+kunit_test_suites(&drm_sched_scheduler_overhead,
+		  &drm_sched_scheduler_two_clients);
-- 
2.48.0

