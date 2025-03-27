Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743EA72F25
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99910E8A5;
	Thu, 27 Mar 2025 11:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNgpzjyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC49E10E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743074846; x=1774610846;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HtfcmMhfTVpx6CO2LNav2kK6hxP9dxXovNBekGqqQAI=;
 b=QNgpzjyZQJNJOewmzFhPuZq/HxrQyDujnM8MTSCzf/YYtoOWMxVPYfvN
 V9sKrJ/kqX4aI2gVJnW5vEy46DPLqeEW384wfCzwoyFwACTjnb0UFBz4O
 vwXjz2PdpuyBZ1Qb0x+y9+yWg7/Y/JN9882rFiPXdu6iI0lGq4mB44C3u
 PiXcWKarYer5MbZ6H5dOkUW29ApIHqN8C97QI1p0ZmnrXG0lnikL3EKJY
 rJ2nwpS2l5H8A2EG4BVoavS81GTxx3Jt0eFzO3KOxqCClDVFCxFYHwUma
 fsMXZS411W1z7puUopwOaMZe2LR6s5/jEIEz+dukh3TyOwLSrvdUyTFmv A==;
X-CSE-ConnectionGUID: NWzrwug9SOGhbXLEO6ZuKQ==
X-CSE-MsgGUID: sw4demuiT0C2cEuMLqmnVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55058687"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55058687"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:27:26 -0700
X-CSE-ConnectionGUID: GKmXEAGyTPut4aSZgJQgqQ==
X-CSE-MsgGUID: P8OiKgE8SKuD356W4bcMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124912406"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:27:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu
 <yuq825@gmail.com>, Steven Price <steven.price@arm.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v20 05/10] drm/shmem-helper: Refactor locked/unlocked
 functions
In-Reply-To: <87iknu67hd.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-6-dmitry.osipenko@collabora.com>
 <87iknu67hd.fsf@intel.com>
Date: Thu, 27 Mar 2025 13:27:18 +0200
Message-ID: <87friy67e1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 27 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Sun, 23 Mar 2025, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>> Add locked and remove unlocked postfixes from drm-shmem function names,
>> making names consistent with the drm/gem core code.
>
> This breaks the build for drivers/accel/ivpu/ivpu_gem.c.
>
> Please enable CONFIG_DRM_ACCEL_IVPU=m and fix the fallout.

Ditto for CONFIG_DRM_ACCEL_AMDXDNA=m.

