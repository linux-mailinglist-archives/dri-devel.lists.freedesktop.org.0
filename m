Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A22AA82DA
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6C310E24F;
	Sat,  3 May 2025 21:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EW4P2DPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544710E24A;
 Sat,  3 May 2025 21:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6IZBsOv5l7VgsbOjHZdZUj4hCRIAZgA3oR/FtxTwWuo=; b=EW4P2DPoYVApgcZPRlHbrd3YMm
 /EbiysWQ/FhTPk3aExK48bsm4w5kYGz5sBpihB4llDk17+X0Im4BriG7KxBIKWloNTqsv/W2OkmkC
 /HvNdgFb6ErIunHXlZVp2FPzUuA0y2Esiz385Us+hV7AfevNA0TN6Ymbv79UWmT22+hH//bpFnvtu
 Qy5wX+PlRkc0Ik2bJNIFlvdj96AhQws3IYpnDd9m31ktTH4EL3AwnrNOydoVjWbZ+S49hH7wfKqNv
 Dweh1buuC2/DzWN6pOhdDZSJ4GEdchrlyRQhyYTw/XOoWPEkwL+L2jxgzKuLOZlrRfbaBnmEmvzRi
 gqHfI/ZA==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwI-002dbs-Gq; Sat, 03 May 2025 23:00:55 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:55 -0300
Subject: [PATCH 4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_RUNNING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-4-ed0d6701a3fe@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3007; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=rZkC5wkPV0K1gmOkSoh9LEFAo5zCvpgBLxehcRqSL7M=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPmiEuclHDOfUO7qzewhb19v9aDTE0s8I45a
 ngYa8z9BniJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5gAKCRA/8w6Kdoj6
 qnUYB/48aO8DqM1b4pW0ytZd8tOs3yN4OKzb62cJjIEmYchGhr91tY0EKfDH7n6RPAAyCrmsXNt
 n5txwbZW/CFftg3rl3I2kpHMVNF48/A+taQXJxIi/ZH7FNFE7OQrsJHBtz9mIAl2nrYLIyHptwQ
 p8RexrO9cRlLf0hVWW8IzaGXQEM16mthZHxNTlGTyqMk4Af4nCaevDSr6szgpD1SQIhNFF3DNlA
 sDUUSGGag5zIYnGnW8RpK7e16t+EouJftyOuKunp3Q/9Cbo77VNd4xUf1HLJ9u/gtKxzCNMzTit
 goIDy1a+EHny6kYO6TiOU4lSOUEGhPFUiHrAx0Fy6UOoI10z
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
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  3 ++
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 44 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index e9af202d84bd55ea5cc048215e39f5407bc84458..9d594cb5bf567be25e018ddbcd28b70a7e994260 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -211,6 +211,9 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 
 	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
 
+	if (job->finish_at && ktime_before(ktime_get(), job->finish_at))
+		return DRM_GPU_SCHED_STAT_RUNNING;
+
 	drm_sched_stop(&sched->base, &job->base);
 
 	usleep_range(200, 500);
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 00c691cb3c306f609684f554f17fcb54ba74cb95..669a211b216ee298544ac237abb866077d856586 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -249,8 +249,52 @@ static void drm_sched_basic_timeout(struct kunit *test)
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
+	KUNIT_ASSERT_FALSE(test, list_empty(&sched->job_list));
+
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
+	KUNIT_ASSERT_TRUE(test, done);
+
+	KUNIT_ASSERT_EQ(test,
+			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
+			DRM_MOCK_SCHED_JOB_TIMEDOUT);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
+	KUNIT_ASSERT_TRUE(test, list_empty(&sched->done_list));
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

