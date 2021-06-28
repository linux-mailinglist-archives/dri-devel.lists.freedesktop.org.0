Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3083B66C0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 18:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DE289CB8;
	Mon, 28 Jun 2021 16:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A489CAF;
 Mon, 28 Jun 2021 16:28:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="207809064"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="207809064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 09:28:36 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="419230312"
Received: from vipulcha-mobl.ger.corp.intel.com (HELO [10.213.225.54])
 ([10.213.225.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 09:28:34 -0700
Subject: Re: [PATCH v3 1/5] drm/i915/gem: Implement object migration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <363b99a9-d429-3611-c1a0-aae7f3722bd1@intel.com>
Date: Mon, 28 Jun 2021 17:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628144626.76126-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2021 15:46, Thomas Hellström wrote:
> Introduce an interface to migrate objects between regions.
> This is primarily intended to migrate objects to LMEM for display and
> to SYSTEM for dma-buf, but might be reused in one form or another for
> performance-based migration.
> 
> v2:
> - Verify that the memory region given as an id really exists.
>    (Reported by Matthew Auld)
> - Call i915_gem_object_{init,release}_memory_region() when switching region
>    to handle also switching region lists. (Reported by Matthew Auld)
> v3:
> - Fix i915_gem_object_can_migrate() to return true if object is already in
>    the correct region, even if the object ops doesn't have a migrate()
>    callback.
> - Update typo in commit message.
> - Fix kerneldoc of i915_gem_object_wait_migration().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 96 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 +++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  9 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 69 +++++++++----
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c      | 19 ++++
>   5 files changed, 188 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 07e8ff9a8aae..1c18be067b58 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -513,6 +513,102 @@ bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
>   	return obj->mem_flags & I915_BO_FLAG_IOMEM;
>   }
>   
> +/**
> + * i915_gem_object_can_migrate - Whether an object likely can be migrated
> + *
> + * @obj: The object to migrate
> + * @id: The region intended to migrate to
> + *
> + * Check whether the object backend supports migration to the
> + * given region. Note that pinning may affect the ability to migrate.
> + *
> + * Return: true if migration is possible, false otherwise.
> + */
> +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
> +				 enum intel_region_id id)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	unsigned int num_allowed = obj->mm.n_placements;
> +	struct intel_memory_region *mr;
> +	unsigned int i;
> +
> +	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
> +	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
> +
> +	mr = i915->mm.regions[id];
> +	if (!mr)
> +		return false;
> +
> +	if (obj->mm.region == mr)
> +		return true;
> +
> +	if (!i915_gem_object_evictable(obj))
> +		return false;
> +
> +	if (!obj->ops->migrate)
> +		return false;
> +
> +	if (!(obj->flags & I915_BO_ALLOC_USER))
> +		return true;
> +
> +	if (num_allowed == 0)
> +		return false;
> +
> +	for (i = 0; i < num_allowed; ++i) {
> +		if (mr == obj->mm.placements[i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * i915_gem_object_migrate - Migrate an object to the desired region id
> + * @obj: The object to migrate.
> + * @ww: An optional struct i915_gem_ww_ctx. If NULL, the backend may
> + * not be successful in evicting other objects to make room for this object.
> + * @id: The region id to migrate to.
> + *
> + * Attempt to migrate the object to the desired memory region. The
> + * object backend must support migration and the object may not be
> + * pinned, (explicitly pinned pages or pinned vmas). The object must
> + * be locked.
> + * On successful completion, the object will have pages pointing to
> + * memory in the new region, but an async migration task may not have
> + * completed yet, and to accomplish that, i915_gem_object_wait_migration()
> + * must be called.
> + *
> + * Return: 0 on success. Negative error code on failure. In particular may
> + * return -ENXIO on lack of region space, -EDEADLK for deadlock avoidance
> + * if @ww is set, -EINTR or -ERESTARTSYS if signal pending, and
> + * -EBUSY if the object is pinned.
> + */
> +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
> +			    struct i915_gem_ww_ctx *ww,
> +			    enum intel_region_id id)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct intel_memory_region *mr;
> +
> +	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
> +	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
> +	assert_object_held(obj);
> +
> +	mr = i915->mm.regions[id];
> +	GEM_BUG_ON(!mr);
> +
> +	if (obj->mm.region == mr)
> +		return 0;
> +
> +	if (!i915_gem_object_evictable(obj))
> +		return -EBUSY;
> +
> +	if (!obj->ops->migrate)
> +		return -EOPNOTSUPP;
> +
> +	return obj->ops->migrate(obj, mr);
> +}
> +
>   void i915_gem_init__objects(struct drm_i915_private *i915)
>   {
>   	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index ea3224a480c4..8cbd7a5334e2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -17,6 +17,8 @@
>   #include "i915_gem_ww.h"
>   #include "i915_vma_types.h"
>   
> +enum intel_region_id;
> +
>   /*
>    * XXX: There is a prevalence of the assumption that we fit the
>    * object's page count inside a 32bit _signed_ variable. Let's document
> @@ -597,6 +599,16 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
>   
>   bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
>   
> +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
> +			    struct i915_gem_ww_ctx *ww,
> +			    enum intel_region_id id);
> +
> +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
> +				 enum intel_region_id id);
> +
> +int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
> +				   unsigned int flags);
> +
>   #ifdef CONFIG_MMU_NOTIFIER
>   static inline bool
>   i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 441f913c87e6..ef3de2ae9723 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -18,6 +18,7 @@
>   
>   struct drm_i915_gem_object;
>   struct intel_fronbuffer;
> +struct intel_memory_region;
>   
>   /*
>    * struct i915_lut_handle tracks the fast lookups from handle to vma used
> @@ -77,6 +78,14 @@ struct drm_i915_gem_object_ops {
>   	 * delayed_free - Override the default delayed free implementation
>   	 */
>   	void (*delayed_free)(struct drm_i915_gem_object *obj);
> +
> +	/**
> +	 * migrate - Migrate object to a different region either for
> +	 * pinning or for as long as the object lock is held.
> +	 */
> +	int (*migrate)(struct drm_i915_gem_object *obj,
> +		       struct intel_memory_region *mr);
> +
>   	void (*release)(struct drm_i915_gem_object *obj);
>   
>   	const struct vm_operations_struct *mmap_ops;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index c39d982c4fa6..8f89185b6507 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -617,7 +617,8 @@ struct ttm_device_funcs *i915_ttm_driver(void)
>   	return &i915_ttm_bo_driver;
>   }
>   
> -static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> +static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
> +				struct ttm_placement *placement)
>   {
>   	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>   	struct ttm_operation_ctx ctx = {
> @@ -625,19 +626,12 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>   		.no_wait_gpu = false,
>   	};
>   	struct sg_table *st;
> -	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> -	struct ttm_placement placement;
>   	int real_num_busy;
>   	int ret;
>   
> -	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> -
> -	/* Move to the requested placement. */
> -	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> -
>   	/* First try only the requested placement. No eviction. */
> -	real_num_busy = fetch_and_zero(&placement.num_busy_placement);
> -	ret = ttm_bo_validate(bo, &placement, &ctx);
> +	real_num_busy = fetch_and_zero(&placement->num_busy_placement);
> +	ret = ttm_bo_validate(bo, placement, &ctx);
>   	if (ret) {
>   		ret = i915_ttm_err_to_gem(ret);
>   		/*
> @@ -652,8 +646,8 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>   		 * If the initial attempt fails, allow all accepted placements,
>   		 * evicting if necessary.
>   		 */
> -		placement.num_busy_placement = real_num_busy;
> -		ret = ttm_bo_validate(bo, &placement, &ctx);
> +		placement->num_busy_placement = real_num_busy;
> +		ret = ttm_bo_validate(bo, placement, &ctx);
>   		if (ret)
>   			return i915_ttm_err_to_gem(ret);
>   	}
> @@ -668,16 +662,56 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>   		i915_ttm_adjust_gem_after_move(obj);
>   	}
>   
> -	/* Object either has a page vector or is an iomem object */
> -	st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
> -	if (IS_ERR(st))
> -		return PTR_ERR(st);
> +	if (!obj->mm.pages) {

Is this for the migration case? Where are we updating the mm.pages, 
assuming the migration step has to take care of pre-existing pages? What 
am I missing?

> +		/* Object either has a page vector or is an iomem object */
> +		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
> +		if (IS_ERR(st))
> +			return PTR_ERR(st);
>   
> -	__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
> +		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
> +	}
>   
>   	return ret;
>   }
>   
> +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
> +{
> +	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> +	struct ttm_placement placement;
> +
> +	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> +
> +	/* Move to the requested placement. */
> +	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> +
> +	return __i915_ttm_get_pages(obj, &placement);
> +}
> +
> +static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
> +			    struct intel_memory_region *mr)
> +{
> +	struct ttm_place requested;
> +	struct ttm_placement placement;
> +	int ret;
> +
> +	i915_ttm_place_from_region(mr, &requested, obj->flags);
> +	placement.num_placement = 1;
> +	placement.num_busy_placement = 1;
> +	placement.placement = &requested;
> +	placement.busy_placement = &requested;
> +
> +	ret = __i915_ttm_get_pages(obj, &placement);
> +	if (ret)
> +		return ret;
> +
> +	if (obj->mm.region != mr) {
> +		i915_gem_object_release_memory_region(obj);
> +		i915_gem_object_init_memory_region(obj, mr);

Hmm, so is this not already handled by adjust_gem_after_move()?

> +	}
> +
> +	return 0;
> +}
> +
>   static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
>   			       struct sg_table *st)
>   {
> @@ -814,6 +848,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>   	.truncate = i915_ttm_purge,
>   	.adjust_lru = i915_ttm_adjust_lru,
>   	.delayed_free = i915_ttm_delayed_free,
> +	.migrate = i915_ttm_migrate,
>   	.mmap_offset = i915_ttm_mmap_offset,
>   	.mmap_ops = &vm_ops_ttm,
>   };
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 1070d3afdce7..f909aaa09d9c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -290,3 +290,22 @@ i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	i915_gem_object_put(obj);
>   	return ret;
>   }
> +
> +/**
> + * i915_gem_object_wait_migration - Sync an accelerated migration operation
> + * @obj: The migrating object.
> + * @flags: waiting flags. Currently supports only I915_WAIT_INTERRUPTIBLE.
> + *
> + * Wait for any pending async migration operation on the object,
> + * whether it's explicitly (i915_gem_object_migrate()) or implicitly
> + * (swapin, initial clearing) initiated.
> + *
> + * Return: 0 if successful, -ERESTARTSYS if a signal was hit during waiting.
> + */
> +int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
> +				   unsigned int flags)
> +{
> +	might_sleep();
> +	/* NOP for now. */
> +	return 0;
> +}
> 
