Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905023C7160
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD51789E11;
	Tue, 13 Jul 2021 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63AA89E26
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:44:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v5so30554527wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nyV98/xSrdlLqXzeigMDW23vrSitIA9rS+O8hNdz0DA=;
 b=PsrrhN0QJ1vxmFWGVDZByiF87Fq5rNPmKKosIPBcQRyN8D3D92B3QjJd6Csote7zgX
 09VYhqZI+QYrMBfacueqbrcZ6aP5F/rNKDSK415NJqbfMGXk0gkYFj4o2K2bQcLrw/V2
 m8jDdsZ+kcFKvp+/2kOA+r/5VDhj3CfWWeZ5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nyV98/xSrdlLqXzeigMDW23vrSitIA9rS+O8hNdz0DA=;
 b=HqopL4UgUuJX9cUtxgLscXxkJ2pRmGCa3pshFcd8qUDEHycodf/bfuYy9Bxza+7XNg
 XxINKP3MCIz4w6CeWq3OGUj+G4lzwr0qZehItWhdQQZftUoeqa4I37A0o3cVBFXkH6Cx
 GYrgUb9bb40F3d70zI3sKBxCjqy0nFQ2Jc+IIVHC1N9Kz2kAQy8ZsLJVqmnUZaN7r1av
 tYsTUtHLNX7iH57CDtKig4p/N4MJ1o7vOq6SsTPYEaEZusL/MeakgN2T3zKXge6GQcFX
 BPgqQvPUQr4PyFbJnBbWyaq+k8s5WiuiOVqIFah3ol9ijLiwkk4+GplChsULZcWunpy+
 H2FA==
X-Gm-Message-State: AOAM531CKlS7gNVl+YO7E9TVDV4bT60p8wWkr/+AJMCUYDFHprO3ROyR
 xTTXlHGteFw0CzTVBHw+OXKGOkYdaHdMxg==
X-Google-Smtp-Source: ABdhPJxMVLc+AApJchKcylFycMbHPuEqfyY43Ai0sBS0de3tgUqRnau3oX5WgVUiBSGfBdqAyrJn/Q==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr5585928wrs.275.1626183852448; 
 Tue, 13 Jul 2021 06:44:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm10887865wru.11.2021.07.13.06.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:44:10 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:44:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/shmem-helper: Switch to vmf_insert_pfn
Message-ID: <YO2YqGyspLaDHJl9@phenom.ffwll.local>
References: <20210603164113.1433476-3-daniel.vetter@ffwll.ch>
 <20210603210831.1492251-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603210831.1492251-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 11:08:31PM +0200, Daniel Vetter wrote:
> We want to stop gup, which isn't the case if we use vmf_insert_page
> and VM_MIXEDMAP, because that does not set pte_special.
> 
> v2: With this shmem gem helpers now definitely need CONFIG_MMU (0day)
> 
> v3: add more depends on MMU. For usb drivers this is a bit awkward,
> but really it's correct: To be able to provide a contig mapping of
> buffers to userspace on !MMU platforms we'd need to use the cma
> helpers for these drivers on those platforms. As-is this wont work.
> 
> Also not exactly sure why vm_insert_page doesn't go boom, because that
> definitely wont fly in practice since the pages are non-contig to
> begin with.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Merged to drm-misc-next.

Aside, anyone feel like a review on the previous patch? Still not ready to
switch vgem over, but I think I've found the next bug that needs fixing in
shmem helpers.
-Daniel

> ---
>  drivers/gpu/drm/Kconfig                | 2 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>  drivers/gpu/drm/gud/Kconfig            | 2 +-
>  drivers/gpu/drm/tiny/Kconfig           | 4 ++--
>  drivers/gpu/drm/udl/Kconfig            | 1 +
>  5 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 56a55a6e6239..9c21527b791f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -206,7 +206,7 @@ config DRM_KMS_CMA_HELPER
>  
>  config DRM_GEM_SHMEM_HELPER
>  	bool
> -	depends on DRM
> +	depends on DRM && MMU
>  	help
>  	  Choose this if you need the GEM shmem helper functions
>  
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 6d625cee7a6a..11edd54f0580 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -542,7 +542,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	} else {
>  		page = shmem->pages[page_offset];
>  
> -		ret = vmf_insert_page(vma, vmf->address, page);
> +		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>  	}
>  
>  	mutex_unlock(&shmem->pages_lock);
> @@ -612,7 +612,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  		return ret;
>  	}
>  
> -	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
> +	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND;
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	if (shmem->map_wc)
>  		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
> index 1c8601bf4d91..9c1e61f9eec3 100644
> --- a/drivers/gpu/drm/gud/Kconfig
> +++ b/drivers/gpu/drm/gud/Kconfig
> @@ -2,7 +2,7 @@
>  
>  config DRM_GUD
>  	tristate "GUD USB Display"
> -	depends on DRM && USB
> +	depends on DRM && USB && MMU
>  	select LZ4_COMPRESS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index d46f95d9196d..a15f57ace9e7 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -31,7 +31,7 @@ config DRM_CIRRUS_QEMU
>  
>  config DRM_GM12U320
>  	tristate "GM12U320 driver for USB projectors"
> -	depends on DRM && USB
> +	depends on DRM && USB && MMU
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_SHMEM_HELPER
>  	help
> @@ -40,7 +40,7 @@ config DRM_GM12U320
>  
>  config DRM_SIMPLEDRM
>  	tristate "Simple framebuffer driver"
> -	depends on DRM
> +	depends on DRM && MMU
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	help
> diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
> index 1f497d8f1ae5..c744175c6992 100644
> --- a/drivers/gpu/drm/udl/Kconfig
> +++ b/drivers/gpu/drm/udl/Kconfig
> @@ -4,6 +4,7 @@ config DRM_UDL
>  	depends on DRM
>  	depends on USB
>  	depends on USB_ARCH_HAS_HCD
> +	depends on MMU
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	help
> -- 
> 2.31.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
