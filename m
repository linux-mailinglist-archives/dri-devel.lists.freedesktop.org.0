Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B76E41E6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 10:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E81F10E011;
	Mon, 17 Apr 2023 08:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8DC10E011;
 Mon, 17 Apr 2023 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681718537; x=1713254537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zuggMPLqXtEGwEF1e7Hp1uyREuuOTrlgKJFKkOHt4W8=;
 b=LVjd/gyZMZcKVUmUsvOSEwCwsDLTEutcJzNL+QphKkTbf3UtUnvCBPAO
 bi2xvbsKkjeb9Wd6Rocmd1zIrhiOCXiA0mkAjL1Q6KV2az9L1BzRZBjqA
 Ido4sYkgThstK29jA1I4KDK3EDiOf/7JpPokETMPleX5qXo95Hmjls194
 DOXA9qO3TzAG5omVwa+YV72vUkCGa7XZptyF4it7dtbDyuaXTIH6vbuyE
 MWYj/1e5GSZl2MJwH9wx4OxCScpG259UtjY/wZAY8tYGdJJcnB0FR535Y
 wqB53LkLb1K5GRKRJxSBsao0lvsLhejPOrMMYPBUunh1f0q8fRq40KqSH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="431121527"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="431121527"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="1020334029"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="1020334029"
