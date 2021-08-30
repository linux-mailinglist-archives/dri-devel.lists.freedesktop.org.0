Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670B3FB2D4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 11:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BB489A5C;
	Mon, 30 Aug 2021 09:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B5C89A4A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:01:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id me10so29562931ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6TxX20RG9vZKNb6s13O3Zgz2CFeRVUtXKUgw8R7voIM=;
 b=DE0IIXDcdI727XPGVqrtky2yQdWuMlMmMgSWIrTGscmSI542IIZjQr6ow8aeAoJp2C
 2NTnYz2F03dI4OkBH+l2grUnqH4P58F5LPe2sdT79g0apRPMM8rtYgIexPiCfVxr/SUx
 oyTIzK4y0HsjaMyKMrEpgKc+7oP19WAme9/WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6TxX20RG9vZKNb6s13O3Zgz2CFeRVUtXKUgw8R7voIM=;
 b=TUOpU1IXutZHDp8ceMQeH9xDSOf58K5wPVC2K96uIW0C+mB9VNtmtWS+Z5DYEWjvdl
 zCfRaT/jGxvsYyT/MW6C8zXgh8TNl35e5fu/k76DhEgRrkVNnJDLjhYp8YpyhmNGP6hM
 zT7IhHgbVKK61ljh7KUtlRUJtqN/2d1nStOE1aIGfwcjNMpqLTYk+ZUbHtTIzO0QTPec
 1PfQsRH0XB+aA9BUIoZRjGB5end9pbuN3uB3mbYiJ2xT2wNkD2AlUcCzwtFp7yNaJlAy
 nCeGp5WMQuJ59cDsssJDzWDUGbnRUb0yvw4oNKrTOAciNNVxMMNiBIUAqMem0+pWCj0v
 hCPg==
X-Gm-Message-State: AOAM530FfLrOaUska6SfvMrxxOzlvt6DCSdby8Z7mByFPo6kTnnWs6xi
 evj5P2GUfRUUNze+2718ZNNENwJjve4thg==
X-Google-Smtp-Source: ABdhPJxB08ojJo6OGjtdEhKjXGnu9dMQoQyBwlcdnF+4nIzqbNcU7sKY3XjYnrjFGe6CGtKcNnl9hg==
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr23825047eje.420.1630314111091; 
 Mon, 30 Aug 2021 02:01:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v10sm7269829edt.25.2021.08.30.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 02:01:50 -0700 (PDT)
Date: Mon, 30 Aug 2021 11:01:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 12/20] drm/msm: Use scheduler dependency handling
Message-ID: <YSyefFUvvoeNJVTe@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210805104705.862416-13-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Aug 05, 2021 at 12:46:57PM +0200, Daniel Vetter wrote:
> drm_sched_job_init is already at the right place, so this boils down
> to deleting code.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Merged up to this patch, except for etnaviv.
-Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem.h        |  5 -----
>  drivers/gpu/drm/msm/msm_gem_submit.c | 19 +++++--------------
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 12 ------------
>  3 files changed, 5 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index f9e3ffb2309a..8bf0ac707fd7 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -312,11 +312,6 @@ struct msm_gem_submit {
>  	struct ww_acquire_ctx ticket;
>  	uint32_t seqno;		/* Sequence number of the submit on the ring */
>  
> -	/* Array of struct dma_fence * to block on before submitting this job.
> -	 */
> -	struct xarray deps;
> -	unsigned long last_dep;
> -
>  	/* Hw fence, which is created when the scheduler executes the job, and
>  	 * is signaled when the hw finishes (via seqno write from cmdstream)
>  	 */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 96cea0ba4cfd..fb5a2eab27a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> -
>  	kref_init(&submit->ref);
>  	submit->dev = dev;
>  	submit->aspace = queue->ctx->aspace;
> @@ -72,8 +70,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>  {
>  	struct msm_gem_submit *submit =
>  			container_of(kref, struct msm_gem_submit, ref);
> -	unsigned long index;
> -	struct dma_fence *fence;
>  	unsigned i;
>  
>  	if (submit->fence_id) {
> @@ -82,12 +78,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>  		mutex_unlock(&submit->queue->lock);
>  	}
>  
> -	xa_for_each (&submit->deps, index, fence) {
> -		dma_fence_put(fence);
> -	}
> -
> -	xa_destroy(&submit->deps);
> -
>  	dma_fence_put(submit->user_fence);
>  	dma_fence_put(submit->hw_fence);
>  
> @@ -343,8 +333,9 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  		if (no_implicit)
>  			continue;
>  
> -		ret = drm_gem_fence_array_add_implicit(&submit->deps, obj,
> -			write);
> +		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> +							      obj,
> +							      write);
>  		if (ret)
>  			break;
>  	}
> @@ -588,7 +579,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>  		if (ret)
>  			break;
>  
> -		ret = drm_gem_fence_array_add(&submit->deps, fence);
> +		ret = drm_sched_job_add_dependency(&submit->base, fence);
>  		if (ret)
>  			break;
>  
> @@ -798,7 +789,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  			goto out_unlock;
>  		}
>  
> -		ret = drm_gem_fence_array_add(&submit->deps, in_fence);
> +		ret = drm_sched_job_add_dependency(&submit->base, in_fence);
>  		if (ret)
>  			goto out_unlock;
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index bd54c1412649..652b1dedd7c1 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -11,17 +11,6 @@ static uint num_hw_submissions = 8;
>  MODULE_PARM_DESC(num_hw_submissions, "The max # of jobs to write into ringbuffer (default 8)");
>  module_param(num_hw_submissions, uint, 0600);
>  
> -static struct dma_fence *msm_job_dependency(struct drm_sched_job *job,
> -		struct drm_sched_entity *s_entity)
> -{
> -	struct msm_gem_submit *submit = to_msm_submit(job);
> -
> -	if (!xa_empty(&submit->deps))
> -		return xa_erase(&submit->deps, submit->last_dep++);
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>  {
>  	struct msm_gem_submit *submit = to_msm_submit(job);
> @@ -52,7 +41,6 @@ static void msm_job_free(struct drm_sched_job *job)
>  }
>  
>  const struct drm_sched_backend_ops msm_sched_ops = {
> -	.dependency = msm_job_dependency,
>  	.run_job = msm_job_run,
>  	.free_job = msm_job_free
>  };
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
