Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD539A25D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 15:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD3B6E1A4;
	Thu,  3 Jun 2021 13:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCEC6E0E7;
 Thu,  3 Jun 2021 13:40:42 +0000 (UTC)
IronPort-SDR: 4CksHqKtLeqOEzZ21c3F05l1wU4OvLYwL9t/DhSz1fz8+nk7dL4BzBO7AQMlZ0SgkWVsc0ogA1
 /bj9rWLEC3pg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204031411"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="204031411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 06:40:42 -0700
IronPort-SDR: kxD0Gd/q+CCx6tS5p+21g2SmznvorGTf/22xAI0x2KmmtmO1mnVt8dU5A6Ky4p4sOBdxZW/LCF
 2W9Jo9qTG4yw==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="417382485"
Received: from vkubarev-mobl1.ccr.corp.intel.com (HELO [10.249.254.167])
 ([10.249.254.167])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 06:40:40 -0700
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNp8Z4zMKUhKvEDN2GrMKqxAW7vDtEsr8mkfRTZtC91vA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <e8696cce-82ab-ff9f-3cf8-866496cd17d4@linux.intel.com>
Date: Thu, 3 Jun 2021 15:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNp8Z4zMKUhKvEDN2GrMKqxAW7vDtEsr8mkfRTZtC91vA@mail.gmail.com>
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

Thanks for reviewing, Matthew.

On 6/3/21 12:35 PM, Matthew Auld wrote:
> On Wed, 2 Jun 2021 at 18:08, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> After a TTM move we need to update the i915 gem flags and caching
>> settings to reflect the new placement.
>> Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up the
>> various ways we previously used to detect this.
>> Finally, initialize the TTM object reserved to be able to update
>> flags and caching before anyone else gets hold of the object.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 112 +++++++++++++++++++-----
>>   1 file changed, 90 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index ae12a2be11a2..c73c51755c20 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -70,6 +70,17 @@ static struct ttm_placement i915_sys_placement = {
>>          .busy_placement = &lmem0_sys_placement_flags[1],
>>   };
>>
>> +static bool gpu_binds_iomem(struct ttm_resource *mem)
> What does gpu_binds mean here? It's mapped though the GTT?

gpu_bind_XX would here translate to "make xx visible to the gpu", We 
could of course use the term "gpu_maps" if you think that fits better.

