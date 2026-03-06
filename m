Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BNeFUACq2msZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A650122510C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7610ED98;
	Fri,  6 Mar 2026 16:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fCJ8zJRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8FC10ED82;
 Fri,  6 Mar 2026 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DrUAaDcdFdYUJJZjWO5BZyc4IilfcHdr+PvpMaQd+Ew=; b=fCJ8zJRYXk9ty2NPAuX01YORbS
 wx+vpvnqKz+2ZQSOX757U0sk7S40QTpZcxQfkHlk7t8OlduPRfu51VHbSyIgpuvEp3rz6RjvlM0iU
 x0SIFRAKTLtWRlmf8bCs49uvpe7UKEJXzAG8lZ272RKy+xygaBqBGwt1hkwH2d7CkO+mvtjtCRD/m
 vfRfMen03KdYF83UOZ3kaTaNF+jYiKybvr1IrEcRbzfOHtLEWDGu1hlP6XzhlAkW3eOcnwLCRT4Fh
 TqemNxZU019KAoXBufPo83J/h6wvfMzh9zl1w9sKggXhjVQRWTDtnZ+a48e4EzzBi1zJ/f2OuLrPm
 5fr1C6Xg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyY8b-00APRy-Th; Fri, 06 Mar 2026 17:34:54 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v7 05/29] drm/sched: Add some more scheduling quality unit
 tests
Date: Fri,  6 Mar 2026 16:34:21 +0000
Message-ID: <20260306163445.97243-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
References: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: A650122510C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.735];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action

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
Acked-by: Danilo Krummrich <dakr@kernel.org>
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
2.52.0

