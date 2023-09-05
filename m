Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C837920EC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 10:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A3510E469;
	Tue,  5 Sep 2023 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51E710E476
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 08:03:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E2236607122;
 Tue,  5 Sep 2023 09:03:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693900989;
 bh=duFN28VqAna3UQ4hZh0i5mKhRtao7jvpZfu/BiHzgdo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uw1nl+zrygpz51gFWCDjOZCZ1T2W43UYNsP8Xn3gz5TS4FOpFmZAXNaSOj1JGYuSv
 VH7T8uobz7gf1ki6ekcX9kDMZSv/Nsoe75B4v7QaQznTnyBp0yWxObjtFP0A2TARG3
 AmINSTSigXg/+ma5QISIOtuwdiMV4qlDc7emACiPanrDVs8Nb4CZnGCjjIZawALrD8
 /7Ej8+iVQBy25ttdhCXBtItTsi6y4s0DfcE1kYMt9/ITKn2lXR4wSezjRCABW8l7kO
 ubmwqxUHsBC2xruBkmyrS0TJOCqUk0p3VbkWLtWj99NZF1SgMkOxztnGsqzOvTFhu5
 LFdv6/rNy2/wA==
Date: Tue, 5 Sep 2023 10:03:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Message-ID: <20230905100306.3564e729@collabora.com>
In-Reply-To: <20230903170736.513347-16-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-16-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:31 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Introduce common drm-shmem shrinker for DRM drivers.
> 
> To start using drm-shmem shrinker drivers should do the following:
> 
> 1. Implement evict() callback of GEM object where driver should check
>    whether object is purgeable or evictable using drm-shmem helpers and
>    perform the shrinking action
> 
> 2. Initialize drm-shmem internals using drmm_gem_shmem_init(drm_device),
>    which will register drm-shmem shrinker
> 
> 3. Implement madvise IOCTL that will use drm_gem_shmem_madvise()
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 442 ++++++++++++++++--
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   9 +-
>  include/drm/drm_device.h                      |  10 +-
>  include/drm/drm_gem_shmem_helper.h            |  71 ++-
>  4 files changed, 494 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4633a418faba..a0a6c7e505c8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_print.h>
>  
> @@ -88,8 +89,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>  	if (ret)
>  		goto err_release;
>  
> -	INIT_LIST_HEAD(&shmem->madv_list);
> -
>  	if (!private) {
>  		/*
>  		 * Our buffers are kept pinned, so allocating them
> @@ -128,6 +127,62 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>  
> +static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
> +		refcount_read(&shmem->pages_use_count) &&
> +		!refcount_read(&shmem->pages_pin_count) &&
> +		!shmem->base.dma_buf && !shmem->base.import_attach &&
> +		shmem->sgt && !shmem->evicted;
> +}
> +
> +static void
> +drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	struct drm_gem_shmem *shmem_mm = obj->dev->shmem_mm;
> +	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (!shmem_shrinker || obj->import_attach)
> +		return;
> +
> +	if (shmem->madv < 0)
> +		drm_gem_lru_remove(&shmem->base);
> +	else if (drm_gem_shmem_is_evictable(shmem) || drm_gem_shmem_is_purgeable(shmem))
> +		drm_gem_lru_move_tail(&shmem_shrinker->lru_evictable, &shmem->base);
> +	else if (shmem->evicted)
> +		drm_gem_lru_move_tail(&shmem_shrinker->lru_evicted, &shmem->base);
> +	else if (!shmem->pages)
> +		drm_gem_lru_remove(&shmem->base);
> +	else
> +		drm_gem_lru_move_tail(&shmem_shrinker->lru_pinned, &shmem->base);
> +}
> +
> +static void
> +drm_gem_shmem_do_release_pages_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +
> +	if (!shmem->pages) {
> +		drm_WARN_ON(obj->dev, !shmem->evicted && shmem->madv >= 0);
> +		return;
> +	}
> +
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> +#endif
> +
> +	drm_gem_put_pages(obj, shmem->pages,
> +			  shmem->pages_mark_dirty_on_put,
> +			  shmem->pages_mark_accessed_on_put);
> +	shmem->pages = NULL;
> +}
> +
>  /**
>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>   * @shmem: shmem GEM object to free
> @@ -142,8 +197,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  	if (obj->import_attach) {
>  		drm_prime_gem_destroy(obj, shmem->sgt);
>  	} else if (!shmem->imported_sgt) {
> -		dma_resv_lock(shmem->base.resv, NULL);
> -
>  		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
>  
>  		if (shmem->sgt) {
> @@ -152,14 +205,27 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  			sg_free_table(shmem->sgt);
>  			kfree(shmem->sgt);
>  		}
> -		if (refcount_read(&shmem->pages_use_count)) {
> -			drm_gem_shmem_put_pages_locked(shmem);

It would be preferable to introduce
drm_gem_shmem_do_release_pages_locked() earlier in the series (not a
huge fan of the name BTW, especially since this function can be called
without the lock held in the free path), so we keep things bisectable.

> -			drm_WARN_ON(obj->dev, !shmem->got_pages_sgt);
> +
> +		/*
> +		 * Destroying the object is a special case.. drm_gem_shmem_free()
> +		 * calls many things that WARN_ON if the obj lock is not held.

If that's the case, that should be fixed the same way you're fixing the
put_pages_locked() situation here.

>                * But
> +		 * acquiring the obj lock in drm_gem_shmem_release_pages_locked() can
> +		 * cause a locking order inversion between reservation_ww_class_mutex
> +		 * and fs_reclaim.
> +		 *
> +		 * This deadlock is not actually possible, because no one should
> +		 * be already holding the lock when drm_gem_shmem_free() is called.
> +		 * Unfortunately lockdep is not aware of this detail.  So when the
> +		 * refcount drops to zero, don't touch the reservation lock.
> +		 */
> +		if (shmem->got_pages_sgt &&
> +		    refcount_dec_and_test(&shmem->pages_use_count)) {
> +			drm_gem_shmem_do_release_pages_locked(shmem);
> +			shmem->got_pages_sgt = false;
>  		}

Leaking memory is the right thing to do if pages_use_count > 1 (it's
better to leak than having someone access memory it no longer owns), but
I think it's worth mentioning in the above comment.

>  
>  		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
> -
> -		dma_resv_unlock(shmem->base.resv);
> +		drm_WARN_ON(obj->dev, shmem->got_pages_sgt);
>  	}
>  
>  	drm_gem_object_release(obj);
> @@ -167,15 +233,26 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
>  
> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> +static int
> +drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem, bool init)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct page **pages;
>  
>  	dma_resv_assert_held(shmem->base.resv);

