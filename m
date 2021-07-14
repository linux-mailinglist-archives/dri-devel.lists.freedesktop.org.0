Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5D3C8323
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 12:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4031789DC2;
	Wed, 14 Jul 2021 10:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA789DC2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 10:44:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k4so2607752wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gst1g/aj4XbnRPZ/XmjBniKfdTmZRUA9vf82aaMY07E=;
 b=kCgFbsPdSI3DUe5N+YsWgvnKrxWQk+0P+W3DenbCKJLmAV8oXE60hvgP/AWx3oGkuR
 P69CogTwbeyl4hRvQgc/X2+EQdz8RWQ5Vo5/hJxc+Dc0gIgzcl8VJB7NtKV30Ju/xYJN
 UR1hBmZ+Y3US1xSaCNtWv0CofWO2hJaBBuxGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gst1g/aj4XbnRPZ/XmjBniKfdTmZRUA9vf82aaMY07E=;
 b=qbV2XnW3WlsFCbljejlD27n9swUZXiwRAUy779CoZG2PsUR4N5FlhUSWA707fcL66H
 FQYi7x+8YZHxe2cFA0pvGK6zTs9hvz0+QK26BABIUssDyNp+g3Og0E9YNfVfrxzI6wQj
 QYogpiM6rthdmbakR+WpXjPqc7ZpVfOqTqrpA0EpfgkR7Uq++kGkOYAgGPlO5YNt9QYA
 7Mm3wO7EsUvBDPO4kTYGvSDh4haMXF1w4bGvA9Scyq68h7Eslx792flmN3kFX+8aCoIg
 xgaQWgQlox4IQpMDDAGMQ5Y4z9friAl51NUszNJ9K1lBgVUKXPE/r+d5BjNog9Hfjnp+
 dY/A==
X-Gm-Message-State: AOAM5325wS3sYDAqp41BkczIE1paAKhUqMAqH3+r/YjXR7jggbyYqUQ4
 EoUwXdPgPvbJHu/7Op8RU43Ngg==
X-Google-Smtp-Source: ABdhPJx8ojJpnZPyAxure7IucoZgIcZJieU172rjWdJQLzxsI2GqAqt4A/FgLZEboGbe4MwYKgl7bQ==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr12035663wrt.355.1626259442548; 
 Wed, 14 Jul 2021 03:44:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1694836wme.2.2021.07.14.03.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:44:02 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:44:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
Message-ID: <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712220636.475675-1-Felix.Kuehling@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 06:06:36PM -0400, Felix Kuehling wrote:
> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> is_cow_mapping returns true for these mappings. Add a check for
> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> PROT_NONE mappings.
> 
> v2: protect against mprotect making a mapping writable after the fact
> v3: update driver-specific vm_operations_structs
> 
> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

So looking at vmf_insert_pfn_prot() and the comment there we can't have
VM_PFNMAP and is_cow_mapping ever be true, or things break. On platforms
without pte_special at least.

So I'm not sure this is a great idea, and definitely not for all drivers
...

Can we clear VM_MAYWRITE instead to force this to be a non-cow mapping
instead?
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>  drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>  include/drm/ttm/ttm_bo_api.h             |  4 ++++
>  6 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index b3404c43a911..1aa750a6a5d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>  	.fault = amdgpu_gem_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>  };
>  
>  static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..164ea564bb7a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>  	.fault = nouveau_ttm_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>  };
>  
>  void
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 458f92a70887..c19ad07eb7b5 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>  	.fault = radeon_gem_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect
>  };
>  
>  static void radeon_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..fb325bad5db6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_access);
>  
> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> +		       unsigned long end, unsigned long newflags)
> +{
> +	/* Enforce no COW since would have really strange behavior with it. */
> +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> +
>  static const struct vm_operations_struct ttm_bo_vm_ops = {
>  	.fault = ttm_bo_vm_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
>  	.access = ttm_bo_vm_access,
> +	.mprotect = ttm_bo_vm_mprotect,
>  };
>  
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>  {
>  	/* Enforce no COW since would have really strange behavior with it. */
> -	if (is_cow_mapping(vma->vm_flags))
> +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>  		return -EINVAL;
>  
>  	ttm_bo_get(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> index e6b1f98ec99f..e4bf7dc99320 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>  		.fault = vmw_bo_vm_fault,
>  		.open = ttm_bo_vm_open,
>  		.close = ttm_bo_vm_close,
> +		.mprotect = ttm_bo_vm_mprotect,
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  		.huge_fault = vmw_bo_vm_huge_fault,
>  #endif
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index f681bbdbc698..40eb95875355 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>  
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  		     void *buf, int len, int write);
> +
> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> +		       unsigned long end, unsigned long newflags);
> +
>  bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>  
>  vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
