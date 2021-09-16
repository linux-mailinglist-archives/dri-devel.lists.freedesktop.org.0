Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697840D888
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A352C6ECCF;
	Thu, 16 Sep 2021 11:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30946ECCF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=23ddsGdTNG394zZ+kjJjwxDNVOU3NXL4euCbhtDPjuw=; 
 b=ZxISHXla00Z0TzGoDI32kHzxgOj9mvpSlyrlYcDrC6xKaMNnRajBOH2aG31ZumlQaokIODx+FW0wnbCImPFQ6dZm93RvYZBhx1QNMW+kFZWMA/WUOD/9Fqvv8xZY+r0LP5h4E9CAtJnttsTgoEreUj5k/vD9bzskamyRNR3KYREHVR+VbsUPZSbfozntQyGtV8MagYO86L2dyvCnmSetbl8DQ0pdR6I6OFbA25InHeUX1FvUh9Ob+OdUsrx3f5nTauzaTxS3OfYCco5JpJCbW5NhvEWgSFq2XhbzdGw/6xhRPeG6Tsdky23fn6vwWLjgIvMYSc1Rla5GzOBRURvQeg==;
Received: from 89.50.165.83.dynamic.reverse-mundo-r.com ([83.165.50.89]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQpaz-0005oW-UE; Thu, 16 Sep 2021 13:30:26 +0200
Message-ID: <74b8f7d4d154aad9739cb94b97b8093b5dc7944a.camel@igalia.com>
Subject: Re: [PATCH 3/3] drm/v3d: add multiple syncobjs support
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Thu, 16 Sep 2021 13:30:15 +0200
In-Reply-To: <dbe78028cd28b41e513e614ec07438a19b4697a6.1629307160.git.mwen@igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
 <dbe78028cd28b41e513e614ec07438a19b4697a6.1629307160.git.mwen@igalia.com>
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

I think this looks good overall, I have a few questions/commments
below:

On Wed, 2021-08-18 at 18:57 +0100, Melissa Wen wrote:
> Using the generic extension support set in the previous patch, this
> patch enables more than one in/out binary syncobj per job submission.
> Arrays of syncobjs are set in a specific extension type (multisync)
> that also cares of determining the stage for sync (bin/render)
> through a flag - when this is the case.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c |   3 +
>  drivers/gpu/drm/v3d/v3d_drv.h |  14 +++
>  drivers/gpu/drm/v3d/v3d_gem.c | 209 +++++++++++++++++++++++++++-----
> --
>  include/uapi/drm/v3d_drm.h    |  38 +++++++
>  4 files changed, 226 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index 6a0516160bb2..939ca8c833f5 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -96,6 +96,9 @@ static int v3d_get_param_ioctl(struct drm_device
> *dev, void *data,
>  	case DRM_V3D_PARAM_SUPPORTS_PERFMON:
>  		args->value = (v3d->ver >= 40);
>  		return 0;
> +	case DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT:
> +		args->value = 1;
> +		return 0;
>  	default:
>  		DRM_DEBUG("Unknown parameter %d\n", args->param);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index b900a050d5e2..544c60404a0f 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -294,6 +294,20 @@ struct v3d_csd_job {
>  	struct drm_v3d_submit_csd args;
>  };
>  
> +struct v3d_submit_outsync {
> +	struct drm_syncobj *syncobj;
> +};
> +
> +struct v3d_submit_ext {
> +	u32 flags;
> +
> +	u32 in_sync_count;
> +	u64 in_syncs;
> +
> +	u32 out_sync_count;
> +	struct v3d_submit_outsync *out_syncs;
> +};
> +
>  /**
>   * __wait_for - magic wait macro
>   *
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index e254919b6c5e..e7aabe1a0e11 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -392,6 +392,9 @@ v3d_render_job_free(struct kref *ref)
>  
>  void v3d_job_cleanup(struct v3d_job *job)
>  {
> +	if (!job)
> +		return;
> +
>  	drm_sched_job_cleanup(&job->base);
>  	v3d_job_put(job);
>  }
> @@ -451,10 +454,11 @@ v3d_job_add_deps(struct drm_file *file_priv,
> struct v3d_job *job,
>  static int
>  v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>  	     struct v3d_job *job, void (*free)(struct kref *ref),
> -	     u32 in_sync, enum v3d_queue queue)
> +	     u32 in_sync, struct v3d_submit_ext *se, enum v3d_queue
> queue)
>  {
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
> -	int ret;
> +	bool has_multinsync = (se && se->in_sync_count);
> +	int ret, i;
>  
>  	job->v3d = v3d;
>  	job->free = free;
> @@ -463,14 +467,30 @@ v3d_job_init(struct v3d_dev *v3d, struct
> drm_file *file_priv,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = drm_sched_job_init(&job->base, &v3d_priv-
> >sched_entity[queue],
> -				 v3d_priv);
> +	ret = drm_sched_job_init(&job->base, &v3d_priv-
> >sched_entity[queue], v3d_priv);
>  	if (ret)
>  		goto fail;
>  
> -	ret = v3d_job_add_deps(file_priv, job, in_sync, 0);
> -	if (ret)
> -		goto fail_job;
> +	if (has_multinsync && (se->flags == (queue == V3D_RENDER))) {

I think this is unnecessarily difficult to understand, I'd suggest to
code the condition more explicitly:

if (has_multisync &&
    (see->flags & DRM_V3D_IN_SYNC_RCL) &&
    queue ==  V3D_RENDER)

unless I am missing the point here :)

> +		struct drm_v3d_sem __user *handle = u64_to_user_ptr(se-
> >in_syncs);
> +
> +		for (i = 0; i < se->in_sync_count; i++) {
> +			struct drm_v3d_sem in;
> +
> +			ret = copy_from_user(&in, handle++, sizeof(
> in));
> +			if (ret) {
> +				DRM_DEBUG("Failed to copy wait dep
> handle.\n");
> +				goto fail_job;
> +			}
> +			ret = v3d_job_add_deps(file_priv, job,
> in.handle, 0);
> +			if (ret)
> +				goto fail_job;
> +		}
> +	} else if (!has_multinsync) {
> +		ret = v3d_job_add_deps(file_priv, job, in_sync, 0);
> +		if (ret)
> +			goto fail_job;
> +	}
>  
>  	kref_init(&job->refcount);
>  
> @@ -500,6 +520,7 @@ v3d_attach_fences_and_unlock_reservation(struct
> drm_file *file_priv,
>  					 struct v3d_job *job,
>  					 struct ww_acquire_ctx
> *acquire_ctx,
>  					 u32 out_sync,
> +					 struct v3d_submit_ext *se,
>  					 struct dma_fence *done_fence)
>  {
>  	struct drm_syncobj *sync_out;
> @@ -514,6 +535,18 @@ v3d_attach_fences_and_unlock_reservation(struct
> drm_file *file_priv,
>  	drm_gem_unlock_reservations(job->bo, job->bo_count,
> acquire_ctx);
>  
>  	/* Update the return sync object for the job */
> +	/* If multiples semaphores is supported */
> +	if (se && se->out_sync_count) {
> +		for (i = 0; i < se->out_sync_count; i++) {
> +			drm_syncobj_replace_fence(se-
> >out_syncs[i].syncobj,
> +						  done_fence);
> +			drm_syncobj_put(se->out_syncs[i].syncobj);
> +		}
> +		kvfree(se->out_syncs);
> +		return;
> +	}
> +
> +	/* Single signal semaphore */
>  	sync_out = drm_syncobj_find(file_priv, out_sync);
>  	if (sync_out) {
>  		drm_syncobj_replace_fence(sync_out, done_fence);
> @@ -521,11 +554,93 @@ v3d_attach_fences_and_unlock_reservation(struct
> drm_file *file_priv,
>  	}
>  }
>  
> +static void
> +v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
> +{
> +	unsigned int i;
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
> +	}
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
> +static int
> +v3d_get_multisync_submit_deps(struct drm_file *file_priv,
> +			      struct v3d_submit_ext *se,
> +			      u64 ext_data)
> +{
> +	struct drm_v3d_multi_sync multisync = {0};
> +	int ret;
> +
> +	ret = copy_from_user(&multisync, u64_to_user_ptr(ext_data),
> +			     sizeof(multisync));
> +	if (ret)
> +		return ret;
> +
> +	ret = v3d_get_multisync_post_deps(file_priv, se,
> multisync.out_sync_count,
> +					  multisync.out_syncs);
> +	if (ret)
> +		return ret;
> +
> +	se->in_sync_count = multisync.in_sync_count;
> +	se->in_syncs = multisync.in_syncs;
> +
> +	se->flags = multisync.flags;
> +
> +	return 0;
> +}
> +
>  static int
>  v3d_get_extensions(struct drm_file *file_priv,
> +		   struct v3d_submit_ext *se,
>  		   u32 ext_count, u64 ext_handles)
>  {
> -	int i;
> +	int i, ret;
>  	struct drm_v3d_extension __user *handles;
>  
>  	if (!ext_count)
> @@ -541,7 +656,12 @@ v3d_get_extensions(struct drm_file *file_priv,
>  		}
>  
>  		switch (ext.id) {
> -		case 0:
> +		case DRM_V3D_EXT_ID_MULTI_SYNC:
> +			ret = v3d_get_multisync_submit_deps(file_priv,
> se,
> +							    ext.ext_dat
> a);
> +			if (ret)
> +				return ret;
> +			break;
>  		default:
>  			DRM_DEBUG_DRIVER("Unknown extension id: %d\n",
> ext.id);
>  			return -EINVAL;
> @@ -572,6 +692,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>  	struct drm_v3d_submit_cl *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_bin_job *bin = NULL;
>  	struct v3d_render_job *render;
>  	struct v3d_job *clean_job = NULL;
> @@ -589,7 +710,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv,
> +		ret = v3d_get_extensions(file_priv, &se,
>  					 args->extension_count,
>  					 args->extensions);
>  		if (ret) {
> @@ -599,33 +720,35 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> void *data,
>  	}
>  
>  	render = kcalloc(1, sizeof(*render), GFP_KERNEL);
> -	if (!render)
> +	if (!render) {
> +		v3d_put_multisync_post_deps(&se);
>  		return -ENOMEM;
> +	}
>  
>  	render->start = args->rcl_start;
>  	render->end = args->rcl_end;
>  	INIT_LIST_HEAD(&render->unref_list);
>  
> -	ret = v3d_job_init(v3d, file_priv, &render->base,
> -			   v3d_render_job_free, args->in_sync_rcl,
> V3D_RENDER);
> +	ret = v3d_job_init(v3d, file_priv, &render->base,
> v3d_render_job_free,
> +			   args->in_sync_rcl, &se, V3D_RENDER);
>  	if (ret) {
>  		kfree(render);
> +		v3d_put_multisync_post_deps(&se);
>  		return ret;
>  	}
>  
>  	if (args->bcl_start != args->bcl_end) {
>  		bin = kcalloc(1, sizeof(*bin), GFP_KERNEL);
>  		if (!bin) {
> -			v3d_job_put(&render->base);
> -			return -ENOMEM;
> +			ret = -ENOMEM;
> +			goto fail;

We are now calling v3d_job_cleanup where we would call v3d_job_put
before for error codepaths. Is it safe to call this if we fail job
creation before calling drm_sched_job_init like here?

The documentations says that this cleans up the resources allocated
with drm_sched_job_init, which he haven't called yet.

>  		}
>  
>  		ret = v3d_job_init(v3d, file_priv, &bin->base,
> -				   v3d_job_free, args->in_sync_bcl,
> V3D_BIN);
> +				   v3d_job_free, args->in_sync_bcl,
> &se, V3D_BIN);
>  		if (ret) {
> -			v3d_job_put(&render->base);
>  			kfree(bin);
> -			return ret;
> +			goto fail;
>  		}
>  
>  		bin->start = args->bcl_start;
> @@ -643,7 +766,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  			goto fail;
>  		}
>  
> -		ret = v3d_job_init(v3d, file_priv, clean_job,
> v3d_job_free, 0, V3D_CACHE_CLEAN);
> +		ret = v3d_job_init(v3d, file_priv, clean_job,
> v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
>  		if (ret) {
>  			kfree(clean_job);
>  			clean_job = NULL;
> @@ -706,6 +829,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>  						 last_job,
>  						 &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 last_job->done_fence);
>  
>  	if (bin)
> @@ -721,11 +845,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> void *data,
>  	drm_gem_unlock_reservations(last_job->bo,
>  				    last_job->bo_count, &acquire_ctx);
>  fail:
> -	if (bin)
> -		v3d_job_cleanup(&bin->base);
> +	v3d_job_cleanup(&bin->base);
>  	v3d_job_cleanup(&render->base);
> -	if (clean_job)
> -		v3d_job_cleanup(clean_job);
> +	v3d_job_cleanup(clean_job);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> @@ -745,6 +868,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  {
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct drm_v3d_submit_tfu *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_tfu_job *job;
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret = 0;
> @@ -757,7 +881,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv,
> +		ret = v3d_get_extensions(file_priv, &se,
>  					 args->extension_count,
>  					 args->extensions);
>  		if (ret) {
> @@ -767,21 +891,24 @@ v3d_submit_tfu_ioctl(struct drm_device *dev,
> void *data,
>  	}
>  
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
> -	if (!job)
> +	if (!job) {
> +		v3d_put_multisync_post_deps(&se);
>  		return -ENOMEM;
> +	}
>  
>  	ret = v3d_job_init(v3d, file_priv, &job->base,
> -			   v3d_job_free, args->in_sync, V3D_TFU);
> +			   v3d_job_free, args->in_sync, &se, V3D_TFU);
>  	if (ret) {
>  		kfree(job);
> +		v3d_put_multisync_post_deps(&se);
>  		return ret;
>  	}
>  
>  	job->base.bo = kcalloc(ARRAY_SIZE(args->bo_handles),
>  			       sizeof(*job->base.bo), GFP_KERNEL);
>  	if (!job->base.bo) {
> -		v3d_job_put(&job->base);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto fail;
>  	}
>  
>  	job->args = *args;
> @@ -821,6 +948,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  	v3d_attach_fences_and_unlock_reservation(file_priv,
>  						 &job->base,
> &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 job->base.done_fence);
>  
>  	v3d_job_put(&job->base);
> @@ -829,6 +957,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void
> *data,
>  
>  fail:
>  	v3d_job_cleanup(&job->base);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> @@ -849,8 +978,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> *data,
>  	struct v3d_dev *v3d = to_v3d_dev(dev);
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>  	struct drm_v3d_submit_csd *args = data;
> +	struct v3d_submit_ext se = {0};
>  	struct v3d_csd_job *job;
> -	struct v3d_job *clean_job;
> +	struct v3d_job *clean_job = NULL;
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret;
>  
> @@ -867,7 +997,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> *data,
>  	}
>  
>  	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> -		ret = v3d_get_extensions(file_priv,
> +		ret = v3d_get_extensions(file_priv, &se,
>  					 args->extension_count,
>  					 args->extensions);
>  		if (ret) {
> @@ -877,28 +1007,29 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  	}
>  
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
> -	if (!job)
> +	if (!job) {
> +		v3d_put_multisync_post_deps(&se);
>  		return -ENOMEM;
> +	}
>  
>  	ret = v3d_job_init(v3d, file_priv, &job->base,
> -			   v3d_job_free, args->in_sync, V3D_CSD);
> +			   v3d_job_free, args->in_sync, &se, V3D_CSD);
>  	if (ret) {
>  		kfree(job);
> +		v3d_put_multisync_post_deps(&se);
>  		return ret;
>  	}
>  
>  	clean_job = kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
>  	if (!clean_job) {
> -		v3d_job_put(&job->base);
> -		kfree(job);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto fail;
>  	}
>  
> -	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> V3D_CACHE_CLEAN);
> +	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> 0, V3D_CACHE_CLEAN);
>  	if (ret) {
> -		v3d_job_put(&job->base);
>  		kfree(clean_job);
> -		return ret;
> +		goto fail;
>  	}
>  
>  	job->args = *args;
> @@ -936,6 +1067,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  						 clean_job,
>  						 &acquire_ctx,
>  						 args->out_sync,
> +						 &se,
>  						 clean_job-
> >done_fence);
>  
>  	v3d_job_put(&job->base);
> @@ -950,6 +1082,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  fail:
>  	v3d_job_cleanup(&job->base);
>  	v3d_job_cleanup(clean_job);
> +	v3d_put_multisync_post_deps(&se);
>  
>  	return ret;
>  }
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 1f4706010eb5..bbb904c521b4 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -60,6 +60,42 @@ extern "C" {
>  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
>  #define DRM_V3D_SUBMIT_EXTENSION		  0x02
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

I guess the idea here would be that we would check handle and/or point
for whether they have a valid value to decide what type of semaphore
this is, right?

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
> +	/* Array of wait and signal semaphores */
> +	__u64 in_syncs;
> +	__u64 out_syncs;
> +
> +	/* Number of entries */
> +	__u32 in_sync_count;
> +	__u32 out_sync_count;
> +
> +	/* in_sync on render stage */
> +	__u32 flags;
> +#define DRM_V3D_IN_SYNC_RCL			0x01
> +};
> +
>  /* struct drm_v3d_extension - ioctl extensions
>   *
>   * Linked-list of generic extensions where the id identify which
> struct is
> @@ -70,6 +106,7 @@ struct drm_v3d_extension {
>  	__u64 next;
>  	__u64 ext_data;
>  	__u32 id;
> +#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
>  };
>  
>  /**
> @@ -228,6 +265,7 @@ enum drm_v3d_param {
>  	DRM_V3D_PARAM_SUPPORTS_CSD,
>  	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
>  	DRM_V3D_PARAM_SUPPORTS_PERFMON,
> +	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
>  };
>  
>  struct drm_v3d_get_param {

