Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0739A2D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 16:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154EC6E190;
	Thu,  3 Jun 2021 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F56E190;
 Thu,  3 Jun 2021 14:08:24 +0000 (UTC)
IronPort-SDR: 3FsKVwIsq4cOSm+sqE+H15P9YXa8NkG20IIGL51yLq2TqQP7hoGgN6N/lEC9ZaSu7Z01EX9IHQ
 CgobPteRUf4w==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191159669"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="191159669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 07:08:22 -0700
IronPort-SDR: iRTODLPAjoMmLiFkh3Zk4BjcuGCqsqGBj+BEzTqfF8NbK7OuY8cOUBNFJSgxinhygSpyeXfms+
 mHHuNjEQ3+YA==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="417392430"
Received: from vkubarev-mobl1.ccr.corp.intel.com (HELO [10.249.254.167])
 ([10.249.254.167])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 07:08:21 -0700
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Update object placement flags
 to be mutable
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNwY8BEL1BjTqioZu3BYZ=86qkuqooaZPOgHb=03Pj+dQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <8c50da5f-4ea0-3476-f987-b3a0ad55e10f@linux.intel.com>
Date: Thu, 3 Jun 2021 16:08:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNwY8BEL1BjTqioZu3BYZ=86qkuqooaZPOgHb=03Pj+dQ@mail.gmail.com>
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


