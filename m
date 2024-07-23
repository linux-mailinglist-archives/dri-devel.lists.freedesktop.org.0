Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30093A379
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 17:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4A410E5EE;
	Tue, 23 Jul 2024 15:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mf84hiLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF7310E5E9;
 Tue, 23 Jul 2024 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721747074; x=1753283074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z6dwSWk1WjEescjyQW++iIBgR8gbKpbChlsHIuy8aFE=;
 b=Mf84hiLWL0DRbs/UXIUeUUasXGl2juzbeNHmoKY7aKMZT6AQmYPk2aZp
 mEz0OWmI4YKOabe5pnGmbOUZ5ynennu2TcdpwjjmZ/M/cZWA9W1y/Even
 BhZOpPIXciG75txSI3HUSezK3NN1R87zKjKg0P4TzelReETpNnWBdSuAU
 sXOtqMf2ZdlZBBNGTkamDOwOmiBifmDcrL02yMcfHPc4wDr7ToH1EFRdr
 0uX1GyOlmiY/o1r2SPR9w4jQpKwGFKe7IsiGybMNLXryvBLezS+5xKqqy
 bWPWfR/LJEL0Z4R8Bio/xKIky3zwPFbqVmE8nJHWujzh6xks+pvoAgpAI g==;
X-CSE-ConnectionGUID: B1LuQlroSe6KGzIFJicnew==
X-CSE-MsgGUID: FvKPvPsbTee1hMy87DpnGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19527227"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19527227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:04:33 -0700
X-CSE-ConnectionGUID: GChzbPPWSeibCUHkK8VT2g==
X-CSE-MsgGUID: lPXtIzwGQYu951MmUKUe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="75470616"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.253])
 ([10.245.245.253])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:04:32 -0700
Message-ID: <f23ebf02-b67c-4bc6-9244-730edd49fa98@intel.com>
Date: Tue, 23 Jul 2024 16:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
 <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
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

On 23/07/2024 14:43, Paneer Selvam, Arunpravin wrote:
> Hi Matthew,
> 
> Can we push this version for now as we need to mainline the DCC changes 
> ASAP,
> while we continue our discussion and proceed to implement the permanent 
> solution
> for address alignment?

Yeah, we can always merge now and circle back around later, if this for 
sure helps your usecase and is needed asap. I just didn't fully get the 
idea for needing this interface, but likely I am missing something.

> 
> Thanks,
> Arun.
> 
> On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:
>> - Add a new start parameter in trim function to specify exact
>>    address from where to start the trimming. This would help us
>>    in situations like if drivers would like to do address alignment
>>    for specific requirements.
>>
>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>    flag to disable the allocator trimming part. This patch enables
>>    the drivers control trimming and they can do it themselves
>>    based on the application requirements.
>>
>> v1:(Matthew)
>>    - check new_start alignment with min chunk_size
>>    - use range_overflows()
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>   include/drm/drm_buddy.h              |  2 ++
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 6a8e45e9d0ec..103c185bb1c8 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>    * drm_buddy_block_trim - free unused pages
>>    *
>>    * @mm: DRM buddy manager
>> + * @start: start address to begin the trimming.
>>    * @new_size: original size requested
>>    * @blocks: Input and output list of allocated blocks.
>>    * MUST contain single block as input to be trimmed.
>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>    * 0 on success, error code on failure.
>>    */
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +             u64 *start,
>>                u64 new_size,
>>                struct list_head *blocks)
>>   {
>>       struct drm_buddy_block *parent;
>>       struct drm_buddy_block *block;
>> +    u64 block_start, block_end;
>>       LIST_HEAD(dfs);
>>       u64 new_start;
>>       int err;
>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>                    struct drm_buddy_block,
>>                    link);
>> +    block_start = drm_buddy_block_offset(block);
>> +    block_end = block_start + drm_buddy_block_size(mm, block);
>> +
>>       if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>           return -EINVAL;
>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (new_size == drm_buddy_block_size(mm, block))
>>           return 0;
>> +    new_start = block_start;
>> +    if (start) {
>> +        new_start = *start;
>> +
>> +        if (new_start < block_start)
>> +            return -EINVAL;
>> +
>> +        if (!IS_ALIGNED(new_start, mm->chunk_size))
>> +            return -EINVAL;
>> +
>> +        if (range_overflows(new_start, new_size, block_end))
>> +            return -EINVAL;
>> +    }
>> +
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       parent = block->parent;
>>       block->parent = NULL;
>> -    new_start = drm_buddy_block_offset(block);
>>       list_add(&block->tmp_link, &dfs);
>>       err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>       if (err) {
>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       } while (1);
>>       /* Trim the allocated block to the required size */
>> -    if (original_size != size) {
>> +    if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>> +        original_size != size) {
>>           struct list_head *trim_list;
>>           LIST_HEAD(temp);
>>           u64 trim_size;
>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           }
>>           drm_buddy_block_trim(mm,
>> +                     NULL,
>>                        trim_size,
>>                        trim_list);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index fe3779fdba2c..423b261ea743 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       } while (remaining_size);
>>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> -        if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
>> +        if (!drm_buddy_block_trim(mm, NULL, vres->base.size, 
>> &vres->blocks))
>>               size = vres->base.size;
>>       }
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 2a74fa9d0ce5..9689a7c5dd36 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -27,6 +27,7 @@
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>   #define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>   #define DRM_BUDDY_CLEARED            BIT(4)
>> +#define DRM_BUDDY_TRIM_DISABLE            BIT(5)
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                  unsigned long flags);
>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>> +             u64 *start,
>>                u64 new_size,
>>                struct list_head *blocks);
>>
>> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
> 
