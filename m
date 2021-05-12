Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D637BC0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 13:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93076EB80;
	Wed, 12 May 2021 11:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858836EB7C;
 Wed, 12 May 2021 11:50:29 +0000 (UTC)
IronPort-SDR: nkvgWnLilnd9DXBcY2X2QOpcEjT7gEcarisATgkv83LROJxflvC2LQEm/9Be/gjz9YaE55dkLT
 01DxwsCErrxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196588364"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="196588364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 04:50:24 -0700
IronPort-SDR: ZqNwYsaWg2fF3iVRnZ9kv8b9DDA6Q9612g4+6Yc2MisO4KPdJ02vaYYIFpDe0AJtKPQZm+aP+G
 a2s3RScsfnOQ==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="625304257"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 04:50:22 -0700
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM
 i915 gem object backend
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <CAM0jSHOwVB+1p9Rfx65N9C0wZmdmTV9z=guqagqfvdhDUDyLKw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ec0d9f3a-c615-787c-2542-d661e31820b4@linux.intel.com>
Date: Wed, 12 May 2021 13:50:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOwVB+1p9Rfx65N9C0wZmdmTV9z=guqagqfvdhDUDyLKw@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthew,

Thanks for reviewing!

On 5/12/21 1:45 PM, Matthew Auld wrote:
> On Tue, 11 May 2021 at 14:26, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Most logical place to introduce TTM buffer objects is as an i915
>> gem object backend. We need to add some ops to account for added
>> functionality like delayed delete and LRU list manipulation.
>>
>> Initially we support only LMEM and SYSTEM memory, but SYSTEM
>> (which in this case means evicted LMEM objects) is not
>> visible to i915 GEM yet. The plan is to move the i915 gem system region
>> over to the TTM system memory type in upcoming patches.
>>
>> We set up GPU bindings directly both from LMEM and from the system region,
>> as there is no need to use the legacy TTM_TT memory type. We reserve
>> that for future porting of GGTT bindings to TTM.
>>
>> There are some changes to TTM to allow for purging system memory buffer
>> objects and to refuse swapping of some objects: Unfortunately i915 gem
>> still relies heavily on short-term object pinning, and we've chosen to
>> keep short-term-pinned buffer objects on the TTM LRU lists for now,
>> meaning that we need some sort of mechanism to tell TTM they are not
>> swappable. A longer term goal is to get rid of the short-term pinning.
>>
>> Remove the old lmem backend.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |   1 +
>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  83 ---
>>   drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   5 -
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 126 +++--
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  18 +
>>   drivers/gpu/drm/i915/gem/i915_gem_region.c    |   6 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 534 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  48 ++
>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
>>   drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>>   drivers/gpu/drm/i915/intel_memory_region.c    |   1 -
>>   drivers/gpu/drm/i915/intel_memory_region.h    |   1 -
>>   drivers/gpu/drm/i915/intel_region_ttm.c       |   5 +-
>>   drivers/gpu/drm/i915/intel_region_ttm.h       |   7 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c                  |  12 +
>>   include/drm/ttm/ttm_device.h                  |   9 +
>>   17 files changed, 733 insertions(+), 140 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 958ccc1edfed..ef0d884a9e2d 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -155,6 +155,7 @@ gem-y += \
>>          gem/i915_gem_stolen.o \
>>          gem/i915_gem_throttle.o \
>>          gem/i915_gem_tiling.o \
>> +       gem/i915_gem_ttm.o \
>>          gem/i915_gem_ttm_bo_util.o \
>>          gem/i915_gem_userptr.o \
>>          gem/i915_gem_wait.o \
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
>> index f42803ea48f2..2b8cd15de1d9 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
>> @@ -4,73 +4,10 @@
>>    */
>>
>>   #include "intel_memory_region.h"
>> -#include "intel_region_ttm.h"
>>   #include "gem/i915_gem_region.h"
>>   #include "gem/i915_gem_lmem.h"
>>   #include "i915_drv.h"
>>
>> -static void lmem_put_pages(struct drm_i915_gem_object *obj,
>> -                                 struct sg_table *pages)
>> -{
>> -       intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
>> -       obj->mm.dirty = false;
>> -       sg_free_table(pages);
>> -       kfree(pages);
>> -}
>> -
>> -static int lmem_get_pages(struct drm_i915_gem_object *obj)
>> -{
>> -       unsigned int flags;
>> -       struct sg_table *pages;
>> -
>> -       flags = I915_ALLOC_MIN_PAGE_SIZE;
>> -       if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
>> -               flags |= I915_ALLOC_CONTIGUOUS;
>> -
>> -       obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj->mm.region,
>> -                                                        obj->base.size,
>> -                                                        flags);
>> -       if (IS_ERR(obj->mm.st_mm_node))
>> -               return PTR_ERR(obj->mm.st_mm_node);
>> -
>> -       /* Range manager is always contigous */
>> -       if (obj->mm.region->is_range_manager)
>> -               obj->flags |= I915_BO_ALLOC_CONTIGUOUS;
>> -       pages = intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_mm_node);
>> -       if (IS_ERR(pages))
>> -               return PTR_ERR(pages);
>> -
>> -       __i915_gem_object_set_pages(obj, pages,
>> -                                   i915_sg_dma_page_sizes(pages->sgl));
>> -
>> -       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR) {
>> -               void __iomem *vaddr =
>> -                       i915_gem_object_lmem_io_map(obj, 0, obj->base.size);
> Where did the object clearing go? I'm not seeing it in the new code.

It's in the move callback with TTM. If the object had not been 
previously initialized,
the copying is skipped, and a fill is done instead.

>
> <snip>
>
>> +
>> +static struct sg_table *
>> +i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>> +                        struct ttm_resource *res)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +       struct ttm_resource_manager *man =
>> +               ttm_manager_type(bo->bdev, res->mem_type);
>> +       struct sg_table *st;
>> +
>> +       if (man->use_tt)
>> +               return i915_ttm_tt_get_st(bo->ttm);
>> +
>> +       st = kzalloc(sizeof(*st), GFP_KERNEL);
>> +       if (!st)
>> +               return ERR_PTR(-ENOMEM);
> The st is already allocated below.
Will fix.
>
> <snip>
>
>> +
>> +/**
>> + * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
>> + * @mem: The initial memory region for the object.
>> + * @obj: The gem object.
>> + * @size: Object size in bytes.
>> + * @flags: gem object flags.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>> +                              struct drm_i915_gem_object *obj,
>> +                              resource_size_t size,
>> +                              unsigned int flags)
>> +{
>> +       static struct lock_class_key lock_class;
>> +       struct drm_i915_private *i915 = mem->i915;
>> +       size_t alignment = 0;
>> +       int ret;
>> +
>> +       /* Adjust alignment to GPU- and CPU huge page sizes. */
>> +
>> +       if (mem->is_range_manager) {
>> +               if (size >= SZ_1G)
>> +                       alignment = SZ_1G >> PAGE_SHIFT;
>> +               else if (size >= SZ_2M)
>> +                       alignment = SZ_2M >> PAGE_SHIFT;
>> +               else if (size >= SZ_64K)
>> +                       alignment = SZ_64K >> PAGE_SHIFT;
>> +       }
>> +
>> +       drm_gem_private_object_init(&i915->drm, &obj->base, size);
>> +       i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
>> +       i915_gem_object_init_memory_region(obj, mem);
>> +       i915_gem_object_make_unshrinkable(obj);
>> +
>> +       ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>> +                         ttm_bo_type_kernel, &i915_sys_placement, alignment,
>> +                         true, NULL, NULL, i915_ttm_bo_destroy);
> Handle the error?
Ugh. Will fix
>
>> +
>> +       obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
>> +
>> +       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>> +
>> +       return 0;
>> +}


Thanks!

Thomas


