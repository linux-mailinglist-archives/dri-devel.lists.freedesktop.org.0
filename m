Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E770841E859
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 09:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA6D6E509;
	Fri,  1 Oct 2021 07:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAD16E509
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=x8sGD35WRocDyYMPsv7IH7hHHO1iN4e3nvnKzz6KexY=; 
 b=QeVLfXqNF4IetwjVAdBvHmYo4LZ8crBChFIJkrabtiJ4Ch72T76AntKNRDk77c9WA6IYlnvMacrvXTPGl0rHofqT/BhjKSVyB4lZDsEXSimh4q9ACcNZ3rcsKUGS2MzUWnq9meYwkwCiikmnLzySPJYlKbFnRzjCSZwVlTSY3kwj6qatNcHPb0jb+Qw9qvqZb9ePE9G4ascdt0iojByqO2MHssnMmyboLmdHyaRBDbWqdxALhBceeavSBOalKvVw47X+ysqTPRzKmgn1NhB8JRjWjZpmbDfviRdHE5L4Bw/aGCcmBWYzxmMe4X5DBCizVeEw5HLn+mOewn8tBepgyw==;
Received: from 185.48.165.83.dynamic.reverse-mundo-r.com ([83.165.48.185]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWCzS-00055N-4o; Fri, 01 Oct 2021 09:29:54 +0200
Message-ID: <fd6acbe570d02f53b34973516556a15a1909cbf8.camel@igalia.com>
Subject: Re: [PATCH v3 4/4] drm/v3d: add multiple syncobjs support
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Fri, 01 Oct 2021 09:29:43 +0200
In-Reply-To: <ffd8b2e3dd2e0c686db441a0c0a4a0181ff85328.1633016479.git.mwen@igalia.com>
References: <cover.1633016479.git.mwen@igalia.com>
 <ffd8b2e3dd2e0c686db441a0c0a4a0181ff85328.1633016479.git.mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-09-30 at 17:19 +0100, Melissa Wen wrote:
> Using the generic extension from the previous patch, a specific
> multisync
> extension enables more than one in/out binary syncobj per job
> submission.
> Arrays of syncobjs are set in struct drm_v3d_multisync, that also
> cares
> of determining the stage for sync (wait deps) according to the job
> queue.
> 
> v2:
> - subclass the generic extension struct (Daniel)
> - simplify adding dependency conditions to make understandable (Iago)
> 
> v3:
> - fix conditions to consider single or multiples in/out_syncs (Iago)
> - remove irrelevant comment (Iago)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c |   6 +-
>  drivers/gpu/drm/v3d/v3d_drv.h |  24 +++--
>  drivers/gpu/drm/v3d/v3d_gem.c | 185 ++++++++++++++++++++++++++++++
> ----
>  include/uapi/drm/v3d_drm.h    |  49 ++++++++-
>  4 files changed, 232 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index 3d6b9bcce2f7..bd46396a1ae0 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -96,6 +96,9 @@ static int v3d_get_param_ioctl(struct drm_device 

(...)

> 
> @@ -516,9 +536,11 @@ v3d_attach_fences_and_unlock_reservation(struct
> drm_file *file_priv,
>  					 struct v3d_job *job,
>  					 struct ww_acquire_ctx
> *acquire_ctx,
>  					 u32 out_sync,
> +					 struct v3d_submit_ext *se,
>  					 struct dma_fence *done_fence)
>  {
>  	struct drm_syncobj *sync_out;
> +	bool has_multisync = se && (se->flags & 

We always pass the 'se' pointer from a local variable allocated in the
stack of the caller so it is never going to be NULL.

I am happy to keep the NULL check if you want to protect against future
changes just in case, but if we do that then...

> DRM_V3D_EXT_ID_MULTI_SYNC);
>  	int i;
>  
>  	for (i = 0; i < job->bo_count; i++) {

(...)

> +static void
> +v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
> +{
> +	unsigned int i;
> +
> +	if (!se->out_sync_count)

...we should also check for NULL here for consistency.

Also, I think there is another problem in the code: we always call
v3d_job_cleanup for failed jobs, but only call v3d_job_put for
successful jobs. However, reading the docs for drm_sched_job_init:

"Drivers must make sure drm_sched_job_cleanup() if this function
returns successfully, even when @job is aborted before
drm_sched_job_arm() is called."

So my understanding is that we should call v3d_job_cleanup instead of
v3d_job_put for successful jobs or we would be leaking sched resources
on every successful job, no?

Iago

> +		return;
> +
> +	for (i = 0; i < se->out_sync_count; i++)
> +		drm_syncobj_put(se->out_syncs[i].syncobj);
> +	kvfree(se->out_syncs);
> +}
> +
> +static int
> +v3d_get_multisync_post_deps(struct drm_file *file_priv,
> +			    struct v3d_submit_ext *se,
> +			    u32 count, u64 handles)
> +{
> +	struct drm_v3d_sem __user *post_deps;
> +	int i, ret;
> +
> +	if (!count)
> +		return 0;
> +
> +	se->out_syncs = (struct v3d_submit_outsync *)
> +			kvmalloc_array(count,
> +				       sizeof(struct
> v3d_submit_outsync),
> +				       GFP_KERNEL);
> +	if (!se->out_syncs)
> +		return -ENOMEM;
> +
> +	post_deps = u64_to_user_ptr(handles);
> +
> +	for (i = 0; i < count; i++) {
> +		struct drm_v3d_sem out;
> +
> +		ret = copy_from_user(&out, post_deps++, sizeof(out));
> +		if (ret) {
> +			DRM_DEBUG("Failed to copy post dep handles\n");
> +			goto fail;
> +		}
> +
> +		se->out_syncs[i].syncobj = drm_syncobj_find(file_priv,
> +							    out.handle)
> ;
> +		if (!se->out_syncs[i].syncobj) {
> +			ret = -EINVAL;
> +			goto fail;
> +		}
>  	}
> +	se->out_sync_count = count;
> +
> +	return 0;
> +
> +fail:
> +	for (i--; i >= 0; i--)
> +		drm_syncobj_put(se->out_syncs[i].syncobj);
> +	kvfree(se->out_syncs);
> +
> +	return ret;
> +}
> +
> +/* Get data for multiple binary semaphores synchronization. Parse
> syncobj
> + * to be signaled when job completes (out_sync).
> + */
> +static int
> +v3d_get_multisync_submit_deps(struct drm_file *file_priv,
> +			      struct drm_v3d_extension __user *ext,
> +			      void *data)
> +{
> +	struct drm_v3d_multi_sync multisync;
> +	struct v3d_submit_ext *se = data;
> +	int ret;
> +
> +	ret = copy_from_user(&multisync, ext, sizeof(multisync));
> +	if (ret)
> +		return ret;
> +
> +	if (multisync.pad)
> +		return -EINVAL;
> +
> +	ret = v3d_get_multisync_post_deps(file_priv, data,
> multisync.out_sync_count,
> +					  multisync.out_syncs);
> +	if (ret)
> +		return ret;
> +
> +	se->in_sync_count = multisync.in_sync_count;
> +	se->in_syncs = multisync.in_syncs;
> +	se->flags |= DRM_V3D_EXT_ID_MULTI_SYNC;
> +	se->wait_stage = multisync.wait_stage;
> +
> +	return 0;
>  }
>  
>  /* Whenever userspace sets ioctl extensions, v3d_get_extensions
> parses data
>   * according to the extension id (name).
>   */
>  static int
> -v3d_get_extensions(struct drm_file *file_priv, u64 ext_handles)
> +v3d_get_extensions(struct drm_file *file_priv,
> +		   u64 ext_handles,
> +		   void *data)
>  {
>  	struct drm_v3d_extension __user *user_ext;
> +	int ret;
>  
>  	user_ext = u64_to_user_ptr(ext_handles);
>  	while (user_ext) {
> @@ -555,7 +687,11 @@ v3d_get_extensions(struct drm_file *file_priv,
> u64 ext_handles)
>  		}
>  
>  		switch (ext.id) {
> -		case 0:
> +		case DRM_V3D_EXT_ID_MULTI_SYNC:
> +			ret = v3d_get_multisync_submit_deps(file_priv,
> user_ext, data);
> +			if (ret)
> +				return ret;
> +			break;
>  		default:
>  			DRM_DEBUG_DRIVER("Unknown extension id: %d\n",
> ext.id);
>  			return -EINVAL;
> @@ -586,6 +722,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>  	struct drm_v3d_submit_cl *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_bin_job *bin = NULL;
>  	struct v3d_render_job *render = NULL;
>  	struct v3d_job *clean_job = NULL;
> @@ -606,7 +743,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv, args->extensions);
> +		ret = v3d_get_extensions(file_priv, args->extensions,
> &se);
>  		if (ret) {
>  			DRM_DEBUG("Failed to get extensions.\n");
>  			return ret;
> @@ -614,7 +751,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	ret = v3d_job_init(v3d, file_priv, (void *)&render,
> sizeof(*render),
> -			   v3d_render_job_free, args->in_sync_rcl,
> V3D_RENDER);
> +			   v3d_render_job_free, args->in_sync_rcl, &se,
> V3D_RENDER);
>  	if (ret)
>  		goto fail;
>  
> @@ -624,7 +761,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  
>  	if (args->bcl_start != args->bcl_end) {
>  		ret = v3d_job_init(v3d, file_priv, (void *)&bin,
> sizeof(*bin),
> -				   v3d_job_free, args->in_sync_bcl,
> V3D_BIN);
> +				   v3d_job_free, args->in_sync_bcl,
> &se, V3D_BIN);
>  		if (ret)
>  			goto fail;
>  
> @@ -638,7 +775,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  
>  	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
>  		ret = v3d_job_init(v3d, file_priv, (void *)&clean_job,
> sizeof(*clean_job),
> -				   v3d_job_free, 0, V3D_CACHE_CLEAN);
> +				   v3d_job_free, 0, 0,
> V3D_CACHE_CLEAN);
>  		if (ret)
>  			goto fail;
>  
> @@ -698,6 +835,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  						 last_job,
>  						 &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 last_job->done_fence);
>  
>  	if (bin)
> @@ -716,6 +854,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	v3d_job_cleanup((void *)bin);
>  	v3d_job_cleanup((void *)render);
>  	v3d_job_cleanup(clean_job);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> @@ -735,6 +874,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  {
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct drm_v3d_submit_tfu *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_tfu_job *job = NULL;
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret = 0;
> @@ -747,7 +887,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv, args->extensions);
> +		ret = v3d_get_extensions(file_priv, args->extensions,
> &se);
>  		if (ret) {
>  			DRM_DEBUG("Failed to get extensions.\n");
>  			return ret;
> @@ -755,7 +895,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
> -			   v3d_job_free, args->in_sync, V3D_TFU);
> +			   v3d_job_free, args->in_sync, &se, V3D_TFU);
>  	if (ret)
>  		goto fail;
>  
> @@ -803,6 +943,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	v3d_attach_fences_and_unlock_reservation(file_priv,
>  						 &job->base,
> &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 job->base.done_fence);
>  
>  	v3d_job_put(&job->base);
> @@ -811,6 +952,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  
>  fail:
>  	v3d_job_cleanup((void *)job);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> @@ -831,6 +973,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> *data,
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>  	struct drm_v3d_submit_csd *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_csd_job *job = NULL;
>  	struct v3d_job *clean_job = NULL;
>  	struct ww_acquire_ctx acquire_ctx;
> @@ -852,7 +995,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv, args->extensions);
> +		ret = v3d_get_extensions(file_priv, args->extensions,
> &se);
>  		if (ret) {
>  			DRM_DEBUG("Failed to get extensions.\n");
>  			return ret;
> @@ -860,12 +1003,12 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  	}
>  
>  	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
> -			   v3d_job_free, args->in_sync, V3D_CSD);
> +			   v3d_job_free, args->in_sync, &se, V3D_CSD);
>  	if (ret)
>  		goto fail;
>  
>  	ret = v3d_job_init(v3d, file_priv, (void *)&clean_job,
> sizeof(*clean_job),
> -			   v3d_job_free, 0, V3D_CACHE_CLEAN);
> +			   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
>  	if (ret)
>  		goto fail;
>  
> @@ -904,6 +1047,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  						 clean_job,
>  						 &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 clean_job-
> >done_fence);
>  
>  	v3d_job_put(&job->base);
> @@ -918,6 +1062,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  fail:
>  	v3d_job_cleanup((void *)job);
>  	v3d_job_cleanup(clean_job);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 55b443ca6c0b..3dfc0af8756a 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -73,6 +73,53 @@ struct drm_v3d_extension {
>  	__u32 flags; /* mbz */
>  };
>  
> +/* struct drm_v3d_sem - wait/signal semaphore
> + *
> + * If binary semaphore, it only takes syncobj handle and ignores
> flags and
> + * point fields. Point is defined for timeline syncobj feature.
> + */
> +struct drm_v3d_sem {
> +	__u32 handle; /* syncobj */
> +	/* rsv below, for future uses */
> +	__u32 flags;
> +	__u64 point;  /* for timeline sem support */
> +	__u64 mbz[2]; /* must be zero, rsv */
> +};
> +
> +/* Enum for each of the V3D queues. */
> +enum v3d_queue {
> +	V3D_BIN,
> +	V3D_RENDER,
> +	V3D_TFU,
> +	V3D_CSD,
> +	V3D_CACHE_CLEAN,
> +};
> +
> +/**
> + * struct drm_v3d_multi_sync - ioctl extension to add support
> multiples
> + * syncobjs for commands submission.
> + *
> + * When an extension of DRM_V3D_EXT_ID_MULTI_SYNC id is defined, it
> points to
> + * this extension to define wait and signal dependencies, instead of
> single
> + * in/out sync entries on submitting commands. The field flags is
> used to
> + * determine the stage to set wait dependencies.
> + */
> +struct drm_v3d_multi_sync {
> +	struct drm_v3d_extension base;
> +	/* Array of wait and signal semaphores */
> +	__u64 in_syncs;
> +	__u64 out_syncs;
> +
> +	/* Number of entries */
> +	__u32 in_sync_count;
> +	__u32 out_sync_count;
> +
> +	/* set the stage (v3d_queue) to sync */
> +	__u32 wait_stage;
> +
> +	__u32 pad; /* mbz */
> +};
> +
>  /**
>   * struct drm_v3d_submit_cl - ioctl argument for submitting commands
> to the 3D
>   * engine.
> @@ -228,6 +275,7 @@ enum drm_v3d_param {
>  	DRM_V3D_PARAM_SUPPORTS_CSD,
>  	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
>  	DRM_V3D_PARAM_SUPPORTS_PERFMON,
> +	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
>  };
>  
>  struct drm_v3d_get_param {
> @@ -271,7 +319,6 @@ struct drm_v3d_submit_tfu {
>  
>  	/* Pointer to an array of ioctl extensions*/
>  	__u64 extensions;
> -
>  };
>  
>  /* Submits a compute shader for dispatch.  This job will block on
> any

