Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437A1CB044F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CDA10E5CF;
	Tue,  9 Dec 2025 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUJWSEi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612610E5CF;
 Tue,  9 Dec 2025 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290318; x=1796826318;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AfvpogmHZ1KexEmvBPBIMCX4kQEuv9pvdnvyPo8Coj0=;
 b=PUJWSEi40g0mJ9uALlqtUA9vWI4lEZGmCJt4Bwegbdr64J/vOHTqvzLX
 in7/nlP1Ob9z0yqPyFyj4QipBNdDmwq6oZbyYb+iHrlXFoICU0rjAOH+m
 2pNUIkumD4gNKq1wbf7G8t88b812MsqPx4rcUlbe6vCUeYsBBxj36jj9y
 F9ZMlDh+wwvXSLsQPLUJDiShkr2gFW2AYL5k3Alq4faknObt2nwsK6/2L
 IsQlrFmSkZqRaa7WFcU884BUtuRl18AmYImsCX43iRuej5rlWb5J+1mf9
 R05ZEwRKiohqb0PDfM38ZBKFmNHl1odveJgj7Eaged764dkE9EmIk+jZh g==;
X-CSE-ConnectionGUID: y28JjAP1T2qmbiQ1MmTiSg==
X-CSE-MsgGUID: uGVwvY7GTNupiE8no6DuzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71105750"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="71105750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:25:16 -0800
X-CSE-ConnectionGUID: udr/MNHfTqm/RstjUL4pzw==
X-CSE-MsgGUID: BKKpg3lVQeqvh8LMSZ11mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195504324"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.114])
 ([10.246.16.114])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:25:08 -0800
