Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2E4F5E5D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608C10EC3A;
	Wed,  6 Apr 2022 12:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6D010EC3A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:47:45 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id l26so4072855ejx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=y8bPqel3ouGR/I60k5zZQFZK4ZbAX5R9rEUcGjAA9U8=;
 b=irVZwy/8aWeLmnpSqmiuC05P+LEvhyCKWRm+0ZOL5PjAw7UvMdtm+XfUaVq+6/inDi
 jMmOmoe+s1nIiAHFCK30O3jZ+ebEz+SN01Jgue4iKxKeHf8Pl438zGaOvlVuzSXayacV
 fGenwC3WxFXjhw+dLdtR/b2bLqXLGO7xCalzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=y8bPqel3ouGR/I60k5zZQFZK4ZbAX5R9rEUcGjAA9U8=;
 b=qm6Gg2BK60DxxgzJEEwKZO6npHZ+x26NTPO+n4meYDA5iEfl+Urk/j8fMV7nWBT6sg
 UEQH4rH150uwnv13Zz5Q4HkI+LOAzV29Wua4jDtUC7KV3qzCG3BDIgIT0xlIadxNUfeo
 JLAOrY7vcvt/O9PT+BRsTRtd4l17+vfTvSKC9Sc3JZnZG/+lnR35Qh4rRb5AzC3zLqaL
 EKAMqSqD+xSpkFizHOey8mBazzBrV8HkRUfQ3L2b7p/wzibl4C1L1YxLfdaSQXczLwVP
 GGfPAFWAJbhr42P7TTCp3CkL/glbN34tF+Tw9TJZN7YO2QbFzIl4saeZHXa9ascrubpG
 3slQ==
X-Gm-Message-State: AOAM532/RPkh4rmw4CQQk09/dgJ0N8CQaCzN4KHb3rmNVOaJSMeS655Y
 55MF6SPRD2PHVtznhEl0zGzeLOIKMSmhxaEhRTg=
X-Google-Smtp-Source: ABdhPJyiwBxZZCdR3lrN3TgjHcVGI+0MYC9d940g1zpt/300SoFO/rCJsqMUpCar8VLfxl208c2ebA==
X-Received: by 2002:a17:906:d54e:b0:6db:b241:c0e2 with SMTP id
 cr14-20020a170906d54e00b006dbb241c0e2mr8006110ejc.724.1649249264404; 
 Wed, 06 Apr 2022 05:47:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b006e1382b8192sm6647708ejc.147.2022.04.06.05.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:47:43 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:47:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 09/16] drm/nouveau: only wait for kernel fences in
 nouveau_bo_vm_cleanup
Message-ID: <Yk2L7oW/ypvwtF7I@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-10-christian.koenig@amd.com>
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

On Wed, Apr 06, 2022 at 09:51:25AM +0200, Christian König wrote:
> Don't wait for user space submissions. I'm not 100% sure if that is
> correct, but it seems to match what the code initially intended.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I'll let nouveau folks review/test this one.
-Daniel
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 05076e530e7d..13deb6c70ba6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -962,10 +962,10 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  	struct dma_fence *fence;
>  	int ret;
>  
> -	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRITE,
> +	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_KERNEL,
>  				     &fence);
>  	if (ret)
> -		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE,
> +		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL,
>  				      false, MAX_SCHEDULE_TIMEOUT);
>  
>  	nv10_bo_put_tile_region(dev, *old_tile, fence);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
