Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AC580F47
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 10:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA75113E59;
	Tue, 26 Jul 2022 08:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8F113E46;
 Tue, 26 Jul 2022 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658824828; x=1690360828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8Se3/Sarx61DDFpqhzHxPcWrSzfvq6c+IJuwFWUbWi0=;
 b=Fxcm1l2zuoH+BrwWRIUFJFZv/zpzx2/msHFdyyZeIxgmXYk4WtYXhg2d
 SVR0bme8PNg74n94S74sAo+X+t0HnIghp/jAvCPC0Opd2UYnypVbhVYTQ
 UMSvK93gX1jtlCYQrv/leo7n8W8HTYMhnY0fmIQcYWlujcDjFPKhNFu9q
 hz1cePB84wQ9GeqHWpyxKHbjYJMQhWaE1/yYx/G1tdO5tOiX4ofA+GtRL
 B2lc1rQe48qxbDCBbrtb2KJoVsVtw4u8IMEjEESIUEcKuX1vgZCbSyESk
 PhOtBPZiQnHQV6FvtGy0ElmOtphjzZLn4r0zU805aXV9SFTPmEnkEa2a6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="286655028"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="286655028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 01:40:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="927243716"
Received: from atilson-mobl2.ger.corp.intel.com (HELO [10.213.238.124])
 ([10.213.238.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 01:40:25 -0700
Message-ID: <ab307584-d97b-4fcf-7d4e-4d7de2d943fd@linux.intel.com>
Date: Tue, 26 Jul 2022 09:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <284014b2-ceff-f80e-d805-f3534776306f@linux.intel.com>
 <20220726050730.GH14039@nvishwa1-DESK>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220726050730.GH14039@nvishwa1-DESK>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/07/2022 06:07, Niranjana Vishwanathapura wrote:
> On Mon, Jul 18, 2022 at 11:55:41AM +0100, Tvrtko Ursulin wrote:
>>
>> On 01/07/2022 23:50, Niranjana Vishwanathapura wrote:
>>> Bind and unbind the mappings upon VM_BIND and VM_UNBIND calls.
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  10 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
>>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  38 +++
>>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 233 ++++++++++++++++++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   7 +
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>>>  drivers/gpu/drm/i915/i915_driver.c            |  11 +-
>>>  drivers/gpu/drm/i915/i915_vma.c               |   7 +-
>>>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>>>  drivers/gpu/drm/i915/i915_vma_types.h         |   8 +
>>>  11 files changed, 318 insertions(+), 10 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile 
>>> b/drivers/gpu/drm/i915/Makefile
>>> index 522ef9b4aff3..4e1627e96c6e 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -165,6 +165,7 @@ gem-y += \
>>>      gem/i915_gem_ttm_move.o \
>>>      gem/i915_gem_ttm_pm.o \
>>>      gem/i915_gem_userptr.o \
>>> +    gem/i915_gem_vm_bind_object.o \
>>>      gem/i915_gem_wait.o \
>>>      gem/i915_gemfs.o
>>>  i915-y += \
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> index 33673fe7ee0a..927a87e5ec59 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> @@ -15,10 +15,10 @@
>>>  #include "i915_trace.h"
>>>  #include "i915_user_extensions.h"
>>> -static u32 object_max_page_size(struct intel_memory_region 
>>> **placements,
>>> -                unsigned int n_placements)
>>> +u32 i915_gem_object_max_page_size(struct intel_memory_region 
>>> **placements,
>>> +                  unsigned int n_placements)
>>>  {
>>> -    u32 max_page_size = 0;
>>> +    u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>>>      int i;
>>>      for (i = 0; i < n_placements; i++) {
>>> @@ -28,7 +28,6 @@ static u32 object_max_page_size(struct 
>>> intel_memory_region **placements,
>>>          max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>>>      }
>>> -    GEM_BUG_ON(!max_page_size);
>>>      return max_page_size;
>>>  }
>>> @@ -99,7 +98,8 @@ __i915_gem_object_create_user_ext(struct 
>>> drm_i915_private *i915, u64 size,
>>>      i915_gem_flush_free_objects(i915);
>>> -    size = round_up(size, object_max_page_size(placements, 
>>> n_placements));
>>> +    size = round_up(size, i915_gem_object_max_page_size(placements,
>>> +                                n_placements));
>>>      if (size == 0)
>>>          return ERR_PTR(-EINVAL);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index 6f0a3ce35567..650de2224843 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>>>  }
>>>  void i915_gem_init__objects(struct drm_i915_private *i915);
>>> +u32 i915_gem_object_max_page_size(struct intel_memory_region 
>>> **placements,
>>> +                  unsigned int n_placements);
>>>  void i915_objects_module_exit(void);
>>>  int i915_objects_module_init(void);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>> new file mode 100644
>>> index 000000000000..642cdb559f17
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __I915_GEM_VM_BIND_H
>>> +#define __I915_GEM_VM_BIND_H
>>> +
>>> +#include "i915_drv.h"
>>> +
>>> +#define assert_vm_bind_held(vm)   
>>> lockdep_assert_held(&(vm)->vm_bind_lock)
>>> +
>>> +static inline void i915_gem_vm_bind_lock(struct i915_address_space *vm)
>>> +{
>>> +    mutex_lock(&vm->vm_bind_lock);
>>> +}
>>> +
>>> +static inline int
>>> +i915_gem_vm_bind_lock_interruptible(struct i915_address_space *vm)
>>> +{
>>> +    return mutex_lock_interruptible(&vm->vm_bind_lock);
>>> +}
>>> +
>>> +static inline void i915_gem_vm_bind_unlock(struct i915_address_space 
>>> *vm)
>>> +{
>>> +    mutex_unlock(&vm->vm_bind_lock);
>>> +}
>>> +
>>> +struct i915_vma *
>>> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>>> +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
>>> +int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>> +             struct drm_i915_gem_vm_bind *va,
>>> +             struct drm_file *file);
>>> +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>>> +               struct drm_i915_gem_vm_unbind *va);
>>> +
>>> +#endif /* __I915_GEM_VM_BIND_H */
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> new file mode 100644
>>> index 000000000000..43ceb4dcca6c
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> @@ -0,0 +1,233 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/interval_tree_generic.h>
>>> +
>>> +#include "gem/i915_gem_vm_bind.h"
>>> +#include "gt/gen8_engine_cs.h"
>>> +
>>> +#include "i915_drv.h"
>>> +#include "i915_gem_gtt.h"
>>> +
>>> +#define START(node) ((node)->start)
>>> +#define LAST(node) ((node)->last)
>>> +
>>> +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
>>> +             START, LAST, static inline, i915_vm_bind_it)
>>> +
>>> +#undef START
>>> +#undef LAST
>>> +
>>> +/**
>>> + * DOC: VM_BIND/UNBIND ioctls
>>> + *
>>> + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM 
>>> buffer
>>> + * objects (BOs) or sections of a BOs at specified GPU virtual 
>>> addresses on a
>>> + * specified address space (VM). Multiple mappings can map to the 
>>> same physical
>>> + * pages of an object (aliasing). These mappings (also referred to 
>>> as persistent
>>> + * mappings) will be persistent across multiple GPU submissions 
>>> (execbuf calls)
>>> + * issued by the UMD, without user having to provide a list of all 
>>> required
>>> + * mappings during each submission (as required by older execbuf mode).
>>> + *
>>> + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out 
>>> fence for
>>> + * signaling the completion of bind/unbind operation.
>>> + *
>>> + * VM_BIND feature is advertised to user via 
>>> I915_PARAM_VM_BIND_VERSION.
>>> + * User has to opt-in for VM_BIND mode of binding for an address 
>>> space (VM)
>>> + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND 
>>> extension.
>>> + *
>>> + * VM_BIND/UNBIND ioctl calls executed on different CPU threads 
>>> concurrently
>>> + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND 
>>> operations can be
>>> + * done asynchronously, when valid out fence is specified.
>>> + *
>>> + * VM_BIND locking order is as below.
>>> + *
>>> + * 1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock 
>>> is taken in
>>> + *    vm_bind/vm_unbind ioctl calls, in the execbuf path and while 
>>> releasing the
>>> + *    mapping.
>>> + *
>>> + *    In future, when GPU page faults are supported, we can 
>>> potentially use a
>>> + *    rwsem instead, so that multiple page fault handlers can take 
>>> the read
>>> + *    side lock to lookup the mapping and hence can run in parallel.
>>> + *    The older execbuf mode of binding do not need this lock.
>>> + *
>>> + * 2) Lock-B: The object's dma-resv lock will protect i915_vma state 
>>> and needs
>>> + *    to be held while binding/unbinding a vma in the async worker 
>>> and while
>>> + *    updating dma-resv fence list of an object. Note that private 
>>> BOs of a VM
>>> + *    will all share a dma-resv object.
>>> + *
>>> + *    The future system allocator support will use the HMM 
>>> prescribed locking
>>> + *    instead.
>>> + *
>>> + * 3) Lock-C: Spinlock/s to protect some of the VM's lists like the 
>>> list of
>>> + *    invalidated vmas (due to eviction and userptr invalidation) etc.
>>> + */
>>> +
>>> +struct i915_vma *
>>> +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va)
>>> +{
>>> +    struct i915_vma *vma, *temp;
>>> +
>>> +    assert_vm_bind_held(vm);
>>> +
>>> +    vma = i915_vm_bind_it_iter_first(&vm->va, va, va);
>>> +    /* Working around compiler error, remove later */
>>> +    if (vma)
>>> +        temp = i915_vm_bind_it_iter_next(vma, va + vma->size, -1);
>>> +    return vma;
>>> +}
>>> +
>>> +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>> +{
>>> +    assert_vm_bind_held(vma->vm);
>>> +
>>> +    if (!list_empty(&vma->vm_bind_link)) {
>>> +        list_del_init(&vma->vm_bind_link);
>>> +        i915_vm_bind_it_remove(vma, &vma->vm->va);
>>> +
>>> +        /* Release object */
>>> +        if (release_obj)
>>> +            i915_vma_put(vma);
>>> +    }
>>> +}
>>> +
>>> +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
>>> +               struct drm_i915_gem_vm_unbind *va)
>>> +{
>>> +    struct drm_i915_gem_object *obj;
>>> +    struct i915_vma *vma;
>>> +    int ret;
>>> +
>>> +    va->start = gen8_noncanonical_addr(va->start);
>>> +    ret = i915_gem_vm_bind_lock_interruptible(vm);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>>> +    if (!vma) {
>>> +        ret = -ENOENT;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    if (vma->size != va->length)
>>> +        ret = -EINVAL;
>>> +    else
>>> +        i915_gem_vm_bind_remove(vma, false);
>>> +
>>> +out_unlock:
>>> +    i915_gem_vm_bind_unlock(vm);
>>> +    if (ret || !vma)
>>> +        return ret;
>>> +
>>> +    /* Destroy vma and then release object */
>>> +    obj = vma->obj;
>>> +    ret = i915_gem_object_lock(obj, NULL);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    i915_vma_destroy(vma);
>>> +    i915_gem_object_unlock(obj);
>>> +    i915_gem_object_put(obj);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
>>> +                    struct drm_i915_gem_object *obj,
>>> +                    struct drm_i915_gem_vm_bind *va)
>>> +{
>>> +    struct i915_ggtt_view view;
>>> +    struct i915_vma *vma;
>>> +
>>> +    va->start = gen8_noncanonical_addr(va->start);
>>> +    vma = i915_gem_vm_bind_lookup_vma(vm, va->start);
>>> +    if (vma)
>>> +        return ERR_PTR(-EEXIST);
>>> +
>>> +    view.type = I915_GGTT_VIEW_PARTIAL;
>>
>> One pre-requisite, which was known for "years", was to refactor the 
>> GGTT view code into a generic concept. (GGTT has no place in VM BIND 
>> code.) It may be just a question of renaming things, or it may end up 
>> a bit more, but in any case please do include that refactor in this 
>> series.
>>
> 
> Thanks Tvrtko,
> Yah, as mentioned in the other thread, my plan is to rename ggtt_view
> to gtt_view. But it requires changes in lot of places and it probably

I did not spot the other thread - link or msg-id?

> not going to look good in this patch series. So, my take is to do it
> after this patch seires lands.

Well..

Message-ID: <aaca5d74-6e25-d2a2-1c81-db48a8e805e7@linux.intel.com>
Date: Tue, 26 Jan 2021 17:34:15 +0000

"""
...But there would be plenty of more renaming to do, plenty
more view related things are left with "ggtt" in their names.
"""

So I was wrong, it wasn't years, only year and half. ;)

Lets not always continue the suboptimal patterns of merging under 
pressure and fixing up later, so please lets do it properly and refactor 
at the beginning of the series. I don't see why it would not look good. 
It's how things are always done and for me what doesn't look good is to 
have ggtt objects in ppgtt.

Regards,

Tvrtko
