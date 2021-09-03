Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7B3FFF89
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477B6E87D;
	Fri,  3 Sep 2021 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E616E87D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:06:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C9371F44BC4;
 Fri,  3 Sep 2021 13:05:59 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] drm/sched: Fix drm_sched_fence_free() so it can be passed an
 uninitialized fence
Date: Fri,  3 Sep 2021 14:05:54 +0200
Message-Id: <20210903120554.444101-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

drm_sched_job_cleanup() will pass an uninitialized fence to
drm_sched_fence_free(), which will cause to_drm_sched_fence() to return
a NULL fence object, causing a NULL pointer deref when this NULL object
is passed to kmem_cache_free().

Let's create a new drm_sched_fence_free() function that takes a
drm_sched_fence pointer and suffix the old function with _rcu. While at
it, complain if drm_sched_fence_free() is passed an initialized fence
or if drm_sched_fence_free_rcu() is passed an uninitialized fence.

Fixes: dbe48d030b28 ("drm/sched: Split drm_sched_job_init")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Found while debugging another issue in panfrost causing a failure in
the submit ioctl and exercising the error path (path that calls
drm_sched_job_cleanup() on an unarmed job).
---
 drivers/gpu/drm/scheduler/sched_fence.c | 29 ++++++++++++++++---------
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/gpu_scheduler.h             |  2 +-
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index db3fd1303fc4..7fd869520ef2 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -69,19 +69,28 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 	return (const char *)fence->sched->name;
 }
 
-/**
- * drm_sched_fence_free - free up the fence memory
- *
- * @rcu: RCU callback head
- *
- * Free up the fence memory after the RCU grace period.
- */
-void drm_sched_fence_free(struct rcu_head *rcu)
+static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
 {
 	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
 
-	kmem_cache_free(sched_fence_slab, fence);
+	if (!WARN_ON_ONCE(!fence))
+		kmem_cache_free(sched_fence_slab, fence);
+}
+
+/**
+ * drm_sched_fence_free - free up an uninitialized fence
+ *
+ * @fence: fence to free
+ *
+ * Free up the fence memory. Should only be used if drm_sched_fence_init()
+ * has not been called yet.
+ */
+void drm_sched_fence_free(struct drm_sched_fence *fence)
+{
+	/* This function should not be called if the fence has been initialized. */
+	if (!WARN_ON_ONCE(fence->sched))
+		kmem_cache_free(sched_fence_slab, fence);
 }
 
 /**
@@ -97,7 +106,7 @@ static void drm_sched_fence_release_scheduled(struct dma_fence *f)
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
 
 	dma_fence_put(fence->parent);
-	call_rcu(&fence->finished.rcu, drm_sched_fence_free);
+	call_rcu(&fence->finished.rcu, drm_sched_fence_free_rcu);
 }
 
 /**
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fbbd3b03902f..6987d412a946 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -750,7 +750,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 		dma_fence_put(&job->s_fence->finished);
 	} else {
 		/* aborted job before committing to run it */
-		drm_sched_fence_free(&job->s_fence->finished.rcu);
+		drm_sched_fence_free(job->s_fence);
 	}
 
 	job->s_fence = NULL;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7f77a455722c..f011e4c407f2 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -509,7 +509,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
-void drm_sched_fence_free(struct rcu_head *rcu);
+void drm_sched_fence_free(struct drm_sched_fence *fence);
 
 void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
 void drm_sched_fence_finished(struct drm_sched_fence *fence);
-- 
2.31.1

