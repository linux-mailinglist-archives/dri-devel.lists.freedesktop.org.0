Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA64EB11B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 17:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6860310E8BB;
	Tue, 29 Mar 2022 15:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BBC10E8BB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:56:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u16so25491538wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Jpy7qEo72qvLq2cMDRf4IXEkvf+VvciVSlHB7gUXwXs=;
 b=b7JG2iiGnEzAnMJ5gsB2xhSTJKcP94u9ctY0arL2PX7KV/MoNB8bEtGQJ0Bdec5Ifc
 Sb9a4OU8Au2SXpB/fk4y3Ky8HEeZahbQ+SeWUZcd8zlEWpxtY+Z/EfvPY4zBTjMJaYDM
 Jlulc3HQQ/6Ma2p/oWbfMvSUhcXiZDnifTlWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Jpy7qEo72qvLq2cMDRf4IXEkvf+VvciVSlHB7gUXwXs=;
 b=rrDzMOX8rDIflaiHRTLHA2EsAWjMYeVlDVcl8jwFly9zGB6PZBHEAQlVb1/9APCrGO
 QTHsHkVD+rP6ILgcf2eIlRvPwbHiZM9DH8gBYBfkcWN99QzvplqNa/SICBfgl/hgNu7o
 RcWkQqxatzFncP74trT5jcvOAObtJG1Ww71X1IJ4VavKGNPFAKPK2LSDKGv9TqhKRsqE
 3naaOEkYo9y+WqWQRKESDVz1Y2jY8Vj+yevS2UoLmr90yagfMCoo3uRBxH5y0Hi+x8YV
 kahCTdlIGbhRJ9pik2gJDaBMDz7YhTQMt9cvDZq9gJyp+ohHUxDk/XTr27ZVzrxCrxM7
 jG6Q==
X-Gm-Message-State: AOAM531MjvCRx4iQnQuHQ+nySOhLPcSgBNkTUmnNoRHA+XhqVR/Yid+A
 rvMHiWVK0+Vsm1zRGz7QG9qWlA==
X-Google-Smtp-Source: ABdhPJyUvI2Qtf/0CGmo4WBKlIVfRgiGLvV3DKZ3c1n8WWjU9jS1SJdtE031R2j3nz2C8SIfU2tp7w==
X-Received: by 2002:a05:6000:1c17:b0:205:9806:8960 with SMTP id
 ba23-20020a0560001c1700b0020598068960mr30417290wrb.605.1648569408514; 
 Tue, 29 Mar 2022 08:56:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm2540288wma.21.2022.03.29.08.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:56:47 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:56:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 21/23] dma-buf: wait for map to complete for static
 attachments
Message-ID: <YkMsPUuyXU2bB3ma@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-21-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-21-christian.koenig@amd.com>
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

On Mon, Mar 21, 2022 at 02:58:54PM +0100, Christian König wrote:
> We have previously done that in the individual drivers but it is
> more defensive to move that into the common code.
> 
> Dynamic attachments should wait for map operations to complete by themselves.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

You could perhaps ditch the call to i915_gem_object_wait_migration() in
the i915 dma-buf code too with this, but that entire thing is a bit a mess
and totally different. So I guess we'll leave that.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
> index 579adfafe4d0..782cbca37538 100644
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
