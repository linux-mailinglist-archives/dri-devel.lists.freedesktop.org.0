Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44F3A6066
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 12:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAF489CE1;
	Mon, 14 Jun 2021 10:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771DB89B18;
 Mon, 14 Jun 2021 10:32:08 +0000 (UTC)
IronPort-SDR: c6xt2EFK1fYtFO/Nerbab6xu6aI70aO2GEsvtUcbyusBbVU5Vg8EZsjqS8wppqUX0y+hyp//8P
 xnPjoeNM21wg==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="205607854"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="205607854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 03:32:07 -0700
IronPort-SDR: JdAzrst5is3mUIWXyftDBIBaBh53lCsF8n+VT5dC56sv+hIEQwSDBxVehP/Pw97Qc3PoBT4Stv
 LYXoe2CSfmPg==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="403849201"
Received: from janlundk-mobl1.ger.corp.intel.com (HELO [10.249.254.32])
 ([10.249.254.32])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 03:32:05 -0700
Subject: Re: [Intel-gfx] [PATCH v3 2/4] drm/i915/ttm: Adjust gem flags and
 caching settings after a move
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210614095230.126284-1-thomas.hellstrom@linux.intel.com>
 <20210614095230.126284-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPN3EKwy+FiBRs2PaFrx6DfxC7p62rjApVVAzQXXB23qQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <3bfa6eda-ea69-d331-76c7-f8eb5de1ac20@linux.intel.com>
Date: Mon, 14 Jun 2021 12:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPN3EKwy+FiBRs2PaFrx6DfxC7p62rjApVVAzQXXB23qQ@mail.gmail.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/14/21 12:20 PM, Matthew Auld wrote:
> On Mon, 14 Jun 2021 at 10:53, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> After a TTM move or object init we need to update the i915 gem flags and
>> caching settings to reflect the new placement. Currently caching settings
>> are not changed during the lifetime of an object, although that might
>> change moving forward if we run into performance issues or issues with
>> WC system page allocations.
>> Also introduce gpu_binds_iomem() and cpu_maps_iomem() to clean up the
>> various ways we previously used to detect this.
>> Finally, initialize the TTM object reserved to be able to update
>> flags and caching before anyone else gets hold of the object.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> v2:
>> - Style fixes (Reported by Matthew Auld)
>> v3:
>> - More style fixes. Clarify why we're updating caching settings after move.
>>    (Suggested by Matthew Auld)
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 111 +++++++++++++++++++-----
>>   1 file changed, 89 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 33ab47f1e05b..5176682a7d19 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -70,6 +70,17 @@ static struct ttm_placement i915_sys_placement = {
>>          .busy_placement = &lmem0_sys_placement_flags[1],
>>   };
>>
>> +static bool gpu_binds_iomem(struct ttm_resource *mem)
>> +{
>> +       return mem->mem_type != TTM_PL_SYSTEM;
>> +}
>> +
>> +static bool cpu_maps_iomem(struct ttm_resource *mem)
>> +{
>> +       /* Once / if we support GGTT, this is also false for cached ttm_tts */
>> +       return mem->mem_type != TTM_PL_SYSTEM;
>> +}
>> +
>>   static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
>>
>>   static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>> @@ -175,6 +186,40 @@ static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
>>          obj->ttm.cached_io_st = NULL;
>>   }
>>
>> +static void
>> +i915_ttm_adjust_domains_after_cpu_move(struct drm_i915_gem_object *obj)
>> +{
>> +       struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> +
>> +       if (cpu_maps_iomem(bo->resource) || bo->ttm->caching != ttm_cached) {
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
>> +       obj->mem_flags |= cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
>> +               I915_BO_FLAG_STRUCT_PAGE;
>> +
>> +       if ((HAS_LLC(i915) || HAS_SNOOP(i915)) && !gpu_binds_iomem(bo->resource) &&
>> +           bo->ttm->caching == ttm_cached)
>> +               cache_level = I915_CACHE_LLC;
>> +       else
>> +               cache_level = I915_CACHE_NONE;
>> +
>> +       i915_gem_object_set_cache_coherency(obj, cache_level);
>> +}
>> +
>>   static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>>   {
>>          struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>> @@ -190,8 +235,10 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
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
>> @@ -273,12 +320,15 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
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
>>          return intel_region_ttm_node_to_st(obj->mm.region, res);
>>   }
>>
>> @@ -290,8 +340,6 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>          struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>          struct ttm_resource_manager *dst_man =
>>                  ttm_manager_type(bo->bdev, dst_mem->mem_type);
>> -       struct ttm_resource_manager *src_man =
>> -               ttm_manager_type(bo->bdev, bo->resource->mem_type);
>>          struct intel_memory_region *dst_reg, *src_reg;
>>          union {
>>                  struct ttm_kmap_iter_tt tt;
>> @@ -332,34 +380,36 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
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
>> +       src_iter = !cpu_maps_iomem(bo->resource) ?
>>                  ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm) :
>>                  ttm_kmap_iter_iomap_init(&_src_iter.io, &src_reg->iomap,
>>                                           obj->ttm.cached_io_st,
>>                                           src_reg->region.start);
>>
>>          ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>> +       /* Below dst_mem becomes bo->resource. */
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
>> @@ -421,6 +471,16 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
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
>> @@ -428,8 +488,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>
>>          __i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
>>
>> -       i915_ttm_adjust_lru(obj);
>> -
>>          return ret;
>>   }
>>
>> @@ -563,6 +621,7 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
>>
>>   const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>>          .name = "i915_gem_object_ttm",
>> +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE,
> We set is_shrinkable for both lmem and smem? Does the current shrinker
> work with !shmem? I assume the put_pages() will just discard the page
> contents, which is not what we want? Maybe keep this disabled for now?
> Or am I missing something?

This is to indicate to the gem shrinker that we want to be able to 
determine dynamically whether the object is shrinkable (by the gem 
shrinker) or not. (See below). It's intended for the situation where we 
might want to use shmem to back cached-only ttm objects, and use our own 
shrinker.

But if you think it's better, we could flip that ops flag once we 
actually have anything shrinkable in place. Let me know what you think. 
The TTM shmem pool idea becomes a bit doubtful by the fact that 
allocating some 8GB of system objects, populating and clearing them 
appears to be some 6X faster with a straightforward alloc approach (like 
TTM or the "internal" backend) than with shmem...

>>          .get_pages = i915_ttm_get_pages,
>>          .put_pages = i915_ttm_put_pages,
>> @@ -599,6 +658,10 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
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
>> @@ -618,15 +681,14 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>          i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
>>          i915_gem_object_init_memory_region(obj, mem);
>>          i915_gem_object_make_unshrinkable(obj);

Here we set the object to unshrinkable.

/Thomas


