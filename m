Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D5773122
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 23:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA310E384;
	Mon,  7 Aug 2023 21:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5C10E37D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JTR1GfX2bdh0Z3nWy9pa4mx0dYu8D6l/lusRYPWANqY=; b=nwjuNwePrORlkzahkd0vBdO0/S
 U6FpOrb5coSRNgU+3JZnNlKgMx7FEpLeupVijuqExn6JSCEpSOAgISu9b/2jowSNhwbv1cjsFKyk6
 lPye7p2t5W4KkM3DX2nRJx4itkJcuqEqk4kW3YpSlFyJuBneXo0fZA1Z+ETjDZz8mvLWgPK821PHB
 21DcxOmpuBviHkaPOrARZ1NU4CuUbndq2riJoj9vupaOf3RkwPq4ShO0Q0iU1ggbXVVRM2n6O8BXw
 ZptnMZ5epxTiA7z1aVgqmd0rrVYHYXV6gPriwa0sX8UDo7QYF/U58NRYHXemOkX6dVGJEYEl6dFU5
 cBb1QjQA==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qT7dK-00F1NC-FK; Mon, 07 Aug 2023 23:19:22 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 1/2] drm/v3d: Implement show_fdinfo() callback for GPU
 usage stats
Date: Mon,  7 Aug 2023 18:12:54 -0300
Message-ID: <20230807211849.49867-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807211849.49867-1-mcanal@igalia.com>
References: <20230807211849.49867-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch exposes the accumulated amount of active time per client
through the fdinfo infrastructure. The amount of active time is exposed
for each V3D queue: BIN, RENDER, CSD, TFU and CACHE_CLEAN.

In order to calculate the amount of active time per client, a CPU clock
is used through the function local_clock(). The point where the jobs has
started is marked and is finally compared with the time that the job had
finished.

Moreover, the number of jobs submitted to each queue is also exposed on
fdinfo through the identifier "v3d-jobs-<queue>".

Co-developed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c   | 30 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h   | 23 +++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c   |  1 +
 drivers/gpu/drm/v3d/v3d_irq.c   | 17 +++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c | 24 ++++++++++++++++++++++++
 5 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ffbbe9d527d3..ca65c707da03 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/sched/clock.h>
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
@@ -111,6 +112,10 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	v3d_priv->v3d = v3d;
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
+		v3d_priv->enabled_ns[i] = 0;
+		v3d_priv->start_ns[i] = 0;
+		v3d_priv->jobs_sent[i] = 0;
+
 		sched = &v3d->queue[i].sched;
 		drm_sched_entity_init(&v3d_priv->sched_entity[i],
 				      DRM_SCHED_PRIORITY_NORMAL, &sched,
@@ -136,7 +141,29 @@ v3d_postclose(struct drm_device *dev, struct drm_file *file)
 	kfree(v3d_priv);
 }
 
-DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
+static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct v3d_file_priv *file_priv = file->driver_priv;
+	u64 timestamp = local_clock();
+	enum v3d_queue queue;
+
+	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
+		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
+			   v3d_queue_to_string(queue),
+			   file_priv->start_ns[queue] ? file_priv->enabled_ns[queue]
+						      + timestamp - file_priv->start_ns[queue]
+						      : file_priv->enabled_ns[queue]);
+
+		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
+			   v3d_queue_to_string(queue), file_priv->jobs_sent[queue]);
+	}
+}
+
+static const struct file_operations v3d_drm_fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
  * protection between clients.  Note that render nodes would be
