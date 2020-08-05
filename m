Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7F23C85F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BA89C52;
	Wed,  5 Aug 2020 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3A89C52
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 08:57:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r4so36924780wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u0WXg0fql4NtmBvzcobqjRanTf6dmWM1fMI6witD8II=;
 b=Tyn3qK8SDI9529oYSblNH5wRfCgKk5p1MR8Q3JYSsTlaIOBx4+TCBBXFTJNownl1EW
 /RFBM0odYGuuaeLlg6cgr5KaxZcd3eiW5nZ32ycNXA8MIVaqdqVawS9/O8auKLjt1ttJ
 d9PIQPHXg+EK9Clw8nxBBLWELQTBXUwUxPbgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u0WXg0fql4NtmBvzcobqjRanTf6dmWM1fMI6witD8II=;
 b=lWQY0RnLLbKDhWujd5L0aqNCDA944lVa2E94fQTTjHa5galhuLQmuirIgGJmEpY/3b
 laC01HRGHMYzZKvEow3iulNRleyi84lIqYF1v5HoEBA8nrWztSXzvPT0B0c5wbn3JLZe
 0scZWiDOjpYS6BDDgNb3todTeE4zr1zN1MEtc7SnQ8sEHYeItA0TUhr/4l1qlwxyWh9m
 1M7GLaKVcrausX4e9NyiY3+cuuVZ1X1UNhQbqXMQvzS2IvQXjSGLJ0+nI57NZaROCPEJ
 qwKvA3hAXvIi28YkxNEASbJdF9/F2OHgnV1DYwBcbdX4bxzMn3cXsaGRAao3CI/T9XgB
 DEMg==
X-Gm-Message-State: AOAM53075jBWrJB03sEbR1nZHYDf2vuK3/HlL82mWLBIn46K1yuHCGQC
 Ab41Ir4tfdvNFFjLoQui+0jhbpqKV0E=
X-Google-Smtp-Source: ABdhPJw4URSWKuzYlXCjakBgGryvNVNvBn/NyH6KfYxf6dpW7iJjiaK/hf5jsvVWmL26D97tR+ZUxA==
X-Received: by 2002:adf:f8c7:: with SMTP id f7mr1989520wrq.117.1596617843781; 
 Wed, 05 Aug 2020 01:57:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z66sm1838539wme.16.2020.08.05.01.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 01:57:22 -0700 (PDT)
Date: Wed, 5 Aug 2020 10:57:20 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 20/59] drm/vmwgfx/ttm: convert vram mm init to new code
 paths
Message-ID: <20200805085720.GX6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-21-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-21-airlied@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:55:53PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Split out the vram thp init path vs the range manager init.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 25 +++++++++++++++++++------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  4 +---
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 12 ++++++++----
>  3 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 1e4c2c6119c3..5a889df2de03 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -620,6 +620,23 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
>  	return ret;
>  }
>  
> +static int vmw_vram_manager_init(struct vmw_private *dev_priv)
> +{
> +	int ret;
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	ret = vmw_thp_init(dev_priv);
> +#else
> +	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
> +
> +	man->available_caching = TTM_PL_FLAG_CACHED;
> +	man->default_caching = TTM_PL_FLAG_CACHED;
> +
> +	ret = ttm_range_man_init(&dev_priv->bdev, man,
> +				 dev_priv->vram_size >> PAGE_SHIFT);
> +#endif

The ifdeffery here looks a bit funny, but not really less convoluted than
the old one I think.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
> +	return ret;
> +}
>  static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  {
>  	struct vmw_private *dev_priv;
> @@ -866,16 +883,12 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  	 * Enable VRAM, but initially don't use it until SVGA is enabled and
>  	 * unhidden.
>  	 */
> -	dev_priv->bdev.man[TTM_PL_VRAM].func = &vmw_thp_func;
> -	dev_priv->bdev.man[TTM_PL_VRAM].available_caching = TTM_PL_FLAG_CACHED;
> -	dev_priv->bdev.man[TTM_PL_VRAM].default_caching = TTM_PL_FLAG_CACHED;
> -	ret = ttm_bo_init_mm(&dev_priv->bdev, TTM_PL_VRAM,
> -			     (dev_priv->vram_size >> PAGE_SHIFT));
> +
> +	ret = vmw_vram_manager_init(dev_priv);
>  	if (unlikely(ret != 0)) {
>  		DRM_ERROR("Failed initializing memory manager for VRAM.\n");
>  		goto out_no_vram;
>  	}
> -	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
>  
>  	/*
>  	 * "Guest Memory Regions" is an aperture like feature with
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 65c414f119c0..10b681725a53 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1520,9 +1520,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>  
>  /* Transparent hugepage support - vmwgfx_thp.c */
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -extern const struct ttm_mem_type_manager_func vmw_thp_func;
> -#else
> -#define vmw_thp_func ttm_bo_manager_func
> +extern int vmw_thp_init(struct vmw_private *dev_priv);
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index b7c816ba7166..0292c931c265 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -115,18 +115,23 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
>  	}
>  }
>  
> -static int vmw_thp_init(struct ttm_mem_type_manager *man,
> -			unsigned long p_size)
> +int vmw_thp_init(struct vmw_private *dev_priv)
>  {
> +	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
>  	struct vmw_thp_manager *rman;
> +	man->available_caching = TTM_PL_FLAG_CACHED;
> +	man->default_caching = TTM_PL_FLAG_CACHED;
>  
> +	ttm_mem_type_manager_init(&dev_priv->bdev, man,
> +				  dev_priv->vram_size >> PAGE_SHIFT);
>  	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
>  	if (!rman)
>  		return -ENOMEM;
>  
> -	drm_mm_init(&rman->mm, 0, p_size);
> +	drm_mm_init(&rman->mm, 0, man->size);
>  	spin_lock_init(&rman->lock);
>  	man->priv = rman;
> +	ttm_mem_type_manager_set_used(man, true);
>  	return 0;
>  }
>  
> @@ -158,7 +163,6 @@ static void vmw_thp_debug(struct ttm_mem_type_manager *man,
>  }
>  
>  const struct ttm_mem_type_manager_func vmw_thp_func = {
> -	.init = vmw_thp_init,
>  	.takedown = vmw_thp_takedown,
>  	.get_node = vmw_thp_get_node,
>  	.put_node = vmw_thp_put_node,
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
