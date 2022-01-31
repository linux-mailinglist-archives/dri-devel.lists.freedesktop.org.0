Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038404A4AF2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 16:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C3710E4FE;
	Mon, 31 Jan 2022 15:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DFC10E4FE;
 Mon, 31 Jan 2022 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643644187; x=1675180187;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZMrFCrNBpuFF9nsfOLmho9vGHjKR9bi5YfQohF0govM=;
 b=LEQQw/0PEbY9eaEkOaCYr/HYDdh1iaBfoNbZNrBMk+VpyOkwb/iQOikY
 MUBaDarydLx1PAFsVYNWCFryShvsFHhISDXDhrDsQqAy51uAj8tdAZqKl
 lVMslZ2zwh4eDYh/6wQ2mu5v5z0CdJCnDhEN/iRrf8R0Mjn1Zd6+ER6DW
 wga78RQZfsXMcKy0mTIkkQHSwI82ZuiQjAp99A2Smn0f3f9KM6MUnrHPA
 McpGmbUzVQ+YQNsPHeKq5nvCiVqnq4zdsq95ygkrYWnaEg7mSQ4fIQF3c
 oOgTegrV+o2N2X0I7O36pSoxxJcakWS66CyYYIS+ifZgE9ZnIemMFj8X8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="333840947"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="333840947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 07:49:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="698039950"
Received: from bvandelf-mobl1.ger.corp.intel.com (HELO [10.252.5.180])
 ([10.252.5.180])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 07:49:45 -0800
Message-ID: <7d5e1bfd-90be-8f51-b45d-acd11ce89068@intel.com>
Date: Mon, 31 Jan 2022 15:49:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/20] drm/i915: add I915_BO_ALLOC_TOPDOWN
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-7-matthew.auld@intel.com>
 <de1de76a-c2cd-adc2-cfe3-50d40920aa26@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <de1de76a-c2cd-adc2-cfe3-50d40920aa26@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/01/2022 15:28, Thomas Hellström wrote:
> On 1/26/22 16:21, Matthew Auld wrote:
>> If the user doesn't require CPU access for the buffer, then
>> ALLOC_TOPDOWN should be used, in order to prioritise allocating in the
>> non-mappable portion of LMEM.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> I was wondering how this would work best with user-space not supplying 
> any hints. Thinking that mappable LMEM buffers would be a minority, 
> wouldn't it be better to have TOPDOWN behaviour set by default. It would 
> then be migrated to mappable only if needed. And if the first usage is a 
> cpu-map it would either be mapped in system or immediately migrated from 
> pageless to mappable LMEM?

At this stage of the series I was mostly concerned with kernel internal 
users(including all of the selftests), for which pretty much all 
existing users want CPU access, so having that as the default seemed 
reasonable, and avoids needing to annotate lots of places with 
NEEDS_CPU_ACCESS. The TOPDOWN behaviour becomes the default for normal 
userspace objects later in the series, which only requires annotating 
one place.

