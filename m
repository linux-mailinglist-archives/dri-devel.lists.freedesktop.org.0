Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A76BABF0C3
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FC910E744;
	Wed, 21 May 2025 10:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nb/7Ly5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFF610E744
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 10:05:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF2F15C5403;
 Wed, 21 May 2025 10:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6271FC4CEE4;
 Wed, 21 May 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747821918;
 bh=jYCPLpmjCZwqIjzIBMh5UL0q6Ebpw9E0czo06+AzlDA=;
 h=From:To:Cc:Subject:Date:From;
 b=Nb/7Ly5GTdimYBFDrmhATZWGMNLPs1ulWJrOcXiMRXFzeUS0BKDbxVvTUvK1a762g
 h+T2uKG4cdbhuKNHikUMRhnFTq/WC8xRlfvW91+MFc61xA59Z0s96ywzTCkfngdfBg
 TbS0zxsojUzlXhw4gLROxtwIfUiYOzNlN6sSOUO9zJV/UlbWwzB5rmYxYSB7CBTC+/
 KD1DB93jJX/65DIEQSKyDO3HViRIvM2eojKEttRpfYZ+c5/fb4j0J0ZvvqjPgWKa5/
 6y4bZKb+Tb0WU6U40Mdejgt1agx2u3bHKAW4UVJ6URJJY19wd+OvfJq1K3gcN7VTwD
 r9xvU5DbVZhYA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH] drm/sched/tests: Use one lock for fence context
Date: Wed, 21 May 2025 12:04:41 +0200
Message-ID: <20250521100440.110019-2-phasta@kernel.org>
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

When the unit tests were implemented, each scheduler job got its own,
distinct lock. This is not how dma_fence context locking rules are to be
implemented. All jobs belonging to the same fence context (in this case:
scheduler) should share a lock for their dma_fences. This is to comply
to various dma_fence rules, e.g., ensuring that only one fence gets
signaled at a time.

Use the fence context (scheduler) lock for the jobs.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
 drivers/gpu/drm/scheduler/tests/sched_tests.h    | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..17023276f4b0 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
 
 	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
 	list_move_tail(&job->link, &sched->done_list);
-	dma_fence_signal(&job->hw_fence);
+	dma_fence_signal_locked(&job->hw_fence);
 	complete(&job->done);
 }
 
@@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
 	job->test = test;
 
 	init_completion(&job->done);
-	spin_lock_init(&job->lock);
 	INIT_LIST_HEAD(&job->link);
 	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
 		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
@@ -169,7 +168,7 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 
 	dma_fence_init(&job->hw_fence,
 		       &drm_mock_sched_hw_fence_ops,
-		       &job->lock,
+		       &sched->lock,
 		       sched->hw_timeline.context,
 		       atomic_inc_return(&sched->hw_timeline.next_seqno));
 
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 27caf8285fb7..fbba38137f0c 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -106,7 +106,6 @@ struct drm_mock_sched_job {
 	unsigned int		duration_us;
 	ktime_t			finish_at;
 
-	spinlock_t		lock;
 	struct dma_fence	hw_fence;
 
 	struct kunit		*test;
-- 
2.49.0

