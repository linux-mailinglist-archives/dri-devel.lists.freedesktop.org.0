Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB7A25EB0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D5E10E4D1;
	Mon,  3 Feb 2025 15:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C4ybr60q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1E10E021
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zdRq6AsTjVHlrd4rTHt+bkmSax62OYbrCmTb8GF4LrM=; b=C4ybr60qjR6TRNon9szo49SLj/
 K0P3gD/snsQEdJK3WnnGn54xashPkABxXpBXXb4m8TSCE3jv1ImkUMyfHvj5goe99RQE/EpZodkC2
 453fv5OH6pquBcZkmYU/8Q0O3xgP0Kl8S8UEiLw6iWyA1zmdCcU+KAicE0uK5xk63DF506tjomu9Q
 PxNVX91t8BsTUEshRrNjEoIQ7HIWv79vxhv1GGdtVurKAo1YLu2TOK+m77S3NMotPt6vxGprBIsp+
 5sWe6shhzh4dyhSNF6XhOWvU8pPn3pY7zt2SaaYlfBbBxr17TuB9vg+7ggaI5iqhMGeoFp1f4OSAx
 3mWwHIUw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1teyOn-0035rB-Gu; Mon, 03 Feb 2025 16:30:15 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 3/5] drm/scheduler: Add a simple TDR test
Date: Mon,  3 Feb 2025 15:30:04 +0000
Message-ID: <20250203153007.63400-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
References: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
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

Add a very simple TDR test which submits a single job and verifies that
the TDR handling will run if the backend failed to complete the job in
time.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 .../drm/scheduler/tests/drm_mock_scheduler.c  | 12 +++-
 .../gpu/drm/scheduler/tests/drm_sched_tests.h |  6 +-
 .../scheduler/tests/drm_sched_tests_basic.c   | 64 ++++++++++++++++++-
 3 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
index f1985900a6ba..79b6193ce920 100644
--- a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
@@ -160,7 +160,11 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 static enum drm_gpu_sched_stat
 mock_sched_timedout_job(struct drm_sched_job *sched_job)
 {
-	return DRM_GPU_SCHED_STAT_ENODEV;
+	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+
+	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void mock_sched_free_job(struct drm_sched_job *sched_job)
@@ -174,7 +178,9 @@ static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
 	.free_job = mock_sched_free_job
 };
 
-struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test)
+struct drm_mock_scheduler *
+drm_mock_new_scheduler(struct kunit *test,
+		       long timeout)
 {
 	struct drm_mock_scheduler *sched;
 	int ret;
@@ -188,7 +194,7 @@ struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test)
 			     DRM_SCHED_PRIORITY_COUNT,
 			     U32_MAX, /* max credits */
 			     UINT_MAX, /* hang limit */
-			     MAX_SCHEDULE_TIMEOUT, /* timeout */
+			     timeout,
 			     NULL, /* timeout wq */
 			     NULL, /* score */
 			     "drm-mock-scheduler",
diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
index 421ee2712985..20695f55e453 100644
--- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
@@ -35,6 +35,9 @@ struct drm_mock_sched_entity {
 struct drm_mock_sched_job {
 	struct drm_sched_job	base;
 
+#define DRM_MOCK_SCHED_JOB_TIMEDOUT 0x1
+	unsigned long		flags;
+
 	struct list_head	link;
 	struct hrtimer		timer;
 
@@ -65,7 +68,8 @@ drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
 	return container_of(sched_job, struct drm_mock_sched_job, base);
 };
 
-struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test);
+struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test,
+						  long timeout);
 void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
 unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
 				    unsigned int num);
diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
index 6fd39bea95b1..eb0d54d00f21 100644
--- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
@@ -3,7 +3,7 @@
 
 static int drm_sched_basic_init(struct kunit *test)
 {
-	test->priv = drm_mock_new_scheduler(test);
+	test->priv = drm_mock_new_scheduler(test, MAX_SCHEDULE_TIMEOUT);
 
 	return 0;
 }
@@ -15,6 +15,13 @@ static void drm_sched_basic_exit(struct kunit *test)
 	drm_mock_scheduler_fini(sched);
 }
 
+static int drm_sched_tdr_init(struct kunit *test)
+{
+	test->priv = drm_mock_new_scheduler(test, HZ);
+
+	return 0;
+}
+
 static void drm_sched_basic_submit(struct kunit *test)
 {
 	struct drm_mock_scheduler *sched = test->priv;
@@ -244,4 +251,57 @@ static struct kunit_suite drm_sched_basic = {
 	.test_cases = drm_sched_basic_tests,
 };
 
-kunit_test_suite(drm_sched_basic);
+static void drm_sched_basic_tdr(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job *job;
+	bool done;
+
+	/*
+	 * Submit a single job against a scheduler with the timeout configured
+	 * and verify that the timeout handling will run if the backend fails
+	 * to complete it in time.
+	 */
+
+	entity = drm_mock_new_sched_entity(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_new_sched_job(test, entity);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
+	KUNIT_ASSERT_EQ(test, done, false);
+
+	KUNIT_ASSERT_EQ(test,
+			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
+			0);
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, false);
+
+	KUNIT_ASSERT_EQ(test,
+			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
+			DRM_MOCK_SCHED_JOB_TIMEDOUT);
+
+	drm_mock_sched_entity_free(entity);
+}
+
+static struct kunit_case drm_sched_tdr_tests[] = {
+	KUNIT_CASE(drm_sched_basic_tdr),
+	{}
+};
+
+static struct kunit_suite drm_sched_tdr = {
+	.name = "drm_sched_basic_tdr_tests",
+	.init = drm_sched_tdr_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_tdr_tests,
+};
+
+kunit_test_suites(&drm_sched_basic,
+		  &drm_sched_tdr);
-- 
2.48.0

