Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F01D4E0D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 14:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84D46EC8C;
	Fri, 15 May 2020 12:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5311E6EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:49:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E94FE1042;
 Fri, 15 May 2020 05:49:24 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D619B3F305;
 Fri, 15 May 2020 05:49:23 -0700 (PDT)
Subject: Re: [PATCH v2 11/38] drm/gem: add _locked suffix to drm_object_put
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-12-emil.l.velikov@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7eb76d94-74ae-8a88-2841-259279b1b0d8@arm.com>
Date: Fri, 15 May 2020 13:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515095118.2743122-12-emil.l.velikov@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2020 10:50, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Vast majority of DRM (core and drivers) are struct_mutex free.
> 
> As such we have only a handful of cases where the locked helper should
> be used. Make that stand out a little bit better.
> 
> Done via the following script:
> 
> __from=drm_gem_object_put
> __to=drm_gem_object_put_locked
> 
> for __file in $(git grep --name-only --word-regexp $__from); do
>    sed -i  "s/\<$__from\>/$__to/g" $__file;
> done
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

NIT: The subject is wrong: s/drm_object_put/drm_gem_object_put/

Otherwise with that fixes LTGM:

Reviewed-By: Steven Price <steven.price@arm.com>

Steve

> ---
>   drivers/gpu/drm/drm_gem.c                 | 6 +++---
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 4 ++--
>   drivers/gpu/drm/msm/msm_drv.c             | 2 +-
>   drivers/gpu/drm/msm/msm_gem.c             | 6 +++---
>   drivers/gpu/drm/msm/msm_gem_submit.c      | 2 +-
>   drivers/gpu/drm/msm/msm_gpu.c             | 2 +-
>   include/drm/drm_gem.h                     | 4 ++--
>   7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 599d5ff53b73..f21327ebc562 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -983,7 +983,7 @@ drm_gem_object_free(struct kref *kref)
>   EXPORT_SYMBOL(drm_gem_object_free);
>   
>   /**
> - * drm_gem_object_put - release a GEM buffer object reference
> + * drm_gem_object_put_locked - release a GEM buffer object reference
>    * @obj: GEM buffer object
>    *
>    * This releases a reference to @obj. Callers must hold the
> @@ -994,7 +994,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
>    * drm_gem_object_put_unlocked() instead.
>    */
>   void
> -drm_gem_object_put(struct drm_gem_object *obj)
> +drm_gem_object_put_locked(struct drm_gem_object *obj)
>   {
>   	if (obj) {
>   		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> @@ -1002,7 +1002,7 @@ drm_gem_object_put(struct drm_gem_object *obj)
>   		kref_put(&obj->refcount, drm_gem_object_free);
>   	}
>   }
> -EXPORT_SYMBOL(drm_gem_object_put);
> +EXPORT_SYMBOL(drm_gem_object_put_locked);
>   
>   /**
>    * drm_gem_vm_open - vma->ops->open implementation for GEM
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> index 8cae2ca4af6b..68eddac7771c 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -124,13 +124,13 @@ reset_set(void *data, u64 val)
>   
>   	if (a5xx_gpu->pm4_bo) {
>   		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pm4_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pm4_bo);
>   		a5xx_gpu->pm4_bo = NULL;
>   	}
>   
>   	if (a5xx_gpu->pfp_bo) {
>   		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pfp_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pfp_bo);
>   		a5xx_gpu->pfp_bo = NULL;
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 29295dee2a2e..6baed5b43ea3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -932,7 +932,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
>   		ret = 0;
>   	}
>   
> -	drm_gem_object_put(obj);
> +	drm_gem_object_put_locked(obj);
>   
>   unlock:
>   	mutex_unlock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..8696c405f709 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -879,7 +879,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>   }
>   #endif
>   
> -/* don't call directly!  Use drm_gem_object_put() and friends */
> +/* don't call directly!  Use drm_gem_object_put_locked() and friends */
>   void msm_gem_free_object(struct drm_gem_object *obj)
>   {
>   	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> @@ -1183,7 +1183,7 @@ static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
>   	return vaddr;
>   err:
>   	if (locked)
> -		drm_gem_object_put(obj);
> +		drm_gem_object_put_locked(obj);
>   	else
>   		drm_gem_object_put_unlocked(obj);
>   
> @@ -1215,7 +1215,7 @@ void msm_gem_kernel_put(struct drm_gem_object *bo,
>   	msm_gem_unpin_iova(bo, aspace);
>   
>   	if (locked)
> -		drm_gem_object_put(bo);
> +		drm_gem_object_put_locked(bo);
>   	else
>   		drm_gem_object_put_unlocked(bo);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 385d4965a8d0..8f450a245cfb 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -387,7 +387,7 @@ static void submit_cleanup(struct msm_gem_submit *submit)
>   		struct msm_gem_object *msm_obj = submit->bos[i].obj;
>   		submit_unlock_unpin_bo(submit, i, false);
>   		list_del_init(&msm_obj->submit_entry);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 615c5cda5389..86a68f96c48d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -694,7 +694,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   		/* move to inactive: */
>   		msm_gem_move_to_inactive(&msm_obj->base);
>   		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>   	}
>   
>   	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index c3bdade093ae..a231a2b3f5ac 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -187,7 +187,7 @@ struct drm_gem_object {
>   	 *
>   	 * Reference count of this object
>   	 *
> -	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put()
> +	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_locked()
>   	 * or drm_gem_object_put_unlocked() to release a reference to a GEM
>   	 * buffer object.
>   	 */
> @@ -375,7 +375,7 @@ drm_gem_object_put_unlocked(struct drm_gem_object *obj)
>   	kref_put(&obj->refcount, drm_gem_object_free);
>   }
>   
> -void drm_gem_object_put(struct drm_gem_object *obj);
> +void drm_gem_object_put_locked(struct drm_gem_object *obj);
>   
>   int drm_gem_handle_create(struct drm_file *file_priv,
>   			  struct drm_gem_object *obj,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
