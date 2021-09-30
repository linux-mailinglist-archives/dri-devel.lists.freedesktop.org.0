Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16441E211
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E406EC53;
	Thu, 30 Sep 2021 19:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46606EC4F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:10:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4BB3A1F451E7;
 Thu, 30 Sep 2021 20:10:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 5/8] drm/panfrost: Add a new ioctl to submit batches
Date: Thu, 30 Sep 2021 21:09:51 +0200
Message-Id: <20210930190954.1525933-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930190954.1525933-1-boris.brezillon@collabora.com>
References: <20210930190954.1525933-1-boris.brezillon@collabora.com>
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

This should help limit the number of ioctls when submitting multiple
jobs. The new ioctl also supports syncobj timelines and BO access flags.

v5:
* Fix typos
* Add BUILD_BUG_ON() checks to make sure SUBMIT_BATCH_VERSION and
  descriptor sizes are synced
* Simplify error handling in panfrost_ioctl_batch_submit()
* Don't disable implicit fences on exclusive references

v4:
* Implement panfrost_ioctl_submit() as a wrapper around
  panfrost_submit_job()
* Replace stride fields by a version field which is mapped to
  a <job_stride,bo_ref_stride,syncobj_ref_stride> tuple internally

v3:
* Re-use panfrost_get_job_bos() and panfrost_get_job_in_syncs() in the
  old submit path

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 584 ++++++++++++++++--------
 drivers/gpu/drm/panfrost/panfrost_job.c |   4 +-
 include/uapi/drm/panfrost_drm.h         |  92 ++++
 3 files changed, 492 insertions(+), 188 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f8f430f68090..30dc158d56e6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -147,193 +147,6 @@ panfrost_get_job_mappings(struct drm_file *file_priv, struct panfrost_job *job)
 	return 0;
 }
 
