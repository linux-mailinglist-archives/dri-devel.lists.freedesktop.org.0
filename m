Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737CE698DBA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 08:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7641810EB74;
	Thu, 16 Feb 2023 07:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3018210E347;
 Thu, 16 Feb 2023 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676532267; x=1708068267;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SqaMxWwx3RoXJDnvLeAo671Nxgz6RWGLqa5dPmgrU48=;
 b=gREFVsQlq6G/MeZkf1YLDD7aDa2R3DsbZBzbrvCTnLgUUMR5W9M4QOgF
 QugNDGu5sj+0oYYtUmfPwotKmz9tt1tI9CqLkLQL1dVr7dNnizNNT0rhP
 h7ntcWOWYZG4YT9smplG3V+ZXz12lDFRpCytHbBaUrAAK0AJrnHMLauCq
 9KDBElS/f1gye7KFfpV6IeGcYjyuLqOIh5vEyBSdqLUPuY8bdfcr/LY9M
 5hqZZVYjjwFCohfkKuVHBq1wbt6GhMJuyEqAp+7iPg1IVP+WXyOrawjRk
 u/h5Jy1NxH9XLwr6F/zlWa4A+RTmIj8nFdJmq21y2P3MCufqnDhTDW5Bx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311276723"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="311276723"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 23:24:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="672057544"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="672057544"
Received: from ksushmit-mobl1.gar.corp.intel.com (HELO [10.249.254.179])
 ([10.249.254.179])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 23:24:22 -0800
Message-ID: <1c14a5dd-dddc-c036-7dcd-b77b5c719d53@linux.intel.com>
Date: Thu, 16 Feb 2023 08:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
 <c4ef56e2-4177-6be8-9346-9f4eccbb1ae2@amd.com>
 <81f935b26890642f48793c7b7c5685e445bfe0f2.camel@linux.intel.com>
 <6fdacb84-bca3-0645-0bb9-ba8def5bd514@amd.com>
 <0ebad504ed56caed6a4338f346f02b4b59a77a5c.camel@linux.intel.com>
 <09edba94-5cb5-9757-ac57-2850cccf9ebe@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <09edba94-5cb5-9757-ac57-2850cccf9ebe@amd.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/16/23 08:11, Christian König wrote:
> Am 15.02.23 um 20:00 schrieb Thomas Hellström:
>> On Wed, 2023-02-15 at 19:30 +0100, Christian König wrote:
>>> Am 15.02.23 um 19:12 schrieb Thomas Hellström:
>>>> On Wed, 2023-02-15 at 18:42 +0100, Christian König wrote:
>>>>> Am 15.02.23 um 17:13 schrieb Thomas Hellström:
>>>>>> When swapping out, we will split multi-order pages both in
>>>>>> order to
>>>>>> move them to the swap-cache and to be able to return memory to
>>>>>> the
>>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>>> By reducing the page max order to the system PMD size, we can
>>>>>> be
>>>>>> nicer
>>>>>> to the system and avoid splitting gigantic pages.
>>>>>> On top of this we also
>>>>>> include the 64K page size in the page sizes tried, since that
>>>>>> appears to
>>>>>> be a common size for GPU applications.
>>>>> Please completely drop that.
>>>> You mean the 64K page size, or the whole patch?
>>> The 64K page size. This was an invention from Microsoft to
>>> standardize
>>> GPU handling ~15-20years ago.
>>>
>>> It turned out to be a complete shipwreck and by now 2MiB and 1GiB
>>> pages
>>> or just flexible hardware which can handle everything seem to become
>>> standard.
>>>
>>>>> This is just nonsense spilling in from the
>>>>> Windows drivers.
>>>> Agreed, but IIRC on the last RFC you asked me not to drop the 64K
>>>> pages, so that's why they are here. I can remove them if needed.
>>> We could keep it if it's in any way beneficial, but I'm pretty sure I
>>> must have been drunk to ask for that.
>>>
>>>> The only reason for keeping them from a performance point of view
>>>> is
>>>> better efficiency on GPUs with 64K page size if not using a
>>>> coalescing
>>>> IOMMU for dma-mapping.
>>> Are any of those still produced? As far as I know neither NVidia,
>>> Intel
>>> nor AMD still assumes that page size in their hardware for quite a
>>> while
>>> now.
>> Intel still supports 64K PTEs, so we use them where possible, otherwise
>> falling back to 4K. Typically we have coalescing IOMMU enabled when
>> testing, so can't really see the impact, but TBH I was surprised by the
>> number of 64K page allocations TTM spat out with this patch series, so
>> I definitely think there is a performance impact with !IOMMU, although
>> I can't quantify it ATM.
>>
>> So then if it's OK with you I'll keep that size for now.
>
> If it makes 64K pages preferred then this is a pretty clear NAK.
>
> What we can do is to support any page size up to at least 2MiB here.

