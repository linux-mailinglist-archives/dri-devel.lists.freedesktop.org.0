Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A631B049FE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB910E4FC;
	Mon, 14 Jul 2025 22:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GUOToEnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD9F10E4F7;
 Mon, 14 Jul 2025 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfpvHVqF85h5CwYBcM7udJEwEdtz42LQoYBxDSqwVIo=; b=GUOToEnu6RHisnR2Rjp3Jxf6oy
 MNBfsflpdJdPRH9DpEFm8tc5/yDmdU7EW2bDFN1zgjy6bjIJQ4Hj02T/v9F8iZoZBgtfOL58sTNsM
 Ih8dSllLUQLAMG86IwaMzzRU1JFihbkKRIgv7rFGxbXqE56+46bAc3Ws1LDItZsJILjp6PJ5mOzYW
 koKtwr84SKq/uXxmyEC6/j8iuwXL9zf7q2ECIRT6rZy6hc49dQ471V2KpTJXP8Toy3wvTiSUyFgxP
 9MYWxUyqA2Cw98VgUovf23hpXbYhTLu+61jjFOqDBUByt3zhIzV7Y435Im/64+wAFK/TOqz/kWCSQ
 kUOSkJ4w==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRKx-00Gaod-6c; Tue, 15 Jul 2025 00:07:51 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:03 -0300
Subject: [PATCH v6 2/8] drm/sched: Allow drivers to skip the reset and keep
 on running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-2-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6261; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=+NJslV8elZlBW+7Jaqsil5p64G0jKfZmZlm7gFYIulE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+awV/VfmglFpipQw7IfvvF2YrNqlHrxEwhr
 bkaLB2dv8CJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mgAKCRA/8w6Kdoj6
 qtSnB/9Io6ZN+bUnxPF5tlOEUGltcmRzNkTKjmVHMPBrGlceLnAt/oOlpmDiVULmzNimS/l5RXp
 IvCKc92PWIHeJoAuiOECU2LesBKJDApvi8FY6XoLPH5BUCkW/58mQOhDr1ayT4KQC/XTNBk7NLb
 aU0S9qndKCHiKx7sv9qTmcQdp15PrglzpkYaDyI7xAoVxuuW1goV96Y1kyZ+j6O5tyG1w5pvutL
 drd1+0a4hhxhymCXMXN3PJCPvrh+u54N6qOfYHmDEimQL2YQZ128Fo4mjIcSbz1gKBA8TCvbB1R
 eFC4RJdIfcZ7J0DQau3ktngdD43t/yuCRDH7vdY2hKXENd6R
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
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  3 +++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2593f0c7d98a20a5d22f05e31c6929ec1cd8f9..e2cda28a1af49dbe4d5cc76ce4f20024d8696d31 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -366,11 +366,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
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
 
@@ -523,6 +528,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
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
@@ -556,6 +587,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty = false;
 		}
+
+		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
+			drm_sched_job_reinsert_on_false_timeout(sched, job);
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -578,6 +612,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
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
@@ -663,6 +701,10 @@ EXPORT_SYMBOL(drm_sched_stop);
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
@@ -1184,7 +1226,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_run_free_queue(sched);
+	drm_sched_run_free_queue_unlocked(sched);
 	drm_sched_run_job_queue(sched);
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ed300920996a8d830af5a4c011173ae4c25919dc..323a505e6e6ae014ea1225e6a3709760236568a5 100644
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

