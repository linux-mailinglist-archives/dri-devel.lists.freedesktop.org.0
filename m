Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D591D910965
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B2A10E156;
	Thu, 20 Jun 2024 15:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjXM0R0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B82A10E156;
 Thu, 20 Jun 2024 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718896272; x=1750432272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Npk8dhHB75e59GcO676/UTsrpkpVA131GTeLScf/p2U=;
 b=mjXM0R0Tq9ZU50/huR+rfw7bSKulLBoV1tJ1zGv5djbeimGbQykdrIJd
 x+Y92DB8XLUP3i2w2oXf0rCXHql7nCyCgnjCBQo5Vwb6YtMXvli7jB1eA
 yKMd/8A+pN8gfkPZhLN+ToxOyWJAQvx74YaKa1FC1kbDylPDd9T7WYMkv
 F1UAILl+5BSwBMLk8WWKOdl50V9nKR7dZiwjqG8Wc9RHF/gc+PEOhXqCA
 bzCDSe5eoc8RSyYRiM7nVPbpn5kGQdwo0UAf6fi23/0P8v3RG36rnhcLG
 XpZPObKiUqWQ03duQNOs8tTcPY6zls/bJ9LRI4CwcJ3QXXjZvwTt3dDd7 Q==;
X-CSE-ConnectionGUID: QVjqsilaTy2z6B68a1J7fg==
X-CSE-MsgGUID: OQMvN8gQRMCAUh2/xhaYmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33339257"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="33339257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 08:11:12 -0700
X-CSE-ConnectionGUID: rypBMuDcRCO6mr8CZDu58A==
X-CSE-MsgGUID: RvyadGO0ToaBl7+9m9lpcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42176388"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.100])
 ([10.246.50.100])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 08:11:10 -0700
Message-ID: <37e721b8-9dbd-4a71-9aaf-77926916939a@linux.intel.com>
Date: Thu, 20 Jun 2024 17:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/ttm/pool: Introduce a way to skip clear on
 free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-2-nirmoy.das@intel.com>
 <71e4aed6-d9d3-41cd-b043-277e9573cb3f@amd.com>
 <f81307fb-b63b-4f87-9e20-a8033faac514@intel.com>
 <46783eff-0283-402c-ad09-9917e6436632@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <46783eff-0283-402c-ad09-9917e6436632@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 6/20/2024 4:45 PM, Christian König wrote:
> Hi Nirmoy,
>
> Am 20.06.24 um 16:37 schrieb Nirmoy Das:
>> Hi Christian,
>>
>> On 6/20/2024 4:08 PM, Christian König wrote:
>>> Am 20.06.24 um 15:46 schrieb Nirmoy Das:
>>>> Clearing pages can be very slow when using CPU but GPUs can perform 
>>>> this
>>>> task much faster. With this new pool API driver can decide if it 
>>>> wants to
>>>> clear pages using GPU. This provides the flexibility to choose the 
>>>> desired
>>>> clear policy, either during allocation or upon freeing, as per the 
>>>> driver's
>>>> preference.
>>>
>>> We already have the TTM_TT_FLAG_ZERO_ALLOC to indicate if pages 
>>> needs to be cleared on alloc from the OS.
>>>
>>> I'm not sure if we really need the option to not clear them in the 
>>> pool as well, but if we really need this I suggest to switch from 
>>> clear on free to clear on alloc again and just honor the flag.
>>
>>
>> Perf reported higher latency because of clearing pages before giving 
>> back to the pool. I think it would be nice if drm driver could avoid it.
>>
>> I  can modify this to move clearing page to ttm_pool_type_take() to 
>> honor TTM_TT_FLAG_ZERO_ALLOC flags.
>
> Both approaches have some pro and cons. IIRC we intentionally moved 
> the clearing to the free function to avoid latency on allocation.


Ah I see. I will send a patch to honor TTM_TT_FLAG_ZERO_ALLOC flag and 
if we need clear-on-free then we can add another flag for that.

>
>>>
>>> Alternatively you could also split the pools into cleared and not 
>>> cleared pages as well.
>>
>>
>> Could you expand this please ?
>
> Just create separate pools for cleared and uncleared pages (or 
> separate lists inside the pools).
>
> Then when you see the TTM_TT_FLAG_ZERO_ALLOC flag you try to grab 
> things from the uncleared pool and if you don't see it try to grab 
> things from the cleared pool.
>
> Same for release of pages, just the other way around.


