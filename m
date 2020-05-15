Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A11D4E0F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 14:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABA76EC90;
	Fri, 15 May 2020 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C7E06EC91
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:49:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40B731042;
 Fri, 15 May 2020 05:49:30 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E243F305;
 Fri, 15 May 2020 05:49:29 -0700 (PDT)
Subject: Re: [PATCH v2 27/38] drm/panfrost: remove _unlocked suffix in
 drm_object_put_unlocked
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-28-emil.l.velikov@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <871bb65a-28a1-9e86-7941-2b6d5b9fdad9@arm.com>
Date: Fri, 15 May 2020 13:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-28-emil.l.velikov@gmail.com>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2020 10:51, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> 
> Just drop the suffix. It makes the API cleaner.
> 
> Done via the following script:
> 
> __from=drm_gem_object_put_unlocked
> __to=drm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>    sed -i  "s/$__from/$__to/g" $__file;
> done
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

NIT: The subject is wrong: s/drm_object_put/drm_gem_object_put/

With that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c     | 10 +++++-----
>   drivers/gpu/drm/panfrost/panfrost_gem.c     |  4 ++--
>   drivers/gpu/drm/panfrost/panfrost_job.c     |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_mmu.c     |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  4 ++--
>   5 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 882fecc33fdb..ada51df9a7a3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -99,7 +99,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>   
>   	mapping = panfrost_gem_mapping_get(bo, priv);
>   	if (!mapping) {
> -		drm_gem_object_put_unlocked(&bo->base.base);
> +		drm_gem_object_put(&bo->base.base);
>   		return -EINVAL;
>   	}
>   
> @@ -317,7 +317,7 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *data,
>   	if (!ret)
>   		ret = timeout ? -ETIMEDOUT : -EBUSY;
>   
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>   
>   	return ret;
>   }
> @@ -351,7 +351,7 @@ static int panfrost_ioctl_mmap_bo(struct drm_device *dev, void *data,
>   		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>   
>   out:
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>   	return ret;
>   }
>   
> @@ -372,7 +372,7 @@ static int panfrost_ioctl_get_bo_offset(struct drm_device *dev, void *data,
>   	bo = to_panfrost_bo(gem_obj);
>   
>   	mapping = panfrost_gem_mapping_get(bo, priv);
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>   
>   	if (!mapping)
>   		return -EINVAL;
> @@ -438,7 +438,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>   	mutex_unlock(&bo->mappings.lock);
>   	mutex_unlock(&pfdev->shrinker_lock);
>   
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 17b654e1eb94..ac5d0aa80276 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -93,7 +93,7 @@ static void panfrost_gem_mapping_release(struct kref *kref)
>   	mapping = container_of(kref, struct panfrost_gem_mapping, refcount);
>   
>   	panfrost_gem_teardown_mapping(mapping);
> -	drm_gem_object_put_unlocked(&mapping->obj->base.base);
> +	drm_gem_object_put(&mapping->obj->base.base);
>   	kfree(mapping);
>   }
>   
> @@ -261,7 +261,7 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>   	 */
>   	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
>   	/* drop reference from allocate - handle holds it now. */
> -	drm_gem_object_put_unlocked(&shmem->base);
> +	drm_gem_object_put(&shmem->base);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7914b1570841..b2f09c038d35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -281,7 +281,7 @@ static void panfrost_job_cleanup(struct kref *ref)
>   
>   	if (job->bos) {
>   		for (i = 0; i < job->bo_count; i++)
> -			drm_gem_object_put_unlocked(job->bos[i]);
> +			drm_gem_object_put(job->bos[i]);
>   
>   		kvfree(job->bos);
>   	}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index ed28aeba6d59..0a339c6fbfaa 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -538,7 +538,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>   err_pages:
>   	drm_gem_shmem_put_pages(&bo->base);
>   err_bo:
> -	drm_gem_object_put_unlocked(&bo->base.base);
> +	drm_gem_object_put(&bo->base.base);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 6913578d5aa7..ec4695cf3caf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -156,7 +156,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>   		gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0xffffffff);
>   
>   	/* The BO ref is retained by the mapping. */
> -	drm_gem_object_put_unlocked(&bo->base);
> +	drm_gem_object_put(&bo->base);
>   
>   	return 0;
>   
> @@ -167,7 +167,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>   err_close_bo:
>   	panfrost_gem_close(&bo->base, file_priv);
>   err_put_bo:
> -	drm_gem_object_put_unlocked(&bo->base);
> +	drm_gem_object_put(&bo->base);
>   	return ret;
>   }
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
