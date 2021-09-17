Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AF40FACC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5B86ED26;
	Fri, 17 Sep 2021 14:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358C26EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:52:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v5so30612810edc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4qS+tt3C0ZYNclfI1pgK07MNXYZAOvx318h8HoEwcCo=;
 b=M63t4yL9jhyjtLRv25j1Pdh3L7uyIp0PM0PgJt617pbRTm5S2so9t1OyjSB7OhXujz
 isPuBItyjFDPMWD0mdzKWkDjHZMfLlS4QjQF+ljDB0fa3DORQ7+vYZOOxJBQEqLZnjkQ
 cvlJwZ33rt3pXoBKRVaLkWC3v00VVpAnM4NJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4qS+tt3C0ZYNclfI1pgK07MNXYZAOvx318h8HoEwcCo=;
 b=1GMe4SmjFKkFKE1TQ1hIpBqKT6ZBRWEvAlivBvh78/216zctDlrXAv+LxnxgBhg0Yy
 HQ8jRqRivxpQzjc0rEqfGdp2lEz3KgEX4YFbR+A74VI2Nx8M4trQQZbXf90KbgUeTJxS
 41qOo+ngvsWlaLEhZb5igQ4gtEY1Q5EUEUyd/m5LcD8AAFfmbXj/rt38MED5B58NHdyP
 zSKR8w0tt6G/Plh5+YrDHJEWIl5xH5smfQc9hd0WZ2J0Jq6bb1LZOO6tro3Au2Jo2SG5
 qgIL7HxBRAIzyo6a8USADI0Kjj0JL6rB9DzvhOA84JCjDWPqgtX5M9syk7EYyaQ0TM5p
 QrbQ==
X-Gm-Message-State: AOAM533ATNosC+ZJ0K+nzrZ87YZ6tfJf61x+qIpmUD+vF6G8RAu/ds3P
 ONz6xhGaCdrR5732cQn2ou2EHw==
X-Google-Smtp-Source: ABdhPJxeDJzAFZPXsUaCi7oxKwLot8V1c/M4K6oO/Es12uIBRQqDR7eOJksrtVTsBbZW+ZgscxxfPg==
X-Received: by 2002:a50:fa89:: with SMTP id w9mr13216244edr.113.1631890346738; 
 Fri, 17 Sep 2021 07:52:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w5sm2424958ejz.25.2021.09.17.07.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:52:26 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:52:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Message-ID: <YUSrqLa5IoXuxS1y@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-13-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-13-christian.koenig@amd.com>
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

On Fri, Sep 17, 2021 at 02:34:59PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: use dma_resv_for_each_fence
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 042c16b5d54a..5bc5f775abe1 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  					    struct drm_gem_object *obj,
>  					    bool write)
>  {
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_sched_job_add_dependency(job, fence);
> -	}
> -
> -	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
>  
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_sched_job_add_dependency(job, fences[i]);
> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {

Hah I got tricked reading your 2nd patch, the iter_begin() is included and
we don't need iter_end for this. Please correct my comments for patch 2
:-)

On this as-is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		ret = drm_sched_job_add_dependency(job, fence);
>  		if (ret)
> -			break;
> +			return ret;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
