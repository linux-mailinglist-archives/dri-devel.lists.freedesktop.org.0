Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7692D1F4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0110E793;
	Wed, 10 Jul 2024 12:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiLgBPxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926B910E793;
 Wed, 10 Jul 2024 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720615826; x=1752151826;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Rf0Eeh5JDCrKQkiSgyqzvA3PfI60SaC9GcRxrFu0F6A=;
 b=TiLgBPxtkWybPe1W10RWiWI5bgOti6vWuCNQ7bupRIDe8CwfmBIF8+1M
 yAIxTWuRaRhojY7t0Zih5xcgNZ0SgkkQreQxZfzHlek3FhmV5mhi6wknc
 nqd7q+D/hWM+GFoJMu4uRfL0ARWvkQQZoqYRV3K8sdSwOzQW1WO0bb2ky
 g3e/zfL5Hco2tvVZEx4oSg9uoOd7sp3kufOoq51wsj7tAlKU6pNHOl12p
 IdfFfkNgAZJZd5nDqysSQKEHwkQwce1MTDSGju/6EVcwOy6L18oUi6NQI
 vm3YoFOpShIzgw4S3JJ8flWaToDnc6G0BD+wxK2d+RWbt/z6dks3ZBy1M w==;
X-CSE-ConnectionGUID: d3Mi7LPQTO+WaUO1uf2g8g==
X-CSE-MsgGUID: aP1KqUkRTn+OIk3tEfdHaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29332043"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="29332043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 05:50:26 -0700
X-CSE-ConnectionGUID: 8u0ndmkxQ7yqo6igpLjzLw==
X-CSE-MsgGUID: IgIvUKylTEKeueJXkL2jvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48867754"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.203])
 ([10.245.244.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 05:50:25 -0700
Message-ID: <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
Date: Wed, 10 Jul 2024 13:50:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
 <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
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

On 10/07/2024 07:03, Paneer Selvam, Arunpravin wrote:
> Thanks Alex.
> 
> Hi Matthew,
> Any comments?

Do we not pass the required address alignment when allocating the pages 
in the first place?

> 
> Thanks,
> Arun.
> 
> On 7/9/2024 1:42 AM, Alex Deucher wrote:
>> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>> - Add a new start parameter in trim function to specify exact
>>>    address from where to start the trimming. This would help us
>>>    in situations like if drivers would like to do address alignment
>>>    for specific requirements.
>>>
>>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>>    flag to disable the allocator trimming part. This patch enables
>>>    the drivers control trimming and they can do it themselves
>>>    based on the application requirements.
>>>
>>> v1:(Matthew)
>>>    - check new_start alignment with min chunk_size
>>>    - use range_overflows()
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>> Series is:
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> I'd like to take this series through the amdgpu tree if there are no
>> objections as it's required for display buffers on some chips and I'd
>> like to make sure it lands in 6.11.
>>
>> Thanks,
>>
>> Alex
>>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>>   include/drm/drm_buddy.h              |  2 ++
>>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 94f8c34fc293..8cebe1fa4e9d 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>    * drm_buddy_block_trim - free unused pages
>>>    *
>>>    * @mm: DRM buddy manager
>>> + * @start: start address to begin the trimming.
>>>    * @new_size: original size requested
>>>    * @blocks: Input and output list of allocated blocks.
>>>    * MUST contain single block as input to be trimmed.
>>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>    * 0 on success, error code on failure.
>>>    */
>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>> +                        u64 *start,
>>>                           u64 new_size,
>>>                           struct list_head *blocks)
>>>   {
>>>          struct drm_buddy_block *parent;
>>>          struct drm_buddy_block *block;
>>> +       u64 block_start, block_end;
>>>          LIST_HEAD(dfs);
>>>          u64 new_start;
>>>          int err;
>>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>                                   struct drm_buddy_block,
>>>                                   link);
>>>
>>> +       block_start = drm_buddy_block_offset(block);
>>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>>> +
>>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>>                  return -EINVAL;
>>>
>>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>          if (new_size == drm_buddy_block_size(mm, block))
>>>                  return 0;
>>>
>>> +       new_start = block_start;
>>> +       if (start) {
>>> +               new_start = *start;
>>> +
>>> +               if (new_start < block_start)
>>> +                       return -EINVAL;
>>> +
>>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>>> +                       return -EINVAL;
>>> +
>>> +               if (range_overflows(new_start, new_size, block_end))
>>> +                       return -EINVAL;
>>> +       }
>>> +
>>>          list_del(&block->link);
>>>          mark_free(mm, block);
>>>          mm->avail += drm_buddy_block_size(mm, block);
>>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>          parent = block->parent;
>>>          block->parent = NULL;
>>>
>>> -       new_start = drm_buddy_block_offset(block);
>>>          list_add(&block->tmp_link, &dfs);
>>>          err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, 
>>> NULL);
>>>          if (err) {
>>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>          } while (1);
>>>
>>>          /* Trim the allocated block to the required size */
>>> -       if (original_size != size) {
>>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>> +           original_size != size) {
>>>                  struct list_head *trim_list;
>>>                  LIST_HEAD(temp);
>>>                  u64 trim_size;
>>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                  }
>>>
>>>                  drm_buddy_block_trim(mm,
>>> +                                    NULL,
>>>                                       trim_size,
>>>                                       trim_list);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index fe3779fdba2c..423b261ea743 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>          } while (remaining_size);
>>>
>>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> -               if (!drm_buddy_block_trim(mm, vres->base.size, 
>>> &vres->blocks))
>>> +               if (!drm_buddy_block_trim(mm, NULL, vres->base.size, 
>>> &vres->blocks))
>>>                          size = vres->base.size;
>>>          }
>>>
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 82570f77e817..0c2f735f0265 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -27,6 +27,7 @@
>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION                BIT(2)
>>>   #define DRM_BUDDY_CLEAR_ALLOCATION             BIT(3)
>>>   #define DRM_BUDDY_CLEARED                      BIT(4)
>>> +#define DRM_BUDDY_TRIM_DISABLE                 BIT(5)
>>>
>>>   struct drm_buddy_block {
>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>                             unsigned long flags);
>>>
>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>> +                        u64 *start,
>>>                           u64 new_size,
>>>                           struct list_head *blocks);
>>>
>>> -- 
>>> 2.25.1
>>>
> 
