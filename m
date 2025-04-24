Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19579A9A927
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA6610E7A5;
	Thu, 24 Apr 2025 09:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DFiHTdhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0826910E7A2;
 Thu, 24 Apr 2025 09:56:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 453FBA4BC34;
 Thu, 24 Apr 2025 09:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29C5C4CEEC;
 Thu, 24 Apr 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745488567;
 bh=riFR0MXBDay78EEbu4sXTWErrIzJCWihr4JqE0kKrtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DFiHTdhrmgSaHGJOrJQT80r7WMLWqPcvQQ0mwqGv7Ns0y5S4Hnggyr1owPS43ONpo
 IgyPpOEH7wPLsPMqGXBClKMo/HjXD3sLXPGvQ3cH+jqBC6abqfAI6tSeaADz485uXT
 GRxk0HGSGfLsvUW4rHvdbHyhIPbTFMx38T6KO5gQ+3l/cOXtoDznly0pQqQeJsb5Qd
 sbDDWDQxveQ9xCfUdwqNmS+ZwK+msWe7d1FJluh8OVbKPhyojhWiom9+vczmpGkLf2
 SL68wk2O0FbMi60Hx/5F6pJQiFAopwo1WkPb/7AUGy6VRr6dorJU+pHO8MdGUx2MT+
 MziqZiVrztqRg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking too
 long
Date: Thu, 24 Apr 2025 11:55:32 +0200
Message-ID: <20250424095535.26119-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424095535.26119-2-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
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

The waitqueue that ensures that drm_sched_fini() blocks until the
pending_list has become empty could theoretically cause that function to
block for a very long time. That, ultimately, could block userspace
procesess and prevent them from being killable through SIGKILL.

When a driver calls drm_sched_fini(), it is safe to assume that all
still pending jobs are not needed anymore anyways. Thus, they can be
cancelled and thereby it can be ensured that drm_sched_fini() will
return relatively quickly.

Implement a new helper to stop all work items / submission except for
the drm_sched_backend_ops.run_job().

Implement a driver callback, kill_fence_context(), that instructs the
driver to kill the fence context associated with this scheduler, thereby
causing all pending hardware fences to be signalled.

Call those new routines in drm_sched_fini() and ensure backwards
compatibility if the new callback is not implemented.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 47 +++++++++++++++++---------
 include/drm/gpu_scheduler.h            | 11 ++++++
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ea82e69a72a8..c2ad6c70bfb6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1390,31 +1390,46 @@ drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
 	return empty;
 }
 
+/**
+ * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending jobs
+ * @sched: scheduler instance
+ *
+ * Must only be called if &struct drm_sched_backend_ops.kill_fence_context is
+ * implemented.
+ *
+ * Instructs the driver to kill the fence context associated with this scheduler,
+ * thereby signalling all pending fences. This, in turn, will trigger
+ * &struct drm_sched_backend_ops.free_job to be called for all pending jobs.
+ * The function then blocks until all pending jobs have been freed.
+ */
+static inline void
+drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
+{
+	sched->ops->kill_fence_context(sched);
+	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
+}
+
 /**
  * drm_sched_fini - Destroy a gpu scheduler
  *
  * @sched: scheduler instance
  *
- * Tears down and cleans up the scheduler.
- *
- * Note that this function blocks until all the fences returned by
- * &struct drm_sched_backend_ops.run_job have been signalled.
+ * Tears down and cleans up the scheduler. Might leak memory if
+ * &struct drm_sched_backend_ops.kill_fence_context is not implemented.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	/*
-	 * Jobs that have neither been scheduled or which have timed out are
-	 * gone by now, but jobs that have been submitted through
-	 * backend_ops.run_job() and have not yet terminated are still pending.
-	 *
-	 * Wait for the pending_list to become empty to avoid leaking those jobs.
-	 */
-	drm_sched_submission_and_timeout_stop(sched);
-	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
-	drm_sched_free_stop(sched);
+	if (sched->ops->kill_fence_context) {
+		drm_sched_submission_and_timeout_stop(sched);
+		drm_sched_cancel_jobs_and_wait(sched);
+		drm_sched_free_stop(sched);
+	} else {
+		/* We're in "legacy free-mode" and ignore potential mem leaks */
+		drm_sched_wqueue_stop(sched);
+	}
 
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
@@ -1502,7 +1517,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_ready);
 
 /**
- * drm_sched_wqueue_stop - stop scheduler submission
+ * drm_sched_wqueue_stop - stop scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Stops the scheduler from pulling new jobs from entities. It also stops
@@ -1518,7 +1533,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
 /**
- * drm_sched_wqueue_start - start scheduler submission
+ * drm_sched_wqueue_start - start scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Restarts the scheduler after drm_sched_wqueue_stop() has stopped it.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d0b1f416b4d9..8630b4a26f10 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -509,6 +509,17 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @kill_fence_context: kill the fence context belonging to this scheduler
+	 *
+	 * Needed to cleanly tear the scheduler down in drm_sched_fini(). This
+	 * callback will cause all hardware fences to be signalled by the driver,
+	 * which, ultimately, ensures that all jobs get freed before teardown.
+	 *
+	 * This callback is optional, but it is highly recommended to implement it.
+	 */
+	void (*kill_fence_context)(struct drm_gpu_scheduler *sched);
 };
 
 /**
-- 
2.48.1

