Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1300388CD2
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989BC6ED26;
	Wed, 19 May 2021 11:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545776E0CB;
 Wed, 19 May 2021 11:29:54 +0000 (UTC)
IronPort-SDR: KimdIFIZrqYcEI6VCL156iJvOT+jtqieMfWILBROke1Ei9hS6I4yUxdqEK6LWLfNnqQOMsgRBL
 y3n5UgTsOPPg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="201012218"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="201012218"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 04:29:53 -0700
IronPort-SDR: CV7bWyQGGp7P/0MmNTJvSEkU3DEAmczYakI4NUmx2pV26X98XfUSe91IcefXhwi1MXfTe8ci9h
 Uec8AlrMZOSg==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="627629061"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.222])
 ([10.249.254.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 04:29:51 -0700
Subject: Re: [Intel-gfx] [PATCH v2 10/15] drm/i915/ttm: Introduce a TTM i915
 gem object backend
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-11-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPLdajyqtZBsR1C75aSgBa8wV1FLnQSa+tytAOKr5x11A@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <bceb5941-ef60-0c6b-40b4-f27792924146@linux.intel.com>
Date: Wed, 19 May 2021 13:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPLdajyqtZBsR1C75aSgBa8wV1FLnQSa+tytAOKr5x11A@mail.gmail.com>
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot for reviewing, Matthew!

On 5/19/21 11:53 AM, Matthew Auld wrote:
> On Tue, 18 May 2021 at 09:28, Thomas Hellström
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
>> Remove the old lmem backend.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> +/**
>> + * i915_gem_object_evictable - Whether object is likely evictable after unbind.
>> + * @obj: The object to check
>> + *
>> + * This function checks whether the object is likely unvictable after unbind.
>> + * If the object is not locked when checking, the result is only advisory.
>> + * If the object is locked when checking, and the function returns true,
>> + * then an eviction should indeed be possible. But since unlocked vma
>> + * unpinning and unbinding is currently possible, the object can actually
>> + * become evictable even if this function returns false.
>> + *
>> + * Return: true if the object may be evictable. False otherwise.
>> + */
>> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj)
>> +{
>> +       struct i915_vma *vma;
>> +       int pin_count = atomic_read(&obj->mm.pages_pin_count);
>> +
>> +       if (!pin_count)
>> +               return true;
>> +
>> +       spin_lock(&obj->vma.lock);
>> +       list_for_each_entry(vma, &obj->vma.list, obj_link) {
>> +               if (i915_vma_is_pinned(vma)) {
>> +                       spin_unlock(&obj->vma.lock);
>> +                       return false;
>> +               }
>> +               if (atomic_read(&vma->pages_count))
>> +                       pin_count--;
> Can't pages_count be > 1, which would also be reflected in
> pages_pin_count? The vma_pin path looks very complex.

Yes, and Maarten pointed out a bug in it as well. We now only take a 
pages_pin_count when vma->pages_count transitions from 0->1 so the above 
code should be correct, I think.

>
>> +       }
>> +       spin_unlock(&obj->vma.lock);
>> +       GEM_WARN_ON(pin_count < 0);
>> +
>> +       return pin_count == 0;
>> +}
>> +
>>   void i915_gem_init__objects(struct drm_i915_private *i915)
>>   {
>>          INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 2ebd79537aea..ae5930e307d5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -200,6 +200,9 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj)
>>
>>   static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
>>   {
>> +       if (obj->ops->adjust_lru)
>> +               obj->ops->adjust_lru(obj);
> Interesting, so we bump the lru even when we just drop the lock?
Yes, as an initial approximation. TTM has historically done this and it 
may not be the best choice, but dropping the lock means we've just used 
the object for something, typically CS, so hence we bump the LRU.
>> +
>>          dma_resv_unlock(obj->base.resv);
>>   }
>>
>> @@ -587,6 +590,12 @@ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset,
>>
>>   bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
>>
>> +void __i915_gem_free_object_rcu(struct rcu_head *head);
>> +
>> +void __i915_gem_free_object(struct drm_i915_gem_object *obj);
>> +
>> +bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
>> +
>>   #ifdef CONFIG_MMU_NOTIFIER
>>   static inline bool
>>   i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 98f69d8fd37d..b350765e1935 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -63,6 +63,20 @@ struct drm_i915_gem_object_ops {
>>                        const struct drm_i915_gem_pwrite *arg);
>>
>>          int (*dmabuf_export)(struct drm_i915_gem_object *obj);
>> +
>> +       /**
>> +        * adjust_lru - notify that the madvise value was updated
>> +        * @obj: The gem object
>> +        *
>> +        * The madvise value may have been updated, or object was recently
>> +        * referenced so act accordingly (Perhaps changing an LRU list etc).
>> +        */
>> +       void (*adjust_lru)(struct drm_i915_gem_object *obj);
>> +
>> +       /**
>> +        * delayed_free - Override the default delayed free implementation
>> +        */
>> +       void (*delayed_free)(struct drm_i915_gem_object *obj);
>>          void (*release)(struct drm_i915_gem_object *obj);
>>
>>          const char *name; /* friendly name for debug, e.g. lockdep classes */
>> @@ -307,6 +321,10 @@ struct drm_i915_gem_object {
>>                  bool dirty:1;
>>          } mm;
>>
>> +       struct {
>> +               struct sg_table *cached_io_st;
>> +       } ttm;
>> +
>>          /** Record of address bit 17 of each page at last unbind. */
>>          unsigned long *bit_17;
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> index f25e6646c5b7..d1f1840540dd 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
>> @@ -18,11 +18,7 @@ void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
>>
>>          mutex_lock(&mem->objects.lock);
>>
>> -       if (obj->flags & I915_BO_ALLOC_VOLATILE)
>> -               list_add(&obj->mm.region_link, &mem->objects.purgeable);
>> -       else
>> -               list_add(&obj->mm.region_link, &mem->objects.list);
>> -
>> +       list_add(&obj->mm.region_link, &mem->objects.list);
>>          mutex_unlock(&mem->objects.lock);
>>   }
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> new file mode 100644
>> index 000000000000..790f5ec45c4d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -0,0 +1,519 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include <drm/ttm/ttm_bo_driver.h>
>> +#include <drm/ttm/ttm_placement.h>
>> +
>> +#include "i915_drv.h"
>> +#include "intel_memory_region.h"
>> +#include "intel_region_ttm.h"
>> +
>> +#include "gem/i915_gem_object.h"
>> +#include "gem/i915_gem_region.h"
>> +#include "gem/i915_gem_ttm.h"
>> +#include "gem/i915_gem_ttm_bo_util.h"
>> +
>> +#define I915_PL_LMEM0 TTM_PL_PRIV
>> +#define I915_PL_SYSTEM TTM_PL_SYSTEM
>> +#define I915_PL_STOLEN TTM_PL_VRAM
>> +#define I915_PL_GGTT TTM_PL_TT
>> +
>> +#define I915_TTM_PRIO_PURGE     0
>> +#define I915_TTM_PRIO_NO_PAGES  1
>> +#define I915_TTM_PRIO_HAS_PAGES 2
>> +
>> +/**
>> + * struct i915_ttm_tt - TTM page vector with additional private information
>> + * @ttm: The base TTM page vector.
>> + * @dev: The struct device used for dma mapping and unmapping.
>> + * @cached_st: The cached scatter-gather table.
>> + *
>> + * Note that DMA may be going on right up to the point where the page-
>> + * vector is unpopulated in delayed destroy. Hence keep the
>> + * scatter-gather table mapped and cached up to that point. This is
>> + * different from the cached gem object io scatter-gather table which
>> + * doesn't have an associated dma mapping.
>> + */
>> +struct i915_ttm_tt {
> What is the _tt here btw? Translation table? We also have use_tt
> elsewhere. ttm_tt looks like it just holds an array of pages, and
> associated data? ttm_pv?
It's just bad naming. i915_ttm_pv would be better, I agree, but other 
drivers consistently use tt.
>
>> +       struct ttm_tt ttm;
>> +       struct device *dev;
>> +       struct sg_table *cached_st;
>> +};
>> +
>> +static const struct ttm_place lmem0_sys_placement_flags[] = {
>> +       {
>> +               .fpfn = 0,
>> +               .lpfn = 0,
>> +               .mem_type = I915_PL_LMEM0,
>> +               .flags = 0,
>> +       }, {
>> +               .fpfn = 0,
>> +               .lpfn = 0,
>> +               .mem_type = I915_PL_SYSTEM,
>> +               .flags = 0,
>> +       }
>> +};
>> +
>> +struct ttm_placement i915_lmem0_placement = {
>> +       .num_placement = 1,
>> +       .placement = &lmem0_sys_placement_flags[0],
>> +       .num_busy_placement = 1,
>> +       .busy_placement = &lmem0_sys_placement_flags[0],
>> +};
>> +
>> +struct ttm_placement i915_lmem0_sys_placement = {
>> +       .num_placement = 1,
>> +       .placement = &lmem0_sys_placement_flags[0],
>> +       .num_busy_placement = 2,
>> +       .busy_placement = &lmem0_sys_placement_flags[0],
>> +};
>> +
>> +struct ttm_placement i915_sys_placement = {
>> +       .num_placement = 1,
>> +       .placement = &lmem0_sys_placement_flags[1],
>> +       .num_busy_placement = 1,
>> +       .busy_placement = &lmem0_sys_placement_flags[1],
>> +};
>> +
>> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>> +
>> +static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>> +                                        uint32_t page_flags)
>> +{
>> +       struct ttm_resource_manager *man =
>> +               ttm_manager_type(bo->bdev, bo->mem.mem_type);
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +       struct i915_ttm_tt *i915_tt;
>> +       int ret;
>> +
>> +       i915_tt = kzalloc(sizeof(*i915_tt), GFP_KERNEL);
>> +       if (!i915_tt)
>> +               return NULL;
>> +
>> +       if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>> +           man->use_tt)
>> +               page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
>> +
>> +       ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, ttm_cached);
>> +       if (ret) {
>> +               kfree(i915_tt);
>> +               return NULL;
>> +       }
>> +
>> +       i915_tt->dev = obj->base.dev->dev;
>> +
>> +       return &i915_tt->ttm;
>> +}
>> +
>> +static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>> +{
>> +       struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>> +
>> +       if (i915_tt->cached_st) {
>> +               dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
>> +                                 DMA_BIDIRECTIONAL, 0);
>> +               sg_free_table(i915_tt->cached_st);
>> +               kfree(i915_tt->cached_st);
>> +               i915_tt->cached_st = NULL;
>> +       }
>> +       ttm_pool_free(&bdev->pool, ttm);
>> +}
>> +
>> +static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>> +{
>> +       struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>> +
>> +       ttm_tt_destroy_common(bdev, ttm);
>> +       kfree(i915_tt);
>> +}
>> +
>> +static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>> +                                      const struct ttm_place *place)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +
>> +       /* Will do for now. Our pinned objects are still on TTM's LRU lists */
>> +       if (!i915_gem_object_evictable(obj))
>> +               return false;
>> +
>> +       /* This isn't valid with a buddy allocator */
>> +       return ttm_bo_eviction_valuable(bo, place);
>> +}
>> +
>> +static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
>> +                                struct ttm_placement *placement)
>> +{
>> +       *placement = i915_sys_placement;
> What's the story here?

Here it's indicated that the bo is about to be evicted and TTM asks us 
where to place it. We place it in system memory, but that system memory 
is not yet visible to GEM.


>
>> +}
>> +
>> +static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +       int ret;
>> +
>> +       ret = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = __i915_gem_object_put_pages(obj);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return 0;
>> +}
>> +
>> +static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
>> +{
>> +       if (obj->ttm.cached_io_st) {
>> +               sg_free_table(obj->ttm.cached_io_st);
>> +               kfree(obj->ttm.cached_io_st);
>> +               obj->ttm.cached_io_st = NULL;
>> +       }
>> +}
>> +
>> +static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +
>> +       if (obj->mm.madv == __I915_MADV_PURGED)
>> +               return;
>> +
>> +       i915_ttm_free_cached_io_st(obj);
>> +
>> +       ttm_resource_free(bo, &bo->mem);
>> +       if (bo->ttm) {
>> +               ttm_tt_unpopulate(bo->bdev, bo->ttm);
>> +               bo->ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
>> +       }
>> +
>> +       obj->mm.madv = __I915_MADV_PURGED;
>> +}
>> +
>> +static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +       int ret = i915_ttm_move_notify(bo);
>> +
>> +       GEM_WARN_ON(ret);
>> +       GEM_WARN_ON(obj->ttm.cached_io_st);
>> +       if (!ret && obj->mm.madv != I915_MADV_WILLNEED)
>> +               i915_ttm_purge(obj);
>> +}
>> +
>> +static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +
>> +       if (likely(obj)) {
>> +               /* This releases all gem object bindings to the backend. */
>> +               __i915_gem_free_object(obj);
>> +       }
>> +}
>> +
>> +static struct intel_memory_region *
>> +i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
>> +{
>> +       struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
>> +
>> +       /* There's some room for optimization here... */
>> +       GEM_BUG_ON(ttm_mem_type != I915_PL_SYSTEM &&
>> +                  ttm_mem_type < I915_PL_LMEM0);
>> +       if (ttm_mem_type == I915_PL_SYSTEM)
>> +               return intel_memory_region_lookup(i915, INTEL_MEMORY_SYSTEM,
>> +                                                 0);
> So at the moment we just have lmem using the new ttm backend, right?
> Stolen and system are unchanged?

ATM yes.

>
>> +
>> +       return intel_memory_region_lookup(i915, INTEL_MEMORY_LOCAL,
>> +                                         ttm_mem_type - I915_PL_LMEM0);
>> +}
>> +
>> +static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>> +{
>> +       struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>> +       struct scatterlist *sg;
>> +       struct sg_table *st;
>> +       int ret;
>> +
>> +       if (i915_tt->cached_st)
>> +               return i915_tt->cached_st;
>> +
>> +       st = kzalloc(sizeof(*st), GFP_KERNEL);
>> +       if (!st)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       sg = __sg_alloc_table_from_pages
>> +               (st, ttm->pages, ttm->num_pages, 0,
>> +                (unsigned long)ttm->num_pages << PAGE_SHIFT,
>> +                i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
>> +       if (IS_ERR(sg)) {
>> +               kfree(st);
>> +               return ERR_CAST(sg);
>> +       }
>> +
>> +       ret = dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
>> +       if (ret) {
>> +               sg_free_table(st);
>> +               kfree(st);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       i915_tt->cached_st = st;
>> +       return st;
>> +}
>> +
>> +static struct sg_table *
>> +i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>> +                        struct ttm_resource *res)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +       struct ttm_resource_manager *man =
>> +               ttm_manager_type(bo->bdev, res->mem_type);
>> +
>> +       if (man->use_tt)
>> +               return i915_ttm_tt_get_st(bo->ttm);
>> +
>> +       return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
>> +}
>> +
>> +static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>> +                        struct ttm_operation_ctx *ctx,
>> +                        struct ttm_resource *new_mem,
>> +                        struct ttm_place *hop)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +       struct ttm_resource_manager *new_man =
>> +               ttm_manager_type(bo->bdev, new_mem->mem_type);
>> +       struct ttm_resource_manager *old_man =
>> +               ttm_manager_type(bo->bdev, bo->mem.mem_type);
>> +       struct intel_memory_region *new_reg, *old_reg;
>> +       union {
>> +               struct i915_ttm_kmap_iter_tt tt;
>> +               struct i915_ttm_kmap_iter_iomap io;
>> +       } _new_iter, _old_iter;
>> +       struct i915_ttm_kmap_iter *new_iter, *old_iter;
>> +       struct sg_table *new_st;
>> +       int ret;
>> +
>> +       new_reg = i915_ttm_region(bo->bdev, new_mem->mem_type);
>> +       old_reg = i915_ttm_region(bo->bdev, bo->mem.mem_type);
>> +       GEM_BUG_ON(!new_reg || !old_reg);
>> +
>> +       /* Sync for now. We could do the actual copy async. */
>> +       ret = ttm_bo_wait_ctx(bo, ctx);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = i915_ttm_move_notify(bo);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (obj->mm.madv != I915_MADV_WILLNEED) {
>> +               i915_ttm_purge(obj);
>> +               ttm_resource_free(bo, new_mem);
>> +               return 0;
>> +       }
>> +
>> +       /* Populate ttm with pages if needed. Typically system memory. */
>> +       if (new_man->use_tt && bo->ttm) {
>> +               ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       new_st = i915_ttm_resource_get_st(obj, new_mem);
>> +       if (IS_ERR(new_st))
>> +               return PTR_ERR(new_st);
>> +
>> +       new_iter = new_man->use_tt ?
>> +               i915_ttm_kmap_iter_tt_init(&_new_iter.tt, bo->ttm) :
>> +               i915_ttm_kmap_iter_iomap_init(&_new_iter.io, &new_reg->iomap,
>> +                                             new_st, new_reg->region.start);
>> +
>> +       old_iter = old_man->use_tt ?
>> +               i915_ttm_kmap_iter_tt_init(&_old_iter.tt, bo->ttm) :
>> +               i915_ttm_kmap_iter_iomap_init(&_old_iter.io, &old_reg->iomap,
>> +                                             obj->ttm.cached_io_st,
>> +                                             old_reg->region.start);
>> +
>> +       i915_ttm_move_memcpy(bo, new_mem, new_iter, old_iter);
>> +       i915_ttm_free_cached_io_st(obj);
>> +
>> +       if (!new_man->use_tt)
>> +               obj->ttm.cached_io_st = new_st;
>> +
>> +       return 0;
>> +}
>> +
>> +struct ttm_device_funcs i915_ttm_bo_driver = {
>> +       .ttm_tt_create = i915_ttm_tt_create,
>> +       .ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
>> +       .ttm_tt_destroy = i915_ttm_tt_destroy,
>> +       .eviction_valuable = i915_ttm_eviction_valuable,
>> +       .evict_flags = i915_ttm_evict_flags,
>> +       .move = i915_ttm_move,
>> +       .verify_access = NULL,
>> +       .swap_notify = i915_ttm_swap_notify,
>> +       .delete_mem_notify = i915_ttm_delete_mem_notify,
>> +};
>> +
>> +static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +       struct ttm_operation_ctx ctx = {
>> +               .interruptible = true,
>> +               .no_wait_gpu = false,
>> +       };
>> +       struct sg_table *st;
>> +       int ret;
>> +
>> +       /* Swap in. */
>> +       if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>> +               ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       /* Move to the requested placement. */
>> +       ret = ttm_bo_validate(bo, &i915_lmem0_placement, &ctx);
>> +       if (ret)
>> +               return ret == -ENOSPC ? -ENXIO : ret;
>> +
>> +       /* Object either has a page vector or is an iomem object */
>> +       st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
>> +       if (IS_ERR(st))
>> +               return PTR_ERR(st);
>> +
>> +       __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
>> +
>> +       i915_ttm_adjust_lru(obj);
>> +
>> +       return ret;
>> +}
>> +
>> +static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
>> +                              struct sg_table *st)
>> +{
>> +       /*
>> +        * We're currently not called from a shrinker, so put_pages()
>> +        * typically means the object is about to destroyed, or called
>> +        * from move_notify(). So just avoid doing much for now.
>> +        * If the object is not destroyed next, The TTM eviction logic
>> +        * and shrinkers will move it out if needed.
>> +        */
>> +
>> +       i915_ttm_adjust_lru(obj);
>> +}
>> +
>> +static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +
>> +       /*
>> +        * Don't manipulate the TTM LRUs while in TTM bo destruction.
>> +        * We're called through i915_ttm_delete_mem_notify().
>> +        */
>> +       if (!kref_read(&bo->kref))
>> +               return;
>> +
>> +       /*
>> +        * Put on the correct LRU list depending on the MADV status
>> +        */
>> +       spin_lock(&bo->bdev->lru_lock);
>> +       if (obj->mm.madv != I915_MADV_WILLNEED) {
>> +               bo->priority = I915_TTM_PRIO_PURGE;
>> +       } else if (!i915_gem_object_has_pages(obj)) {
>> +               if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
>> +                       bo->priority = I915_TTM_PRIO_HAS_PAGES;
>> +       } else {
>> +               if (bo->priority > I915_TTM_PRIO_NO_PAGES)
>> +                       bo->priority = I915_TTM_PRIO_NO_PAGES;
>> +       }
>> +
>> +       ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
>> +       spin_unlock(&bo->bdev->lru_lock);
>> +}
>> +
>> +/*
>> + * TTM-backed gem object destruction requires some clarification.
>> + * Basically we have two possibilities here. We can either rely on the
>> + * i915 delayed destruction and put the TTM object when the object
>> + * is idle. This would be detected by TTM which would bypass the
>> + * TTM delayed destroy handling. The other approach is to put the TTM
>> + * object early and rely on the TTM destroyed handling, and then free
>> + * the leftover parts of the GEM object once TTM's destroyed list handling is
>> + * complete. For now, we rely on the latter for two reasons:
>> + * a) TTM can evict an object even when it's on the delayed destroy list,
>> + * which in theory allows for complete eviction.
>> + * b) There is work going on in TTM to allow freeing an object even when
>> + * it's not idle, and using the TTM destroyed list handling could help us
>> + * benefit from that.
>> + */
>> +static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
>> +{
>> +       ttm_bo_put(i915_gem_to_ttm(obj));
>> +}
>> +
>> +static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>> +       .name = "i915_gem_object_ttm",
>> +       .flags = I915_GEM_OBJECT_HAS_IOMEM,
>> +
>> +       .get_pages = i915_ttm_get_pages,
>> +       .put_pages = i915_ttm_put_pages,
>> +       .truncate = i915_ttm_purge,
>> +       .adjust_lru = i915_ttm_adjust_lru,
>> +       .delayed_free = i915_ttm_delayed_free,
>> +};
>> +
>> +void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>> +{
>> +       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> +
>> +       i915_gem_object_release_memory_region(obj);
>> +       call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
>> +}
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
>> +       obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
>> +       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>> +
>> +       ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>> +                         ttm_bo_type_kernel, &i915_sys_placement, alignment,
>> +                         true, NULL, NULL, i915_ttm_bo_destroy);
> Move this further up, or add some onion?
Might need to revisit that again to figure out what destructors are 
called autmatically on failure there. Thing is once ttm_bo_init has 
succeeded, it's published on LRU lists and available for mmap, so we'd 
better have everything initialized.
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

/Thomas


