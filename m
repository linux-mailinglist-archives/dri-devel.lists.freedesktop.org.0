Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FDAC4C0B
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABD510E401;
	Tue, 27 May 2025 10:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pxShTHkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642D10E401
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:10:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1B4B61136;
 Tue, 27 May 2025 10:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7C9C4CEE9;
 Tue, 27 May 2025 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748340638;
 bh=aCPm9UB1pDOz4HurjnnTFfxQ6vwCbfeokcrzhchT7aQ=;
 h=From:To:Cc:Subject:Date:From;
 b=pxShTHkP9iE/yHaPe3B3Y4ljXScAclIMdLqcS8Twha/nK9uh2qhxDsdIrmItXgBxZ
 6PDd3+OleVFca5SbZg8KQgeBMnJrQk6ffuqdUxEni6K/0AXpMsv3vrmFY8ZJu3Jr7e
 iXHo3YMXUfYug77hJSipMkAQdhSMipKj7g6pE5XWbn8h/d3SNW+/lHbkRASHKmusea
 h5l9/Mz6cRPzn2sSIywd1NzUWE2HnR2VPkCxSRK0DXAvgeDBhItEaOU3IVUI7A0w2n
 0w5sWYmafDW/jBisErFBLsWVppFnpMxNjEApNIMUPBtlLL235BNopnPuIjDFeOiwVL
 JO3Qscyzoaztw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/sched/tests: Use one lock for fence context
Date: Tue, 27 May 2025 12:10:30 +0200
Message-ID: <20250527101029.56491-2-phasta@kernel.org>
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

There is no need for separate locks for single jobs and the entire
scheduler. The dma_fence context can be protected by the scheduler lock,
allowing for removing the jobs' locks. This simplifies things and
reduces the likelyhood of deadlocks etc.

Replace the jobs' locks with the mock scheduler lock.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Make commit message more neutral by stating it's about simplifying
    the code. (Tvrtko)
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

