Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC473B21F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364410E5E2;
	Fri, 23 Jun 2023 07:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1902E10E5E2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 07:52:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E2666606EF9;
 Fri, 23 Jun 2023 08:52:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687506728;
 bh=cDGRd+4jtcXmu+q1s9fGutkakwMoT1gzXSXTJDxh0wM=;
 h=From:To:Cc:Subject:Date:From;
 b=h9lEbWZIOljIWgbmL4Ui5YQYGbCJHq2dtAFoQ4+xL/DqhiaGekZ5XjLtjRnQwnZ0D
 5k47CZ4kjHsNJPcCn5fYPoXCvG5cuHQzG95vi2MEPN/mTmQcoZBQ1HnQ5CTYEkMKlP
 rzw8IPGPN0uvD5gmT3nTvSlaaSEXkcVGbTFipFjhS84osAdoZ5jzS2lwZ2G/Q/+MS8
 wUU4az0zQbDu+GxpiShptBVBcubxk/kB9aJyk2liMJsStvwBcnrCE9iOy5RUQ47r8J
 +eQkpXbQmHREsHMO9pEd6qisLkTFAmIiCyL7OFCSOH+dNB1noo1+jT4UwyGDwJ5dP5
 +p+mrB74E7a2w==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Date: Fri, 23 Jun 2023 09:52:04 +0200
Message-ID: <20230623075204.382350-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that can delegate waits to the firmware/GPU pass the scheduled
fence to drm_sched_job_add_dependency(), and issue wait commands to
the firmware/GPU at job submission time. For this to be possible, they
need all their 'native' dependencies to have a valid parent since this
is where the actual HW fence information are encoded.

In drm_sched_main(), we currently call drm_sched_fence_set_parent()
after drm_sched_fence_scheduled(), leaving a short period of time
during which the job depending on this fence can be submitted.

Since setting parent and signaling the fence are two things that are
kinda related (you can't have a parent if the job hasn't been scheduled),
it probably makes sense to pass the parent fence to
drm_sched_fence_scheduled() and let it call drm_sched_fence_set_parent()
before it signals the scheduled fence.

Here is a detailed description of the race we are fixing here:

Thread A				Thread B

- calls drm_sched_fence_scheduled()
- signals s_fence->scheduled which
  wakes up thread B

					- entity dep signaled, checking
					  the next dep
					- no more deps waiting
					- entity is picked for job
					  submission by drm_gpu_scheduler
					- run_job() is called
					- run_job() tries to
					  collect native fence info from
					  s_fence->parent, but it's
					  NULL =>
					  BOOM, we can't do our native
					  wait

- calls drm_sched_fence_set_parent()

v2:
* Fix commit message

v3:
* Add a detailed description of the race to the commit message
* Add Luben's R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Sarah Walker <sarah.walker@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 40 +++++++++++++++----------
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +-
 include/drm/gpu_scheduler.h             |  5 ++--
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index fe9c6468e440..b6e70ddb4ee5 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -48,8 +48,32 @@ static void __exit drm_sched_fence_slab_fini(void)
 	kmem_cache_destroy(sched_fence_slab);
 }
 
-void drm_sched_fence_scheduled(struct drm_sched_fence *fence)
+static void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				       struct dma_fence *fence)
 {
+	/*
+	 * smp_store_release() to ensure another thread racing us
+	 * in drm_sched_fence_set_deadline_finished() sees the
+	 * fence's parent set before test_bit()
+	 */
+	smp_store_release(&s_fence->parent, dma_fence_get(fence));
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT,
+		     &s_fence->finished.flags))
+		dma_fence_set_deadline(fence, s_fence->deadline);
+}
+
+void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
+			       struct dma_fence *parent)
+{
+	/* Set the parent before signaling the scheduled fence, such that,
+	 * any waiter expecting the parent to be filled after the job has
+	 * been scheduled (which is the case for drivers delegating waits
+	 * to some firmware) doesn't have to busy wait for parent to show
+	 * up.
+	 */
+	if (!IS_ERR_OR_NULL(parent))
+		drm_sched_fence_set_parent(fence, parent);
+
 	dma_fence_signal(&fence->scheduled);
 }
 
@@ -179,20 +203,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
-void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
-				struct dma_fence *fence)
-{
-	/*
-	 * smp_store_release() to ensure another thread racing us
-	 * in drm_sched_fence_set_deadline_finished() sees the
-	 * fence's parent set before test_bit()
-	 */
-	smp_store_release(&s_fence->parent, dma_fence_get(fence));
-	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT,
-		     &s_fence->finished.flags))
-		dma_fence_set_deadline(fence, s_fence->deadline);
-}
-
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 					      void *owner)
 {
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index aea5a90ff98b..eff0a7f42f69 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1040,10 +1040,9 @@ static int drm_sched_main(void *param)
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
 		complete_all(&entity->entity_idle);
-		drm_sched_fence_scheduled(s_fence);
+		drm_sched_fence_scheduled(s_fence, fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-			drm_sched_fence_set_parent(s_fence, fence);
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c0586d832260..b29e347b10a9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -582,15 +582,14 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
-void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
-				struct dma_fence *fence);
 struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
 
-void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
+void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
+			       struct dma_fence *parent);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
 
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
-- 
2.41.0