I get it now. My main goal is to avoid cpu clear so this will work well 
too with the above change.

>
>>
>> I have another question. Our userspace team have  found that there is 
>> higher latency for ttm_cached type buffer as well and using gpu clear 
>> doesn't help much
>>
>> because kernel will clear pages anyways if 
>> alloc_on_init/CONFIG_INIT_ON_ALLOC_DEFAULT_ON is active. I see that 
>> only way to mitigate this is to use a pool for
>>
>> ttm_cached buffers.  I was thinking of using a pool flag to also 
>> allow drm driver to create a pool for ttm_cached. I wonder what do 
>> you think about it and if
>>
>> there is any other better solution.
>
> Well I would clearly have to NAK a hack like this.

I thought so :)


>
> We only have a pool for uncached and WC pages because of lack of 
> support for that in the general memory and DMA management.
>
> The TTM_TT_FLAG_ZERO_ALLOC should control if GFP_ZERO is set or not. 
> If the core MM decides to ignore that and clear pages anyway then you 
> need to talk to the core MM people if you want to avoid that.


Now I know why we don't have a pool for WB. Also it seems the pools are 
x86 exclusive.  Just found about that there were some proposal in core 
MM[1] to avoid alloc_on_init but haven't seen any

follow up with a quick search.

[1] 
https://patchwork.kernel.org/project/linux-mm/patch/20230831105252.1385911-1-zhaoyang.huang@unisoc.com/#25494667


Thanks a lot,

Nirmoy

