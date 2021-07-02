Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58193BA2C8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 17:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD54E6E043;
	Fri,  2 Jul 2021 15:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B61D76E043
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 15:31:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BDCD6E;
 Fri,  2 Jul 2021 08:31:48 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F8713F5A1;
 Fri,  2 Jul 2021 08:31:47 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <e8f60552-5e7a-199e-7642-cdadf8c9a1a1@arm.com>
Date: Fri, 2 Jul 2021 16:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702143225.3347980-6-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 15:32, Boris Brezillon wrote:
> This should help limit the number of ioctls when submitting multiple
> jobs. The new ioctl also supports syncobj timelines and BO access flags.
> 
> v3:
> * Re-use panfrost_get_job_bos() and panfrost_get_job_in_syncs() in the
>   old submit path
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Better, but I was hoping we can mostly delete panfrost_ioctl_submit(),
leaving something along the lines of:

static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
		struct drm_file *file)
{
	struct panfrost_submitqueue *queue;
	struct drm_panfrost_submit *args = data;
	struct drm_panfrost_job submit_args = {
		.head = args->jc,
		.bos = args->bo_handles,
		.in_syncs = args->in_syncs,
		.out_syncs = &args->out_sync, // FIXME
		.in_sync_count = args->in_sync_count,
		.out_sync_count = args->out_sync > 0 ? 1 : 0,
		.bo_count = args->bo_handle_count,
		.requirements = args->requirements
	};
	int ret;

	queue = panfrost_submitqueue_get(file->driver_priv, 0);

	ret = panfrost_submit_job(dev, file, queue, &submit_args,
				  sizeof(u32), ...);

	return ret;
}

But obviously the out_sync part needs special handling as we can't just
pass a kernel pointer in like that ;)

I'd like the above the duplication of things like this:

> +	kref_init(&job->refcount);
> +
> +	job->pfdev = pfdev;
> +	job->jc = args->head;
> +	job->requirements = args->requirements;
> +	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
> +	job->file_priv = file_priv->driver_priv;
> +	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);

