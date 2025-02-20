Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFBA3D8C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D3610E149;
	Thu, 20 Feb 2025 11:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RPIYJ365";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2025 11:34:32 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0810E952
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F266613E9;
 Thu, 20 Feb 2025 11:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCEFC4CED1;
 Thu, 20 Feb 2025 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740050911;
 bh=HnzVdv0tX8zle/TJ9T+1JFJi80c0Y2EBkazrIFTOfqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPIYJ365cWF9ymlwqb8xrz0TmkBHJTtvDbP72b3wl1KXguDMnkmeR0/oD/tqzvcW2
 352LtvMiwSjEMRRVhNKWQo7iLsVDZOCRaVXExT3MwVRhDah1IcdxzZFq84JLeOZ/vk
 EAzY3Q0ntlMi+r/vHWoHJKiakcZQkqtE5WE322mDmOeeUFLoi9GwM3kdIMYi7JOaoW
 swCrwFxUwLfiA5XF5Olqbkem8cIbA82Hom0V8jIOKCogpJzW6PzfjHTVdIg0UdexPa
 BHswGuBB/G3eH5OytOKE70c9lxpi0FwA1lnBxMORkl46To/8xX3JyFrloJpQAp1WqQ
 SDbZ2/+1RRWCA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] drm/sched: Update timedout_job()'s documentation
Date: Thu, 20 Feb 2025 12:28:14 +0100
Message-ID: <20250220112813.87992-5-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220112813.87992-2-phasta@kernel.org>
References: <20250220112813.87992-2-phasta@kernel.org>
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
index 29e5bda91806..18cdeacf8651 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -393,8 +393,15 @@ static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
 	return s_job && atomic_inc_return(&s_job->karma) > threshold;
 }
 
+/**
+ * enum drm_gpu_sched_stat - the scheduler's status
+ *
+ * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
+ * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
+ * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
+ */
 enum drm_gpu_sched_stat {
-	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
+	DRM_GPU_SCHED_STAT_NONE,
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
@@ -430,6 +437,11 @@ struct drm_sched_backend_ops {
 	 *
 	 * TODO: Document which fence rules above.
 	 *
+	 * This method is called in a workqueue context - either from the
+	 * submit_wq the driver passed through &drm_sched_init(), or, if the
+	 * driver passed NULL, a separate, ordered workqueue the scheduler
+	 * allocated.
+	 *
 	 * @sched_job: the job to run
 	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
@@ -449,43 +461,52 @@ struct drm_sched_backend_ops {
 	 * @timedout_job: Called when a job has taken too long to execute,
 	 * to trigger GPU recovery.
 	 *
-	 * This method is called in a workqueue context.
+	 * @sched_job: The job that has timed out
 	 *
-	 * Drivers typically issue a reset to recover from GPU hangs, and this
-	 * procedure usually follows the following workflow:
+	 * Drivers typically issue a reset to recover from GPU hangs.
+	 * This procedure looks very different depending on whether a firmware
+	 * or a hardware scheduler is being used.
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
-	 * 2. Try to gracefully stop non-faulty jobs (optional)
-	 * 3. Issue a GPU reset (driver-specific)
-	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
-	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 * For a FIRMWARE SCHEDULER, each ring has one scheduler, and each
+	 * scheduler has one entity. Hence, the steps taken typically look as
+	 * follows:
+	 *
+	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
+	 *    scheduler workqueues and cancel the timeout work, guaranteeing
+	 *    that nothing is queued while the ring is being removed.
+	 * 2. Remove the ring. The firmware will make sure that the
+	 *    corresponding parts of the hardware are resetted, and that other
+	 *    rings are not impacted.
+	 * 3. Kill the entity and the associated scheduler.
+	 *
+	 *
+	 * For a HARDWARE SCHEDULER, a scheduler instance schedules jobs from
+	 * one or more entities to one ring. This implies that all entities
+	 * associated with the affected scheduler cannot be torn down, because
+	 * this would effectively also affect innocent userspace processes which
+	 * did not submit faulty jobs (for example).
+	 *
+	 * Consequently, the procedure to recover with a hardware scheduler
+	 * should look like this:
+	 *
+	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
+	 * 2. Kill the entity the faulty job stems from.
+	 * 3. Issue a GPU reset on all faulty rings (driver-specific).
+	 * 4. Re-submit jobs on all schedulers impacted by re-submitting them to
+	 *    the entities which are still alive.
+	 * 5. Restart all schedulers that were stopped in step #1 using
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
+	 * timeout handlers of different schedulers. One way to achieve this
+	 * synchronization is to create an ordered workqueue (using
+	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
+	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
+	 * that timeout handlers are executed sequentially.
 	 *
-	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
-	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
-	 *    the reset (optional)
-	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
-	 * 4. Re-submit jobs on all schedulers impacted by the reset using
-	 *    drm_sched_resubmit_jobs()
-	 * 5. Restart all schedulers that were stopped in step #1 using
-	 *    drm_sched_start()
+	 * Return: The scheduler's status, defined by &drm_gpu_sched_stat
 	 *
-	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
-	 * and the underlying driver has started or completed recovery.
-	 *
-	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
-	 * available, i.e. has been unplugged.
 	 */
 	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1