@@ -176,6 +203,7 @@ static const struct drm_driver v3d_drm_driver = {
 	.ioctls = v3d_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(v3d_drm_ioctls),
 	.fops = &v3d_drm_fops,
+	.show_fdinfo = v3d_show_fdinfo,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7f664a4b2a75..7f2897e5b2cb 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -21,6 +21,18 @@ struct reset_control;
 
 #define V3D_MAX_QUEUES (V3D_CACHE_CLEAN + 1)
 
+static inline char *v3d_queue_to_string(enum v3d_queue queue)
+{
+	switch (queue) {
+	case V3D_BIN: return "bin";
+	case V3D_RENDER: return "render";
+	case V3D_TFU: return "tfu";
+	case V3D_CSD: return "csd";
+	case V3D_CACHE_CLEAN: return "cache_clean";
+	}
+	return "UNKNOWN";
+}
+
 struct v3d_queue_state {
 	struct drm_gpu_scheduler sched;
 
@@ -167,6 +179,12 @@ struct v3d_file_priv {
 	} perfmon;
 
 	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
+
+	u64 start_ns[V3D_MAX_QUEUES];
+
+	u64 enabled_ns[V3D_MAX_QUEUES];
+
+	u64 jobs_sent[V3D_MAX_QUEUES];
 };
 
 struct v3d_bo {
@@ -238,6 +256,11 @@ struct v3d_job {
 	 */
 	struct v3d_perfmon *perfmon;
 
+	/* File descriptor of the process that submitted the job that could be used
+	 * for collecting stats by process of GPU usage.
+	 */
+	struct drm_file *file;
+
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
 };
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..40ed0c7c3fad 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -415,6 +415,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job = *container;
 	job->v3d = v3d;
 	job->free = free;
+	job->file = file_priv;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
 				 v3d_priv);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index e714d5318f30..c898800ae9c2 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/sched/clock.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
@@ -100,6 +101,10 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FLDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->bin_job->base.irq_fence);
+		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
+
+		file->enabled_ns[V3D_BIN] += local_clock() - file->start_ns[V3D_BIN];
+		file->start_ns[V3D_BIN] = 0;
 
 		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -109,6 +114,10 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_FRDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->render_job->base.irq_fence);
+		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
+
+		file->enabled_ns[V3D_RENDER] += local_clock() - file->start_ns[V3D_RENDER];
+		file->start_ns[V3D_RENDER] = 0;
 
 		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -118,6 +127,10 @@ v3d_irq(int irq, void *arg)
 	if (intsts & V3D_INT_CSDDONE) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->csd_job->base.irq_fence);
+		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
+
+		file->enabled_ns[V3D_CSD] += local_clock() - file->start_ns[V3D_CSD];
+		file->start_ns[V3D_CSD] = 0;
 
 		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
@@ -154,6 +167,10 @@ v3d_hub_irq(int irq, void *arg)
 	if (intsts & V3D_HUB_INT_TFUC) {
 		struct v3d_fence *fence =
 			to_v3d_fence(v3d->tfu_job->base.irq_fence);
+		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
+
+		file->enabled_ns[V3D_TFU] += local_clock() - file->start_ns[V3D_TFU];
+		file->start_ns[V3D_TFU] = 0;
 
 		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..b360709c0765 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -18,6 +18,7 @@
  * semaphores to interlock between them.
  */
 
+#include <linux/sched/clock.h>
 #include <linux/kthread.h>
 
 #include "v3d_drv.h"
@@ -76,6 +77,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 	unsigned long irqflags;
@@ -107,6 +109,9 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
+	file->start_ns[V3D_BIN] = local_clock();
+	file->jobs_sent[V3D_BIN]++;
+
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* Set the current and end address of the control list.
@@ -131,6 +136,7 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_render_job *job = to_render_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
@@ -158,6 +164,9 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
 			    job->start, job->end);
 
+	file->start_ns[V3D_RENDER] = local_clock();
+	file->jobs_sent[V3D_RENDER]++;
+
 	v3d_switch_perfmon(v3d, &job->base);
 
 	/* XXX: Set the QCFG */
@@ -176,6 +185,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_tfu_job *job = to_tfu_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
@@ -190,6 +200,9 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
 
+	file->start_ns[V3D_TFU] = local_clock();
+	file->jobs_sent[V3D_TFU]++;
+
 	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
 	V3D_WRITE(V3D_TFU_IIS, job->args.iis);
 	V3D_WRITE(V3D_TFU_ICA, job->args.ica);
@@ -213,6 +226,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_csd_job *job = to_csd_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_file_priv *file = job->base.file->driver_priv;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 	int i;
@@ -231,6 +245,9 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 
 	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
 
+	file->start_ns[V3D_CSD] = local_clock();
+	file->jobs_sent[V3D_CSD]++;
+
 	v3d_switch_perfmon(v3d, &job->base);
 
 	for (i = 1; i <= 6; i++)
@@ -246,9 +263,16 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 	struct v3d_dev *v3d = job->v3d;
+	struct v3d_file_priv *file = job->file->driver_priv;
+
+	file->start_ns[V3D_CACHE_CLEAN] = local_clock();
+	file->jobs_sent[V3D_CACHE_CLEAN]++;
 
 	v3d_clean_caches(v3d);
 
+	file->enabled_ns[V3D_CACHE_CLEAN] += local_clock() - file->start_ns[V3D_CACHE_CLEAN];
+	file->start_ns[V3D_CACHE_CLEAN] = 0;
+
 	return NULL;
 }
 
-- 
2.41.0

