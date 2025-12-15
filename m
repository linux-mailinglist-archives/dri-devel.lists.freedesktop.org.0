Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1317CBE825
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB9510E543;
	Mon, 15 Dec 2025 15:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QgAH0EGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3A310E531;
 Mon, 15 Dec 2025 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q32WdO2xSTox0YqGFHHNQq3pAENElxlY1A5wzYEE06Y=; b=QgAH0EGsGsBvLNUdUI/F0RX3O1
 mWoFVrZP3wbzE0UC1AN7ol67tOWH9j5I32FbpUhOMEDfPVq+wQd7v109GllvDwUPKGHJ0dRYVtdrX
 Z+33HM0pqHsB8bbLs6ZjvB7a78xzDLKBe69CCHV/5y05qR1EA0xaXLFl2t9cP1hX5k/nxAcEQO5gL
 SF13crL9pQW4Olhaq8znyOCLAgTOCzkVdg31WblkkZO6ayfJFUXaROV4Ygo/SRMmboabLXGNrt0UM
 aKKrH6P4MHJizgsB5QvKk9fVSD9mw+Z3XdTeJ4rhw14WuVTqzVcBeiwEGiaeI9nyBPpwP2lMrpGKs
 hGt77yKQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVABV-00Cz8H-2x; Mon, 15 Dec 2025 16:08:25 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.or, intel-xe@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 04/28] drm/sched: Add some more scheduling quality unit
 tests
Date: Mon, 15 Dec 2025 15:07:43 +0000
Message-ID: <20251215150807.58819-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
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

This time round we explore the rate of submitted job queue processing
with multiple identical parallel clients.

Example test output:

3 clients:
        t               cycle:     min  avg max : ...
        +     0ms                   0    0    0 :   0   0   0
        +   102ms                   2    2    2 :   2   2   2
        +   208ms                   5    6    6 :   6   5   5
        +   310ms                   8    9    9 :   9   9   8
...
        +  2616ms                  82   83   83 :  83  83  82
        +  2717ms                  83   83   83 :  83  83  83
    avg_max_min_delta(x100)=60

Every 100ms for the duration of the test test logs how many jobs each
client had completed, prefixed by minimum, average and maximum numbers.
When finished overall average delta between max and min is output as a
rough indicator to scheduling fairness.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 190 +++++++++++++++++-
 1 file changed, 189 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
