Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D4AFB4D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D88610E488;
	Mon,  7 Jul 2025 13:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lywvtWQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEC310E480;
 Mon,  7 Jul 2025 13:42:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A94995C5905;
 Mon,  7 Jul 2025 13:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808CAC4CEF7;
 Mon,  7 Jul 2025 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751895759;
 bh=Sgl1fbx3s/Q+rdymOYlAFyb0iIci+VpWW4JgdhHhMxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lywvtWQ/CCfrXQyOmnnnhVJaDD75fJW9DkdBFPYQ1H7lNFejHhcdDXFezF6C6v0GC
 uSn4wGUNfG/gGEDhCuvufgKB3bbcbA2BpK0G+vOMX8DztBtOtebrNeLH3mW5Irjgt8
 giXlcEmigKSfZ+oxNP2ztl73pBQpaQ9HOs7xoA3iMJTE1iTM+KjU71AuDDkPdQ8owI
 vNMBVj5/LXpaVtzdVQxeEsjmZb2oDgEFhdkIovjwNRF28oAIuORNNpgZ+cfAprfqRe
 1gSBFwhNSJJ/nUXr200peua9veNIq86RpmTf3DBJAfO/C4cMDNW+iERD+xXESaalBm
 86x9RiWJ1R5BA==
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
Subject: [PATCH v2 2/7] drm/sched/tests: Implement cancel_job() callback
Date: Mon,  7 Jul 2025 15:42:15 +0200
Message-ID: <20250707134221.34291-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134221.34291-2-phasta@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
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

The GPU Scheduler now supports a new callback, cancel_job(), which lets
the scheduler cancel all jobs which might not yet be freed when
drm_sched_fini() runs. Using this callback allows for significantly
simplifying the mock scheduler teardown code.

Implement the cancel_job() callback and adjust the code where necessary.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 49d067fecd67..2d3169d95200 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
 	lockdep_assert_held(&sched->lock);
 
 	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
-	list_move_tail(&job->link, &sched->done_list);
+	list_del(&job->link);
 	dma_fence_signal_locked(&job->hw_fence);
 	complete(&job->done);
 }
@@ -236,26 +236,39 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 
 static void mock_sched_free_job(struct drm_sched_job *sched_job)
 {
-	struct drm_mock_scheduler *sched =
-			drm_sched_to_mock_sched(sched_job->sched);
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
-	unsigned long flags;
 
-	/* Remove from the scheduler done list. */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_del(&job->link);
-	spin_unlock_irqrestore(&sched->lock, flags);
 	dma_fence_put(&job->hw_fence);
-
 	drm_sched_job_cleanup(sched_job);
 
 	/* Mock job itself is freed by the kunit framework. */
 }
 
+static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
+{
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
+	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+	unsigned long flags;
+
+	hrtimer_cancel(&job->timer);
+
+	spin_lock_irqsave(&sched->lock, flags);
+	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+		list_del(&job->link);
+		dma_fence_set_error(&job->hw_fence, -ECANCELED);
+		dma_fence_signal_locked(&job->hw_fence);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	/* The GPU Scheduler will call drm_sched_backend_ops.free_job(), still.
+	 * Mock job itself is freed by the kunit framework. */
+}
+
 static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
 	.run_job = mock_sched_run_job,
 	.timedout_job = mock_sched_timedout_job,
-	.free_job = mock_sched_free_job
+	.free_job = mock_sched_free_job,
+	.cancel_job = mock_sched_cancel_job,
 };
 
 /**
@@ -289,7 +302,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 	sched->hw_timeline.context = dma_fence_context_alloc(1);
 	atomic_set(&sched->hw_timeline.next_seqno, 0);
 	INIT_LIST_HEAD(&sched->job_list);
-	INIT_LIST_HEAD(&sched->done_list);
 	spin_lock_init(&sched->lock);
 
 	return sched;
@@ -304,38 +316,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
  */
 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 {
-	struct drm_mock_sched_job *job, *next;
-	unsigned long flags;
-	LIST_HEAD(list);
-
-	drm_sched_wqueue_stop(&sched->base);
-
-	/* Force complete all unfinished jobs. */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->job_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry(job, &list, link)
-		hrtimer_cancel(&job->timer);
-
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &list, link)
-		drm_mock_sched_job_complete(job);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	/*
-	 * Free completed jobs and jobs not yet processed by the DRM scheduler
-	 * free worker.
-	 */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->done_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry_safe(job, next, &list, link)
-		mock_sched_free_job(&job->base);
-
 	drm_sched_fini(&sched->base);
 }
 
-- 
2.49.0

