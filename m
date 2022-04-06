Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412764F5E5C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFD810EC80;
	Wed,  6 Apr 2022 12:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D85410EC73
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:47:02 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id dr20so4007082ejc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X6x4Az2kT2VG/NCa/mKNg4kGyhUn2cFFs6juVvaB8sk=;
 b=GOeha7t5d0gkkMUhTZN06oY3LxN5ToZpfnrHzRliXh08qid6yBs1isuILIHs7MMtCp
 JivLWRVghlWm6hxbKIj3U5dESzN9NHd7JS7jkSvdF5u+3XC/vHTZVLE+Zp0ar/o5P5f8
 EzrRjWjvUhO+ehutXb+RZuCP6e9xfQD295BBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X6x4Az2kT2VG/NCa/mKNg4kGyhUn2cFFs6juVvaB8sk=;
 b=lCcw4lwmGotg9wxz5VV8X1+1bCWhH7Z7KnSRX/cNY3/AUrmxhayNYVoPnRnahx19iZ
 alRCVMf3E+I6Fp5zda7MywSPefeO6np8t5Yc1PMnjdvp0NQyk2EK4wyQXNMSJnE2bRsk
 L7z7CNgRaFFiDzSl8Ye+6TGvj8PHKeuhVSXeKwS6EqAV/2ICcRsueCG/LMV3i2DNf0yx
 EvnswmL2YzMCkRk8c6IVUGU0zhdftkz7v+rNXuzwbfM8ypCBsf10nxeMFOHnEgTPk8/K
 3IJknc/keBB07PdgPV0FpdBcFccmRoOZCi124lrFLP0ar+5HuGljLr/21IlCIUgyZv+/
 Ssvw==
X-Gm-Message-State: AOAM530PgyWyaU9kORv5WV6TOxMgnOQVu7C5mUHYIMGGXzrSFvzh0PxI
 QGvQYziwjbmkiv9+7Fqktye4rQ==
X-Google-Smtp-Source: ABdhPJwytQ9k1b0JEJ97AzLy8opeVvJV0aMawoHMZAlmV2zhz/LUz+8E54Va/Rd6ng0q6HIaOBUdvg==
X-Received: by 2002:a17:906:c0c9:b0:6db:207:c41f with SMTP id
 bn9-20020a170906c0c900b006db0207c41fmr8302265ejb.292.1649249220584; 
 Wed, 06 Apr 2022 05:47:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm4915570edj.68.2022.04.06.05.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:47:00 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:46:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 08/16] drm/etnaviv: always wait for kernel fences
Message-ID: <Yk2LwlWJkSebt21o@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-9-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:24AM +0200, Christian König wrote:
> Even for explicit synchronization we should wait for kernel fences.

Yeah I don't think this patch makes much sense, because aside from etnaviv
there's also msm and lima which allow you to ignore all dma_resv fences
completely.

But it's also not an issue because these drivers don't move buffers, don't
have any other kernel fences and also don't do dynamic importing. I think
the real fix is replacing the write argument to
drm_sched_job_add_implicit_dependencies with dma_resv_usage and rolling
that out.

I'd just drop this for now, seems like a detour.
-Daniel

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 27 ++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 98bb5c9239de..3fedd29732d5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -171,6 +171,26 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
>  	return ret;
>  }
>  
> +/* TODO: This should be moved into the GPU scheduler if others need it */
> +static int submit_fence_kernel_sync(struct etnaviv_gem_submit *submit,
> +				    struct dma_resv *resv)
> +{
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_KERNEL, fence) {
> +		/* Make sure to grab an additional ref on the added fence */
> +		dma_fence_get(fence);
> +		ret = drm_sched_job_add_dependency(&submit->sched_job, fence);
> +		if (ret) {
> +			dma_fence_put(fence);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  {
>  	int i, ret = 0;
> @@ -183,8 +203,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		if (ret)
>  			return ret;
>  
> -		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> -			continue;
> +		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT) {
> +			ret = submit_fence_kernel_sync(submit, robj);
> +			if (ret)
> +				return ret;
> +		}
>  
>  		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
>  							      &bo->obj->base,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
