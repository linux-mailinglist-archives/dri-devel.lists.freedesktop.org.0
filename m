Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E9336EC6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268D76EB58;
	Thu, 11 Mar 2021 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B16EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E4C01F4600A;
 Thu, 11 Mar 2021 09:25:45 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 2/7] drm/panfrost: Collect implicit and explicit deps in
 an XArray
Date: Thu, 11 Mar 2021 10:25:34 +0100
Message-Id: <20210311092539.2405596-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311092539.2405596-1-boris.brezillon@collabora.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way we can re-use the standard drm_gem_fence_array_add_implicit()
helper and simplify the panfrost_job_dependency() logic.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 42 +++++++-----------
 drivers/gpu/drm/panfrost/panfrost_job.c | 57 +++++++++++--------------
 drivers/gpu/drm/panfrost/panfrost_job.h |  7 +--
 3 files changed, 42 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 83a461bdeea8..86c1347c6f0e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -137,12 +137,6 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
-	job->implicit_fences = kvmalloc_array(job->bo_count,
-				  sizeof(struct dma_fence *),
-				  GFP_KERNEL | __GFP_ZERO);
-	if (!job->implicit_fences)
-		return -ENOMEM;
-
 	ret = drm_gem_objects_lookup(file_priv,
 				     (void __user *)(uintptr_t)args->bo_handles,
 				     job->bo_count, &job->bos);
@@ -173,8 +167,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 }
 
 /**
- * panfrost_copy_in_sync() - Sets up job->in_fences[] with the sync objects
- * referenced by the job.
+ * panfrost_copy_in_sync() - Add in_syncs to the job->deps array.
  * @dev: DRM device
  * @file_priv: DRM file for this fd
  * @args: IOCTL args
@@ -187,28 +180,18 @@ panfrost_lookup_bos(struct drm_device *dev,
  */
 static int
 panfrost_copy_in_sync(struct drm_device *dev,
-		  struct drm_file *file_priv,
-		  struct drm_panfrost_submit *args,
-		  struct panfrost_job *job)
+		      struct drm_file *file_priv,
+		      struct drm_panfrost_submit *args,
+		      struct panfrost_job *job)
 {
 	u32 *handles;
 	int ret = 0;
 	int i;
 
-	job->in_fence_count = args->in_sync_count;
-
-	if (!job->in_fence_count)
+	if (!args->in_sync_count)
 		return 0;
 
-	job->in_fences = kvmalloc_array(job->in_fence_count,
-					sizeof(struct dma_fence *),
-					GFP_KERNEL | __GFP_ZERO);
-	if (!job->in_fences) {
-		DRM_DEBUG("Failed to allocate job in fences\n");
-		return -ENOMEM;
-	}
-
-	handles = kvmalloc_array(job->in_fence_count, sizeof(u32), GFP_KERNEL);
+	handles = kvmalloc_array(args->in_sync_count, sizeof(u32), GFP_KERNEL);
 	if (!handles) {
 		ret = -ENOMEM;
 		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
@@ -217,17 +200,23 @@ panfrost_copy_in_sync(struct drm_device *dev,
 
 	if (copy_from_user(handles,
 			   (void __user *)(uintptr_t)args->in_syncs,
-			   job->in_fence_count * sizeof(u32))) {
+			   args->in_sync_count * sizeof(u32))) {
 		ret = -EFAULT;
 		DRM_DEBUG("Failed to copy in syncobj handles\n");
 		goto fail;
 	}
 
-	for (i = 0; i < job->in_fence_count; i++) {
+	for (i = 0; i < args->in_sync_count; i++) {
+		struct dma_fence *fence;
+
 		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
-					     &job->in_fences[i]);
+					     &fence);
 		if (ret == -EINVAL)
 			goto fail;
+
+		ret = drm_gem_fence_array_add(&job->deps, fence);
+		if (ret)
+			goto fail;
 	}
 
 fail:
@@ -269,6 +258,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->file_priv = file->driver_priv;
+	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
 
 	ret = panfrost_copy_in_sync(dev, file, args, job);
 	if (ret)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 564054a96ca9..87bfbd77d753 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -196,20 +196,31 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 }
 
-static void panfrost_acquire_object_fences(struct panfrost_job *job)
+static int panfrost_acquire_object_fences(struct panfrost_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->bo_count; i++)
-		job->implicit_fences[i] = dma_resv_get_excl_rcu(job->bos[i]->resv);
+	for (i = 0; i < job->bo_count; i++) {
+		int ret;
+
+		ret = drm_gem_fence_array_add_implicit(&job->deps,
+						       job->bos[i], true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void panfrost_attach_object_fences(struct panfrost_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->bo_count; i++)
-		dma_resv_add_excl_fence(job->bos[i]->resv, job->render_done_fence);
+	for (i = 0; i < job->bo_count; i++) {
+		struct dma_resv *robj = job->bos[i]->resv;
+
+		dma_resv_add_excl_fence(robj, job->render_done_fence);
+	}
 }
 
 int panfrost_job_push(struct panfrost_job *job)
@@ -257,18 +268,15 @@ static void panfrost_job_cleanup(struct kref *ref)
 {
 	struct panfrost_job *job = container_of(ref, struct panfrost_job,
 						refcount);
+	struct dma_fence *fence;
+	unsigned long dep_idx;
 	unsigned int i;
 
-	if (job->in_fences) {
-		for (i = 0; i < job->in_fence_count; i++)
-			dma_fence_put(job->in_fences[i]);
-		kvfree(job->in_fences);
-	}
-	if (job->implicit_fences) {
-		for (i = 0; i < job->bo_count; i++)
-			dma_fence_put(job->implicit_fences[i]);
-		kvfree(job->implicit_fences);
+	xa_for_each(&job->deps, dep_idx, fence) {
+		dma_fence_put(fence);
 	}
+	xa_destroy(&job->deps);
+
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->render_done_fence);
 
@@ -311,26 +319,9 @@ static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job
 						 struct drm_sched_entity *s_entity)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
-	struct dma_fence *fence;
-	unsigned int i;
 
-	/* Explicit fences */
-	for (i = 0; i < job->in_fence_count; i++) {
-		if (job->in_fences[i]) {
-			fence = job->in_fences[i];
-			job->in_fences[i] = NULL;
-			return fence;
-		}
-	}
-
-	/* Implicit fences, max. one per BO */
-	for (i = 0; i < job->bo_count; i++) {
-		if (job->implicit_fences[i]) {
-			fence = job->implicit_fences[i];
-			job->implicit_fences[i] = NULL;
-			return fence;
-		}
-	}
+	if (!xa_empty(&job->deps))
+		return xa_erase(&job->deps, job->last_dep++);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index bbd3ba97ff67..b10b5be57dd2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -19,9 +19,8 @@ struct panfrost_job {
 	struct panfrost_device *pfdev;
 	struct panfrost_file_priv *file_priv;
 
-	/* Optional fences userspace can pass in for the job to depend on. */
-	struct dma_fence **in_fences;
-	u32 in_fence_count;
+	struct xarray deps;
+	unsigned long last_dep;
 
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
@@ -30,8 +29,6 @@ struct panfrost_job {
 	__u32 requirements;
 	__u32 flush_id;
 
-	/* Exclusive fences we have taken from the BOs to wait for */
-	struct dma_fence **implicit_fences;
 	struct panfrost_gem_mapping **mappings;
 	struct drm_gem_object **bos;
 	u32 bo_count;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
