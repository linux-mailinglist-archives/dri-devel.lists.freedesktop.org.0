Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C396BB0B03E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6C10E3E7;
	Sat, 19 Jul 2025 13:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DYu2njGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F08D10E3BA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m2KENvdsHvzNcRkQQo18ciMKZsmG6+zzm8e/g2rX5TA=; b=DYu2njGSTmOXUgNd/vmdSCH3nm
 f7A7xN0/M0agXnSxOKo0VHrooj3FfT2io85cnLFdNedNnbu2Lzu4+WT6imJrJ38YK14G0cLNrh+I7
 AYTKMAeN9jzhv+rzPQVvXo2nIqWpq7aSnk2JjjeuF9ft0zl6mzVVpTxNOeEW1QsNxxEhFDBq/g1To
 CvsU8yOVNaq6kBgK44OggFN4YgGx/WNIwlN4xtbs63Q9JorX1TbZrSmYPk6WVbrQU/3Bqd9IM/GGh
 cfXYfb0rKgC3Bjz8fNMfelL3gMSHiclGfQJ8UPHc2wZCYDohws7US5xRnrW/d8vU9uqWDxXxd9+6s
 hiVGqN7g==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Yl-000wkK-F2; Sat, 19 Jul 2025 15:25:03 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 19 Jul 2025 10:24:42 -0300
Subject: [PATCH 3/6] drm/v3d: Replace a global spinlock with a per-queue
 spinlock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-v3d-queue-lock-v1-3-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6434; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=D7qWeldmdQecW4BzI5UGfnsb6TtN+bxB+Jhn6fj1zqo=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDBnVcxbuZm6ParnzRotPRyY1I/zNsldC6h2y1w6ULdn0p
 fM7378jnYzGLAyMHAyyYoosP57E1jKKlbNrLiu/CDOIlQlkCgMXpwBMJNCF/X+K40FvoaS9fw7E
 V77139+7tDgwTazRLdAnrPbsy6dazn8VblSnfM90yJh2PP5/TdDziMo+86n8b2OXrJNkT2+2kX0
 hL6Juo9HM9PT2k5Se1uN3++NlZm/4pbHwn0rhghCvxCjT2fZXbwbeLXN8Z76QZa1tzOwXplESxy
 XmffvoaM36WpD/3ru5nm8MKlKm85x5+fR47vs/grZqNaUNFpNdls/yshU6bhLwn7eA90px0HItf
 tW9mTvfLIt84vvYKlw0T8a4Tr3GZHH3d+dff58tvfdhS0K0IrveMx+tB5wL9rwLUrYU3Vr+ZtvU
 WjPdzHNHXRMrwut8ovY9164+6ShaePtCO+fR3if3613tAA==
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
---
 drivers/gpu/drm/v3d/v3d_drv.h   |  8 ++------
 drivers/gpu/drm/v3d/v3d_fence.c | 11 ++++++-----
 drivers/gpu/drm/v3d/v3d_gem.c   |  3 ++-
 drivers/gpu/drm/v3d/v3d_irq.c   |  6 +++---
 drivers/gpu/drm/v3d/v3d_sched.c | 13 +++++++------
 5 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index b5d7e58c3696a04b1824ecfe31e1962901746856..fb1a3d010fd5a61099f413629e9bfeeed3c45c59 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -61,6 +61,7 @@ struct v3d_queue_state {
 
 	/* Currently active job for this queue */
 	struct v3d_job *active_job;
+	spinlock_t queue_lock;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
@@ -156,11 +157,6 @@ struct v3d_dev {
 
 	struct v3d_queue_state queue[V3D_MAX_QUEUES];
 
-	/* Spinlock used to synchronize the overflow memory
-	 * management against bin job submission.
-	 */
-	spinlock_t job_lock;
-
 	/* Used to track the active perfmon if any. */
 	struct v3d_perfmon *active_perfmon;
 
@@ -560,7 +556,7 @@ void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
 
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
index 7e0409a154497ecf500c4260e6aff0589b5932a1..c1593b5b2729eb6333197ef6a332b52ea567d474 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -269,10 +269,11 @@ v3d_gem_init(struct drm_device *dev)
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
index e96c7fd65a147177993bbc45d573453974ac2e39..74c84e0bd1bb5aa01c8c8e0e24310dac872fc85c 100644
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
index 4fbcd662b4c4e69d5680d77171ed85fb869959bd..85f6fdb470ae0270c0b4d421fb5e214a13c2e03a 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -222,27 +222,28 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
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
-	v3d->queue[V3D_BIN].active_job = to_v3d_job(sched_job);
+	spin_lock_irqsave(&queue->queue_lock, irqflags);
+	queue->active_job = to_v3d_job(sched_job);
 	/* Clear out the overflow allocation, so we don't
 	 * reuse the overflow attached to a previous job.
 	 */
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, 0);
-	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
+	spin_unlock_irqrestore(&queue->queue_lock, irqflags);
 
 	v3d_invalidate_caches(v3d);
 

-- 
2.50.0

