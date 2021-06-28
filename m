Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D283B6957
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818DF6E54C;
	Mon, 28 Jun 2021 19:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513A66E54C;
 Mon, 28 Jun 2021 19:54:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="206200489"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="206200489"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:54:32 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="641032875"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:54:30 -0700
Subject: Re: [PATCH v3 1/5] drm/i915/gem: Implement object migration
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-2-thomas.hellstrom@linux.intel.com>
 <edf2dc5e698a4ac6b16f9447e7f83794@intel.com>
 <6ea416ea-b2d8-1485-6375-52810699f838@linux.intel.com>
 <615aebfc2bfd45dc836e798182501ef3@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <3d6bcd4e-0d9a-b5b8-04e0-0361c4bef92d@linux.intel.com>
Date: Mon, 28 Jun 2021 21:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <615aebfc2bfd45dc836e798182501ef3@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, lkp <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/28/21 9:50 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: Monday, June 28, 2021 3:03 PM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>; lkp <lkp@intel.com>
>> Subject: Re: [PATCH v3 1/5] drm/i915/gem: Implement object migration
>>
>>
>> On 6/28/21 8:11 PM, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>> Thomas Hellström
>>>> Sent: Monday, June 28, 2021 10:46 AM
>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld,
>> Matthew
>>>> <matthew.auld@intel.com>; lkp <lkp@intel.com>
>>>> Subject: [PATCH v3 1/5] drm/i915/gem: Implement object migration
>>>>
>>>> Introduce an interface to migrate objects between regions.
>>>> This is primarily intended to migrate objects to LMEM for display and
>>>> to SYSTEM for dma-buf, but might be reused in one form or another for
>>>> performance-based migration.
>>>>
>>>> v2:
>>>> - Verify that the memory region given as an id really exists.
>>>>    (Reported by Matthew Auld)
>>>> - Call i915_gem_object_{init,release}_memory_region() when switching
>>>> region
>>>>    to handle also switching region lists. (Reported by Matthew Auld)
>>>> v3:
>>>> - Fix i915_gem_object_can_migrate() to return true if object is already in
>>>>    the correct region, even if the object ops doesn't have a migrate()
>>>>    callback.
>>>> - Update typo in commit message.
>>>> - Fix kerneldoc of i915_gem_object_wait_migration().
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>> drivers/gpu/drm/i915/gem/i915_gem_object.c    | 96
>>>> +++++++++++++++++++
>>>> drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 +++
>>>> .../gpu/drm/i915/gem/i915_gem_object_types.h  |  9 ++
>>>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 69 +++++++++----
>>>> drivers/gpu/drm/i915/gem/i915_gem_wait.c      | 19 ++++
>>>> 5 files changed, 188 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 07e8ff9a8aae..1c18be067b58 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -513,6 +513,102 @@ bool i915_gem_object_has_iomem(const struct
>>>> drm_i915_gem_object *obj)
>>>> 	return obj->mem_flags & I915_BO_FLAG_IOMEM;
>>>> }
>>>>
>>>> +/**
>>>> + * i915_gem_object_can_migrate - Whether an object likely can be
>> migrated
>>>> + *
>>>> + * @obj: The object to migrate
>>>> + * @id: The region intended to migrate to
>>>> + *
>>>> + * Check whether the object backend supports migration to the
>>>> + * given region. Note that pinning may affect the ability to migrate.
>>>> + *
>>>> + * Return: true if migration is possible, false otherwise.
>>>> + */
>>>> +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
>>>> +				 enum intel_region_id id)
>>>> +{
>>>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>> +	unsigned int num_allowed = obj->mm.n_placements;
>>>> +	struct intel_memory_region *mr;
>>>> +	unsigned int i;
>>>> +
>>>> +	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
>>>> +	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
>>>> +
>>>> +	mr = i915->mm.regions[id];
>>>> +	if (!mr)
>>>> +		return false;
>>>> +
>>>> +	if (obj->mm.region == mr)
>>>> +		return true;
>>>> +
>>>> +	if (!i915_gem_object_evictable(obj))
>>>> +		return false;
>>>> +
>>>> +	if (!obj->ops->migrate)
>>>> +		return false;
>>>> +
>>>> +	if (!(obj->flags & I915_BO_ALLOC_USER))
>>>> +		return true;
>>>> +
>>>> +	if (num_allowed == 0)
>>>> +		return false;
>>>> +
>>>> +	for (i = 0; i < num_allowed; ++i) {
>>>> +		if (mr == obj->mm.placements[i])
>>>> +			return true;
>>>> +	}
>>> Hi Thomas,
>>>
>>> I am a little confused over the difference in checks between this function
>>> and i915_gem_object_migrate().
>>>
>>> Why is the lack of an mr a BUG_ON in _object_migrate(), but here it just
>>> false?
>>>
>>> So that means that under certain circumstances, you could not have a mr?
>>>
>>> If that is the case, when?
>>>
>>> Would that be when the I915_BO_ALLOC_USER is set?
>>>
>>> If so, should there be a check for "non" user vs user?
>>>
>>> Or maybe document this function pointing out why there are differences
>>> and why?
>> Yes, I'll give it some more documentation. The basic idea is that the
>> above function also could be
>> used to validate user supplied data, whereas there might be cases where
>> we want to use the gem_object_migrate() function and override the above.
>>
>>
>>>> +	return false;
>>>> +}
>>>> +
>>>> +/**
>>>> + * i915_gem_object_migrate - Migrate an object to the desired region id
>>>> + * @obj: The object to migrate.
>>>> + * @ww: An optional struct i915_gem_ww_ctx. If NULL, the backend may
>>>> + * not be successful in evicting other objects to make room for this object.
>>> Is the ww for future consideration?  (I don't see any use of it in the patch).
>> Yes, but it will remain optional.
>>
>>
>>>> + * @id: The region id to migrate to.
>>>> + *
>>>> + * Attempt to migrate the object to the desired memory region. The
>>>> + * object backend must support migration and the object may not be
>>>> + * pinned, (explicitly pinned pages or pinned vmas). The object must
>>>> + * be locked.
>>>> + * On successful completion, the object will have pages pointing to
>>>> + * memory in the new region, but an async migration task may not have
>>>> + * completed yet, and to accomplish that,
>>>> i915_gem_object_wait_migration()
>>>> + * must be called.
>>>> + *
>>>> + * Return: 0 on success. Negative error code on failure. In particular may
>>>> + * return -ENXIO on lack of region space, -EDEADLK for deadlock
>> avoidance
>>>> + * if @ww is set, -EINTR or -ERESTARTSYS if signal pending, and
>>>> + * -EBUSY if the object is pinned.
>>>> + */
>>>> +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
>>>> +			    struct i915_gem_ww_ctx *ww,
>>>> +			    enum intel_region_id id)
>>>> +{
>>>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>> +	struct intel_memory_region *mr;
>>>> +
>>>> +	GEM_BUG_ON(id >= INTEL_REGION_UNKNOWN);
>>>> +	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
>>>> +	assert_object_held(obj);
>>>> +
>>>> +	mr = i915->mm.regions[id];
>>>> +	GEM_BUG_ON(!mr);
>>>> +
>>>> +	if (obj->mm.region == mr)
>>>> +		return 0;
>>>> +
>>>> +	if (!i915_gem_object_evictable(obj))
>>>> +		return -EBUSY;
>>>> +
>>>> +	if (!obj->ops->migrate)
>>>> +		return -EOPNOTSUPP;
>>> Why aren't you using _can_migrate here?
>> It's just in case we want to override. I'll add some more comments about
>> this.
>>
>>>> +	return obj->ops->migrate(obj, mr);
>>>> +}
>>>> +
>>>> void i915_gem_init__objects(struct drm_i915_private *i915)
>>>> {
>>>> 	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index ea3224a480c4..8cbd7a5334e2 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -17,6 +17,8 @@
>>>> #include "i915_gem_ww.h"
>>>> #include "i915_vma_types.h"
>>>>
>>>> +enum intel_region_id;
>>>> +
>>>> /*
>>>>    * XXX: There is a prevalence of the assumption that we fit the
>>>>    * object's page count inside a 32bit _signed_ variable. Let's document
>>>> @@ -597,6 +599,16 @@ bool i915_gem_object_migratable(struct
>>>> drm_i915_gem_object *obj);
>>>>
>>>> bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object
>>>> *obj);
>>>>
>>>> +int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
>>>> +			    struct i915_gem_ww_ctx *ww,
>>>> +			    enum intel_region_id id);
>>>> +
>>>> +bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
>>>> +				 enum intel_region_id id);
>>>> +
>>>> +int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
>>>> +				   unsigned int flags);
>>>> +
>>>> #ifdef CONFIG_MMU_NOTIFIER
>>>> static inline bool
>>>> i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> index 441f913c87e6..ef3de2ae9723 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> @@ -18,6 +18,7 @@
>>>>
>>>> struct drm_i915_gem_object;
>>>> struct intel_fronbuffer;
>>>> +struct intel_memory_region;
>>>>
>>>> /*
>>>>    * struct i915_lut_handle tracks the fast lookups from handle to vma used
>>>> @@ -77,6 +78,14 @@ struct drm_i915_gem_object_ops {
>>>> 	 * delayed_free - Override the default delayed free implementation
>>>> 	 */
>>>> 	void (*delayed_free)(struct drm_i915_gem_object *obj);
>>>> +
>>>> +	/**
>>>> +	 * migrate - Migrate object to a different region either for
>>>> +	 * pinning or for as long as the object lock is held.
>>>> +	 */
>>>> +	int (*migrate)(struct drm_i915_gem_object *obj,
>>>> +		       struct intel_memory_region *mr);
>>>> +
>>>> 	void (*release)(struct drm_i915_gem_object *obj);
>>>>
>>>> 	const struct vm_operations_struct *mmap_ops;
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> index c39d982c4fa6..8f89185b6507 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> @@ -617,7 +617,8 @@ struct ttm_device_funcs *i915_ttm_driver(void)
>>>> 	return &i915_ttm_bo_driver;
>>>> }
>>>>
>>>> -static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>>> +static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>>>> +				struct ttm_placement *placement)
>>>> {
>>>> 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>>> 	struct ttm_operation_ctx ctx = {
>>>> @@ -625,19 +626,12 @@ static int i915_ttm_get_pages(struct
>>>> drm_i915_gem_object *obj)
>>>> 		.no_wait_gpu = false,
>>>> 	};
>>>> 	struct sg_table *st;
>>>> -	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
>>>> -	struct ttm_placement placement;
>>>> 	int real_num_busy;
>>>> 	int ret;
>>>>
>>>> -	GEM_BUG_ON(obj->mm.n_placements >
>>>> I915_TTM_MAX_PLACEMENTS);
>>>> -
>>>> -	/* Move to the requested placement. */
>>>> -	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
>>>> -
>>>> 	/* First try only the requested placement. No eviction. */
>>>> -	real_num_busy =
>>>> fetch_and_zero(&placement.num_busy_placement);
>>>> -	ret = ttm_bo_validate(bo, &placement, &ctx);
>>>> +	real_num_busy = fetch_and_zero(&placement-
>>>>> num_busy_placement);
>>>> +	ret = ttm_bo_validate(bo, placement, &ctx);
>>>> 	if (ret) {
>>>> 		ret = i915_ttm_err_to_gem(ret);
>>>> 		/*
>>>> @@ -652,8 +646,8 @@ static int i915_ttm_get_pages(struct
>>>> drm_i915_gem_object *obj)
>>>> 		 * If the initial attempt fails, allow all accepted placements,
>>>> 		 * evicting if necessary.
>>>> 		 */
>>>> -		placement.num_busy_placement = real_num_busy;
>>>> -		ret = ttm_bo_validate(bo, &placement, &ctx);
>>>> +		placement->num_busy_placement = real_num_busy;
>>>> +		ret = ttm_bo_validate(bo, placement, &ctx);
>>>> 		if (ret)
>>>> 			return i915_ttm_err_to_gem(ret);
>>>> 	}
>>>> @@ -668,16 +662,56 @@ static int i915_ttm_get_pages(struct
>>>> drm_i915_gem_object *obj)
>>>> 		i915_ttm_adjust_gem_after_move(obj);
>>>> 	}
>>>>
>>>> -	/* Object either has a page vector or is an iomem object */
>>>> -	st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
>>>> -	if (IS_ERR(st))
>>>> -		return PTR_ERR(st);
>>>> +	if (!obj->mm.pages) {
>>>> +		/* Object either has a page vector or is an iomem object */
>>>> +		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj-
>>>>> ttm.cached_io_st;
>>>> +		if (IS_ERR(st))
>>>> +			return PTR_ERR(st);
>>>>
>>>> -	__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
>>>> +		__i915_gem_object_set_pages(obj, st,
>>>> i915_sg_dma_sizes(st->sgl));
>>>> +	}
>>>>
>>>> 	return ret;
>>>> }
>>>>
>>>> +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
>>>> +	struct ttm_placement placement;
>>>> +
>>>> +	GEM_BUG_ON(obj->mm.n_placements >
>>>> I915_TTM_MAX_PLACEMENTS);
>>>> +
>>>> +	/* Move to the requested placement. */
>>>> +	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
>>>> +
>>>> +	return __i915_ttm_get_pages(obj, &placement);
>>>> +}
>>>> +
>>>> +static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
>>>> +			    struct intel_memory_region *mr)
>>>> +{
>>>> +	struct ttm_place requested;
>>>> +	struct ttm_placement placement;
>>>> +	int ret;
>>>> +
>>>> +	i915_ttm_place_from_region(mr, &requested, obj->flags);
>>>> +	placement.num_placement = 1;
>>>> +	placement.num_busy_placement = 1;
>>>> +	placement.placement = &requested;
>>>> +	placement.busy_placement = &requested;
>>>> +
>>>> +	ret = __i915_ttm_get_pages(obj, &placement);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (obj->mm.region != mr) {
>>>> +		i915_gem_object_release_memory_region(obj);
>>>> +		i915_gem_object_init_memory_region(obj, mr);
>>>> +	}
>>> Perhaps a minor nit:
>>>
>>> Doing this after we have done the _get_pages() just doesn't seem right.
>>>
>>> I.e. we do work on the object, and then we init some portion of it.
>>>
>>> Do we need to do this incase the migration/placement fails?  If so,
>>> maybe a comment to that effect?
>> This is simply switching memory region under the lock, and to also move
>> to another memory region list. Is it the naming _release_ and _init_
>> that is confusing?
> Hmm, re-reading my question, I am wondering if I was unclear.
>
> My "real" question was, can the release/init occur before the _get_pages()?
>
> But looking at this some more, I can see answer is probably no.
>
> I was going to suggest calling _init_ _set_, but when I looked at it, it was
> doing init things as well as setting things
>
> Maybe just a comment like:
>
> /* Complete the migration by updating the memory region info. */
> if (object->mm...)

Sure, I'll add that. Note that another thread would have to take the 
object lock anyway to inspect both the region and the pages, so it 
shouldn't be confused by the order here.

/Thomas


