Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D4A180EC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 16:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBA210E5E7;
	Tue, 21 Jan 2025 15:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iY1fez84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FAC10E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 15:16:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B7005C59CB;
 Tue, 21 Jan 2025 15:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22AEC4CEE0;
 Tue, 21 Jan 2025 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737472615;
 bh=FDRipuPPvfmCDCeAd0Ls0RxootY4kCESdc8OiZt7GIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iY1fez84iqgBQbrqP4iW04Xuq+aZzIkhRWF6iUdQuMQvg689MvAmXXMKGbCxGrcOu
 nEce/HGxnYT5fD2ZE4KPyDk2iauORb1sEjfMxiQjiWYuIbqWibGoJQh4xs+v9R/uh6
 6JaFZn3lRFq4Cft7H16HAgaF7m5ngialRJQGYqVZcY7D/FmZn6ImkcmXtH/mZOwvcm
 fkKNnMk965Nb3cCEZJezJTPxArfw8aP6BQ65pz/u7cBYws8YCKG8kc1ukXulA7ctS1
 SJu/x1VPdJ1ivSPtE9hvhNwSYyVJsDaBgykhhX3CFzyD8LYtqrVnrquCTd42N/+1Kw
 iu0JSUz9ekdkA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 3/3] drm/sched: Update timedout_job()'s documentation
Date: Tue, 21 Jan 2025 16:15:46 +0100
Message-ID: <20250121151544.44949-6-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121151544.44949-2-phasta@kernel.org>
References: <20250121151544.44949-2-phasta@kernel.org>
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
 include/drm/gpu_scheduler.h | 82 ++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cf40fdb55541..4806740b9023 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -394,8 +394,14 @@ static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
 }
 
 enum drm_gpu_sched_stat {
-	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
+	/* Reserve 0 */
+	DRM_GPU_SCHED_STAT_NONE,
+
+	/* Operation succeeded */
 	DRM_GPU_SCHED_STAT_NOMINAL,
+
+	/* Failure because dev is no longer available, for example because
+	 * it was unplugged. */
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
 
@@ -447,43 +453,53 @@ struct drm_sched_backend_ops {
 	 * @timedout_job: Called when a job has taken too long to execute,
 	 * to trigger GPU recovery.
 	 *
-	 * This method is called in a workqueue context.
+	 * @sched_job: The job that has timed out
 	 *
-	 * Drivers typically issue a reset to recover from GPU hangs, and this
-	 * procedure usually follows the following workflow:
+	 * Returns: A drm_gpu_sched_stat enum.
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
-	 * 2. Try to gracefully stop non-faulty jobs (optional)
-	 * 3. Issue a GPU reset (driver-specific)
-	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
-	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 * Drivers typically issue a reset to recover from GPU hangs.
+	 * This procedure looks very different depending on whether a firmware
+	 * or a hardware scheduler is being used.
+	 *
+	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one scheduler, and
+	 * each scheduler has one entity. Hence, you typically follow those
+	 * steps:
+	 *
+	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
+	 *    scheduler workqueues and cancel the timeout work, guaranteeing
+	 *    that nothing is queued while we remove the ring.
+	 * 2. Remove the ring. In most (all?) cases the firmware will make sure
+	 *    that the corresponding parts of the hardware are resetted, and that
+	 *    other rings are not impacted.
+	 * 3. Kill the entity the faulted job stems from, and the associated
+	 *    scheduler.
+	 *
+	 *
+	 * For a HARDWARE SCHEDULER, each ring also has one scheduler, but each
+	 * scheduler is typically associated with many entities. This implies
+	 * that all entities associated with the affected scheduler cannot be
+	 * torn down, because this would effectively also kill innocent
+	 * userspace processes which did not submit faulty jobs (for example).
+	 *
+	 * Consequently, the procedure to recover with a hardware scheduler
+	 * should look like this:
+	 *
+	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
+	 * 2. Figure out to which entity the faulted job belongs to.
+	 * 3. Kill that entity.
+	 * 4. Issue a GPU reset on all faulty rings (driver-specific).
+	 * 5. Re-submit jobs on all schedulers impacted by re-submitting them to
+	 *    the entities which are still alive.
+	 * 6. Restart all schedulers that were stopped in step #1 using
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