OK, I'll use that latter approach then. I don't have any strong 
preferences here except the swapin helper wants to keep the max pagesize 
as low as possible since it needs to store one page worth of 4K swap 
entries.

/Thomas

>
> Christian.
>
>>
>> /Thomas
>>
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Let me know what you think is best and I'll adjust accordingly.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>> Christian.
>>>>>
>>>>>> Looking forward to when we might be able to swap out PMD size
>>>>>> folios
>>>>>> without splitting, this will also be a benefit.
>>>>>>
>>>>>> Signed-off-by: Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c | 58
>>>>>> ++++++++++++++++++++++++++---
>>>>>> -----
>>>>>>     1 file changed, 45 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> index 1cc7591a9542..8787fb6a218b 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> @@ -31,6 +31,8 @@
>>>>>>      * cause they are rather slow compared to alloc_pages+map.
>>>>>>      */
>>>>>>     +#define pr_fmt(fmt) "[TTM POOL] " fmt
>>>>>> +
>>>>>>     #include <linux/module.h>
>>>>>>     #include <linux/dma-mapping.h>
>>>>>>     #include <linux/debugfs.h>
>>>>>> @@ -47,6 +49,18 @@
>>>>>>         #include "ttm_module.h"
>>>>>>     +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>>> +#define TTM_64K_ORDER (16 - PAGE_SHIFT)
>>>>>> +#if (TTM_MAX_ORDER < TTM_64K_ORDER)
>>>>>> +#undef TTM_MAX_ORDER
>>>>>> +#define TTM_MAX_ORDER TTM_64K_ORDER
>>>>>> +#endif
>>>>>> +#if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
>>>>>> +#undef TTM_MAX_ORDER
>>>>>> +#define TTM_MAX_ORDER (MAX_ORDER - 1)
>>>>>> +#endif
>>>>>> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>>> +
>>>>>>     /**
>>>>>>      * struct ttm_pool_dma - Helper object for coherent DMA
>>>>>> mappings
>>>>>>      *
>>>>>> @@ -65,16 +79,18 @@ module_param(page_pool_size, ulong, 0644);
>>>>>>         static atomic_long_t allocated_pages;
>>>>>>     -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>>> +static struct ttm_pool_type
>>>>>> global_write_combined[TTM_DIM_ORDER];
>>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>>>     -static struct ttm_pool_type
>>>>>> global_dma32_write_combined[MAX_ORDER];
>>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>>> +static struct ttm_pool_type
>>>>>> global_dma32_write_combined[TTM_DIM_ORDER];
>>>>>> +static struct ttm_pool_type
>>>>>> global_dma32_uncached[TTM_DIM_ORDER];
>>>>>>         static spinlock_t shrinker_lock;
>>>>>>     static struct list_head shrinker_list;
>>>>>>     static struct shrinker mm_shrinker;
>>>>>>     +static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
>>>>>> +
>>>>>>     /* Allocate pages of size 1 << order with the given
>>>>>> gfp_flags */
>>>>>>     static struct page *ttm_pool_alloc_page(struct ttm_pool
>>>>>> *pool,
>>>>>> gfp_t gfp_flags,
>>>>>>                                           unsigned int order)
>>>>>> @@ -400,6 +416,17 @@ static void __ttm_pool_free(struct
>>>>>> ttm_pool
>>>>>> *pool, struct ttm_tt *tt,
>>>>>>           }
>>>>>>     }
>>>>>>     +static unsigned int ttm_pool_select_order(unsigned int order,
>>>>>> pgoff_t num_pages)
>>>>>> +{
>>>>>> +       unsigned int *cur_order = ttm_pool_orders;
>>>>>> +
>>>>>> +       order = min_t(unsigned int, __fls(num_pages), order);
>>>>>> +       while (order < *cur_order)
>>>>>> +               ++cur_order;
>>>>>> +
>>>>>> +       return *cur_order;
>>>>>> +}
>>>>>> +
>>>>>>     /**
>>>>>>      * ttm_pool_alloc - Fill a ttm_tt object
>>>>>>      *
>>>>>> @@ -439,9 +466,8 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>>> struct ttm_tt *tt,
>>>>>>           else
>>>>>>                   gfp_flags |= GFP_HIGHUSER;
>>>>>>     -       for (order = min_t(unsigned int, MAX_ORDER - 1,
>>>>>> __fls(num_pages));
>>>>>> -            num_pages;
>>>>>> -            order = min_t(unsigned int, order,
>>>>>> __fls(num_pages)))
>>>>>> {
>>>>>> +       order = ttm_pool_select_order(ttm_pool_orders[0],
>>>>>> num_pages);
>>>>>> +       for (; num_pages; order = ttm_pool_select_order(order,
>>>>>> num_pages)) {
>>>>>>                   struct ttm_pool_type *pt;
>>>>>>                       page_caching = tt->caching;
>>>>>> @@ -558,7 +584,7 @@ void ttm_pool_init(struct ttm_pool *pool,
>>>>>> struct device *dev,
>>>>>>               if (use_dma_alloc) {
>>>>>>                   for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>>>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>                                   ttm_pool_type_init(&pool-
>>>>>>> caching[i].orders[j],
>>>>>> pool, i,
>>>>>> j);
>>>>>>           }
>>>>>> @@ -578,7 +604,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>>               if (pool->use_dma_alloc) {
>>>>>>                   for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>>>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>                                   ttm_pool_type_fini(&pool-
>>>>>>> caching[i].orders[j]);
>>>>>>           }
>>>>>>     @@ -632,7 +658,7 @@ static void ttm_pool_debugfs_header(struct
>>>>>> seq_file *m)
>>>>>>           unsigned int i;
>>>>>>               seq_puts(m, "\t ");
>>>>>> -       for (i = 0; i < MAX_ORDER; ++i)
>>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>                   seq_printf(m, " ---%2u---", i);
>>>>>>           seq_puts(m, "\n");
>>>>>>     }
>>>>>> @@ -643,7 +669,7 @@ static void ttm_pool_debugfs_orders(struct
>>>>>> ttm_pool_type *pt,
>>>>>>     {
>>>>>>           unsigned int i;
>>>>>>     -       for (i = 0; i < MAX_ORDER; ++i)
>>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>                   seq_printf(m, " %8u",
>>>>>> ttm_pool_type_count(&pt[i]));
>>>>>>           seq_puts(m, "\n");
>>>>>>     }
>>>>>> @@ -749,10 +775,16 @@ int ttm_pool_mgr_init(unsigned long
>>>>>> num_pages)
>>>>>>           if (!page_pool_size)
>>>>>>                   page_pool_size = num_pages;
>>>>>>     +       if (TTM_64K_ORDER < TTM_MAX_ORDER)
>>>>>> +               ttm_pool_orders[1] = TTM_64K_ORDER;
>>>>>> +
>>>>>> +       pr_debug("Used orders are %u %u %u\n",
>>>>>> ttm_pool_orders[0],
>>>>>> +                ttm_pool_orders[1], ttm_pool_orders[2]);
>>>>>> +
>>>>>>           spin_lock_init(&shrinker_lock);
>>>>>>           INIT_LIST_HEAD(&shrinker_list);
>>>>>>     -       for (i = 0; i < MAX_ORDER; ++i) {
>>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>                   ttm_pool_type_init(&global_write_combined[i],
>>>>>> NULL,
>>>>>>                                      ttm_write_combined, i);
>>>>>>                   ttm_pool_type_init(&global_uncached[i], NULL,
>>>>>> ttm_uncached, i);
>>>>>> @@ -785,7 +817,7 @@ void ttm_pool_mgr_fini(void)
>>>>>>     {
>>>>>>           unsigned int i;
>>>>>>     -       for (i = 0; i < MAX_ORDER; ++i) {
>>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>                   ttm_pool_type_fini(&global_write_combined[i]);
>>>>>>                   ttm_pool_type_fini(&global_uncached[i]);
>
