Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AEB04A05
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83D10E4F8;
	Mon, 14 Jul 2025 22:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DLlZ3VVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6110E4F2;
 Mon, 14 Jul 2025 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6b/Qf2u4GvK3t5AQl0cJEQAp2CzwfegVeKvxvU8mBqw=; b=DLlZ3VVXrlWWyrzfNxUUreuVIG
 n9ucUPaJTrDsHseO6p6agwgcMwLRO+3WX9UkpG+b588p7nJAhlbIatCgAMZP3PdIWtzJfrQysqZtc
 UBy5GWkD699TeK36fZujhNQ5U+EEHWwlw8m48ESLWPly7O1avVb8BFAYQl0fKac/zs9qLxXzxSfjQ
 gzLGqFHe7x0ES0oxAZF56BbAnKAbKwfCyuvEqa95jSSGTnp6RFAyXzBz8TNRAD4Vg7Xb9vx8XD7Wy
 mNtdCx6m7RhA3XIeG5x0QWNIUcpEmj1RCjOpWL4FPG7+3YmRC2ksO6MkUHf59YHDX9y/6bSEYjshP
 fbqUux6w==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRLC-00Gaod-Mk; Tue, 15 Jul 2025 00:08:06 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:05 -0300
Subject: [PATCH v6 4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-4-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=wVPyxlozLmERkapki05JJKNNgNhQOMiPPc0sNUmfX+0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+aBY/kMmPX6Nh5u+51Jr4sRJC3zKZe2PGTo
 vn7azWWCOCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mgAKCRA/8w6Kdoj6
 qmgYB/9bDW0Hi6J77G/KbXKaDx0Tj8Koh0NuXUh6MDJuNuDJXYBKwkVT7/HPZJmJGnWUcmkKNe+
 JZGTgeOM7+5E4UvaDj5x+qDH/1UJNYoYaUzF9d7dKXBqKYSSUCPxKjXLJpChbUDjP1MjP8+gIzg
 uj9XAueEYh/jbLV/4xcTT6kxNkl98wCsPBXI91TIKLsS475vPsXWFRzL3R94puPaGquMt3fgtRq
 0uPnHxDPsReWfItw+epTUW2Zh5ONPJ1IPoVK4sHUieh1EchZlBq6VOotQS5bfCtBPXI9I8YmGn9
 s/pprBGZmbVKLOIVKDkQxyJaQGRZ0fvnA5uBhuOf4BVJe+t2
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
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  5 +++
 drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 43 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index ad96e8db13c414cd773654397b34f83943c15d74..65acffc3fea828ee15fbb4764bd4bf1afa97e8fd 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -218,6 +218,11 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
 	unsigned long flags;
 
+	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
+		job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
 	spin_lock_irqsave(&sched->lock, flags);
 	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
 		list_del(&job->link);
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 0eddfb8d89e6521381cee3fb592d4f9194e77fd8..63d4f2ac707497541abf4d4c6aa14f94dafc459b 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -97,6 +97,7 @@ struct drm_mock_sched_job {
 
 #define DRM_MOCK_SCHED_JOB_DONE		0x1
 #define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
+#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
 	unsigned long		flags;
 
 	struct list_head	link;
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 8153c2e7af772cd9f12c1479815678464df6c47b..55eb142bd7c5dfd8fdbbedc41353bdc155d3b79b 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -287,8 +287,51 @@ static void drm_sched_basic_timeout(struct kunit *test)
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

