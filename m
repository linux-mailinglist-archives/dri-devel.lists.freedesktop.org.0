Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC92AA82D8
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8FD10E23D;
	Sat,  3 May 2025 21:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jlFbKoc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD25D10E233;
 Sat,  3 May 2025 21:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KoQUoM7tAPq6PGa36nY725CJ0Ye5F5gDcr1LYKZlPs8=; b=jlFbKoc9+A+NMsp8mBFjxDssx4
 sElX3KYfu9nVumLtt6jnI8VSvNXhHJIsel0Kxn5GBVo20UqmnC3lt9agEjk/B47H5QCJ/Dqz8tmcf
 LkyOxtR1HwuO/l1/3Pn00WXZT8W0N4QMXnwQN+c1ZKWUXV2kDNBURVOM/7Jo9GK+QPabRYMZXOBMB
 o0zNP+UUgCdgA3QZr6drjh9pjHPNxMqYFxJCp3a/MZ0lG9PwDyGC/kChw0mFE/rKJvb5mylE8yx84
 aGdP6j1PdxjqJ2Qr4Otw5pSZsBctULiwQsIAFDHb2y3VVdrfU/w6/Vns6S/TMw7SvcLZn4blzJ800
 Ta3500Og==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwC-002dbs-DB; Sat, 03 May 2025 23:00:49 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:54 -0300
Subject: [PATCH 3/8] drm/sched: Reduce scheduler's timeout for timeout
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-3-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Suem5bY03CNWueFKU3ej7mqmxftA7RWoMFmhOInW/4I=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPm7wa6YiY7MmR7hHH7DIKmP9b2MUtr41YXp
 ANJStKJsDCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5gAKCRA/8w6Kdoj6
 qmF7B/9cZvmMlZxS7JfyRO/GaNgGVfAjg0wh8WeqZA5S+rvMV4r5rn1IpyOgTHMOxwwkDsuLv6u
 dX0GYZ8eQlMY4b/o/WGwV4EpZH9i0pPVobFzFJ9MDaMPI9hAWSUqvbhYy/UVsiBc685wnIyZu06
 oAglhCAz+TeS5Ege+yOv7OuRXUGGsH2+olqTPlZrMauulwDE8okjn/GNlT4qv3dTAar58Tm5TfM
 wdMUe4cSwpPAW7wGeN5HzIgREDHxVmj/odrROAvwswpoENMi2f42GdJwD4xZAc2QMplluMfUh+j
 drvW7ttF44utAKYZ4k4JwCKkOxYp3pA4JiU40Z3n3EfOP8GP
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

As more KUnit tests are introduced to evaluate the basic capabilities of
the `timedout_job()` hook, the test suite will continue to increase in
duration. To reduce the overall running time of the test suite, decrease
the scheduler's timeout for the timeout tests.

Before this commit:

[15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s building, 5.229s running

After this commit:

[15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s building, 4.037s running

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 8f960f0fd31d0af7873f410ceba2d636f58a5474..00c691cb3c306f609684f554f17fcb54ba74cb95 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -5,6 +5,8 @@
 
 #include "sched_tests.h"
 
+#define MOCK_TIMEOUT (HZ / 5)
+
 /*
  * DRM scheduler basic tests should check the basic functional correctness of
  * the scheduler, including some very light smoke testing. More targeted tests,
@@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit *test)
 
 static int drm_sched_timeout_init(struct kunit *test)
 {
-	test->priv = drm_mock_sched_new(test, HZ);
+	test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
 
 	return 0;
 }
@@ -224,17 +226,17 @@ static void drm_sched_basic_timeout(struct kunit *test)
 
 	drm_mock_sched_job_submit(job);
 
-	done = drm_mock_sched_job_wait_scheduled(job, HZ);
+	done = drm_mock_sched_job_wait_scheduled(job, MOCK_TIMEOUT);
 	KUNIT_ASSERT_TRUE(test, done);
 
-	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT / 2);
 	KUNIT_ASSERT_FALSE(test, done);
 
 	KUNIT_ASSERT_EQ(test,
 			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
 			0);
 
-	done = drm_mock_sched_job_wait_finished(job, HZ);
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
 	KUNIT_ASSERT_FALSE(test, done);
 
 	KUNIT_ASSERT_EQ(test,

-- 
2.49.0

