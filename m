Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900D4DB3E2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B989C48;
	Wed, 16 Mar 2022 15:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B57D989C1B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:04:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F24421476;
 Wed, 16 Mar 2022 08:04:20 -0700 (PDT)
Received: from [10.57.43.235] (unknown [10.57.43.235])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5001D3F7D7;
 Wed, 16 Mar 2022 08:04:18 -0700 (PDT)
Message-ID: <4e6256d0-a3c6-ba01-c31f-a5757b79a9ce@arm.com>
Date: Wed, 16 Mar 2022 15:04:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 8/8] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-9-dmitry.osipenko@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220314224253.236359-9-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2022 22:42, Dmitry Osipenko wrote:
> Replace Panfrost's memory shrinker with a generic DRM memory shrinker.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

I gave this a spin on my Firefly-RK3288 board and everything seems to
work. So feel free to add a:

Tested-by: Steven Price <steven.price@arm.com>

As Alyssa has already pointed out you need to remove the
panfrost_gem_shrinker.c file. But otherwise everything looks fine, and
I'm very happy to see the shrinker code gone ;)

Thanks,

Steve

>  drivers/gpu/drm/panfrost/Makefile          |  1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ----
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 19 ++-------------
>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 27 ++++++++++++++--------
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  9 --------
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 22 +++++++++++++++++-
>  6 files changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index b71935862417..ecf0864cb515 100644
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
> index 94b6f0a19c83..b014dadcf51f 100644
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
> @@ -390,7 +389,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  {
>  	struct panfrost_file_priv *priv = file_priv->driver_priv;
>  	struct drm_panfrost_madvise *args = data;
> -	struct panfrost_device *pfdev = dev->dev_private;
>  	struct drm_gem_object *gem_obj;
>  	struct panfrost_gem_object *bo;
>  	int ret = 0;
> @@ -403,7 +401,6 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	bo = to_panfrost_bo(gem_obj);
>  
> -	mutex_lock(&pfdev->shrinker_lock);
>  	mutex_lock(&bo->mappings.lock);
>  	if (args->madv == PANFROST_MADV_DONTNEED) {
>  		struct panfrost_gem_mapping *first;
> @@ -429,17 +426,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  
>  	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
>  
> -	if (args->retained) {
> -		if (args->madv == PANFROST_MADV_DONTNEED)
> -			list_add_tail(&bo->base.madv_list,
> -				      &pfdev->shrinker_list);
> -		else if (args->madv == PANFROST_MADV_WILLNEED)
> -			list_del_init(&bo->base.madv_list);
> -	}
> -
>  out_unlock_mappings:
>  	mutex_unlock(&bo->mappings.lock);
> -	mutex_unlock(&pfdev->shrinker_lock);
>  
>  	drm_gem_object_put(gem_obj);
>  	return ret;
> @@ -570,9 +558,6 @@ static int panfrost_probe(struct platform_device *pdev)
>  	ddev->dev_private = pfdev;
>  	pfdev->ddev = ddev;
>  
> -	mutex_init(&pfdev->shrinker_lock);
> -	INIT_LIST_HEAD(&pfdev->shrinker_list);
> -
>  	err = panfrost_device_init(pfdev);
>  	if (err) {
>  		if (err != -EPROBE_DEFER)
> @@ -594,7 +579,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto err_out1;
>  
> -	panfrost_gem_shrinker_init(ddev);
> +	drm_gem_shmem_shrinker_register(ddev);
>  
>  	return 0;
>  
> @@ -612,8 +597,8 @@ static int panfrost_remove(struct platform_device *pdev)
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
> index 293e799e2fe8..d164d05ed84e 100644
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
> @@ -195,6 +185,22 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>  	return drm_gem_shmem_pin(&bo->base);
>  }
>  
> +static unsigned long panfrost_gem_purge(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +
> +	if (!mutex_trylock(&bo->mappings.lock))
> +		return 0;
> +
> +	panfrost_gem_teardown_mappings_locked(bo);
> +	drm_gem_shmem_purge_locked(&bo->base);
> +
> +	mutex_unlock(&bo->mappings.lock);
> +
> +	return shmem->base.size >> PAGE_SHIFT;
> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.free = panfrost_gem_free_object,
>  	.open = panfrost_gem_open,
> @@ -207,6 +213,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
> +	.purge = panfrost_gem_purge,
>  };
>  
>  /**
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a6925dbb6224..e767e526e897 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -267,6 +267,22 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
>  		dma_resv_add_excl_fence(bos[i]->resv, fence);
>  }
>  
> +static bool panfrost_objects_alive(struct drm_gem_object **bos, int bo_count)
> +{
> +	struct panfrost_gem_object *bo;
> +	bool alive = true;
> +
> +	while (alive && bo_count--) {
> +		bo = to_panfrost_bo(bos[bo_count]);
> +
> +		mutex_lock(&bo->mappings.lock);
> +		alive = !bo->base.madv;
> +		mutex_unlock(&bo->mappings.lock);
> +	}
> +
> +	return alive;
> +}
> +
>  int panfrost_job_push(struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> @@ -278,6 +294,11 @@ int panfrost_job_push(struct panfrost_job *job)
>  	if (ret)
>  		return ret;
>  
> +	if (!panfrost_objects_alive(job->bos, job->bo_count)) {
> +		ret = -ENOMEM;
> +		goto unlock;
> +	}
> +
>  	mutex_lock(&pfdev->sched_lock);
>  	drm_sched_job_arm(&job->base);
>  
> @@ -319,7 +340,6 @@ static void panfrost_job_cleanup(struct kref *ref)
>  			if (!job->mappings[i])
>  				break;
>  
> -			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>  			panfrost_gem_mapping_put(job->mappings[i]);
>  		}
>  		kvfree(job->mappings);