On 6/3/21 1:17 PM, Matthew Auld wrote:
> On Wed, 2 Jun 2021 at 18:08, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> The object ops i915_GEM_OBJECT_HAS_IOMEM and the object
>> I915_BO_ALLOC_STRUCT_PAGE flags are considered immutable by
>> much of our code. Introduce a new mem_flags member to hold these
>> and make sure checks for these flags being set are either done
>> under the object lock or with pages properly pinned. The flags
>> will change during migration under the object lock.
> What are the rules for the gem_object_ops flags? Like is_shrinkable?
> Can't we just move these there(IOMEM vs PAGE)?
But the ops flags are immutable, right? We expect the IOMEM and PAGE 
flags to change when an object is migrated. We could of course flip the 
ops under the lock, but I'd consider that a bit risky?
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_internal.c  |  4 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  7 +++-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 38 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 14 ++-----
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 20 +++++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 10 +++--
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  4 +-
>>   .../drm/i915/gem/selftests/huge_gem_object.c  |  4 +-
>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  5 +--
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
>>   .../drm/i915/gem/selftests/i915_gem_phys.c    |  3 +-
>>   14 files changed, 78 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> index ce6b664b10aa..13b217f75055 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
>> @@ -177,8 +177,8 @@ i915_gem_object_create_internal(struct drm_i915_private *i915,
>>                  return ERR_PTR(-ENOMEM);
>>
>>          drm_gem_private_object_init(&i915->drm, &obj->base, size);
>> -       i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class,
>> -                            I915_BO_ALLOC_STRUCT_PAGE);
>> +       i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class, 0);
>> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>
>>          /*
>>           * Mark the object as volatile, such that the pages are marked as
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index d1de97e4adfd..171a21ca930c 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -683,7 +683,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
>>
>>          if (mmap_type != I915_MMAP_TYPE_GTT &&
>>              !i915_gem_object_has_struct_page(obj) &&
>> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
>> +           !i915_gem_object_has_iomem(obj))
>>                  return -ENODEV;
>>
>>          mmo = mmap_offset_attach(obj, mmap_type, file);
>> @@ -707,7 +707,12 @@ __assign_mmap_offset_handle(struct drm_file *file,
>>          if (!obj)
>>                  return -ENOENT;
>>
>> +       err = i915_gem_object_lock_interruptible(obj, NULL);
>> +       if (err)
>> +               goto out_put;
>>          err = __assign_mmap_offset(obj, mmap_type, offset, file);
>> +       i915_gem_object_unlock(obj);
>> +out_put:
>>          i915_gem_object_put(obj);
>>          return err;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index cf18c430d51f..07e8ff9a8aae 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -475,6 +475,44 @@ bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
>>          return obj->mm.n_placements > 1;
>>   }
>>
>> +/**
>> + * i915_gem_object_has_struct_page - Whether the object is page-backed
>> + * @obj: The object to query.
>> + *
>> + * This function should only be called while the object is locked or pinned,
>> + * otherwise the page backing may change under the caller.
>> + *
>> + * Return: True if page-backed, false otherwise.
>> + */
>> +bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
>> +{
>> +#ifdef CONFIG_LOCKDEP
>> +       if (IS_DGFX(to_i915(obj->base.dev)) &&
>> +           i915_gem_object_evictable((void __force *)obj))
>> +               assert_object_held_shared(obj);
>> +#endif
>> +       return obj->mem_flags & I915_BO_FLAG_STRUCT_PAGE;
>> +}
>> +
>> +/**
>> + * i915_gem_object_has_iomem - Whether the object is iomem-backed
>> + * @obj: The object to query.
>> + *
>> + * This function should only be called while the object is locked or pinned,
>> + * otherwise the iomem backing may change under the caller.
>> + *
>> + * Return: True if iomem-backed, false otherwise.
>> + */
>> +bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
>> +{
>> +#ifdef CONFIG_LOCKDEP
>> +       if (IS_DGFX(to_i915(obj->base.dev)) &&
>> +           i915_gem_object_evictable((void __force *)obj))
>> +               assert_object_held_shared(obj);
>> +#endif
>> +       return obj->mem_flags & I915_BO_FLAG_IOMEM;
>> +}
>> +
>>   void i915_gem_init__objects(struct drm_i915_private *i915)
>>   {
>>          INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index ff59e6c640e6..23e26f6b1db9 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -147,7 +147,7 @@ i915_gem_object_put(struct drm_i915_gem_object *obj)
>>   /*
>>    * If more than one potential simultaneous locker, assert held.
>>    */
>> -static inline void assert_object_held_shared(struct drm_i915_gem_object *obj)
>> +static inline void assert_object_held_shared(const struct drm_i915_gem_object *obj)
>>   {
>>          /*
>>           * Note mm list lookup is protected by
>> @@ -261,17 +261,9 @@ i915_gem_object_type_has(const struct drm_i915_gem_object *obj,
>>          return obj->ops->flags & flags;
>>   }
>>
>> -static inline bool
>> -i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj)
>> -{
>> -       return obj->flags & I915_BO_ALLOC_STRUCT_PAGE;
>> -}
>> +bool i915_gem_object_has_struct_page(const struct drm_i915_gem_object *obj);
>>
>> -static inline bool
>> -i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj)
>> -{
>> -       return i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
>> -}
>> +bool i915_gem_object_has_iomem(const struct drm_i915_gem_object *obj);
>>
>>   static inline bool
>>   i915_gem_object_is_shrinkable(const struct drm_i915_gem_object *obj)
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 2a23b77424b3..fb9ccc3f50e7 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -33,10 +33,9 @@ struct i915_lut_handle {
>>
>>   struct drm_i915_gem_object_ops {
>>          unsigned int flags;
>> -#define I915_GEM_OBJECT_HAS_IOMEM      BIT(1)
>> -#define I915_GEM_OBJECT_IS_SHRINKABLE  BIT(2)
>> -#define I915_GEM_OBJECT_IS_PROXY       BIT(3)
>> -#define I915_GEM_OBJECT_NO_MMAP                BIT(4)
>> +#define I915_GEM_OBJECT_IS_SHRINKABLE  BIT(1)
>> +#define I915_GEM_OBJECT_IS_PROXY       BIT(2)
>> +#define I915_GEM_OBJECT_NO_MMAP                BIT(3)
>>
>>          /* Interface between the GEM object and its backing storage.
>>           * get_pages() is called once prior to the use of the associated set
>> @@ -201,17 +200,18 @@ struct drm_i915_gem_object {
>>          unsigned long flags;
>>   #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
>>   #define I915_BO_ALLOC_VOLATILE   BIT(1)
>> -#define I915_BO_ALLOC_STRUCT_PAGE BIT(2)
>> -#define I915_BO_ALLOC_CPU_CLEAR  BIT(3)
>> -#define I915_BO_ALLOC_USER       BIT(4)
>> +#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
>> +#define I915_BO_ALLOC_USER       BIT(3)
>>   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>>                               I915_BO_ALLOC_VOLATILE | \
>> -                            I915_BO_ALLOC_STRUCT_PAGE | \
>>                               I915_BO_ALLOC_CPU_CLEAR | \
>>                               I915_BO_ALLOC_USER)
>> -#define I915_BO_READONLY         BIT(5)
>> -#define I915_TILING_QUIRK_BIT    6 /* unknown swizzling; do not release! */
>> +#define I915_BO_READONLY         BIT(4)
>> +#define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
>>
>> +       unsigned int mem_flags:2;
>> +#define I915_BO_FLAG_STRUCT_PAGE BIT(0)
>> +#define I915_BO_FLAG_IOMEM       BIT(1)
>>          /*
>>           * Is the object to be mapped as read-only to the GPU
>>           * Only honoured if hardware has relevant pte bit
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 086005c1c7ea..f2f850e31b8e 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -351,7 +351,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>          int err;
>>
>>          if (!i915_gem_object_has_struct_page(obj) &&
>> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
>> +           !i915_gem_object_has_iomem(obj))
>>                  return ERR_PTR(-ENXIO);
>>
>>          assert_object_held(obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>> index be72ad0634ba..7986612f48fa 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
>> @@ -76,7 +76,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
>>          intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
>>
>>          /* We're no longer struct page backed */
>> -       obj->flags &= ~I915_BO_ALLOC_STRUCT_PAGE;
>> +       obj->mem_flags &= ~I915_BO_FLAG_STRUCT_PAGE;
>>          __i915_gem_object_set_pages(obj, st, sg->length);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 5d16c4462fda..3648ae1d6628 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -284,6 +284,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>>                                  bool needs_clflush)
>>   {
>>          GEM_BUG_ON(obj->mm.madv == __I915_MADV_PURGED);
>> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>>
>>          if (obj->mm.madv == I915_MADV_DONTNEED)
>>                  obj->mm.dirty = false;
>> @@ -302,6 +303,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
>>          struct pagevec pvec;
>>          struct page *page;
>>
>> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>>          __i915_gem_object_release_shmem(obj, pages, true);
>>
>>          i915_gem_gtt_finish_pages(obj, pages);
>> @@ -444,7 +446,7 @@ shmem_pread(struct drm_i915_gem_object *obj,
>>
>>   static void shmem_release(struct drm_i915_gem_object *obj)
>>   {
>> -       if (obj->flags & I915_BO_ALLOC_STRUCT_PAGE)
>> +       if (i915_gem_object_has_struct_page(obj))
>>                  i915_gem_object_release_memory_region(obj);
>>
>>          fput(obj->base.filp);
>> @@ -513,9 +515,8 @@ static int shmem_object_init(struct intel_memory_region *mem,
>>          mapping_set_gfp_mask(mapping, mask);
>>          GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>>
>> -       i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class,
>> -                            I915_BO_ALLOC_STRUCT_PAGE);
>> -
>> +       i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
>> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>          obj->write_domain = I915_GEM_DOMAIN_CPU;
>>          obj->read_domains = I915_GEM_DOMAIN_CPU;
>>
>> @@ -561,6 +562,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
>>          resource_size_t offset;
>>          int err;
>>
>> +       GEM_WARN_ON(IS_DGFX(dev_priv));
>>          obj = i915_gem_object_create_shmem(dev_priv, round_up(size, PAGE_SIZE));
>>          if (IS_ERR(obj))
>>                  return obj;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 3748098b42d5..ae12a2be11a2 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -563,7 +563,6 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
>>
>>   const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>>          .name = "i915_gem_object_ttm",
>> -       .flags = I915_GEM_OBJECT_HAS_IOMEM,
>>
>>          .get_pages = i915_ttm_get_pages,
>>          .put_pages = i915_ttm_put_pages,
>> @@ -620,6 +619,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>          i915_gem_object_init_memory_region(obj, mem);
>>          i915_gem_object_make_unshrinkable(obj);
>>          obj->read_domains = I915_GEM_DOMAIN_WC | I915_GEM_DOMAIN_GTT;
>> +       obj->mem_flags |= I915_BO_FLAG_IOMEM;
>>          i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
>>          INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
>>          mutex_init(&obj->ttm.get_io_page.lock);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> index 602f0ed983ec..41dfcb75f05b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>> @@ -538,8 +538,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>>                  return -ENOMEM;
>>
>>          drm_gem_private_object_init(dev, &obj->base, args->user_size);
>> -       i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class,
>> -                            I915_BO_ALLOC_STRUCT_PAGE);
>> +       i915_gem_object_init(obj, &i915_gem_userptr_ops, &lock_class, 0);
>> +       obj->mem_flags = I915_BO_FLAG_STRUCT_PAGE;
>>          obj->read_domains = I915_GEM_DOMAIN_CPU;
>>          obj->write_domain = I915_GEM_DOMAIN_CPU;
>>          i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
>> index 0c8ecfdf5405..f963b8e1e37b 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
>> @@ -114,8 +114,8 @@ huge_gem_object(struct drm_i915_private *i915,
>>                  return ERR_PTR(-ENOMEM);
>>
>>          drm_gem_private_object_init(&i915->drm, &obj->base, dma_size);
>> -       i915_gem_object_init(obj, &huge_ops, &lock_class,
>> -                            I915_BO_ALLOC_STRUCT_PAGE);
>> +       i915_gem_object_init(obj, &huge_ops, &lock_class, 0);
>> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>
>>          obj->read_domains = I915_GEM_DOMAIN_CPU;
>>          obj->write_domain = I915_GEM_DOMAIN_CPU;
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> index dadd485bc52f..ccc67ed1a84b 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -167,9 +167,8 @@ huge_pages_object(struct drm_i915_private *i915,
>>                  return ERR_PTR(-ENOMEM);
>>
>>          drm_gem_private_object_init(&i915->drm, &obj->base, size);
>> -       i915_gem_object_init(obj, &huge_page_ops, &lock_class,
>> -                            I915_BO_ALLOC_STRUCT_PAGE);
>> -
>> +       i915_gem_object_init(obj, &huge_page_ops, &lock_class, 0);
>> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>>          i915_gem_object_set_volatile(obj);
>>
>>          obj->write_domain = I915_GEM_DOMAIN_CPU;
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index ca69a29b7f2a..bfb35270a1f0 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -837,7 +837,7 @@ static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
>>
>>          if (type != I915_MMAP_TYPE_GTT &&
>>              !i915_gem_object_has_struct_page(obj) &&
>> -           !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
>> +           !i915_gem_object_has_iomem(obj))
>>                  return false;
>>
>>          return true;
>> @@ -991,7 +991,7 @@ static const char *repr_mmap_type(enum i915_mmap_type type)
>>   static bool can_access(const struct drm_i915_gem_object *obj)
>>   {
>>          return i915_gem_object_has_struct_page(obj) ||
>> -              i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM);
>> +              i915_gem_object_has_iomem(obj);
>>   }
>>
>>   static int __igt_mmap_access(struct drm_i915_private *i915,
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
>> index 3a6ce87f8b52..d43d8dae0f69 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
>> @@ -25,13 +25,14 @@ static int mock_phys_object(void *arg)
>>                  goto out;
>>          }
>>
>> +       i915_gem_object_lock(obj, NULL);
>>          if (!i915_gem_object_has_struct_page(obj)) {
>> +               i915_gem_object_unlock(obj);
>>                  err = -EINVAL;
>>                  pr_err("shmem has no struct page\n");
>>                  goto out_obj;
>>          }
>>
>> -       i915_gem_object_lock(obj, NULL);
>>          err = i915_gem_object_attach_phys(obj, PAGE_SIZE);
>>          i915_gem_object_unlock(obj);
>>          if (err) {
>> --
>> 2.31.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
