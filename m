Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97041D59E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 10:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8796EB27;
	Thu, 30 Sep 2021 08:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ADC6EB27
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=9lBafbtl3oQXqTSlqDmNhOsFMxZjWfsaZFV4+pZdT8E=; 
 b=Ppf9j8ha6qgyEUIE9OAIZRUZY3dPEQygCmOe9Eu6uU6Ka0KCDPcpP0EQDBwB9GqM1UC1ta4KkinzpzcEXVMn5wxIZIOqitpxsuJhdxNjXwUkMYQXriBZX7uyjeFczE3o0IutooaCK0ofT4xG83SIwHrO1oD5nzr/qrH8mar243Mo6muYpuYvxCvZX8OUN/R9A/c96o5iS4vscHfCA5YEXoIMQpZvotg4n3p1lwdEkT4ENMAIlHetsXk34afwKqB/314JI/pRYTBo/jY8E3D4W63KeTCrCHyiLCtWEON3hsVgx/ax+D1k89PUsLPdFiZlIvWaVuBii22iqeVPyopxtA==;
Received: from 182.48.165.83.dynamic.reverse-mundo-r.com ([83.165.48.182]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVrgT-0006nx-Dq; Thu, 30 Sep 2021 10:44:53 +0200
Message-ID: <6307238d163737faf9e5c3591b1725497ce77945.camel@igalia.com>
Subject: Re: [PATCH v2 2/4] drm/v3d: alloc and init job in one shot
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Thu, 30 Sep 2021 10:44:42 +0200
In-Reply-To: <9048a84150989bb8719810ea5c987feeb269eccd.1632905676.git.mwen@igalia.com>
References: <cover.1632905676.git.mwen@igalia.com>
 <9048a84150989bb8719810ea5c987feeb269eccd.1632905676.git.mwen@igalia.com>
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

On Wed, 2021-09-29 at 10:43 +0100, Melissa Wen wrote:
> Move job memory allocation to v3d_job_init function. This aim to
> facilitate
> error handling in job initialization, since cleanup steps are similar
> for all
> (struct v3d_job)-based types of job involved in a command submission.
> To
> generalize v3d_job_init(), this change takes into account that all
> job structs
> have the first element a struct v3d_job (bin, render, tfu, csd) or it
> is a
> v3d_job itself (clean_job) for pointer casting.
> 
> Suggested-by: Iago Toral <itoral@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 115 +++++++++++++-------------------
> --
>  1 file changed, 42 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index e60fbc28ef29..9cfa6f8d4357 100644
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
> @@ -450,12 +453,20 @@ v3d_job_add_deps(struct drm_file *file_priv,
> struct v3d_job *job,
>  
>  static int
>  v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
> -	     struct v3d_job *job, void (*free)(struct kref *ref),
> +	     void **container, size_t size, void (*free)(struct kref
> *ref),
>  	     u32 in_sync, enum v3d_queue queue)
>  {
>  	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
> +	struct v3d_job *job;
>  	int ret;
>  
> +	*container = kcalloc(1, size, GFP_KERNEL);
> +	if (!*container) {
> +		DRM_ERROR("Cannot allocate memory for v3d job.");
> +		return -ENOMEM;
> +	}
> +
> +	job = *container;
>  	job->v3d = v3d;
>  	job->free = free;
>  

Right below this hunk we have an early return that doesn't jump to
fail:

        ret = pm_runtime_get_sync(v3d->drm.dev);
        if (ret < 0)
                return ret;


so we should kfree(*container) and set it to NULL there, right?

> @@ -479,6 +490,9 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file
> *file_priv,
>  	drm_sched_job_cleanup(&job->base);
>  fail:
>  	pm_runtime_put_autosuspend(v3d->drm.dev);
> +	kfree(*container);
> +	*container = NULL;
> +
>  	return ret;
>  }
> 

(...)

> @@ -806,29 +789,15 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  		return -EINVAL;
>  	}
>  
> -	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
> -	if (!job)
> -		return -ENOMEM;
> -
> -	ret = v3d_job_init(v3d, file_priv, &job->base,
> +	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
>  			   v3d_job_free, args->in_sync, V3D_CSD);
> -	if (ret) {
> -		kfree(job);
> -		return ret;
> -	}
> -
> -	clean_job = kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
> -	if (!clean_job) {
> -		v3d_job_cleanup(&job->base);
> -		return -ENOMEM;
> -	}
> +	if (ret)
> +		goto fail;
> 

For this to work we need to explicitly initialize clean_job to NULL. 
Notice that the same applies to the bin and clean jobs in the CL ioctl,
but in that case we're already initializing them to NULL.

> -	ret = v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0,
> V3D_CACHE_CLEAN);
> -	if (ret) {
> -		v3d_job_cleanup(&job->base);
> -		kfree(clean_job);
> -		return ret;
> -	}
> +	ret = v3d_job_init(v3d, file_priv, (void *)&clean_job,
> sizeof(*clean_job),
> +			   v3d_job_free, 0, V3D_CACHE_CLEAN);
> +	if (ret)
> +		goto fail;
>  
>  	job->args = *args;
>  
> @@ -877,7 +846,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void
> *data,
>  	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
>  				    &acquire_ctx);
>  fail:
> -	v3d_job_cleanup(&job->base);
> +	v3d_job_cleanup((void *)job);
>  	v3d_job_cleanup(clean_job);
>  
>  	return ret;

