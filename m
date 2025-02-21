Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA8A3F3DF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 13:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D521E10EA64;
	Fri, 21 Feb 2025 12:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dl/g9qrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7310E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=no1rZyXm7qh1ucbvivicTVVOMbqN1+m43ZNecpW0ZXk=; b=dl/g9qrhYY72OpSt4qjB2HUuiv
 4tj4lNK4qVRQvz9uloSzuHLxWyDv66EuTntZ17kK5fOmfIowGtbJN0HkSmZMB5a1etc0igGZ2X3nr
 WpJdL8SRRbHxnTK2hwytO0AYShz2YFK19D+n89a6NXs9NYGbpN6Uf5DJ55FyoJww+TOg8NqTF3WA2
 hqpk509YzRs6Hjl+rYkrLj1eCV8K2VdBS/0c4u3AK9DnIJWihKFD0jV+0kQuG26K11EM1H2mMvEbe
 70AzIc+0eofsSm6mdy9CdIrnopvLAxM5vV/bC1vvPeM7+8XczqnJ+RlfnuEf6vwRES3CJbQTh68Cw
 ngeW7NBw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlRqH-00G5GM-Di; Fri, 21 Feb 2025 13:09:23 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 5/5] drm/scheduler: Add a basic test for modifying entities
 scheduler list
Date: Fri, 21 Feb 2025 12:09:17 +0000
Message-ID: <20250221120917.80617-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
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

Add a basic test for exercising modifying the entities scheduler list at
runtime.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index f0e5ae1220c7..2744a8c262c4 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -349,6 +349,77 @@ static struct kunit_suite drm_sched_priority = {
 	.test_cases = drm_sched_priority_tests,
 };
 
+static void drm_sched_test_modify_sched(struct kunit *test)
+{
+	unsigned int i, cur_ent = 0, cur_sched = 0;
+	struct drm_mock_sched_entity *entity[13];
+	struct drm_mock_scheduler *sched[3];
+	struct drm_mock_sched_job *job;
+	const unsigned int qd = 1000;
+	bool done;
+
+	/*
+	 * Submit a bunch of jobs against entities configured with different
+	 * schedulers and while waiting for them to complete, periodically keep
+	 * changing schedulers associated with each entity.
+	 *
+	 * We set up the queue-depth (qd) and job duration so the sched modify
+	 * loop has some time to interact with submissions to the backend and
+	 * job completions as they progress.
+	 *
+	 * For the number of schedulers and entities we use primes in order to
+	 * perturb the entity->sched assignments with less of a regular pattern.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(sched); i++)
+		sched[i] = drm_mock_new_scheduler(test, MAX_SCHEDULE_TIMEOUT);
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		entity[i] = drm_mock_new_sched_entity(test,
+						      DRM_SCHED_PRIORITY_NORMAL,
+						      sched[i % ARRAY_SIZE(sched)]);
+
+	for (i = 0; i < qd; i++) {
+		job = drm_mock_new_sched_job(test, entity[cur_ent++]);
+		cur_ent %= ARRAY_SIZE(entity);
+		drm_mock_sched_job_set_duration_us(job, 1000);
+		drm_mock_sched_job_submit(job);
+	}
+
+	do {
+		struct drm_gpu_scheduler *modify;
+
+		usleep_range(200, 500);
+		cur_ent++;
+		cur_ent %= ARRAY_SIZE(entity);
+		cur_sched++;
+		cur_sched %= ARRAY_SIZE(sched);
+		modify = &sched[cur_sched]->base;
+		drm_sched_entity_modify_sched(&entity[cur_ent]->base, &modify,
+					      1);
+	} while (!drm_mock_sched_job_is_finished(job));
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		drm_mock_sched_entity_free(entity[i]);
+
+	for (i = 0; i < ARRAY_SIZE(sched); i++)
+		drm_mock_scheduler_fini(sched[i]);
+}
+
+static struct kunit_case drm_sched_modify_sched_tests[] = {
+	KUNIT_CASE(drm_sched_test_modify_sched),
+	{}
+};
+
+static struct kunit_suite drm_sched_modify_sched = {
+	.name = "drm_sched_basic_modify_sched_tests",
+	.test_cases = drm_sched_modify_sched_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
-		  &drm_sched_priority);
+		  &drm_sched_priority,
+		  &drm_sched_modify_sched);
-- 
2.48.0