As otherwise someone is going to mess up in the future and this is going
to diverge between the two ioctls.

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 366 +++++++++++++++++++-----
>  drivers/gpu/drm/panfrost/panfrost_job.c |   3 +
>  include/uapi/drm/panfrost_drm.h         |  84 ++++++
>  3 files changed, 375 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 6529e5972b47..e2897de6e77d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -138,111 +138,95 @@ panfrost_get_job_mappings(struct drm_file *file_priv, struct panfrost_job *job)
>  	return 0;
>  }
>  
> -/**
> - * panfrost_lookup_bos() - Sets up job->bo[] with the GEM objects
> - * referenced by the job.
> - * @dev: DRM device
> - * @file_priv: DRM file for this fd
> - * @args: IOCTL args
> - * @job: job being set up
> - *
> - * Resolve handles from userspace to BOs and attach them to job.
> - *
> - * Note that this function doesn't need to unreference the BOs on
> - * failure, because that will happen at panfrost_job_cleanup() time.
> - */
> +#define PANFROST_BO_REF_ALLOWED_FLAGS \
> +	(PANFROST_BO_REF_EXCLUSIVE | PANFROST_BO_REF_NO_IMPLICIT_DEP)
> +
>  static int
> -panfrost_lookup_bos(struct drm_device *dev,
> -		  struct drm_file *file_priv,
> -		  struct drm_panfrost_submit *args,
> -		  struct panfrost_job *job)
> +panfrost_get_job_bos(struct drm_file *file_priv,
> +		     u64 refs, u32 ref_stride, u32 count,
> +		     struct panfrost_job *job)
>  {
> +	void __user *in = u64_to_user_ptr(refs);
>  	unsigned int i;
> -	int ret;
>  
> -	job->bo_count = args->bo_handle_count;
> +	job->bo_count = count;
>  
> -	if (!job->bo_count)
> +	if (!count)
>  		return 0;
>  
> +	job->bos = kvmalloc_array(job->bo_count, sizeof(*job->bos),
> +				  GFP_KERNEL | __GFP_ZERO);
>  	job->bo_flags = kvmalloc_array(job->bo_count,
>  				       sizeof(*job->bo_flags),
>  				       GFP_KERNEL | __GFP_ZERO);
> -	if (!job->bo_flags)
> +	if (!job->bos || !job->bo_flags)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < job->bo_count; i++)
> -		job->bo_flags[i] = PANFROST_BO_REF_EXCLUSIVE;
> +	for (i = 0; i < count; i++) {
> +		struct drm_panfrost_bo_ref ref = { };
> +		int ret;
>  
> -	ret = drm_gem_objects_lookup(file_priv,
> -				     (void __user *)(uintptr_t)args->bo_handles,
> -				     job->bo_count, &job->bos);
> -	if (ret)
> -		return ret;
> +		ret = copy_struct_from_user(&ref, sizeof(ref),
> +					    in + (i * ref_stride),
> +					    ref_stride);
> +		if (ret)
> +			return ret;
>  
> -	return panfrost_get_job_mappings(file_priv, job);
> +		/* Prior to the BATCH_SUBMIT ioctl all accessed BOs were
> +		 * treated as exclusive.
> +		 */
> +		if (ref_stride == sizeof(u32))
> +			ref.flags = PANFROST_BO_REF_EXCLUSIVE;
> +
> +		if ((ref.flags & ~PANFROST_BO_REF_ALLOWED_FLAGS))
> +			return -EINVAL;
> +
> +		job->bos[i] = drm_gem_object_lookup(file_priv, ref.handle);
> +		if (!job->bos[i])
> +			return -EINVAL;
> +
> +		job->bo_flags[i] = ref.flags;
> +	}
> +
> +	return 0;
>  }
>  
> -/**
> - * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
> - * referenced by the job.
> - * @dev: DRM device
> - * @file_priv: DRM file for this fd
> - * @args: IOCTL args
> - * @job: job being set up
> - *
> - * Resolve syncobjs from userspace to fences and attach them to job.
> - *
> - * Note that this function doesn't need to unreference the fences on
> - * failure, because that will happen at panfrost_job_cleanup() time.
> - */
>  static int
> -panfrost_copy_in_sync(struct drm_device *dev,
> -		  struct drm_file *file_priv,
> -		  struct drm_panfrost_submit *args,
> -		  struct panfrost_job *job)
> +panfrost_get_job_in_syncs(struct drm_file *file_priv,
> +			  u64 refs, u32 ref_stride,
> +			  u32 count, struct panfrost_job *job)
>  {
> -	u32 *handles;
> -	int ret = 0;
> -	int i, in_fence_count;
> +	const void __user *in = u64_to_user_ptr(refs);
> +	unsigned int i;
> +	int ret;
>  
> -	in_fence_count = args->in_sync_count;
> -
> -	if (!in_fence_count)
> +	if (!count)
>  		return 0;
>  
> -	handles = kvmalloc_array(in_fence_count, sizeof(u32), GFP_KERNEL);
> -	if (!handles) {
> -		ret = -ENOMEM;
> -		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
> -		goto fail;
> -	}
> -
> -	if (copy_from_user(handles,
> -			   (void __user *)(uintptr_t)args->in_syncs,
> -			   in_fence_count * sizeof(u32))) {
> -		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in syncobj handles\n");
> -		goto fail;
> -	}
> -
> -	for (i = 0; i < in_fence_count; i++) {
> +	for (i = 0; i < count; i++) {
> +		struct drm_panfrost_syncobj_ref ref = { };
>  		struct dma_fence *fence;
>  
> -		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
> -					     &fence);
> +		ret = copy_struct_from_user(&ref, sizeof(ref),
> +					    in + (i * ref_stride),
> +					    ref_stride);
>  		if (ret)
> -			goto fail;
> +			return ret;
> +
> +		if (ref.pad)
> +			return -EINVAL;
> +
> +		ret = drm_syncobj_find_fence(file_priv, ref.handle, ref.point,
> +					     0, &fence);
> +		if (ret)
> +			return ret;
>  
>  		ret = drm_gem_fence_array_add(&job->deps, fence);
> -
>  		if (ret)
> -			goto fail;
> +			return ret;
>  	}
>  
> -fail:
> -	kvfree(handles);
> -	return ret;
> +	return 0;
>  }
>  
>  static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> @@ -289,11 +273,17 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->file_priv = file->driver_priv;
>  
> -	ret = panfrost_copy_in_sync(dev, file, args, job);
> +	ret = panfrost_get_job_in_syncs(file, args->in_syncs, sizeof(u32),
> +					args->in_sync_count, job);
>  	if (ret)
>  		goto fail_job;
>  
> -	ret = panfrost_lookup_bos(dev, file, args, job);
> +	ret = panfrost_get_job_bos(file, args->bo_handles, sizeof(u32),
> +				   args->bo_handle_count, job);
> +	if (ret)
> +		goto fail_job;
> +
> +	ret = panfrost_get_job_mappings(file, job);
>  	if (ret)
>  		goto fail_job;
>  
> @@ -491,6 +481,225 @@ panfrost_ioctl_destroy_submitqueue(struct drm_device *dev, void *data,
>  	return panfrost_submitqueue_destroy(priv, id);
>  }
>  
> +struct panfrost_job_out_sync {
> +	struct drm_syncobj *syncobj;
> +	struct dma_fence_chain *chain;
> +	u64 point;
> +};
> +
> +static void
> +panfrost_put_job_out_syncs(struct panfrost_job_out_sync *out_syncs, u32 count)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < count; i++) {
> +		if (!out_syncs[i].syncobj)
> +			break;
> +
> +		drm_syncobj_put(out_syncs[i].syncobj);
> +		kvfree(out_syncs[i].chain);
> +	}
> +
> +	kvfree(out_syncs);
> +}
> +
> +static struct panfrost_job_out_sync *
> +panfrost_get_job_out_syncs(struct drm_file *file_priv,
> +			   u64 refs, u32 ref_stride,
> +			   u32 count)
> +{
> +	void __user *in = u64_to_user_ptr(refs);
> +	struct panfrost_job_out_sync *out_syncs;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!count)
> +		return NULL;
> +
> +	out_syncs = kvmalloc_array(count, sizeof(*out_syncs),
> +				   GFP_KERNEL | __GFP_ZERO);
> +	if (!out_syncs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < count; i++) {
> +		struct drm_panfrost_syncobj_ref ref = { };
> +
> +		ret = copy_struct_from_user(&ref, sizeof(ref),
> +					    in + (i * ref_stride),
> +					    ref_stride);
> +		if (ret)
> +			goto err_free_out_syncs;
> +
> +		if (ref.pad) {
> +			ret = -EINVAL;
> +			goto err_free_out_syncs;
> +		}
> +
> +		out_syncs[i].syncobj = drm_syncobj_find(file_priv, ref.handle);
> +		if (!out_syncs[i].syncobj) {
> +			ret = -EINVAL;
> +			goto err_free_out_syncs;
> +		}
> +
> +		out_syncs[i].point = ref.point;
> +		if (!out_syncs[i].point)
> +			continue;
> +
> +		out_syncs[i].chain = kmalloc(sizeof(*out_syncs[i].chain),
> +					     GFP_KERNEL);
> +		if (!out_syncs[i].chain) {
> +			ret = -ENOMEM;
> +			goto err_free_out_syncs;
> +		}
> +	}
> +
> +	return out_syncs;
> +
> +err_free_out_syncs:
> +	panfrost_put_job_out_syncs(out_syncs, count);
> +	return ERR_PTR(ret);
> +}
> +
> +static void
> +panfrost_set_job_out_fence(struct panfrost_job_out_sync *out_syncs,
> +			   unsigned int count, struct dma_fence *fence)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < count; i++) {
> +		if (out_syncs[i].chain) {
> +			drm_syncobj_add_point(out_syncs[i].syncobj,
> +					      out_syncs[i].chain,
> +					      fence, out_syncs[i].point);
> +			out_syncs[i].chain = NULL;
> +		} else {
> +			drm_syncobj_replace_fence(out_syncs[i].syncobj,
> +						  fence);
> +		}
> +	}
> +}
> +
> +#define PANFROST_JD_ALLOWED_REQS PANFROST_JD_REQ_FS
> +
> +static int
> +panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
> +		    struct panfrost_submitqueue *queue,
> +		    const struct drm_panfrost_job *args,
> +		    u32 bo_stride, u32 syncobj_stride)
> +{
> +	struct panfrost_device *pfdev = dev->dev_private;
> +	struct panfrost_job_out_sync *out_syncs;
> +	struct panfrost_job *job;
> +	int ret;
> +
> +	if (!args->head)
> +		return -EINVAL;
> +
> +	if (args->requirements & ~PANFROST_JD_ALLOWED_REQS)
> +		return -EINVAL;
> +
> +	job = kzalloc(sizeof(*job), GFP_KERNEL);
> +	if (!job)
> +		return -ENOMEM;
> +
> +	kref_init(&job->refcount);
> +
> +	job->pfdev = pfdev;
> +	job->jc = args->head;
> +	job->requirements = args->requirements;
> +	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
> +	job->file_priv = file_priv->driver_priv;
> +	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
> +
> +	ret = panfrost_get_job_in_syncs(file_priv,
> +					args->in_syncs,
> +					syncobj_stride,
> +					args->in_sync_count,
> +					job);
> +	if (ret)
> +		goto err_put_job;
> +
> +	out_syncs = panfrost_get_job_out_syncs(file_priv,
> +					       args->out_syncs,
> +					       syncobj_stride,
> +					       args->out_sync_count);
> +	if (IS_ERR(out_syncs)) {
> +		ret = PTR_ERR(out_syncs);
> +		goto err_put_job;
> +	}
> +
> +	ret = panfrost_get_job_bos(file_priv, args->bos, bo_stride,
> +				   args->bo_count, job);
> +	if (ret)
> +		goto err_put_job;
> +
> +	ret = panfrost_get_job_mappings(file_priv, job);
> +	if (ret)
> +		goto err_put_job;
> +
> +	ret = panfrost_job_push(queue, job);
> +	if (ret) {
> +		panfrost_put_job_out_syncs(out_syncs, args->out_sync_count);
> +		goto err_put_job;
> +	}
> +
> +	panfrost_set_job_out_fence(out_syncs, args->out_sync_count,
> +				   job->render_done_fence);
> +	panfrost_put_job_out_syncs(out_syncs, args->out_sync_count);
> +	return 0;
> +
> +err_put_job:
> +	panfrost_job_put(job);
> +	return ret;
> +}
> +
> +static int
> +panfrost_ioctl_batch_submit(struct drm_device *dev, void *data,
> +			    struct drm_file *file_priv)
> +{
> +	struct drm_panfrost_batch_submit *args = data;
> +	void __user *jobs_args = u64_to_user_ptr(args->jobs);
> +	struct panfrost_submitqueue *queue;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Relax this test if new fields are added to
> +	 * drm_panfrost_{bo_ref,syncobj_ref,job}.
> +	 */
> +	if (args->job_stride < sizeof(struct drm_panfrost_job) ||
> +	    args->bo_ref_stride < sizeof(struct drm_panfrost_bo_ref) ||
> +	    args->syncobj_ref_stride < sizeof(struct drm_panfrost_syncobj_ref))
> +		return -EINVAL;
> +
> +	queue = panfrost_submitqueue_get(file_priv->driver_priv, args->queue);
> +	if (IS_ERR(queue))
> +		return PTR_ERR(queue);
> +
> +	for (i = 0; i < args->job_count; i++) {
> +		struct drm_panfrost_job job_args = { };
> +
> +		ret = copy_struct_from_user(&job_args, sizeof(job_args),
> +					    jobs_args + (i * args->job_stride),
> +					    args->job_stride);
> +		if (ret) {
> +			args->fail_idx = i;
> +			goto out_put_queue;
> +		}
> +
> +		ret = panfrost_submit_job(dev, file_priv, queue, &job_args,
> +					  args->bo_ref_stride,
> +					  args->syncobj_ref_stride);
> +		if (ret) {
> +			args->fail_idx = i;
> +			goto out_put_queue;
> +		}
> +	}
> +
> +out_put_queue:
> +	panfrost_submitqueue_put(queue);
> +	return 0;
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -570,6 +779,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(CREATE_SUBMITQUEUE, create_submitqueue, DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(DESTROY_SUBMITQUEUE, destroy_submitqueue, DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(BATCH_SUBMIT,	batch_submit,	DRM_RENDER_ALLOW),
>  };
>  
>  DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 56ae89272e19..4e1540bce865 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -254,6 +254,9 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
>  				return ret;
>  		}
>  
> +		if (job->bo_flags[i] & PANFROST_BO_REF_NO_IMPLICIT_DEP)
> +			continue;
> +
>  		ret = drm_gem_fence_array_add_implicit(&job->deps, job->bos[i],
>  						       exclusive);
>  		if (ret)
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 7ee02fd1ac75..ce0c1b96a58c 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -23,6 +23,7 @@ extern "C" {
>  #define DRM_PANFROST_MADVISE			0x08
>  #define DRM_PANFROST_CREATE_SUBMITQUEUE		0x09
>  #define DRM_PANFROST_DESTROY_SUBMITQUEUE	0x0a
> +#define DRM_PANFROST_BATCH_SUBMIT		0x0b
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -33,6 +34,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
>  #define DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_CREATE_SUBMITQUEUE, struct drm_panfrost_create_submitqueue)
>  #define DRM_IOCTL_PANFROST_DESTROY_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_DESTROY_SUBMITQUEUE, __u32)
> +#define DRM_IOCTL_PANFROST_BATCH_SUBMIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_BATCH_SUBMIT, struct drm_panfrost_batch_submit)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -241,7 +243,89 @@ struct drm_panfrost_create_submitqueue {
>  	__u32 id;	/* out, identifier */
>  };
>  
> +/* Syncobj reference passed at job submission time to encode explicit
> + * input/output fences.
> + */
> +struct drm_panfrost_syncobj_ref {
> +	__u32 handle;
> +	__u32 pad;
> +	__u64 point;
> +};
> +
>  #define PANFROST_BO_REF_EXCLUSIVE	0x1
> +#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2
> +
> +/* Describes a BO referenced by a job and the type of access. */
> +struct drm_panfrost_bo_ref {
> +	__u32 handle;
> +	__u32 flags;
> +};
> +
> +/* Describes a GPU job and the resources attached to it. */
> +struct drm_panfrost_job {
> +	/** GPU pointer to the head of the job chain. */
> +	__u64 head;
> +
> +	/**
> +	 * Array of drm_panfrost_bo_ref objects describing the BOs referenced
> +	 * by this job.
> +	 */
> +	__u64 bos;
> +
> +	/**
> +	 * Arrays of drm_panfrost_syncobj_ref objects describing the input
> +	 * and output fences.
> +	 */
> +	__u64 in_syncs;
> +	__u64 out_syncs;
> +
> +	/** Syncobj reference array sizes. */
> +	__u32 in_sync_count;
> +	__u32 out_sync_count;
> +
> +	/** BO reference array size. */
> +	__u32 bo_count;
> +
> +	/** Combination of PANFROST_JD_REQ_* flags. */
> +	__u32 requirements;
> +};
> +
> +/* Used to submit multiple jobs in one call */
> +struct drm_panfrost_batch_submit {
> +	/**
> +	 * Stride of the jobs array (needed to ease extension of the
> +	 * BATCH_SUBMIT ioctl). Should be set to
> +	 * sizeof(struct drm_panfrost_job).
> +	 */
> +	__u32 job_stride;
> +
> +	/** Number of jobs to submit. */
> +	__u32 job_count;
> +
> +	/* Pointer to a job array. */
> +	__u64 jobs;
> +
> +	/**
> +	 * Stride of the BO and syncobj reference arrays (needed to ease
> +	 * extension of the BATCH_SUBMIT ioctl). Should be set to
> +	 * sizeof(struct drm_panfrost_bo_ref).
> +	 */
> +	__u32 bo_ref_stride;
> +	__u32 syncobj_ref_stride;
> +
> +	/**
> +	 * If the submission fails, this encodes the index of the job
> +	 * failed.
> +	 */
> +	__u32 fail_idx;
> +
> +	/**
> +	 * ID of the queue to submit those jobs to. 0 is the default
> +	 * submit queue and should always exists. If you need a dedicated
> +	 * queue, create it with DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE.
> +	 */
> +	__u32 queue;
> +};
>  
>  #if defined(__cplusplus)
>  }
> 

