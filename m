Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D02B368C8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54CD10E16D;
	Tue, 26 Aug 2025 14:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="prr3kJDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8710E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9RnQ3+AFMTIZoBaCOborveBFx2XXbKvEmNLulGk+pQ=; b=prr3kJDcXJ9lYxLZdeQQorFkwa
 xrfgDgcHz9DU5ILT+mDu2JqjT5pLftbfLg/uH3uu6pRam+x37e3dnIB3km4L1/XJAImAhPe1LyBT/
 yVTYKISD507V0CWr6Z34WWICaElKuXRuBz2L0icOOGY4HdrFXauYfrqVn9ynoi9Szuepjl9JV35Ke
 iOeDkxRewh5lKwPOqnIFdJDwooWAWWiO0uAC428Y0bCWJQFFJ76OkE+L+pCPUv4nIxjNUTmIhGo4W
 Fw1f0VPGZcWDte9nA7wePybCPS2n14bSpVC6IWmBNV4pbIhYHZJWJE79pgCMRB8qSIIrtXb6hNS3v
 DMDLXkQQ==;
Received: from [189.7.87.79] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uquW5-001wrM-8N; Tue, 26 Aug 2025 16:19:17 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 26 Aug 2025 11:19:00 -0300
Subject: [PATCH v3 3/6] drm/v3d: Replace a global spinlock with a per-queue
 spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-v3d-queue-lock-v3-3-979efc43e490@igalia.com>
References: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
In-Reply-To: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6509; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3iLUf+PI73wBvmeKdi4c+NZO48WWq6PWY5Hk3B6fCTU=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBorcJYfvAFhNKFllolUTbbGWVvmaf+Bz4pIL/0/
 gq0pz2s5RiJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaK3CWAAKCRA/8w6Kdoj6
 qt1vCACfJ0v1zU+pIKHxNR6dBz1hFsCksfUMsRqwsQSauduhs5LPD8DNtJOV407Vx6W7AlvvHyC
 UccqzbZNl4+dsF51x2cy3oivFASSxA+IF9xU6npFuizfAzK6p03Hs9A10+jTCa230kzm00oXFSL
 t731ANRxT9JLiV3tr3QEHfuEIuz8SM0uqvmk07Pj/HwLb7gg6SNXfOTyIv+8NSuBe/mUh+wRGzb
 9h1kG+h2GBosKmsL2W+v/AGXmUuN9DPnVjf3RFXNAMheN/bWSbvBFwINGLmVXFSOJIFIHaINs0G
 exC9mjnJ8/1wvmZ+chn+OHTg0NRSqA7mvd+8GmpOcqMGT7Og
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

Each V3D queue works independently and all the dependencies between the
jobs are handled through the DRM scheduler. Therefore, there is no need
to use one single lock for all queues. Using it, creates unnecessary
contention between different queues that can operate independently.

Replace the global spinlock with per-queue locks to improve parallelism
and reduce contention between different V3D queues (BIN, RENDER, TFU,
CSD). This allows independent queues to operate concurrently while
maintaining proper synchronization within each queue.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  8 ++------
 drivers/gpu/drm/v3d/v3d_fence.c | 11 ++++++-----
 drivers/gpu/drm/v3d/v3d_gem.c   |  3 ++-
 drivers/gpu/drm/v3d/v3d_irq.c   |  6 +++---
 drivers/gpu/drm/v3d/v3d_sched.c | 13 +++++++------
 5 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index d557caca5c4b8a7d7dcd35067208c5405de9df3c..cfc2f9c123aa99f6f1875b297eaf6c226b03d4ec 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -61,6 +61,7 @@ struct v3d_queue_state {
 
 	/* Currently active job for this queue */
 	struct v3d_job *active_job;
+	spinlock_t queue_lock;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
@@ -164,11 +165,6 @@ struct v3d_dev {
 
 	struct v3d_queue_state queue[V3D_MAX_QUEUES];
 
-	/* Spinlock used to synchronize the overflow memory
-	 * management against bin job submission.
-	 */
-	spinlock_t job_lock;
-
 	/* Used to track the active perfmon if any. */
 	struct v3d_perfmon *active_perfmon;
 
@@ -568,7 +564,7 @@ void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
 
 /* v3d_fence.c */
 extern const struct dma_fence_ops v3d_fence_ops;
-struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue);
+struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
 
 /* v3d_gem.c */
 int v3d_gem_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/v3d/v3d_fence.c b/drivers/gpu/drm/v3d/v3d_fence.c
index 89840ed212c06036e5b9ecef91852a490538ba89..8f8471adae34af7a444f5eeca4ef08d66ac1b7b5 100644
--- a/drivers/gpu/drm/v3d/v3d_fence.c
+++ b/drivers/gpu/drm/v3d/v3d_fence.c
@@ -3,8 +3,9 @@
 
 #include "v3d_drv.h"
 
-struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue)
+struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q)
 {
+	struct v3d_queue_state *queue = &v3d->queue[q];
 	struct v3d_fence *fence;
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
@@ -12,10 +13,10 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue)
 		return ERR_PTR(-ENOMEM);
 
 	fence->dev = &v3d->drm;