index 4a02bc447914..f33306e70bca 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
@@ -195,6 +195,7 @@ struct drm_sched_client_params {
 
 struct drm_sched_test_params {
 	const char *description;
+	unsigned int num_clients;
 	struct drm_sched_client_params client[2];
 };
 
@@ -691,6 +692,193 @@ static struct kunit_suite drm_sched_scheduler_two_clients2 = {
 	.test_cases = drm_sched_scheduler_two_clients_tests,
 };
 
+
+static const struct drm_sched_test_params drm_sched_many_cases[] = {
+	{
+		.description = "2 clients",
+		.num_clients = 2,
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 4,
+			.job_us = 1000,
+			.wait_us = 0,
+			.sync = true,
+		},
+	},
+	{
+		.description = "3 clients",
+		.num_clients = 3,
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 4,
+			.job_us = 1000,
+			.wait_us = 0,
+			.sync = true,
+		},
+	},
+	{
+		.description = "7 clients",
+		.num_clients = 7,
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 4,
+			.job_us = 1000,
+			.wait_us = 0,
+			.sync = true,
+		},
+	},
+	{
+		.description = "13 clients",
+		.num_clients = 13,
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 4,
+			.job_us = 1000,
+			.wait_us = 0,
+			.sync = true,
+		},
+	},
+	{
+		.description = "31 clients",
+		.num_clients = 31,
+		.client[0] = {
+			.priority = DRM_SCHED_PRIORITY_NORMAL,
+			.job_cnt = 2,
+			.job_us = 1000,
+			.wait_us = 0,
+			.sync = true,
+		},
+	},
+};
+
+KUNIT_ARRAY_PARAM(drm_sched_scheduler_many_clients,
+		  drm_sched_many_cases,
+		  drm_sched_desc);
+
+static void drm_sched_scheduler_many_clients_test(struct kunit *test)
+{
+	const struct drm_sched_test_params *params = test->param_value;
+	struct drm_mock_scheduler *sched = test->priv;
+	const unsigned int clients = params->num_clients;
+	unsigned int i, j, delta_total = 0, loops = 0;
+	struct test_client *client;
+	unsigned int *prev_cycle;
+	ktime_t start;
+	char *buf;
+
+	/*
+	 * Many clients with deep-ish async queues.
+	 */
+
+	buf = kunit_kmalloc(test, PAGE_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+	client = kunit_kcalloc(test, clients, sizeof(*client), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, client);
+	prev_cycle = kunit_kcalloc(test, clients, sizeof(*prev_cycle),
+				   GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, prev_cycle);
+
+	for (i = 0; i < clients; i++)
+		client[i].entity =
+			drm_mock_sched_entity_new(test,
+						  DRM_SCHED_PRIORITY_NORMAL,
+						  sched);
+
+	for (i = 0; i < clients; i++) {
+		client[i].test = test;
+		client[i].id = i;
+		client[i].params = params->client[0];
+		client[i].duration = ms_to_ktime(1000 / clients);
+		client[i].cycle_time.min_us = ~0U;
+		client[i].latency_time.min_us = ~0U;
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
+	for (i = 0; i < clients; i++)
+		kthread_queue_work(client[i].worker, &client[i].work);
+
+	start = ktime_get();
+	pr_info("%u clients:\n\tt\t\tcycle:\t  min    avg    max : ...\n", clients);
+	for (;;) {
+		unsigned int min = ~0;
+		unsigned int max = 0;
+		unsigned int total = 0;
+		bool done = true;
+		char pbuf[16];
+
+		memset(buf, 0, PAGE_SIZE);
+		for (i = 0; i < clients; i++) {
+			unsigned int cycle, cycles;
+
+			/* Read current progress from the threaded worker. */
+			cycle = READ_ONCE(client[i].cycle);
+			cycles = READ_ONCE(client[i].cycles);
+
+			snprintf(pbuf, sizeof(pbuf), " %3d", cycle);
+			strncat(buf, pbuf, PAGE_SIZE);
+
+			total += cycle;
+			if (cycle < min)
+				min = cycle;
+			if (cycle > max)
+				max = cycle;
+
+			if (!min || (cycle + 1) < cycles)
+				done = false;
+		}
+
+		loops++;
+		delta_total += max - min;
+
+		pr_info("\t+%6lldms\t\t  %3u  %3u  %3u :%s\n",
+			ktime_to_ms(ktime_sub(ktime_get(), start)),
+			min, DIV_ROUND_UP(total, clients), max, buf);
+
+		if (done)
+			break;
+
+		msleep(100);
+	}
+
+	pr_info("    avg_max_min_delta(x100)=%u\n",
+		loops ? DIV_ROUND_UP(delta_total * 100, loops) : 0);
+
+	for (i = 0; i < clients; i++) {
+		kthread_flush_work(&client[i].work);
+		kthread_destroy_worker(client[i].worker);
+	}
+
+	for (i = 0; i < clients; i++)
+		drm_mock_sched_entity_free(client[i].entity);
+}
+
+static const struct kunit_attributes drm_sched_scheduler_many_clients_attr = {
+	.speed = KUNIT_SPEED_SLOW,
+};
+
+static struct kunit_case drm_sched_scheduler_many_clients_tests[] = {
+	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_many_clients_test,
+			      drm_sched_scheduler_many_clients_gen_params,
+			      drm_sched_scheduler_many_clients_attr),
+	{}
+};
+
+static struct kunit_suite drm_sched_scheduler_many_clients = {
+	.name = "drm_sched_scheduler_many_clients_tests",
+	.init = drm_sched_scheduler_init2,
+	.exit = drm_sched_scheduler_exit,
+	.test_cases = drm_sched_scheduler_many_clients_tests,
+};
+
 kunit_test_suites(&drm_sched_scheduler_overhead,
 		  &drm_sched_scheduler_two_clients1,
-		  &drm_sched_scheduler_two_clients2);
+		  &drm_sched_scheduler_two_clients2,
+		  &drm_sched_scheduler_many_clients);
-- 
2.51.1

