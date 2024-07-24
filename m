Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81AC93AF24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F69210E662;
	Wed, 24 Jul 2024 09:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3qqGkhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8010E662;
 Wed, 24 Jul 2024 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721813881; x=1753349881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9L6e//oU09Yczc0FFNvbBhPUfmvgBb03uJ7H85XFy6U=;
 b=F3qqGkhDyPCtgPeXP4JKeRF50qZfgaYqCxR1l7DNOvVBoB3z6i74d53Y
 Cx2cxhF3JZ2cWk+BOmBQRIw+S+ceHFDFD6RfEc0SeJOfJKY0EX4fYdQkw
 Jt6KO+fh6TcY/8DnT3d6HkqJ5Jm8fW3zTse08oUZnrD4/2YEO0nRqAmRn
 ycEdJAcVyHZjSSp26/m+v03QVEEk2ZwB+JaJ1VSU3ymK8+VmBeILLQl0b
 pnwIhRP0UcTliMoU0GJW2JejRKy3QppmsJP24Mq3asZHhlDipDGjAowDZ
 p8xaCXzkdSQ9pTdc9Ibc8eX27b9gOEN+J+DHg/ZH6Ysu3Ye7KXV9yiZJ1 w==;
X-CSE-ConnectionGUID: fE60E79fSAWnintN1yJPxA==
X-CSE-MsgGUID: zh1Bs5YeSvSOS83FtA17hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30900271"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="30900271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:38:00 -0700
X-CSE-ConnectionGUID: DIjXEm3OSzSssmS7lczASw==
X-CSE-MsgGUID: pSyO5d17SBWVYPjxCbsGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="83158208"
Received: from unknown (HELO [10.245.244.101]) ([10.245.244.101])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:37:57 -0700
Message-ID: <62b7fbb7-e47b-411a-b554-73f5d82cb8d8@intel.com>
Date: Wed, 24 Jul 2024 10:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Min, Frank" <frank.min@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
 <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
 <f23ebf02-b67c-4bc6-9244-730edd49fa98@intel.com>
 <CAAxE2A57f0DwdzWF2qk1U2HA8d3pN=8CqQaKFVihcmxXdUu3Vw@mail.gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CAAxE2A57f0DwdzWF2qk1U2HA8d3pN=8CqQaKFVihcmxXdUu3Vw@mail.gmail.com>
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

On 24/07/2024 02:35, Marek Olšák wrote:
> The reason is that our DCC requires 768K alignment in some cases. I 
> haven't read this patch series, but one way to do that is to align to 
> 256K, overallocate by 512K, and then not use either 0, 256K, or 512K at 
> the beginning to get to 768K alignment.

Ah, so we need a non power-of-two alignment. That makes sense, thanks.

