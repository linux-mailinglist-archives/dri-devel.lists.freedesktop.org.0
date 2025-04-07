Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05AA7E408
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B6010E4E5;
	Mon,  7 Apr 2025 15:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ijeqhBxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5DA10E3EE;
 Mon,  7 Apr 2025 15:23:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 85981438AC;
 Mon,  7 Apr 2025 15:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5CEC4CEEC;
 Mon,  7 Apr 2025 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744039378;
 bh=3ddWVE+d0ZcwzSs4+cFUh4H/OJZsQa74J4Okb65lv9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ijeqhBxbtnRbqBykrf5cRYc1YRhk6oCP9jbac0KK+uuFQRrLdS4VN6YkATr7tZVTc
 V2T3e8KsJeSS/E8xnS596328lnGUjQyQOn0Nn7H/EVvFR8aoSNmsUIh9lvrSbSapGF
 DKY8PTa7+Dwvf/6GptS4YTdxy05LuzAAqOW+IdEP1kKTz1Qyk8EOn2XgVoux4g2YcB
 k/xOFgfiOCbX8+9GzmYJi6d6fLypTexgIov/tA/MGwUMKmQ+QjrSWT5t13r1cGPSWq
 AGuJGv6sGtP3EipRxSMpKt6YgaBw/GuDkATC0rQKDS2fuja3P4zEm/O/hLK4801a71
 yyjztPY3xgaOw==
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
Subject: [PATCH 2/5] drm/sched: Prevent teardown waitque from blocking too long
Date: Mon,  7 Apr 2025 17:22:37 +0200
Message-ID: <20250407152239.34429-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407152239.34429-2-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
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
index a6a4deeda72b..6b72278c4b72 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1398,31 +1398,46 @@ drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
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
@@ -1510,7 +1525,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_ready);
 
 /**
- * drm_sched_wqueue_stop - stop scheduler submission
+ * drm_sched_wqueue_stop - stop scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Stops the scheduler from pulling new jobs from entities. It also stops
@@ -1526,7 +1541,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
 /**
- * drm_sched_wqueue_start - start scheduler submission
+ * drm_sched_wqueue_start - start scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Restarts the scheduler after drm_sched_wqueue_stop() has stopped it.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index badcf9ea4501..e13eb7e4c93a 100644
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

