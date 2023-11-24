Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED27F70C9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3B210E7D5;
	Fri, 24 Nov 2023 10:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD22110E7D2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:04:45 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A06866073A3;
 Fri, 24 Nov 2023 10:04:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700820284;
 bh=+A2xHULU457kRBZl484ynvGkv1C8aUs6zPFgDc11Q+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=edazeOP6cWJUdgwiDGLHc2Y+1UhUPAA09vi3STCtmKm8LJZ5NU2lLKmc6q1SK1Q7I
 Vu4tEOCCCtFzQ672r0CJ19CFQiFG3ISCqUOrmrUjmpPGB3CPGAS8FxR8xD241HTAJi
 HFgEOLKe1btNqOnRFMdsycaGPxuSKMYKaPcMxQ14/s7PsaDHdV/eoB4MeyAkYZ1hEu
 NCIqVXn3JXKucShrrfD6UJtwtVNGdzFJb2ErkW0A9dZpPRO6YsjWchSFiivWXgitgD
 /hJnHjkOWEWaTqydP6ooRvhAStVXqYan7Zs807nNzif8Xk1fuhtqj6CXhMw2TlL49Q
 4q4I6AeT9klTw==
Date: Fri, 24 Nov 2023 11:04:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 26/26] drm/panfrost: Switch to generic memory shrinker
Message-ID: <20231124110440.52c299cc@collabora.com>
In-Reply-To: <20231029230205.93277-27-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-27-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:02:05 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Replace Panfrost's custom memory shrinker with a common drm-shmem
> memory shrinker.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Makefile             |   1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  27 ++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  34 +++--
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 --
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 129 ------------------
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  18 ++-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  18 ++-
>  include/drm/drm_gem_shmem_helper.h            |   7 -

Nice diffstat.

