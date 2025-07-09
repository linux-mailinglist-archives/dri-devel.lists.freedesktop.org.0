Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDD1AFE847
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C710E7A0;
	Wed,  9 Jul 2025 11:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BxtkvIHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7F10E7A0;
 Wed,  9 Jul 2025 11:53:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC3F345F54;
 Wed,  9 Jul 2025 11:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D569C4CEEF;
 Wed,  9 Jul 2025 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752062005;
 bh=gPZ3HY8Z/Qf3HBXo6MxOplLv9ot5uaDonjEvcOp6z+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BxtkvIHPPN/JEn87h24VP6VXtIxaoK545KYc294WK/rroBBbzEUK4YcJL8+kT9Q9T
 V9UAVK+Iux4rOX9KXe+A6zESnxlm/+QU7TiSVAJGvCioIR6vdamXB/sioGErhMD9gh
 jzVAdNhWKaHaJlOCo4nTckcBERTkt13mcRtVa0x3SR8/Ns/N6vHQ+9FcEI8flSS5BE
 Si6SycY6iDZfRvxhZergTNDuWpuQFNobmykYaUi8LHFv6kfINWSVvTNZdDSzRbynCE
 KtKNbTG/fyxGWeQDStvzuHUCL2riRSIh/oG81kmxvCKOUySdNslpQycEuUtI3jw9k/
 fv8UqcOl2A9kA==
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 1/7] drm/sched: Avoid memory leaks with cancel_job()
 callback
Date: Wed,  9 Jul 2025 13:52:51 +0200
Message-ID: <20250709115257.106370-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
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

Since its inception, the GPU scheduler can leak memory if the driver
calls drm_sched_fini() while there are still jobs in flight.

The simplest way to solve this in a backwards compatible manner is by
adding a new callback, drm_sched_backend_ops.cancel_job(), which
instructs the driver to signal the hardware fence associated with the
job. Afterwards, the scheduler can safely use the established free_job()
callback for freeing the job.

Implement the new backend_ops callback cancel_job().

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----------
 include/drm/gpu_scheduler.h            | 18 ++++++++++++++
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 81ad40d9582b..a971f0c9e6e0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 }
 EXPORT_SYMBOL(drm_sched_init);
 
+static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_job *job, *tmp;
+
+	/* All other accessors are stopped. No locking necessary. */
+	list_for_each_entry_safe_reverse(job, tmp, &sched->pending_list, list) {
+		sched->ops->cancel_job(job);
+		list_del(&job->list);
+		sched->ops->free_job(job);
+	}
+}
+
 /**
  * drm_sched_fini - Destroy a gpu scheduler
  *
@@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
  *
  * Tears down and cleans up the scheduler.
  *
- * This stops submission of new jobs to the hardware through
- * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
- * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
- * There is no solution for this currently. Thus, it is up to the driver to make
- * sure that:
- *
- *  a) drm_sched_fini() is only called after for all submitted jobs
- *     drm_sched_backend_ops.free_job() has been called or that
- *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
- *     after drm_sched_fini() ran are freed manually.
- *
- * FIXME: Take care of the above problem and prevent this function from leaking
- * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
+ * This stops submission of new jobs to the hardware through &struct
+ * drm_sched_backend_ops.run_job. If &struct drm_sched_backend_ops.cancel_job
+ * is implemented, all jobs will be canceled through it and afterwards cleaned
+ * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
+ * implemented, memory could leak.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
@@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	/* Avoid memory leaks if supported by the driver. */
+	if (sched->ops->cancel_job)
+		drm_sched_cancel_remaining_jobs(sched);
+
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e62a7214e052..190844370f48 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -512,6 +512,24 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @cancel_job: Used by the scheduler to guarantee remaining jobs' fences
+	 * get signaled in drm_sched_fini().
+	 *
+	 * Used by the scheduler to cancel all jobs that have not been executed
+	 * with &struct drm_sched_backend_ops.run_job by the time
+	 * drm_sched_fini() gets invoked.
+	 *
+	 * Drivers need to signal the passed job's hardware fence with an
+	 * appropriate error code (e.g., -ECANCELED) in this callback. They
+	 * must not free the job.
+	 *
+	 * The scheduler will only call this callback once it stopped calling
+	 * all other callbacks forever, with the exception of &struct
+	 * drm_sched_backend_ops.free_job.
+	 */
+	void (*cancel_job)(struct drm_sched_job *sched_job);
 };
 
 /**
-- 
2.49.0