>
>> +{
>> +       return (mem->mem_type != TTM_PL_SYSTEM);
>> +}
>> +
>> +static bool cpu_maps_iomem(struct ttm_resource *mem)
>> +{
>> +       /* Once / if we support GGTT, this is also false for cached ttm_tts */
>> +       return (mem->mem_type != TTM_PL_SYSTEM);
>> +}
> Can drop the extra brackets.
>
>> +
>>   static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>>
>>   static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>> @@ -175,6 +186,41 @@ static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
>>          obj->ttm.cached_io_st = NULL;
>>   }
>>
>> +static void
>> +i915_ttm_adjust_domains_after_cpu_move(struct drm_i915_gem_object *obj)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +
>> +       if (cpu_maps_iomem(&bo->mem) || bo->ttm->caching != ttm_cached) {
>> +               obj->write_domain = I915_GEM_DOMAIN_WC;
>> +               obj->read_domains = I915_GEM_DOMAIN_WC;
>> +       } else {
>> +               obj->write_domain = I915_GEM_DOMAIN_CPU;
>> +               obj->read_domains = I915_GEM_DOMAIN_CPU;
>> +       }
>> +}
>> +
>> +static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
>> +{
>> +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +       unsigned int cache_level;
>> +
>> +       obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
>> +
>> +       obj->mem_flags |= cpu_maps_iomem(&bo->mem) ? I915_BO_FLAG_IOMEM :
>> +               I915_BO_FLAG_STRUCT_PAGE;
>> +
>> +       if ((HAS_LLC(i915) || HAS_SNOOP(i915)) && !gpu_binds_iomem(&bo->mem) &&
> I think all modern hw has support for snooping or the fast shared LLC.
> Are we expecting to hit this path for non-dgpu?
Not initially, no. Possibly later.
>   Also by default we
> will choose ttm_cached at least for platforms like dg1?
Not for evicted LMEM. They still have ttm_write_combine. User-space can 
still access those through mmap() while evicted.
>   Also pin_map()
> is still a separate interface at this point?
Yes, I had a comment on that in your caching patch that I reviewed, we 
need to make sure even for pin_map that we only map using the single 
supported caching attributes for the BO.
>> +           bo->ttm->caching == ttm_cached) {
>> +               cache_level = I915_CACHE_LLC;
>> +       } else {
>> +               cache_level = I915_CACHE_NONE;
>> +       }
>> +
>> +       i915_gem_object_set_cache_coherency(obj, cache_level);
>> +}
>> +
>>   static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>>   {
>>          struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> @@ -190,8 +236,10 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>>
>>          /* TTM's purge interface. Note that we might be reentering. */
>>          ret = ttm_bo_validate(bo, &place, &ctx);
>> -
>>          if (!ret) {
>> +               obj->write_domain = 0;
>> +               obj->read_domains = 0;
>> +               i915_ttm_adjust_gem_after_move(obj);
>>                  i915_ttm_free_cached_io_st(obj);
>>                  obj->mm.madv = __I915_MADV_PURGED;
>>          }
>> @@ -273,12 +321,15 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>>                           struct ttm_resource *res)
>>   {
>>          struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> -       struct ttm_resource_manager *man =
>> -               ttm_manager_type(bo->bdev, res->mem_type);
>>
>> -       if (man->use_tt)
>> +       if (!gpu_binds_iomem(res))
>>                  return i915_ttm_tt_get_st(bo->ttm);
>>
>> +       /*
>> +        * If CPU mapping differs, we need to add the ttm_tt pages to
>> +        * the resulting st. Might make sense for GGTT.
>> +        */
>> +       GEM_WARN_ON(!cpu_maps_iomem(res));
>>          return intel_region_ttm_node_to_st(obj->mm.region, res->mm_node);
>>   }
>>
>> @@ -290,8 +341,6 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>          struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>          struct ttm_resource_manager *dst_man =
>>                  ttm_manager_type(bo->bdev, dst_mem->mem_type);
>> -       struct ttm_resource_manager *src_man =
>> -               ttm_manager_type(bo->bdev, bo->mem.mem_type);
>>          struct intel_memory_region *dst_reg, *src_reg;
>>          union {
>>                  struct ttm_kmap_iter_tt tt;
>> @@ -332,34 +381,36 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>          if (IS_ERR(dst_st))
>>                  return PTR_ERR(dst_st);
>>
>> -       /* If we start mapping GGTT, we can no longer use man::use_tt here. */
>> -       dst_iter = dst_man->use_tt ?
>> +       dst_iter = !cpu_maps_iomem(dst_mem) ?
>>                  ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm) :
>>                  ttm_kmap_iter_iomap_init(&_dst_iter.io, &dst_reg->iomap,
>>                                           dst_st, dst_reg->region.start);
>>
>> -       src_iter = src_man->use_tt ?
>> +       src_iter = !cpu_maps_iomem(&bo->mem) ?
>>                  ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
>>                  ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
>>                                           obj->ttm.cached_io_st,
>>                                           src_reg->region.start);
>>
>>          ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>> +       /* Below dst_mem becomes bo->mem. */
>>          ttm_bo_move_sync_cleanup(bo, dst_mem);
>> +       i915_ttm_adjust_domains_after_cpu_move(obj);
>>          i915_ttm_free_cached_io_st(obj);
>>
>> -       if (!dst_man->use_tt) {
>> +       if (gpu_binds_iomem(dst_mem) || cpu_maps_iomem(dst_mem)) {
>>                  obj->ttm.cached_io_st = dst_st;
>>                  obj->ttm.get_io_page.sg_pos = dst_st->sgl;
>>                  obj->ttm.get_io_page.sg_idx = 0;
>>          }
>>
>> +       i915_ttm_adjust_gem_after_move(obj);
>>          return 0;
>>   }
>>
>>   static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
>>   {
>> -       if (mem->mem_type < I915_PL_LMEM0)
>> +       if (!cpu_maps_iomem(mem))
>>                  return 0;
>>
>>          mem->bus.caching = ttm_write_combined;
>> @@ -421,6 +472,16 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>          if (ret)
>>                  return ret == -ENOSPC ? -ENXIO : ret;
>>
>> +       i915_ttm_adjust_lru(obj);
>> +       if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
>> +               ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               i915_ttm_adjust_domains_after_cpu_move(obj);
>> +               i915_ttm_adjust_gem_after_move(obj);
>> +       }
>> +
>>          /* Object either has a page vector or is an iomem object */
>>          st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
>>          if (IS_ERR(st))
>> @@ -428,8 +489,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>
>>          __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
>>
>> -       i915_ttm_adjust_lru(obj);
>> -
>>          return ret;
>>   }
>>
>> @@ -563,6 +622,7 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
>>
>>   const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>>          .name = "i915_gem_object_ttm",
>> +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE,
>>
>>          .get_pages = i915_ttm_get_pages,
>>          .put_pages = i915_ttm_put_pages,
>> @@ -599,6 +659,10 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>   {
>>          static struct lock_class_key lock_class;
>>          struct drm_i915_private *i915 = mem->i915;
>> +       struct ttm_operation_ctx ctx = {
>> +               .interruptible = true,
>> +               .no_wait_gpu = false,
>> +       };
>>          enum ttm_bo_type bo_type;
>>          size_t alignment = 0;
>>          int ret;
>> @@ -618,15 +682,14 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>          i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
>>          i915_gem_object_init_memory_region(obj, mem);
>>          i915_gem_object_make_unshrinkable(obj);
>> -       obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
>> -       obj->mem_flags |= I915_BO_FLAG_IOMEM;
>> -       i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>>          INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
>>          mutex_init(&obj->ttm.get_io_page.lock);
>>
>>          bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
>>                  ttm_bo_type_kernel;
>>
>> +       obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>> +
>>          /*
>>           * If this function fails, it will call the destructor, but
>>           * our caller still owns the object. So no freeing in the
>> @@ -634,14 +697,19 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>           * Similarly, in delayed_destroy, we can't call ttm_bo_put()
>>           * until successful initialization.
>>           */
>> -       obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>> -       ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>> -                         bo_type, &i915_sys_placement, alignment,
>> -                         true, NULL, NULL, i915_ttm_bo_destroy);
>> +       ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
>> +                                  bo_type, &i915_sys_placement, alignment,
>> +                                  &ctx, NULL, NULL, i915_ttm_bo_destroy);
>> +
>> +       if (ret)
>> +               goto out;
>>
>> -       if (!ret)
>> -               obj->ttm.created = true;
>> +       obj->ttm.created = true;
>> +       i915_ttm_adjust_domains_after_cpu_move(obj);
>> +       i915_ttm_adjust_gem_after_move(obj);
>> +       i915_gem_object_unlock(obj);
>>
>> +out:
>>          /* i915 wants -ENXIO when out of memory region space. */
>>          return (ret == -ENOSPC) ? -ENXIO : ret;
>>   }
>> --
>> 2.31.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
