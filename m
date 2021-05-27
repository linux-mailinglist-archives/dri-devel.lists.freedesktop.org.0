Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AD392C61
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1A6E067;
	Thu, 27 May 2021 11:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCEF6E067;
 Thu, 27 May 2021 11:11:49 +0000 (UTC)
IronPort-SDR: kRpaS6XGw6eSr6sbHOvpq1xKoUNQQL58Z3CYu8e7cz8xq/HAOritiCqEZOx+SXcFe1bFfmOYaa
 S/S5dbapoeqA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183043324"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183043324"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:11:49 -0700
IronPort-SDR: 0tuc535lpn4iDHHJvCyoSQkWL8S/hAAtPFBURXVeVYEKdpXvMb0nL3Nu/qUJGnfQZAw1BwtDW4
 AaVbFzoVHSFg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="443517424"
Received: from vsorokin-mobl.ccr.corp.intel.com (HELO [10.249.39.216])
 ([10.249.39.216])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:11:47 -0700
Subject: Re: [PATCH v4 15/15] drm/i915: Use ttm mmap handling for ttm bo's.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-16-thomas.hellstrom@linux.intel.com>
 <75e1d09a-95f6-6de0-7fee-4a11cf383ce5@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <494db352-0faa-bcdb-eff1-b714f63b664d@linux.intel.com>