-/**
- * panfrost_lookup_bos() - Sets up job->bo[] with the GEM objects
- * referenced by the job.
- * @dev: DRM device
- * @file_priv: DRM file for this fd
- * @args: IOCTL args
- * @job: job being set up
- *
- * Resolve handles from userspace to BOs and attach them to job.
- *
- * Note that this function doesn't need to unreference the BOs on
- * failure, because that will happen at panfrost_job_cleanup() time.
- */
-static int
-panfrost_lookup_bos(struct drm_device *dev,
-		  struct drm_file *file_priv,
-		  struct drm_panfrost_submit *args,
-		  struct panfrost_job *job)
-{
-	unsigned int i;
-	int ret;
-
-	job->bo_count = args->bo_handle_count;
-
-	if (!job->bo_count)
-		return 0;
-
-	job->bo_flags = kvmalloc_array(job->bo_count,
-				       sizeof(*job->bo_flags),
-				       GFP_KERNEL | __GFP_ZERO);
-	if (!job->bo_flags)
-		return -ENOMEM;
-
-	for (i = 0; i < job->bo_count; i++)
-		job->bo_flags[i] = PANFROST_BO_REF_EXCLUSIVE;
-
-	ret = drm_gem_objects_lookup(file_priv,
-				     (void __user *)(uintptr_t)args->bo_handles,
-				     job->bo_count, &job->bos);
-	if (ret)
-		return ret;
-
-	return panfrost_get_job_mappings(file_priv, job);
-}
-
-/**
- * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
- * referenced by the job.
- * @dev: DRM device
- * @file_priv: DRM file for this fd
- * @args: IOCTL args
- * @job: job being set up
- *
- * Resolve syncobjs from userspace to fences and attach them to job.
- *
- * Note that this function doesn't need to unreference the fences on
- * failure, because that will happen at panfrost_job_cleanup() time.
- */
-static int
-panfrost_copy_in_sync(struct drm_device *dev,
-		  struct drm_file *file_priv,
-		  struct drm_panfrost_submit *args,
-		  struct panfrost_job *job)
-{
-	u32 *handles;
-	int ret = 0;
-	int i, in_fence_count;
-
-	in_fence_count = args->in_sync_count;
-
-	if (!in_fence_count)
-		return 0;
-
-	handles = kvmalloc_array(in_fence_count, sizeof(u32), GFP_KERNEL);
-	if (!handles) {
-		ret = -ENOMEM;
-		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
-		goto fail;
-	}
-
-	if (copy_from_user(handles,
-			   (void __user *)(uintptr_t)args->in_syncs,
-			   in_fence_count * sizeof(u32))) {
-		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in syncobj handles\n");
-		goto fail;
-	}
-
-	for (i = 0; i < in_fence_count; i++) {
-		struct dma_fence *fence;
-
-		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
-					     &fence);
-		if (ret)
-			goto fail;
-
-		ret = drm_sched_job_add_dependency(&job->base, fence);
-
-		if (ret)
-			goto fail;
-	}
-
-fail:
-	kvfree(handles);
-	return ret;
-}
-
-static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct panfrost_device *pfdev = dev->dev_private;
-	struct drm_panfrost_submit *args = data;
-	struct drm_syncobj *sync_out = NULL;
-	struct panfrost_submitqueue *queue;
-	struct panfrost_job *job;
-	int ret = 0, slot;
-
-	if (!args->jc)
-		return -EINVAL;
-
-	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
-		return -EINVAL;
-
-	queue = panfrost_submitqueue_get(file->driver_priv, 0);
-	if (IS_ERR(queue))
-		return PTR_ERR(queue);
-
-	if (args->out_sync > 0) {
-		sync_out = drm_syncobj_find(file, args->out_sync);
-		if (!sync_out) {
-			ret = -ENODEV;
-			goto fail_put_queue;
-		}
-	}
-
-	job = kzalloc(sizeof(*job), GFP_KERNEL);
-	if (!job) {
-		ret = -ENOMEM;
-		goto out_put_syncout;
-	}
-
-	kref_init(&job->refcount);
-
-	job->pfdev = pfdev;
-	job->jc = args->jc;
-	job->requirements = args->requirements;
-	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
-	job->file_priv = file->driver_priv;
-
-	slot = panfrost_job_get_slot(job);
-
-	ret = drm_sched_job_init(&job->base,
-				 &queue->sched_entity[slot],
-				 NULL);
-	if (ret)
-		goto out_put_job;
-
-	ret = panfrost_copy_in_sync(dev, file, args, job);
-	if (ret)
-		goto out_cleanup_job;
-
-	ret = panfrost_lookup_bos(dev, file, args, job);
-	if (ret)
-		goto out_cleanup_job;
-
-	ret = panfrost_job_push(queue, job);
-	if (ret)
-		goto out_cleanup_job;
-
-	/* Update the return sync object for the job */
-	if (sync_out)
-		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
-
-out_cleanup_job:
-	if (ret)
-		drm_sched_job_cleanup(&job->base);
-out_put_job:
-	panfrost_job_put(job);
-out_put_syncout:
-	if (sync_out)
-		drm_syncobj_put(sync_out);
-fail_put_queue:
-	panfrost_submitqueue_put(queue);
-
-	return ret;
-}
-
 static int
 panfrost_ioctl_wait_bo(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv)
@@ -509,6 +322,402 @@ panfrost_ioctl_destroy_submitqueue(struct drm_device *dev, void *data,
 	return panfrost_submitqueue_destroy(priv, id);
 }
 
