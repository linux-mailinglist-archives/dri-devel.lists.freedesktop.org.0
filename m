Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C87917E7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8DF10E354;
	Mon,  4 Sep 2023 13:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0744510E132
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:20:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C76B143D;
 Mon,  4 Sep 2023 06:21:05 -0700 (PDT)
Received: from [10.57.92.217] (unknown [10.57.92.217])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9E9D3F793;
 Mon,  4 Sep 2023 06:20:23 -0700 (PDT)
Message-ID: <b07f5338-192d-7f11-8c07-bcbfd9617cd4@arm.com>
Date: Mon, 4 Sep 2023 14:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 20/20] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-21-dmitry.osipenko@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230903170736.513347-21-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/09/2023 18:07, Dmitry Osipenko wrote:
> Replace Panfrost's custom memory shrinker with a common drm-shmem
> memory shrinker.
> 
> Tested-by: Steven Price <steven.price@arm.com> # Firefly-RK3288

I just gave this version of the series a spin and I can trigger the following 
warning:

[  477.776163] ------------[ cut here ]------------
[  477.781353] WARNING: CPU: 0 PID: 292 at drivers/gpu/drm/drm_gem_shmem_helper.c:227 drm_gem_shmem_free+0x1fc/0x200 [drm_shmem_helper]
[  477.794790] panfrost ffa30000.gpu: drm_WARN_ON(refcount_read(&shmem->pages_use_count))
[  477.794797] Modules linked in: panfrost gpu_sched drm_shmem_helper
[  477.810942] CPU: 0 PID: 292 Comm: glmark2-es2-drm Not tainted 6.5.0-rc2-00527-gc8a0c16fa830 #1
[  477.820564] Hardware name: Rockchip (Device Tree)
[  477.825820]  unwind_backtrace from show_stack+0x10/0x14
[  477.831670]  show_stack from dump_stack_lvl+0x58/0x70
[  477.837319]  dump_stack_lvl from __warn+0x7c/0x1a4
[  477.842680]  __warn from warn_slowpath_fmt+0x134/0x1a0
[  477.848429]  warn_slowpath_fmt from drm_gem_shmem_free+0x1fc/0x200 [drm_shmem_helper]
[  477.857199]  drm_gem_shmem_free [drm_shmem_helper] from drm_gem_handle_delete+0x84/0xb0
[  477.866163]  drm_gem_handle_delete from drm_ioctl+0x214/0x4ec
[  477.872592]  drm_ioctl from sys_ioctl+0x568/0xd48
[  477.877857]  sys_ioctl from ret_fast_syscall+0x0/0x1c
[  477.883504] Exception stack(0xf0a49fa8 to 0xf0a49ff0)
[  477.889148] 9fa0:                   005969c0 bef34880 00000006 40086409 bef34880 00000001
[  477.898289] 9fc0: 005969c0 bef34880 40086409 00000036 bef34880 00590b64 00590aec 00000000
[  477.907428] 9fe0: b6ec408c bef3485c b6ead42f b6c31f98
[  477.913188] irq event stamp: 37296889
[  477.917319] hardirqs last  enabled at (37296951): [<c03c1968>] __up_console_sem+0x50/0x60
[  477.926531] hardirqs last disabled at (37296972): [<c03c1954>] __up_console_sem+0x3c/0x60
[  477.935714] softirqs last  enabled at (37296986): [<c03016cc>] __do_softirq+0x318/0x4d4
[  477.944708] softirqs last disabled at (37296981): [<c034f9ec>] __irq_exit_rcu+0x140/0x160
[  477.953878] ---[ end trace 0000000000000000 ]---

So something, somewhere has gone wrong with the reference counts.

Steve

> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Makefile             |   1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  27 ++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 ++--
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 --
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 129 ------------------
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  18 ++-
>  include/drm/drm_gem_shmem_helper.h            |   7 -
>  8 files changed, 47 insertions(+), 178 deletions(-)
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
> index b0126b9fbadc..dcc2571c092b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -116,10 +116,6 @@ struct panfrost_device {
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
> index 175443eacead..8cf338c2a03b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -170,7 +170,6 @@ panfrost_lookup_bos(struct drm_device *dev,
>  			break;
>  		}
>  
> -		atomic_inc(&bo->gpu_usecount);
>  		job->mappings[i] = mapping;
>  	}
>  
> @@ -395,7 +394,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  {
>  	struct panfrost_file_priv *priv = file_priv->driver_priv;
>  	struct drm_panfrost_madvise *args = data;
> -	struct panfrost_device *pfdev = dev->dev_private;
>  	struct drm_gem_object *gem_obj;
>  	struct panfrost_gem_object *bo;
>  	int ret = 0;
> @@ -408,11 +406,15 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	bo = to_panfrost_bo(gem_obj);
>  
> +	if (bo->is_heap) {
> +		args->retained = 1;
> +		goto out_put_object;
> +	}
> +
>  	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
>  	if (ret)
>  		goto out_put_object;
>  
> -	mutex_lock(&pfdev->shrinker_lock);
>  	mutex_lock(&bo->mappings.lock);
>  	if (args->madv == PANFROST_MADV_DONTNEED) {
>  		struct panfrost_gem_mapping *first;
> @@ -438,17 +440,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
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
> @@ -577,9 +570,6 @@ static int panfrost_probe(struct platform_device *pdev)
>  	ddev->dev_private = pfdev;
>  	pfdev->ddev = ddev;
>  
> -	mutex_init(&pfdev->shrinker_lock);
> -	INIT_LIST_HEAD(&pfdev->shrinker_list);
> -
>  	err = panfrost_device_init(pfdev);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -601,10 +591,14 @@ static int panfrost_probe(struct platform_device *pdev)
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
> +	drm_dev_unregister(ddev);
>  err_out1:
>  	pm_runtime_disable(pfdev->dev);
>  	panfrost_device_fini(pfdev);
> @@ -620,7 +614,6 @@ static void panfrost_remove(struct platform_device *pdev)
>  	struct drm_device *ddev = pfdev->ddev;
>  
>  	drm_dev_unregister(ddev);
> -	panfrost_gem_shrinker_cleanup(ddev);
>  
>  	pm_runtime_get_sync(pfdev->dev);
>  	pm_runtime_disable(pfdev->dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 59c8c73c6a59..00165fca7f3d 100644
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
> @@ -195,6 +185,25 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>  	return drm_gem_shmem_object_pin(obj);
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
> @@ -207,6 +216,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vunmap = drm_gem_shmem_object_vunmap_locked,
>  	.mmap = drm_gem_shmem_object_mmap,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
> +	.evict = panfrost_shmem_evict,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index ad2877eeeccd..6ad1bcedb932 100644
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
> @@ -81,7 +75,4 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
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
> index a8b4827dc425..755128eb6c45 100644
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
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 2d7debc23ac1..13fe34236a0b 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -60,13 +60,6 @@ struct drm_gem_shmem_object {
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

