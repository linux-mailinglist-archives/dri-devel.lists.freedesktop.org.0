Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C36AFCBEC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794C910E64C;
	Tue,  8 Jul 2025 13:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PJBDTRs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF5C10E63A;
 Tue,  8 Jul 2025 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5XOogx++HghnqvHZj7riTY29o2z5uH2VmfWwntFgY3k=; b=PJBDTRs13Pbz9Cvsl5ATxXE8BT
 oypq6CMtp5+GaGOi+cdjj9058+fv0Nb0BGKHJgQN69hZCwPAmfa4x1m6SZOLGsbjbPbhH49HBTIBv
 KGt9+ACWkBWwNczNt1l607stjIGRkVC6cQvnuPlyofLc+6LjGQbXEbeg/GyuYbKSuGG+7XnMtBiNN
 DKYWtUSsqbGqD/o2VAX+Dhst1155EDVo0n+jK/J6TFvsEynCJQQOPsVJhZG2OAz+Vcck56EKAh6kS
 xJyuO9AnVUqv5KH5pcDm/AZC6i5x2F0xE4U52ckJg2tHzxFBz0HE9szGEPoPshbZqoaOIU1mWrq8c
 KIX1CI5w==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ8L3-00E1hT-C0; Tue, 08 Jul 2025 15:26:25 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 08 Jul 2025 10:25:42 -0300
Subject: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and keep
 on running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6211; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=El4W09jWKJfBwDCdqmOf/ULjLf/aRwZJ6E8cBP/xzBY=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBobRxmuOLQTz/3a0BiyFY6k7C7XNXGJTWIjogA5
 dodJgGlrkWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaG0cZgAKCRA/8w6Kdoj6
 qtVWCADIFw/rQ53STe+Qt4Hvjvx+l+szfT8XOkQftmP45386OMAsSAodSy9ds0phfvuyzLt1eKw
 q8LmheovN7JbpOnlbFwGnR185FdKb31OT5O4zVqkyS/fGplbfFJ4y0pfrTwfIoEUn31bM0k3dtN
 EJXRC+1f4dZbF0CzU0/5SPmnYoW1/SQU5/cjcyAG3aaZ/Ohfq0ShA+w4UBvOfz2HF7HvwsFK1Lz
 dKMMQqguJfB6TWwVT5GIIkkbiTi4IbfJi6fOG4kC0tAiymEtgXRlcBKZGTpqyMo3AXIvup0JYiB
 wa8ZF1mJCl/ODsprl2Ik0XmnwbC1zCu4uixYFweE9Gv4sq9Z
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

When the DRM scheduler times out, it's possible that the GPU isn't hung;
instead, a job just took unusually long (longer than the timeout) but is
still running, and there is, thus, no reason to reset the hardware. This
can occur in two scenarios:

  1. The job is taking longer than the timeout, but the driver determined
     through a GPU-specific mechanism that the hardware is still making
     progress. Hence, the driver would like the scheduler to skip the
     timeout and treat the job as still pending from then onward. This
     happens in v3d, Etnaviv, and Xe.
  2. Timeout has fired before the free-job worker. Consequently, the
     scheduler calls `sched->ops->timedout_job()` for a job that isn't
     timed out.

These two scenarios are problematic because the job was removed from the
`sched->pending_list` before calling `sched->ops->timedout_job()`, which
means that when the job finishes, it won't be freed by the scheduler
though `sched->ops->free_job()` - leading to a memory leak.

To solve these problems, create a new `drm_gpu_sched_stat`, called
DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
new status will indicate that the job must be reinserted into
`sched->pending_list`, and the hardware / driver will still complete that
job.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  3 +++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
 
-	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 	if (job && dma_fence_is_signaled(&job->s_fence->finished))
 		__drm_sched_run_free_queue(sched);
+}
+
+static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
+ * @sched: scheduler instance
+ * @job: job to be reinserted on the pending list
+ *
+ * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
+ * hung and is making progress, the scheduler must reinsert the job back into
+ * @sched->pending_list. Otherwise, the job and its resources won't be freed
+ * through the &struct drm_sched_backend_ops.free_job callback.
+ *
+ * This function must be used in "false timeout" cases only.
+ */
+static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
+						    struct drm_sched_job *job)
+{
+	spin_lock(&sched->job_list_lock);
+	list_add(&job->list, &sched->pending_list);
+
+	/* After reinserting the job, the scheduler enqueues the free-job work
+	 * again if ready. Otherwise, a signaled job could be added to the
+	 * pending list, but never freed.
+	 */
+	drm_sched_run_free_queue(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
@@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty = false;
 		}
+
+		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
+			drm_sched_job_reinsert_on_false_timeout(sched, job);
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
  * This function is typically used for reset recovery (see the docu of
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler teardown, i.e., before calling drm_sched_fini().
+ *
+ * As it's only used for reset recovery, drivers must not call this function
+ * in their &struct drm_sched_backend_ops.timedout_job callback when they
+ * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
@@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler startup. The scheduler itself is fully operational after
  * drm_sched_init() succeeded.
+ *
+ * As it's only used for reset recovery, drivers must not call this function
+ * in their &struct drm_sched_backend_ops.timedout_job callback when they
+ * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
  */
 void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 {
@@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_run_free_queue(sched);
+	drm_sched_run_free_queue_unlocked(sched);
 	drm_sched_run_job_queue(sched);
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -393,11 +393,14 @@ struct drm_sched_job {
  * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
  * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
  * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
+ * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
+ * did not hang and is still running.
  */
 enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE,
 	DRM_GPU_SCHED_STAT_RESET,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_NO_HANG,
 };
 
 /**

-- 
2.50.0

