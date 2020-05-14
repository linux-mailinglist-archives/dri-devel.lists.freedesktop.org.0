Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17D1D3006
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF936EB37;
	Thu, 14 May 2020 12:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8AB6EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:40:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so3899721wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iRdEt0uWUWULnXap7eY+x8y55VAAx80JcgqWrmj1UZo=;
 b=h+sQhZtvUpzsE7u0G6pm/zL5JXYKaL1yLhWS6Pq72+Ua8pLyNowr9LdrLOVWecJILH
 az9dBoeVswk5R1w1n+RXe04kCd1yS7MtWRi54Y8YuTrnLCIcq8VF0q+hNIOKjkn5AhRo
 pNIaQJ9piDTghC5YahXX0+bgSk5XY4Nh/I060=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iRdEt0uWUWULnXap7eY+x8y55VAAx80JcgqWrmj1UZo=;
 b=s1CYRz6xM6bdKcO0VizgHS6gSH/eD0MiV4vRj8zV0tD/cO0hApnIYmkIGdHeS2e1eN
 dPwkqQNsvRn9je2qwIQ/jziebEkHCo4H/esLnlnfFEBtIm2nVZvuIdJTT4hYJm6qYBJ/
 7nIosjQXj4MvD+haiUzSvJrw5nqeCHct/UlSo/dAt/lv+bF9OOrQkqyZ8qNwkQvyvrRL
 CzigY4dvcTzdSI2mCJuxLYEkfFjlwYJtNjVfZUse/CRCRD0wU8F/LGaosh7QaXImNxjx
 Mv8djcFw+WwIZCSm3YW/HTsBQDMSVkjvDEtxRip6ahU5as+utib15xiyIFjmjGpYWz0R
 a33w==
X-Gm-Message-State: AOAM533k4L7UsvTfQ2MMNIUzio/B13bEa9ha0pOmIBF6OYwvkfhED83C
 MG6cikTCjHgcd6eM4LOkulUu0A==
X-Google-Smtp-Source: ABdhPJz0oASI+8WqTKBSjYyZe8amgwA2EPSCm0fY1U9lSM97EKc59F1D2ZH6EyRWBos0nFeJNp57PQ==
X-Received: by 2002:adf:db46:: with SMTP id f6mr5362260wrj.80.1589460053340;
 Thu, 14 May 2020 05:40:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 77sm3981346wrc.6.2020.05.14.05.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:40:52 -0700 (PDT)
Date: Thu, 14 May 2020 14:40:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
Message-ID: <20200514124050.GV206103@phenom.ffwll.local>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513150312.21421-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: sam@ravnborg.org, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 05:03:11PM +0200, Thomas Zimmermann wrote:
> SHMEM-buffer backing storage is allocated from system memory; which is
> typically cachable. Currently, only virtio uses cachable mappings; udl
> uses its own vmap/mmap implementation for cachable mappings. Other
> drivers default to writecombine mappings.

I'm pretty sure this breaks all these drivers. quick grep on a few
functions says this is used by lima, panfrost, v3d. And they definitely
need uncached/wc stuff afaiui. Or I'm completely missing something?
-Daniel

> 
> Use cached mappings by default. The exception is pages imported via
> dma-buf. DMA memory is usually not cached.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 6 ++++--
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
>  include/drm/drm_gem_shmem_helper.h      | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index df31e5782eed1..1ce90325dfa31 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -259,7 +259,7 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
>  	} else {
>  		pgprot_t prot = PAGE_KERNEL;
>  
> -		if (!shmem->map_cached)
> +		if (shmem->map_wc)
>  			prot = pgprot_writecombine(prot);
>  		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>  				    VM_MAP, prot);
> @@ -546,7 +546,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  
>  	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	if (!shmem->map_cached)
> +	if (shmem->map_wc)
>  		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>  	vma->vm_ops = &drm_gem_shmem_vm_ops;
>  
> @@ -664,6 +664,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  	if (IS_ERR(shmem))
>  		return ERR_CAST(shmem);
>  
> +	shmem->map_wc = false; /* dma-buf mappings use writecombine */
> +
>  	shmem->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
>  	if (!shmem->pages) {
>  		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 6ccbd01cd888c..80ba6b2b61668 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -132,7 +132,6 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
>  
>  	dshmem = &shmem->base.base;
>  	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
> -	dshmem->map_cached = true;
>  	return &dshmem->base;
>  }
>  
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 294b2931c4cc0..a5bc082a77c48 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -98,9 +98,9 @@ struct drm_gem_shmem_object {
>  	unsigned int vmap_use_count;
>  
>  	/**
> -	 * @map_cached: map object cached (instead of using writecombine).
> +	 * @map_wc: map object using writecombine (instead of cached).
>  	 */
> -	bool map_cached;
> +	bool map_wc;
>  };
>  
>  #define to_drm_gem_shmem_obj(obj) \
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