Received: from imurugax-mobl2.gar.corp.intel.com (HELO [10.249.254.190])
 ([10.249.254.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 01:02:14 -0700
Message-ID: <414a5129-d78d-9f86-9820-6932f13fb1bc@linux.intel.com>
Date: Mon, 17 Apr 2023 10:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
 <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
 <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
 <CAKMK7uFVWh16ng_tyuTu-0k4k7Wq5LjpwvJgYuidy-YVPEEQ=A@mail.gmail.com>
 <178a7ee4-1406-ff0f-4529-034f600785a9@amd.com>
 <CAKMK7uHgUuqWJuqmZKrxi2mNiqExhmMif-naYnzUSj-puW-x+A@mail.gmail.com>
 <8af45b2b-6c53-83e8-6f14-1e3091658e3e@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <8af45b2b-6c53-83e8-6f14-1e3091658e3e@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 4/14/23 12:11, Christian König wrote:
> Am 13.04.23 um 15:13 schrieb Daniel Vetter:
>> On Thu, 13 Apr 2023 at 11:46, Christian König 
>> <christian.koenig@amd.com> wrote:
>>> Am 13.04.23 um 10:48 schrieb Daniel Vetter:
>>>> On Wed, 12 Apr 2023 at 16:18, Christian König 
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 12.04.23 um 11:08 schrieb Daniel Vetter:
>>>>>> On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian König wrote:
>>>>>>>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
>>>>>>>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
>>>>>>>>>> When swapping out, we will split multi-order pages both in 
>>>>>>>>>> order to
>>>>>>>>>> move them to the swap-cache and to be able to return memory 
>>>>>>>>>> to the
>>>>>>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>>>>>>> Reduce the page max order to the system PMD size, as we can 
>>>>>>>>>> then be nicer
>>>>>>>>>> to the system and avoid splitting gigantic pages.
>>>>>>>>>>
>>>>>>>>>> Looking forward to when we might be able to swap out PMD size 
>>>>>>>>>> folios
>>>>>>>>>> without splitting, this will also be a benefit.
>>>>>>>>>>
>>>>>>>>>> v2:
>>>>>>>>>> - Include all orders up to the PMD size (Christian König)
>>>>>>>>>> v3:
>>>>>>>>>> - Avoid compilation errors for architectures with special 
>>>>>>>>>> PFN_SHIFTs
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Thomas Hellström 
>>>>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>>> Apparently this fails on ppc build testing. Please supply 
>>>>>>>>> build fix asap
>>>>>>>>> (or I guess we need to revert). I'm kinda not clear why this 
>>>>>>>>> only showed
>>>>>>>>> up when I merged the drm-misc-next pr into drm-next ...
>>>>>>>> I'm really wondering this as well. It looks like PMD_SHIFT 
>>>>>>>> isn't a constant
>>>>>>>> on this particular platform.
>>>>>>>>
>>>>>>>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT 
>>>>>>>> always seems
>>>>>>>> to be a constant.
>>>>>>>>
>>>>>>>> So how exactly can that here break?
>>>>>>> There's some in-flight patches to rework MAX_ORDER and other 
>>>>>>> things in
>>>>>>> linux-next, maybe it's recent? If you check out linux-next then 
>>>>>>> you need
>>>>>>> to reapply the patch (since sfr reverted it).
>>>>>> So I looked and on ppc64 PMD_SHIFT is defined in terms of
>>>>>> PTE_INDEX_SIZE, which is defined (for book3s) in terms of the 
>>>>>> variable
>>>>>> __pte_index_size. This is in 6.3 already and seems pretty old.
>>>>> Ah! I missed that one, thanks.
>>>>>
>>>>>> So revert? Or fixup patch to make this work on ppc?
>>>>> I think for now just revert or change it so that we check if 
>>>>> PMD_SHIFT
>>>>> is a constant.
>>>>>
>>>>> Thomas do you have any quick solution?
>>>> I guess Thomas is on vacations. Can you pls do the revert and push it
>>>> to drm-misc-next-fixes so this won't get lost?
>>> The offending patch hasn't showed up in drm-misc-next-fixes nor
>>> drm-misc-fixes yet. Looks like the branches are lacking behind.
>>>
>>> I can revert it on drm-misc-next, but I', not 100% sure that will then
>>> get picked up in time.
>> It's there now, Maarten forwarded drm-misc-next-fixes this morning.
>> That's why I pinged here again, trees are ready to land the revert :-)
>
> Just pushed it.
>
> Christian.

Thanks for fixing this. (I was on vacation). I got a "BUILD SUCCESS" for 
this series based on drm-misc-next so I didn't think anything weird 
would show up.

Thanks,

Thomas

>
>> -Daniel
>>
>>> Christian.
>>>
>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>
>>>> preemptively for that. Normally I think we could wait a bit more but
>>>> it's really close to merge window PR and I don't like handing too many
>>>> open things to Dave when he's back :-)
>>>> -Daniel
>>>>
>>>>> Christian.
>>>>>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/gpu/drm/ttm/ttm_pool.c | 30 
>>>>>>>>>> +++++++++++++++++++-----------
>>>>>>>>>>      1 file changed, 19 insertions(+), 11 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>>> index dfce896c4bae..18c342a919a2 100644
>>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>>> @@ -47,6 +47,11 @@
>>>>>>>>>>      #include "ttm_module.h"
>>>>>>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>>>>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>>>>>>> +/* Some architectures have a weird PMD_SHIFT */
>>>>>>>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? 
>>>>>>>>>> __TTM_DIM_ORDER : MAX_ORDER)
>>>>>>>>>> +
>>>>>>>>>>      /**
>>>>>>>>>>       * struct ttm_pool_dma - Helper object for coherent DMA 
>>>>>>>>>> mappings
>>>>>>>>>>       *
>>>>>>>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
>>>>>>>>>>      static atomic_long_t allocated_pages;
>>>>>>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>>>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>>>>>>> +static struct ttm_pool_type 
>>>>>>>>>> global_write_combined[TTM_DIM_ORDER];
>>>>>>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>>>>>>> -static struct ttm_pool_type 
>>>>>>>>>> global_dma32_write_combined[MAX_ORDER];
>>>>>>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>>>>>>> +static struct ttm_pool_type 
>>>>>>>>>> global_dma32_write_combined[TTM_DIM_ORDER];
>>>>>>>>>> +static struct ttm_pool_type 
>>>>>>>>>> global_dma32_uncached[TTM_DIM_ORDER];
>>>>>>>>>>      static spinlock_t shrinker_lock;
>>>>>>>>>>      static struct list_head shrinker_list;
>>>>>>>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, 
>>>>>>>>>> struct ttm_tt *tt,
>>>>>>>>>>              else
>>>>>>>>>>                      gfp_flags |= GFP_HIGHUSER;
>>>>>>>>>> - for (order = min_t(unsigned int, MAX_ORDER - 1, 
>>>>>>>>>> __fls(num_pages));
>>>>>>>>>> + for (order = min_t(unsigned int, TTM_MAX_ORDER, 
>>>>>>>>>> __fls(num_pages));
>>>>>>>>>>                   num_pages;
>>>>>>>>>>                   order = min_t(unsigned int, order, 
>>>>>>>>>> __fls(num_pages))) {
>>>>>>>>>>                      struct ttm_pool_type *pt;
>>>>>>>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>>>>>>>>> struct device *dev,
>>>>>>>>>>              if (use_dma_alloc) {
>>>>>>>>>>                      for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>>>> ttm_pool_type_init(&pool->caching[i].orders[j],
>>>>>>>>>>                                                         pool, 
>>>>>>>>>> i, j);
>>>>>>>>>>              }
>>>>>>>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>>>>>>              if (pool->use_dma_alloc) {
>>>>>>>>>>                      for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>>>> ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>>>>>>>>              }
>>>>>>>>>> @@ -637,7 +642,7 @@ static void 
>>>>>>>>>> ttm_pool_debugfs_header(struct seq_file *m)
>>>>>>>>>>              unsigned int i;
>>>>>>>>>>              seq_puts(m, "\t ");
>>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>>>>                      seq_printf(m, " ---%2u---", i);
>>>>>>>>>>              seq_puts(m, "\n");
>>>>>>>>>>      }
>>>>>>>>>> @@ -648,7 +653,7 @@ static void 
>>>>>>>>>> ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>>>>>>>>>>      {
>>>>>>>>>>              unsigned int i;
>>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>>>>                      seq_printf(m, " %8u", 
>>>>>>>>>> ttm_pool_type_count(&pt[i]));
>>>>>>>>>>              seq_puts(m, "\n");
>>>>>>>>>>      }
>>>>>>>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long 
>>>>>>>>>> num_pages)
>>>>>>>>>>      {
>>>>>>>>>>              unsigned int i;
>>>>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>>>>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
>>>>>>>>>> +
>>>>>>>>>>              if (!page_pool_size)
>>>>>>>>>>                      page_pool_size = num_pages;
>>>>>>>>>>              spin_lock_init(&shrinker_lock);
>>>>>>>>>>              INIT_LIST_HEAD(&shrinker_list);
>>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>>>> ttm_pool_type_init(&global_write_combined[i], NULL,
>>>>>>>>>> ttm_write_combined, i);
>>>>>>>>>> ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
>>>>>>>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
>>>>>>>>>>      {
>>>>>>>>>>              unsigned int i;
>>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>>>> ttm_pool_type_fini(&global_write_combined[i]);
>>>>>>>>>> ttm_pool_type_fini(&global_uncached[i]);
>>>>>>>>>> -- 
>>>>>>>>>> 2.39.2
>>>>>>>>>>
>>>>>>> -- 
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> http://blog.ffwll.ch
>>
>