>
> Regards,
> Christian.
>
>>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_device.c | 42 +++++++++++++++++++++++----
>>>>   drivers/gpu/drm/ttm/ttm_pool.c   | 49 
>>>> +++++++++++++++++++++++++-------
>>>>   include/drm/ttm/ttm_device.h     |  8 ++++++
>>>>   include/drm/ttm/ttm_pool.h       | 11 +++++++
>>>>   4 files changed, 94 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>> index 434cf0258000..54a3ea825c2e 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>> @@ -191,15 +191,19 @@ EXPORT_SYMBOL(ttm_device_swapout);
>>>>    * @vma_manager: A pointer to a vma manager.
>>>>    * @use_dma_alloc: If coherent DMA allocation API should be used.
>>>>    * @use_dma32: If we should use GFP_DMA32 for device memory 
>>>> allocations.
>>>> + * @pool_flags: Desired pool flags
>>>>    *
>>>>    * Initializes a struct ttm_device:
>>>>    * Returns:
>>>>    * !0: Failure.
>>>>    */
>>>> -int ttm_device_init(struct ttm_device *bdev, const struct 
>>>> ttm_device_funcs *funcs,
>>>> -            struct device *dev, struct address_space *mapping,
>>>> -            struct drm_vma_offset_manager *vma_manager,
>>>> -            bool use_dma_alloc, bool use_dma32)
>>>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>>>> +                    const struct ttm_device_funcs *funcs,
>>>> +                    struct device *dev,
>>>> +                    struct address_space *mapping,
>>>> +                    struct drm_vma_offset_manager *vma_manager,
>>>> +                    bool use_dma_alloc, bool use_dma32,
>>>> +                    unsigned int pool_flags)
>>>>   {
>>>>       struct ttm_global *glob = &ttm_glob;
>>>>       int ret, nid;
>>>> @@ -227,7 +231,8 @@ int ttm_device_init(struct ttm_device *bdev, 
>>>> const struct ttm_device_funcs *func
>>>>       else
>>>>           nid = NUMA_NO_NODE;
>>>>   -    ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
>>>> +    ttm_pool_init_with_flags(&bdev->pool, dev, nid, use_dma_alloc,
>>>> +                 use_dma32, pool_flags);
>>>>         bdev->vma_manager = vma_manager;
>>>>       spin_lock_init(&bdev->lru_lock);
>>>> @@ -239,6 +244,33 @@ int ttm_device_init(struct ttm_device *bdev, 
>>>> const struct ttm_device_funcs *func
>>>>         return 0;
>>>>   }
>>>> +EXPORT_SYMBOL(ttm_device_init_with_pool_flags);
>>>> +
>>>> +
>>>> +/**
>>>> + * ttm_device_init
>>>> + *
>>>> + * @bdev: A pointer to a struct ttm_device to initialize.
>>>> + * @funcs: Function table for the device.
>>>> + * @dev: The core kernel device pointer for DMA mappings and 
>>>> allocations.
>>>> + * @mapping: The address space to use for this bo.
>>>> + * @vma_manager: A pointer to a vma manager.
>>>> + * @use_dma_alloc: If coherent DMA allocation API should be used.
>>>> + * @use_dma32: If we should use GFP_DMA32 for device memory 
>>>> allocations.
>>>> + *
>>>> + * Initializes a struct ttm_device:
>>>> + * Returns:
>>>> + * !0: Failure.
>>>> + */
>>>> +int ttm_device_init(struct ttm_device *bdev, const struct 
>>>> ttm_device_funcs *funcs,
>>>> +            struct device *dev, struct address_space *mapping,
>>>> +            struct drm_vma_offset_manager *vma_manager,
>>>> +            bool use_dma_alloc, bool use_dma32)
>>>> +{
>>>> +    return ttm_device_init_with_pool_flags(bdev, funcs, dev, mapping,
>>>> +                           vma_manager, use_dma_alloc,
>>>> +                           use_dma32, 0);
>>>> +}
>>>>   EXPORT_SYMBOL(ttm_device_init);
>>>>     void ttm_device_fini(struct ttm_device *bdev)
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index 6e1fd6985ffc..6f33c3e7cdf2 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -222,15 +222,17 @@ static void ttm_pool_unmap(struct ttm_pool 
>>>> *pool, dma_addr_t dma_addr,
>>>>   }
>>>>     /* Give pages into a specific pool_type */
>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>>> page *p)
>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>>> page *p, bool skip_clear)
>>>>   {
>>>>       unsigned int i, num_pages = 1 << pt->order;
>>>>   -    for (i = 0; i < num_pages; ++i) {
>>>> -        if (PageHighMem(p))
>>>> -            clear_highpage(p + i);
>>>> -        else
>>>> -            clear_page(page_address(p + i));
>>>> +    if (!skip_clear) {
>>>> +        for (i = 0; i < num_pages; ++i) {
>>>> +            if (PageHighMem(p))
>>>> +                clear_highpage(p + i);
>>>> +            else
>>>> +                clear_page(page_address(p + i));
>>>> +        }
>>>>       }
>>>>         spin_lock(&pt->lock);
>>>> @@ -396,7 +398,10 @@ static void ttm_pool_free_range(struct 
>>>> ttm_pool *pool, struct ttm_tt *tt,
>>>>       struct page **pages = &tt->pages[start_page];
>>>>       unsigned int order;
>>>>       pgoff_t i, nr;
>>>> +    bool skip_clear = false;
>>>>   +    if (pool->flags & TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE)
>>>> +        skip_clear = true;
>>>>       for (i = start_page; i < end_page; i += nr, pages += nr) {
>>>>           struct ttm_pool_type *pt = NULL;
>>>>   @@ -407,7 +412,7 @@ static void ttm_pool_free_range(struct 
>>>> ttm_pool *pool, struct ttm_tt *tt,
>>>>             pt = ttm_pool_select_type(pool, caching, order);
>>>>           if (pt)
>>>> -            ttm_pool_type_give(pt, *pages);
>>>> +            ttm_pool_type_give(pt, *pages, skip_clear);
>>>>           else
>>>>               ttm_pool_free_page(pool, caching, order, *pages);
>>>>       }
>>>> @@ -550,18 +555,21 @@ void ttm_pool_free(struct ttm_pool *pool, 
>>>> struct ttm_tt *tt)
>>>>   EXPORT_SYMBOL(ttm_pool_free);
>>>>     /**
>>>> - * ttm_pool_init - Initialize a pool
>>>> + * ttm_pool_init_with_flags - Initialize a pool with flags
>>>>    *
>>>>    * @pool: the pool to initialize
>>>>    * @dev: device for DMA allocations and mappings
>>>>    * @nid: NUMA node to use for allocations
>>>>    * @use_dma_alloc: true if coherent DMA alloc should be used
>>>>    * @use_dma32: true if GFP_DMA32 should be used
>>>> + * @flags: control flags for the pool
>>>> + *
>>>> + * Initialize the pool and its pool types with flags to modify 
>>>> defaults
>>>>    *
>>>> - * Initialize the pool and its pool types.
>>>>    */
>>>> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>> -           int nid, bool use_dma_alloc, bool use_dma32)
>>>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>>>> *dev,
>>>> +           int nid, bool use_dma_alloc, bool use_dma32,
>>>> +           unsigned int flags)
>>>>   {
>>>>       unsigned int i, j;
>>>>   @@ -571,6 +579,7 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>>> struct device *dev,
>>>>       pool->nid = nid;
>>>>       pool->use_dma_alloc = use_dma_alloc;
>>>>       pool->use_dma32 = use_dma32;
>>>> +    pool->flags = flags;
>>>>         for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>>> @@ -585,6 +594,24 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>>> struct device *dev,
>>>>           }
>>>>       }
>>>>   }
>>>> +EXPORT_SYMBOL(ttm_pool_init_with_flags);
>>>> +
>>>> +/**
>>>> + * ttm_pool_init - Initialize a pool
>>>> + *
>>>> + * @pool: the pool to initialize
>>>> + * @dev: device for DMA allocations and mappings
>>>> + * @nid: NUMA node to use for allocations
>>>> + * @use_dma_alloc: true if coherent DMA alloc should be used
>>>> + * @use_dma32: true if GFP_DMA32 should be used
>>>> + *
>>>> + * Initialize the pool and its pool types.
>>>> + */
>>>> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>> +           int nid, bool use_dma_alloc, bool use_dma32)
>>>> +{
>>>> +    ttm_pool_init_with_flags(pool, dev, nid, use_dma_alloc, 
>>>> use_dma32, 0);
>>>> +}
>>>>   EXPORT_SYMBOL(ttm_pool_init);
>>>>     /**
>>>> diff --git a/include/drm/ttm/ttm_device.h 
>>>> b/include/drm/ttm/ttm_device.h
>>>> index c22f30535c84..1b20c5798e97 100644
>>>> --- a/include/drm/ttm/ttm_device.h
>>>> +++ b/include/drm/ttm/ttm_device.h
>>>> @@ -291,6 +291,14 @@ int ttm_device_init(struct ttm_device *bdev, 
>>>> const struct ttm_device_funcs *func
>>>>               struct device *dev, struct address_space *mapping,
>>>>               struct drm_vma_offset_manager *vma_manager,
>>>>               bool use_dma_alloc, bool use_dma32);
>>>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>>>> +                    const struct ttm_device_funcs *funcs,
>>>> +                    struct device *dev,
>>>> +                    struct address_space *mapping,
>>>> +                    struct drm_vma_offset_manager *vma_manager,
>>>> +                    bool use_dma_alloc, bool use_dma32,
>>>> +                    unsigned int pool_flags);
>>>> +
>>>>   void ttm_device_fini(struct ttm_device *bdev);
>>>>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>>>>   diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>>>> index 160d954a261e..9822996309e5 100644
>>>> --- a/include/drm/ttm/ttm_pool.h
>>>> +++ b/include/drm/ttm/ttm_pool.h
>>>> @@ -66,10 +66,17 @@ struct ttm_pool_type {
>>>>    * @use_dma_alloc: if coherent DMA allocations should be used
>>>>    * @use_dma32: if GFP_DMA32 should be used
>>>>    * @caching: pools for each caching/order
>>>> + * @flags: flags to control certain pool behaviour
>>>> + *
>>>> + * The @flags can be:
>>>> + *  - %TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE - This flag can be used to
>>>> + *    skip clear on free when driver decides to do that on it's own.
>>>>    */
>>>>   struct ttm_pool {
>>>>       struct device *dev;
>>>>       int nid;
>>>> +#define TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE    1 << 0
>>>> +    unsigned int flags;
>>>>         bool use_dma_alloc;
>>>>       bool use_dma32;
>>>> @@ -85,6 +92,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct 
>>>> ttm_tt *tt);
>>>>     void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>>              int nid, bool use_dma_alloc, bool use_dma32);
>>>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>>>> *dev,
>>>> +                  int nid, bool use_dma_alloc, bool use_dma32,
>>>> +                  unsigned int flags);
>>>> +
>>>>   void ttm_pool_fini(struct ttm_pool *pool);
>>>>     int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>>>
>
