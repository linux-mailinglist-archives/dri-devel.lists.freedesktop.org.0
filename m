Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAEA077AC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E510EDD8;
	Thu,  9 Jan 2025 13:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UWv6pdKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9B410EDD8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:38:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4DEF5C49AF;
 Thu,  9 Jan 2025 13:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACA3C4CEE7;
 Thu,  9 Jan 2025 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736429879;
 bh=YCZh1cBBY7QlLadbExChChUtbsBI1j42CNiRKf+4Suo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWv6pdKgK4QP5CYKcx40hpgU/0tGVJVsKXgZ0BJJa75YOnhx50d6Q6WHYK5Bopmtb
 7uLd2XoFBdqOoG6hKJ8F1KtSR17S6dorE7OtThfSCugZIkby9D5PdpCg2PjcNiGGzM
 aiYz5P3A+PWSApOyar5p4tFAZw1L1vrb9l5b81bYUxEFrJ3bEDhtWP1aedQ7qUeXWo
 f2iXq5Z6gflE7x90e49GjC6iAaRvDRjJqS4s+jx2tGX3RW2pHOAc++Q6RiLrS7L7ju
 qJIOZOb2jm++tP68Q3uqqYz9f23QVnzKctckaGvnYIrT2DLgAyqrNEv4Kc99/8QdAl
 nh9JKt7OnhcEw==
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
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 3/3] drm/sched: Update timedout_job()'s documentation
Date: Thu,  9 Jan 2025 14:37:12 +0100
Message-ID: <20250109133710.39404-6-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133710.39404-2-phasta@kernel.org>
References: <20250109133710.39404-2-phasta@kernel.org>
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

drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
mentions the deprecated function drm_sched_resubmit_job(). Furthermore,
it does not point out the important distinction between hardware and
firmware schedulers.

Since firmware schedulers tyipically only use one entity per scheduler,
timeout handling is significantly more simple because the entity the
faulted job came from can just be killed without affecting innocent
processes.

Update the documentation with that distinction and other details.

Reformat the docstring to work to a unified style with the other
handles.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 31 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c4e65f9f7f22..380b8840c591 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -445,43 +445,64 @@ struct drm_sched_backend_ops {
 	 * @timedout_job: Called when a job has taken too long to execute,
 	 * to trigger GPU recovery.
 	 *
-	 * This method is called in a workqueue context.
+	 * @sched_job: The job that has timed out
 	 *
-	 * Drivers typically issue a reset to recover from GPU hangs, and this
-	 * procedure usually follows the following workflow:
+	 * Returns:
+	 * - DRM_GPU_SCHED_STAT_NOMINAL, on success, i.e., if the underlying
+	 *   driver has started or completed recovery.
+	 * - DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
+	 *   available, i.e., has been unplugged.
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
-	 * 2. Try to gracefully stop non-faulty jobs (optional)
-	 * 3. Issue a GPU reset (driver-specific)
-	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
+	 * Drivers typically issue a reset to recover from GPU hangs.
+	 * This procedure looks very different depending on whether a firmware
+	 * or a hardware scheduler is being used.
+	 *
+	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one scheduler, and
+	 * each scheduler (typically) has one entity. Hence, you typically
+	 * follow those steps:
+	 *
+	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
+	 *    scheduler workqueues and cancel the timeout work, guaranteeing
+	 *    that nothing is queued while we reset the hardware queue.
+	 * 2. Try to gracefully stop non-faulty jobs (optional).
+	 * TODO: RFC ^ Folks, should we remove this step? What does it even mean
+	 * precisely to "stop" those jobs? Is that even helpful to userspace in
+	 * any way?
+	 * 3. Issue a GPU reset (driver-specific).
+	 * 4. Kill the entity the faulted job stems from, and the associated
+	 *    scheduler.
 	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 *    jobs can be queued, and the scheduler workqueues awake again.
+	 *
+	 * For a HARDWARE SCHEDULER, each ring also has one scheduler, but each
+	 * scheduler typically has many attached entities. This implies that you
+	 * cannot tear down all entities associated with the affected scheduler,
+	 * because this would effectively also kill innocent userspace processes
+	 * which did not submit faulty jobs (for example).
+	 *
+	 * Consequently, the procedure to recover with a hardware scheduler
+	 * should look like this:
+	 *
+	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
+	 * 2. Figure out to which entity the faulted job belongs.
+	 * 3. Try to gracefully stop non-faulty jobs (optional).
+	 * TODO: RFC ^ Folks, should we remove this step? What does it even mean
+	 * precisely to "stop" those jobs? Is that even helpful to userspace in
+	 * any way?
+	 * 4. Kill that entity.
+	 * 5. Issue a GPU reset on all faulty rings (driver-specific).
+	 * 6. Re-submit jobs on all schedulers impacted by re-submitting them to
+	 *    the entities which are still alive.
+	 * 7. Restart all schedulers that were stopped in step #1 using
+	 *    drm_sched_start().
 	 *
 	 * Note that some GPUs have distinct hardware queues but need to reset
 	 * the GPU globally, which requires extra synchronization between the
-	 * timeout handler of the different &drm_gpu_scheduler. One way to
-	 * achieve this synchronization is to create an ordered workqueue
-	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
-	 * queue to drm_sched_init(), to guarantee that timeout handlers are
-	 * executed sequentially. The above workflow needs to be slightly
-	 * adjusted in that case:
-	 *
-	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
-	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
-	 *    the reset (optional)
-	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
-	 * 4. Re-submit jobs on all schedulers impacted by the reset using
-	 *    drm_sched_resubmit_jobs()
-	 * 5. Restart all schedulers that were stopped in step #1 using
-	 *    drm_sched_start()
-	 *
-	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
-	 * and the underlying driver has started or completed recovery.
-	 *
-	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
-	 * available, i.e. has been unplugged.
+	 * timeout handlers of different schedulers. One way to achieve this
+	 * synchronization is to create an ordered workqueue (using
+	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
+	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
+	 * that timeout handlers are executed sequentially.
 	 */
 	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1

