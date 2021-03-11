Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CC336ECB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5AE6EB5D;
	Thu, 11 Mar 2021 09:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC8B6EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2AD5F1F4600E;
 Thu, 11 Mar 2021 09:25:46 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 5/7] drm/panfrost: Add a new ioctl to submit batches
Date: Thu, 11 Mar 2021 10:25:37 +0100
Message-Id: <20210311092539.2405596-6-boris.brezillon@collabora.com>
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

This should help limit the number of ioctls when submitting multiple
jobs. The new ioctl also supports syncobj timelines and BO access flags.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 303 ++++++++++++++++++++++++
 include/uapi/drm/panfrost_drm.h         |  79 ++++++
 2 files changed, 382 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index be45efee47a2..3f8addab8bab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -446,6 +446,308 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 	return ret;
 }
 
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
+		ret = drm_gem_fence_array_add(&job->deps, fence);
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
+	out_syncs = kvmalloc_array(count, sizeof(*out_syncs),
+				   GFP_KERNEL | __GFP_ZERO);
+	if (!out_syncs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < count; i++) {
+		struct drm_panfrost_syncobj_ref ref = { };
+
+		ret = copy_struct_from_user(&ref, sizeof(ref),
+					    in + (i * ref_stride),
+					    ref_stride);
+		if (ret)
+			goto err_free_out_syncs;
+
+		if (ref.pad) {
+			ret = -EINVAL;
+			goto err_free_out_syncs;
+		}
+
+		out_syncs[i].syncobj = drm_syncobj_find(file_priv, ref.handle);
+		if (!out_syncs[i].syncobj) {
+			ret = -EINVAL;
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
+#define PANFROST_BO_REF_ALLOWED_FLAGS PANFROST_BO_REF_RW
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
+		if ((ref.flags & ~PANFROST_BO_REF_ALLOWED_FLAGS))
+			return -EINVAL;
+
+		/* We need to know the access type. */
+		if (!(ref.flags & PANFROST_BO_REF_RW))
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
+#define PANFROST_JD_ALLOWED_REQS PANFROST_JD_REQ_FS
+
+static int
+panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
+		    const struct drm_panfrost_job *args,
+		    u32 bo_stride, u32 syncobj_stride)
+{
+	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_job_out_sync *out_syncs;
+	struct panfrost_job *job;
+	int ret;
+
+	if (!args->head)
+		return -EINVAL;
+
+	if (args->requirements & ~PANFROST_JD_ALLOWED_REQS)
+		return -EINVAL;
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
+	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
+
+	ret = panfrost_get_job_in_syncs(file_priv,
+					args->in_syncs,
+					syncobj_stride,
+					args->in_sync_count,
+					job);
+	if (ret)
+		goto err_put_job;
+
+	out_syncs = panfrost_get_job_out_syncs(file_priv,
+					       args->out_syncs,
+					       syncobj_stride,
+					       args->out_sync_count);
+	if (IS_ERR(out_syncs)) {
+		ret = PTR_ERR(out_syncs);
+		goto err_put_job;
+	}
+
+	ret = panfrost_get_job_bos(file_priv, args->bos, bo_stride,
+				   args->bo_count, job);
+	if (ret)
+		goto err_put_job;
+
+	ret = panfrost_get_job_mappings(file_priv, job);
+	if (ret)
+		goto err_put_job;
+
+	ret = panfrost_job_push(job);
+	if (ret) {
+		panfrost_put_job_out_syncs(out_syncs, args->out_sync_count);
+		goto err_put_job;
+	}
+
+	panfrost_set_job_out_fence(out_syncs, args->out_sync_count,
+				   job->render_done_fence);
+	panfrost_put_job_out_syncs(out_syncs, args->out_sync_count);
+	return 0;
+
+err_put_job:
+	panfrost_job_put(job);
+	return ret;
+}
+
+static int
+panfrost_ioctl_batch_submit(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
+{
+	struct drm_panfrost_batch_submit *args = data;
+	void __user *jobs_args = u64_to_user_ptr(args->jobs);
+	unsigned int i;
+	int ret;
+
+	if (args->pad)
+		return -EINVAL;
+
+	/* Relax this test if new fields are added to
+	 * drm_panfrost_{bo_ref,syncobj_ref,job}.
+	 */
+	if (args->job_stride < sizeof(struct drm_panfrost_job) ||
+	    args->bo_ref_stride < sizeof(struct drm_panfrost_bo_ref) ||
+	    args->syncobj_ref_stride < sizeof(struct drm_panfrost_syncobj_ref))
+		return -EINVAL;
+
+	for (i = 0; i < args->job_count; i++) {
+		struct drm_panfrost_job job_args = { };
+
+		ret = copy_struct_from_user(&job_args, sizeof(job_args),
+					    jobs_args + (i * args->job_stride),
+					    args->job_stride);
+		if (ret) {
+			args->fail_idx = i;
+			return ret;
+		}
+
+		ret = panfrost_submit_job(dev, file_priv, &job_args,
+					  args->bo_ref_stride,
+					  args->syncobj_ref_stride);
+		if (ret) {
+			args->fail_idx = i;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -544,6 +846,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(BATCH_SUBMIT,	batch_submit,	DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index eab96d7e0e0e..34a10dac7ade 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -21,6 +21,7 @@ extern "C" {
 #define DRM_PANFROST_PERFCNT_ENABLE		0x06
 #define DRM_PANFROST_PERFCNT_DUMP		0x07
 #define DRM_PANFROST_MADVISE			0x08
+#define DRM_PANFROST_BATCH_SUBMIT		0x09
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -29,6 +30,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_GET_PARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_PARAM, struct drm_panfrost_get_param)
 #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
 #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
+#define DRM_IOCTL_PANFROST_BATCH_SUBMIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_BATCH_SUBMIT, struct drm_panfrost_batch_submit)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -223,10 +225,87 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* Syncobj reference passed at job submission time to encode explicit
+ * input/output fences.
+ */
+struct drm_panfrost_syncobj_ref {
+	__u32 handle;
+	__u32 pad;
+	__u64 point;
+};
+
 #define PANFROST_BO_REF_READ		0x1
 #define PANFROST_BO_REF_WRITE		0x2
 #define PANFROST_BO_REF_RW		(PANFROST_BO_REF_READ | PANFROST_BO_REF_WRITE)
 
+/* Describes a BO referenced by a job and the type of access. */
+struct drm_panfrost_bo_ref {
+	__u32 handle;
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
+/* Used to submit multiple jobs in one call */
+struct drm_panfrost_batch_submit {
+	/**
+	 * Stride of the jobs array (needed to ease extension of the
+	 * BATCH_SUBMIT ioctl). Should be set to
+	 * sizeof(struct drm_panfrost_job).
+	 */
+	__u32 job_stride;
+
+	/** Number of jobs to submit. */
+	__u32 job_count;
+
+	/* Pointer to a job array. */
+	__u64 jobs;
+
+	/**
+	 * Stride of the BO and syncobj reference arrays (needed to ease
+	 * extension of the BATCH_SUBMIT ioctl). Should be set to
+	 * sizeof(struct drm_panfrost_bo_ref).
+	 */
+	__u32 bo_ref_stride;
+	__u32 syncobj_ref_stride;
+
+	/**
+	 * If the submission fails, this encodes the index of the job
+	 * failed.
+	 */
+	__u32 fail_idx;
+
+	/** Always 0. */
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
