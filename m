Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6347D93F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9360410E3B5;
	Wed, 22 Dec 2021 22:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C554610E3B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 22:16:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id m21so15238551edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 14:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qn3Kr7lwo/HmIS7CT1SZpGORblvbCZjF3DCsOFJIw0k=;
 b=amKcvCF94UWnfTHSP4DC6weXfDeKQ2QhYVovHBg/7kgUIwS/XowllL6BO5jIu1uQop
 Fsml8H/b3l7JdoFbQ0ttVuWRPl8uB92SLGAIfnEZLjQcRJgt0IlK1hxVjz+0cF1/XWYU
 zweVC2NF64fygCnd31BQ925DOg3B2fC6I+Dvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qn3Kr7lwo/HmIS7CT1SZpGORblvbCZjF3DCsOFJIw0k=;
 b=kjcAXlHelCOgIQNNQKLCDizbokZ2fVv96001xVwzH/plj35yVMtxM9Lk4/Uy8PgXYy
 uHIHnxiuX7chSJWX6q+G7n7d0SrZb/n28Cq0uOjl/Oh0cgAlx0LcyUL1JYe234YLtbXe
 3+sCif9cyG6HlZ9WEwqleGpIeH1sPRd/3Jzr6Rr1Z1N6SoEw3VwlUfIq7GjUHhJMR+O8
 M1XhUViffvWipIydkQuMde+EtedOmo/b0CCtLFqgLRbQ9LBPUQW+R/i7+VB1awdB0+EY
 B970dcRx2fLOpToeGnLpHYWsyPEA6vPFB70+7ZJ06wF6d9F5zZxbufIrKPCQu8znwXFH
 ilWA==
X-Gm-Message-State: AOAM531WSSYQcZISbg9u1uGreZvPcfwYNsyDvz3wUPFAW9rlRN92qyDa
 VojomDTfplzCI75a7eQJbRHw3LmDn3ZQdw==
X-Google-Smtp-Source: ABdhPJysfWQvc+5y7RJmM97CZu2nix48A7rrE9PR2yJ25iK1G4dgfGKhqC0BOmxh0bBQuh3OaD2vsw==
X-Received: by 2002:aa7:ce0c:: with SMTP id d12mr4667871edv.88.1640211387379; 
 Wed, 22 Dec 2021 14:16:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id sb13sm1141150ejc.26.2021.12.22.14.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:16:26 -0800 (PST)
Date: Wed, 22 Dec 2021 23:16:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 22/24] dma-buf: wait for map to complete for static
 attachments
Message-ID: <YcOjuWx+yPl7Jx5s@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-23-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-23-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:34:09PM +0100, Christian König wrote:
> We have previously done that in the individual drivers but it is
> more defensive to move that into the common code.
> 
> Dynamic attachments should wait for map operations to complete by themselves.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

i915 should probably stop reinveinting so much stuff here and align more
...

I do wonder whether we want the same for dma_buf_pin(), or at least
document that for dynamic attachments, you still need to sync even if it's
pinned. Especially since your kerneldoc for the usage flags suggests that
waiting isn't needed, but after this patch waiting _is_ needed even for
dynamic importers.

So there is a gap here I think, and I deleted my r-b tag that I already
typed again. Or do I miss something?

Minimally needs accurate docs, but I'm leaning towards an unconditional
dma_resv_wait() in dma_buf_pin() for safety's sake.


> ---
>  drivers/dma-buf/dma-buf.c                   | 18 +++++++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +-------------
>  drivers/gpu/drm/nouveau/nouveau_prime.c     | 17 +----------------
>  drivers/gpu/drm/radeon/radeon_prime.c       | 16 +++-------------
>  4 files changed, 20 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 528983d3ba64..d3dd602c4753 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -660,12 +660,24 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>  				       enum dma_data_direction direction)
>  {
>  	struct sg_table *sg_table;
> +	signed long ret;
>  
>  	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> +	if (IS_ERR_OR_NULL(sg_table))
> +		return sg_table;
> +
> +	if (!dma_buf_attachment_is_dynamic(attach)) {
> +		ret = dma_resv_wait_timeout(attach->dmabuf->resv,

Another place where this dma_resv_wait() wrapper would be good. I think we
should have it :-)

Cheers, Daniel

> +					    DMA_RESV_USAGE_KERNEL, true,
> +					    MAX_SCHEDULE_TIMEOUT);
> +		if (ret < 0) {
> +			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
> +							   direction);
> +			return ERR_PTR(ret);
> +		}
> +	}
>  
> -	if (!IS_ERR_OR_NULL(sg_table))
> -		mangle_sg_table(sg_table);
> -
> +	mangle_sg_table(sg_table);
>  	return sg_table;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 4896c876ffec..33127bd56c64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -102,21 +102,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
>  	struct drm_gem_object *obj = attach->dmabuf->priv;
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> -	int r;
>  
>  	/* pin buffer into GTT */
> -	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> -	if (r)
> -		return r;
> -
> -	if (bo->tbo.moving) {
> -		r = dma_fence_wait(bo->tbo.moving, true);
> -		if (r) {
> -			amdgpu_bo_unpin(bo);
> -			return r;
> -		}
> -	}
> -	return 0;
> +	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index 60019d0532fc..347488685f74 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -93,22 +93,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>  	if (ret)
>  		return -EINVAL;
>  
> -	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
> -	if (ret)
> -		goto error;
> -
> -	if (nvbo->bo.moving)
> -		ret = dma_fence_wait(nvbo->bo.moving, true);
> -
> -	ttm_bo_unreserve(&nvbo->bo);
> -	if (ret)
> -		goto error;
> -
> -	return ret;
> -
> -error:
> -	nouveau_bo_unpin(nvbo);
> -	return ret;
> +	return 0;
>  }
>  
>  void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index 4a90807351e7..42a87948e28c 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -77,19 +77,9 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
>  
>  	/* pin buffer into GTT */
>  	ret = radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
> -	if (unlikely(ret))
> -		goto error;
> -
> -	if (bo->tbo.moving) {
> -		ret = dma_fence_wait(bo->tbo.moving, false);
> -		if (unlikely(ret)) {
> -			radeon_bo_unpin(bo);
> -			goto error;
> -		}
> -	}
> -
> -	bo->prime_shared_count++;
> -error:
> +	if (likely(ret == 0))
> +		bo->prime_shared_count++;
> +
>  	radeon_bo_unreserve(bo);
>  	return ret;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
