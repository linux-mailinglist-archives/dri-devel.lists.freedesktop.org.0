Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D14779063
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573210E0CA;
	Fri, 11 Aug 2023 13:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 895AE10E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:08:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE35113E;
 Fri, 11 Aug 2023 06:09:11 -0700 (PDT)
Received: from [10.1.30.25] (e122027.cambridge.arm.com [10.1.30.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37C73F6C4;
 Fri, 11 Aug 2023 06:08:26 -0700 (PDT)
Message-ID: <b6bf9a39-0b61-363c-324b-eb6789a24b74@arm.com>
Date: Fri, 11 Aug 2023 14:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/15] drm/shmem-helper: Make pages_use_count an
 atomic_t
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-2-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-2-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 17:53, Boris Brezillon wrote:
> This way we can grab a pages ref without acquiring the resv lock when
> pages_use_count > 0. Need to implement asynchronous map using the

NIT: s/Need/This is needed/

> drm_gpuva_mgr when the map/unmap operation triggers a mapping split,
> requiring the new left/right regions to grab an additional page ref
> to guarantee that the pages stay pinned when the middle section is
> unmapped.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 28 +++++++++++++------------
>  drivers/gpu/drm/lima/lima_gem.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
>  include/drm/drm_gem_shmem_helper.h      |  2 +-
>  4 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index a783d2245599..ca6938ea1b82 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  		if (shmem->pages)
>  			drm_gem_shmem_put_pages(shmem);
>  
> -		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> +		drm_WARN_ON(obj->dev, atomic_read(&shmem->pages_use_count));
>  
>  		dma_resv_unlock(shmem->base.resv);
>  	}
> @@ -172,14 +172,14 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	if (shmem->pages_use_count++ > 0)
> +	if (atomic_inc_return(&shmem->pages_use_count) > 1)
>  		return 0;
>  
>  	pages = drm_gem_get_pages(obj);
>  	if (IS_ERR(pages)) {
>  		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
>  			    PTR_ERR(pages));
> -		shmem->pages_use_count = 0;
> +		atomic_set(&shmem->pages_use_count, 0);
>  		return PTR_ERR(pages);
>  	}
>  
> @@ -210,10 +210,10 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
> +	if (drm_WARN_ON_ONCE(obj->dev, !atomic_read(&shmem->pages_use_count)))
>  		return;
>  
> -	if (--shmem->pages_use_count > 0)
> +	if (atomic_dec_return(&shmem->pages_use_count) > 0)
>  		return;
>  
>  #ifdef CONFIG_X86
> @@ -263,6 +263,10 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> +	/* If we are the first owner, we need to grab the lock. */
> +	if (atomic_inc_not_zero(&shmem->pages_use_count))
> +		return 0;
> +

Unless I'm misunderstanding I think this introduces a race where two
threads call drm_gem_shmem_pin() at the same time:

Thread1				| Thread 2
--------------------------------+------------------------------
drm_gem_shmem_pin()		|
 - pages_use_count == 0 so not  |
   incremented                  |
 - lock taken			|
drm_gem_shmem_pin_locked()	|
drm_gem_shmem_get_pages()	|
 - pages_use_count incremented	|
<thread descheduled>            | drm_gem_shmem_pin()
                                |  - pages_use_count == 1 so is it
				|    incremented and returns early
				|    without taking the lock
				| Code tries to use shmem->pages
<thread rescheduled>		| and blows up
drm_gem_get_pages()		|
shmem->pages populated		|
lock released			|

I think you need to modify drm_gem_shmem_get_pages() to only increment
pages_use_count when shmem->pages has been populated. That also gets rid
of the atomic_set() in that function which scares me.

Steve

>  	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
>  	if (ret)
>  		return ret;
> @@ -286,6 +290,10 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> +	/* If we are the last owner, we need to grab the lock. */
> +	if (atomic_add_unless(&shmem->pages_use_count, -1, 1))
> +		return;
> +
>  	dma_resv_lock(shmem->base.resv, NULL);
>  	drm_gem_shmem_unpin_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
> @@ -543,18 +551,12 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> -	dma_resv_lock(shmem->base.resv, NULL);
> -
>  	/*
>  	 * We should have already pinned the pages when the buffer was first
>  	 * mmap'd, vm_open() just grabs an additional reference for the new
>  	 * mm the vma is getting copied into (ie. on fork()).
>  	 */
> -	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
> -		shmem->pages_use_count++;
> -
> -	dma_resv_unlock(shmem->base.resv);
> -
> +	drm_WARN_ON_ONCE(obj->dev, atomic_inc_return(&shmem->pages_use_count) == 1);
>  	drm_gem_vm_open(vma);
>  }
>  
> @@ -632,7 +634,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  	if (shmem->base.import_attach)
>  		return;
>  
> -	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
> +	drm_printf_indent(p, indent, "pages_use_count=%u\n", atomic_read(&shmem->pages_use_count));
>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
>  }
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 4f9736e5f929..0116518b1601 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -47,7 +47,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>  		}
>  
>  		bo->base.pages = pages;
> -		bo->base.pages_use_count = 1;
> +		atomic_set(&bo->base.pages_use_count, 1);
>  
>  		mapping_set_unevictable(mapping);
>  	}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index c0123d09f699..f66e63bf743e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -487,7 +487,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  			goto err_unlock;
>  		}
>  		bo->base.pages = pages;
> -		bo->base.pages_use_count = 1;
> +		atomic_set(&bo->base.pages_use_count, 1);
>  	} else {
>  		pages = bo->base.pages;
>  		if (pages[page_offset]) {
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index bf0c31aa8fbe..0661f87d3bda 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -37,7 +37,7 @@ struct drm_gem_shmem_object {
>  	 * Reference count on the pages table.
>  	 * The pages are put when the count reaches zero.
>  	 */
> -	unsigned int pages_use_count;
> +	atomic_t pages_use_count;
>  
>  	/**
>  	 * @madv: State for madvise

