Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1B4B149B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BFA10E8B7;
	Thu, 10 Feb 2022 17:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A4810E15F;
 Thu, 10 Feb 2022 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644515566; x=1676051566;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eXbaFa6+I6t3kBzAaD/RBRfzcarOKdsiP3RTTsAEM9I=;
 b=cz1KlfYOzMXgKqCMoysZzrqS5UYcg+9LQnzVGsSe4tYNQ1MFlSjKKpK4
 strSbPBpeLCM3ZBXgiTsqkag8z4HDCkxEeky7YejkAlezfIsIi4C+V9mV
 HVmPRabW/qyEOxJYiqH/OJ687wmJC79hsa175uvGSOamOU2WiKHKeBJ9a
 5Errjclu9zjrYj0EAcaMhAdyZyf0F7NO/ACXbJtLEn9Sh6qdgwwRL+eIB
 fNu8afJggjWesM/SP4msV9xVQB1KCR6syvhIkSQfsN/ZL6keuh5hWJAVQ
 KwacHtuRVV8xmaOQaZjhd5UgFx7HrxaPVINDR4hKdySscuAKaEDnAi4SP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="233109827"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="233109827"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 09:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="633758736"
Received: from paulbarr-mobl2.ger.corp.intel.com (HELO [10.252.11.226])
 ([10.252.11.226])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 09:52:42 -0800
Message-ID: <0524e7ef-5d04-c241-adb1-2a81505dd1aa@intel.com>
Date: Thu, 10 Feb 2022 17:52:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 5/5] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-GB
To: Arunpravin <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
 <20220127141107.173692-5-Arunpravin.PaneerSelvam@amd.com>
 <CAM0jSHOdMDQvWxGyHfW01UAe-x_eefFQSJnzU43=t6qL_Ec77g@mail.gmail.com>
 <c842bcfc-80ff-fafa-7242-cfca3ed65087@amd.com>
 <b9d3da49-a02e-82d4-66c5-d95f824873cd@gmail.com>
 <46c843dd-3171-9448-3a7e-590c8c23844d@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <46c843dd-3171-9448-3a7e-590c8c23844d@amd.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/02/2022 11:20, Arunpravin wrote:
> 
> 
> On 04/02/22 6:53 pm, Christian König wrote:
>> Am 04.02.22 um 12:22 schrieb Arunpravin:
>>> On 28/01/22 7:48 pm, Matthew Auld wrote:
>>>> On Thu, 27 Jan 2022 at 14:11, Arunpravin
>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>> - Remove drm_mm references and replace with drm buddy functionalities
>>>>> - Add res cursor support for drm buddy
>>>>>
>>>>> v2(Matthew Auld):
>>>>>     - replace spinlock with mutex as we call kmem_cache_zalloc
>>>>>       (..., GFP_KERNEL) in drm_buddy_alloc() function
>>>>>
>>>>>     - lock drm_buddy_block_trim() function as it calls
>>>>>       mark_free/mark_split are all globally visible
>>>>>
>>>>> v3(Matthew Auld):
>>>>>     - remove trim method error handling as we address the failure case
>>>>>       at drm_buddy_block_trim() function
>>>>>
>>>>> v4:
>>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>>
>>>>> v5:
>>>>>     - fix merge conflict issue
>>>>>
>>>>> v6:
>>>>>     - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>>
>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/Kconfig                       |   1 +
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   7 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 259 ++++++++++--------
>>>>>    4 files changed, 231 insertions(+), 133 deletions(-)
>>>> <snip>
>>>>
>>>>> -/**
>>>>> - * amdgpu_vram_mgr_virt_start - update virtual start address
>>>>> - *
>>>>> - * @mem: ttm_resource to update
>>>>> - * @node: just allocated node
>>>>> - *
>>>>> - * Calculate a virtual BO start address to easily check if everything is CPU
>>>>> - * accessible.
>>>>> - */
>>>>> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
>>>>> -                                      struct drm_mm_node *node)
>>>>> -{
>>>>> -       unsigned long start;
>>>>> -
>>>>> -       start = node->start + node->size;
>>>>> -       if (start > mem->num_pages)
>>>>> -               start -= mem->num_pages;
>>>>> -       else
>>>>> -               start = 0;
>>>>> -       mem->start = max(mem->start, start);
>>>>> -}
>>>>> -
>>>>>    /**
>>>>>     * amdgpu_vram_mgr_new - allocate new ranges
>>>>>     *
>>>>> @@ -366,13 +357,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>                                  const struct ttm_place *place,
>>>>>                                  struct ttm_resource **res)
>>>>>    {
>>>>> -       unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
>>>>> +       unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
>>>>> +       u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
>>>>>           struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>>>           struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>>>> -       uint64_t vis_usage = 0, mem_bytes, max_bytes;
>>>>> -       struct ttm_range_mgr_node *node;
>>>>> -       struct drm_mm *mm = &mgr->mm;
>>>>> -       enum drm_mm_insert_mode mode;
>>>>> +       struct amdgpu_vram_mgr_node *node;
>>>>> +       struct drm_buddy *mm = &mgr->mm;
>>>>> +       struct drm_buddy_block *block;
>>>>>           unsigned i;
>>>>>           int r;
>>>>>
>>>>> @@ -391,10 +382,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>                   goto error_sub;
>>>>>           }
>>>>>
>>>>> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>>                   pages_per_node = ~0ul;
>>>>> -               num_nodes = 1;
>>>>> -       } else {
>>>>> +       else {
>>>>>    #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>>                   pages_per_node = HPAGE_PMD_NR;
>>>>>    #else
>>>>> @@ -403,11 +393,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>    #endif
>>>>>                   pages_per_node = max_t(uint32_t, pages_per_node,
>>>>>                                          tbo->page_alignment);
>>>>> -               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>>>>>           }
>>>>>
>>>>> -       node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
>>>>> -                       GFP_KERNEL | __GFP_ZERO);
>>>>> +       node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>>>           if (!node) {
>>>>>                   r = -ENOMEM;
>>>>>                   goto error_sub;
>>>>> @@ -415,9 +403,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>
>>>>>           ttm_resource_init(tbo, place, &node->base);
>>>>>
>>>>> -       mode = DRM_MM_INSERT_BEST;
>>>>> +       INIT_LIST_HEAD(&node->blocks);
>>>>> +
>>>>>           if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>>>> -               mode = DRM_MM_INSERT_HIGH;
>>>>> +               node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>>>> +
>>>>> +       if (place->fpfn || lpfn != man->size)
>>>>> +               /* Allocate blocks in desired range */
>>>>> +               node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>>> +
>>>>> +       min_page_size = mgr->default_page_size;
>>>>> +       BUG_ON(min_page_size < mm->chunk_size);
>>>>>
>>>>>           pages_left = node->base.num_pages;
>>>>>
>>>>> @@ -425,36 +421,61 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>           pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>>>
>>>>>           i = 0;
>>>>> -       spin_lock(&mgr->lock);
>>>>>           while (pages_left) {
>>>>> -               uint32_t alignment = tbo->page_alignment;
>>>>> -
>>>>>                   if (pages >= pages_per_node)
>>>>> -                       alignment = pages_per_node;
>>>>> -
>>>>> -               r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>>>> -                                               alignment, 0, place->fpfn,
>>>>> -                                               lpfn, mode);
>>>>> -               if (unlikely(r)) {
>>>>> -                       if (pages > pages_per_node) {
>>>>> -                               if (is_power_of_2(pages))
>>>>> -                                       pages = pages / 2;
>>>>> -                               else
>>>>> -                                       pages = rounddown_pow_of_two(pages);
>>>>> -                               continue;
>>>>> -                       }
>>>>> -                       goto error_free;
>>>>> +                       pages = pages_per_node;
>>>>> +
>>>>> +               n_pages = pages;
>>>>> +
>>>>> +               if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>> +                       n_pages = roundup_pow_of_two(n_pages);
>>>>> +                       min_page_size = (u64)n_pages << PAGE_SHIFT;
>>>>> +
>>>>> +                       if (n_pages > lpfn)
>>>>> +                               lpfn = n_pages;
>>>>>                   }
>>>>>
>>>>> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>>>> -               amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>>>> +               mutex_lock(&mgr->lock);
>>>>> +               r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>>> +                                          (u64)lpfn << PAGE_SHIFT,
>>>>> +                                          (u64)n_pages << PAGE_SHIFT,
>>>>> +                                          min_page_size,
>>>>> +                                          &node->blocks,
>>>>> +                                          node->flags);
>>>>> +               mutex_unlock(&mgr->lock);
>>>>> +               if (unlikely(r))
>>>>> +                       goto error_free_blocks;
>>>>> +
>>>>>                   pages_left -= pages;
>>>>>                   ++i;
>>>>>
>>>>>                   if (pages > pages_left)
>>>>>                           pages = pages_left;
>>>>>           }
>>>>> -       spin_unlock(&mgr->lock);
>>>>> +
>>>>> +       /* Free unused pages for contiguous allocation */
>>>>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>> +               u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
>>>>> +
>>>>> +               mutex_lock(&mgr->lock);
>>>>> +               drm_buddy_block_trim(mm,
>>>>> +                                    actual_size,
>>>>> +                                    &node->blocks);
>>>>> +               mutex_unlock(&mgr->lock);
>>>>> +       }
>>>>> +
>>>>> +       list_for_each_entry(block, &node->blocks, link)
>>>>> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>>>>> +
>>>>> +       block = list_first_entry_or_null(&node->blocks,
>>>>> +                                        struct drm_buddy_block,
>>>>> +                                        link);
>>>>> +       if (!block) {
>>>>> +               r = -ENOENT;
>>>>> +               goto error_free_res;
>>>>> +       }
>>>>> +
>>>>> +       node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
>>>> Hmm, does this work? It looks like there are various places checking
>>>> that res->start + res->num_pages <= visible_size, which IIUC should
>>>> only return true when the entire object is placed in the mappable
>>>> portion. i915 is doing something similar. Also it looks like
>>>> ttm_resource_compat() is potentially relying on this, like when moving
>>>> something from non-mappable -> mappable in
>>>> amdgpu_bo_fault_reserve_notify()?
>>>>
>>>> Perhaps something like:
>>>>
>>>> if (vis_usage == num_pages)
>>>>       base.start = 0;
>>>> else
>>>>       base.start = visible_size;
>>>>
>>>> Otherwise I guess just keep amdgpu_vram_mgr_virt_start()?
>>>>
>>> hmm, I wonder how it works, may be we didn't go through the corner case
>>> where res->start + res->num_pages > visible_size
>>>
>>> in amdgpu if AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED flag is enabled, we
>>> set the ttm_place.lpfn = visible_pfn at
>>> amdgpu_bo_placement_from_domain(). Hence, in amdgpu_vram_mgr_new()
>>> function DRM_BUDDY_RANGE_ALLOCATION flag is enabled, which calls the
>>> alloc_range_bias() in drm_buddy.c.
>>>
>>> Here we get blocks chained together in random order complying
>>> visible_pfn range. say for instance num_pages = 13
>>> we may get,
>>> Block 1 addr - 500 (order-3)
>>> Block 2 addr - 400 (order-2)
>>> Block 3 addr - 600 (order-0)
>>>
>>> I think currently base.start = Block 1 start address fetched from the
>>> list and the address 500 assigned to it, which is good for the resource
>>> access since we access the blocks using the list link
>>>
>>> But for the check res->start + res->num_pages <= visible_size in few
>>> places, this doesn't work. AFAIK, keeping amdgpu_vram_mgr_virt_start()
>>> doesn't work since the function looks for nodes in continuous address to
>>> calculate the start address. AFAIK, assigning the start address (400 +
>>> num_pages <= visible_size) mislead in our case since we use linked list
>>>
>>> how about replacing the check with a bool type return function which
>>> checks the each block start address + block size <= visible_size?
>>
>> Yeah, we already have that in the TTM code. It's just not used
>> everywhere IIRC.
> 
> Hi Christian,
> here we have a problem, many places in ttm and amdgpu, we are using the
> tbo->resource->start + bo->resource->num_pages operation, this doesn't
> work in case of drm buddy since it allocates blocks in different
> locations which are chained together using linked list.

AFAICT that was already the case with the existing code, since it looks 
like you can get an array of discontinuous drm_mm blocks. 
amdgpu_vram_mgr_virt_start() looks to be handling that by creating 
fake/virtual res->start offset, which is effectively the maximum end pfn 
over the range of drm_mm blocks(whilst also accounting for num_pages), 
and yes if there are multiple blocks then the res->start might be more 
of a "virtual" offset. AFAIK that scheme should also work as-is with the 
buddy.

>>
>> The node->start can just be set to the invalid offset for now and should
>> be removed as soon as we don't need it any more.
> Assigning the start block offset to resource->start doesn't work,
> If we set node->start to invalid offset, we get an incorrect value?
>>
>> Regards,
>> Christian.
