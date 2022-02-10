Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCCD4B1208
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 16:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573810E89C;
	Thu, 10 Feb 2022 15:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA3EB10E89C;
 Thu, 10 Feb 2022 15:48:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F089D6E;
 Thu, 10 Feb 2022 07:48:49 -0800 (PST)
Received: from [10.57.38.35] (unknown [10.57.38.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3B53F718;
 Thu, 10 Feb 2022 07:48:46 -0800 (PST)
Message-ID: <c5077902-2602-6ebb-802a-aad4ce0153c3@arm.com>
Date: Thu, 10 Feb 2022 15:48:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm/gem-shmem: Set vm_ops in static initializer
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 yuq825@gmail.com, robh@kernel.org, tomeu.vizoso@collabora.com,
 alyssa.rosenzweig@collabora.com, emma@anholt.net, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com
References: <20220209155634.3994-1-tzimmermann@suse.de>
 <20220209155634.3994-2-tzimmermann@suse.de>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220209155634.3994-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2022 15:56, Thomas Zimmermann wrote:
> Initialize default vm_ops in static initialization of the GEM SHMEM funcs,
> instead of the mmap code. It's simply better style. GEM helpers will later
> set a VMA's vm_ops from the default automatically.
> 
> v2:
> 	* also update the drivers that build upon GEM SHMEM
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 5 +++--
>  drivers/gpu/drm/lima/lima_gem.c         | 1 +
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
>  drivers/gpu/drm/v3d/v3d_bo.c            | 1 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  include/drm/drm_gem_shmem_helper.h      | 2 ++
>  6 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 621924116eb4..5991a22a9e22 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
>  static struct drm_gem_shmem_object *
> @@ -585,11 +586,12 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  	drm_gem_vm_close(vma);
>  }
>  
> -static const struct vm_operations_struct drm_gem_shmem_vm_ops = {
> +const struct vm_operations_struct drm_gem_shmem_vm_ops = {
>  	.fault = drm_gem_shmem_fault,
>  	.open = drm_gem_shmem_vm_open,
>  	.close = drm_gem_shmem_vm_close,
>  };
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
>  
>  /**
>   * drm_gem_shmem_mmap - Memory-map a shmem GEM object
> @@ -625,7 +627,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	if (shmem->map_wc)
>  		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -	vma->vm_ops = &drm_gem_shmem_vm_ops;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index f9a9198ef198..6a6f6f2ead75 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -213,6 +213,7 @@ static const struct drm_gem_object_funcs lima_gem_funcs = {
>  	.vmap = lima_gem_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = lima_gem_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
>  struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t size)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index ead65f5fa2bc..293e799e2fe8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -206,6 +206,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 6e3113f419f4..8b3229a37c6d 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -59,6 +59,7 @@ static const struct drm_gem_object_funcs v3d_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
>  /* gem_create_object function for allocating a BO struct and doing
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index baef2c5f2aaf..f293e6ad52da 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -124,6 +124,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
>  bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 311d66c9cf4b..08e7846e8abc 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -135,6 +135,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);
>  
> +extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
> +
>  /*
>   * GEM object functions
>   */

