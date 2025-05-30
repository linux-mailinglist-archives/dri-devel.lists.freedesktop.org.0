Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F830AC90E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86810E874;
	Fri, 30 May 2025 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gDQDkyJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3795D10E86B;
 Fri, 30 May 2025 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxcFl+LBJwTiMTYOQJARIUi/IDRDe6OiYQITU5lFf5I=; b=gDQDkyJ0GtN1RWhO+lThSHw9qq
 hWcSjVxKgyQ36OkVGQfSwuHBgo+zLW/hf2C8P1QX74z6s7g2pyReU6/KlIukShiJyjGHnugroqBqU
 AGakH9SZYWAKY3H9fB+YKxYH+nmDAbEERoDp56F6C4BeZXy2duy87SrtXcfwo7/e23LoDFPMTY/0E
 ypGapXFLJjDshMEOVqU3fTSdTEfQfK4knDfsQ9WzftpphlF8b0v10d4DJcIzb7Aaj/f8lSEWqihA8
 FKAwfqiuBEbuR9hS5CoaE1jOa+X83tQ00Xp8rdjHfSjorN2R615PHjG5JBCyYqLvkAYRniZdBq/OD
 7HDHAVSQ==;
Received: from [189.7.87.163]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uL0Ji-00FFzl-IM; Fri, 30 May 2025 16:02:38 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 30 May 2025 11:01:33 -0300
Subject: [PATCH v2 4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sched-skip-reset-v2-4-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3521; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QgSiEXXzK5zlBsgMf3fkRmMc0trq2YPSrm+l8wdndpQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoObpUO9e4/mGHGwCRDKvrYrMxE2Z8QcQusc8TU
 e1MVkYVjXmJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaDm6VAAKCRA/8w6Kdoj6
 qvKaB/9tPUCSistXod56zqCfD60KxaNk+DZiYKwaFNJ53OAsRxsE1ue7QzEiTLjxy9FvQCRcoMb
 pPGw6EOSfAov8P6nj75gA2HGq9vHgyWU8K5kc8GMj7qAKjaN1t/v7Q4EhbBIM3T8/2MIaSXkViI
 5KoGOUoFmA9A5ZUs/heFV+MvmhgPUPD2Hfo5TrkciV9pMLhbGh8/ss8L6zpkSvZlFCCNU5FKYb6
 Ah6LPD3WqgUU3Xv3BBfgInCMUbHAKFVm4M+dcwe1AInZTAtew/jJwF8DYPEOCoWmUib+Yd76W2k
 sphsAHvJtLSKEY8jFCIjdEwecIRwwYLEVhzFuJjMW9oMpu+b
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
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  5 +++
 drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 43 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index fdf5f34b39e02c8a8648d8bea566a27fd3251516..39429f5cd19ee3c23816f257d566b47d3daa4baa 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -208,6 +208,11 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 
 	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
 
+	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
+		job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 27caf8285fb74b9f3c9ce2daa1c44d4a0c967e92..5259f181e55387c41efbcd3f6addc9465331d787 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -98,6 +98,7 @@ struct drm_mock_sched_job {
 
 #define DRM_MOCK_SCHED_JOB_DONE		0x1
 #define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
+#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
 	unsigned long		flags;
 
 	struct list_head	link;
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 41c648782f4548e202bd8711b45d28eead9bd0b2..2ba2d1b0c3cad9626ab9d89cfae05244c670a826 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -246,8 +246,51 @@ static void drm_sched_basic_timeout(struct kunit *test)
 	drm_mock_sched_entity_free(entity);
 }
 
+static void drm_sched_skip_reset(struct kunit *test)
+{
+	struct drm_mock_scheduler *sched = test->priv;
+	struct drm_mock_sched_entity *entity;
+	struct drm_mock_sched_job *job;
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
+	drm_mock_sched_job_set_duration_us(job, jiffies_to_usecs(2 * MOCK_TIMEOUT));
+	drm_mock_sched_job_submit(job);
+
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
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
+	KUNIT_ASSERT_FALSE(test, list_empty(&sched->job_list));
+
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
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
2.49.0

