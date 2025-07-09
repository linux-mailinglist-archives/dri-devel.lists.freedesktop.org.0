Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206DAFE84C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141510E7B3;
	Wed,  9 Jul 2025 11:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WN5+m8hC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EB410E7B3;
 Wed,  9 Jul 2025 11:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78286614A9;
 Wed,  9 Jul 2025 11:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF27C4CEF5;
 Wed,  9 Jul 2025 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752062016;
 bh=i/0vpVLwuNfJONVWKkjXsF93uf5k77Dhi7/RFzvBlmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WN5+m8hCqTg6Nv00z0Zk93h/yacz9gONUma6hONCfMdRKhKi+W6KTOXSdrRmjm8SN
 p0JEUtmE+HeU9we0Ul97k1iGyOGbGKxk1ErR1aDMOyMOfUiDdwfZ3X1yzUVjMGVCWa
 3j0sIU6jAntivlH3IASY9zcGOTU9NjpBAH5KWGr1KiKgETcQyYaivAEyNZZrimzuAM
 ynBl358QbenNY8RCSqZaPJ5gdaVuHGPyXeCmU6tQSzDZk7uJFbCCOg3NJubZazB+dK
 Gi6qq4gczF0ClIxVh6nfNZ1j+TpojCPHepVlZkgXonBLUWw0zYM60C0OCOARSfQB+Z
 NV+c89v21vvdw==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 3/7] drm/sched/tests: Add unit test for cancel_job()
Date: Wed,  9 Jul 2025 13:52:53 +0200
Message-ID: <20250709115257.106370-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The scheduler unit tests now provide a new callback, cancel_job(). This
callback gets used by drm_sched_fini() for all still pending jobs to
cancel them.

Implement a new unit test to test this.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594..b1ae10c6bb37 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -204,6 +204,47 @@ static struct kunit_suite drm_sched_basic = {
 	.test_cases = drm_sched_basic_tests,
 };
 
+static void drm_sched_basic_cancel(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job;
+	bool done;
+
+	/*
+	 * Check that drm_sched_fini() uses the cancel_job() callback to cancel
+	 * jobs that are still pending.
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	job = drm_mock_sched_job_new(test, entity);
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+
+	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
+}
+
+static struct kunit_case drm_sched_cancel_tests[] = {
+	KUNIT_CASE(drm_sched_basic_cancel),
+	{}
+};
+
+static struct kunit_suite drm_sched_cancel = {
+	.name = "drm_sched_basic_cancel_tests",
+	.init = drm_sched_basic_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_cancel_tests,
+};
+
 static void drm_sched_basic_timeout(struct kunit *test)
 {
 	struct drm_mock_scheduler *sched = test->priv;
@@ -471,6 +512,7 @@ static struct kunit_suite drm_sched_credits = {
 
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
+		  &drm_sched_cancel,
 		  &drm_sched_priority,
 		  &drm_sched_modify_sched,
 		  &drm_sched_credits);
-- 
2.49.0