+#define PANFROST_BO_REF_ALLOWED_FLAGS \
+	(PANFROST_BO_REF_EXCLUSIVE | PANFROST_BO_REF_NO_IMPLICIT_DEP)
+
+static int
+panfrost_get_job_bos(struct drm_file *file_priv,
+		     u64 refs, u32 ref_stride, u32 count,
+		     struct panfrost_job *job)
+{
+	void __user *in = u64_to_user_ptr(refs);
+	unsigned int i;
+
+	job->bo_count = count;
+
+	if (!count)
+		return 0;
+
+	job->bos = kvmalloc_array(job->bo_count, sizeof(*job->bos),
+				  GFP_KERNEL | __GFP_ZERO);
+	job->bo_flags = kvmalloc_array(job->bo_count,
+				       sizeof(*job->bo_flags),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!job->bos || !job->bo_flags)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		struct drm_panfrost_bo_ref ref = { };
+		int ret;
+
+		ret = copy_struct_from_user(&ref, sizeof(ref),
+					    in + (i * ref_stride),
+					    ref_stride);
+		if (ret)
+			return ret;
+
+		/* Prior to the BATCH_SUBMIT ioctl all accessed BOs were
+		 * treated as exclusive.
+		 */
+		if (ref_stride == sizeof(u32))
+			ref.flags = PANFROST_BO_REF_EXCLUSIVE;
+
+		if ((ref.flags & ~PANFROST_BO_REF_ALLOWED_FLAGS))
+			return -EINVAL;
+
+		job->bos[i] = drm_gem_object_lookup(file_priv, ref.handle);
+		if (!job->bos[i])
+			return -EINVAL;
+
+		job->bo_flags[i] = ref.flags;
+	}
+
+	return 0;
+}
+
+static int
+panfrost_get_job_in_syncs(struct drm_file *file_priv,
+			  u64 refs, u32 ref_stride,
+			  u32 count, struct panfrost_job *job)
+{
+	const void __user *in = u64_to_user_ptr(refs);
+	unsigned int i;
+	int ret;
+
+	if (!count)
+		return 0;
+
+	for (i = 0; i < count; i++) {
+		struct drm_panfrost_syncobj_ref ref = { };
+		struct dma_fence *fence;
+
+		ret = copy_struct_from_user(&ref, sizeof(ref),
+					    in + (i * ref_stride),
+					    ref_stride);
+		if (ret)
+			return ret;
+
+		if (ref.pad)
+			return -EINVAL;
+
+		ret = drm_syncobj_find_fence(file_priv, ref.handle, ref.point,
+					     0, &fence);
+		if (ret)
+			return ret;
+
+		ret = drm_sched_job_add_dependency(&job->base, fence);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct panfrost_job_out_sync {
+	struct drm_syncobj *syncobj;
+	struct dma_fence_chain *chain;
+	u64 point;
+};
+
+static void
+panfrost_put_job_out_syncs(struct panfrost_job_out_sync *out_syncs, u32 count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++) {
+		if (!out_syncs[i].syncobj)
+			break;
+
+		drm_syncobj_put(out_syncs[i].syncobj);
+		kvfree(out_syncs[i].chain);
+	}
+
+	kvfree(out_syncs);
+}
+
+static struct panfrost_job_out_sync *
+panfrost_get_job_out_syncs(struct drm_file *file_priv,
+			   u64 refs, u32 ref_stride,
+			   u32 count)
+{
+	void __user *in = u64_to_user_ptr(refs);
+	struct panfrost_job_out_sync *out_syncs;
+	unsigned int i;
+	int ret;
+
+	if (!count)
+		return NULL;
+
+	/* If the syncobj ref_stride == sizeof(u32) we are called from the
+	 * old submit ioctl() which only accepted one out syncobj. In that
+	 * case the syncobj handle is passed directly through the
+	 * ->out_syncs field, so let's make sure the refs fits in a u32.
+	 */
+	if (ref_stride == sizeof(u32) &&
+	    (count != 1 || refs > UINT_MAX))
+		return ERR_PTR(-EINVAL);
+
+	out_syncs = kvmalloc_array(count, sizeof(*out_syncs),
+				   GFP_KERNEL | __GFP_ZERO);
+	if (!out_syncs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < count; i++) {
+		struct drm_panfrost_syncobj_ref ref = { };
+
+		if (ref_stride == sizeof(u32)) {
+			/* Special case for the old submit wrapper: in that
+			 * case there's only one out_sync, and the syncobj
+			 * handle is passed directly in the out_syncs field.
+			 */
+			ref.handle = refs;
+		} else {
+			ret = copy_struct_from_user(&ref, sizeof(ref),
+						    in + (i * ref_stride),
+						    ref_stride);
+			if (ret)
+				goto err_free_out_syncs;
+		}
+
+		if (ref.pad) {
+			ret = -EINVAL;
+			goto err_free_out_syncs;
+		}
+
+		out_syncs[i].syncobj = drm_syncobj_find(file_priv, ref.handle);
+		if (!out_syncs[i].syncobj) {
+			ret = -ENODEV;
+			goto err_free_out_syncs;
+		}
+
+		out_syncs[i].point = ref.point;
+		if (!out_syncs[i].point)
+			continue;
+
+		out_syncs[i].chain = kmalloc(sizeof(*out_syncs[i].chain),
+					     GFP_KERNEL);
+		if (!out_syncs[i].chain) {
+			ret = -ENOMEM;
+			goto err_free_out_syncs;
+		}
+	}
+
+	return out_syncs;
+
+err_free_out_syncs:
+	panfrost_put_job_out_syncs(out_syncs, count);
+	return ERR_PTR(ret);
+}
+
+static void
+panfrost_set_job_out_fence(struct panfrost_job_out_sync *out_syncs,
+			   unsigned int count, struct dma_fence *fence)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++) {
+		if (out_syncs[i].chain) {
+			drm_syncobj_add_point(out_syncs[i].syncobj,
+					      out_syncs[i].chain,
+					      fence, out_syncs[i].point);
+			out_syncs[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(out_syncs[i].syncobj,
+						  fence);
+		}
+	}
+}
+
+struct panfrost_submit_ioctl_version_info {
+	u32 job_stride;
+	u32 bo_ref_stride;
+	u32 syncobj_ref_stride;
+};
+
+static const struct panfrost_submit_ioctl_version_info submit_versions[] = {
+	/* SUBMIT */
+	[0] = { 0, 4, 4 },
+
+	/* BATCH_SUBMIT v1 */
+	[1] = { 48, 8, 16 },
+};
+
+#define PANFROST_JD_ALLOWED_REQS PANFROST_JD_REQ_FS
+
+static int
+panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
+		    struct panfrost_submitqueue *queue,
+		    const struct drm_panfrost_job *args,
+		    u32 version)
+{
+	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_job_out_sync *out_syncs;
+	u32 bo_stride, syncobj_stride;
+	struct panfrost_job *job;
+	int ret, slot;
+
+	if (args->requirements & ~PANFROST_JD_ALLOWED_REQS)
+		return -EINVAL;
+
+	if (!args->head)
+		return -EINVAL;
+
+	bo_stride = submit_versions[version].bo_ref_stride;
+	syncobj_stride = submit_versions[version].syncobj_ref_stride;
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	kref_init(&job->refcount);
+
+	job->pfdev = pfdev;
+	job->jc = args->head;
+	job->requirements = args->requirements;
+	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
+	job->file_priv = file_priv->driver_priv;
+
+	slot = panfrost_job_get_slot(job);
+
+	ret = drm_sched_job_init(&job->base,
+				 &queue->sched_entity[slot],
+				 NULL);
+	if (ret)
+		goto out_put_job;
+
+	ret = panfrost_get_job_in_syncs(file_priv,
+					args->in_syncs,
+					syncobj_stride,
+					args->in_sync_count,
+					job);
+	if (ret)
+		goto out_cleanup_job;
+
+	out_syncs = panfrost_get_job_out_syncs(file_priv,
+					       args->out_syncs,
+					       syncobj_stride,
+					       args->out_sync_count);
+	if (IS_ERR(out_syncs)) {
+		ret = PTR_ERR(out_syncs);
+		goto out_cleanup_job;
+	}
+
+	ret = panfrost_get_job_bos(file_priv, args->bos, bo_stride,
+				   args->bo_count, job);
+	if (ret)
+		goto out_put_outsyncs;
+
+	ret = panfrost_get_job_mappings(file_priv, job);
+	if (ret)
+		goto out_put_outsyncs;
+
+	ret = panfrost_job_push(queue, job);
+	if (ret)
+		goto out_put_outsyncs;
+
+	panfrost_set_job_out_fence(out_syncs, args->out_sync_count,
+				   job->render_done_fence);
+
+out_put_outsyncs:
+	panfrost_put_job_out_syncs(out_syncs, args->out_sync_count);
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&job->base);
+out_put_job:
+	panfrost_job_put(job);
+	return ret;
+}
+
+static int
+panfrost_ioctl_submit(struct drm_device *dev, void *data,
+		      struct drm_file *file)
+{
+	struct drm_panfrost_submit *args = data;
+	struct drm_panfrost_job job_args = {
+		.head = args->jc,
+		.bos = args->bo_handles,
+		.in_syncs = args->in_syncs,
+
+		/* We are abusing .out_syncs and passing the handle directly
+		 * instead of a pointer to a user u32 array, but
+		 * panfrost_job_submit() knows about it, so it's fine.
+		 */
+		.out_syncs = args->out_sync,
+		.in_sync_count = args->in_sync_count,
+		.out_sync_count = args->out_sync > 0 ? 1 : 0,
+		.bo_count = args->bo_handle_count,
+		.requirements = args->requirements
+	};
+	struct panfrost_submitqueue *queue;
+	int ret;
+
+	queue = panfrost_submitqueue_get(file->driver_priv, 0);
+	if (IS_ERR(queue))
+		return PTR_ERR(queue);
+
+	ret = panfrost_submit_job(dev, file, queue, &job_args, 0);
+	panfrost_submitqueue_put(queue);
+
+	return ret;
+}
+
+static int
+panfrost_ioctl_batch_submit(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
+{
+	struct drm_panfrost_batch_submit *args = data;
+	void __user *jobs_args = u64_to_user_ptr(args->jobs);
+	struct panfrost_submitqueue *queue;
+	u32 version = args->version;
+	u32 job_stride;
+	unsigned int i;
+	int ret = 0;
+
+	/* Make sure the SUBMIT_BATCH_VERSION and desc sizes are synced */
+	BUILD_BUG_ON(sizeof(struct drm_panfrost_job) !=
+		     submit_versions[PANFROST_SUBMIT_BATCH_VERSION].job_stride);
+	BUILD_BUG_ON(sizeof(struct drm_panfrost_bo_ref) !=
+		     submit_versions[PANFROST_SUBMIT_BATCH_VERSION].bo_ref_stride);
+	BUILD_BUG_ON(sizeof(struct drm_panfrost_syncobj_ref) !=
+		     submit_versions[PANFROST_SUBMIT_BATCH_VERSION].syncobj_ref_stride);
+
+	/* Version 0 doesn't exists (it's reserved for the SUBMIT ioctl) */
+	if (!version)
+		return -EINVAL;
+
+	/* If the version specified is bigger than what we currently support,
+	 * pick the last supported version and let copy_struct_from_user()
+	 * check that any extra job, bo_ref and syncobj_ref fields are zeroed.
+	 */
+	if (version >= ARRAY_SIZE(submit_versions))
+		version = ARRAY_SIZE(submit_versions) - 1;
+
+	queue = panfrost_submitqueue_get(file_priv->driver_priv, args->queue);
+	if (IS_ERR(queue))
+		return PTR_ERR(queue);
+
+	job_stride = submit_versions[version].job_stride;
+	for (i = 0; i < args->job_count; i++) {
+		struct drm_panfrost_job job_args = { };
+
+		ret = copy_struct_from_user(&job_args, sizeof(job_args),
+					    jobs_args + (i * job_stride),
+					    job_stride);
+		if (!ret) {
+			ret = panfrost_submit_job(dev, file_priv, queue,
+						  &job_args, version);
+		}
+
+		if (ret) {
+			args->fail_idx = i;
+			break;
+		}
+	}
+
+	panfrost_submitqueue_put(queue);
+	return ret;
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -590,6 +799,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(CREATE_SUBMITQUEUE, create_submitqueue, DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(DESTROY_SUBMITQUEUE, destroy_submitqueue, DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(BATCH_SUBMIT,	batch_submit,	DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 62e010307afc..0367cee8f6df 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -254,7 +254,9 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
 				return ret;
 		}
 
-		/* panfrost always uses write mode in its current uapi */
+		if ((job->bo_flags[i] & PANFROST_BO_REF_NO_IMPLICIT_DEP) && !exclusive)
+			continue;
+
 		ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bos[i],
 							      exclusive);
 		if (ret)
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 66e1c2f1ff4b..5e3f8a344f41 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -23,6 +23,7 @@ extern "C" {
 #define DRM_PANFROST_MADVISE			0x08
 #define DRM_PANFROST_CREATE_SUBMITQUEUE		0x09
 #define DRM_PANFROST_DESTROY_SUBMITQUEUE	0x0a
+#define DRM_PANFROST_BATCH_SUBMIT		0x0b
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -33,6 +34,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
 #define DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_CREATE_SUBMITQUEUE, struct drm_panfrost_create_submitqueue)
 #define DRM_IOCTL_PANFROST_DESTROY_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_DESTROY_SUBMITQUEUE, __u32)
+#define DRM_IOCTL_PANFROST_BATCH_SUBMIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_BATCH_SUBMIT, struct drm_panfrost_batch_submit)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -243,9 +245,99 @@ struct drm_panfrost_create_submitqueue {
 	__u32 id;	/* out, identifier */
 };
 
+/* Syncobj reference passed at job submission time to encode explicit
+ * input/output fences.
+ */
+struct drm_panfrost_syncobj_ref {
+	/** Syncobj handle */
+	__u32 handle;
+
+	/** Padding field, must be set to 0 */
+	__u32 pad;
+
+	/**
+	 * For timeline syncobjs, the point on the timeline the reference
+	 * points to. 0 for the last point.
+	 * Must be set to 0 for non-timeline syncobjs
+	 */
+	__u64 point;
+};
+
 /* Exclusive (AKA write) access to the BO */
 #define PANFROST_BO_REF_EXCLUSIVE	0x1
 
+/* Disable the implicit dependency on the BO fence */
+#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2
+
+/* Describes a BO referenced by a job and the type of access. */
+struct drm_panfrost_bo_ref {
+	/** A GEM handle */
+	__u32 handle;
+
+	/** A combination of PANFROST_BO_REF_x flags */
+	__u32 flags;
+};
+
+/* Describes a GPU job and the resources attached to it. */
+struct drm_panfrost_job {
+	/** GPU pointer to the head of the job chain. */
+	__u64 head;
+
+	/**
+	 * Array of drm_panfrost_bo_ref objects describing the BOs referenced
+	 * by this job.
+	 */
+	__u64 bos;
+
+	/**
+	 * Arrays of drm_panfrost_syncobj_ref objects describing the input
+	 * and output fences.
+	 */
+	__u64 in_syncs;
+	__u64 out_syncs;
+
+	/** Syncobj reference array sizes. */
+	__u32 in_sync_count;
+	__u32 out_sync_count;
+
+	/** BO reference array size. */
+	__u32 bo_count;
+
+	/** Combination of PANFROST_JD_REQ_* flags. */
+	__u32 requirements;
+};
+
+#define PANFROST_SUBMIT_BATCH_VERSION	1
+
+/* Used to submit multiple jobs in one call */
+struct drm_panfrost_batch_submit {
+	/**
+	 * Always set to PANFROST_SUBMIT_BATCH_VERSION. This is used to let the
+	 * kernel know about the size of the various structs passed to the
+	 * BATCH_SUBMIT ioctl.
+	 */
+	__u32 version;
+
+	/** Number of jobs to submit. */
+	__u32 job_count;
+
+	/* Pointer to a job array. */
+	__u64 jobs;
+
+	/**
+	 * ID of the queue to submit those jobs to. 0 is the default
+	 * submit queue and should always exists. If you need a dedicated
+	 * queue, create it with DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE.
+	 */
+	__u32 queue;
+
+	/**
+	 * If the submission fails, this encodes the index of the first job
+	 * that failed.
+	 */
+	__u32 fail_idx;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1

