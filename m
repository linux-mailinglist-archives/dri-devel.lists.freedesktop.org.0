Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5E8A7A0F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6332112FFD;
	Wed, 17 Apr 2024 01:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sl6LdlJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A65112FFC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jBi7ok3jYO0c5pZuYjeevgjOuOjlDSBYhXAUqI6ju5M=; b=Sl6LdlJdIML9UlKAO+iF90dNaf
 7MOhI0k0ryjtftmIJlS6/VUTN8ilNlI4LlYOJZbMzpcXzSAMlmY0EMKc++4TSn7TgWsi/FBrCan+a
 iNWDHkUiECLxg+9w5BZneX0cQJROioZkUAIAV1V6vMr81uOdZNATd3HS0KSd17SBMmcdpDBSIVFam
 Feh9PksQhMC6tuCtMovDuOWW/s9uPMMhbAaL+6ZndGirB3PayIYqHLN+mvlhBdr6JmeqXuzEITqf6
 y4BwYhHCtjz65G6L5u71EA4guALB/OLwXrSkVIQTc4N7SjR3niDJLsJIv2m8k7TCLi1sjgxPXk8PP
 zWDCGcfQ==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwtp3-005Mj1-JM; Wed, 17 Apr 2024 03:10:50 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 1/4] drm/v3d: Create two functions to update all GPU stats
 variables
Date: Tue, 16 Apr 2024 21:53:06 -0300
Message-ID: <20240417011021.600889-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417011021.600889-1-mcanal@igalia.com>
References: <20240417011021.600889-1-mcanal@igalia.com>
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

Currently, we manually perform all operations to update the GPU stats
variables. Apart from the code repetition, this is very prone to errors,
as we can see on commit 35f4f8c9fc97 ("drm/v3d: Don't increment
`enabled_ns` twice").

Therefore, create two functions to manage updating all GPU stats
variables. Now, the jobs only need to call for `v3d_job_update_stats()`
when the job is done and `v3d_job_start_stats()` when starting the job.

Co-developed-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  1 +
 drivers/gpu/drm/v3d/v3d_irq.c   | 48 ++------------------
 drivers/gpu/drm/v3d/v3d_sched.c | 80 +++++++++++++++------------------
 3 files changed, 40 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 1950c723dde1..ee3545226d7f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -543,6 +543,7 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo);
 void v3d_mmu_remove_ptes(struct v3d_bo *bo);
 
 /* v3d_sched.c */
+void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue);
 int v3d_sched_init(struct v3d_dev *v3d);
 void v3d_sched_fini(struct v3d_dev *v3d);
 
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index ce6b2fb341d1..d469bda52c1a 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -102,18 +102,8 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FLDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->bin_job->base.irq_fence);
-		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
-		u64 runtime = local_clock() - file->start_ns[V3D_BIN];
-
-		file->jobs_sent[V3D_BIN]++;
-		v3d->queue[V3D_BIN].jobs_sent++;
-
-		file->start_ns[V3D_BIN] = 0;
-		v3d->queue[V3D_BIN].start_ns = 0;
-
-		file->enabled_ns[V3D_BIN] += runtime;
-		v3d->queue[V3D_BIN].enabled_ns += runtime;
 
+		v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
 		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
 		status = IRQ_HANDLED;
@@ -122,18 +112,8 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FRDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->render_job->base.irq_fence);
-		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
-		u64 runtime = local_clock() - file->start_ns[V3D_RENDER];
-
-		file->jobs_sent[V3D_RENDER]++;
-		v3d->queue[V3D_RENDER].jobs_sent++;
-
-		file->start_ns[V3D_RENDER] = 0;
-		v3d->queue[V3D_RENDER].start_ns = 0;
-
-		file->enabled_ns[V3D_RENDER] += runtime;
-		v3d->queue[V3D_RENDER].enabled_ns += runtime;
 
+		v3d_job_update_stats(&v3d->render_job->base, V3D_RENDER);
 		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
 		status = IRQ_HANDLED;
@@ -142,18 +122,8 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_CSDDONE(v3d->ver)) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->csd_job->base.irq_fence);
-		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
-		u64 runtime = local_clock() - file->start_ns[V3D_CSD];
-
-		file->jobs_sent[V3D_CSD]++;
-		v3d->queue[V3D_CSD].jobs_sent++;
-
-		file->start_ns[V3D_CSD] = 0;
-		v3d->queue[V3D_CSD].start_ns = 0;
-
-		file->enabled_ns[V3D_CSD] += runtime;
-		v3d->queue[V3D_CSD].enabled_ns += runtime;
 
+		v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
 		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
 		status = IRQ_HANDLED;
@@ -189,18 +159,8 @@ v3d_hub_irq(int irq, void *arg)
 	if (intsts & V3D_HUB_INT_TFUC) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->tfu_job->base.irq_fence);
-		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
-		u64 runtime = local_clock() - file->start_ns[V3D_TFU];
-
-		file->jobs_sent[V3D_TFU]++;
-		v3d->queue[V3D_TFU].jobs_sent++;
-
-		file->start_ns[V3D_TFU] = 0;
-		v3d->queue[V3D_TFU].start_ns = 0;
-
-		file->enabled_ns[V3D_TFU] += runtime;
-		v3d->queue[V3D_TFU].enabled_ns += runtime;
 
