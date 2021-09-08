Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A690403E3B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613436E217;
	Wed,  8 Sep 2021 17:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616B6E217
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 17:15:22 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lc21so5630336ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jVUSNZ/yjOsKZU/61gU0KELFrpUR8RU9GpGYYCUI8fw=;
 b=ZTF/xMDBiSiUXt44478Hy9gxdnR4Cb9/ARyzMn6MoFnUXpdep6cnJRtv++Alzd5LJw
 T+LHOPQl9GksQvP1TtLyDvBIg9WswGRh4xx4ipk2hzfYdfLa+TIVxkSiLj4gS68yn/zB
 JVRdC1TC8h5c5191/AScv5TIS8inYA0b+RpdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jVUSNZ/yjOsKZU/61gU0KELFrpUR8RU9GpGYYCUI8fw=;
 b=w7nRTVIg/Tb38wK2b/zdzQ30UgYNC1gQzvQEVq5wbFB5xvWxGagj5BhJ5oJlq8wFTp
 kq6AwZm3DE/cfnbcXSdgnawOqRQpXDumImxzSf9UdH3amnZ5hn9BAjPZ9rMP1PNLyi4P
 XJ7kGaGUrRJZjVTwB4RUN2rJvy8SHaBqAJnOlEXefS+4blmNSMpXy0c0e9hhuHyCPgN1
 +6jYPC0U2qWzaCBKwgOcBTbSefOGsbMj92A7ZLF8x/7VCy5AdGDrHzQuhbfL6uivPQmD
 aC7KcCIgsKUArpaZdoUwstpeEm6NUDg1DVkZaM1LmOOJ2pVI6sgfQ51mD6AL05J7Uvd4
 I6Fw==
X-Gm-Message-State: AOAM533mpH9ix4LrmpJBXCg1E5/1kKqe0ib3wOJfPpL1XJSzorC9apzq
 CGxgtn8w4D/Ywd1mtNB2iqZuhw==
X-Google-Smtp-Source: ABdhPJwr35rNlMfIKx+ybLVBM/YfjbKCdBcYbaejUA09/5RNzZE5PE2GhLZgSqVDpzYljtORmha46g==
X-Received: by 2002:a17:906:c05a:: with SMTP id
 bm26mr941321ejb.498.1631121321019; 
 Wed, 08 Sep 2021 10:15:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id mb14sm1336354ejb.81.2021.09.08.10.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:15:20 -0700 (PDT)
Date: Wed, 8 Sep 2021 19:15:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Fix drm_sched_fence_free() so it can be
 passed an uninitialized fence
Message-ID: <YTjvpnJyXpBHCZ9T@phenom.ffwll.local>
References: <20210903120554.444101-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903120554.444101-1-boris.brezillon@collabora.com>
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

On Fri, Sep 03, 2021 at 02:05:54PM +0200, Boris Brezillon wrote:
> drm_sched_job_cleanup() will pass an uninitialized fence to
> drm_sched_fence_free(), which will cause to_drm_sched_fence() to return
> a NULL fence object, causing a NULL pointer deref when this NULL object
> is passed to kmem_cache_free().
> 
> Let's create a new drm_sched_fence_free() function that takes a
> drm_sched_fence pointer and suffix the old function with _rcu. While at
> it, complain if drm_sched_fence_free() is passed an initialized fence
> or if drm_sched_fence_free_rcu() is passed an uninitialized fence.
> 
> Fixes: dbe48d030b28 ("drm/sched: Split drm_sched_job_init")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Found while debugging another issue in panfrost causing a failure in
> the submit ioctl and exercising the error path (path that calls
> drm_sched_job_cleanup() on an unarmed job).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I already provided an irc r-b, just here for the record too.
-Daniel

> ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 29 ++++++++++++++++---------
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/gpu_scheduler.h             |  2 +-
>  3 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index db3fd1303fc4..7fd869520ef2 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -69,19 +69,28 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>  	return (const char *)fence->sched->name;
>  }
>  
> -/**
> - * drm_sched_fence_free - free up the fence memory
> - *
> - * @rcu: RCU callback head
> - *
> - * Free up the fence memory after the RCU grace period.
> - */
> -void drm_sched_fence_free(struct rcu_head *rcu)
> +static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>  {
>  	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>  	struct drm_sched_fence *fence = to_drm_sched_fence(f);
>  
> -	kmem_cache_free(sched_fence_slab, fence);
> +	if (!WARN_ON_ONCE(!fence))
> +		kmem_cache_free(sched_fence_slab, fence);
> +}
> +
> +/**
> + * drm_sched_fence_free - free up an uninitialized fence
> + *
> + * @fence: fence to free
> + *
> + * Free up the fence memory. Should only be used if drm_sched_fence_init()
> + * has not been called yet.
> + */
> +void drm_sched_fence_free(struct drm_sched_fence *fence)
> +{
> +	/* This function should not be called if the fence has been initialized. */
> +	if (!WARN_ON_ONCE(fence->sched))
> +		kmem_cache_free(sched_fence_slab, fence);
>  }
>  
>  /**
> @@ -97,7 +106,7 @@ static void drm_sched_fence_release_scheduled(struct dma_fence *f)
>  	struct drm_sched_fence *fence = to_drm_sched_fence(f);
>  
>  	dma_fence_put(fence->parent);
> -	call_rcu(&fence->finished.rcu, drm_sched_fence_free);
> +	call_rcu(&fence->finished.rcu, drm_sched_fence_free_rcu);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index fbbd3b03902f..6987d412a946 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -750,7 +750,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  		dma_fence_put(&job->s_fence->finished);
>  	} else {
>  		/* aborted job before committing to run it */
> -		drm_sched_fence_free(&job->s_fence->finished.rcu);
> +		drm_sched_fence_free(job->s_fence);
>  	}
>  
>  	job->s_fence = NULL;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7f77a455722c..f011e4c407f2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -509,7 +509,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(
>  	struct drm_sched_entity *s_entity, void *owner);
>  void drm_sched_fence_init(struct drm_sched_fence *fence,
>  			  struct drm_sched_entity *entity);
> -void drm_sched_fence_free(struct rcu_head *rcu);
> +void drm_sched_fence_free(struct drm_sched_fence *fence);
>  
>  void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>  void drm_sched_fence_finished(struct drm_sched_fence *fence);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