Date: Thu, 27 May 2021 13:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <75e1d09a-95f6-6de0-7fee-4a11cf383ce5@linux.intel.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 2021-05-26 om 19:40 schreef Thomas Hellström:
>
> On 5/26/21 1:32 PM, Thomas Hellström wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> Use the ttm handlers for servicing page faults, and vm_access.
>>
>> We do our own validation of read-only access, otherwise use the
>> ttm handlers as much as possible.
>>
>> Because the ttm handlers expect the vma_node at vma->base, we slightly
>> need to massage the mmap handlers to look at vma_node->driver_private
>> to fetch the bo, if it's NULL, we assume i915's normal mmap_offset uapi
>> is used.
>>
>> This is the easiest way to achieve compatibility without changing ttm's
>> semantics.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  78 +++++++----
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 +-
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   3 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 122 +++++++++++++++++-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  90 +++++++------
>>   drivers/gpu/drm/i915/selftests/igt_mmap.c     |  25 +++-
>>   drivers/gpu/drm/i915/selftests/igt_mmap.h     |  12 +-
>>   8 files changed, 247 insertions(+), 92 deletions(-)
>
> There are a couple of checkpatch.pl --strict warnings/checks with this patch.
>
>
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index fd1c9714f8d8..af04ea593091 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -19,6 +19,7 @@
>>   #include "i915_gem_mman.h"
>>   #include "i915_trace.h"
>>   #include "i915_user_extensions.h"
>> +#include "i915_gem_ttm.h"
>>   #include "i915_vma.h"
>>     static inline bool
>> @@ -622,6 +623,8 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>       struct i915_mmap_offset *mmo;
>>       int err;
>>   +    GEM_BUG_ON(obj->ops->mmap_offset || obj->ops->mmap_ops);
>> +
>>       mmo = lookup_mmo(obj, mmap_type);
>>       if (mmo)
>>           goto out;
>> @@ -664,40 +667,47 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>   }
>>     static int
>> -__assign_mmap_offset(struct drm_file *file,
>> -             u32 handle,
>> +__assign_mmap_offset(struct drm_i915_gem_object *obj,
>>                enum i915_mmap_type mmap_type,
>> -             u64 *offset)
>> +             u64 *offset, struct drm_file *file)
>>   {
>> -    struct drm_i915_gem_object *obj;
>>       struct i915_mmap_offset *mmo;
>> -    int err;
>>   -    obj = i915_gem_object_lookup(file, handle);
>> -    if (!obj)
>> -        return -ENOENT;
>> +    if (i915_gem_object_never_mmap(obj))
>> +        return -ENODEV;
>>   -    if (i915_gem_object_never_mmap(obj)) {
>> -        err = -ENODEV;
>> -        goto out;
>> +    if (obj->ops->mmap_offset)  {
>> +        *offset = obj->ops->mmap_offset(obj);
>> +        return 0;
>>       }
>>         if (mmap_type != I915_MMAP_TYPE_GTT &&
>>           !i915_gem_object_has_struct_page(obj) &&
>> -        !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM)) {
>> -        err = -ENODEV;
>> -        goto out;
>> -    }
>> +        !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
>> +        return -ENODEV;
>>         mmo = mmap_offset_attach(obj, mmap_type, file);
>> -    if (IS_ERR(mmo)) {
>> -        err = PTR_ERR(mmo);
>> -        goto out;
>> -    }
>> +    if (IS_ERR(mmo))
>> +        return PTR_ERR(mmo);
>>         *offset = drm_vma_node_offset_addr(&mmo->vma_node);
>> -    err = 0;
>> -out:
>> +    return 0;
>> +}
>> +
>> +static int
>> +__assign_mmap_offset_handle(struct drm_file *file,
>> +                u32 handle,
>> +                enum i915_mmap_type mmap_type,
>> +                u64 *offset)
>> +{
>> +    struct drm_i915_gem_object *obj;
>> +    int err;
>> +
>> +    obj = i915_gem_object_lookup(file, handle);
>> +    if (!obj)
>> +        return -ENOENT;
>> +
>> +    err = __assign_mmap_offset(obj, mmap_type, offset, file);
>>       i915_gem_object_put(obj);
>>       return err;
>>   }
>> @@ -717,7 +727,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>>       else
>>           mmap_type = I915_MMAP_TYPE_GTT;
>>   -    return __assign_mmap_offset(file, handle, mmap_type, offset);
>> +    return __assign_mmap_offset_handle(file, handle, mmap_type, offset);
>>   }
>>     /**
>> @@ -785,7 +795,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>           return -EINVAL;
>>       }
>>   -    return __assign_mmap_offset(file, args->handle, type, &args->offset);
>> +    return __assign_mmap_offset_handle(file, args->handle, type, &args->offset);
>>   }
>>     static void vm_open(struct vm_area_struct *vma)
>> @@ -889,8 +899,16 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>>            * destroyed and will be invalid when the vma manager lock
>>            * is released.
>>            */
>> -        mmo = container_of(node, struct i915_mmap_offset, vma_node);
>> -        obj = i915_gem_object_get_rcu(mmo->obj);
>> +        if (!node->driver_private) {
>> +            mmo = container_of(node, struct i915_mmap_offset, vma_node);
>> +            obj = i915_gem_object_get_rcu(mmo->obj);
>> +
>> +            GEM_BUG_ON(obj && obj->ops->mmap_ops);
>> +        } else {
>> +            obj = i915_gem_object_get_rcu(container_of(node, struct drm_i915_gem_object, base.vma_node));
>> +
>> +            GEM_BUG_ON(obj && !obj->ops->mmap_ops);
>> +        }
>>       }
>>       drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
>>       rcu_read_unlock();
>> @@ -912,7 +930,6 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>>       }
>>         vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>> -    vma->vm_private_data = mmo;
>>         /*
>>        * We keep the ref on mmo->obj, not vm_file, but we require
>> @@ -926,6 +943,15 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>>       /* Drop the initial creation reference, the vma is now holding one. */
>>       fput(anon);
>>   +    if (obj->ops->mmap_ops) {
>> +        vma->vm_page_prot = pgprot_decrypted(vm_get_page_prot(vma->vm_flags));
>> +        vma->vm_ops = obj->ops->mmap_ops;
>> +        vma->vm_private_data = node->driver_private;
>> +        return 0;
>> +    }
>> +
>> +    vma->vm_private_data = mmo;
>> +
>>       switch (mmo->mmap_type) {
>>       case I915_MMAP_TYPE_WC:
>>           vma->vm_page_prot =
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index a3ad8cf4eefd..ff59e6c640e6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -342,14 +342,14 @@ struct scatterlist *
>>   __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>                struct i915_gem_object_page_iter *iter,
>>                unsigned int n,
>> -             unsigned int *offset, bool allow_alloc);
>> +             unsigned int *offset, bool allow_alloc, bool dma);
>>     static inline struct scatterlist *
>>   i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>                  unsigned int n,
>>                  unsigned int *offset, bool allow_alloc)
>>   {
>> -    return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc);
>> +    return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, allow_alloc, false);
>>   }
>>     static inline struct scatterlist *
>> @@ -357,7 +357,7 @@ i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
>>                  unsigned int n,
>>                  unsigned int *offset, bool allow_alloc)
>>   {
>> -    return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc);
>> +    return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offset, allow_alloc, true);
>>   }
>>     struct page *
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 68313474e6a6..2a23b77424b3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -61,6 +61,7 @@ struct drm_i915_gem_object_ops {
>>                const struct drm_i915_gem_pread *arg);
>>       int (*pwrite)(struct drm_i915_gem_object *obj,
>>                 const struct drm_i915_gem_pwrite *arg);
>> +    u64 (*mmap_offset)(struct drm_i915_gem_object *obj);
>>         int (*dmabuf_export)(struct drm_i915_gem_object *obj);
>>   @@ -79,6 +80,7 @@ struct drm_i915_gem_object_ops {
>>       void (*delayed_free)(struct drm_i915_gem_object *obj);
>>       void (*release)(struct drm_i915_gem_object *obj);
>>   +    const struct vm_operations_struct *mmap_ops;
>>       const char *name; /* friendly name for debug, e.g. lockdep classes */
>>   };
>>   @@ -328,6 +330,7 @@ struct drm_i915_gem_object {
>>         struct {
>>           struct sg_table *cached_io_st;
>> +        struct i915_gem_object_page_iter get_io_page;
>>           bool created:1;
>>       } ttm;
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 6444e097016d..086005c1c7ea 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -467,9 +467,8 @@ __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>>                struct i915_gem_object_page_iter *iter,
>>                unsigned int n,
>>                unsigned int *offset,
>> -             bool allow_alloc)
>> +             bool allow_alloc, bool dma)
>>   {
>> -    const bool dma = iter == &obj->mm.get_dma_page;
>>       struct scatterlist *sg;
>>       unsigned int idx, count;
>>   diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 17598930a99e..d0be957326e0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -13,6 +13,7 @@
>>   #include "gem/i915_gem_object.h"
>>   #include "gem/i915_gem_region.h"
>>   #include "gem/i915_gem_ttm.h"
>> +#include "gem/i915_gem_mman.h"
>>     #define I915_PL_LMEM0 TTM_PL_PRIV
>>   #define I915_PL_SYSTEM TTM_PL_SYSTEM
>> @@ -158,11 +159,20 @@ static int i915_ttm_move_notify(struct ttm_buffer_object *bo)
>>     static void i915_ttm_free_cached_io_st(struct drm_i915_gem_object *obj)
>>   {
>> -    if (obj->ttm.cached_io_st) {
>> -        sg_free_table(obj->ttm.cached_io_st);
>> -        kfree(obj->ttm.cached_io_st);
>> -        obj->ttm.cached_io_st = NULL;
>> -    }
>> +    struct radix_tree_iter iter;
>> +    void __rcu **slot;
>> +
>> +    if (!obj->ttm.cached_io_st)
>> +        return;
>> +
>> +    rcu_read_lock();
>> +    radix_tree_for_each_slot(slot, &obj->ttm.get_io_page.radix, &iter, 0)
>> +        radix_tree_delete(&obj->ttm.get_io_page.radix, iter.index);
>> +    rcu_read_unlock();
>> +
>> +    sg_free_table(obj->ttm.cached_io_st);
>> +    kfree(obj->ttm.cached_io_st);
>> +    obj->ttm.cached_io_st = NULL;
>>   }
>>     static void i915_ttm_purge(struct drm_i915_gem_object *obj)
>> @@ -338,12 +348,42 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>       ttm_bo_move_sync_cleanup(bo, dst_mem);
>>       i915_ttm_free_cached_io_st(obj);
>>   -    if (!dst_man->use_tt)
>> +    if (!dst_man->use_tt) {
>>           obj->ttm.cached_io_st = dst_st;
>> +        obj->ttm.get_io_page.sg_pos = dst_st->sgl;
>> +        obj->ttm.get_io_page.sg_idx = 0;
>> +    }
>>         return 0;
>>   }
>>   +static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
>> +{
>> +    if (mem->mem_type < I915_PL_LMEM0)
>> +        return 0;
>> +
>> +    /* We may need to revisit this later, but this allows all caching to be used in mmap */
>> +    mem->bus.caching = ttm_cached;
>
> Since we're now using the TTM bo offsets, we might as well just make this ttm_write_combined now.

Correct. That would be the correct value. TTM will use the correct caching that way.

~Maarten

