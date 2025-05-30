Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB48AC90DE
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CDA10E828;
	Fri, 30 May 2025 14:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aaXBGorc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2D310E86E;
 Fri, 30 May 2025 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGkC/InPD/6hGYwcxvDfvouTwAjmaHOiUvv8Q7gFsYk=; b=aaXBGorc8QCTQvLOw40kyLvp08
 3BBcAOC37fz/moXnCiUGuVPmGIX6oSGr9SALHfdr2sDvEizdi29zeHnbjczN7pUqUXK0sZ2CKHBr+
 T3Z7aQFhzrYKP6xfRb9t+8L3mOeiGoaFfS/vQPKIfU8au8LOXimGJ37Xx+zgzbdS3afhvGf6QdelQ
 PURbZ5s3SeS9hBD5y6HTcO3WtVmswjAsULpa3iZ/JTwpdF6y70v6XtXaP2bSlpLM//lvFx6Vu+LmA
 CUYh3ZrxiHQ+NDVwJ4z2SKKFFdKMWO4K+P8xuQLYnIWFOerkm5wUQ7GQq2ZEIHgAP+aruUZZMpFPo
 BuWz1RjA==;
Received: from [189.7.87.163]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uL0JU-00FFzl-Fo; Fri, 30 May 2025 16:02:24 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 30 May 2025 11:01:31 -0300
Subject: [PATCH v2 2/8] drm/sched: Allow drivers to skip the reset and keep
 on running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sched-skip-reset-v2-2-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6184; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=/N74i4+fCH+kvIReYfB6d/HSbGUR4a9xgZWn5HL5hc0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoObpUfvLFU8akCnP+Yo+dSAG7juuJsy5OrsWNL
 UV+CdxlT0eJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaDm6VAAKCRA/8w6Kdoj6
 qoYlCACPCqZcVvGVSgOUwyfa49voRzTNfjr5CGDuB0zBcsV9ygzipTx1ZR1wSpADaAliRwTbpPD
 +1/EIpbJYU2U3vf1JE4DybYIh98wVo9wTrckr++v2FtWFim0lTY4JadtEh+zYtYp4ZsD86WX3EY
 fyMyJ4pBdKpfwS4qMvc1En5Y6FWAy5HgUjISQs/HDKMd444/LF2H7IqYJJk7wOhp9JucNRyzBdT
 eqv2juaMqmhwF2wLyEan0O3PWCumwHhHaE1EEgLPZB/UWRZHQHUrVxeZPoCkOGxakW7TgkFDr0y
 IVPE3NpBqb7+tAOsNY0NlY+UgM4qzVcFJh6iR12OJ+p6IUls
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
instead, a job may still be running, and there may be no valid reason to
reset the hardware. This can occur in two situations:

  1. The GPU exposes some mechanism that ensures the GPU is still making
     progress. By checking this mechanism, the driver can safely skip the
     reset, re-arm the timeout, and allow the job to continue running until
     completion. This is the case for v3d, Etnaviv, and Xe.
  2. Timeout has fired before the free-job worker. Consequently, the
     scheduler calls `timedout_job()` for a job that isn't timed out.

These two scenarios are problematic because the job was removed from the
`sched->pending_list` before calling `sched->ops->timedout_job()`, which
means that when the job finishes, it won't be freed by the scheduler
though `sched->ops->free_job()`. As a result, the job and its resources
won't be freed, leading to a memory leak.

To resolve those scenarios, create a new `drm_gpu_sched_stat`, called
DRM_GPU_SCHED_STAT_NO_HANG, that allows a driver to skip the reset. The
new status will indicate that the job should be reinserted into the
pending list, and the hardware / driver is still responsible to
signal job completion.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 49 ++++++++++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  3 +++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3b0760dfa4fe2fc63e893cda733e78d08dd451d5..ddc53eadab7bb6a15109f43989afa1f7a95a3b41 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -379,11 +379,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
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
 
@@ -536,6 +541,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_job_reinsert_on_false_timeout - Reinsert the job on a false timeout
+ *
+ * @sched: scheduler instance
+ * @job: job to be reinserted on the pending list
+ *
+ * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
+ * hung and the job is making progress, the scheduler must reinsert the job back
+ * into the pending list. Otherwise, the job and its resources won't be freed
+ * through the &drm_sched_backend_ops.free_job callback.
+ *
+ * Note that after reinserting the job, the scheduler enqueues the free-job
+ * work again if ready. Otherwise, a signaled job could be added to the pending
+ * list, but never freed.
+ *
+ * This function must be used in "false timeout" cases only.
+ */
+static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
+						    struct drm_sched_job *job)
+{
+	spin_lock(&sched->job_list_lock);
+	list_add(&job->list, &sched->pending_list);
+	drm_sched_run_free_queue(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
@@ -569,6 +600,14 @@ static void drm_sched_job_timedout(struct work_struct *work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty = false;
 		}
+
+		/*
+		 * If the driver indicated that the GPU is still running and wants
+		 * to skip the reset, reinsert the job back into the pending list
+		 * and re-arm the timeout.
+		 */
+		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
+			drm_sched_job_reinsert_on_false_timeout(sched, job);
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -591,6 +630,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
  * This function is typically used for reset recovery (see the docu of
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler teardown, i.e., before calling drm_sched_fini().
+ *
+ * As it's used for reset recovery, drm_sched_stop() shouldn't be called
+ * if the driver skipped the timeout (DRM_GPU_SCHED_STAT_NO_HANG).
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
@@ -676,6 +718,9 @@ EXPORT_SYMBOL(drm_sched_stop);
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler startup. The scheduler itself is fully operational after
  * drm_sched_init() succeeded.
+ *
+ * As it's used for reset recovery, drm_sched_start() shouldn't be called
+ * if the driver skipped the timeout (DRM_GPU_SCHED_STAT_NO_HANG).
  */
 void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 {
@@ -1197,7 +1242,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_run_free_queue(sched);
+	drm_sched_run_free_queue_unlocked(sched);
 	drm_sched_run_job_queue(sched);
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..063c1915841aa54a0859bdccd3c1ef6028105bec 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -393,11 +393,14 @@ struct drm_sched_job {
  * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
  * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
  * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
+ * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's belief, the GPU
+ * did not hang and it's operational.
  */
 enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE,
 	DRM_GPU_SCHED_STAT_RESET,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_NO_HANG,
 };
 
 /**

-- 
2.49.0

