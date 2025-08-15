Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADBB286C8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 21:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444DE10E286;
	Fri, 15 Aug 2025 19:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZUcF/eHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926F910E286
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OwP+AZ3PEJOkOxKSRBseCgz6CO44L1eGslvu625pnGc=; b=ZUcF/eHLBr+3Avwl2m1/Oeox6+
 Wy3gbopmjoejJPjoRvWwK7hP6b0h5EzitOVv09UQ+LkoP6MYseA3SL7v7iEh4Ik3HMX6Sfey2eKkR
 LX3anD1XiqKe2sVP94BaCPL113pLDVe3X/pSJ8pi+D8GNQp+2GaAAsC/il2FVI/PvpnrtD6mupHsq
 foHGiQZMV1IKapi4gBrN71QL1hGQC8Ln7vFZuyhhawvhDxbra4PTo3nln70OcP4+m7xw80CeijORW
 5TtYHNPOdCp/iD/kifm9yrqB0uQtGrGdcYa57Rgn3k7tSfBRcpGGJRreFgxVLbb6eLSMGgcNkMWMC
 H7jrHuYg==;
Received: from [177.191.196.76] (helo=[192.168.0.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1un0Zt-00EoI4-5V; Fri, 15 Aug 2025 21:59:05 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 15 Aug 2025 16:58:41 -0300
Subject: [PATCH v2 2/6] drm/v3d: Store the active job inside the queue's state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250815-v3d-queue-lock-v2-2-ce37258ffb53@igalia.com>
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
In-Reply-To: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8074; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=7nYQvZ1j9Ldo9oIc3IH9nL4upNi6AxKR5rghdL6IBVs=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBon5F/wLmZGvnso3Sjq9i+mWvmH9U5oPgkREVUY
 d3ZuHAK9t6JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaJ+RfwAKCRA/8w6Kdoj6
 qtYsB/4zw69nEUz/8gfjMyPdvJ3bnwxb3oSv2+8Y+yIal4RypVQrLSOZxj4SfMcKHlrfdYAjKhp
 u2QRYY7PTVgSsyPvF6+2sxV9yEHXPq+7dDPjivw497pAeZ840Hi60J53bOL5UZaCto4hL433YFA
 wWBn/B0GiPQS33MgNvOubqNer4q5VwbswvvYwFPvjb8r+JVdAFHWTUNscA4onMezY0S+DhrO0nH
 sSmXht3i+oFDs1ap0yhlcfrqN7JFibO4xujk6OddKpBF8YSvwpnagn1IphxeYiTAaywWJzfA27o
 gGjrJ7Eb3az2+sy5bM5DVfoEhAHS7KaL2jS2fR20n8c1paub
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

Instead of storing the queue's active job in four different variables,
store the active job inside the queue's state. This way, it's possible
to access all active jobs using an index based in `enum v3d_queue`.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  8 ++----
 drivers/gpu/drm/v3d/v3d_gem.c   |  7 ++---
 drivers/gpu/drm/v3d/v3d_irq.c   | 62 ++++++++++++++++-------------------------
 drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++------
 4 files changed, 38 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 951a302336ce55f0a70f6a7adc0ec7ca30033198..d557caca5c4b8a7d7dcd35067208c5405de9df3c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -58,6 +58,9 @@ struct v3d_queue_state {
 
 	/* Stores the GPU stats for this queue in the global context. */
 	struct v3d_stats stats;
+
+	/* Currently active job for this queue */
+	struct v3d_job *active_job;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
@@ -159,11 +162,6 @@ struct v3d_dev {
 
 	struct work_struct overflow_mem_work;
 
-	struct v3d_bin_job *bin_job;
-	struct v3d_render_job *render_job;
-	struct v3d_tfu_job *tfu_job;
-	struct v3d_csd_job *csd_job;
-
 	struct v3d_queue_state queue[V3D_MAX_QUEUES];
 
 	/* Spinlock used to synchronize the overflow memory
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 37bf5eecdd2c147c89dcad4ff3a7d4ac32a900d0..cfa09b73c1ed0f3a10f20e616d8abdb08d9b2f11 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -324,6 +324,7 @@ void
 v3d_gem_destroy(struct drm_device *dev)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
+	enum v3d_queue q;
 
 	v3d_sched_fini(v3d);
 	v3d_gemfs_fini(v3d);
@@ -331,10 +332,8 @@ v3d_gem_destroy(struct drm_device *dev)
 	/* Waiting for jobs to finish would need to be done before
 	 * unregistering V3D.
 	 */
-	WARN_ON(v3d->bin_job);
-	WARN_ON(v3d->render_job);
-	WARN_ON(v3d->tfu_job);
-	WARN_ON(v3d->csd_job);
+	for (q = 0; q < V3D_MAX_QUEUES; q++)
+		WARN_ON(v3d->queue[q].active_job);
 
 	drm_mm_takedown(&v3d->mm);
 
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index a515a301e4802942520231aad2a13b939d73013d..6605ec2008281583aed547180533f5ae57b7f904 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -42,6 +42,8 @@ v3d_overflow_mem_work(struct work_struct *work)
 		container_of(work, struct v3d_dev, overflow_mem_work);
 	struct drm_device *dev = &v3d->drm;
 	struct v3d_bo *bo = v3d_bo_create(dev, NULL /* XXX: GMP */, 256 * 1024);
+	struct v3d_queue_state *queue = &v3d->queue[V3D_BIN];
+	struct v3d_bin_job *bin_job;
 	struct drm_gem_object *obj;
 	unsigned long irqflags;
 
@@ -61,13 +63,15 @@ v3d_overflow_mem_work(struct work_struct *work)
 	 * some binner pool anyway.
 	 */
 	spin_lock_irqsave(&v3d->job_lock, irqflags);
-	if (!v3d->bin_job) {
+	bin_job = (struct v3d_bin_job *)queue->active_job;
+
+	if (!bin_job) {
 		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 		goto out;
 	}
 
 	drm_gem_object_get(obj);
-	list_add_tail(&bo->unref_head, &v3d->bin_job->render->unref_list);
+	list_add_tail(&bo->unref_head, &bin_job->render->unref_list);
 	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 
 	v3d_mmu_flush_all(v3d);
@@ -79,6 +83,20 @@ v3d_overflow_mem_work(struct work_struct *work)
 	drm_gem_object_put(obj);
 }
 
+static void
+v3d_irq_signal_fence(struct v3d_dev *v3d, enum v3d_queue q,
+		     void (*trace_irq)(struct drm_device *, uint64_t))
+{
+	struct v3d_queue_state *queue = &v3d->queue[q];
+	struct v3d_fence *fence = to_v3d_fence(queue->active_job->irq_fence);
+
+	v3d_job_update_stats(queue->active_job, q);
+	trace_irq(&v3d->drm, fence->seqno);
+
+	queue->active_job = NULL;
+	dma_fence_signal(&fence->base);
+}
+
 static irqreturn_t
 v3d_irq(int irq, void *arg)
 {
@@ -102,41 +120,17 @@ v3d_irq(int irq, void *arg)
 	}
 
 	if (intsts & V3D_INT_FLDONE) {
-		struct v3d_fence *fence =
-			to_v3d_fence(v3d->bin_job->base.irq_fence);
-
-		v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
-		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
-
-		v3d->bin_job = NULL;
-		dma_fence_signal(&fence->base);
-
+		v3d_irq_signal_fence(v3d, V3D_BIN, trace_v3d_bcl_irq);
 		status = IRQ_HANDLED;
 	}
 
 	if (intsts & V3D_INT_FRDONE) {
-		struct v3d_fence *fence =
-			to_v3d_fence(v3d->render_job->base.irq_fence);
-
-		v3d_job_update_stats(&v3d->render_job->base, V3D_RENDER);
-		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
-
-		v3d->render_job = NULL;
-		dma_fence_signal(&fence->base);
-
+		v3d_irq_signal_fence(v3d, V3D_RENDER, trace_v3d_rcl_irq);
 		status = IRQ_HANDLED;
 	}
 
 	if (intsts & V3D_INT_CSDDONE(v3d->ver)) {
-		struct v3d_fence *fence =
-			to_v3d_fence(v3d->csd_job->base.irq_fence);
-
-		v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
-		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
-
-		v3d->csd_job = NULL;
-		dma_fence_signal(&fence->base);
-
+		v3d_irq_signal_fence(v3d, V3D_CSD, trace_v3d_csd_irq);
 		status = IRQ_HANDLED;
 	}
 
@@ -168,15 +162,7 @@ v3d_hub_irq(int irq, void *arg)
 	V3D_WRITE(V3D_HUB_INT_CLR, intsts);
 
 	if (intsts & V3D_HUB_INT_TFUC) {
-		struct v3d_fence *fence =
-			to_v3d_fence(v3d->tfu_job->base.irq_fence);
-
-		v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
-		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
-
-		v3d->tfu_job = NULL;
-		dma_fence_signal(&fence->base);
-
+		v3d_irq_signal_fence(v3d, V3D_TFU, trace_v3d_tfu_irq);
 		status = IRQ_HANDLED;
 	}
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 1846030c5f3a508455087947872dacbfd6fb52ad..91f2e76319ef9ddef9a9e6e88651be0a5128fc1f 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -232,7 +232,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 
 	if (unlikely(job->base.base.s_fence->finished.error)) {
 		spin_lock_irqsave(&v3d->job_lock, irqflags);
-		v3d->bin_job = NULL;
+		v3d->queue[V3D_BIN].active_job = NULL;
 		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 		return NULL;
 	}
@@ -241,7 +241,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	 * v3d_overflow_mem_work().
 	 */
 	spin_lock_irqsave(&v3d->job_lock, irqflags);
-	v3d->bin_job = job;
+	v3d->queue[V3D_BIN].active_job = to_v3d_job(sched_job);
 	/* Clear out the overflow allocation, so we don't
 	 * reuse the overflow attached to a previous job.
 	 */
@@ -290,11 +290,11 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 
 	if (unlikely(job->base.base.s_fence->finished.error)) {
-		v3d->render_job = NULL;
+		v3d->queue[V3D_RENDER].active_job = NULL;
 		return NULL;
 	}
 
-	v3d->render_job = job;
+	v3d->queue[V3D_RENDER].active_job = to_v3d_job(sched_job);
 
 	/* Can we avoid this flush?  We need to be careful of
 	 * scheduling, though -- imagine job0 rendering to texture and
@@ -338,11 +338,11 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 
 	if (unlikely(job->base.base.s_fence->finished.error)) {
-		v3d->tfu_job = NULL;
+		v3d->queue[V3D_TFU].active_job = NULL;
 		return NULL;
 	}
 
-	v3d->tfu_job = job;
+	v3d->queue[V3D_TFU].active_job = to_v3d_job(sched_job);
 
 	fence = v3d_fence_create(v3d, V3D_TFU);
 	if (IS_ERR(fence))
@@ -386,11 +386,11 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	int i, csd_cfg0_reg;
 
 	if (unlikely(job->base.base.s_fence->finished.error)) {
-		v3d->csd_job = NULL;
+		v3d->queue[V3D_CSD].active_job = NULL;
 		return NULL;
 	}
 
-	v3d->csd_job = job;
+	v3d->queue[V3D_CSD].active_job = to_v3d_job(sched_job);
 
 	v3d_invalidate_caches(v3d);
 

-- 
2.50.1

