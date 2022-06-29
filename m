Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8B560684
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D924210E5C6;
	Wed, 29 Jun 2022 16:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D210E5C6;
 Wed, 29 Jun 2022 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656521236; x=1688057236;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0zek2beenUVnGJWRYhLnUx9OySaQ3lIolD2prlVfhPc=;
 b=dJyd2bG5d2rFywhTWCIGdoag9b44HUqWGRJDtsw0tfUR1/U3uZ1p3Rcm
 Ze1SiMj5E3W13k0JIGdyK4Gh8mD79PmDEodXqrM1rRf6xbTAYF0ao4k9Q
 B9lc5HdFkDFLoXb1anoBXCiAT88NqXmcEcFBvaSDvDyJ0k1D5zIEjLFzM
 joc1iNTr8KOA3as+9hqwZgUWnB0MGUHfx6FnG4QSLp4AXrti+I74Z2HK0
 kP3QmWnjHrLHyTtC2OS+K459en248FiQ1yoU/Hr9m6JH2v6E28VCd7F6S
 Ixk182t8/qAZcbROZXCJb/34pFhZeEdHGyYccXeeaJcYq0aXbS51kKqXt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="307581170"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="307581170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:47:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647477298"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.56])
 ([10.249.254.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:47:13 -0700
Message-ID: <18b9ce96-1b02-e5a6-fba0-731ba461c194@linux.intel.com>
Date: Wed, 29 Jun 2022 18:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 11/13] drm/i915/ttm: handle blitter failure on DG2
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220629121427.353800-1-matthew.auld@intel.com>
 <20220629121427.353800-12-matthew.auld@intel.com>
 <6de9f08e-a171-ca14-b9cc-770e34088644@linux.intel.com>
 <88fce8f0-71ae-7d64-2ebf-f016ab2dac5b@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <88fce8f0-71ae-7d64-2ebf-f016ab2dac5b@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/22 18:28, Matthew Auld wrote:
> On 29/06/2022 17:11, Thomas Hellström wrote:
>> Hi, Matthew,
>>
>> On 6/29/22 14:14, Matthew Auld wrote:
>>> If the move or clear operation somehow fails, and the memory underneath
>>> is not cleared, like when moving to lmem, then we currently fallback to
>>> memcpy or memset. However with small-BAR systems this fallback might no
>>> longer be possible. For now we use the set_wedged sledgehammer if we
>>> ever encounter such a scenario, and mark the object as borked to plug
>>> any holes where access to the memory underneath can happen. Add some
>>> basic selftests to exercise this.
>>>
>>> v2:
>>>    - In the selftests make sure we grab the runtime pm around the 
>>> reset.
>>>      Also make sure we grab the reset lock before checking if the 
>>> device
>>>      is wedged, since the wedge might still be in-progress and hence 
>>> the
>>>      bit might not be set yet.
>>>    - Don't wedge or put the object into an unknown state, if the 
>>> request
>>>      construction fails (or similar). Just returning an error and
>>>      skipping the fallback should be safe here.
>>>    - Make sure we wedge each gt. (Thomas)
>>>    - Peek at the unknown_state in io_reserve, that way we don't have to
>>>      export or hand roll the fault_wait_for_idle. (Thomas)
>>>    - Add the missing read-side barriers for the unknown_state. (Thomas)
>>>    - Some kernel-doc fixes. (Thomas)
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  21 +++
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   1 +
>>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  18 +++
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +++-
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   3 +
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  88 +++++++++--
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |   1 +
>>>   .../drm/i915/gem/selftests/i915_gem_migrate.c | 141 
>>> +++++++++++++++---
>>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  69 +++++++++
>>>   drivers/gpu/drm/i915/i915_vma.c               |  25 ++--
>>>   10 files changed, 346 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> index 06b1b188ce5a..642a5d59ce26 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -783,10 +783,31 @@ int i915_gem_object_wait_moving_fence(struct 
>>> drm_i915_gem_object *obj,
>>>                       intr, MAX_SCHEDULE_TIMEOUT);
>>>       if (!ret)
>>>           ret = -ETIME;
>>> +    else if (ret > 0 && i915_gem_object_has_unknown_state(obj))
>>> +        ret = -EIO;
>>>       return ret < 0 ? ret : 0;
>>>   }
>>> +/**
>>> + * i915_gem_object_has_unknown_state - Return true if the object 
>>> backing pages are
>>> + * in an unknown_state. This means that userspace must NEVER be 
>>> allowed to touch
>>> + * the pages, with either the GPU or CPU.
>>> + *
>>> + * ONLY valid to be called after ensuring that all kernel fences 
>>> have signalled
>>> + * (in particular the fence for moving/clearing the object).
>>> + */
>>> +bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object 
>>> *obj)
>>> +{
>>> +    /*
>>> +     * The below barrier pairs with the dma_fence_signal() in
>>> +     * __memcpy_work(). We should only sample the unknown_state 
>>> after all
>>> +     * the kernel fences have signalled.
>>> +     */
>>> +    smp_rmb();
>>> +    return obj->mm.unknown_state;
>>> +}
>>> +
>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>   #include "selftests/huge_gem_object.c"
>>>   #include "selftests/huge_pages.c"
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index e11d82a9f7c3..0bf3ee27a2a8 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -524,6 +524,7 @@ int i915_gem_object_get_moving_fence(struct 
>>> drm_i915_gem_object *obj,
>>>                        struct dma_fence **fence);
>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object 
>>> *obj,
>>>                         bool intr);
>>> +bool i915_gem_object_has_unknown_state(struct drm_i915_gem_object 
>>> *obj);
>>>   void i915_gem_object_set_cache_coherency(struct 
>>> drm_i915_gem_object *obj,
>>>                        unsigned int cache_level);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> index 2c88bdb8ff7c..5cf36a130061 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> @@ -547,6 +547,24 @@ struct drm_i915_gem_object {
>>>            */
>>>           bool ttm_shrinkable;
>>> +        /**
>>> +         * @unknown_state: Indicate that the object is effectively
>>> +         * borked. This is write-once and set if we somehow 
>>> encounter a
>>> +         * fatal error when moving/clearing the pages, and we are not
>>> +         * able to fallback to memcpy/memset, like on small-BAR 
>>> systems.
>>> +         * The GPU should also be wedged (or in the process) at this
>>> +         * point.
>>> +         *
>>> +         * Only valid to read this after acquiring the dma-resv 
>>> lock and
>>> +         * waiting for all DMA_RESV_USAGE_KERNEL fences to be 
>>> signalled,
>>> +         * or if we otherwise know that the moving fence has 
>>> signalled,
>>> +         * and we are certain the pages underneath are valid for
>>> +         * immediate access (under normal operation), like just 
>>> prior to
>>> +         * binding the object or when setting up the CPU fault 
>>> handler.
>>> +         * See i915_gem_object_has_unknown_state();
>>> +         */
>>> +        bool unknown_state;
>>> +
>>>           /**
>>>            * Priority list of potential placements for this object.
>>>            */
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 4c25d9b2f138..098409a33e10 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -675,7 +675,15 @@ static void i915_ttm_swap_notify(struct 
>>> ttm_buffer_object *bo)
>>>           i915_ttm_purge(obj);
>>>   }
>>> -static bool i915_ttm_resource_mappable(struct ttm_resource *res)
>>> +/**
>>> + * i915_ttm_resource_mappable - Return true if the ttm resource is CPU
>>> + * accessible.
>>> + * @res: The TTM resource to check.
>>> + *
>>> + * This is interesting on small-BAR systems where we may encounter 
>>> lmem objects
>>> + * that can't be accessed via the CPU.
>>> + */
>>> +bool i915_ttm_resource_mappable(struct ttm_resource *res)
>>>   {
>>>       struct i915_ttm_buddy_resource *bman_res = 
>>> to_ttm_buddy_resource(res);
>>> @@ -687,6 +695,22 @@ static bool i915_ttm_resource_mappable(struct 
>>> ttm_resource *res)
>>>   static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct 
>>> ttm_resource *mem)
>>>   {
>>> +    struct drm_i915_gem_object *obj = i915_ttm_to_gem(mem->bo);
>>> +    bool unknown_state;
>>> +
>>> +    if (!obj)
>>> +        return -EINVAL;
>>> +
>>> +    if (!kref_get_unless_zero(&obj->base.refcount))
>>> +        return -EINVAL;
>>> +
>>> +    assert_object_held(obj);
>>> +
>>> +    unknown_state = i915_gem_object_has_unknown_state(obj);
>>> +    i915_gem_object_put(obj);
>>> +    if (unknown_state)
>>> +        return -EINVAL;
>>> +
>>>       if (!i915_ttm_cpu_maps_iomem(mem))
>>>           return 0;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>>> index 73e371aa3850..e4842b4296fc 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>>> @@ -92,4 +92,7 @@ static inline bool i915_ttm_cpu_maps_iomem(struct 
>>> ttm_resource *mem)
>>>       /* Once / if we support GGTT, this is also false for cached 
>>> ttm_tts */
>>>       return mem->mem_type != I915_PL_SYSTEM;
>>>   }
>>> +
>>> +bool i915_ttm_resource_mappable(struct ttm_resource *res);
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> index a10716f4e717..364e7fe8efb1 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> @@ -33,6 +33,7 @@
>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>   static bool fail_gpu_migration;
>>>   static bool fail_work_allocation;
>>> +static bool ban_memcpy;
>>>   void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
>>>                       bool work_allocation)
>>> @@ -40,6 +41,11 @@ void i915_ttm_migrate_set_failure_modes(bool 
>>> gpu_migration,
>>>       fail_gpu_migration = gpu_migration;
>>>       fail_work_allocation = work_allocation;
>>>   }
>>> +
>>> +void i915_ttm_migrate_set_ban_memcpy(bool ban)
>>> +{
>>> +    ban_memcpy = ban;
>>> +}
>>>   #endif
>>>   static enum i915_cache_level
>>> @@ -258,15 +264,23 @@ struct i915_ttm_memcpy_arg {
>>>    * from the callback for lockdep reasons.
>>>    * @cb: Callback for the accelerated migration fence.
>>>    * @arg: The argument for the memcpy functionality.
>>> + * @i915: The i915 pointer.
>>> + * @obj: The GEM object.
>>> + * @memcpy_allowed: Instead of processing the @arg, and falling 
>>> back to memcpy
>>> + * or memset, we wedge the device and set the @obj unknown_state, 
>>> to prevent
>>> + * further access to the object with the CPU or GPU.  On some 
>>> devices we might
>>> + * only be permitted to use the blitter engine for such operations.
>>>    */
>>>   struct i915_ttm_memcpy_work {
>>>       struct dma_fence fence;
>>>       struct work_struct work;
>>> -    /* The fence lock */
>>>       spinlock_t lock;
>>>       struct irq_work irq_work;
>>>       struct dma_fence_cb cb;
>>>       struct i915_ttm_memcpy_arg arg;
>>> +    struct drm_i915_private *i915;
>>> +    struct drm_i915_gem_object *obj;
>>> +    bool memcpy_allowed;
>>>   };
>>>   static void i915_ttm_move_memcpy(struct i915_ttm_memcpy_arg *arg)
>>> @@ -319,12 +333,34 @@ static void __memcpy_work(struct work_struct 
>>> *work)
>>>       struct i915_ttm_memcpy_arg *arg = &copy_work->arg;
>>>       bool cookie = dma_fence_begin_signalling();
>>> -    i915_ttm_move_memcpy(arg);
>>> +    if (copy_work->memcpy_allowed) {
>>> +        i915_ttm_move_memcpy(arg);
>>> +    } else {
>>> +        /*
>>> +         * Prevent further use of the object. Any future GTT 
>>> binding or
>>> +         * CPU access is not allowed once we signal the fence. Outside
>>> +         * of the fence critical section, we then also then wedge 
>>> the gpu
>>> +         * to indicate the device is not functional.
>>> +         *
>>> +         * The below dma_fence_signal() is our write-memory-barrier.
>>> +         */
>>> +        copy_work->obj->mm.unknown_state = true;
>>> +    }
>>> +
>>>       dma_fence_end_signalling(cookie);
>>>       dma_fence_signal(&copy_work->fence);
>>> +    if (!copy_work->memcpy_allowed) {
>>> +        struct intel_gt *gt;
>>> +        unsigned int id;
>>> +
>>> +        for_each_gt(gt, copy_work->i915, id)
>>> +            intel_gt_set_wedged(gt);
>>> +    }
>>
>> Did you try to move the gt wedging to before dma_fence_signal, but 
>> before dma_fence_end_signalling? Otherwise I think there is a race 
>> opportunity (albeit very unlikely) where the gpu might read 
>> uninitialized content.
>
> I didn't try moving the set_wedged. But here AFAIK the wedge is not 
> needed to prevent GPU access to the pages, more just to indicate that 
> something is very broken. Prior to binding the object, either for the 
> sync or async case (which must be after we signalled the clear/move 
> here I think) we always first sample the unknown_state, and just keep 
> the PTEs pointing to scratch if it has been set.

Ah yes, understood.

/Thomas


