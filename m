Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334126E94B7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A14810E2B7;
	Thu, 20 Apr 2023 12:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AAE10E06F;
 Thu, 20 Apr 2023 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681994381; x=1713530381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iX4YEY7Y4DA6kUx3h/ol5JoeX15WeNm+Os42HAD+yeo=;
 b=MN+xr4yTse96HfuaBYn7oQE1gSWcmfPeM5KOgeiLNuL9qeMz+NuRcfgc
 WCjw/mjxnh4wTfwqW6JrC6ULyNLgSEzXLrFmNmOe/XWs9vDIyDMYjJwgz
 URjyLxyIN8eXB/mrFsbYNCOaLb3ADXa+2MVvkZk7TNlKHiJYG1ruCvykj
 oUIJtTvAuvvmC9EgH4pegGBTlpzNaCQzOuWqotnGdWUg942SSTxGl/FLf
 siADcQFfRVr3tnh47zGRZo3Eh1z+Y9RKYNkOO7iLWQu9fq050s96kLRAr
 /RI0EesR9AoqJy+c6cSpA0vFzUiTVor023j9Wtuua6KuxbC68nACtaUJn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="432001263"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="432001263"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 05:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="938052157"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="938052157"
Received: from gbyrne6x-mobl1.ger.corp.intel.com (HELO [10.213.221.188])
 ([10.213.221.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 05:39:38 -0700
Message-ID: <98318f72-2124-b00b-d64c-e7c169f4a437@linux.intel.com>
Date: Thu, 20 Apr 2023 13:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, fei.yang@intel.com,
 intel-gfx@lists.freedesktop.org
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
 <c78e153d-7656-5f74-c91d-68269bda62ac@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c78e153d-7656-5f74-c91d-68269bda62ac@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2023 11:13, Andrzej Hajda wrote:
> On 20.04.2023 01:00, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Currently the KMD is using enum i915_cache_level to set caching policy 
>> for
>> buffer objects. This is flaky because the PAT index which really controls
>> the caching behavior in PTE has far more levels than what's defined in 
>> the
>> enum. In addition, the PAT index is platform dependent, having to 
>> translate
>> between i915_cache_level and PAT index is not reliable, and makes the 
>> code
>> more complicated.

How it is flaky and not reliable - yet the series proposed to leave it in place and even claims using cache levels simplifies the code (lower in the commit message). Maybe just the commit message needs work.

>>  From UMD's perspective there is also a necessity to set caching 
>> policy for
>> performance fine tuning. It's much easier for the UMD to directly use PAT
>> index because the behavior of each PAT index is clearly defined in Bspec.
>> Having the abstracted i915_cache_level sitting in between would only 
>> cause
>> more ambiguity.
>>
>> For these reasons this patch replaces i915_cache_level with PAT index. 
>> Also
>> note, the cache_level is not completely removed yet, because the KMD 
>> still
>> has the need of creating buffer objects with simple cache settings 
>> such as
>> cached, uncached, or writethrough. For such simple cases, using 
>> cache_level
>> would help simplify the code.
> 
> It seems quite fundamental change to me. Does this "not completely 
> removed yet" means that in some future we will not have support for 
> generic cache levels at all? Seems strange to me. Even looking at the 
> number of users of i915_gem_get_pat_index below it seem very unlikely.
> 
> And if the support for generic level will stay, maybe it would be better 
> to make usage of it more convienient. All conversion of
>      f(..., cache_level, ...)
> to
>      f(..., i915_gem_get_pat_index(i915, cache_level), ...)
> looks quite ugly to me.
> 
> Maybe extending cache level to support pat index somehow, for example:
> enum i915_cache_level {
>      I915_CACHE_NONE = 0,
>      I915_CACHE_...,
>      ...
>      I915_CACHE_1ST_PAT_INDEX = 0x100,
> }
> 
> so real_pat_index = cache_level - I915_CACHE_1ST_PAT_INDEX
> 
> and in case of generic level there will be platform dependend conversion 
> to real_pat_index?
> 
> I do not know the whole picture so maybe this is all wrong for some 
> reason, just asking :)

It looks a bit unsightly to me too so yes please, brain storm on whether it can be made more elegant and less intrusive would be appreciated.

>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 27 ++----
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 52 +++++++++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 25 +++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 71 ++++++++--------
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 82 +++++++++----------
>>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 ++---
>>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
>>   drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
>>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 ++++++-----
>>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
>>   drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
>>   drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
>>   drivers/gpu/drm/i915/i915_debugfs.c           | 55 ++++++++++---
>>   drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
>>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
>>   drivers/gpu/drm/i915/i915_vma.h               |  2 +-
>>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
>>   drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
>>   .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
>>   .../drm/i915/selftests/intel_memory_region.c  |  4 +-
>>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
>>   36 files changed, 378 insertions(+), 239 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c 
>> b/drivers/gpu/drm/i915/display/intel_dpt.c
>> index c5eacfdba1a5..7c5fddb203ba 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -43,24 +43,24 @@ static void gen8_set_pte(void __iomem *addr, 
>> gen8_pte_t pte)
>>   static void dpt_insert_page(struct i915_address_space *vm,
>>                   dma_addr_t addr,
>>                   u64 offset,
>> -                enum i915_cache_level level,
>> +                unsigned int pat_index,
>>                   u32 flags)
>>   {
>>       struct i915_dpt *dpt = i915_vm_to_dpt(vm);
>>       gen8_pte_t __iomem *base = dpt->iomem;
>>       gen8_set_pte(base + offset / I915_GTT_PAGE_SIZE,
>> -             vm->pte_encode(addr, level, flags));
>> +             vm->pte_encode(addr, pat_index, flags));
>>   }
>>   static void dpt_insert_entries(struct i915_address_space *vm,
>>                      struct i915_vma_resource *vma_res,
>> -                   enum i915_cache_level level,
>> +                   unsigned int pat_index,
>>                      u32 flags)
>>   {
>>       struct i915_dpt *dpt = i915_vm_to_dpt(vm);
>>       gen8_pte_t __iomem *base = dpt->iomem;
>> -    const gen8_pte_t pte_encode = vm->pte_encode(0, level, flags);
>> +    const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
>>       struct sgt_iter sgt_iter;
>>       dma_addr_t addr;
>>       int i;
>> @@ -83,7 +83,7 @@ static void dpt_clear_range(struct 
>> i915_address_space *vm,
>>   static void dpt_bind_vma(struct i915_address_space *vm,
>>                struct i915_vm_pt_stash *stash,
>>                struct i915_vma_resource *vma_res,
>> -             enum i915_cache_level cache_level,
>> +             unsigned int pat_index,
>>                u32 flags)
>>   {
>>       u32 pte_flags;
>> @@ -98,7 +98,7 @@ static void dpt_bind_vma(struct i915_address_space *vm,
>>       if (vma_res->bi.lmem)
>>           pte_flags |= PTE_LM;
>> -    vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +    vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>       vma_res->page_sizes_gtt = I915_GTT_PAGE_SIZE;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> index bb3575b1479f..d5fd4c9cd9f8 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> @@ -27,8 +27,8 @@ static bool gpu_write_needs_clflush(struct 
>> drm_i915_gem_object *obj)
>>       if (IS_DGFX(i915))
>>           return false;
>> -    return !(obj->cache_level == I915_CACHE_NONE ||
>> -         obj->cache_level == I915_CACHE_WT);
>> +    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> +         i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>   }
>>   bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>> @@ -267,7 +267,7 @@ int i915_gem_object_set_cache_level(struct 
>> drm_i915_gem_object *obj,
>>   {
>>       int ret;
>> -    if (obj->cache_level == cache_level)
>> +    if (i915_gem_object_has_cache_level(obj, cache_level))
>>           return 0;
>>       ret = i915_gem_object_wait(obj,
>> @@ -278,10 +278,8 @@ int i915_gem_object_set_cache_level(struct 
>> drm_i915_gem_object *obj,
>>           return ret;
>>       /* Always invalidate stale cachelines */
>> -    if (obj->cache_level != cache_level) {
>> -        i915_gem_object_set_cache_coherency(obj, cache_level);
>> -        obj->cache_dirty = true;
>> -    }
>> +    i915_gem_object_set_cache_coherency(obj, cache_level);
>> +    obj->cache_dirty = true;
>>       /* The cache-level will be applied when each vma is rebound. */
>>       return i915_gem_object_unbind(obj,
>> @@ -306,20 +304,13 @@ int i915_gem_get_caching_ioctl(struct drm_device 
>> *dev, void *data,
>>           goto out;
>>       }
>> -    switch (obj->cache_level) {
>> -    case I915_CACHE_LLC:
>> -    case I915_CACHE_L3_LLC:
>> +    if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
>> +        i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>>           args->caching = I915_CACHING_CACHED;
>> -        break;
>> -
>> -    case I915_CACHE_WT:
>> +    else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>>           args->caching = I915_CACHING_DISPLAY;
>> -        break;
>> -
>> -    default:
>> +    else
>>           args->caching = I915_CACHING_NONE;
>> -        break;
>> -    }
>>   out:
>>       rcu_read_unlock();
>>       return err;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 3aeede6aee4d..d42915516636 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -642,7 +642,7 @@ static inline int use_cpu_reloc(const struct 
>> reloc_cache *cache,
>>       return (cache->has_llc ||
>>           obj->cache_dirty ||
>> -        obj->cache_level != I915_CACHE_NONE);
>> +        !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
>>   }
>>   static int eb_reserve_vma(struct i915_execbuffer *eb,
>> @@ -1323,8 +1323,10 @@ static void *reloc_iomap(struct i915_vma *batch,
>>       offset = cache->node.start;
>>       if (drm_mm_node_allocated(&cache->node)) {
>>           ggtt->vm.insert_page(&ggtt->vm,
>> -                     i915_gem_object_get_dma_address(obj, page),
>> -                     offset, I915_CACHE_NONE, 0);
>> +            i915_gem_object_get_dma_address(obj, page),
>> +            offset,
>> +            i915_gem_get_pat_index(ggtt->vm.i915, I915_CACHE_NONE),
>> +            0);
>>       } else {
>>           offset += page << PAGE_SHIFT;
>>       }
>> @@ -1464,7 +1466,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>>               reloc_cache_unmap(&eb->reloc_cache);
>>               mutex_lock(&vma->vm->mutex);
>>               err = i915_vma_bind(target->vma,
>> -                        target->vma->obj->cache_level,
>> +                        target->vma->obj->pat_index,
>>                           PIN_GLOBAL, NULL, NULL);
>>               mutex_unlock(&vma->vm->mutex);
>>               reloc_cache_remap(&eb->reloc_cache, ev->vma->obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 3dbacdf0911a..50c30efa08a3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -383,7 +383,8 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>       }
>>       /* Access to snoopable pages through the GTT is incoherent. */
>> -    if (obj->cache_level != I915_CACHE_NONE && !HAS_LLC(i915)) {
>> +    if (!(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> +          HAS_LLC(i915))) {
>>           ret = -EFAULT;
>>           goto err_unpin;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 8c70a0ec7d2f..27c948350b5b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -54,6 +54,25 @@ unsigned int i915_gem_get_pat_index(struct 
>> drm_i915_private *i915,
>>       return INTEL_INFO(i915)->cachelevel_to_pat[level];
>>   }
>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object 
>> *obj,
>> +                     enum i915_cache_level lvl)
> 
> The name suggest object can have more cache levels, maybe only my 
> impression, up to you.
> 
>> +{
>> +    /*
>> +     * cache_level == I915_CACHE_INVAL indicates the UMD's have set the
>> +     * caching policy through pat_index, in which case the KMD should
>> +     * leave the coherency to be managed by user space, simply return
>> +     * true here.
>> +     */
>> +    if (obj->cache_level == I915_CACHE_INVAL)
>> +        return true;

It's a "bit" counter intuitive that answer "has cache level" is yes when cache level is set to invalid!

I worry we don't create an impenetrable code base so I hope this can be improved.

>> +
>> +    /*
>> +     * Otherwise the pat_index should have been converted from 
>> cache_level
>> +     * so that the following comparison is valid.
>> +     */
>> +    return obj->pat_index == i915_gem_get_pat_index(obj_to_i915(obj), 
>> lvl);
>> +}
>> +
>>   struct drm_i915_gem_object *i915_gem_object_alloc(void)
>>   {
>>       struct drm_i915_gem_object *obj;
>> @@ -133,7 +152,7 @@ void i915_gem_object_set_cache_coherency(struct 
>> drm_i915_gem_object *obj,
>>   {
>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> -    obj->cache_level = cache_level;
>> +    obj->pat_index = i915_gem_get_pat_index(i915, cache_level);
>>       if (cache_level != I915_CACHE_NONE)
>>           obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
>> @@ -148,6 +167,37 @@ void i915_gem_object_set_cache_coherency(struct 
>> drm_i915_gem_object *obj,
>>           !IS_DGFX(i915);
>>   }
>> +/**
>> + * i915_gem_object_set_pat_index - set PAT index to be used in PTE 
>> encode
>> + * @obj: #drm_i915_gem_object
>> + * @pat_index: PAT index
>> + *
>> + * This is a clone of i915_gem_object_set_cache_coherency taking pat 
>> index
>> + * instead of cache_level as its second argument.
>> + */
>> +void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
>> +                   unsigned int pat_index)
>> +{
>> +    struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> +
>> +    if (obj->pat_index == pat_index)
>> +        return;
>> +
>> +    obj->pat_index = pat_index;
>> +
>> +    if (pat_index != i915_gem_get_pat_index(i915, I915_CACHE_NONE))
>> +        obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
>> +                       I915_BO_CACHE_COHERENT_FOR_WRITE);
>> +    else if (HAS_LLC(i915))
>> +        obj->cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ;
>> +    else
>> +        obj->cache_coherent = 0;
>> +
>> +    obj->cache_dirty =
>> +        !(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) &&
>> +        !IS_DGFX(i915);
>> +}
>> +
>>   bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>   {
>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 4c92e17b4337..6f00aab10015 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -34,6 +34,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>>   unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
>>                       enum i915_cache_level level);
>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object 
>> *obj,
>> +                     enum i915_cache_level lvl);
>>   void i915_gem_init__objects(struct drm_i915_private *i915);
>>   void i915_objects_module_exit(void);
>> @@ -764,6 +766,8 @@ bool i915_gem_object_has_unknown_state(struct 
>> drm_i915_gem_object *obj);
>>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object 
>> *obj,
>>                        unsigned int cache_level);
>> +void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
>> +                   unsigned int pat_index);
>>   bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
>>   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
>>   void i915_gem_object_flush_if_display_locked(struct 
>> drm_i915_gem_object *obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 41b35abccf88..132ce01dee9f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -195,6 +195,7 @@ enum i915_cache_level {
>>        */
>>       I915_CACHE_WT,
>>       I915_MAX_CACHE_LEVEL,
>> +    I915_CACHE_INVAL = I915_MAX_CACHE_LEVEL,
>>   };
>>   enum i915_map_type {
>> @@ -358,10 +359,28 @@ struct drm_i915_gem_object {
>>   #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct 
>> pages */
>>   #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO 
>> memory */
>>       /**
>> -     * @cache_level: The desired GTT caching level.
>> +     * @pat_index: The desired PAT index.
>> +     *
>> +     * See hardware specification for valid PAT indices for each 
>> platform.

Side note for the last patch in the series - the UAPI blurb next to u32 index needs to at least point to some public PRM which lists the PATs and their configuration I would think. Otherwise it's not fully transparent how to use the feature.

>> +     * This field used to contain a value of enum i915_cache_level. 

What does this mean? Nothing is changed to unsigned here but just new field added.

It's
>> +     * changed to an unsigned int because PAT indices are being used by
>> +     * both UMD and KMD for caching policy control after GEN12.
>> +     * For backward compatibility, this field will continue to contain
>> +     * value of i915_cache_level for pre-GEN12 platforms so that the PTE

Pat_index:6 is a copy of cache_level:3 pre-Gen12?

But when I look at changes like:

@@ -1302,7 +1298,9 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
  		 */
  		vma->resource->bound_flags = 0;
  		vma->ops->bind_vma(vm, NULL, vma->resource,
-				   obj ? obj->cache_level : 0,
+				   obj ? obj->pat_index :
+					 i915_gem_get_pat_index(vm->i915,
+								I915_CACHE_NONE),
  				   was_bound);

That suggests it is not a copy but that obj->pat_index is always valid and directly a PAT index.

In which case new cache_level enum to say "use pat instead" may indeed be nicer as Andrzej suggested.

Although it is not clear to me for a glance that we need both. Maybe all in driver object creation can use cache_level but immediately convert to PAT internally and just don't store cache_level? I haven't looked in detail is my disclaimer though.. I guess it may boil down to does i915 ever need to read back cache_level, other than on the top entry points like setting it or so.

>> +     * encode functions for these legacy platforms can stay the same.
>> +     * In the meantime platform specific tables are created to translate
>> +     * i915_cache_level into pat index, for more details check the 
>> macros
>> +     * defined i915/i915_pci.c, e.g. PVC_CACHELEVEL.
>> +     */
>> +    unsigned int pat_index:6;

Existing bitfield takes up 7 bits. I'd check here with pahole if making pat_index a full u8 and changing the existing ones to u8 field:bits maybe ends up better overall.

>> +    /**
>> +     * @cache_level: Indicate whether pat_index is set by UMD
>>        *
>> -     * See enum i915_cache_level for possible values, along with what
>> -     * each does.
>> +     * This used to hold desired GTT caching level, but is now 
>> replaced by
>> +     * pat_index. It's kept here for KMD to tell whether the 
>> pat_index is
>> +     * set by UMD or converted from enum i915_cache_level.
>> +     * This field should be 0 by default, but I915_CACHE_INVAL if the
>> +     * pat_index is set by UMD.
>>        */
>>       unsigned int cache_level:3;
>>       /**
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index ee492d823f1b..3b094d36a0b0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -565,7 +565,9 @@ static void dbg_poison(struct i915_ggtt *ggtt,
>>           ggtt->vm.insert_page(&ggtt->vm, addr,
>>                        ggtt->error_capture.start,
>> -                     I915_CACHE_NONE, 0);
>> +                     i915_gem_get_pat_index(ggtt->vm.i915,
>> +                                I915_CACHE_NONE),
>> +                     0);
>>           mb();
>>           s = io_mapping_map_wc(&ggtt->iomap,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index 69eb20ed4d47..e40761e13c2a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -214,7 +214,8 @@ static struct dma_fence 
>> *i915_ttm_accel_move(struct ttm_buffer_object *bo,
>>           intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
>>           ret = 
>> intel_context_migrate_clear(to_gt(i915)->migrate.context, deps,
>> -                          dst_st->sgl, dst_level,
>> +                          dst_st->sgl,
>> +                          i915_gem_get_pat_index(i915, dst_level),
>>                             i915_ttm_gtt_binds_lmem(dst_mem),
>>                             0, &rq);
>>       } else {
>> @@ -227,12 +228,13 @@ static struct dma_fence 
>> *i915_ttm_accel_move(struct ttm_buffer_object *bo,
>>           src_level = i915_ttm_cache_level(i915, bo->resource, src_ttm);
>>           intel_engine_pm_get(to_gt(i915)->migrate.context->engine);
>>           ret = intel_context_migrate_copy(to_gt(i915)->migrate.context,
>> -                         deps, src_rsgt->table.sgl,
>> -                         src_level,
>> -                         i915_ttm_gtt_binds_lmem(bo->resource),
>> -                         dst_st->sgl, dst_level,
>> -                         i915_ttm_gtt_binds_lmem(dst_mem),
>> -                         &rq);
>> +                    deps, src_rsgt->table.sgl,
>> +                    i915_gem_get_pat_index(i915, src_level),
>> +                    i915_ttm_gtt_binds_lmem(bo->resource),
>> +                    dst_st->sgl,
>> +                    i915_gem_get_pat_index(i915, dst_level),
>> +                    i915_ttm_gtt_binds_lmem(dst_mem),
>> +                    &rq);
>>           i915_refct_sgt_put(src_rsgt);
>>       }
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c 
>> b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> index defece0bcb81..ebb68ac9cd5e 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -354,7 +354,7 @@ fake_huge_pages_object(struct drm_i915_private 
>> *i915, u64 size, bool single)
>>       obj->write_domain = I915_GEM_DOMAIN_CPU;
>>       obj->read_domains = I915_GEM_DOMAIN_CPU;
>> -    obj->cache_level = I915_CACHE_NONE;
>> +    obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
>>       return obj;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> index fe6c37fd7859..a93a90b15907 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> @@ -219,7 +219,7 @@ static int __igt_lmem_pages_migrate(struct 
>> intel_gt *gt,
>>               continue;
>>           err = intel_migrate_clear(&gt->migrate, &ww, deps,
>> -                      obj->mm.pages->sgl, obj->cache_level,
>> +                      obj->mm.pages->sgl, obj->pat_index,
>>                         i915_gem_object_is_lmem(obj),
>>                         0xdeadbeaf, &rq);
>>           if (rq) {
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 56279908ed30..a93d8f9f8bc1 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -1222,7 +1222,7 @@ static int __igt_mmap_migrate(struct 
>> intel_memory_region **placements,
>>       }
>>       err = intel_context_migrate_clear(to_gt(i915)->migrate.context, 
>> NULL,
>> -                      obj->mm.pages->sgl, obj->cache_level,
>> +                      obj->mm.pages->sgl, obj->pat_index,
>>                         i915_gem_object_is_lmem(obj),
>>                         expand32(POISON_INUSE), &rq);
>>       i915_gem_object_unpin_pages(obj);
>> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c 
>> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> index 5aaacc53fa4c..c2bdc133c89a 100644
>> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> @@ -109,7 +109,7 @@ static void gen6_ppgtt_clear_range(struct 
>> i915_address_space *vm,
>>   static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
>>                         struct i915_vma_resource *vma_res,
>> -                      enum i915_cache_level cache_level,
>> +                      unsigned int pat_index,
>>                         u32 flags)
>>   {
>>       struct i915_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
>> @@ -117,7 +117,7 @@ static void gen6_ppgtt_insert_entries(struct 
>> i915_address_space *vm,
>>       unsigned int first_entry = vma_res->start / I915_GTT_PAGE_SIZE;
>>       unsigned int act_pt = first_entry / GEN6_PTES;
>>       unsigned int act_pte = first_entry % GEN6_PTES;
>> -    const u32 pte_encode = vm->pte_encode(0, cache_level, flags);
>> +    const u32 pte_encode = vm->pte_encode(0, pat_index, flags);
>>       struct sgt_dma iter = sgt_dma(vma_res);
>>       gen6_pte_t *vaddr;
>> @@ -227,7 +227,9 @@ static int gen6_ppgtt_init_scratch(struct 
>> gen6_ppgtt *ppgtt)
>>       vm->scratch[0]->encode =
>>           vm->pte_encode(px_dma(vm->scratch[0]),
>> -                   I915_CACHE_NONE, PTE_READ_ONLY);
>> +                   i915_gem_get_pat_index(vm->i915,
>> +                              I915_CACHE_NONE),
>> +                   PTE_READ_ONLY);
>>       vm->scratch[1] = vm->alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);
>>       if (IS_ERR(vm->scratch[1])) {
>> @@ -278,7 +280,7 @@ static void gen6_ppgtt_cleanup(struct 
>> i915_address_space *vm)
>>   static void pd_vma_bind(struct i915_address_space *vm,
>>               struct i915_vm_pt_stash *stash,
>>               struct i915_vma_resource *vma_res,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               u32 unused)
>>   {
>>       struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c 
>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> index 7a4b1d1afce9..c046813514f4 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -56,7 +56,7 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>   }
>>   static u64 mtl_pte_encode(dma_addr_t addr,
>> -              enum i915_cache_level level,
>> +              unsigned int pat_index,
>>                 u32 flags)
>>   {
>>       gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> @@ -67,24 +67,17 @@ static u64 mtl_pte_encode(dma_addr_t addr,
>>       if (flags & PTE_LM)
>>           pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>> -    switch (level) {
>> -    case I915_CACHE_NONE:
>> -        pte |= GEN12_PPGTT_PTE_PAT1;
>> -        break;
>> -    case I915_CACHE_LLC:
>> -    case I915_CACHE_L3_LLC:
>> -        pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
>> -        break;
>> -    case I915_CACHE_WT:
>> +    if (pat_index & BIT(0))
>>           pte |= GEN12_PPGTT_PTE_PAT0;
>> -        break;
>> -    default:
>> -        /* This should never happen. Added to deal with the compile
>> -         * error due to the addition of I915_MAX_CACHE_LEVEL. Will
>> -         * be removed by the pat_index patch.
>> -         */
>> -        break;
>> -    }
>> +
>> +    if (pat_index & BIT(1))
>> +        pte |= GEN12_PPGTT_PTE_PAT1;
>> +
>> +    if (pat_index & BIT(2))
>> +        pte |= GEN12_PPGTT_PTE_PAT2;
>> +
>> +    if (pat_index & BIT(3))
>> +        pte |= MTL_PPGTT_PTE_PAT3;
>>       return pte;
>>   }
>> @@ -457,11 +450,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>>                 struct i915_page_directory *pdp,
>>                 struct sgt_dma *iter,
>>                 u64 idx,
>> -              enum i915_cache_level cache_level,
>> +              unsigned int pat_index,
>>                 u32 flags)
>>   {
>>       struct i915_page_directory *pd;
>> -    const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, 
>> cache_level, flags);
>> +    const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, pat_index, 
>> flags);
>>       gen8_pte_t *vaddr;
>>       pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
>> @@ -504,10 +497,10 @@ static void
>>   xehpsdv_ppgtt_insert_huge(struct i915_address_space *vm,
>>                 struct i915_vma_resource *vma_res,
>>                 struct sgt_dma *iter,
>> -              enum i915_cache_level cache_level,
>> +              unsigned int pat_index,
>>                 u32 flags)
>>   {
>> -    const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, flags);
>> +    const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
>>       unsigned int rem = sg_dma_len(iter->sg);
>>       u64 start = vma_res->start;
>>       u64 end = start + vma_res->vma_size;
>> @@ -611,10 +604,10 @@ xehpsdv_ppgtt_insert_huge(struct 
>> i915_address_space *vm,
>>   static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>>                      struct i915_vma_resource *vma_res,
>>                      struct sgt_dma *iter,
>> -                   enum i915_cache_level cache_level,
>> +                   unsigned int pat_index,
>>                      u32 flags)
>>   {
>> -    const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, flags);
>> +    const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
>>       unsigned int rem = sg_dma_len(iter->sg);
>>       u64 start = vma_res->start;
>> @@ -734,7 +727,7 @@ static void gen8_ppgtt_insert_huge(struct 
>> i915_address_space *vm,
>>   static void gen8_ppgtt_insert(struct i915_address_space *vm,
>>                     struct i915_vma_resource *vma_res,
>> -                  enum i915_cache_level cache_level,
>> +                  unsigned int pat_index,
>>                     u32 flags)
>>   {
>>       struct i915_ppgtt * const ppgtt = i915_vm_to_ppgtt(vm);
>> @@ -742,9 +735,9 @@ static void gen8_ppgtt_insert(struct 
>> i915_address_space *vm,
>>       if (vma_res->bi.page_sizes.sg > I915_GTT_PAGE_SIZE) {
>>           if (HAS_64K_PAGES(vm->i915))
>> -            xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, 
>> cache_level, flags);
>> +            xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, pat_index, 
>> flags);
>>           else
>> -            gen8_ppgtt_insert_huge(vm, vma_res, &iter, cache_level, 
>> flags);
>> +            gen8_ppgtt_insert_huge(vm, vma_res, &iter, pat_index, 
>> flags);
>>       } else  {
>>           u64 idx = vma_res->start >> GEN8_PTE_SHIFT;
>> @@ -753,7 +746,7 @@ static void gen8_ppgtt_insert(struct 
>> i915_address_space *vm,
>>                   gen8_pdp_for_page_index(vm, idx);
>>               idx = gen8_ppgtt_insert_pte(ppgtt, pdp, &iter, idx,
>> -                            cache_level, flags);
>> +                            pat_index, flags);
>>           } while (idx);
>>           vma_res->page_sizes_gtt = I915_GTT_PAGE_SIZE;
>> @@ -763,7 +756,7 @@ static void gen8_ppgtt_insert(struct 
>> i915_address_space *vm,
>>   static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>>                       dma_addr_t addr,
>>                       u64 offset,
>> -                    enum i915_cache_level level,
>> +                    unsigned int pat_index,
>>                       u32 flags)
>>   {
>>       u64 idx = offset >> GEN8_PTE_SHIFT;
>> @@ -777,14 +770,14 @@ static void gen8_ppgtt_insert_entry(struct 
>> i915_address_space *vm,
>>       GEM_BUG_ON(pt->is_compact);
>>       vaddr = px_vaddr(pt);
>> -    vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, level, flags);
>> +    vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, pat_index, 
>> flags);
>>       drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], 
>> sizeof(*vaddr));
>>   }
>>   static void __xehpsdv_ppgtt_insert_entry_lm(struct 
>> i915_address_space *vm,
>>                           dma_addr_t addr,
>>                           u64 offset,
>> -                        enum i915_cache_level level,
>> +                        unsigned int pat_index,
>>                           u32 flags)
>>   {
>>       u64 idx = offset >> GEN8_PTE_SHIFT;
>> @@ -807,20 +800,20 @@ static void 
>> __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
>>       }
>>       vaddr = px_vaddr(pt);
>> -    vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, level, 
>> flags);
>> +    vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, 
>> pat_index, flags);
>>   }
>>   static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
>>                          dma_addr_t addr,
>>                          u64 offset,
>> -                       enum i915_cache_level level,
>> +                       unsigned int pat_index,
>>                          u32 flags)
>>   {
>>       if (flags & PTE_LM)
>>           return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
>> -                               level, flags);
>> +                               pat_index, flags);
>> -    return gen8_ppgtt_insert_entry(vm, addr, offset, level, flags);
>> +    return gen8_ppgtt_insert_entry(vm, addr, offset, pat_index, flags);
>>   }
>>   static int gen8_init_scratch(struct i915_address_space *vm)
>> @@ -855,7 +848,9 @@ static int gen8_init_scratch(struct 
>> i915_address_space *vm)
>>       vm->scratch[0]->encode =
>>           vm->pte_encode(px_dma(vm->scratch[0]),
>> -                   I915_CACHE_NONE, pte_flags);
>> +                   i915_gem_get_pat_index(vm->i915,
>> +                              I915_CACHE_NONE),
>> +                   pte_flags);
>>       for (i = 1; i <= vm->top; i++) {
>>           struct drm_i915_gem_object *obj;
>> @@ -873,7 +868,9 @@ static int gen8_init_scratch(struct 
>> i915_address_space *vm)
>>           }
>>           fill_px(obj, vm->scratch[i - 1]->encode);
>> -        obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
>> +        obj->encode = gen8_pde_encode(px_dma(obj),
>> +                          i915_gem_get_pat_index(vm->i915,
>> +                                     I915_CACHE_NONE));
>>           vm->scratch[i] = obj;
>>       }
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h 
>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> index f541d19264b4..19c635441642 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> @@ -10,13 +10,12 @@
>>   struct i915_address_space;
>>   struct intel_gt;
>> -enum i915_cache_level;
>>   struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>>                        unsigned long lmem_pt_obj_flags);
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> -             enum i915_cache_level level,
>> +             unsigned int pat_index,
>>                u32 flags);
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index c8390d03fce2..2a7942fac798 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -221,7 +221,7 @@ static void guc_ggtt_invalidate(struct i915_ggtt 
>> *ggtt)
>>   }
>>   static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> -                   enum i915_cache_level level,
>> +                   unsigned int pat_index,
>>                      u32 flags)
>>   {
>>       gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
>> @@ -231,30 +231,17 @@ static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>>       if (flags & PTE_LM)
>>           pte |= GEN12_GGTT_PTE_LM;
>> -    switch (level) {
>> -    case I915_CACHE_NONE:
>> -        pte |= MTL_GGTT_PTE_PAT1;
>> -        break;
>> -    case I915_CACHE_LLC:
>> -    case I915_CACHE_L3_LLC:
>> -        pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
>> -        break;
>> -    case I915_CACHE_WT:
>> +    if (pat_index & BIT(0))
>>           pte |= MTL_GGTT_PTE_PAT0;
>> -        break;
>> -    default:
>> -        /* This should never happen. Added to deal with the compile
>> -         * error due to the addition of I915_MAX_CACHE_LEVEL. Will
>> -         * be removed by the pat_index patch.
>> -         */
>> -        break;
>> -    }
>> +
>> +    if (pat_index & BIT(1))
>> +        pte |= MTL_GGTT_PTE_PAT1;
>>       return pte;
>>   }
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> -             enum i915_cache_level level,
>> +             unsigned int pat_index,
>>                u32 flags)
>>   {
>>       gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
>> @@ -273,25 +260,25 @@ static void gen8_set_pte(void __iomem *addr, 
>> gen8_pte_t pte)
>>   static void gen8_ggtt_insert_page(struct i915_address_space *vm,
>>                     dma_addr_t addr,
>>                     u64 offset,
>> -                  enum i915_cache_level level,
>> +                  unsigned int pat_index,
>>                     u32 flags)
>>   {
>>       struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>       gen8_pte_t __iomem *pte =
>>           (gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
>> -    gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>> +    gen8_set_pte(pte, ggtt->vm.pte_encode(addr, pat_index, flags));
>>       ggtt->invalidate(ggtt);
>>   }
>>   static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
>>                        struct i915_vma_resource *vma_res,
>> -                     enum i915_cache_level level,
>> +                     unsigned int pat_index,
>>                        u32 flags)
>>   {
>>       struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> -    const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, level, flags);
>> +    const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, pat_index, 
>> flags);
>>       gen8_pte_t __iomem *gte;
>>       gen8_pte_t __iomem *end;
>>       struct sgt_iter iter;
>> @@ -348,14 +335,14 @@ static void gen8_ggtt_clear_range(struct 
>> i915_address_space *vm,
>>   static void gen6_ggtt_insert_page(struct i915_address_space *vm,
>>                     dma_addr_t addr,
>>                     u64 offset,
>> -                  enum i915_cache_level level,
>> +                  unsigned int pat_index,
>>                     u32 flags)
>>   {
>>       struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>>       gen6_pte_t __iomem *pte =
>>           (gen6_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
>> -    iowrite32(vm->pte_encode(addr, level, flags), pte);
>> +    iowrite32(vm->pte_encode(addr, pat_index, flags), pte);
>>       ggtt->invalidate(ggtt);
>>   }
>> @@ -368,7 +355,7 @@ static void gen6_ggtt_insert_page(struct 
>> i915_address_space *vm,
>>    */
>>   static void gen6_ggtt_insert_entries(struct i915_address_space *vm,
>>                        struct i915_vma_resource *vma_res,
>> -                     enum i915_cache_level level,
>> +                     unsigned int pat_index,
>>                        u32 flags)
>>   {
>>       struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>> @@ -385,7 +372,7 @@ static void gen6_ggtt_insert_entries(struct 
>> i915_address_space *vm,
>>           iowrite32(vm->scratch[0]->encode, gte++);
>>       end += (vma_res->node_size + vma_res->guard) / I915_GTT_PAGE_SIZE;
>>       for_each_sgt_daddr(addr, iter, vma_res->bi.pages)
>> -        iowrite32(vm->pte_encode(addr, level, flags), gte++);
>> +        iowrite32(vm->pte_encode(addr, pat_index, flags), gte++);
>>       GEM_BUG_ON(gte > end);
>>       /* Fill the allocated but "unused" space beyond the end of the 
>> buffer */
>> @@ -420,14 +407,15 @@ struct insert_page {
>>       struct i915_address_space *vm;
>>       dma_addr_t addr;
>>       u64 offset;
>> -    enum i915_cache_level level;
>> +    unsigned int pat_index;
>>   };
>>   static int bxt_vtd_ggtt_insert_page__cb(void *_arg)
>>   {
>>       struct insert_page *arg = _arg;
>> -    gen8_ggtt_insert_page(arg->vm, arg->addr, arg->offset, 
>> arg->level, 0);
>> +    gen8_ggtt_insert_page(arg->vm, arg->addr, arg->offset,
>> +                  arg->pat_index, 0);
>>       bxt_vtd_ggtt_wa(arg->vm);
>>       return 0;
>> @@ -436,10 +424,10 @@ static int bxt_vtd_ggtt_insert_page__cb(void *_arg)
>>   static void bxt_vtd_ggtt_insert_page__BKL(struct i915_address_space 
>> *vm,
>>                         dma_addr_t addr,
>>                         u64 offset,
>> -                      enum i915_cache_level level,
>> +                      unsigned int pat_index,
>>                         u32 unused)
>>   {
>> -    struct insert_page arg = { vm, addr, offset, level };
>> +    struct insert_page arg = { vm, addr, offset, pat_index };
>>       stop_machine(bxt_vtd_ggtt_insert_page__cb, &arg, NULL);
>>   }
>> @@ -447,7 +435,7 @@ static void bxt_vtd_ggtt_insert_page__BKL(struct 
>> i915_address_space *vm,
>>   struct insert_entries {
>>       struct i915_address_space *vm;
>>       struct i915_vma_resource *vma_res;
>> -    enum i915_cache_level level;
>> +    unsigned int pat_index;
>>       u32 flags;
>>   };
>> @@ -455,7 +443,8 @@ static int bxt_vtd_ggtt_insert_entries__cb(void 
>> *_arg)
>>   {
>>       struct insert_entries *arg = _arg;
>> -    gen8_ggtt_insert_entries(arg->vm, arg->vma_res, arg->level, 
>> arg->flags);
>> +    gen8_ggtt_insert_entries(arg->vm, arg->vma_res,
>> +                 arg->pat_index, arg->flags);
>>       bxt_vtd_ggtt_wa(arg->vm);
>>       return 0;
>> @@ -463,10 +452,10 @@ static int bxt_vtd_ggtt_insert_entries__cb(void 
>> *_arg)
>>   static void bxt_vtd_ggtt_insert_entries__BKL(struct 
>> i915_address_space *vm,
>>                            struct i915_vma_resource *vma_res,
>> -                         enum i915_cache_level level,
>> +                         unsigned int pat_index,
>>                            u32 flags)
>>   {
>> -    struct insert_entries arg = { vm, vma_res, level, flags };
>> +    struct insert_entries arg = { vm, vma_res, pat_index, flags };
>>       stop_machine(bxt_vtd_ggtt_insert_entries__cb, &arg, NULL);
>>   }
>> @@ -495,7 +484,7 @@ static void gen6_ggtt_clear_range(struct 
>> i915_address_space *vm,
>>   void intel_ggtt_bind_vma(struct i915_address_space *vm,
>>                struct i915_vm_pt_stash *stash,
>>                struct i915_vma_resource *vma_res,
>> -             enum i915_cache_level cache_level,
>> +             unsigned int pat_index,
>>                u32 flags)
>>   {
>>       u32 pte_flags;
>> @@ -512,7 +501,7 @@ void intel_ggtt_bind_vma(struct i915_address_space 
>> *vm,
>>       if (vma_res->bi.lmem)
>>           pte_flags |= PTE_LM;
>> -    vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +    vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>       vma_res->page_sizes_gtt = I915_GTT_PAGE_SIZE;
>>   }
>> @@ -661,7 +650,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>   static void aliasing_gtt_bind_vma(struct i915_address_space *vm,
>>                     struct i915_vm_pt_stash *stash,
>>                     struct i915_vma_resource *vma_res,
>> -                  enum i915_cache_level cache_level,
>> +                  unsigned int pat_index,
>>                     u32 flags)
>>   {
>>       u32 pte_flags;
>> @@ -673,10 +662,10 @@ static void aliasing_gtt_bind_vma(struct 
>> i915_address_space *vm,
>>       if (flags & I915_VMA_LOCAL_BIND)
>>           ppgtt_bind_vma(&i915_vm_to_ggtt(vm)->alias->vm,
>> -                   stash, vma_res, cache_level, flags);
>> +                   stash, vma_res, pat_index, flags);
>>       if (flags & I915_VMA_GLOBAL_BIND)
>> -        vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +        vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>       vma_res->bound_flags |= flags;
>>   }
>> @@ -933,7 +922,9 @@ static int ggtt_probe_common(struct i915_ggtt 
>> *ggtt, u64 size)
>>       ggtt->vm.scratch[0]->encode =
>>           ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
>> -                    I915_CACHE_NONE, pte_flags);
>> +                    i915_gem_get_pat_index(i915,
>> +                               I915_CACHE_NONE),
>> +                    pte_flags);
>>       return 0;
>>   }
>> @@ -1022,6 +1013,11 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>       return ggtt_probe_common(ggtt, size);
>>   }
>> +/*
>> + * For pre-gen8 platforms pat_index is the same as enum 
>> i915_cache_level,
>> + * so these PTE encode functions are left with using cache_level.
>> + * See translation table LEGACY_CACHELEVEL.
>> + */
>>   static u64 snb_pte_encode(dma_addr_t addr,
>>                 enum i915_cache_level level,
>>                 u32 flags)
>> @@ -1302,7 +1298,9 @@ bool i915_ggtt_resume_vm(struct 
>> i915_address_space *vm)
>>            */
>>           vma->resource->bound_flags = 0;
>>           vma->ops->bind_vma(vm, NULL, vma->resource,
>> -                   obj ? obj->cache_level : 0,
>> +                   obj ? obj->pat_index :
>> +                     i915_gem_get_pat_index(vm->i915,
>> +                                I915_CACHE_NONE),
>>                      was_bound);
>>           if (obj) { /* only used during resume => exclusive access */
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 854ec09fd588..be767e13b1e5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -165,8 +165,6 @@ typedef u64 gen8_pte_t;
>>   #define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
>>   #define MTL_0_COH_NON    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
>> -enum i915_cache_level;
>> -
>>   struct drm_i915_gem_object;
>>   struct i915_fence_reg;
>>   struct i915_vma;
>> @@ -234,7 +232,7 @@ struct i915_vma_ops {
>>       void (*bind_vma)(struct i915_address_space *vm,
>>                struct i915_vm_pt_stash *stash,
>>                struct i915_vma_resource *vma_res,
>> -             enum i915_cache_level cache_level,
>> +             unsigned int pat_index,
>>                u32 flags);
>>       /*
>>        * Unmap an object from an address space. This usually consists of
>> @@ -306,7 +304,7 @@ struct i915_address_space {
>>           (*alloc_scratch_dma)(struct i915_address_space *vm, int sz);
>>       u64 (*pte_encode)(dma_addr_t addr,
>> -              enum i915_cache_level level,
>> +              unsigned int pat_index,
>>                 u32 flags); /* Create a valid PTE */
>>   #define PTE_READ_ONLY    BIT(0)
>>   #define PTE_LM        BIT(1)
>> @@ -321,20 +319,20 @@ struct i915_address_space {
>>       void (*insert_page)(struct i915_address_space *vm,
>>                   dma_addr_t addr,
>>                   u64 offset,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   u32 flags);
>>       void (*insert_entries)(struct i915_address_space *vm,
>>                      struct i915_vma_resource *vma_res,
>> -                   enum i915_cache_level cache_level,
>> +                   unsigned int pat_index,
>>                      u32 flags);
>>       void (*raw_insert_page)(struct i915_address_space *vm,
>>                   dma_addr_t addr,
>>                   u64 offset,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   u32 flags);
>>       void (*raw_insert_entries)(struct i915_address_space *vm,
>>                      struct i915_vma_resource *vma_res,
>> -                   enum i915_cache_level cache_level,
>> +                   unsigned int pat_index,
>>                      u32 flags);
>>       void (*cleanup)(struct i915_address_space *vm);
>> @@ -581,7 +579,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct 
>> intel_gt *gt,
>>   void intel_ggtt_bind_vma(struct i915_address_space *vm,
>>                struct i915_vm_pt_stash *stash,
>>                struct i915_vma_resource *vma_res,
>> -             enum i915_cache_level cache_level,
>> +             unsigned int pat_index,
>>                u32 flags);
>>   void intel_ggtt_unbind_vma(struct i915_address_space *vm,
>>                  struct i915_vma_resource *vma_res);
>> @@ -639,7 +637,7 @@ void
>>   __set_pd_entry(struct i915_page_directory * const pd,
>>              const unsigned short idx,
>>              struct i915_page_table *pt,
>> -           u64 (*encode)(const dma_addr_t, const enum 
>> i915_cache_level));
>> +           u64 (*encode)(const dma_addr_t, const unsigned int 
>> pat_index));
>>   #define set_pd_entry(pd, idx, to) \
>>       __set_pd_entry((pd), (idx), px_pt(to), gen8_pde_encode)
>> @@ -659,7 +657,7 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt);
>>   void ppgtt_bind_vma(struct i915_address_space *vm,
>>               struct i915_vm_pt_stash *stash,
>>               struct i915_vma_resource *vma_res,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               u32 flags);
>>   void ppgtt_unbind_vma(struct i915_address_space *vm,
>>                 struct i915_vma_resource *vma_res);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c 
>> b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> index 3f638f198796..117c3d05af3e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> @@ -45,7 +45,9 @@ static void xehpsdv_toggle_pdes(struct 
>> i915_address_space *vm,
>>        * Insert a dummy PTE into every PT that will map to LMEM to ensure
>>        * we have a correctly setup PDE structure for later use.
>>        */
>> -    vm->insert_page(vm, 0, d->offset, I915_CACHE_NONE, PTE_LM);
>> +    vm->insert_page(vm, 0, d->offset,
>> +            i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>> +            PTE_LM);
>>       GEM_BUG_ON(!pt->is_compact);
>>       d->offset += SZ_2M;
>>   }
>> @@ -63,7 +65,9 @@ static void xehpsdv_insert_pte(struct 
>> i915_address_space *vm,
>>        * alignment is 64K underneath for the pt, and we are careful
>>        * not to access the space in the void.
>>        */
>> -    vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE, PTE_LM);
>> +    vm->insert_page(vm, px_dma(pt), d->offset,
>> +            i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>> +            PTE_LM);
>>       d->offset += SZ_64K;
>>   }
>> @@ -73,7 +77,8 @@ static void insert_pte(struct i915_address_space *vm,
>>   {
>>       struct insert_pte_data *d = data;
>> -    vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
>> +    vm->insert_page(vm, px_dma(pt), d->offset,
>> +            i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>>               i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
>>       d->offset += PAGE_SIZE;
>>   }
>> @@ -356,13 +361,13 @@ static int max_pte_pkt_size(struct i915_request 
>> *rq, int pkt)
>>   static int emit_pte(struct i915_request *rq,
>>               struct sgt_dma *it,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               bool is_lmem,
>>               u64 offset,
>>               int length)
>>   {
>>       bool has_64K_pages = HAS_64K_PAGES(rq->engine->i915);
>> -    const u64 encode = rq->context->vm->pte_encode(0, cache_level,
>> +    const u64 encode = rq->context->vm->pte_encode(0, pat_index,
>>                                  is_lmem ? PTE_LM : 0);
>>       struct intel_ring *ring = rq->ring;
>>       int pkt, dword_length;
>> @@ -673,17 +678,17 @@ int
>>   intel_context_migrate_copy(struct intel_context *ce,
>>                  const struct i915_deps *deps,
>>                  struct scatterlist *src,
>> -               enum i915_cache_level src_cache_level,
>> +               unsigned int src_pat_index,
>>                  bool src_is_lmem,
>>                  struct scatterlist *dst,
>> -               enum i915_cache_level dst_cache_level,
>> +               unsigned int dst_pat_index,
>>                  bool dst_is_lmem,
>>                  struct i915_request **out)
>>   {
>>       struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst), it_ccs;
>>       struct drm_i915_private *i915 = ce->engine->i915;
>>       u64 ccs_bytes_to_cpy = 0, bytes_to_cpy;
>> -    enum i915_cache_level ccs_cache_level;
>> +    unsigned int ccs_pat_index;
>>       u32 src_offset, dst_offset;
>>       u8 src_access, dst_access;
>>       struct i915_request *rq;
>> @@ -707,12 +712,12 @@ intel_context_migrate_copy(struct intel_context 
>> *ce,
>>           dst_sz = scatter_list_length(dst);
>>           if (src_is_lmem) {
>>               it_ccs = it_dst;
>> -            ccs_cache_level = dst_cache_level;
>> +            ccs_pat_index = dst_pat_index;
>>               ccs_is_src = false;
>>           } else if (dst_is_lmem) {
>>               bytes_to_cpy = dst_sz;
>>               it_ccs = it_src;
>> -            ccs_cache_level = src_cache_level;
>> +            ccs_pat_index = src_pat_index;
>>               ccs_is_src = true;
>>           }
>> @@ -773,7 +778,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>           src_sz = calculate_chunk_sz(i915, src_is_lmem,
>>                           bytes_to_cpy, ccs_bytes_to_cpy);
>> -        len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>> +        len = emit_pte(rq, &it_src, src_pat_index, src_is_lmem,
>>                      src_offset, src_sz);
>>           if (!len) {
>>               err = -EINVAL;
>> @@ -784,7 +789,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>               goto out_rq;
>>           }
>> -        err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
>> +        err = emit_pte(rq, &it_dst, dst_pat_index, dst_is_lmem,
>>                      dst_offset, len);
>>           if (err < 0)
>>               goto out_rq;
>> @@ -811,7 +816,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>                   goto out_rq;
>>               ccs_sz = GET_CCS_BYTES(i915, len);
>> -            err = emit_pte(rq, &it_ccs, ccs_cache_level, false,
>> +            err = emit_pte(rq, &it_ccs, ccs_pat_index, false,
>>                          ccs_is_src ? src_offset : dst_offset,
>>                          ccs_sz);
>>               if (err < 0)
>> @@ -979,7 +984,7 @@ int
>>   intel_context_migrate_clear(struct intel_context *ce,
>>                   const struct i915_deps *deps,
>>                   struct scatterlist *sg,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   bool is_lmem,
>>                   u32 value,
>>                   struct i915_request **out)
>> @@ -1027,7 +1032,7 @@ intel_context_migrate_clear(struct intel_context 
>> *ce,
>>           if (err)
>>               goto out_rq;
>> -        len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
>> +        len = emit_pte(rq, &it, pat_index, is_lmem, offset, CHUNK_SZ);
>>           if (len <= 0) {
>>               err = len;
>>               goto out_rq;
>> @@ -1074,10 +1079,10 @@ int intel_migrate_copy(struct intel_migrate *m,
>>                  struct i915_gem_ww_ctx *ww,
>>                  const struct i915_deps *deps,
>>                  struct scatterlist *src,
>> -               enum i915_cache_level src_cache_level,
>> +               unsigned int src_pat_index,
>>                  bool src_is_lmem,
>>                  struct scatterlist *dst,
>> -               enum i915_cache_level dst_cache_level,
>> +               unsigned int dst_pat_index,
>>                  bool dst_is_lmem,
>>                  struct i915_request **out)
>>   {
>> @@ -1098,8 +1103,8 @@ int intel_migrate_copy(struct intel_migrate *m,
>>           goto out;
>>       err = intel_context_migrate_copy(ce, deps,
>> -                     src, src_cache_level, src_is_lmem,
>> -                     dst, dst_cache_level, dst_is_lmem,
>> +                     src, src_pat_index, src_is_lmem,
>> +                     dst, dst_pat_index, dst_is_lmem,
>>                        out);
>>       intel_context_unpin(ce);
>> @@ -1113,7 +1118,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>               struct i915_gem_ww_ctx *ww,
>>               const struct i915_deps *deps,
>>               struct scatterlist *sg,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               bool is_lmem,
>>               u32 value,
>>               struct i915_request **out)
>> @@ -1134,7 +1139,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>       if (err)
>>           goto out;
>> -    err = intel_context_migrate_clear(ce, deps, sg, cache_level,
>> +    err = intel_context_migrate_clear(ce, deps, sg, pat_index,
>>                         is_lmem, value, out);
>>       intel_context_unpin(ce);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.h 
>> b/drivers/gpu/drm/i915/gt/intel_migrate.h
>> index ccc677ec4aa3..11fc09a00c4b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.h
>> @@ -16,7 +16,6 @@ struct i915_request;
>>   struct i915_gem_ww_ctx;
>>   struct intel_gt;
>>   struct scatterlist;
>> -enum i915_cache_level;
>>   int intel_migrate_init(struct intel_migrate *m, struct intel_gt *gt);
>> @@ -26,20 +25,20 @@ int intel_migrate_copy(struct intel_migrate *m,
>>                  struct i915_gem_ww_ctx *ww,
>>                  const struct i915_deps *deps,
>>                  struct scatterlist *src,
>> -               enum i915_cache_level src_cache_level,
>> +               unsigned int src_pat_index,
>>                  bool src_is_lmem,
>>                  struct scatterlist *dst,
>> -               enum i915_cache_level dst_cache_level,
>> +               unsigned int dst_pat_index,
>>                  bool dst_is_lmem,
>>                  struct i915_request **out);
>>   int intel_context_migrate_copy(struct intel_context *ce,
>>                      const struct i915_deps *deps,
>>                      struct scatterlist *src,
>> -                   enum i915_cache_level src_cache_level,
>> +                   unsigned int src_pat_index,
>>                      bool src_is_lmem,
>>                      struct scatterlist *dst,
>> -                   enum i915_cache_level dst_cache_level,
>> +                   unsigned int dst_pat_index,
>>                      bool dst_is_lmem,
>>                      struct i915_request **out);
>> @@ -48,7 +47,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>               struct i915_gem_ww_ctx *ww,
>>               const struct i915_deps *deps,
>>               struct scatterlist *sg,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               bool is_lmem,
>>               u32 value,
>>               struct i915_request **out);
>> @@ -56,7 +55,7 @@ int
>>   intel_context_migrate_clear(struct intel_context *ce,
>>                   const struct i915_deps *deps,
>>                   struct scatterlist *sg,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   bool is_lmem,
>>                   u32 value,
>>                   struct i915_request **out);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> index 7ecfa672f738..f0da3555c6db 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> @@ -98,7 +98,7 @@ void
>>   __set_pd_entry(struct i915_page_directory * const pd,
>>              const unsigned short idx,
>>              struct i915_page_table * const to,
>> -           u64 (*encode)(const dma_addr_t, const enum i915_cache_level))
>> +           u64 (*encode)(const dma_addr_t, const unsigned int))
>>   {
>>       /* Each thread pre-pins the pd, and we may have a thread per 
>> pde. */
>>       GEM_BUG_ON(atomic_read(px_used(pd)) > NALLOC * I915_PDES);
>> @@ -181,7 +181,7 @@ struct i915_ppgtt *i915_ppgtt_create(struct 
>> intel_gt *gt,
>>   void ppgtt_bind_vma(struct i915_address_space *vm,
>>               struct i915_vm_pt_stash *stash,
>>               struct i915_vma_resource *vma_res,
>> -            enum i915_cache_level cache_level,
>> +            unsigned int pat_index,
>>               u32 flags)
>>   {
>>       u32 pte_flags;
>> @@ -199,7 +199,7 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
>>       if (vma_res->bi.lmem)
>>           pte_flags |= PTE_LM;
>> -    vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +    vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>       wmb();
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c 
>> b/drivers/gpu/drm/i915/gt/selftest_migrate.c
>> index e677f2da093d..3def5ca72dec 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
>> @@ -137,7 +137,7 @@ static int copy(struct intel_migrate *migrate,
>>   static int intel_context_copy_ccs(struct intel_context *ce,
>>                     const struct i915_deps *deps,
>>                     struct scatterlist *sg,
>> -                  enum i915_cache_level cache_level,
>> +                  unsigned int pat_index,
>>                     bool write_to_ccs,
>>                     struct i915_request **out)
>>   {
>> @@ -185,7 +185,7 @@ static int intel_context_copy_ccs(struct 
>> intel_context *ce,
>>           if (err)
>>               goto out_rq;
>> -        len = emit_pte(rq, &it, cache_level, true, offset, CHUNK_SZ);
>> +        len = emit_pte(rq, &it, pat_index, true, offset, CHUNK_SZ);
>>           if (len <= 0) {
>>               err = len;
>>               goto out_rq;
>> @@ -223,7 +223,7 @@ intel_migrate_ccs_copy(struct intel_migrate *m,
>>                  struct i915_gem_ww_ctx *ww,
>>                  const struct i915_deps *deps,
>>                  struct scatterlist *sg,
>> -               enum i915_cache_level cache_level,
>> +               unsigned int pat_index,
>>                  bool write_to_ccs,
>>                  struct i915_request **out)
>>   {
>> @@ -243,7 +243,7 @@ intel_migrate_ccs_copy(struct intel_migrate *m,
>>       if (err)
>>           goto out;
>> -    err = intel_context_copy_ccs(ce, deps, sg, cache_level,
>> +    err = intel_context_copy_ccs(ce, deps, sg, pat_index,
>>                        write_to_ccs, out);
>>       intel_context_unpin(ce);
>> @@ -300,7 +300,7 @@ static int clear(struct intel_migrate *migrate,
>>               /* Write the obj data into ccs surface */
>>               err = intel_migrate_ccs_copy(migrate, &ww, NULL,
>>                                obj->mm.pages->sgl,
>> -                             obj->cache_level,
>> +                             obj->pat_index,
>>                                true, &rq);
>>               if (rq && !err) {
>>                   if (i915_request_wait(rq, 0, HZ) < 0) {
>> @@ -351,7 +351,7 @@ static int clear(struct intel_migrate *migrate,
>>               err = intel_migrate_ccs_copy(migrate, &ww, NULL,
>>                                obj->mm.pages->sgl,
>> -                             obj->cache_level,
>> +                             obj->pat_index,
>>                                false, &rq);
>>               if (rq && !err) {
>>                   if (i915_request_wait(rq, 0, HZ) < 0) {
>> @@ -414,9 +414,9 @@ static int __migrate_copy(struct intel_migrate 
>> *migrate,
>>                 struct i915_request **out)
>>   {
>>       return intel_migrate_copy(migrate, ww, NULL,
>> -                  src->mm.pages->sgl, src->cache_level,
>> +                  src->mm.pages->sgl, src->pat_index,
>>                     i915_gem_object_is_lmem(src),
>> -                  dst->mm.pages->sgl, dst->cache_level,
>> +                  dst->mm.pages->sgl, dst->pat_index,
>>                     i915_gem_object_is_lmem(dst),
>>                     out);
>>   }
>> @@ -428,9 +428,9 @@ static int __global_copy(struct intel_migrate 
>> *migrate,
>>                struct i915_request **out)
>>   {
>>       return intel_context_migrate_copy(migrate->context, NULL,
>> -                      src->mm.pages->sgl, src->cache_level,
>> +                      src->mm.pages->sgl, src->pat_index,
>>                         i915_gem_object_is_lmem(src),
>> -                      dst->mm.pages->sgl, dst->cache_level,
>> +                      dst->mm.pages->sgl, dst->pat_index,
>>                         i915_gem_object_is_lmem(dst),
>>                         out);
>>   }
>> @@ -455,7 +455,7 @@ static int __migrate_clear(struct intel_migrate 
>> *migrate,
>>   {
>>       return intel_migrate_clear(migrate, ww, NULL,
>>                      obj->mm.pages->sgl,
>> -                   obj->cache_level,
>> +                   obj->pat_index,
>>                      i915_gem_object_is_lmem(obj),
>>                      value, out);
>>   }
>> @@ -468,7 +468,7 @@ static int __global_clear(struct intel_migrate 
>> *migrate,
>>   {
>>       return intel_context_migrate_clear(migrate->context, NULL,
>>                          obj->mm.pages->sgl,
>> -                       obj->cache_level,
>> +                       obj->pat_index,
>>                          i915_gem_object_is_lmem(obj),
>>                          value, out);
>>   }
>> @@ -648,7 +648,7 @@ static int live_emit_pte_full_ring(void *arg)
>>        */
>>       pr_info("%s emite_pte ring space=%u\n", __func__, rq->ring->space);
>>       it = sg_sgt(obj->mm.pages->sgl);
>> -    len = emit_pte(rq, &it, obj->cache_level, false, 0, CHUNK_SZ);
>> +    len = emit_pte(rq, &it, obj->pat_index, false, 0, CHUNK_SZ);
>>       if (!len) {
>>           err = -EINVAL;
>>           goto out_rq;
>> @@ -844,7 +844,7 @@ static int wrap_ktime_compare(const void *A, const 
>> void *B)
>>   static int __perf_clear_blt(struct intel_context *ce,
>>                   struct scatterlist *sg,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   bool is_lmem,
>>                   size_t sz)
>>   {
>> @@ -858,7 +858,7 @@ static int __perf_clear_blt(struct intel_context *ce,
>>           t0 = ktime_get();
>> -        err = intel_context_migrate_clear(ce, NULL, sg, cache_level,
>> +        err = intel_context_migrate_clear(ce, NULL, sg, pat_index,
>>                             is_lmem, 0, &rq);
>>           if (rq) {
>>               if (i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT) < 0)
>> @@ -904,7 +904,8 @@ static int perf_clear_blt(void *arg)
>>           err = __perf_clear_blt(gt->migrate.context,
>>                          dst->mm.pages->sgl,
>> -                       I915_CACHE_NONE,
>> +                       i915_gem_get_pat_index(gt->i915,
>> +                                  I915_CACHE_NONE),
>>                          i915_gem_object_is_lmem(dst),
>>                          sizes[i]);
>> @@ -919,10 +920,10 @@ static int perf_clear_blt(void *arg)
>>   static int __perf_copy_blt(struct intel_context *ce,
>>                  struct scatterlist *src,
>> -               enum i915_cache_level src_cache_level,
>> +               unsigned int src_pat_index,
>>                  bool src_is_lmem,
>>                  struct scatterlist *dst,
>> -               enum i915_cache_level dst_cache_level,
>> +               unsigned int dst_pat_index,
>>                  bool dst_is_lmem,
>>                  size_t sz)
>>   {
>> @@ -937,9 +938,9 @@ static int __perf_copy_blt(struct intel_context *ce,
>>           t0 = ktime_get();
>>           err = intel_context_migrate_copy(ce, NULL,
>> -                         src, src_cache_level,
>> +                         src, src_pat_index,
>>                            src_is_lmem,
>> -                         dst, dst_cache_level,
>> +                         dst, dst_pat_index,
>>                            dst_is_lmem,
>>                            &rq);
>>           if (rq) {
>> @@ -994,10 +995,12 @@ static int perf_copy_blt(void *arg)
>>           err = __perf_copy_blt(gt->migrate.context,
>>                         src->mm.pages->sgl,
>> -                      I915_CACHE_NONE,
>> +                      i915_gem_get_pat_index(gt->i915,
>> +                                 I915_CACHE_NONE),
>>                         i915_gem_object_is_lmem(src),
>>                         dst->mm.pages->sgl,
>> -                      I915_CACHE_NONE,
>> +                      i915_gem_get_pat_index(gt->i915,
>> +                                 I915_CACHE_NONE),
>>                         i915_gem_object_is_lmem(dst),
>>                         sz);
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c 
>> b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> index a9e0a91bc0e0..79aa6ac66ad2 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -86,7 +86,9 @@ __igt_reset_stolen(struct intel_gt *gt,
>>           ggtt->vm.insert_page(&ggtt->vm, dma,
>>                        ggtt->error_capture.start,
>> -                     I915_CACHE_NONE, 0);
>> +                     i915_gem_get_pat_index(gt->i915,
>> +                                I915_CACHE_NONE),
>> +                     0);
>>           mb();
>>           s = io_mapping_map_wc(&ggtt->iomap,
>> @@ -127,7 +129,9 @@ __igt_reset_stolen(struct intel_gt *gt,
>>           ggtt->vm.insert_page(&ggtt->vm, dma,
>>                        ggtt->error_capture.start,
>> -                     I915_CACHE_NONE, 0);
>> +                     i915_gem_get_pat_index(gt->i915,
>> +                                I915_CACHE_NONE),
>> +                     0);
>>           mb();
>>           s = io_mapping_map_wc(&ggtt->iomap,
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c 
>> b/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> index 9f536c251179..39c3ec12df1a 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> @@ -836,7 +836,7 @@ static int setup_watcher(struct hwsp_watcher *w, 
>> struct intel_gt *gt,
>>           return PTR_ERR(obj);
>>       /* keep the same cache settings as timeline */
>> -    i915_gem_object_set_cache_coherency(obj, 
>> tl->hwsp_ggtt->obj->cache_level);
>> +    i915_gem_object_set_pat_index(obj, tl->hwsp_ggtt->obj->pat_index);
>>       w->map = i915_gem_object_pin_map_unlocked(obj,
>>                             
>> page_unmask_bits(tl->hwsp_ggtt->obj->mm.mapping));
>>       if (IS_ERR(w->map)) {
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c 
>> b/drivers/gpu/drm/i915/gt/selftest_tlb.c
>> index e6cac1f15d6e..4493c8518e91 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
>> @@ -36,6 +36,8 @@ pte_tlbinv(struct intel_context *ce,
>>          u64 length,
>>          struct rnd_state *prng)
>>   {
>> +    const unsigned int pat_index =
>> +        i915_gem_get_pat_index(ce->vm->i915, I915_CACHE_NONE);
>>       struct drm_i915_gem_object *batch;
>>       struct drm_mm_node vb_node;
>>       struct i915_request *rq;
>> @@ -155,7 +157,7 @@ pte_tlbinv(struct intel_context *ce,
>>           /* Flip the PTE between A and B */
>>           if (i915_gem_object_is_lmem(vb->obj))
>>               pte_flags |= PTE_LM;
>> -        ce->vm->insert_entries(ce->vm, &vb_res, 0, pte_flags);
>> +        ce->vm->insert_entries(ce->vm, &vb_res, pat_index, pte_flags);
>>           /* Flush the PTE update to concurrent HW */
>>           tlbinv(ce->vm, addr & -length, length);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index a82a53dbbc86..145681ae20a5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -890,9 +890,15 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>> *uc_fw)
>>           pte_flags |= PTE_LM;
>>       if (ggtt->vm.raw_insert_entries)
>> -        ggtt->vm.raw_insert_entries(&ggtt->vm, dummy, 
>> I915_CACHE_NONE, pte_flags);
>> +        ggtt->vm.raw_insert_entries(&ggtt->vm, dummy,
>> +                        i915_gem_get_pat_index(ggtt->vm.i915,
>> +                                   I915_CACHE_NONE),
>> +                        pte_flags);
>>       else
>> -        ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 
>> pte_flags);
>> +        ggtt->vm.insert_entries(&ggtt->vm, dummy,
>> +                    i915_gem_get_pat_index(ggtt->vm.i915,
>> +                                   I915_CACHE_NONE),
>> +                    pte_flags);
>>   }
>>   static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>> b/drivers/gpu/drm/i915/i915_debugfs.c
>> index 41389a32e998..9a4922da3a71 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -139,21 +139,56 @@ static const char *stringify_vma_type(const 
>> struct i915_vma *vma)
>>       return "ppgtt";
>>   }
>> -static const char *i915_cache_level_str(struct drm_i915_private 
>> *i915, int type)
>> -{
>> -    switch (type) {
>> -    case I915_CACHE_NONE: return " uncached";
>> -    case I915_CACHE_LLC: return HAS_LLC(i915) ? " LLC" : " snooped";
>> -    case I915_CACHE_L3_LLC: return " L3+LLC";
>> -    case I915_CACHE_WT: return " WT";
>> -    default: return "";
>> +static const char *i915_cache_level_str(struct drm_i915_gem_object *obj)
>> +{
>> +    struct drm_i915_private *i915 = obj_to_i915(obj);
>> +
>> +    if (IS_METEORLAKE(i915)) {
>> +        switch (obj->pat_index) {
>> +        case 0: return " WB";
>> +        case 1: return " WT";
>> +        case 2: return " UC";
>> +        case 3: return " WB (1-Way Coh)";
>> +        case 4: return " WB (2-Way Coh)";
>> +        default: return " not defined";

Is not defined possible?

Also, it may be nicer to handle the leading space in the caller.

>> +        }
>> +    } else if (IS_PONTEVECCHIO(i915)) {
>> +        switch (obj->pat_index) {
>> +        case 0: return " UC";
>> +        case 1: return " WC";
>> +        case 2: return " WT";
>> +        case 3: return " WB";
>> +        case 4: return " WT (CLOS1)";
>> +        case 5: return " WB (CLOS1)";
>> +        case 6: return " WT (CLOS2)";
>> +        case 7: return " WT (CLOS2)";
>> +        default: return " not defined";
>> +        }
>> +    } else if (GRAPHICS_VER(i915) >= 12) {
>> +        switch (obj->pat_index) {
>> +        case 0: return " WB";
>> +        case 1: return " WC";
>> +        case 2: return " WT";
>> +        case 3: return " UC";
>> +        default: return " not defined";
>> +        }
>> +    } else {

Is this correct if a legacy platform used the set pat extension? I don't see that it is disallowed.

Would it simplify things to add a reverse table to device info, so like cachelevel_to_pat, just for pat_index to names? I guess it depends what names PRMs use for PATs on legacy platforms. Is it consistend with the above UC/WC/WB/... or with the below names.

>> +        if (i915_gem_object_has_cache_level(obj, I915_CACHE_NONE))
>> +            return " uncached";

UC for consistency?

>> +        else if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC))
>> +            return HAS_LLC(i915) ? " LLC" : " snooped";
>> +        else if (i915_gem_object_has_cache_level(obj, 
>> I915_CACHE_L3_LLC))
>> +            return " L3+LLC";

Is this correct if !HAS_LLC?

>> +        else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>> +            return " WT";
>> +        else
>> +            return " not defined";

Current code prints nothing for the default switch statement.

But is this even reachable or should it be MISSING_CASE warning?

>>       }
>>   }
>>   void
>>   i915_debugfs_describe_obj(struct seq_file *m, struct 
>> drm_i915_gem_object *obj)
>>   {
>> -    struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
>>       struct i915_vma *vma;
>>       int pin_count = 0;
>> @@ -165,7 +200,7 @@ i915_debugfs_describe_obj(struct seq_file *m, 
>> struct drm_i915_gem_object *obj)
>>              obj->base.size / 1024,
>>              obj->read_domains,
>>              obj->write_domain,
>> -           i915_cache_level_str(dev_priv, obj->cache_level),
>> +           i915_cache_level_str(obj),
>>              obj->mm.dirty ? " dirty" : "",
>>              obj->mm.madv == I915_MADV_DONTNEED ? " purgeable" : "");
>>       if (obj->base.name)
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 0a78bdbd36b1..63207b0740b3 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -420,8 +420,12 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>>           page_length = remain < page_length ? remain : page_length;
>>           if (drm_mm_node_allocated(&node)) {
>>               ggtt->vm.insert_page(&ggtt->vm,
>> -                         i915_gem_object_get_dma_address(obj, offset 
>> >> PAGE_SHIFT),
>> -                         node.start, I915_CACHE_NONE, 0);
>> +                    i915_gem_object_get_dma_address(obj,
>> +                                    offset >> PAGE_SHIFT),
>> +                    node.start,
>> +                    i915_gem_get_pat_index(i915,
>> +                                   I915_CACHE_NONE),

For the callsites which use const levels you could at least do something like i915->pat_cache_none, or I know the not very popular static inline i915_gem_get_pat_index so it can be evaluated at runtime. Not sure really, throwing out ideas which may be invalid if a more elegant refactoring is possible.

Regards,

Tvrtko

>> +                    0);
>>           } else {
>>               page_base += offset & PAGE_MASK;
>>           }
>> @@ -598,8 +602,12 @@ i915_gem_gtt_pwrite_fast(struct 
>> drm_i915_gem_object *obj,
>>               /* flush the write before we modify the GGTT */
>>               intel_gt_flush_ggtt_writes(ggtt->vm.gt);
>>               ggtt->vm.insert_page(&ggtt->vm,
>> -                         i915_gem_object_get_dma_address(obj, offset 
>> >> PAGE_SHIFT),
>> -                         node.start, I915_CACHE_NONE, 0);
>> +                    i915_gem_object_get_dma_address(obj,
>> +                                    offset >> PAGE_SHIFT),
>> +                    node.start,
>> +                    i915_gem_get_pat_index(i915,
>> +                                   I915_CACHE_NONE),
>> +                    0);
>>               wmb(); /* flush modifications to the GGTT (insert_page) */
>>           } else {
>>               page_base += offset & PAGE_MASK;
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index f020c0086fbc..2556cabea02c 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1117,10 +1117,14 @@ i915_vma_coredump_create(const struct intel_gt 
>> *gt,
>>               mutex_lock(&ggtt->error_mutex);
>>               if (ggtt->vm.raw_insert_page)
>>                   ggtt->vm.raw_insert_page(&ggtt->vm, dma, slot,
>> -                             I915_CACHE_NONE, 0);
>> +                        i915_gem_get_pat_index(gt->i915,
>> +                                       I915_CACHE_NONE),
>> +                        0);
>>               else
>>                   ggtt->vm.insert_page(&ggtt->vm, dma, slot,
>> -                             I915_CACHE_NONE, 0);
>> +                        i915_gem_get_pat_index(gt->i915,
>> +                                       I915_CACHE_NONE),
>> +                        0);
>>               mb();
>>               s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 20a44788999e..a814775a363d 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -315,7 +315,7 @@ struct i915_vma_work {
>>       struct i915_vma_resource *vma_res;
>>       struct drm_i915_gem_object *obj;
>>       struct i915_sw_dma_fence_cb cb;
>> -    enum i915_cache_level cache_level;
>> +    unsigned int pat_index;
>>       unsigned int flags;
>>   };
>> @@ -334,7 +334,7 @@ static void __vma_bind(struct dma_fence_work *work)
>>           return;
>>       vma_res->ops->bind_vma(vma_res->vm, &vw->stash,
>> -                   vma_res, vw->cache_level, vw->flags);
>> +                   vma_res, vw->pat_index, vw->flags);
>>   }
>>   static void __vma_release(struct dma_fence_work *work)
>> @@ -426,7 +426,7 @@ i915_vma_resource_init_from_vma(struct 
>> i915_vma_resource *vma_res,
>>   /**
>>    * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding 
>> address space.
>>    * @vma: VMA to map
>> - * @cache_level: mapping cache level
>> + * @pat_index: PAT index to set in PTE
>>    * @flags: flags like global or local mapping
>>    * @work: preallocated worker for allocating and binding the PTE
>>    * @vma_res: pointer to a preallocated vma resource. The resource is 
>> either
>> @@ -437,7 +437,7 @@ i915_vma_resource_init_from_vma(struct 
>> i915_vma_resource *vma_res,
>>    * Note that DMA addresses are also the only part of the SG table we 
>> care about.
>>    */
>>   int i915_vma_bind(struct i915_vma *vma,
>> -          enum i915_cache_level cache_level,
>> +          unsigned int pat_index,
>>             u32 flags,
>>             struct i915_vma_work *work,
>>             struct i915_vma_resource *vma_res)
>> @@ -507,7 +507,7 @@ int i915_vma_bind(struct i915_vma *vma,
>>           struct dma_fence *prev;
>>           work->vma_res = i915_vma_resource_get(vma->resource);
>> -        work->cache_level = cache_level;
>> +        work->pat_index = pat_index;
>>           work->flags = bind_flags;
>>           /*
>> @@ -537,7 +537,7 @@ int i915_vma_bind(struct i915_vma *vma,
>>               return ret;
>>           }
>> -        vma->ops->bind_vma(vma->vm, NULL, vma->resource, cache_level,
>> +        vma->ops->bind_vma(vma->vm, NULL, vma->resource, pat_index,
>>                      bind_flags);
>>       }
>> @@ -814,7 +814,7 @@ i915_vma_insert(struct i915_vma *vma, struct 
>> i915_gem_ww_ctx *ww,
>>       color = 0;
>>       if (i915_vm_has_cache_coloring(vma->vm))
>> -        color = vma->obj->cache_level;
>> +        color = vma->obj->pat_index;
>>       if (flags & PIN_OFFSET_FIXED) {
>>           u64 offset = flags & PIN_OFFSET_MASK;
>> @@ -1518,7 +1518,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct 
>> i915_gem_ww_ctx *ww,
>>       GEM_BUG_ON(!vma->pages);
>>       err = i915_vma_bind(vma,
>> -                vma->obj->cache_level,
>> +                vma->obj->pat_index,
>>                   flags, work, vma_res);
>>       vma_res = NULL;
>>       if (err)
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>> b/drivers/gpu/drm/i915/i915_vma.h
>> index ed5c9d682a1b..31a8f8aa5558 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -250,7 +250,7 @@ i915_vma_compare(struct i915_vma *vma,
>>   struct i915_vma_work *i915_vma_work(void);
>>   int i915_vma_bind(struct i915_vma *vma,
>> -          enum i915_cache_level cache_level,
>> +          unsigned int pat_index,
>>             u32 flags,
>>             struct i915_vma_work *work,
>>             struct i915_vma_resource *vma_res);
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>> b/drivers/gpu/drm/i915/i915_vma_types.h
>> index 77fda2244d16..64472b7f0e77 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -32,8 +32,6 @@
>>   #include "gem/i915_gem_object_types.h"
>> -enum i915_cache_level;
>> -
>>   /**
>>    * DOC: Global GTT views
>>    *
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c 
>> b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> index d91d0ade8abd..61da4ed9d521 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -57,7 +57,10 @@ static void trash_stolen(struct drm_i915_private 
>> *i915)
>>           u32 __iomem *s;
>>           int x;
>> -        ggtt->vm.insert_page(&ggtt->vm, dma, slot, I915_CACHE_NONE, 0);
>> +        ggtt->vm.insert_page(&ggtt->vm, dma, slot,
>> +                     i915_gem_get_pat_index(i915,
>> +                                I915_CACHE_NONE),
>> +                     0);
>>           s = io_mapping_map_atomic_wc(&ggtt->iomap, slot);
>>           for (x = 0; x < PAGE_SIZE / sizeof(u32); x++) {
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c 
>> b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> index 37068542aafe..f13a4d265814 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> @@ -245,7 +245,7 @@ static int igt_evict_for_cache_color(void *arg)
>>       struct drm_mm_node target = {
>>           .start = I915_GTT_PAGE_SIZE * 2,
>>           .size = I915_GTT_PAGE_SIZE,
>> -        .color = I915_CACHE_LLC,
>> +        .color = i915_gem_get_pat_index(gt->i915, I915_CACHE_LLC),
>>       };
>>       struct drm_i915_gem_object *obj;
>>       struct i915_vma *vma;
>> @@ -308,7 +308,7 @@ static int igt_evict_for_cache_color(void *arg)
>>       /* Attempt to remove the first *pinned* vma, by removing the 
>> (empty)
>>        * neighbour -- this should fail.
>>        */
>> -    target.color = I915_CACHE_L3_LLC;
>> +    target.color = i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LLC);
>>       mutex_lock(&ggtt->vm.mutex);
>>       err = i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c 
>> b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> index 154801f1c468..36940ef10108 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> @@ -135,7 +135,7 @@ fake_dma_object(struct drm_i915_private *i915, u64 
>> size)
>>       obj->write_domain = I915_GEM_DOMAIN_CPU;
>>       obj->read_domains = I915_GEM_DOMAIN_CPU;
>> -    obj->cache_level = I915_CACHE_NONE;
>> +    obj->pat_index = i915_gem_get_pat_index(i915, I915_CACHE_NONE);
>>       /* Preallocate the "backing storage" */
>>       if (i915_gem_object_pin_pages_unlocked(obj))
>> @@ -359,7 +359,9 @@ static int lowlevel_hole(struct i915_address_space 
>> *vm,
>>               with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
>>                 vm->insert_entries(vm, mock_vma_res,
>> -                           I915_CACHE_NONE, 0);
>> +                         i915_gem_get_pat_index(vm->i915,
>> +                                    I915_CACHE_NONE),
>> +                         0);
>>           }
>>           count = n;
>> @@ -1377,7 +1379,10 @@ static int igt_ggtt_page(void *arg)
>>           ggtt->vm.insert_page(&ggtt->vm,
>>                        i915_gem_object_get_dma_address(obj, 0),
>> -                     offset, I915_CACHE_NONE, 0);
>> +                     offset,
>> +                     i915_gem_get_pat_index(i915,
>> +                                I915_CACHE_NONE),
>> +                     0);
>>       }
>>       order = i915_random_order(count, &prng);
>> @@ -1510,7 +1515,7 @@ static int reserve_gtt_with_resource(struct 
>> i915_vma *vma, u64 offset)
>>       mutex_lock(&vm->mutex);
>>       err = i915_gem_gtt_reserve(vm, NULL, &vma->node, obj->base.size,
>>                      offset,
>> -                   obj->cache_level,
>> +                   obj->pat_index,
>>                      0);
>>       if (!err) {
>>           i915_vma_resource_init_from_vma(vma_res, vma);
>> @@ -1690,7 +1695,7 @@ static int insert_gtt_with_resource(struct 
>> i915_vma *vma)
>>       mutex_lock(&vm->mutex);
>>       err = i915_gem_gtt_insert(vm, NULL, &vma->node, obj->base.size, 0,
>> -                  obj->cache_level, 0, vm->total, 0);
>> +                  obj->pat_index, 0, vm->total, 0);
>>       if (!err) {
>>           i915_vma_resource_init_from_vma(vma_res, vma);
>>           vma->resource = vma_res;
>> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c 
>> b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> index 3b18e5905c86..d985d9bae2e8 100644
>> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> @@ -1070,7 +1070,9 @@ static int igt_lmem_write_cpu(void *arg)
>>       /* Put the pages into a known state -- from the gpu for added 
>> fun */
>>       intel_engine_pm_get(engine);
>>       err = intel_context_migrate_clear(engine->gt->migrate.context, 
>> NULL,
>> -                      obj->mm.pages->sgl, I915_CACHE_NONE,
>> +                      obj->mm.pages->sgl,
>> +                      i915_gem_get_pat_index(i915,
>> +                                 I915_CACHE_NONE),
>>                         true, 0xdeadbeaf, &rq);
>>       if (rq) {
>>           dma_resv_add_fence(obj->base.resv, &rq->fence,
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c 
>> b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> index ece97e4faacb..a516c0aa88fd 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> @@ -27,21 +27,21 @@
>>   static void mock_insert_page(struct i915_address_space *vm,
>>                    dma_addr_t addr,
>>                    u64 offset,
>> -                 enum i915_cache_level level,
>> +                 unsigned int pat_index,
>>                    u32 flags)
>>   {
>>   }
>>   static void mock_insert_entries(struct i915_address_space *vm,
>>                   struct i915_vma_resource *vma_res,
>> -                enum i915_cache_level level, u32 flags)
>> +                unsigned int pat_index, u32 flags)
>>   {
>>   }
>>   static void mock_bind_ppgtt(struct i915_address_space *vm,
>>                   struct i915_vm_pt_stash *stash,
>>                   struct i915_vma_resource *vma_res,
>> -                enum i915_cache_level cache_level,
>> +                unsigned int pat_index,
>>                   u32 flags)
>>   {
>>       GEM_BUG_ON(flags & I915_VMA_GLOBAL_BIND);
>> @@ -94,7 +94,7 @@ struct i915_ppgtt *mock_ppgtt(struct 
>> drm_i915_private *i915, const char *name)
>>   static void mock_bind_ggtt(struct i915_address_space *vm,
>>                  struct i915_vm_pt_stash *stash,
>>                  struct i915_vma_resource *vma_res,
>> -               enum i915_cache_level cache_level,
>> +               unsigned int pat_index,
>>                  u32 flags)
>>   {
>>   }
> 