> 
> Marek
> 
> On Tue, Jul 23, 2024, 11:04 Matthew Auld <matthew.auld@intel.com 
> <mailto:matthew.auld@intel.com>> wrote:
> 
>     On 23/07/2024 14:43, Paneer Selvam, Arunpravin wrote:
>      > Hi Matthew,
>      >
>      > Can we push this version for now as we need to mainline the DCC
>     changes
>      > ASAP,
>      > while we continue our discussion and proceed to implement the
>     permanent
>      > solution
>      > for address alignment?
> 
>     Yeah, we can always merge now and circle back around later, if this for
>     sure helps your usecase and is needed asap. I just didn't fully get the
>     idea for needing this interface, but likely I am missing something.
> 
>      >
>      > Thanks,
>      > Arun.
>      >
>      > On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:
>      >> - Add a new start parameter in trim function to specify exact
>      >>    address from where to start the trimming. This would help us
>      >>    in situations like if drivers would like to do address alignment
>      >>    for specific requirements.
>      >>
>      >> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>      >>    flag to disable the allocator trimming part. This patch enables
>      >>    the drivers control trimming and they can do it themselves
>      >>    based on the application requirements.
>      >>
>      >> v1:(Matthew)
>      >>    - check new_start alignment with min chunk_size
>      >>    - use range_overflows()
>      >>
>      >> Signed-off-by: Arunpravin Paneer Selvam
>     <Arunpravin.PaneerSelvam@amd.com
>     <mailto:Arunpravin.PaneerSelvam@amd.com>>
>      >> Acked-by: Alex Deucher <alexander.deucher@amd.com
>     <mailto:alexander.deucher@amd.com>>
>      >> Acked-by: Christian König <christian.koenig@amd.com
>     <mailto:christian.koenig@amd.com>>
>      >> ---
>      >>   drivers/gpu/drm/drm_buddy.c          | 25
>     +++++++++++++++++++++++--
>      >>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>      >>   include/drm/drm_buddy.h              |  2 ++
>      >>   3 files changed, 26 insertions(+), 3 deletions(-)
>      >>
>      >> diff --git a/drivers/gpu/drm/drm_buddy.c
>     b/drivers/gpu/drm/drm_buddy.c
>      >> index 6a8e45e9d0ec..103c185bb1c8 100644
>      >> --- a/drivers/gpu/drm/drm_buddy.c
>      >> +++ b/drivers/gpu/drm/drm_buddy.c
>      >> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct
>      >> drm_buddy *mm,
>      >>    * drm_buddy_block_trim - free unused pages
>      >>    *
>      >>    * @mm: DRM buddy manager
>      >> + * @start: start address to begin the trimming.
>      >>    * @new_size: original size requested
>      >>    * @blocks: Input and output list of allocated blocks.
>      >>    * MUST contain single block as input to be trimmed.
>      >> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct
>      >> drm_buddy *mm,
>      >>    * 0 on success, error code on failure.
>      >>    */
>      >>   int drm_buddy_block_trim(struct drm_buddy *mm,
>      >> +             u64 *start,
>      >>                u64 new_size,
>      >>                struct list_head *blocks)
>      >>   {
>      >>       struct drm_buddy_block *parent;
>      >>       struct drm_buddy_block *block;
>      >> +    u64 block_start, block_end;
>      >>       LIST_HEAD(dfs);
>      >>       u64 new_start;
>      >>       int err;
>      >> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>      >>                    struct drm_buddy_block,
>      >>                    link);
>      >> +    block_start = drm_buddy_block_offset(block);
>      >> +    block_end = block_start + drm_buddy_block_size(mm, block);
>      >> +
>      >>       if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>      >>           return -EINVAL;
>      >> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>      >>       if (new_size == drm_buddy_block_size(mm, block))
>      >>           return 0;
>      >> +    new_start = block_start;
>      >> +    if (start) {
>      >> +        new_start = *start;
>      >> +
>      >> +        if (new_start < block_start)
>      >> +            return -EINVAL;
>      >> +
>      >> +        if (!IS_ALIGNED(new_start, mm->chunk_size))
>      >> +            return -EINVAL;
>      >> +
>      >> +        if (range_overflows(new_start, new_size, block_end))
>      >> +            return -EINVAL;
>      >> +    }
>      >> +
>      >>       list_del(&block->link);
>      >>       mark_free(mm, block);
>      >>       mm->avail += drm_buddy_block_size(mm, block);
>      >> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>      >>       parent = block->parent;
>      >>       block->parent = NULL;
>      >> -    new_start = drm_buddy_block_offset(block);
>      >>       list_add(&block->tmp_link, &dfs);
>      >>       err =  __alloc_range(mm, &dfs, new_start, new_size,
>     blocks, NULL);
>      >>       if (err) {
>      >> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct
>     drm_buddy *mm,
>      >>       } while (1);
>      >>       /* Trim the allocated block to the required size */
>      >> -    if (original_size != size) {
>      >> +    if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>      >> +        original_size != size) {
>      >>           struct list_head *trim_list;
>      >>           LIST_HEAD(temp);
>      >>           u64 trim_size;
>      >> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct
>     drm_buddy *mm,
>      >>           }
>      >>           drm_buddy_block_trim(mm,
>      >> +                     NULL,
>      >>                        trim_size,
>      >>                        trim_list);
>      >> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>      >> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>      >> index fe3779fdba2c..423b261ea743 100644
>      >> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>      >> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>      >> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct
>      >> ttm_resource_manager *man,
>      >>       } while (remaining_size);
>      >>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>      >> -        if (!drm_buddy_block_trim(mm, vres->base.size,
>     &vres->blocks))
>      >> +        if (!drm_buddy_block_trim(mm, NULL, vres->base.size,
>      >> &vres->blocks))
>      >>               size = vres->base.size;
>      >>       }
>      >> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>      >> index 2a74fa9d0ce5..9689a7c5dd36 100644
>      >> --- a/include/drm/drm_buddy.h
>      >> +++ b/include/drm/drm_buddy.h
>      >> @@ -27,6 +27,7 @@
>      >>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>      >>   #define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>      >>   #define DRM_BUDDY_CLEARED            BIT(4)
>      >> +#define DRM_BUDDY_TRIM_DISABLE            BIT(5)
>      >>   struct drm_buddy_block {
>      >>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>      >> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>      >>                  unsigned long flags);
>      >>   int drm_buddy_block_trim(struct drm_buddy *mm,
>      >> +             u64 *start,
>      >>                u64 new_size,
>      >>                struct list_head *blocks);
>      >>
>      >> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
>      >
> 