>
> BR,
> Jani.
>
>
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 60 +++++++++----------
>>  drivers/gpu/drm/imagination/pvr_gem.c         |  4 +-
>>  drivers/gpu/drm/lima/lima_gem.c               |  2 +-
>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
>>  drivers/gpu/drm/tests/drm_gem_shmem_test.c    | 14 ++---
>>  include/drm/drm_gem_shmem_helper.h            | 28 ++++-----
>>  7 files changed, 56 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 98c68999d61a..a9e35a46e72b 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -174,7 +174,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  			kfree(shmem->sgt);
>>  		}
>>  		if (shmem->pages)
>> -			drm_gem_shmem_put_pages(shmem);
>> +			drm_gem_shmem_put_pages_locked(shmem);
>>  
>>  		drm_WARN_ON(obj->dev, shmem->pages_use_count);
>>  
>> @@ -186,7 +186,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>>  }
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
>>  
>> -static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>> +static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  	struct page **pages;
>> @@ -220,12 +220,12 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>>  }
>>  
>>  /*
>> - * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
>> + * drm_gem_shmem_put_pages_locked - Decrease use count on the backing pages for a shmem GEM object
>>   * @shmem: shmem GEM object
>>   *
>>   * This function decreases the use count and puts the backing pages when use drops to zero.
>>   */
>> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>> +void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  
>> @@ -247,7 +247,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>>  			  shmem->pages_mark_accessed_on_put);
>>  	shmem->pages = NULL;
>>  }
>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>>  
>>  int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>>  {
>> @@ -257,7 +257,7 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>>  
>>  	drm_WARN_ON(shmem->base.dev, drm_gem_is_imported(&shmem->base));
>>  
>> -	ret = drm_gem_shmem_get_pages(shmem);
>> +	ret = drm_gem_shmem_get_pages_locked(shmem);
>>  
>>  	return ret;
>>  }
>> @@ -267,7 +267,7 @@ void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
>>  {
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> -	drm_gem_shmem_put_pages(shmem);
>> +	drm_gem_shmem_put_pages_locked(shmem);
>>  }
>>  EXPORT_SYMBOL(drm_gem_shmem_unpin_locked);
>>  
>> @@ -318,7 +318,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>>  
>>  /*
>> - * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
>> + * drm_gem_shmem_vmap_locked - Create a virtual mapping for a shmem GEM object
>>   * @shmem: shmem GEM object
>>   * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
>>   *       store.
>> @@ -327,13 +327,13 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>>   * exists for the buffer backing the shmem GEM object. It hides the differences
>>   * between dma-buf imported and natively allocated objects.
>>   *
>> - * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
>> + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap_locked().
>>   *
>>   * Returns:
>>   * 0 on success or a negative error code on failure.
>>   */
>> -int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>> -		       struct iosys_map *map)
>> +int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>> +			      struct iosys_map *map)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  	int ret = 0;
>> @@ -356,7 +356,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>  			return 0;
>>  		}
>>  
>> -		ret = drm_gem_shmem_get_pages(shmem);
>> +		ret = drm_gem_shmem_get_pages_locked(shmem);
>>  		if (ret)
>>  			goto err_zero_use;
>>  
>> @@ -379,28 +379,28 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>  
>>  err_put_pages:
>>  	if (!drm_gem_is_imported(obj))
>> -		drm_gem_shmem_put_pages(shmem);
>> +		drm_gem_shmem_put_pages_locked(shmem);
>>  err_zero_use:
>>  	shmem->vmap_use_count = 0;
>>  
>>  	return ret;
>>  }
>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap);
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap_locked);
>>  
>>  /*
>> - * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
>> + * drm_gem_shmem_vunmap_locked - Unmap a virtual mapping for a shmem GEM object
>>   * @shmem: shmem GEM object
>>   * @map: Kernel virtual address where the SHMEM GEM object was mapped
>>   *
>>   * This function cleans up a kernel virtual address mapping acquired by
>> - * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
>> - * zero.
>> + * drm_gem_shmem_vmap_locked(). The mapping is only removed when the use count
>> + * drops to zero.
>>   *
>>   * This function hides the differences between dma-buf imported and natively
>>   * allocated objects.
>>   */
>> -void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>> -			  struct iosys_map *map)
>> +void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>> +				 struct iosys_map *map)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  
>> @@ -416,12 +416,12 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>>  			return;
>>  
>>  		vunmap(shmem->vaddr);
>> -		drm_gem_shmem_put_pages(shmem);
>> +		drm_gem_shmem_put_pages_locked(shmem);
>>  	}
>>  
>>  	shmem->vaddr = NULL;
>>  }
>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap);
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);
>>  
>>  static int
>>  drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>> @@ -449,7 +449,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>>  /* Update madvise status, returns true if not purged, else
>>   * false or -errno.
>>   */
>> -int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
>> +int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv)
>>  {
>>  	dma_resv_assert_held(shmem->base.resv);
>>  
>> @@ -460,9 +460,9 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
>>  
>>  	return (madv >= 0);
>>  }
>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise);
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_madvise_locked);
>>  
>> -void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>> +void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>>  	struct drm_device *dev = obj->dev;
>> @@ -476,7 +476,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>>  	kfree(shmem->sgt);
>>  	shmem->sgt = NULL;
>>  
>> -	drm_gem_shmem_put_pages(shmem);
>> +	drm_gem_shmem_put_pages_locked(shmem);
>>  
>>  	shmem->madv = -1;
>>  
>> @@ -492,7 +492,7 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
>>  
>>  	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
>>  }
>> -EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_purge_locked);
>>  
>>  /**
>>   * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
>> @@ -589,7 +589,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>  
>>  	dma_resv_lock(shmem->base.resv, NULL);
>> -	drm_gem_shmem_put_pages(shmem);
>> +	drm_gem_shmem_put_pages_locked(shmem);
>>  	dma_resv_unlock(shmem->base.resv);
>>  
>>  	drm_gem_vm_close(vma);
>> @@ -639,7 +639,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>>  		return -EINVAL;
>>  
>>  	dma_resv_lock(shmem->base.resv, NULL);
>> -	ret = drm_gem_shmem_get_pages(shmem);
>> +	ret = drm_gem_shmem_get_pages_locked(shmem);
>>  	dma_resv_unlock(shmem->base.resv);
>>  
>>  	if (ret)
>> @@ -707,7 +707,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>  
>>  	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>>  
>> -	ret = drm_gem_shmem_get_pages(shmem);
>> +	ret = drm_gem_shmem_get_pages_locked(shmem);
>>  	if (ret)
>>  		return ERR_PTR(ret);
>>  
>> @@ -729,7 +729,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>  	sg_free_table(sgt);
>>  	kfree(sgt);
>>  err_put_pages:
>> -	drm_gem_shmem_put_pages(shmem);
>> +	drm_gem_shmem_put_pages_locked(shmem);
>>  	return ERR_PTR(ret);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
>> index 6a8c81fe8c1e..d9d7c6d1a138 100644
>> --- a/drivers/gpu/drm/imagination/pvr_gem.c
>> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
>> @@ -203,7 +203,7 @@ pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj)
>>  
>>  	dma_resv_lock(obj->resv, NULL);
>>  
>> -	err = drm_gem_shmem_vmap(shmem_obj, &map);
>> +	err = drm_gem_shmem_vmap_locked(shmem_obj, &map);
>>  	if (err)
>>  		goto err_unlock;
>>  
>> @@ -257,7 +257,7 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
>>  			dma_sync_sgtable_for_device(dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
>>  	}
>>  
>> -	drm_gem_shmem_vunmap(shmem_obj, &map);
>> +	drm_gem_shmem_vunmap_locked(shmem_obj, &map);
>>  
>>  	dma_resv_unlock(obj->resv);
>>  }
>> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
>> index 9bb997dbb4b9..609221351cde 100644
>> --- a/drivers/gpu/drm/lima/lima_gem.c
>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>> @@ -195,7 +195,7 @@ static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>>  	if (bo->heap_size)
>>  		return -EINVAL;
>>  
>> -	return drm_gem_shmem_vmap(&bo->base, map);
>> +	return drm_gem_shmem_vmap_locked(&bo->base, map);
>>  }
>>  
>>  static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index 0f3935556ac7..a731f6b59a42 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -476,7 +476,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>>  		}
>>  	}
>>  
>> -	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
>> +	args->retained = drm_gem_shmem_madvise_locked(&bo->base, args->madv);
>>  
>>  	if (args->retained) {
>>  		if (args->madv == PANFROST_MADV_DONTNEED)
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> index 3d9f51bd48b6..02b60ea1433a 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> @@ -51,7 +51,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
>>  		goto unlock_mappings;
>>  
>>  	panfrost_gem_teardown_mappings_locked(bo);
>> -	drm_gem_shmem_purge(&bo->base);
>> +	drm_gem_shmem_purge_locked(&bo->base);
>>  	ret = true;
>>  
>>  	dma_resv_unlock(shmem->base.resv);
>> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> index fd4215e2f982..98884966bb92 100644
>> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> @@ -173,7 +173,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
>>  	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>>  
>> -	ret = drm_gem_shmem_vmap(shmem, &map);
>> +	ret = drm_gem_shmem_vmap_locked(shmem, &map);
>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>>  	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
>>  	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
>> @@ -183,7 +183,7 @@ static void drm_gem_shmem_test_vmap(struct kunit *test)
>>  	for (i = 0; i < TEST_SIZE; i++)
>>  		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
>>  
>> -	drm_gem_shmem_vunmap(shmem, &map);
>> +	drm_gem_shmem_vunmap_locked(shmem, &map);
>>  	KUNIT_EXPECT_NULL(test, shmem->vaddr);
>>  	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
>>  }
>> @@ -281,17 +281,17 @@ static void drm_gem_shmem_test_madvise(struct kunit *test)
>>  	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>>  
>> -	ret = drm_gem_shmem_madvise(shmem, 1);
>> +	ret = drm_gem_shmem_madvise_locked(shmem, 1);
>>  	KUNIT_EXPECT_TRUE(test, ret);
>>  	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
>>  
>>  	/* Set madv to a negative value */
>> -	ret = drm_gem_shmem_madvise(shmem, -1);
>> +	ret = drm_gem_shmem_madvise_locked(shmem, -1);
>>  	KUNIT_EXPECT_FALSE(test, ret);
>>  	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>>  
>>  	/* Check that madv cannot be set back to a positive value */
>> -	ret = drm_gem_shmem_madvise(shmem, 0);
>> +	ret = drm_gem_shmem_madvise_locked(shmem, 0);
>>  	KUNIT_EXPECT_FALSE(test, ret);
>>  	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>>  }
>> @@ -319,7 +319,7 @@ static void drm_gem_shmem_test_purge(struct kunit *test)
>>  	ret = drm_gem_shmem_is_purgeable(shmem);
>>  	KUNIT_EXPECT_FALSE(test, ret);
>>  
>> -	ret = drm_gem_shmem_madvise(shmem, 1);
>> +	ret = drm_gem_shmem_madvise_locked(shmem, 1);
>>  	KUNIT_EXPECT_TRUE(test, ret);
>>  
>>  	/* The scatter/gather table will be freed by drm_gem_shmem_free */
>> @@ -329,7 +329,7 @@ static void drm_gem_shmem_test_purge(struct kunit *test)
>>  	ret = drm_gem_shmem_is_purgeable(shmem);
>>  	KUNIT_EXPECT_TRUE(test, ret);
>>  
>> -	drm_gem_shmem_purge(shmem);
>> +	drm_gem_shmem_purge_locked(shmem);
>>  	KUNIT_EXPECT_NULL(test, shmem->pages);
>>  	KUNIT_EXPECT_NULL(test, shmem->sgt);
>>  	KUNIT_EXPECT_EQ(test, shmem->madv, -1);
>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>> index cef5a6b5a4d6..0609e336479d 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -102,19 +102,19 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
>>  							   struct vfsmount *gemfs);
>>  void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
>>  
>> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
>> +void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
>>  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
>>  void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
>> -int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>> -		       struct iosys_map *map);
>> -void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>> -			  struct iosys_map *map);
>> +int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>> +			      struct iosys_map *map);
>> +void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>> +				 struct iosys_map *map);
>>  int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>>  
>>  int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>>  void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>>  
>> -int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
>> +int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
>>  
>>  static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
>>  {
>> @@ -123,7 +123,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
>>  		!shmem->base.dma_buf && !drm_gem_is_imported(&shmem->base);
>>  }
>>  
>> -void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
>> +void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
>>  
>>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
>>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
>> @@ -214,12 +214,12 @@ static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_
>>  }
>>  
>>  /*
>> - * drm_gem_shmem_object_vmap - GEM object function for drm_gem_shmem_vmap()
>> + * drm_gem_shmem_object_vmap - GEM object function for drm_gem_shmem_vmap_locked()
>>   * @obj: GEM object
>>   * @map: Returns the kernel virtual address of the SHMEM GEM object's backing store.
>>   *
>> - * This function wraps drm_gem_shmem_vmap(). Drivers that employ the shmem helpers should
>> - * use it as their &drm_gem_object_funcs.vmap handler.
>> + * This function wraps drm_gem_shmem_vmap_locked(). Drivers that employ the shmem
>> + * helpers should use it as their &drm_gem_object_funcs.vmap handler.
>>   *
>>   * Returns:
>>   * 0 on success or a negative error code on failure.
>> @@ -229,7 +229,7 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
>>  {
>>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>  
>> -	return drm_gem_shmem_vmap(shmem, map);
>> +	return drm_gem_shmem_vmap_locked(shmem, map);
>>  }
>>  
>>  /*
>> @@ -237,15 +237,15 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
>>   * @obj: GEM object
>>   * @map: Kernel virtual address where the SHMEM GEM object was mapped
>>   *
>> - * This function wraps drm_gem_shmem_vunmap(). Drivers that employ the shmem helpers should
>> - * use it as their &drm_gem_object_funcs.vunmap handler.
>> + * This function wraps drm_gem_shmem_vunmap_locked(). Drivers that employ the shmem
>> + * helpers should use it as their &drm_gem_object_funcs.vunmap handler.
>>   */
>>  static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
>>  					       struct iosys_map *map)
>>  {
>>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>  
>> -	drm_gem_shmem_vunmap(shmem, map);
>> +	drm_gem_shmem_vunmap_locked(shmem, map);
>>  }
>>  
>>  /**

-- 
Jani Nikula, Intel