Message-ID: <a8d376f6-bd0f-419a-8709-8f4a0a1a0014@linux.intel.com>
Date: Tue, 9 Dec 2025 15:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] accel/ivpu: Use GEM-UMA helpers for memory
 management
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209140141.94407-13-tzimmermann@suse.de>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251209140141.94407-13-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/2025 2:42 PM, Thomas Zimmermann wrote:
> Convert ivpu from GEM-SHMEM to GEM-UMA. The latter is just a copy,
> so this change it merely renaming symbols. No functional changes.
> 
> GEM-SHMEM will become more self-contained for drivers without specific
> memory management. GEM-UMA's interfaces will remain flexible for drivers
> with UMA hardware, such as ivpu.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/accel/ivpu/Kconfig    |  2 +-
>  drivers/accel/ivpu/ivpu_gem.c | 36 +++++++++++++++++------------------
>  drivers/accel/ivpu/ivpu_gem.h |  4 ++--
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
> index 9e055b5ce03d..49ca139a9d31 100644
> --- a/drivers/accel/ivpu/Kconfig
> +++ b/drivers/accel/ivpu/Kconfig
> @@ -5,8 +5,8 @@ config DRM_ACCEL_IVPU
>  	depends on DRM_ACCEL
>  	depends on X86_64 && !UML
>  	depends on PCI && PCI_MSI
> +	select DRM_GEM_UMA_HELPER
>  	select FW_LOADER
> -	select DRM_GEM_SHMEM_HELPER
>  	select GENERIC_ALLOCATOR
>  	select WANT_DEV_COREDUMP
>  	help
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index ece68f570b7e..7f4aeb482efb 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -84,7 +84,7 @@ int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
>  	if (bo->base.base.import_attach)
>  		sgt = ivpu_bo_map_attachment(vdev, bo);
>  	else
> -		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +		sgt = drm_gem_uma_get_pages_sgt(&bo->base);
>  	if (IS_ERR(sgt)) {
>  		ret = PTR_ERR(sgt);
>  		ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
> @@ -223,7 +223,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>  
>  	get_dma_buf(dma_buf);
>  
> -	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, NULL);
> +	obj = drm_gem_uma_prime_import_sg_table(dev, attach, NULL);
>  	if (IS_ERR(obj)) {
>  		ret = PTR_ERR(obj);
>  		goto fail_detach;
> @@ -251,7 +251,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>  
>  static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
>  {
> -	struct drm_gem_shmem_object *shmem;
> +	struct drm_gem_uma_object *uma;
>  	struct ivpu_bo *bo;
>  
>  	switch (flags & DRM_IVPU_BO_CACHE_MASK) {
> @@ -262,11 +262,11 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	shmem = drm_gem_shmem_create(&vdev->drm, size);
> -	if (IS_ERR(shmem))
> -		return ERR_CAST(shmem);
> +	uma = drm_gem_uma_create(&vdev->drm, size);
> +	if (IS_ERR(uma))
> +		return ERR_CAST(uma);
>  
> -	bo = to_ivpu_bo(&shmem->base);
> +	bo = to_ivpu_bo(&uma->base);
>  	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
>  	bo->flags = flags;
>  
> @@ -330,7 +330,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  
>  	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
>  	drm_WARN_ON(obj->dev, bo->base.base.vma_node.vm_files.rb_node);
> -	drm_gem_shmem_free(&bo->base);
> +	drm_gem_uma_free(&bo->base);
>  }
>  
>  static enum drm_gem_object_status ivpu_gem_status(struct drm_gem_object *obj)
> @@ -347,15 +347,15 @@ static enum drm_gem_object_status ivpu_gem_status(struct drm_gem_object *obj)
>  static const struct drm_gem_object_funcs ivpu_gem_funcs = {
>  	.free = ivpu_gem_bo_free,
>  	.open = ivpu_gem_bo_open,
> -	.print_info = drm_gem_shmem_object_print_info,
> -	.pin = drm_gem_shmem_object_pin,
> -	.unpin = drm_gem_shmem_object_unpin,
> -	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> -	.vmap = drm_gem_shmem_object_vmap,
> -	.vunmap = drm_gem_shmem_object_vunmap,
> -	.mmap = drm_gem_shmem_object_mmap,
> +	.print_info = drm_gem_uma_object_print_info,
> +	.pin = drm_gem_uma_object_pin,
> +	.unpin = drm_gem_uma_object_unpin,
> +	.get_sg_table = drm_gem_uma_object_get_sg_table,
> +	.vmap = drm_gem_uma_object_vmap,
> +	.vunmap = drm_gem_uma_object_vunmap,
> +	.mmap = drm_gem_uma_object_mmap,
>  	.status = ivpu_gem_status,
> -	.vm_ops = &drm_gem_shmem_vm_ops,
> +	.vm_ops = &drm_gem_uma_vm_ops,
>  };
>  
>  int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -435,7 +435,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  
>  	if (flags & DRM_IVPU_BO_MAPPABLE) {
>  		ivpu_bo_lock(bo);
> -		ret = drm_gem_shmem_vmap_locked(&bo->base, &map);
> +		ret = drm_gem_uma_vmap_locked(&bo->base, &map);
>  		ivpu_bo_unlock(bo);
>  
>  		if (ret)
> @@ -475,7 +475,7 @@ void ivpu_bo_free(struct ivpu_bo *bo)
>  
>  	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
>  		ivpu_bo_lock(bo);
> -		drm_gem_shmem_vunmap_locked(&bo->base, &map);
> +		drm_gem_uma_vunmap_locked(&bo->base, &map);
>  		ivpu_bo_unlock(bo);
>  	}
>  
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 0c3350f22b55..3e5d1a64deab 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -6,13 +6,13 @@
>  #define __IVPU_GEM_H__
>  
>  #include <drm/drm_gem.h>
> -#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem_uma_helper.h>
>  #include <drm/drm_mm.h>
>  
>  struct ivpu_file_priv;
>  
>  struct ivpu_bo {
> -	struct drm_gem_shmem_object base;
> +	struct drm_gem_uma_object base;
>  	struct ivpu_mmu_context *ctx;
>  	struct list_head bo_list_node;
>  	struct drm_mm_node mm_node;
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
