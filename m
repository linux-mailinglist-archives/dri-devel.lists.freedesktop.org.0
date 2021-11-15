Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A254502C8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8C6E8ED;
	Mon, 15 Nov 2021 10:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3956A6E8E3;
 Mon, 15 Nov 2021 10:49:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="257166894"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="257166894"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:49:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="566404750"
Received: from jmegan-mobl.ger.corp.intel.com (HELO [10.252.8.73])
 ([10.252.8.73])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:49:34 -0800
Message-ID: <8a789fe6-4278-a9a3-0201-82f80cc5a69a@intel.com>
Date: Mon, 15 Nov 2021 10:49:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/6] drm/i915/ttm: Break refcounting loops at device
 region unref time
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
 <20211114111218.623138-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211114111218.623138-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 14/11/2021 11:12, Thomas Hellström wrote:
> There is an interesting refcounting loop:
> struct intel_memory_region has a struct ttm_resource_manager,
> ttm_resource_manager->move may hold a reference to i915_request,
> i915_request may hold a reference to intel_context,
> intel_context may hold a reference to drm_i915_gem_object,
> drm_i915_gem_object may hold a reference to intel_memory_region.

Would it help if we drop the per object region refcoutning? IIRC that 
was originally added to more cleanly appease some selftest teardown or 
something.

> 
> Break this loop when we drop the device reference count on the
> region by putting the region move fence.
> 
> Also hold dropping the device reference count until all objects of
> the region has been deleted, to avoid issues if proceeding with the
> device takedown while the region is still present.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c     |  1 +
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c |  1 +
>   drivers/gpu/drm/i915/intel_memory_region.c  |  5 +++-
>   drivers/gpu/drm/i915/intel_memory_region.h  |  1 +
>   drivers/gpu/drm/i915/intel_region_ttm.c     | 28 +++++++++++++++++++++
>   drivers/gpu/drm/i915/intel_region_ttm.h     |  2 ++
>   6 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 537a81445b90..a1df49378a0f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1044,6 +1044,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   
>   static const struct intel_memory_region_ops ttm_system_region_ops = {
>   	.init_object = __i915_gem_ttm_object_init,
> +	.disable = intel_region_ttm_disable,
>   };
>   
>   struct intel_memory_region *
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index aec838ecb2ef..956916fd21f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -108,6 +108,7 @@ region_lmem_init(struct intel_memory_region *mem)
>   static const struct intel_memory_region_ops intel_region_lmem_ops = {
>   	.init = region_lmem_init,
>   	.release = region_lmem_release,
> +	.disable = intel_region_ttm_disable,
>   	.init_object = __i915_gem_ttm_object_init,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index e7f7e6627750..1f67d2b68c24 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -233,8 +233,11 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
>   		struct intel_memory_region *region =
>   			fetch_and_zero(&i915->mm.regions[i]);
>   
> -		if (region)
> +		if (region) {
> +			if (region->ops->disable)
> +				region->ops->disable(region);
>   			intel_memory_region_put(region);
> +		}
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 3feae3353d33..9bb77eacd206 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -52,6 +52,7 @@ struct intel_memory_region_ops {
>   
>   	int (*init)(struct intel_memory_region *mem);
>   	void (*release)(struct intel_memory_region *mem);
> +	void (*disable)(struct intel_memory_region *mem);
>   
>   	int (*init_object)(struct intel_memory_region *mem,
>   			   struct drm_i915_gem_object *obj,
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 2e901a27e259..4219d83a2b19 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -114,6 +114,34 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
>   	mem->region_private = NULL;
>   }
>   
> +/**
> + * intel_region_ttm_disable - A TTM region disable callback helper
> + * @mem: The memory region.
> + *
> + * A helper that ensures that nothing any longer references a region at
> + * device takedown. Breaks refcounting loops and waits for objects in the
> + * region to be deleted.
> + */
> +void intel_region_ttm_disable(struct intel_memory_region *mem)
> +{
> +	struct ttm_resource_manager *man = mem->region_private;
> +
> +	/*
> +	 * Put the region's move fences. This releases requests that
> +	 * may hold on to contexts and vms that may hold on to buffer
> +	 * objects that may have a refcount on the region. :/
> +	 */
> +	if (man)
> +		ttm_resource_manager_cleanup(man);
> +
> +	/* Flush objects that may just have been freed */
> +	i915_gem_flush_free_objects(mem->i915);
> +
> +	/* Wait until the only region reference left is our own. */
> +	while (kref_read(&mem->kref) > 1)
> +		msleep(20);

If we leak an object, I guess we get an infinite loop here at driver 
release?

> +}
> +
>   /**
>    * intel_region_ttm_resource_to_rsgt -
>    * Convert an opaque TTM resource manager resource to a refcounted sg_table.
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
> index 7bbe2b46b504..197a8c179370 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.h
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.h
> @@ -22,6 +22,8 @@ int intel_region_ttm_init(struct intel_memory_region *mem);
>   
>   void intel_region_ttm_fini(struct intel_memory_region *mem);
>   
> +void intel_region_ttm_disable(struct intel_memory_region *mem);
> +
>   struct i915_refct_sgt *
>   intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
>   				  struct ttm_resource *res);
> 
