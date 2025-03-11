Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A5A5BC07
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A606710E539;
	Tue, 11 Mar 2025 09:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="L15PXOTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF81D10E545
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RSDKVt/5xfj+wBeHcUyUMPwZptD0F/Qbcd4RpYFrR5Q=; b=L15PXOTpn1E9BrA8/rLrGp3biO
 XT/Stn+s5tFDNbpBcFL6MqAUkJ12rlrof/h5b03a9jYsLOqG1EzuvNSENrTK0B8shD3J3+se9uQJ2
 qnNdjSN1nv/mM7g4i5cB3iURCppH6uYfnwbexx8yBWL0ri9i98utm3ADVkP+B5VUMvyFKa8SLDRqF
 6gQRt78cSgBsWXdzhd71BzkeVnbCVmpSRczUCrKKT2LKPWiCISCrU5aU0jw1ZnFTC6cL2d90AmA+c
 RL2E+5esixpL/8i92DhVln3PEqDYXhpAPyPKh883VjVtBQHUa3PwXplVKuxtJsd5IbjUyq8SXes7g
 hI/JuMlw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1trvpu-006yTZ-0P; Tue, 11 Mar 2025 10:23:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v7 7/7] drm/sched: Add a basic test for checking credit limit
Date: Tue, 11 Mar 2025 09:23:39 +0000
Message-ID: <20250311092339.52199-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
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

Add a basic test for checking whether scheduler respects the configured
credit limit.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 996cac00bb52..7230057e0594 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -412,7 +412,65 @@ static struct kunit_suite drm_sched_modify_sched = {
 	.test_cases = drm_sched_modify_sched_tests,
 };
 
+static void drm_sched_test_credits(struct kunit *test)
+{
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_scheduler *sched;
+	struct drm_mock_sched_job *job[2];
+	bool done;
+	int i;
+
+	/*
+	 * Check that the configured credit limit is respected.
+	 */
+
+	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
+	sched->base.credit_limit = 1;
+
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+
+	job[0] = drm_mock_sched_job_new(test, entity);
+	job[1] = drm_mock_sched_job_new(test, entity);
+
+	drm_mock_sched_job_submit(job[0]);
+	drm_mock_sched_job_submit(job[1]);
+
+	done = drm_mock_sched_job_wait_scheduled(job[0], HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	done = drm_mock_sched_job_wait_scheduled(job[1], HZ);
+	KUNIT_ASSERT_FALSE(test, done);
+
+	i = drm_mock_sched_advance(sched, 1);
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_scheduled(job[1], HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	i = drm_mock_sched_advance(sched, 1);
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_finished(job[1], HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+	drm_mock_sched_fini(sched);
+}
+
+static struct kunit_case drm_sched_credits_tests[] = {
+	KUNIT_CASE(drm_sched_test_credits),
+	{}
+};
+
+static struct kunit_suite drm_sched_credits = {
+	.name = "drm_sched_basic_credits_tests",
+	.test_cases = drm_sched_credits_tests,
+};
+
 kunit_test_suites(&drm_sched_basic,
 		  &drm_sched_timeout,
 		  &drm_sched_priority,
-		  &drm_sched_modify_sched);
+		  &drm_sched_modify_sched,
+		  &drm_sched_credits);
-- 
2.48.0

