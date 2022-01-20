Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D613E4950B2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E57110E5FC;
	Thu, 20 Jan 2022 14:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0610E5EA;
 Thu, 20 Jan 2022 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642690763; x=1674226763;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3C3flTusxI0ekSALzWT3mZ+HYq2vl/gTdOewovo4UD4=;
 b=geSBB6oNndiwLUzUZnaSwVZKWwz96Etiimgmm7HnJKqCE1ADzd7Z+vWW
 mjHbrS7P4u1wKwaqO1gVL7jI4cpBckA+Y85fikIUmMPzSmIsip1CsGIEN
 AeREqX6ICJEojr6uQxNDGH0U4mcMPfeUvzwlFWBqinntF6pgZrqUkUxv4
 kDYvArtSllCKRXI+yhYUVoxmzgXgWWHxQzwJF6guEF535BwttaV1O12c1
 fWdBIPsP7+k8bKfqFjFSMPwTpVt3HfvjsIqiOBg66LL1+awEtQYK/WZBV
 H/QlOdhOMAVJZwE4lqkVn4BIGYC6JCCZ27XKQdVCiW8CNbAkeFpfwuXAF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331719478"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="331719478"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 06:59:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="595766333"
Received: from kdevey-mobl2.ger.corp.intel.com (HELO [10.252.29.97])
 ([10.252.29.97])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 06:59:18 -0800
Message-ID: <5dbffe0e-7291-6af7-0bd1-bbfcdf7ef5bf@intel.com>
Date: Thu, 20 Jan 2022 14:59:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/4] drm/i915: enforce min GTT alignment for discrete
 cards
Content-Language: en-GB
To: Robert Beckett <bob.beckett@collabora.com>,
 Ramalingam C <ramalingam.c@intel.com>
References: <20220118175036.3840934-1-bob.beckett@collabora.com>
 <20220118175036.3840934-2-bob.beckett@collabora.com>
 <20220120114626.GA8264@intel.com>
 <a8cce1c4-88da-e597-e54c-8c34b685d1eb@collabora.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a8cce1c4-88da-e597-e54c-8c34b685d1eb@collabora.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2022 13:15, Robert Beckett wrote:
> 
> 
> On 20/01/2022 11:46, Ramalingam C wrote:
>> On 2022-01-18 at 17:50:34 +0000, Robert Beckett wrote:
>>> From: Matthew Auld <matthew.auld@intel.com>
>>>
>>> For local-memory objects we need to align the GTT addresses
>>> to 64K, both for the ppgtt and ggtt.
>>>
>>> We need to support vm->min_alignment > 4K, depending
>>> on the vm itself and the type of object we are inserting.
>>> With this in mind update the GTT selftests to take this
>>> into account.
>>>
>>> For DG2 we further align and pad lmem object GTT addresses
>>> to 2MB to ensure PDEs contain consistent page sizes as
>>> required by the HW.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   .../i915/gem/selftests/i915_gem_client_blt.c  | 23 +++--
>>>   drivers/gpu/drm/i915/gt/intel_gtt.c           | 14 +++
>>>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  9 ++
>>>   drivers/gpu/drm/i915/i915_vma.c               | 14 +++
>>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 96 ++++++++++++-------
>>>   5 files changed, 115 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c 
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> index c08f766e6e15..7fee95a65414 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
>>> @@ -39,6 +39,7 @@ struct tiled_blits {
>>>       struct blit_buffer scratch;
>>>       struct i915_vma *batch;
>>>       u64 hole;
>>> +    u64 align;
>>>       u32 width;
>>>       u32 height;
>>>   };
>>> @@ -410,14 +411,21 @@ tiled_blits_create(struct intel_engine_cs 
>>> *engine, struct rnd_state *prng)
>>>           goto err_free;
>>>       }
>>> -    hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
>>> +    t->align = I915_GTT_PAGE_SIZE_2M; /* XXX worst case, derive from 
>>> vm! */
>>> +    t->align = max(t->align,
>>> +               i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_LOCAL));
>>> +    t->align = max(t->align,
>>> +               i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_SYSTEM));
>>> +
>>> +    hole_size = 2 * round_up(WIDTH * HEIGHT * 4, t->align);
>>>       hole_size *= 2; /* room to maneuver */
>>> -    hole_size += 2 * I915_GTT_MIN_ALIGNMENT;
>>> +    hole_size += 2 * t->align; /* padding on either side */
>>>       mutex_lock(&t->ce->vm->mutex);
>>>       memset(&hole, 0, sizeof(hole));
>>>       err = drm_mm_insert_node_in_range(&t->ce->vm->mm, &hole,
>>> -                      hole_size, 0, I915_COLOR_UNEVICTABLE,
>>> +                      hole_size, t->align,
>>> +                      I915_COLOR_UNEVICTABLE,
>>>                         0, U64_MAX,
>>>                         DRM_MM_INSERT_BEST);
>>>       if (!err)
>>> @@ -428,7 +436,7 @@ tiled_blits_create(struct intel_engine_cs 
>>> *engine, struct rnd_state *prng)
>>>           goto err_put;
>>>       }
>>> -    t->hole = hole.start + I915_GTT_MIN_ALIGNMENT;
>>> +    t->hole = hole.start + t->align;
>>>       pr_info("Using hole at %llx\n", t->hole);
>>>       err = tiled_blits_create_buffers(t, WIDTH, HEIGHT, prng);
>>> @@ -455,7 +463,7 @@ static void tiled_blits_destroy(struct 
>>> tiled_blits *t)
>>>   static int tiled_blits_prepare(struct tiled_blits *t,
>>>                      struct rnd_state *prng)
>>>   {
>>> -    u64 offset = PAGE_ALIGN(t->width * t->height * 4);
>>> +    u64 offset = round_up(t->width * t->height * 4, t->align);
>>>       u32 *map;
>>>       int err;
>>>       int i;
>>> @@ -486,8 +494,7 @@ static int tiled_blits_prepare(struct tiled_blits 
>>> *t,
>>>   static int tiled_blits_bounce(struct tiled_blits *t, struct 
>>> rnd_state *prng)
>>>   {
>>> -    u64 offset =
>>> -        round_up(t->width * t->height * 4, 2 * I915_GTT_MIN_ALIGNMENT);
>>> +    u64 offset = round_up(t->width * t->height * 4, 2 * t->align);
>>>       int err;
>>>       /* We want to check position invariant tiling across GTT 
>>> eviction */
>>> @@ -500,7 +507,7 @@ static int tiled_blits_bounce(struct tiled_blits 
>>> *t, struct rnd_state *prng)
>>>       /* Reposition so that we overlap the old addresses, and 
>>> slightly off */
>>>       err = tiled_blit(t,
>>> -             &t->buffers[2], t->hole + I915_GTT_MIN_ALIGNMENT,
>>> +             &t->buffers[2], t->hole + t->align,
>>>                &t->buffers[1], t->hole + 3 * offset / 2);
>>>       if (err)
>>>           return err;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> index 46be4197b93f..7c92b25c0f26 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> @@ -223,6 +223,20 @@ void i915_address_space_init(struct 
>>> i915_address_space *vm, int subclass)
>>>       GEM_BUG_ON(!vm->total);
>>>       drm_mm_init(&vm->mm, 0, vm->total);
>>> +
>>> +    memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
>>> +         ARRAY_SIZE(vm->min_alignment));
>>> +
>>> +    if (HAS_64K_PAGES(vm->i915)) {
>>> +        if (IS_DG2(vm->i915)) {
>> I think we need this 2M alignment for all platform with HAS_64K_PAGES.
>> Not only for DG2.
> 
> really? can we get confirmation of this?
> this contradicts the documentation in patch 4, which you reviewed, so I 
> am confused now

Starting from DG2, some platforms will have this new 64K GTT page size 
restriction when dealing with LMEM. The HAS_64K_PAGES() macro is meant 
to cover exactly that, AFAIK.

> 
>>> +            vm->min_alignment[INTEL_MEMORY_LOCAL] = 
>>> I915_GTT_PAGE_SIZE_2M;
>>> +            vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = 
>>> I915_GTT_PAGE_SIZE_2M;
>>> +        } else {
>>> +            vm->min_alignment[INTEL_MEMORY_LOCAL] = 
>>> I915_GTT_PAGE_SIZE_64K;
>>> +            vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = 
>>> I915_GTT_PAGE_SIZE_64K;
>>> +        }
>>> +    }
>>> +
>>>       vm->mm.head_node.color = I915_COLOR_UNEVICTABLE;
>>>       INIT_LIST_HEAD(&vm->bound_list);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> index 8073438b67c8..b8da2514d601 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> @@ -29,6 +29,8 @@
>>>   #include "i915_selftest.h"
>>>   #include "i915_vma_resource.h"
>>>   #include "i915_vma_types.h"
>>> +#include "i915_params.h"
>>> +#include "intel_memory_region.h"
>>>   #define I915_GFP_ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | 
>>> __GFP_NOWARN)
>>> @@ -223,6 +225,7 @@ struct i915_address_space {
>>>       struct device *dma;
>>>       u64 total;        /* size addr space maps (ex. 2GB for ggtt) */
>>>       u64 reserved;        /* size addr space reserved */
>>> +    u64 min_alignment[INTEL_MEMORY_STOLEN_LOCAL + 1];
>>>       unsigned int bind_async_flags;
>>> @@ -384,6 +387,12 @@ i915_vm_has_scratch_64K(struct 
>>> i915_address_space *vm)
>>>       return vm->scratch_order == get_order(I915_GTT_PAGE_SIZE_64K);
>>>   }
>>> +static inline u64 i915_vm_min_alignment(struct i915_address_space *vm,
>>> +                    enum intel_memory_type type)
>>> +{
>>> +    return vm->min_alignment[type];
>>> +}
>>> +
>>>   static inline bool
>>>   i915_vm_has_cache_coloring(struct i915_address_space *vm)
>>>   {
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>> b/drivers/gpu/drm/i915/i915_vma.c
>>> index 1f15c3298112..9ac92e7a3566 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -756,6 +756,20 @@ i915_vma_insert(struct i915_vma *vma, u64 size, 
>>> u64 alignment, u64 flags)
>>>       }
>>>       color = 0;
>>> +
>>> +    if (HAS_64K_PAGES(vma->vm->i915) && 
>>> i915_gem_object_is_lmem(vma->obj)) {
>>> +        alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
>>> +        /*
>>> +         * DG2 can not have different sized pages in any given PDE 
>>> (2MB range).
>>> +         * Keeping things simple, we force any lmem object to reserve
>>> +         * 2MB chunks, preventing any smaller pages being used 
>>> alongside
>>> +         */
>>> +        if (IS_DG2(vma->vm->i915)) {
>> Similarly here we dont need special case for DG2.
>>
>> Ram
>>> +            alignment = max(alignment, I915_GTT_PAGE_SIZE_2M);
>>> +            size = round_up(size, I915_GTT_PAGE_SIZE_2M);
>>> +        }
>>> +    }
>>> +
>>>       if (i915_vm_has_cache_coloring(vma->vm))
>>>           color = vma->obj->cache_level;
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c 
>>> b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> index 076d860ce01a..2f3f0c01786b 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>>> @@ -238,6 +238,8 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>                u64 hole_start, u64 hole_end,
>>>                unsigned long end_time)
>>>   {
>>> +    const unsigned int min_alignment =
>>> +        i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>>       I915_RND_STATE(seed_prng);
>>>       struct i915_vma_resource *mock_vma_res;
>>>       unsigned int size;
>>> @@ -251,9 +253,10 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>           I915_RND_SUBSTATE(prng, seed_prng);
>>>           struct drm_i915_gem_object *obj;
>>>           unsigned int *order, count, n;
>>> -        u64 hole_size;
>>> +        u64 hole_size, aligned_size;
>>> -        hole_size = (hole_end - hole_start) >> size;
>>> +        aligned_size = max_t(u32, ilog2(min_alignment), size);
>>> +        hole_size = (hole_end - hole_start) >> aligned_size;
>>>           if (hole_size > KMALLOC_MAX_SIZE / sizeof(u32))
>>>               hole_size = KMALLOC_MAX_SIZE / sizeof(u32);
>>>           count = hole_size >> 1;
>>> @@ -274,8 +277,8 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>           }
>>>           GEM_BUG_ON(!order);
>>> -        GEM_BUG_ON(count * BIT_ULL(size) > vm->total);
>>> -        GEM_BUG_ON(hole_start + count * BIT_ULL(size) > hole_end);
>>> +        GEM_BUG_ON(count * BIT_ULL(aligned_size) > vm->total);
>>> +        GEM_BUG_ON(hole_start + count * BIT_ULL(aligned_size) > 
>>> hole_end);
>>>           /* Ignore allocation failures (i.e. don't report them as
>>>            * a test failure) as we are purposefully allocating very
>>> @@ -298,10 +301,10 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>           }
>>>           for (n = 0; n < count; n++) {
>>> -            u64 addr = hole_start + order[n] * BIT_ULL(size);
>>> +            u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
>>>               intel_wakeref_t wakeref;
>>> -            GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
>>> +            GEM_BUG_ON(addr + BIT_ULL(aligned_size) > vm->total);
>>>               if (igt_timeout(end_time,
>>>                       "%s timed out before %d/%d\n",
>>> @@ -344,7 +347,7 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>               }
>>>               mock_vma_res->bi.pages = obj->mm.pages;
>>> -            mock_vma_res->node_size = BIT_ULL(size);
>>> +            mock_vma_res->node_size = BIT_ULL(aligned_size);
>>>               mock_vma_res->start = addr;
>>>               with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
>>> @@ -355,7 +358,7 @@ static int lowlevel_hole(struct 
>>> i915_address_space *vm,
>>>           i915_random_reorder(order, count, &prng);
>>>           for (n = 0; n < count; n++) {
>>> -            u64 addr = hole_start + order[n] * BIT_ULL(size);
>>> +            u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
>>>               intel_wakeref_t wakeref;
>>>               GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
>>> @@ -399,8 +402,10 @@ static int fill_hole(struct i915_address_space *vm,
>>>   {
>>>       const u64 hole_size = hole_end - hole_start;
>>>       struct drm_i915_gem_object *obj;
>>> +    const unsigned int min_alignment =
>>> +        i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>>       const unsigned long max_pages =
>>> -        min_t(u64, ULONG_MAX - 1, hole_size/2 >> PAGE_SHIFT);
>>> +        min_t(u64, ULONG_MAX - 1, (hole_size / 2) >> 
>>> ilog2(min_alignment));
>>>       const unsigned long max_step = max(int_sqrt(max_pages), 2UL);
>>>       unsigned long npages, prime, flags;
>>>       struct i915_vma *vma;
>>> @@ -441,14 +446,17 @@ static int fill_hole(struct i915_address_space 
>>> *vm,
>>>                   offset = p->offset;
>>>                   list_for_each_entry(obj, &objects, st_link) {
>>> +                    u64 aligned_size = round_up(obj->base.size,
>>> +                                    min_alignment);
>>> +
>>>                       vma = i915_vma_instance(obj, vm, NULL);
>>>                       if (IS_ERR(vma))
>>>                           continue;
>>>                       if (p->step < 0) {
>>> -                        if (offset < hole_start + obj->base.size)
>>> +                        if (offset < hole_start + aligned_size)
>>>                               break;
>>> -                        offset -= obj->base.size;
>>> +                        offset -= aligned_size;
>>>                       }
>>>                       err = i915_vma_pin(vma, 0, 0, offset | flags);
>>> @@ -470,22 +478,25 @@ static int fill_hole(struct i915_address_space 
>>> *vm,
>>>                       i915_vma_unpin(vma);
>>>                       if (p->step > 0) {
>>> -                        if (offset + obj->base.size > hole_end)
>>> +                        if (offset + aligned_size > hole_end)
>>>                               break;
>>> -                        offset += obj->base.size;
>>> +                        offset += aligned_size;
>>>                       }
>>>                   }
>>>                   offset = p->offset;
>>>                   list_for_each_entry(obj, &objects, st_link) {
>>> +                    u64 aligned_size = round_up(obj->base.size,
>>> +                                    min_alignment);
>>> +
>>>                       vma = i915_vma_instance(obj, vm, NULL);
>>>                       if (IS_ERR(vma))
>>>                           continue;
>>>                       if (p->step < 0) {
>>> -                        if (offset < hole_start + obj->base.size)
>>> +                        if (offset < hole_start + aligned_size)
>>>                               break;
>>> -                        offset -= obj->base.size;
>>> +                        offset -= aligned_size;
>>>                       }
>>>                       if (!drm_mm_node_allocated(&vma->node) ||
>>> @@ -506,22 +517,25 @@ static int fill_hole(struct i915_address_space 
>>> *vm,
>>>                       }
>>>                       if (p->step > 0) {
>>> -                        if (offset + obj->base.size > hole_end)
>>> +                        if (offset + aligned_size > hole_end)
>>>                               break;
>>> -                        offset += obj->base.size;
>>> +                        offset += aligned_size;
>>>                       }
>>>                   }
>>>                   offset = p->offset;
>>>                   list_for_each_entry_reverse(obj, &objects, st_link) {
>>> +                    u64 aligned_size = round_up(obj->base.size,
>>> +                                    min_alignment);
>>> +
>>>                       vma = i915_vma_instance(obj, vm, NULL);
>>>                       if (IS_ERR(vma))
>>>                           continue;
>>>                       if (p->step < 0) {
>>> -                        if (offset < hole_start + obj->base.size)
>>> +                        if (offset < hole_start + aligned_size)
>>>                               break;
>>> -                        offset -= obj->base.size;
>>> +                        offset -= aligned_size;
>>>                       }
>>>                       err = i915_vma_pin(vma, 0, 0, offset | flags);
>>> @@ -543,22 +557,25 @@ static int fill_hole(struct i915_address_space 
>>> *vm,
>>>                       i915_vma_unpin(vma);
>>>                       if (p->step > 0) {
>>> -                        if (offset + obj->base.size > hole_end)
>>> +                        if (offset + aligned_size > hole_end)
>>>                               break;
>>> -                        offset += obj->base.size;
>>> +                        offset += aligned_size;
>>>                       }
>>>                   }
>>>                   offset = p->offset;
>>>                   list_for_each_entry_reverse(obj, &objects, st_link) {
>>> +                    u64 aligned_size = round_up(obj->base.size,
>>> +                                    min_alignment);
>>> +
>>>                       vma = i915_vma_instance(obj, vm, NULL);
>>>                       if (IS_ERR(vma))
>>>                           continue;
>>>                       if (p->step < 0) {
>>> -                        if (offset < hole_start + obj->base.size)
>>> +                        if (offset < hole_start + aligned_size)
>>>                               break;
>>> -                        offset -= obj->base.size;
>>> +                        offset -= aligned_size;
>>>                       }
>>>                       if (!drm_mm_node_allocated(&vma->node) ||
>>> @@ -579,9 +596,9 @@ static int fill_hole(struct i915_address_space *vm,
>>>                       }
>>>                       if (p->step > 0) {
>>> -                        if (offset + obj->base.size > hole_end)
>>> +                        if (offset + aligned_size > hole_end)
>>>                               break;
>>> -                        offset += obj->base.size;
>>> +                        offset += aligned_size;
>>>                       }
>>>                   }
>>>               }
>>> @@ -611,6 +628,7 @@ static int walk_hole(struct i915_address_space *vm,
>>>       const u64 hole_size = hole_end - hole_start;
>>>       const unsigned long max_pages =
>>>           min_t(u64, ULONG_MAX - 1, hole_size >> PAGE_SHIFT);
>>> +    unsigned long min_alignment;
>>>       unsigned long flags;
>>>       u64 size;
>>> @@ -620,6 +638,8 @@ static int walk_hole(struct i915_address_space *vm,
>>>       if (i915_is_ggtt(vm))
>>>           flags |= PIN_GLOBAL;
>>> +    min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>> +
>>>       for_each_prime_number_from(size, 1, max_pages) {
>>>           struct drm_i915_gem_object *obj;
>>>           struct i915_vma *vma;
>>> @@ -638,7 +658,7 @@ static int walk_hole(struct i915_address_space *vm,
>>>           for (addr = hole_start;
>>>                addr + obj->base.size < hole_end;
>>> -             addr += obj->base.size) {
>>> +             addr += round_up(obj->base.size, min_alignment)) {
>>>               err = i915_vma_pin(vma, 0, 0, addr | flags);
>>>               if (err) {
>>>                   pr_err("%s bind failed at %llx + %llx [hole %llx- 
>>> %llx] with err=%d\n",
>>> @@ -690,6 +710,7 @@ static int pot_hole(struct i915_address_space *vm,
>>>   {
>>>       struct drm_i915_gem_object *obj;
>>>       struct i915_vma *vma;
>>> +    unsigned int min_alignment;
>>>       unsigned long flags;
>>>       unsigned int pot;
>>>       int err = 0;
>>> @@ -698,6 +719,8 @@ static int pot_hole(struct i915_address_space *vm,
>>>       if (i915_is_ggtt(vm))
>>>           flags |= PIN_GLOBAL;
>>> +    min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>> +
>>>       obj = i915_gem_object_create_internal(vm->i915, 2 * 
>>> I915_GTT_PAGE_SIZE);
>>>       if (IS_ERR(obj))
>>>           return PTR_ERR(obj);
>>> @@ -710,13 +733,13 @@ static int pot_hole(struct i915_address_space *vm,
>>>       /* Insert a pair of pages across every pot boundary within the 
>>> hole */
>>>       for (pot = fls64(hole_end - 1) - 1;
>>> -         pot > ilog2(2 * I915_GTT_PAGE_SIZE);
>>> +         pot > ilog2(2 * min_alignment);
>>>            pot--) {
>>>           u64 step = BIT_ULL(pot);
>>>           u64 addr;
>>> -        for (addr = round_up(hole_start + I915_GTT_PAGE_SIZE, step) 
>>> - I915_GTT_PAGE_SIZE;
>>> -             addr <= round_down(hole_end - 2*I915_GTT_PAGE_SIZE, 
>>> step) - I915_GTT_PAGE_SIZE;
>>> +        for (addr = round_up(hole_start + min_alignment, step) - 
>>> min_alignment;
>>> +             addr <= round_down(hole_end - (2 * min_alignment), 
>>> step) - min_alignment;
>>>                addr += step) {
>>>               err = i915_vma_pin(vma, 0, 0, addr | flags);
>>>               if (err) {
>>> @@ -761,6 +784,7 @@ static int drunk_hole(struct i915_address_space *vm,
>>>                 unsigned long end_time)
>>>   {
>>>       I915_RND_STATE(prng);
>>> +    unsigned int min_alignment;
>>>       unsigned int size;
>>>       unsigned long flags;
>>> @@ -768,15 +792,18 @@ static int drunk_hole(struct i915_address_space 
>>> *vm,
>>>       if (i915_is_ggtt(vm))
>>>           flags |= PIN_GLOBAL;
>>> +    min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>> +
>>>       /* Keep creating larger objects until one cannot fit into the 
>>> hole */
>>>       for (size = 12; (hole_end - hole_start) >> size; size++) {
>>>           struct drm_i915_gem_object *obj;
>>>           unsigned int *order, count, n;
>>>           struct i915_vma *vma;
>>> -        u64 hole_size;
>>> +        u64 hole_size, aligned_size;
>>>           int err = -ENODEV;
>>> -        hole_size = (hole_end - hole_start) >> size;
>>> +        aligned_size = max_t(u32, ilog2(min_alignment), size);
>>> +        hole_size = (hole_end - hole_start) >> aligned_size;
>>>           if (hole_size > KMALLOC_MAX_SIZE / sizeof(u32))
>>>               hole_size = KMALLOC_MAX_SIZE / sizeof(u32);
>>>           count = hole_size >> 1;
>>> @@ -816,7 +843,7 @@ static int drunk_hole(struct i915_address_space *vm,
>>>           GEM_BUG_ON(vma->size != BIT_ULL(size));
>>>           for (n = 0; n < count; n++) {
>>> -            u64 addr = hole_start + order[n] * BIT_ULL(size);
>>> +            u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
>>>               err = i915_vma_pin(vma, 0, 0, addr | flags);
>>>               if (err) {
>>> @@ -868,11 +895,14 @@ static int __shrink_hole(struct 
>>> i915_address_space *vm,
>>>   {
>>>       struct drm_i915_gem_object *obj;
>>>       unsigned long flags = PIN_OFFSET_FIXED | PIN_USER;
>>> +    unsigned int min_alignment;
>>>       unsigned int order = 12;
>>>       LIST_HEAD(objects);
>>>       int err = 0;
>>>       u64 addr;
>>> +    min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
>>> +
>>>       /* Keep creating larger objects until one cannot fit into the 
>>> hole */
>>>       for (addr = hole_start; addr < hole_end; ) {
>>>           struct i915_vma *vma;
>>> @@ -913,7 +943,7 @@ static int __shrink_hole(struct 
>>> i915_address_space *vm,
>>>           }
>>>           i915_vma_unpin(vma);
>>> -        addr += size;
>>> +        addr += round_up(size, min_alignment);
>>>           /*
>>>            * Since we are injecting allocation faults at random 
>>> intervals,
>>> -- 
>>> 2.25.1
>>>
