Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC762861E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E22F10E2F5;
	Mon, 14 Nov 2022 16:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC8E010E2F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 16:55:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DD4923A;
 Mon, 14 Nov 2022 08:55:07 -0800 (PST)
Received: from [10.57.84.113] (unknown [10.57.84.113])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C696E3F663;
 Mon, 14 Nov 2022 08:54:55 -0800 (PST)
Message-ID: <41c4d78c-cb47-d06f-f6af-e827dd56b857@arm.com>
Date: Mon, 14 Nov 2022 16:54:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v8 7/7] drm/panfrost: Switch to generic memory shrinker
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
 <20221105232719.302619-8-dmitry.osipenko@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20221105232719.302619-8-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2022 23:27, Dmitry Osipenko wrote:
> Replace Panfrost's custom memory shrinker with a common drm-shmem
> memory shrinker.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Sadly this triggers GPU faults under memory pressure - it looks
suspiciously like mappings are being freed while the jobs are still running.

I'm not sure I understand how the generic shrinker replicates the
"gpu_usecount" atomic that Panfrost currently has, and I'm wondering if
that's the cause?

Also just reverting this commit (so just patches 1-6) I can't actually
get Panfrost to purge any memory. So I don't think the changes (most
likely in patch 4) are quite right either.

At the moment I don't have the time to investigate in detail. But if
you've any ideas for something specific I should look at I can run more
testing.

Steve

> ---
>  drivers/gpu/drm/panfrost/Makefile             |   1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  19 +--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  33 +++--
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 --
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 129 ------------------
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  18 ++-
>  7 files changed, 42 insertions(+), 171 deletions(-)
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> 
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index 7da2b3f02ed9..11622e22cf15 100644
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
> index 8b25278f34c8..fe04b21fc044 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -115,10 +115,6 @@ struct panfrost_device {
>  		atomic_t pending;
>  	} reset;
>  
> -	struct mutex shrinker_lock;
> -	struct list_head shrinker_list;
> -	struct shrinker shrinker;
> -
>  	struct panfrost_devfreq pfdevfreq;
>  };
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 94b8e6de34b8..fe78d5c75abf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -160,7 +160,6 @@ panfrost_lookup_bos(struct drm_device *dev,
>  			break;
>  		}
>  
> -		atomic_inc(&bo->gpu_usecount);
>  		job->mappings[i] = mapping;
>  	}
>  
> @@ -392,7 +391,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  {
>  	struct panfrost_file_priv *priv = file_priv->driver_priv;
>  	struct drm_panfrost_madvise *args = data;
> -	struct panfrost_device *pfdev = dev->dev_private;
>  	struct drm_gem_object *gem_obj;
>  	struct panfrost_gem_object *bo;
>  	int ret = 0;
> @@ -409,7 +407,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_put_object;
>  
> -	mutex_lock(&pfdev->shrinker_lock);
>  	mutex_lock(&bo->mappings.lock);
>  	if (args->madv == PANFROST_MADV_DONTNEED) {
>  		struct panfrost_gem_mapping *first;
> @@ -435,17 +432,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
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
> @@ -577,9 +565,6 @@ static int panfrost_probe(struct platform_device *pdev)
>  	ddev->dev_private = pfdev;
>  	pfdev->ddev = ddev;
>  
> -	mutex_init(&pfdev->shrinker_lock);
> -	INIT_LIST_HEAD(&pfdev->shrinker_list);
> -
>  	err = panfrost_device_init(pfdev);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -601,7 +586,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto err_out1;
>  
> -	panfrost_gem_shrinker_init(ddev);
> +	drm_gem_shmem_shrinker_register(ddev, "panfrost-shrinker");
>  
>  	return 0;
>  
> @@ -619,8 +604,8 @@ static int panfrost_remove(struct platform_device *pdev)
>  	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = pfdev->ddev;
>  
> +	drm_gem_shmem_shrinker_unregister(ddev);
>  	drm_dev_unregister(ddev);
> -	panfrost_gem_shrinker_cleanup(ddev);
>  
>  	pm_runtime_get_sync(pfdev->dev);
>  	pm_runtime_disable(pfdev->dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 293e799e2fe8..f1436405e3a0 100644
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
> @@ -209,6 +199,25 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
> +static int panfrost_shmem_evict(struct drm_gem_shmem_object *shmem)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(&shmem->base);
> +
> +	if (!drm_gem_shmem_is_purgeable(shmem))
> +		return -EOPNOTSUPP;
> +
> +	if (!mutex_trylock(&bo->mappings.lock))
> +		return -EBUSY;
> +
> +	panfrost_gem_teardown_mappings_locked(bo);
> +
> +	drm_gem_shmem_purge(shmem);
> +
> +	mutex_unlock(&bo->mappings.lock);
> +
> +	return 0;
> +}
> +
>  /**
>   * panfrost_gem_create_object - Implementation of driver->gem_create_object.
>   * @dev: DRM device
> @@ -230,6 +239,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>  	mutex_init(&obj->mappings.lock);
>  	obj->base.base.funcs = &panfrost_gem_funcs;
>  	obj->base.map_wc = !pfdev->coherent;
> +	obj->base.evict = panfrost_shmem_evict;
>  
>  	return &obj->base.base;
>  }
> @@ -266,6 +276,9 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	if (!bo->is_heap)
> +		drm_gem_shmem_set_purgeable(shmem);
> +
>  	return bo;
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 8088d5fd8480..09da064f1c07 100644
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
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> @@ -84,7 +78,4 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>  void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>  void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  
> -void panfrost_gem_shrinker_init(struct drm_device *dev);
> -void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> -
>  #endif /* __PANFROST_GEM_H__ */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> deleted file mode 100644
> index 865a989d67c8..000000000000
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
> -		!shmem->pages_pin_count && shmem->sgt &&
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
> -	drm_gem_shmem_purge(&bo->base);
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
> index dbc597ab46fb..98d9751d2b2c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -272,6 +272,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
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
> +	}
> +
> +	return ret;
> +}
> +
>  int panfrost_job_push(struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> @@ -283,6 +296,10 @@ int panfrost_job_push(struct panfrost_job *job)
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
> @@ -324,7 +341,6 @@ static void panfrost_job_cleanup(struct kref *ref)
>  			if (!job->mappings[i])
>  				break;
>  
> -			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>  			panfrost_gem_mapping_put(job->mappings[i]);
>  		}
>  		kvfree(job->mappings);

