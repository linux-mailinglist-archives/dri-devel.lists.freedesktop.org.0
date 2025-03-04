Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368FA4DED8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3478510E5C5;
	Tue,  4 Mar 2025 13:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mAuetVXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A21C10E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C5I5p1AurK3QtemUoM+FCq3FmQPiNexE6LKBdFmnnrU=; b=mAuetVXabGVerjfHeuMoU3ckz0
 hnP9BEk7Fsg/iZrTUwsah03AWl+K496JpiKbQ0eiA7WuDSJYKI9qr2BpHH1B0LNqUvDk/OxmG66H9
 EVSlX7QTTcZica1AY61Kd50im7OCiXJYYlglpRTGPvqzwPcsv1HPGkWJCMlfTVCWS5+WrEJ8Odjx9
 z3vZDTrygLTit8HVVlzw/EwWh0B4Dq20wMj6/+wgPHCEyCxtfDw+rS4Ki25kg6YDZWEVLbOsLx1nU
 1fzBMYOYQB868NG9VCr7Rltxaih9dZZOCQaWB9/V6Jc3hMXKYr+C02xvNHm+YSAoIkqRkMBUfXnav
 OTGnVLFQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tpS2Y-003inZ-7N; Tue, 04 Mar 2025 14:10:36 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3 3/5] drm/scheduler: Add a simple timeout test
Date: Tue,  4 Mar 2025 13:10:28 +0000
Message-ID: <20250304131030.52850-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
References: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
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

Add a very simple timeout test which submits a single job and verifies
that the timeout handling will run if the backend failed to complete the
job in time.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 11 +++-
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  6 +-
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 64 ++++++++++++++++++-
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 945829df33dc..c2b166d6569b 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -194,7 +194,11 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
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
@@ -212,17 +216,18 @@ static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
  * drm_mock_sched_new - Create a new mock scheduler
  *
  * @test: KUnit test owning the job
+ * @timeout: Job timeout to set
  *
  * Returns: New mock scheduler with allocation managed by the test
  */
-struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test)
+struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 {
 	struct drm_sched_init_args args = {
 		.ops		= &drm_mock_scheduler_ops,
 		.num_rqs	= DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit	= U32_MAX,
 		.hang_limit	= UINT_MAX,
-		.timeout	= MAX_SCHEDULE_TIMEOUT,
+		.timeout	= timeout,
 		.name		= "drm-mock-scheduler",
 	};
 	struct drm_mock_scheduler *sched;
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index db4488faa513..f48d055a5380 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -89,6 +89,9 @@ struct drm_mock_sched_entity {
 struct drm_mock_sched_job {
 	struct drm_sched_job	base;
 
+#define DRM_MOCK_SCHED_JOB_TIMEDOUT 0x1
+	unsigned long		flags;
+
 	struct list_head	link;
 	struct hrtimer		timer;
 
@@ -119,7 +122,8 @@ drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
 	return container_of(sched_job, struct drm_mock_sched_job, base);
 };
 
-struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test);
+struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test,
+					      long timeout);
 void drm_mock_sched_fini(struct drm_mock_scheduler *sched);
 unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
 				    unsigned int num);
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 599dc687ab47..ed22c4870c8b 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -12,7 +12,7 @@
 
 static int drm_sched_basic_init(struct kunit *test)
 {
-	test->priv = drm_mock_sched_new(test);
+	test->priv = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
 
 	return 0;
 }
@@ -24,6 +24,13 @@ static void drm_sched_basic_exit(struct kunit *test)
 	drm_mock_sched_fini(sched);
 }
 
+static int drm_sched_timeout_init(struct kunit *test)
+{
+	test->priv = drm_mock_sched_new(test, HZ);
+
+	return 0;
+}
+
 static void drm_sched_basic_submit(struct kunit *test)
 {
 	struct drm_mock_scheduler *sched = test->priv;
@@ -195,4 +202,57 @@ static struct kunit_suite drm_sched_basic = {
 	.test_cases = drm_sched_basic_tests,
 };
 
-kunit_test_suite(drm_sched_basic);
+static void drm_sched_basic_timeout(struct kunit *test)
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
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_sched_job_new(test, entity);
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
+static struct kunit_case drm_sched_timeout_tests[] = {
+	KUNIT_CASE(drm_sched_basic_timeout),
+	{}
+};
+
+static struct kunit_suite drm_sched_timeout = {
+	.name = "drm_sched_basic_timeout_tests",
+	.init = drm_sched_timeout_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_timeout_tests,
+};
+
+kunit_test_suites(&drm_sched_basic,
+		  &drm_sched_timeout);
-- 
2.48.0