+		v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
 		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
 		status = IRQ_HANDLED;
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 54015ad765c7..8ca61bcd4b1c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -105,11 +105,37 @@ v3d_switch_perfmon(struct v3d_dev *v3d, struct v3d_job *job)
 		v3d_perfmon_start(v3d, job->perfmon);
 }
 
+static void
+v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
+{
+	struct v3d_dev *v3d = job->v3d;
+	struct v3d_file_priv *file = job->file->driver_priv;
+	u64 now = local_clock();
+
+	file->start_ns[queue] = now;
+	v3d->queue[queue].start_ns = now;
+}
+
+void
+v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
+{
+	struct v3d_dev *v3d = job->v3d;
+	struct v3d_file_priv *file = job->file->driver_priv;
+	u64 now = local_clock();
+
+	file->enabled_ns[queue] += now - file->start_ns[queue];
+	file->jobs_sent[queue]++;
+	file->start_ns[queue] = 0;
+
+	v3d->queue[queue].enabled_ns += now - v3d->queue[queue].start_ns;
+	v3d->queue[queue].jobs_sent++;
+	v3d->queue[queue].start_ns = 0;
+}
+
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
-	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 	unsigned long irqflags;
@@ -141,9 +167,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	file->start_ns[V3D_BIN] = local_clock();
-	v3d->queue[V3D_BIN].start_ns = file->start_ns[V3D_BIN];
-
+	v3d_job_start_stats(&job->base, V3D_BIN);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* Set the current and end address of the control list.
@@ -168,7 +192,6 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_render_job *job = to_render_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
-	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
@@ -196,9 +219,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
-	file->start_ns[V3D_RENDER] = local_clock();
-	v3d->queue[V3D_RENDER].start_ns = file->start_ns[V3D_RENDER];
-
+	v3d_job_start_stats(&job->base, V3D_RENDER);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* XXX: Set the QCFG */
@@ -217,7 +238,6 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_tfu_job *job = to_tfu_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
-	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
@@ -232,8 +252,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
 
-	file->start_ns[V3D_TFU] = local_clock();
-	v3d->queue[V3D_TFU].start_ns = file->start_ns[V3D_TFU];
+	v3d_job_start_stats(&job->base, V3D_TFU);
 
 	V3D_WRITE(V3D_TFU_IIA(v3d->ver), job->args.iia);
 	V3D_WRITE(V3D_TFU_IIS(v3d->ver), job->args.iis);
@@ -260,7 +279,6 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_csd_job *job = to_csd_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
-	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 	int i, csd_cfg0_reg, csd_cfg_reg_count;
@@ -279,9 +297,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
 
-	file->start_ns[V3D_CSD] = local_clock();
-	v3d->queue[V3D_CSD].start_ns = file->start_ns[V3D_CSD];
-
+	v3d_job_start_stats(&job->base, V3D_CSD);
 	v3d_switch_perfmon(v3d, &job->base);
 
 	csd_cfg0_reg = V3D_CSD_QUEUED_CFG0(v3d->ver);
@@ -530,8 +546,6 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_cpu_job *job = to_cpu_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
-	struct v3d_file_priv *file = job->base.file->driver_priv;
-	u64 runtime;
 
 	v3d->cpu_job = job;
 
@@ -540,25 +554,13 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 		return NULL;
 	}
 
-	file->start_ns[V3D_CPU] = local_clock();
-	v3d->queue[V3D_CPU].start_ns = file->start_ns[V3D_CPU];
-
+	v3d_job_start_stats(&job->base, V3D_CPU);
 	trace_v3d_cpu_job_begin(&v3d->drm, job->job_type);
 
 	cpu_job_function[job->job_type](job);
 
 	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
-
-	runtime = local_clock() - file->start_ns[V3D_CPU];
-
-	file->enabled_ns[V3D_CPU] += runtime;
-	v3d->queue[V3D_CPU].enabled_ns += runtime;
-
-	file->jobs_sent[V3D_CPU]++;
-	v3d->queue[V3D_CPU].jobs_sent++;
-
-	file->start_ns[V3D_CPU] = 0;
-	v3d->queue[V3D_CPU].start_ns = 0;
+	v3d_job_update_stats(&job->base, V3D_CPU);
 
 	return NULL;
 }
@@ -568,24 +570,12 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_dev *v3d = job->v3d;
-	struct v3d_file_priv *file = job->file->driver_priv;
-	u64 runtime;
 
-	file->start_ns[V3D_CACHE_CLEAN] = local_clock();
-	v3d->queue[V3D_CACHE_CLEAN].start_ns = file->start_ns[V3D_CACHE_CLEAN];
+	v3d_job_start_stats(job, V3D_CACHE_CLEAN);
 
 	v3d_clean_caches(v3d);
 
-	runtime = local_clock() - file->start_ns[V3D_CACHE_CLEAN];
-
-	file->enabled_ns[V3D_CACHE_CLEAN] += runtime;
-	v3d->queue[V3D_CACHE_CLEAN].enabled_ns += runtime;
-
-	file->jobs_sent[V3D_CACHE_CLEAN]++;
-	v3d->queue[V3D_CACHE_CLEAN].jobs_sent++;
-
-	file->start_ns[V3D_CACHE_CLEAN] = 0;
-	v3d->queue[V3D_CACHE_CLEAN].start_ns = 0;
+	v3d_job_update_stats(job, V3D_CACHE_CLEAN);
 
 	return NULL;
 }
-- 
2.44.0

