Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFNlI0lroWkOswQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:00:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C01B5B00
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8B10EAD6;
	Fri, 27 Feb 2026 10:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QtzjDs3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123810EAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sJb67b9+5nC+/M+8C5y1TkVR40xkSP7H6AK83VZF7Rg=; b=QtzjDs3jbmab8K2HssWRS8iMeq
 r/yXTsuFiL7a15SWH3B7+8+2iPdCdHXiVxdOCppeHPGaDSN2/d518FXka69vnkehBp1Q0L8bLA5n+
 8NKm6q0keojeh33ic0XyVx24YXBbd1Wu9RkUwZuDzr5J8VDbOPWNyyOW+mF6r+omgD4vSCR0vCE6W
 B6/kj7fg7LgHzxoz28LcWN5LAmHJ4b2YsxdEFRLE+1RQLlM2q2M8UkT1iBLLuSAAlSr9ZMo1zgtIJ
 oRVt9v9WQcocSlMWGpluA70W+ardBiVr0WRO3Q3Ze+JJgP7vEq8T7w3quobLyncEY41JCcNQHGSyo
 adl+DjOw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vvue5-006SQx-N2; Fri, 27 Feb 2026 11:00:29 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: Speed up some unit tests
Date: Fri, 27 Feb 2026 10:00:25 +0000
Message-ID: <20260227100025.173-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[igalia.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[dakr.kernel.org:query timed out,mripard.kernel.org:query timed out,phasta.kernel.org:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: B45C01B5B00
X-Rspamd-Action: no action

Some tests are on right on the limit of targetting a one second runtime,
and some of those have recently been correctly marked as slow. Lets
instead make them a bit quicker, by either reducing the amount of
submitted jobs or waiting a bit less. For the latter a comment is added to
explain why that should be fine, and for the former, they are tests which
aim to hit races via stress testing, so reducing the runtime is also fine
since the main thing is the number of test runs over time and machines.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reported-by: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index a5a5a35a87b0..5181454479a5 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -382,7 +382,7 @@ static void drm_sched_change_priority(struct kunit *test)
 	struct drm_mock_sched_entity *entity[DRM_SCHED_PRIORITY_COUNT];
 	struct drm_mock_scheduler *sched = test->priv;
 	struct drm_mock_sched_job *job;
-	const unsigned int qd = 1000;
+	const unsigned int qd = 500;
 	unsigned int i, cur_ent = 0;
 	enum drm_sched_priority p;
 
@@ -421,7 +421,7 @@ static void drm_sched_change_priority(struct kunit *test)
 
 static struct kunit_case drm_sched_priority_tests[] = {
 	KUNIT_CASE(drm_sched_priorities),
-	KUNIT_CASE_SLOW(drm_sched_change_priority),
+	KUNIT_CASE(drm_sched_change_priority),
 	{}
 };
 
@@ -438,7 +438,7 @@ static void drm_sched_test_modify_sched(struct kunit *test)
 	struct drm_mock_sched_entity *entity[13];
 	struct drm_mock_scheduler *sched[3];
 	struct drm_mock_sched_job *job;
-	const unsigned int qd = 1000;
+	const unsigned int qd = 500;
 
 	/*
 	 * Submit a bunch of jobs against entities configured with different
@@ -500,6 +500,7 @@ static struct kunit_suite drm_sched_modify_sched = {
 
 static void drm_sched_test_credits(struct kunit *test)
 {
+	const long timeout = msecs_to_jiffies(200);
 	struct drm_mock_sched_entity *entity;
 	struct drm_mock_scheduler *sched;
 	struct drm_mock_sched_job *job[2];
@@ -523,22 +524,33 @@ static void drm_sched_test_credits(struct kunit *test)
 	drm_mock_sched_job_submit(job[0]);
 	drm_mock_sched_job_submit(job[1]);
 
-	done = drm_mock_sched_job_wait_scheduled(job[0], HZ);
+	done = drm_mock_sched_job_wait_scheduled(job[0], timeout);
 	KUNIT_ASSERT_TRUE(test, done);
 
-	done = drm_mock_sched_job_wait_scheduled(job[1], HZ);
+	/*
+	 * Verify that the scheduler has not consumed more than the configured
+	 * single credit. This can false negative if the system fails to
+	 * execute the scheduler's workqueue two times between submitting two
+	 * jobs and this wait expires, but this is so unlikely that we opt for a
+	 * timeout which does not make the test excessively slow.
+	 */
+	done = drm_mock_sched_job_wait_scheduled(job[1], timeout);
 	KUNIT_ASSERT_FALSE(test, done);
 
+	/*
+	 * Advance the timeline and make sure the second job gets scheduled and
+	 * completed.
+	 */
 	i = drm_mock_sched_advance(sched, 1);
 	KUNIT_ASSERT_EQ(test, i, 1);
 
-	done = drm_mock_sched_job_wait_scheduled(job[1], HZ);
+	done = drm_mock_sched_job_wait_scheduled(job[1], timeout);
 	KUNIT_ASSERT_TRUE(test, done);
 
 	i = drm_mock_sched_advance(sched, 1);
 	KUNIT_ASSERT_EQ(test, i, 1);
 
-	done = drm_mock_sched_job_wait_finished(job[1], HZ);
+	done = drm_mock_sched_job_wait_finished(job[1], timeout);
 	KUNIT_ASSERT_TRUE(test, done);
 
 	drm_mock_sched_entity_free(entity);
@@ -546,7 +558,7 @@ static void drm_sched_test_credits(struct kunit *test)
 }
 
 static struct kunit_case drm_sched_credits_tests[] = {
-	KUNIT_CASE_SLOW(drm_sched_test_credits),
+	KUNIT_CASE(drm_sched_test_credits),
 	{}
 };
 
-- 
2.52.0

