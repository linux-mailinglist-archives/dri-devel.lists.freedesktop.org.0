Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53520ACF0FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A9410E2FD;
	Thu,  5 Jun 2025 13:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hzHfgeCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2F510E88D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:42:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 831D6614B8;
 Thu,  5 Jun 2025 13:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30082C4CEE7;
 Thu,  5 Jun 2025 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749130925;
 bh=lt6o7mkDjM58FakjB+UBC9SumylOoEOwLruolzNrPzE=;
 h=From:To:Cc:Subject:Date:From;
 b=hzHfgeCLqN+g0oj6cJl31C3OqcR4vPnASnvER5Kbck2E+a5FgRGxwBBJJxaEzv/hF
 vhsBd+j1Dma5w3z1GHEKh1Rl49TZA3UZ5iW4Sf7RmohSbdRCndMaBNGVf3PHlHX1WB
 T/Bk4mNa45jsssvfuyHbth/pQPtc9+cKhPyvd+n24W1UPjW3MDe0eAT+skraxp/rq5
 uv54ttx2OLN/v4i1kHXtnwU40VOjYUxUUrd8b3Mhyus0tOa+u3d5wmKpcIOnaGKADg
 v2+PIQX8RphAGD8fMBWlofClWH0RKbrqQG1YQwm2EATDMQ3kRu3E1WckSAbqV0oXgl
 INRvMejdHdD/g==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched/tests: Make timedout_job callback a better role
 model
Date: Thu,  5 Jun 2025 15:41:55 +0200
Message-ID: <20250605134154.191764-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

Since the drm_mock_scheduler does not have real users in userspace, nor
does it have real hardware or firmware rings, it's not necessary to
signal timedout fences nor free jobs - from a functional standpoint.

The unit tests, however, serve as a reference implementation and a first
example for new scheduler users. Therefore, they should approximate the
canonical usage as much as possible.

Make sure timed out hardware fences get signaled with the appropriate
error code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 7f947ab9d322..49d067fecd67 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -200,12 +200,36 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 	return &job->hw_fence;
 }
 
+/*
+ * Normally, drivers would take appropriate measures in this callback, such as
+ * killing the entity the faulty job is associated with, resetting the hardware
+ * and / or resubmitting non-faulty jobs.
+ *
+ * For the mock scheduler, there are no hardware rings to be resetted nor jobs
+ * to be resubmitted. Thus, this function merely ensures that
+ *   a) timedout fences get signaled properly and removed from the pending list
+ *   b) the mock scheduler framework gets informed about the timeout via a flag
+ *   c) The drm_sched_job, not longer needed, gets freed
+ */
 static enum drm_gpu_sched_stat
 mock_sched_timedout_job(struct drm_sched_job *sched_job)
 {
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+	unsigned long flags;
 
-	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
+	spin_lock_irqsave(&sched->lock, flags);
+	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+		list_del(&job->link);
+		job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
+		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
+		dma_fence_signal_locked(&job->hw_fence);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	dma_fence_put(&job->hw_fence);
+	drm_sched_job_cleanup(sched_job);
+	/* Mock job itself is freed by the kunit framework. */
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.49.0