I'd defer this check to the caller (AFAICT, all callers have this
already). This way the function name is consistent with its behavior.

>  
> -	if (refcount_inc_not_zero(&shmem->pages_use_count))
> +	if (shmem->madv < 0) {
> +		drm_WARN_ON(obj->dev, shmem->pages);
> +		return -ENOMEM;
> +	}
> +
> +	if (shmem->pages) {
> +		drm_WARN_ON(obj->dev, !shmem->evicted);
>  		return 0;
> +	}
> +
> +	if (drm_WARN_ON(obj->dev, !(init ^ refcount_read(&shmem->pages_use_count))))
> +		return -EINVAL;
>  
>  	pages = drm_gem_get_pages(obj);
>  	if (IS_ERR(pages)) {
> @@ -196,8 +273,36 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>  
>  	shmem->pages = pages;
>  
> +	return 0;
> +}
> +
> +static void
> +drm_gem_shmem_release_pages_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +	drm_gem_shmem_do_release_pages_locked(shmem);
> +}

Do we really need an intermediate helper here. Can't we let the callers
ensure the resv is held (that's already the case BTW). This way, you
simply have drm_gem_shmem_{release,acquire}_pages() helpers, and the
drm_gem_shmem_release_pages() helper can be used in
drm_gem_shmem_free().

> +
> +static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	int err;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (shmem->madv < 0)
> +		return -ENOMEM;
> +
> +	if (refcount_inc_not_zero(&shmem->pages_use_count))
> +		return 0;
> +
> +	err = drm_gem_shmem_acquire_pages(shmem, true);
> +	if (err)
> +		return err;
> +
>  	refcount_set(&shmem->pages_use_count, 1);
>  
> +	drm_gem_shmem_update_pages_state_locked(shmem);
> +
>  	return 0;
>  }
>  
> @@ -209,20 +314,11 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>   */
>  void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  {
> -	struct drm_gem_object *obj = &shmem->base;
> -
>  	dma_resv_assert_held(shmem->base.resv);
>  
>  	if (refcount_dec_and_test(&shmem->pages_use_count)) {
> -#ifdef CONFIG_X86
> -		if (shmem->map_wc)
> -			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> -#endif
> -
> -		drm_gem_put_pages(obj, shmem->pages,
> -				  shmem->pages_mark_dirty_on_put,
> -				  shmem->pages_mark_accessed_on_put);
> -		shmem->pages = NULL;
> +		drm_gem_shmem_release_pages_locked(shmem);
> +		drm_gem_shmem_update_pages_state_locked(shmem);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> @@ -251,8 +347,15 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  		return 0;
>  
>  	ret = drm_gem_shmem_get_pages_locked(shmem);
> -	if (!ret)
> +	if (!ret) {
> +		ret = drm_gem_shmem_swapin_locked(shmem);
> +		if (ret) {
> +			drm_gem_shmem_put_pages_locked(shmem);
> +			return ret;
> +		}
> +
>  		refcount_set(&shmem->pages_pin_count, 1);
> +	}
>  
>  	return ret;
>  }
> @@ -448,29 +551,54 @@ int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv)
>  
>  	madv = shmem->madv;
>  
> +	drm_gem_shmem_update_pages_state_locked(shmem);
> +
>  	return (madv >= 0);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise_locked);
>  
> -void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
> +int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(obj->resv, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gem_shmem_madvise_locked(shmem, madv);
> +	dma_resv_unlock(obj->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
> +
> +static void drm_gem_shmem_unpin_pages_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct drm_device *dev = obj->dev;
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
> +	if (shmem->evicted)
> +		return;
>  
>  	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
> +	drm_gem_shmem_release_pages_locked(shmem);
> +	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
> +
>  	sg_free_table(shmem->sgt);
>  	kfree(shmem->sgt);
>  	shmem->sgt = NULL;
> +}
>  
> -	drm_gem_shmem_put_pages_locked(shmem);
> +void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
>  
> -	shmem->madv = -1;
> +	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
>  
> -	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
> +	drm_gem_shmem_unpin_pages_locked(shmem);
>  	drm_gem_free_mmap_offset(obj);
>  
>  	/* Our goal here is to return as much of the memory as
> @@ -481,9 +609,59 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
>  	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
>  
>  	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
> +
> +	shmem->madv = -1;
> +	shmem->evicted = false;
> +	drm_gem_shmem_update_pages_state_locked(shmem);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
>  
> +/**
> + * drm_gem_shmem_swapin_locked() - Moves shmem GEM back to memory and enables
> + *                                 hardware access to the memory.
> + * @shmem: shmem GEM object
> + *
> + * This function moves shmem GEM back to memory if it was previously evicted
> + * by the memory shrinker. The GEM is ready to use on success.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	struct sg_table *sgt;
> +	int err;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (shmem->evicted) {
> +		err = drm_gem_shmem_acquire_pages(shmem, false);
> +		if (err)
> +			return err;
> +
> +		sgt = drm_gem_shmem_get_sg_table(shmem);
> +		if (IS_ERR(sgt))
> +			return PTR_ERR(sgt);
> +
> +		err = dma_map_sgtable(obj->dev->dev, sgt,
> +				      DMA_BIDIRECTIONAL, 0);
> +		if (err) {
> +			sg_free_table(sgt);
> +			kfree(sgt);
> +			return err;
> +		}
> +
> +		shmem->sgt = sgt;
> +		shmem->evicted = false;
> +
> +		drm_gem_shmem_update_pages_state_locked(shmem);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_swapin_locked);
> +
>  /**
>   * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
>   * @file: DRM file structure to create the dumb buffer for
> @@ -530,22 +708,34 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	vm_fault_t ret;
>  	struct page *page;
>  	pgoff_t page_offset;
> +	bool pages_unpinned;
> +	int err;
>  
>  	/* We don't use vmf->pgoff since that has the fake offset */
>  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>  
>  	dma_resv_lock(shmem->base.resv, NULL);
>  
> -	if (page_offset >= num_pages ||
> -	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
> -	    shmem->madv < 0) {
> +	/* Sanity-check that we have the pages pointer when it should present */
> +	pages_unpinned = (shmem->evicted || shmem->madv < 0 ||
> +			  !refcount_read(&shmem->pages_use_count));
> +	drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
> +
> +	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
>  		ret = VM_FAULT_SIGBUS;
>  	} else {
> +		err = drm_gem_shmem_swapin_locked(shmem);
> +		if (err) {
> +			ret = VM_FAULT_OOM;
> +			goto unlock;
> +		}
> +
>  		page = shmem->pages[page_offset];
>  
>  		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
>  	}
>  
> +unlock:
>  	dma_resv_unlock(shmem->base.resv);
>  
>  	return ret;
> @@ -568,6 +758,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  	drm_WARN_ON_ONCE(obj->dev,
>  			 !refcount_inc_not_zero(&shmem->pages_use_count));
>  
> +	drm_gem_shmem_update_pages_state_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
>  
>  	drm_gem_vm_open(vma);
> @@ -653,7 +844,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
>  	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n", refcount_read(&shmem->vmap_use_count));
> +	drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
> +	drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
>  
> @@ -715,6 +908,8 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  
>  	shmem->sgt = sgt;
>  
> +	drm_gem_shmem_update_pages_state_locked(shmem);
> +
>  	return sgt;
>  
>  err_free_sgt:
> @@ -802,6 +997,191 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>  
> +static struct drm_gem_shmem_shrinker *
> +to_drm_gem_shmem_shrinker(struct shrinker *shrinker)
> +{
> +	return container_of(shrinker, struct drm_gem_shmem_shrinker, base);
> +}
> +
> +static unsigned long
> +drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
> +				     struct shrink_control *sc)
> +{
> +	struct drm_gem_shmem_shrinker *shmem_shrinker =
> +					to_drm_gem_shmem_shrinker(shrinker);
> +	unsigned long count = shmem_shrinker->lru_evictable.count;
> +
> +	if (count >= SHRINK_EMPTY)
> +		return SHRINK_EMPTY - 1;
> +
> +	return count ?: SHRINK_EMPTY;
> +}
> +
> +void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +
> +	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_evictable(shmem));
> +	drm_WARN_ON(obj->dev, shmem->evicted);
> +
> +	drm_gem_shmem_unpin_pages_locked(shmem);
> +
> +	shmem->evicted = true;
> +	drm_gem_shmem_update_pages_state_locked(shmem);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_evict_locked);
> +
> +static bool drm_gem_shmem_shrinker_evict_locked(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	int err;
> +
> +	if (!drm_gem_shmem_is_evictable(shmem) ||
> +	    get_nr_swap_pages() < obj->size >> PAGE_SHIFT)
> +		return false;
> +
> +	err = drm_gem_evict_locked(obj);
> +	if (err)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool drm_gem_shmem_shrinker_purge_locked(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	int err;
> +
> +	if (!drm_gem_shmem_is_purgeable(shmem))
> +		return false;
> +
> +	err = drm_gem_evict_locked(obj);
> +	if (err)
> +		return false;
> +
> +	return true;
> +}
> +
> +static unsigned long
> +drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
> +				    struct shrink_control *sc)
> +{
> +	struct drm_gem_shmem_shrinker *shmem_shrinker;
> +	unsigned long nr_to_scan = sc->nr_to_scan;
> +	unsigned long remaining = 0;
> +	unsigned long freed = 0;
> +
> +	shmem_shrinker = to_drm_gem_shmem_shrinker(shrinker);
> +
> +	/* purge as many objects as we can */
> +	freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
> +				  nr_to_scan, &remaining,
> +				  drm_gem_shmem_shrinker_purge_locked);
> +
> +	/* evict as many objects as we can */
> +	if (freed < nr_to_scan)
> +		freed += drm_gem_lru_scan(&shmem_shrinker->lru_evictable,
> +					  nr_to_scan - freed, &remaining,
> +					  drm_gem_shmem_shrinker_evict_locked);
> +
> +	return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
> +}
> +
> +static int drm_gem_shmem_shrinker_init(struct drm_gem_shmem *shmem_mm,
> +				       const char *shrinker_name)
> +{
> +	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
> +	int err;
> +
> +	shmem_shrinker->base.count_objects = drm_gem_shmem_shrinker_count_objects;
> +	shmem_shrinker->base.scan_objects = drm_gem_shmem_shrinker_scan_objects;
> +	shmem_shrinker->base.seeks = DEFAULT_SEEKS;
> +
> +	mutex_init(&shmem_shrinker->lock);
> +	drm_gem_lru_init(&shmem_shrinker->lru_evictable, &shmem_shrinker->lock);
> +	drm_gem_lru_init(&shmem_shrinker->lru_evicted, &shmem_shrinker->lock);
> +	drm_gem_lru_init(&shmem_shrinker->lru_pinned, &shmem_shrinker->lock);
> +
> +	err = register_shrinker(&shmem_shrinker->base, shrinker_name);
> +	if (err) {
> +		mutex_destroy(&shmem_shrinker->lock);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void drm_gem_shmem_shrinker_release(struct drm_device *dev,
> +					   struct drm_gem_shmem *shmem_mm)
> +{
> +	struct drm_gem_shmem_shrinker *shmem_shrinker = &shmem_mm->shrinker;
> +
> +	unregister_shrinker(&shmem_shrinker->base);
> +	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_evictable.list));
> +	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_evicted.list));
> +	drm_WARN_ON(dev, !list_empty(&shmem_shrinker->lru_pinned.list));
> +	mutex_destroy(&shmem_shrinker->lock);
> +}
> +
> +static int drm_gem_shmem_init(struct drm_device *dev)
> +{
> +	int err;
> +
> +	if (drm_WARN_ON(dev, dev->shmem_mm))
> +		return -EBUSY;
> +
> +	dev->shmem_mm = kzalloc(sizeof(*dev->shmem_mm), GFP_KERNEL);
> +	if (!dev->shmem_mm)
> +		return -ENOMEM;
> +
> +	err = drm_gem_shmem_shrinker_init(dev->shmem_mm, dev->unique);
> +	if (err)
> +		goto free_gem_shmem;
> +
> +	return 0;
> +
> +free_gem_shmem:
> +	kfree(dev->shmem_mm);
> +	dev->shmem_mm = NULL;
> +
> +	return err;
> +}
> +
> +static void drm_gem_shmem_release(struct drm_device *dev, void *ptr)
> +{
> +	struct drm_gem_shmem *shmem_mm = dev->shmem_mm;
> +
> +	drm_gem_shmem_shrinker_release(dev, shmem_mm);
> +	dev->shmem_mm = NULL;
> +	kfree(shmem_mm);
> +}
> +
> +/**
> + * drmm_gem_shmem_init() - Initialize drm-shmem internals
> + * @dev: DRM device
> + *
> + * Cleanup is automatically managed as part of DRM device releasing.
> + * Calling this function multiple times will result in a error.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drmm_gem_shmem_init(struct drm_device *dev)
> +{
> +	int err;
> +
> +	err = drm_gem_shmem_init(dev);
> +	if (err)
> +		return err;
> +
> +	err = drmm_add_action_or_reset(dev, drm_gem_shmem_release, NULL);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drmm_gem_shmem_init);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS(DMA_BUF);
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> index 72193bd734e1..1aa94fff7072 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -15,6 +15,13 @@
>  #include "panfrost_gem.h"
>  #include "panfrost_mmu.h"
>  
> +static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
> +{
> +	return (shmem->madv > 0) &&
> +		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
> +		!shmem->base.dma_buf && !shmem->base.import_attach;
> +}
> +
>  static unsigned long
>  panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>  {
> @@ -27,7 +34,7 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
>  		return 0;
>  
>  	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
> -		if (drm_gem_shmem_is_purgeable(shmem))
> +		if (panfrost_gem_shmem_is_purgeable(shmem))
>  			count += shmem->base.size >> PAGE_SHIFT;
>  	}
>  
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 7cf4afae2e79..a978f0cb5e84 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -16,6 +16,7 @@ struct drm_vblank_crtc;
>  struct drm_vma_offset_manager;
>  struct drm_vram_mm;
>  struct drm_fb_helper;
> +struct drm_gem_shmem_shrinker;
>  
>  struct inode;
>  
> @@ -290,8 +291,13 @@ struct drm_device {
>  	/** @vma_offset_manager: GEM information */
>  	struct drm_vma_offset_manager *vma_offset_manager;
>  
> -	/** @vram_mm: VRAM MM memory manager */
> -	struct drm_vram_mm *vram_mm;
> +	union {
> +		/** @vram_mm: VRAM MM memory manager */
> +		struct drm_vram_mm *vram_mm;
> +
> +		/** @shmem_mm: SHMEM GEM memory manager */
> +		struct drm_gem_shmem *shmem_mm;
> +	};
>  
>  	/**
>  	 * @switch_power_state:
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 63e91e8f2d5c..65c99da25048 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -6,6 +6,7 @@
>  #include <linux/fs.h>
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
> +#include <linux/shrinker.h>
>  
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> @@ -13,6 +14,7 @@
>  #include <drm/drm_prime.h>
>  
>  struct dma_buf_attachment;
> +struct drm_device;
>  struct drm_mode_create_dumb;
>  struct drm_printer;
>  struct sg_table;
> @@ -53,8 +55,8 @@ struct drm_gem_shmem_object {
>  	 * @madv: State for madvise
>  	 *
>  	 * 0 is active/inuse.
> +	 * 1 is not-needed/can-be-purged
>  	 * A negative value is the object is purged.
> -	 * Positive values are driver specific and not used by the helpers.
>  	 */
>  	int madv;
>  
> @@ -115,6 +117,12 @@ struct drm_gem_shmem_object {
>  	 * @map_wc: map object write-combined (instead of using shmem defaults).
>  	 */
>  	bool map_wc : 1;
> +
> +	/**
> +	 * @evicted: True if shmem pages are evicted by the memory shrinker.
> +	 * Used internally by memory shrinker.
> +	 */
> +	bool evicted : 1;
>  };
>  
>  #define to_drm_gem_shmem_obj(obj) \
> @@ -133,14 +141,22 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>  
>  int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
> +int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
>  
>  static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
>  {
> -	return (shmem->madv > 0) &&
> -		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
> -		!shmem->base.dma_buf && !shmem->base.import_attach;
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	return (shmem->madv > 0) && shmem->base.funcs->evict &&
> +		refcount_read(&shmem->pages_use_count) &&
> +		!refcount_read(&shmem->pages_pin_count) &&
> +		!shmem->base.dma_buf && !shmem->base.import_attach &&
> +		(shmem->sgt || shmem->evicted);
>  }
>  
> +int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem);
> +
> +void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
>  
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
> @@ -284,6 +300,53 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
>  	return drm_gem_shmem_mmap(shmem, vma);
>  }
>  
> +/**
> + * drm_gem_shmem_object_madvise - unlocked GEM object function for drm_gem_shmem_madvise_locked()
> + * @obj: GEM object
> + * @madv: Madvise value
> + *
> + * This function wraps drm_gem_shmem_madvise_locked(), providing unlocked variant.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +static inline int drm_gem_shmem_object_madvise(struct drm_gem_object *obj, int madv)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +
> +	return drm_gem_shmem_madvise(shmem, madv);
> +}
> +
> +/**
> + * struct drm_gem_shmem_shrinker - Memory shrinker of GEM shmem memory manager
> + */
> +struct drm_gem_shmem_shrinker {
> +	/** @base: Shrinker for purging shmem GEM objects */
> +	struct shrinker base;
> +
> +	/** @lock: Protects @lru_* */
> +	struct mutex lock;
> +
> +	/** @lru_pinned: List of pinned shmem GEM objects */
> +	struct drm_gem_lru lru_pinned;
> +
> +	/** @lru_evictable: List of shmem GEM objects to be evicted */
> +	struct drm_gem_lru lru_evictable;
> +
> +	/** @lru_evicted: List of evicted shmem GEM objects */
> +	struct drm_gem_lru lru_evicted;
> +};
> +
> +/**
> + * struct drm_gem_shmem - GEM shmem memory manager
> + */
> +struct drm_gem_shmem {
> +	/** @shrinker: GEM shmem shrinker */
> +	struct drm_gem_shmem_shrinker shrinker;
> +};
> +
> +int drmm_gem_shmem_init(struct drm_device *dev);
> +
>  /*
>   * Driver ops
>   */