-	fence->queue = queue;
-	fence->seqno = ++v3d->queue[queue].emit_seqno;
-	dma_fence_init(&fence->base, &v3d_fence_ops, &v3d->job_lock,
-		       v3d->queue[queue].fence_context, fence->seqno);
+	fence->queue = q;
+	fence->seqno = ++queue->emit_seqno;
+	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->queue_lock,
+		       queue->fence_context, fence->seqno);
 
 	return &fence->base;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index cfa09b73c1ed0f3a10f20e616d8abdb08d9b2f11..c77d90aa9b829900147dae0778f42477c8ba1bf6 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -271,10 +271,11 @@ v3d_gem_init(struct drm_device *dev)
 		queue->fence_context = dma_fence_context_alloc(1);
 		memset(&queue->stats, 0, sizeof(queue->stats));
 		seqcount_init(&queue->stats.lock);
+
+		spin_lock_init(&queue->queue_lock);
 	}
 
 	spin_lock_init(&v3d->mm_lock);
-	spin_lock_init(&v3d->job_lock);
 	ret = drmm_mutex_init(dev, &v3d->bo_lock);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 6605ec2008281583aed547180533f5ae57b7f904..31ecc5b4ba5af1efbde691b3557a612f6c31552f 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -62,17 +62,17 @@ v3d_overflow_mem_work(struct work_struct *work)
 	 * bin job got scheduled, that's fine.  We'll just give them
 	 * some binner pool anyway.
 	 */
-	spin_lock_irqsave(&v3d->job_lock, irqflags);
+	spin_lock_irqsave(&queue->queue_lock, irqflags);
 	bin_job = (struct v3d_bin_job *)queue->active_job;
 
 	if (!bin_job) {
-		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
+		spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 		goto out;
 	}
 
 	drm_gem_object_get(obj);
 	list_add_tail(&bo->unref_head, &bin_job->render->unref_list);
-	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
+	spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 
 	v3d_mmu_flush_all(v3d);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 65375e2d4922e4fac41cc2a7c200bce538f57ac4..1ae447e58ac28f0d5299446fc2d11358fa36ff4a 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -226,27 +226,28 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
+	struct v3d_queue_state *queue = &v3d->queue[V3D_BIN];
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 	unsigned long irqflags;
 
 	if (unlikely(job->base.base.s_fence->finished.error)) {
-		spin_lock_irqsave(&v3d->job_lock, irqflags);
-		v3d->queue[V3D_BIN].active_job = NULL;
-		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
+		spin_lock_irqsave(&queue->queue_lock, irqflags);
+		queue->active_job = NULL;
+		spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 		return NULL;
 	}
 
 	/* Lock required around bin_job update vs
 	 * v3d_overflow_mem_work().
 	 */
-	spin_lock_irqsave(&v3d->job_lock, irqflags);
-	v3d->queue[V3D_BIN].active_job = &job->base;
+	spin_lock_irqsave(&queue->queue_lock, irqflags);
+	queue->active_job = &job->base;
 	/* Clear out the overflow allocation, so we don't
 	 * reuse the overflow attached to a previous job.
 	 */
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, 0);
-	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
+	spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 
 	v3d_invalidate_caches(v3d);
 

-- 
2.51.0

