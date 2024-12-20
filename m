Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FD9F9271
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D510E00F;
	Fri, 20 Dec 2024 12:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SM14lkqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E0910E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:45:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24745A404F1;
 Fri, 20 Dec 2024 12:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F55C4CECD;
 Fri, 20 Dec 2024 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734698756;
 bh=q7SkEis4X+AWryWH7Mo8gvMzBPeGVPLaalDUADo+4sE=;
 h=From:To:Cc:Subject:Date:From;
 b=SM14lkqIzCC02/T6wOxDWm7AnkeF5T3JlzoUXWeszLE4kj0IE+GDP54u4WQ+07AxB
 10oQiZ2cshXL5lj198mHrDLHaLGoFkqixe7WcStPj6vXmAMmk4KCmOUiFr5ItQQupC
 seyKISuNDQWcBuCAMj6yRwC6QyrVWSiHmml1Bbb501uaiLaGLaWucMoNzDV+Kr1q6T
 XFAh1r7ExrTp4wnE/83wcCu53sORlY2TZW7BLKI7NOiZqJCTM00IMyDDqlaLtMzKB/
 ZVU3Rb+lHXuJArVAl7jAavZ7oLUnKk1LrQGPD2eg/OlxvCh1De3VdeTwN3ISzUaCMh
 jgPqsdK7RTksg==
From: Philipp Stanner <phasta@kernel.org>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [PATCH] drm/sched: Document run_job() refcount hazard
Date: Fri, 20 Dec 2024 13:45:15 +0100
Message-ID: <20241220124515.93169-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Philipp Stanner <pstanner@redhat.com>

drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
That fence is signalled by the driver once the hardware completed the
associated job. The scheduler does not increment the reference count on
that fence, but implicitly expects to inherit this fence from run_job().

This is relatively subtle and prone to misunderstandings.

This implies that, to keep a reference for itself, a driver needs to
call dma_fence_get() in addition to dma_fence_init() in that callback.

It's further complicated by the fact that the scheduler even decrements
the refcount in drm_sched_run_job_work() since it created a new
reference in drm_sched_fence_scheduled(). It does, however, still use
its pointer to the fence after calling dma_fence_put() - which is safe
because of the aforementioned new reference, but actually still violates
the refcounting rules.

Improve the explanatory comment for that decrement.

Move the call to dma_fence_put() to the position behind the last usage
of the fence.

Document the necessity to increment the reference count in
drm_sched_backend_ops.run_job().

Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
 include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74c..d6f8df39d848 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	drm_sched_fence_scheduled(s_fence, fence);
 
 	if (!IS_ERR_OR_NULL(fence)) {
-		/* Drop for original kref_init of the fence */
-		dma_fence_put(fence);
-
 		r = dma_fence_add_callback(fence, &sched_job->cb,
 					   drm_sched_job_done_cb);
 		if (r == -ENOENT)
 			drm_sched_job_done(sched_job, fence->error);
 		else if (r)
 			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+
+		/*
+		 * s_fence took a new reference to fence in the call to
+		 * drm_sched_fence_scheduled() above. The reference passed by
+		 * run_job() above is now not needed any longer. Drop it.
+		 */
+		dma_fence_put(fence);
 	} else {
 		drm_sched_job_done(sched_job, IS_ERR(fence) ?
 				   PTR_ERR(fence) : 0);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 95e17504e46a..a1f5c9a14278 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
 					 struct drm_sched_entity *s_entity);
 
 	/**
-         * @run_job: Called to execute the job once all of the dependencies
-         * have been resolved.  This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery()
-	 * decides to try it again.
+	 * @run_job: Called to execute the job once all of the dependencies
+	 * have been resolved. This may be called multiple times, if
+	 * timedout_job() has happened and drm_sched_job_recovery() decides to
+	 * try it again.
+	 *
+	 * @sched_job: the job to run
+	 *
+	 * Returns: dma_fence the driver must signal once the hardware has
+	 *	completed the job ("hardware fence").
+	 *
+	 * Note that the scheduler expects to 'inherit' its own reference to
+	 * this fence from the callback. It does not invoke an extra
+	 * dma_fence_get() on it. Consequently, this callback must return a
+	 * fence whose refcount is at least 2: One for the scheduler's
+	 * reference returned here, another one for the reference kept by the
+	 * driver.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1