>  9 files changed, 66 insertions(+), 181 deletions(-)
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> 
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index 2c01c1e7523e..f2cb1ab0a32d 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -5,7 +5,6 @@ panfrost-y := \
>  	panfrost_device.o \
>  	panfrost_devfreq.o \
>  	panfrost_gem.o \
> -	panfrost_gem_shrinker.o \
>  	panfrost_gpu.o \
>  	panfrost_job.o \
>  	panfrost_mmu.o \
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 1e85656dc2f7..2b24a0d4f85e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -117,10 +117,6 @@ struct panfrost_device {
>  		atomic_t pending;
>  	} reset;
>  
> -	struct mutex shrinker_lock;
> -	struct list_head shrinker_list;
> -	struct shrinker shrinker;
> -
>  	struct panfrost_devfreq pfdevfreq;
>  
>  	struct {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7f2aba96d5b9..ef520d2cc1d2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -171,7 +171,6 @@ panfrost_lookup_bos(struct drm_device *dev,
>  			break;
>  		}
>  
> -		atomic_inc(&bo->gpu_usecount);
>  		job->mappings[i] = mapping;
>  	}
>  
> @@ -397,7 +396,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  {
>  	struct panfrost_file_priv *priv = file_priv->driver_priv;
>  	struct drm_panfrost_madvise *args = data;
> -	struct panfrost_device *pfdev = dev->dev_private;
>  	struct drm_gem_object *gem_obj;
>  	struct panfrost_gem_object *bo;
>  	int ret = 0;
> @@ -410,11 +408,15 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	bo = to_panfrost_bo(gem_obj);
>  
> +	if (bo->is_heap) {
> +		args->retained = 1;
> +		goto out_put_object;
> +	}

After digging a bit, I finally got why you do that:
panfrost_gem_shmem_is_purgeable() had a shmem->sgt != NULL test, and
shmem->sgt is never populated for heap BOs (those have a separate sgts
table, each entry containing an sgt covering a 2MB portion of the
buffer). Looking at the code, I don't think making heap BO
non-reclaimable was intentional, otherwise we'd have filtered it out in
panfrost_ioctl_madvise() to avoid inserting an element that will never
be reclaimable. TLDR; I understand why you do that, and I agree this is
the right thing to do (even if I doubt we have any userspace using the
MADV ioctl on heap BOs), but it definitely deserves a comment
explaining that this is here to keep a pre-existing behavior, so people
are not tempted to remove it, and if they do, they must have a good
explanation.

> +
>  	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
>  	if (ret)
>  		goto out_put_object;
>  
> -	mutex_lock(&pfdev->shrinker_lock);
>  	mutex_lock(&bo->mappings.lock);
>  	if (args->madv == PANFROST_MADV_DONTNEED) {
>  		struct panfrost_gem_mapping *first;
> @@ -440,17 +442,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
>  
> -	if (args->retained) {
> -		if (args->madv == PANFROST_MADV_DONTNEED)
> -			list_move_tail(&bo->base.madv_list,
> -				       &pfdev->shrinker_list);
> -		else if (args->madv == PANFROST_MADV_WILLNEED)
> -			list_del_init(&bo->base.madv_list);
> -	}
> -
>  out_unlock_mappings:
>  	mutex_unlock(&bo->mappings.lock);
> -	mutex_unlock(&pfdev->shrinker_lock);
>  	dma_resv_unlock(bo->base.base.resv);
>  out_put_object:
>  	drm_gem_object_put(gem_obj);
> @@ -635,9 +628,6 @@ static int panfrost_probe(struct platform_device *pdev)
>  	ddev->dev_private = pfdev;
>  	pfdev->ddev = ddev;
>  
> -	mutex_init(&pfdev->shrinker_lock);
> -	INIT_LIST_HEAD(&pfdev->shrinker_list);
> -
>  	err = panfrost_device_init(pfdev);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -659,10 +649,14 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto err_out1;
>  
> -	panfrost_gem_shrinker_init(ddev);
> +	err = drmm_gem_shmem_init(ddev);
> +	if (err < 0)
> +		goto err_out2;
>  
>  	return 0;
>  
> +err_out2:

Let's stop this nonsense, and give err labels meaningful names
(err_unregister_dev for that one).

> +	drm_dev_unregister(ddev);
>  err_out1:
>  	pm_runtime_disable(pfdev->dev);
>  	panfrost_device_fini(pfdev);
> @@ -678,7 +672,6 @@ static void panfrost_remove(struct platform_device *pdev)
>  	struct drm_device *ddev = pfdev->ddev;
>  
>  	drm_dev_unregister(ddev);
> -	panfrost_gem_shrinker_cleanup(ddev);
>  
>  	pm_runtime_get_sync(pfdev->dev);
>  	pm_runtime_disable(pfdev->dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index bb9d43cf7c3c..a6128e32f303 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -19,16 +19,6 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
>  	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
>  	struct panfrost_device *pfdev = obj->dev->dev_private;
>  
> -	/*
> -	 * Make sure the BO is no longer inserted in the shrinker list before
> -	 * taking care of the destruction itself. If we don't do that we have a
> -	 * race condition between this function and what's done in
> -	 * panfrost_gem_shrinker_scan().
> -	 */
> -	mutex_lock(&pfdev->shrinker_lock);
> -	list_del_init(&bo->base.madv_list);
> -	mutex_unlock(&pfdev->shrinker_lock);
> -
>  	/*
>  	 * If we still have mappings attached to the BO, there's a problem in
>  	 * our refcounting.
> @@ -94,7 +84,11 @@ static void panfrost_gem_mapping_release(struct kref *kref)
>  
>  	mapping = container_of(kref, struct panfrost_gem_mapping, refcount);
>  
> +	/* shrinker that may purge mapping at the same time */

Let's give a detailed explanation here:

	/* We need to do the unmapping with the resv lock held, because
	 * the shrinker might be purging mappings concurrently.
	 */

> +	dma_resv_lock(mapping->obj->base.base.resv, NULL);

This makes me think that maybe we could drop gem->mappings.lock and
protect the mappings list with the GEM resv. Not asking you to do that
in this patch though, it can be addressed in a follow-up.

>  	panfrost_gem_teardown_mapping(mapping);
> +	dma_resv_unlock(mapping->obj->base.base.resv);
> +
>  	drm_gem_object_put(&mapping->obj->base.base);
>  	panfrost_mmu_ctx_put(mapping->mmu);
>  	kfree(mapping);
> @@ -228,6 +222,25 @@ static size_t panfrost_gem_rss(struct drm_gem_object *obj)
>  	return 0;
>  }
>  
> +static int panfrost_shmem_evict(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +
> +	if (!drm_gem_shmem_is_purgeable(&bo->base))
> +		return -EBUSY;
> +
> +	if (!mutex_trylock(&bo->mappings.lock))
> +		return -EBUSY;
> +
> +	panfrost_gem_teardown_mappings_locked(bo);

Okay, so I've modified and renamed
panfrost_gem_teardown_mappings_locked() here [1]. The new version is
called panfrost_gem_evict_mappings_locked(), and it just kills the MMU
mapping (with a panfrost_mmu_unmap() call). The mm_node (VA range) is
kept allocated until the panfrost_gem_mapping object is destroyed, which
better matches the eviction semantics IMHO.

> +
> +	drm_gem_shmem_purge_locked(&bo->base);
> +
> +	mutex_unlock(&bo->mappings.lock);
> +
> +	return 0;
> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.free = panfrost_gem_free_object,
>  	.open = panfrost_gem_open,
> @@ -242,6 +255,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.status = panfrost_gem_status,
>  	.rss = panfrost_gem_rss,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
> +	.evict = panfrost_shmem_evict,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 13c0a8149c3a..8ddc2d310d29 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -30,12 +30,6 @@ struct panfrost_gem_object {
>  		struct mutex lock;
>  	} mappings;
>  
> -	/*
> -	 * Count the number of jobs referencing this BO so we don't let the
> -	 * shrinker reclaim this object prematurely.
> -	 */
> -	atomic_t gpu_usecount;
> -
>  	/*
>  	 * Object chunk size currently mapped onto physical memory
>  	 */
> @@ -86,7 +80,4 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>  void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>  void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  
> -void panfrost_gem_shrinker_init(struct drm_device *dev);
> -void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> -
>  #endif /* __PANFROST_GEM_H__ */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> deleted file mode 100644
> index 1aa94fff7072..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ /dev/null
> @@ -1,129 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright (C) 2019 Arm Ltd.
> - *
> - * Based on msm_gem_freedreno.c:
> - * Copyright (C) 2016 Red Hat
> - * Author: Rob Clark <robdclark@gmail.com>
> - */
> -
> -#include <linux/list.h>
> -
> -#include <drm/drm_device.h>
> -#include <drm/drm_gem_shmem_helper.h>
> -
> -#include "panfrost_device.h"
> -#include "panfrost_gem.h"
> -#include "panfrost_mmu.h"
> -
> -static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
> -{
> -	return (shmem->madv > 0) &&
> -		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
> -		!shmem->base.dma_buf && !shmem->base.import_attach;
> -}
> -
> -static unsigned long
> -panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
> -{
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> -	struct drm_gem_shmem_object *shmem;
> -	unsigned long count = 0;
> -
> -	if (!mutex_trylock(&pfdev->shrinker_lock))
> -		return 0;
> -
> -	list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
> -		if (panfrost_gem_shmem_is_purgeable(shmem))
> -			count += shmem->base.size >> PAGE_SHIFT;
> -	}
> -
> -	mutex_unlock(&pfdev->shrinker_lock);
> -
> -	return count;
> -}
> -
> -static bool panfrost_gem_purge(struct drm_gem_object *obj)
> -{
> -	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> -	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> -	bool ret = false;
> -
> -	if (atomic_read(&bo->gpu_usecount))
> -		return false;
> -
> -	if (!mutex_trylock(&bo->mappings.lock))
> -		return false;
> -
> -	if (!dma_resv_trylock(shmem->base.resv))
> -		goto unlock_mappings;
> -
> -	panfrost_gem_teardown_mappings_locked(bo);
> -	drm_gem_shmem_purge_locked(&bo->base);
> -	ret = true;
> -
> -	dma_resv_unlock(shmem->base.resv);
> -
> -unlock_mappings:
> -	mutex_unlock(&bo->mappings.lock);
> -	return ret;
> -}
> -
> -static unsigned long
> -panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> -{
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> -	struct drm_gem_shmem_object *shmem, *tmp;
> -	unsigned long freed = 0;
> -
> -	if (!mutex_trylock(&pfdev->shrinker_lock))
> -		return SHRINK_STOP;
> -
> -	list_for_each_entry_safe(shmem, tmp, &pfdev->shrinker_list, madv_list) {
> -		if (freed >= sc->nr_to_scan)
> -			break;
> -		if (drm_gem_shmem_is_purgeable(shmem) &&
> -		    panfrost_gem_purge(&shmem->base)) {
> -			freed += shmem->base.size >> PAGE_SHIFT;
> -			list_del_init(&shmem->madv_list);
> -		}
> -	}
> -
> -	mutex_unlock(&pfdev->shrinker_lock);
> -
> -	if (freed > 0)
> -		pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
> -
> -	return freed;
> -}
> -
> -/**
> - * panfrost_gem_shrinker_init - Initialize panfrost shrinker
> - * @dev: DRM device
> - *
> - * This function registers and sets up the panfrost shrinker.
> - */
> -void panfrost_gem_shrinker_init(struct drm_device *dev)
> -{
> -	struct panfrost_device *pfdev = dev->dev_private;
> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
> -}
> -
> -/**
> - * panfrost_gem_shrinker_cleanup - Clean up panfrost shrinker
> - * @dev: DRM device
> - *
> - * This function unregisters the panfrost shrinker.
> - */
> -void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
> -{
> -	struct panfrost_device *pfdev = dev->dev_private;
> -
> -	if (pfdev->shrinker.nr_deferred) {
> -		unregister_shrinker(&pfdev->shrinker);
> -	}
> -}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index fb16de2d0420..da6be590557f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -289,6 +289,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
>  		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
>  }
>  
> +static int panfrost_objects_prepare(struct drm_gem_object **bos, int bo_count)
> +{
> +	struct panfrost_gem_object *bo;
> +	int ret = 0;
> +
> +	while (!ret && bo_count--) {
> +		bo = to_panfrost_bo(bos[bo_count]);
> +		ret = bo->base.madv ? -ENOMEM : 0;

That's more an -EINVAL: users are not supposed to pass BOs that have an
madv != WILL_NEED, if they do, that's their mistake, not a memory
allocation failure.

> +	}
> +
> +	return ret;
> +}
> +
>  int panfrost_job_push(struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> @@ -300,6 +313,10 @@ int panfrost_job_push(struct panfrost_job *job)
>  	if (ret)
>  		return ret;
>  
> +	ret = panfrost_objects_prepare(job->bos, job->bo_count);
> +	if (ret)
> +		goto unlock;
> +
>  	mutex_lock(&pfdev->sched_lock);
>  	drm_sched_job_arm(&job->base);
>  
> @@ -341,7 +358,6 @@ static void panfrost_job_cleanup(struct kref *ref)
>  			if (!job->mappings[i])
>  				break;
>  
> -			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>  			panfrost_gem_mapping_put(job->mappings[i]);
>  		}
>  		kvfree(job->mappings);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index ac145a98377b..01cd97011ea5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -326,6 +326,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
>  	int prot = IOMMU_READ | IOMMU_WRITE;
> +	int ret = 0;
>  
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -333,15 +334,26 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	if (bo->noexec)
>  		prot |= IOMMU_NOEXEC;
>  
> +	if (!obj->import_attach) {
> +		ret = drm_gem_shmem_pin(shmem);

I see why you do that. In practice panfrost_mmu_map() is called
before the object has been exposed, so I don't think it can be
purged/evicted at that point (and _get_pages() should have been called
before panfrost_mmu_map()), but I don't mind the extra safety net. Can
we just add a comment explaining the pin/get_pages_sgt/unpin dance here?

> +		if (ret)
> +			return ret;
> +	}
> +
>  	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> -	if (WARN_ON(IS_ERR(sgt)))
> -		return PTR_ERR(sgt);
> +	if (WARN_ON(IS_ERR(sgt))) {
> +		ret = PTR_ERR(sgt);
> +		goto unpin;
> +	}
>  
>  	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
>  		   prot, sgt);
>  	mapping->active = true;

nit: add a blank line here, please.

> +unpin:
> +	if (!obj->import_attach)
> +		drm_gem_shmem_unpin(shmem);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 6ac77c2082ed..2a506074da46 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -61,13 +61,6 @@ struct drm_gem_shmem_object {
>  	 */
>  	int madv;
>  
> -	/**
> -	 * @madv_list: List entry for madvise tracking
> -	 *
> -	 * Typically used by drivers to track purgeable objects
> -	 */
> -	struct list_head madv_list;
> -
>  	/**
>  	 * @sgt: Scatter/gather table for imported PRIME buffers
>  	 */

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/8401ba620de63073089517805f9413fac88653cd
