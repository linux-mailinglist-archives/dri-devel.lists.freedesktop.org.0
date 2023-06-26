Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D473E36F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DEE10E22F;
	Mon, 26 Jun 2023 15:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0640810E231
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:34:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6580D660707F;
 Mon, 26 Jun 2023 16:34:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687793695;
 bh=J7lmOjSg+gFycV22F6horQT3WCP26a6Ibw43q7Hu7+A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SaQuQUWyAmBVhTML+3p5pir6MU6iH48HVgFd1ZeowDytyTaXe2l1hMMYmffmNpirF
 zQ+SFF9WQo/EFVWZOZ/LBM/AeaMvRCpNFO93nQDGRQa38SfKbPwcR/UyeamPxzh4aI
 PXPTR99dLxgzD94v8WVkhPMDwjlEDfIpOhJ4p/+uAZt0/MmPoSImAQTV15bG7kpsdn
 +/ea62dnJwQ8s95+QwLcMw67Vipyd4A7aZFURJug9hg3xC9RczrAvc//oGefRa7CGo
 dh4f+e3vhxJMGOF/C0Svg4x7+SfVMDkKp2+LArUf0xDRRvEi5FdoBuit5oFoqVprzg
 sHbJqTNvEzXJA==
Date: Mon, 26 Jun 2023 17:34:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/shmem-helper: Inline
 drm_gem_shmem_{get,put}_pages()
Message-ID: <20230626173452.153441f3@collabora.com>
In-Reply-To: <20230626120247.1337962-4-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
 <20230626120247.1337962-4-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jun 2023 14:02:45 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Move code drm_gem_shmem_{get,put}_pages() code to
> drm_gem_shmem_{pin,unpin}_locked().

After having a closer look at 'Add generic memory shrinker to VirtIO-GPU
and  Panfrost DRM drivers', I realize that's not what we want. We must
differentiate hard-pinning (as in, can't be evicted until all users
give up the ref they have) and soft-pinning (users can survive a
swapout, basically userspace mappings created through
drm_gem_shmem_mmap()).

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 108 ++++++++++---------------
>  1 file changed, 41 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d6fc034164c0..f406556e42e0 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -128,46 +128,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>  
> -static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
> -
> -/**
> - * drm_gem_shmem_free - Free resources associated with a shmem GEM object
> - * @shmem: shmem GEM object to free
> - *
> - * This function cleans up the GEM object state and frees the memory used to
> - * store the object itself.
> - */
> -void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> -{
> -	struct drm_gem_object *obj = &shmem->base;
> -
> -	if (obj->import_attach) {
> -		drm_prime_gem_destroy(obj, shmem->sgt);
> -	} else {
> -		dma_resv_lock(shmem->base.resv, NULL);
> -
> -		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> -
> -		if (shmem->sgt) {
> -			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
> -					  DMA_BIDIRECTIONAL, 0);
> -			sg_free_table(shmem->sgt);
> -			kfree(shmem->sgt);
> -		}
> -		if (shmem->pages)
> -			drm_gem_shmem_put_pages(shmem);
> -
> -		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> -
> -		dma_resv_unlock(shmem->base.resv);
> -	}
> -
> -	drm_gem_object_release(obj);
> -	kfree(shmem);
> -}
> -EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
> -
> -static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct page **pages;
> @@ -200,13 +161,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  	return 0;
>  }
>  
> -/*
> - * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
> - * @shmem: shmem GEM object
> - *
> - * This function decreases the use count and puts the backing pages when use drops to zero.
> - */
> -static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  
> @@ -229,23 +184,42 @@ static void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  	shmem->pages = NULL;
>  }
>  
> -static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
> +/**
> + * drm_gem_shmem_free - Free resources associated with a shmem GEM object
> + * @shmem: shmem GEM object to free
> + *
> + * This function cleans up the GEM object state and frees the memory used to
> + * store the object itself.
> + */
> +void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  {
> -	int ret;
> +	struct drm_gem_object *obj = &shmem->base;
>  
> -	dma_resv_assert_held(shmem->base.resv);
> +	if (obj->import_attach) {
> +		drm_prime_gem_destroy(obj, shmem->sgt);
> +	} else {
> +		dma_resv_lock(shmem->base.resv, NULL);
>  
> -	ret = drm_gem_shmem_get_pages(shmem);
> +		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
>  
> -	return ret;
> -}
> -
> -static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> -{
> -	dma_resv_assert_held(shmem->base.resv);
> -
> -	drm_gem_shmem_put_pages(shmem);
> +		if (shmem->sgt) {
> +			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
> +					  DMA_BIDIRECTIONAL, 0);
> +			sg_free_table(shmem->sgt);
> +			kfree(shmem->sgt);
> +		}
> +		if (shmem->pages)
> +			drm_gem_shmem_unpin_locked(shmem);
> +
> +		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> +
> +		dma_resv_unlock(shmem->base.resv);
> +	}
> +
> +	drm_gem_object_release(obj);
> +	kfree(shmem);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
>  
>  /**
>   * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
> @@ -332,7 +306,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>  			return 0;
>  		}
>  
> -		ret = drm_gem_shmem_get_pages(shmem);
> +		ret = drm_gem_shmem_pin_locked(shmem);
>  		if (ret)
>  			goto err_zero_use;
>  
> @@ -355,7 +329,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>  
>  err_put_pages:
>  	if (!obj->import_attach)
> -		drm_gem_shmem_put_pages(shmem);
> +		drm_gem_shmem_unpin_locked(shmem);
>  err_zero_use:
>  	shmem->vmap_use_count = 0;
>  
> @@ -392,7 +366,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>  			return;
>  
>  		vunmap(shmem->vaddr);
> -		drm_gem_shmem_put_pages(shmem);
> +		drm_gem_shmem_unpin_locked(shmem);
>  	}
>  
>  	shmem->vaddr = NULL;
> @@ -452,7 +426,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>  	kfree(shmem->sgt);
>  	shmem->sgt = NULL;
>  
> -	drm_gem_shmem_put_pages(shmem);
> +	drm_gem_shmem_unpin_locked(shmem);
>  
>  	shmem->madv = -1;
>  
> @@ -565,7 +539,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>  
>  	dma_resv_lock(shmem->base.resv, NULL);
> -	drm_gem_shmem_put_pages(shmem);
> +	drm_gem_shmem_unpin_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
>  
>  	drm_gem_vm_close(vma);
> @@ -606,7 +580,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  	}
>  
>  	dma_resv_lock(shmem->base.resv, NULL);
> -	ret = drm_gem_shmem_get_pages(shmem);
> +	ret = drm_gem_shmem_pin_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
>  
>  	if (ret)
> @@ -674,7 +648,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> -	ret = drm_gem_shmem_get_pages(shmem);
> +	ret = drm_gem_shmem_pin_locked(shmem);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -696,7 +670,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  	sg_free_table(sgt);
>  	kfree(sgt);
>  err_put_pages:
> -	drm_gem_shmem_put_pages(shmem);
> +	drm_gem_shmem_unpin_locked(shmem);
>  	return ERR_PTR(ret);
>  }
>  

