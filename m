Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F130FAFB65F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8110E4BC;
	Mon,  7 Jul 2025 14:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Jd0LkeP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD10710E4C5;
 Mon,  7 Jul 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RWsoVi7xvaRkDMVuMXwOOEieg74NF/MNrx/pZRUgkWY=; b=Jd0LkeP3ylhZxCgZ0es6E6PDu5
 Nr41l9DN4k419nNqGwuIKrAqfBJpdEUdq5EjSOPS4XWzQdM9g3+ZNM1sHOkRW/f4aLnKWegu8bfQ0
 oiooPBu6MFBBX8s+Qwa20mHVyPZ9VjqqQoqq7Pm+CKxoUjxZ1CunYEJG9vMm3LHftLAn2r+PEXk4c
 yGxRTeGjNsauN0gv6V8hCSWjBwRwUOkm4Jh+18ZJHw1CeyRcvmNVhnF98XFgKTQDUnmQBmfG79zBt
 86hQjB/Q24QfmpDCb22/kLNiXnYNsjjNJRw02EfrvA6kQq5CgbyJUAYLh/imR0SBA2Cm+ZiKzzkdl
 QxpOTzdw==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYn7y-00DaQv-1y; Mon, 07 Jul 2025 16:47:30 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 07 Jul 2025 11:46:33 -0300
Subject: [PATCH v4 4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-sched-skip-reset-v4-4-036c0f0f584f@igalia.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
In-Reply-To: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Zsl8T9mk+kgEqyKd3VpFY3mObb7rS1t9a0Eetk1HiaA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoa93YtHJyrclttWBh2t7mF5RDZhzx1Rsk8jGSf
 BfIbpjfenGJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaGvd2AAKCRA/8w6Kdoj6
 qr33B/wPL6vYvfWCYw0B8NGG5UFvQRs65pir/sbvjPmiD1Dr/RWc2N2AVe9SjLtGPSJcOMN5hcE
 gXnBQZ46YJfRUJa04vtO6JeBMtXnd+K7jm9FnV1CTbvp4Fer23IYDeJydAsfvnPG33fvepYRfX3
 c7cCfg/SEK2hGozjYRdFNzX20hoDKjrXxFmxeBKZtdYFBd/tJcC5jbe9XfefzAmUcvvDSM+1pFP
 rFXldplAkly7sQRJePkId8nrDHfJjKtdmbPkzyfZKdfdSAnhNcaUT/1MXJXDytiqolVouMQcI++
 sW1XjpTtSoLjOQfmpB5ywZVgudnJcpTqIXMlQBM06xYds/GL
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

Add a test to submit a single job against a scheduler with the timeout
configured and verify that if the job is still running, the timeout
handler will skip the reset and allow the job to complete.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  5 +++
 drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 47 ++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 998162202972eb5919dfff4c8784ecc22c00ec9d..b3b33f85b7ae30c8e6bba97866a74978b0a96fa7 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -231,6 +231,11 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 	drm_sched_job_cleanup(sched_job);
 	/* Mock job itself is freed by the kunit framework. */
 
+	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
+		job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index fbba38137f0c324cf2472fe5b3a8a78ec016e829..4adf961e1930203fe94241a8a0ae5f7817874a39 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -98,6 +98,7 @@ struct drm_mock_sched_job {
 
 #define DRM_MOCK_SCHED_JOB_DONE		0x1
 #define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
+#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
 	unsigned long		flags;
 
 	struct list_head	link;
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 41c648782f4548e202bd8711b45d28eead9bd0b2..91c0449590ed24c3da18ab7d930cca47d7c317c7 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -246,8 +246,55 @@ static void drm_sched_basic_timeout(struct kunit *test)
 	drm_mock_sched_entity_free(entity);
 }
 
+static void drm_sched_skip_reset(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job *job;
+	unsigned int i;
+	bool done;
+
+	/*
+	 * Submit a single job against a scheduler with the timeout configured
+	 * and verify that if the job is still running, the timeout handler
+	 * will skip the reset and allow the job to complete.
+	 */
+
+	entity = drm_mock_sched_entity_new(test,
+					   DRM_SCHED_PRIORITY_NORMAL,
+					   sched);
+	job = drm_mock_sched_job_new(test, entity);
+
+	job->flags = DRM_MOCK_SCHED_JOB_DONT_RESET;
+
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	done = drm_mock_sched_job_wait_finished(job, 2 * MOCK_TIMEOUT);
+	KUNIT_ASSERT_FALSE(test, done);
+
+	KUNIT_ASSERT_EQ(test,
+			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
+			DRM_MOCK_SCHED_JOB_TIMEDOUT);
+
+	KUNIT_ASSERT_EQ(test,
+			job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
+			0);
+
+	i = drm_mock_sched_advance(sched, 1);
+	KUNIT_ASSERT_EQ(test, i, 1);
+
+	done = drm_mock_sched_job_wait_finished(job, HZ);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	drm_mock_sched_entity_free(entity);
+}
+
 static struct kunit_case drm_sched_timeout_tests[] = {
 	KUNIT_CASE(drm_sched_basic_timeout),
+	KUNIT_CASE(drm_sched_skip_reset),
 	{}
 };
 

-- 
2.50.0

