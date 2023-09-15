Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202027A16DF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 09:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55F10E59E;
	Fri, 15 Sep 2023 07:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742A10E59E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 07:06:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EEE46607326;
 Fri, 15 Sep 2023 08:06:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694761574;
 bh=rc98ZOI7ZqctL2JotTjeK5vCrSKc4a7st9KAVMD/t3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PYnfri2rszTkkwtqrOGMVnDdTSCzImxjBR+F1duI9+VjMEsevoABW/KQQznlqMoBy
 FFmB+edoeNB86P/i4EY73eVAxdSKr9l/wMwQvNGavwg442X2w4IE6s2sbZT6MbZAkc
 Xc6v0TIoY51pk8kbo0G/9mPGc3R571f3fudIrw2HF8M3hatf9ZPvpyAUeEXdl0wVmq
 n8fp02QD7foVXBp6/WPJrxLywyWY8/A5rz/QhX23NYLPCIg2eFveGDGsQuR3SreRO0
 K3HjFxDaKcOo2RI7eAv9adfBtvfW/c+HjONcSoCKtMP6F1G518OF0i5SMChgal+fpl
 jBOWPn9TfmsVA==
Date: Fri, 15 Sep 2023 09:06:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 07/18] drm/shmem-helper: Use refcount_t for
 pages_use_count
Message-ID: <20230915090611.5c4f1ef7@collabora.com>
In-Reply-To: <20230914232721.408581-8-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-8-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023 02:27:10 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Use atomic refcount_t helper for pages_use_count to optimize pin/unpin
> functions by skipping reservation locking while GEM's pin refcount > 1.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 33 +++++++++++--------------
>  drivers/gpu/drm/lima/lima_gem.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
>  include/drm/drm_gem_shmem_helper.h      |  2 +-
>  4 files changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 286f0ca51309..e9d9fbd52b34 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  		if (shmem->pages)
>  			drm_gem_shmem_put_pages_locked(shmem);
>  
> -		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> +		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
>  
>  		dma_resv_unlock(shmem->base.resv);
>  	}
> @@ -172,14 +172,13 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	if (shmem->pages_use_count++ > 0)
> +	if (refcount_inc_not_zero(&shmem->pages_use_count))
>  		return 0;
>  
>  	pages = drm_gem_get_pages(obj);
>  	if (IS_ERR(pages)) {
>  		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
>  			    PTR_ERR(pages));
> -		shmem->pages_use_count = 0;
>  		return PTR_ERR(pages);
>  	}
>  
> @@ -195,6 +194,8 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>  
>  	shmem->pages = pages;
>  
> +	refcount_set(&shmem->pages_use_count, 1);
> +
>  	return 0;
>  }
>  
> @@ -210,21 +211,17 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
> -		return;
> -
> -	if (--shmem->pages_use_count > 0)
> -		return;
> -
> +	if (refcount_dec_and_test(&shmem->pages_use_count)) {
>  #ifdef CONFIG_X86
> -	if (shmem->map_wc)
> -		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> +		if (shmem->map_wc)
> +			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
>  #endif
>  
> -	drm_gem_put_pages(obj, shmem->pages,
> -			  shmem->pages_mark_dirty_on_put,
> -			  shmem->pages_mark_accessed_on_put);
> -	shmem->pages = NULL;
> +		drm_gem_put_pages(obj, shmem->pages,
> +				  shmem->pages_mark_dirty_on_put,
> +				  shmem->pages_mark_accessed_on_put);
> +		shmem->pages = NULL;
> +	}
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  
> @@ -551,8 +548,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  	 * mmap'd, vm_open() just grabs an additional reference for the new
>  	 * mm the vma is getting copied into (ie. on fork()).
>  	 */
> -	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
> -		shmem->pages_use_count++;
> +	drm_WARN_ON_ONCE(obj->dev,
> +			 !refcount_inc_not_zero(&shmem->pages_use_count));
>  
>  	dma_resv_unlock(shmem->base.resv);
>  
> @@ -640,7 +637,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  		return;
>  
>  	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
> -	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
> +	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
>  }
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 62d4a409faa8..988e74f67465 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -47,7 +47,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>  		}
>  
>  		bo->base.pages = pages;
> -		bo->base.pages_use_count = 1;
> +		refcount_set(&bo->base.pages_use_count, 1);
>  
>  		mapping_set_unevictable(mapping);
>  	}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 7771769f0ce0..a91252053aa3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -487,7 +487,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  			goto err_unlock;
>  		}
>  		bo->base.pages = pages;
> -		bo->base.pages_use_count = 1;
> +		refcount_set(&bo->base.pages_use_count, 1);
>  	} else {
>  		pages = bo->base.pages;
>  		if (pages[page_offset]) {
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 268b3127d150..3947f5c6bff7 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -37,7 +37,7 @@ struct drm_gem_shmem_object {
>  	 * Reference count on the pages table.
>  	 * The pages are put when the count reaches zero.
>  	 */
> -	unsigned int pages_use_count;
> +	refcount_t pages_use_count;
>  
>  	/**
>  	 * @pages_pin_count:

