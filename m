Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7EAFB658
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2E810E4BE;
	Mon,  7 Jul 2025 14:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e0Fs4iLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1158610E4BA;
 Mon,  7 Jul 2025 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=noW863v3CCd6/TNzESUn8DA+5LpnB6duHBduB1dfFhQ=; b=e0Fs4iLr1VDRNreTW2WG6M4pXy
 4khohBnTtt3Tc6hEOvp2xt1KnMjFX7OBHW45vRs6d0BixHevFWKFTZAiz/pv8HJi6OrHv/HS8KzlQ
 AzzVLS2kOnv8LIii38FhST9VjB8eNSzGyx+z74Yv4B3I+2mitND9l9eflT4atKVq07xqV9rbKsfe2
 KcYNx7Ufaoxi416Vr2mCt/g1TLemfnjqK+InIAlYFc8ghZnbSrD9n/3IgSoIZ7nJHCjfNBhOVQy2p
 cXjFhXR9iKBp6hbN63qI6eUJK1Igqe3zMZMD2eFO8gHmZP8FH4S46oni0WQMKNMkPDLCBRvpqbYfY
 liI+9s8w==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYn7j-00DaQv-Ed; Mon, 07 Jul 2025 16:47:15 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 07 Jul 2025 11:46:31 -0300
Subject: [PATCH v4 2/8] drm/sched: Allow drivers to skip the reset and keep
 on running
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-sched-skip-reset-v4-2-036c0f0f584f@igalia.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
In-Reply-To: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5931; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=jZcX0xQdVQJXmmagzIDZ3gZ9sNjZ0TgMZKZyMKeyLV0=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoa93YdB+xXj500dDi/2HFFK93I1VlCvDYREFWC
 P2IQT7xHCCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaGvd2AAKCRA/8w6Kdoj6
 qqkNB/9k62Fmhb82GyVJqYaKcUFhFwOtTE44o1OMpKA3NCJj5ZWowq2W/yJ2QGB8uzLga1Cc47z
 +UjcvsFVsTxlb+UBGhEV1mf9QsGRuW5DV6UCBt8g4smFP719VVHytpwvkYyMGAa13iApKsgq4iH
 eWJcQ3eqksqEA6By9x1tEcfls1fTn95HcmJjBcf6WR4hD2BEio3PCaW0NDiDzvFBcxolHvlTPdO
 WkhxKtJYhDKbuYYw4JexR0ZGFrO0+GcNTBcVd35DyyYps1yl6GtevjYjc4gZIvR4aOcRWG8GN6o
 qSUpDQXY8uDnDf1M7PU/ESyVz5Opm/aZG32Zla43zSbSooBO
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
     scheduler calls `sched->ops->timedout_job()` for a job that isn't
     timed out.

These two scenarios are problematic because the job was removed from the
`sched->pending_list` before calling `sched->ops->timedout_job()`, which
means that when the job finishes, it won't be freed by the scheduler
though `sched->ops->free_job()` - leading to a memory leak.

To solve those problems, create a new `drm_gpu_sched_stat`, called
DRM_GPU_SCHED_STAT_NO_HANG, that allows a driver to skip the reset. The
new status will indicate that the job must be reinserted into the
pending list, and the hardware / driver will still complete that job.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 43 ++++++++++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  3 +++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0f32e2cb43d6af294408968a970990f9f5c47bee..d3f48526883cc7ceea0cd1d0c62fb119f7092704 100644
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
 
@@ -531,6 +536,31 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
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
@@ -564,6 +594,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty = false;
 		}
+
+		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
+			drm_sched_job_reinsert_on_false_timeout(sched, job);
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -586,6 +619,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
  * This function is typically used for reset recovery (see the docu of
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler teardown, i.e., before calling drm_sched_fini().
+ *
+ * As it's used for reset recovery, drm_sched_stop() shouldn't be called
+ * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
  */
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
@@ -671,6 +707,9 @@ EXPORT_SYMBOL(drm_sched_stop);
  * drm_sched_backend_ops.timedout_job() for details). Do not call it for
  * scheduler startup. The scheduler itself is fully operational after
  * drm_sched_init() succeeded.
+ *
+ * As it's used for reset recovery, drm_sched_start() shouldn't be called
+ * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
  */
 void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
 {
@@ -1192,7 +1231,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
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