> 
> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 15 +++++++++++----
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c        |  3 +++
>>   drivers/gpu/drm/i915/gem/i915_gem_region.c       |  5 +++++
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c          | 13 ++++++++++---
>>   drivers/gpu/drm/i915/gt/intel_gt.c               |  4 +++-
>>   drivers/gpu/drm/i915/i915_vma.c                  |  3 +++
>>   drivers/gpu/drm/i915/intel_region_ttm.c          | 11 ++++++++---
>>   drivers/gpu/drm/i915/selftests/mock_region.c     |  7 +------
>>   8 files changed, 44 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 71e778ecaeb8..29285aaf0477 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -319,15 +319,22 @@ struct drm_i915_gem_object {
>>   #define I915_BO_ALLOC_PM_VOLATILE BIT(4)
>>   /* Object needs to be restored early using memcpy during resume */
>>   #define I915_BO_ALLOC_PM_EARLY    BIT(5)
>> +/*
>> + * Object is likely never accessed by the CPU. This will prioritise 
>> the BO to be
>> + * allocated in the non-mappable portion of lmem. This is merely a 
>> hint, and if
>> + * dealing with userspace objects the CPU fault handler is free to 
>> ignore this.
>> + */
>> +#define I915_BO_ALLOC_TOPDOWN      BIT(6)
>>   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>>                    I915_BO_ALLOC_VOLATILE | \
>>                    I915_BO_ALLOC_CPU_CLEAR | \
>>                    I915_BO_ALLOC_USER | \
>>                    I915_BO_ALLOC_PM_VOLATILE | \
>> -                 I915_BO_ALLOC_PM_EARLY)
>> -#define I915_BO_READONLY          BIT(6)
>> -#define I915_TILING_QUIRK_BIT     7 /* unknown swizzling; do not 
>> release! */
>> -#define I915_BO_PROTECTED         BIT(8)
>> +                 I915_BO_ALLOC_PM_EARLY | \
>> +                 I915_BO_ALLOC_TOPDOWN)
>> +#define I915_BO_READONLY          BIT(7)
>> +#define I915_TILING_QUIRK_BIT     8 /* unknown swizzling; do not 
>> release! */
>> +#define I915_BO_PROTECTED         BIT(9)
>>       /**
>>        * @mem_flags - Mutable placement-related flags
>>        *
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 7d2211fbe548..a95b4d72619f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -346,6 +346,9 @@ void *i915_gem_object_pin_map(struct 
>> drm_i915_gem_object *obj,
>>           !i915_gem_object_has_iomem(obj))
>>           return ERR_PTR(-ENXIO);
>> +    if (WARN_ON_ONCE(obj->flags & I915_BO_ALLOC_TOPDOWN))
>> +        return ERR_PTR(-EINVAL);
>> +
>>       assert_object_held(obj);
>>       pinned = !(type & I915_MAP_OVERRIDE);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> index a4350227e9ae..f91e5a9c759d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> @@ -45,6 +45,11 @@ i915_gem_object_create_region(struct 
>> intel_memory_region *mem,
>>       GEM_BUG_ON(flags & ~I915_BO_ALLOC_FLAGS);
>> +    if (WARN_ON_ONCE(flags & I915_BO_ALLOC_TOPDOWN &&
>> +             (flags & I915_BO_ALLOC_CPU_CLEAR ||
>> +              flags & I915_BO_ALLOC_PM_EARLY)))
>> +        return ERR_PTR(-EINVAL);
>> +
>>       if (!mem)
>>           return ERR_PTR(-ENODEV);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index d9a04c7d41b1..e60b677ecd54 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -127,10 +127,14 @@ i915_ttm_place_from_region(const struct 
>> intel_memory_region *mr,
>>       place->mem_type = intel_region_to_ttm_type(mr);
>>       if (flags & I915_BO_ALLOC_CONTIGUOUS)
>> -        place->flags = TTM_PL_FLAG_CONTIGUOUS;
>> +        place->flags |= TTM_PL_FLAG_CONTIGUOUS;
>>       if (mr->io_size && mr->io_size < mr->total) {
>> -        place->fpfn = 0;
>> -        place->lpfn = mr->io_size >> PAGE_SHIFT;
>> +        if (flags & I915_BO_ALLOC_TOPDOWN) {
>> +            place->flags |= TTM_PL_FLAG_TOPDOWN;
>> +        } else {
>> +            place->fpfn = 0;
>> +            place->lpfn = mr->io_size >> PAGE_SHIFT;
>> +        }
>>       }
>>   }
>> @@ -890,6 +894,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>>       if (!obj)
>>           return VM_FAULT_SIGBUS;
>> +    if (obj->flags & I915_BO_ALLOC_TOPDOWN)
>> +        return -EINVAL;
>> +
>>       /* Sanity check that we allow writing into this object */
>>       if (unlikely(i915_gem_object_is_readonly(obj) &&
>>                area->vm_flags & VM_WRITE))
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 622cdfed8a8b..8b83a771a2f7 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -454,7 +454,9 @@ static int intel_gt_init_scratch(struct intel_gt 
>> *gt, unsigned int size)
>>       struct i915_vma *vma;
>>       int ret;
>> -    obj = i915_gem_object_create_lmem(i915, size, 
>> I915_BO_ALLOC_VOLATILE);
>> +    obj = i915_gem_object_create_lmem(i915, size,
>> +                      I915_BO_ALLOC_VOLATILE |
>> +                      I915_BO_ALLOC_TOPDOWN);
>>       if (IS_ERR(obj))
>>           obj = i915_gem_object_create_stolen(i915, size);
>>       if (IS_ERR(obj))
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index b1816a835abf..b2fdaa74e4b6 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -528,6 +528,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma 
>> *vma)
>>       void __iomem *ptr;
>>       int err;
>> +    if (WARN_ON_ONCE(vma->obj->flags & I915_BO_ALLOC_TOPDOWN))
>> +        return IO_ERR_PTR(-EINVAL);
>> +
>>       if (!i915_gem_object_is_lmem(vma->obj)) {
>>           if (GEM_WARN_ON(!i915_vma_is_map_and_fenceable(vma))) {
>>               err = -ENODEV;
>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c 
>> b/drivers/gpu/drm/i915/intel_region_ttm.c
>> index 4689192d5e8d..282802aed174 100644
>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
>> @@ -199,13 +199,18 @@ intel_region_ttm_resource_alloc(struct 
>> intel_memory_region *mem,
>>       struct ttm_resource *res;
>>       int ret;
>> +    if (flags & I915_BO_ALLOC_CONTIGUOUS)
>> +        place.flags |= TTM_PL_FLAG_CONTIGUOUS;
>>       if (mem->io_size && mem->io_size < mem->total) {
>> -        place.fpfn = 0;
>> -        place.lpfn = mem->io_size >> PAGE_SHIFT;
>> +        if (flags & I915_BO_ALLOC_TOPDOWN) {
>> +            place.flags |= TTM_PL_FLAG_TOPDOWN;
>> +        } else {
>> +            place.fpfn = 0;
>> +            place.lpfn = mem->io_size >> PAGE_SHIFT;
>> +        }
>>       }
>>       mock_bo.base.size = size;
>> -    place.flags = flags;
>>       ret = man->func->alloc(man, &mock_bo, &place, &res);
>>       if (ret == -ENOSPC)
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c 
>> b/drivers/gpu/drm/i915/selftests/mock_region.c
>> index 467eeae6d5f0..f64325491f35 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_region.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_region.c
>> @@ -22,17 +22,12 @@ static void mock_region_put_pages(struct 
>> drm_i915_gem_object *obj,
>>   static int mock_region_get_pages(struct drm_i915_gem_object *obj)
>>   {
>> -    unsigned int flags;
>>       struct sg_table *pages;
>>       int err;
>> -    flags = 0;
>> -    if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
>> -        flags |= TTM_PL_FLAG_CONTIGUOUS;
>> -
>>       obj->mm.res = intel_region_ttm_resource_alloc(obj->mm.region,
>>                                 obj->base.size,
>> -                              flags);
>> +                              obj->flags);
>>       if (IS_ERR(obj->mm.res))
>>           return PTR_ERR(obj->mm.res);
