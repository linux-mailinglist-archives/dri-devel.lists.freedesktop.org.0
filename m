Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A5A4DED9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E82610E5C3;
	Tue,  4 Mar 2025 13:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gFy9n1pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15E10E5B5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qbjxC1MKzybIQRaEOQdIRrZVH43BbOImRRB1eTOgLek=; b=gFy9n1pjbZFhTcEYelV7rUyubf
 4iP/SOPsQMaJuSgq3eC6DDOhkV8rvsOuNA0ovkg8WW+eqtdFQxf85Tgplnof1XJcwo8faMAonqL5F
 y1OlYVsNGfoiJvyIrxAE86HQug3RUblUEYKbFd/q+gMtM8EWKkFGJeh6cDlj4zlDVP/OkVzFGBeXX
 gpZb//5paYmvoWvOlTrzcVQOA1KRk7WNxkC/Pda6wX0aY6AV+BZWb/00lRTN4tqLiKGwJx1jnlxTe
 al6l7V3RgeWTF0rodI8jcxPq+cG1G1x5QyKTOljg7s0N+96DyzgwaKrHINHv8Bn110G/9oxepPb/J
 sedYtgPw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tpS2Y-003ine-UC; Tue, 04 Mar 2025 14:10:36 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3 4/5] drm/scheduler: Add basic priority tests
Date: Tue,  4 Mar 2025 13:10:29 +0000
Message-ID: <20250304131030.52850-5-tvrtko.ursulin@igalia.com>
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

Add some basic tests for exercising entity priority handling.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 99 ++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index ed22c4870c8b..37797b06fd6e 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2025 Valve Corporation */
 
+#include <linux/delay.h>
+
 #include "sched_tests.h"
 
 /*
@@ -254,5 +256,100 @@ static struct kunit_suite drm_sched_timeout = {
 	.test_cases = drm_sched_timeout_tests,
 };
 
+static void drm_sched_priorities(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity[DRM_SCHED_PRIORITY_COUNT];
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_job *job;
+	const unsigned int qd = 100;
+	unsigned int i, cur_ent = 0;
+	enum drm_sched_priority p;
+	bool done;
+
+	/*
+	 * Submit a bunch of jobs against entities configured with different
+	 * priorities.
+	 */
+
+	BUILD_BUG_ON(DRM_SCHED_PRIORITY_KERNEL > DRM_SCHED_PRIORITY_LOW);
+	BUILD_BUG_ON(ARRAY_SIZE(entity) != DRM_SCHED_PRIORITY_COUNT);
+
+	for (p = DRM_SCHED_PRIORITY_KERNEL; p <= DRM_SCHED_PRIORITY_LOW; p++)
+		entity[p] = drm_mock_sched_entity_new(test, p, sched);
+
+	for (i = 0; i < qd; i++) {
+		job = drm_mock_sched_job_new(test, entity[cur_ent++]);
+		cur_ent %= ARRAY_SIZE(entity);
+		drm_mock_sched_job_set_duration_us(job, 1000);
+		drm_mock_sched_job_submit(job);
+	}
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		drm_mock_sched_entity_free(entity[i]);
+}
+
+static void drm_sched_change_priority(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity[DRM_SCHED_PRIORITY_COUNT];
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_job *job;
+	const unsigned int qd = 1000;
+	unsigned int i, cur_ent = 0;
+	enum drm_sched_priority p;
+	bool done;
+
+	/*
+	 * Submit a bunch of jobs against entities configured with different
+	 * priorities and while waiting for them to complete, periodically keep
+	 * changing their priorities.
+	 *
+	 * We set up the queue-depth (qd) and job duration so the priority
+	 * changing loop has some time to interact with submissions to the
+	 * backend and job completions as they progress.
+	 */
+
+	for (p = DRM_SCHED_PRIORITY_KERNEL; p <= DRM_SCHED_PRIORITY_LOW; p++)
+		entity[p] = drm_mock_sched_entity_new(test, p, sched);
+
+	for (i = 0; i < qd; i++) {
+		job = drm_mock_sched_job_new(test, entity[cur_ent++]);
+		cur_ent %= ARRAY_SIZE(entity);
+		drm_mock_sched_job_set_duration_us(job, 1000);
+		drm_mock_sched_job_submit(job);
+	}
+
+	do {
+		drm_sched_entity_set_priority(&entity[cur_ent]->base,
+					      (entity[cur_ent]->base.priority + 1) %
+					      DRM_SCHED_PRIORITY_COUNT);
+		cur_ent++;
+		cur_ent %= ARRAY_SIZE(entity);
+		usleep_range(200, 500);
+	} while (!drm_mock_sched_job_is_finished(job));
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_EQ(test, done, true);
+
+	for (i = 0; i < ARRAY_SIZE(entity); i++)
+		drm_mock_sched_entity_free(entity[i]);
+}
+
+static struct kunit_case drm_sched_priority_tests[] = {
+	KUNIT_CASE(drm_sched_priorities),
+	KUNIT_CASE(drm_sched_change_priority),
+	{}
+};
+
+static struct kunit_suite drm_sched_priority = {
+	.name = "drm_sched_basic_priority_tests",
+	.init = drm_sched_basic_init,
+	.exit = drm_sched_basic_exit,
+	.test_cases = drm_sched_priority_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
-		  &drm_sched_timeout);
+		  &drm_sched_timeout,
+		  &drm_sched_priority);
-- 
2.48.0

