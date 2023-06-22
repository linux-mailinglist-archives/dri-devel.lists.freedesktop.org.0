Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E440739D9A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB810E511;
	Thu, 22 Jun 2023 09:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9810E511
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B039660707C;
 Thu, 22 Jun 2023 10:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687426958;
 bh=SEBhGbpLj3m18d4zLgKgB6+u4T3oVPSUN3hXFMUMa+U=;
 h=From:To:Cc:Subject:Date:From;
 b=fKgZtFq5R3B2HJYxwTI/3bDRt+S/Nf6iru7Nme4tFqZsbhel2YW53Xgl3owUGQ+zo
 UlD9vS7/eozYkpSp1Tdi8E94tNekguxeR3818kIloCuwGBKa21+QOrULVZlonJCrPO
 NP9i5QDObFn7JPeJ2RE1IionJ8vdqr460BIeDFK6IWGAnr/co52Hx5AIAEed1uEhAW
 aLqI4bQ+1hnRE3j0Ti9FqKrrFqtSc12oSefa/SkkKaYAGsZx0Jn2oyAb8Yn8i8yBc0
 6do1w2HtkazLKv1ZrIiWzTYg8DEp46zbMB23XY+Uyx2WnpYGQGRONKJBb5SKjoO6ws
 0ftfcmuNIUbZA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
Date: Thu, 22 Jun 2023 11:42:34 +0200
Message-ID: <20230622094234.274000-1-boris.brezillon@collabora.com>
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

v2:
* Fix commit message

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Sarah Walker <sarah.walker@imgtec.com>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 40 +++++++++++++++----------
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +-
 include/drm/gpu_scheduler.h             |  5 ++--
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index ef120475e7c6..06cedfe4b486 100644
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
 
@@ -181,20 +205,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
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
index 7b2bfc10c1a5..506371c42745 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1043,10 +1043,9 @@ static int drm_sched_main(void *param)
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
index e95b4837e5a3..f9544d9b670d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -583,15 +583,14 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
 
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
 void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
 
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
-- 
2.41.0

