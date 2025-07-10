Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F68B004F4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 16:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EA710E21B;
	Thu, 10 Jul 2025 14:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd55rMNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D83710E21B;
 Thu, 10 Jul 2025 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752157214; x=1783693214;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cPzYruLyHkC5VoJGrl/95F28HujEa0C4GArD7CHxeA4=;
 b=Yd55rMNpt0asTvWAPa1oO/YbP/XUDt8TWWqyLR7832S7O7yrkvcZ5kUO
 tU7hcI6aHWpMx1PpZmNzY6mdg4r5M2lgKiTZKNLdevaLSiSviKb9Fm2b+
 NnZKmybGjdMJhXZOlCHhV2qCsmPJxEIO9Z40XFzdbHSJMj2wzVtcaWgoS
 ZUhvB50ysKNO+USsHIeMaofdkJSLFfL/l4OhXAa/gR2iHFUzm5rfGL1RN
 A/QPyMHFsMAaDWNgcoOmxaCeh05acHC3zUGJvazJcjkfKSjY9oT1GQZc5
 miovVW8QwaaE+re99vZAOJHktTebrGCjOFUEPBWOc1SXfNLGq5J3cmW+J g==;
X-CSE-ConnectionGUID: 5KWWorZFRNSy9ip8CtN9Ew==
X-CSE-MsgGUID: WTjU8SBtRPmGP7ebEDrAww==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65891600"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65891600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:20:13 -0700
X-CSE-ConnectionGUID: 7JXHWjbkRmuECqzs1/iilA==
X-CSE-MsgGUID: EcNl9M+2R7iGPqzEwa9Hug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187103021"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.129])
 ([10.245.244.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:20:12 -0700
Message-ID: <83353f59-fdae-432c-9071-7a05acd8a2bc@intel.com>
Date: Thu, 10 Jul 2025 15:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
 <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
 <f5386d20-326f-40ba-834f-953a0d7d18e1@intel.com>
 <16d56381-fec5-4cd8-a84c-4ce969786d9d@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <16d56381-fec5-4cd8-a84c-4ce969786d9d@amd.com>
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

On 10/07/2025 08:14, Arunpravin Paneer Selvam wrote:
> 
> On 7/8/2025 2:30 PM, Matthew Auld wrote:
>> On 08/07/2025 07:54, Arunpravin Paneer Selvam wrote:
>>> - Added a handler in DRM buddy manager to reset the cleared
>>>    flag for the blocks in the freelist.
>>>
>>> - This is necessary because, upon resuming, the VRAM becomes
>>>    cluttered with BIOS data, yet the VRAM backend manager
>>>    believes that everything has been cleared.
>>>
>>> v2:
>>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew 
>>> Auld)
>>>    - Force merge the two dirty blocks.(Matthew Auld)
>>>    - Add a new unit test case for this issue.(Matthew Auld)
>>>    - Having this function being able to flip the state either way 
>>> would be
>>>      good. (Matthew Brost)
>>>
>>> v3(Matthew Auld):
>>>    - Do merge step first to avoid the use of extra reset flag.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Cc: stable@vger.kernel.org
>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Is this RB also for the unit test case (patch 3).

Feel free to apply my r-b there also.

> 
> Thanks,
> 
> Arun.
> 
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>>   include/drm/drm_buddy.h                      |  2 +
>>>   5 files changed, 65 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/ 
>>> gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index a59f194e3360..b89e46f29b51 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device 
>>> *dev, bool notify_clients)
>>>           dev->dev->power.disable_depth--;
>>>   #endif
>>>       }
>>> +
>>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>>       adev->in_suspend = false;
>>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/ 
>>> drm/amd/amdgpu/amdgpu_ttm.h
>>> index 208b7d1d8a27..450e4bf093b7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct 
>>> amdgpu_vram_mgr *mgr,
>>>                     uint64_t start, uint64_t size);
>>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>                         uint64_t start);
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>>                   struct ttm_resource *res);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/ 
>>> gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index abdc52b0895a..07c936e90d8e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct 
>>> amdgpu_vram_mgr *mgr)
>>>       return atomic64_read(&mgr->vis_usage);
>>>   }
>>>   +/**
>>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>>> + *
>>> + * @adev: amdgpu device pointer
>>> + *
>>> + * Reset the cleared drm buddy blocks.
>>> + */
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>>> +{
>>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>> +    struct drm_buddy *mm = &mgr->mm;
>>> +
>>> +    mutex_lock(&mgr->lock);
>>> +    drm_buddy_reset_clear(mm, false);
>>> +    mutex_unlock(&mgr->lock);
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for 
>>> intersection
>>>    *
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index a1e652b7631d..a94061f373de 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>   }
>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>   +/**
>>> + * drm_buddy_reset_clear - reset blocks clear state
>>> + *
>>> + * @mm: DRM buddy manager
>>> + * @is_clear: blocks clear state
>>> + *
>>> + * Reset the clear state based on @is_clear value for each block
>>> + * in the freelist.
>>> + */
>>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>> +{
>>> +    u64 root_size, size, start;
>>> +    unsigned int order;
>>> +    int i;
>>> +
>>> +    size = mm->size;
>>> +    for (i = 0; i < mm->n_roots; ++i) {
>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>> +        start = drm_buddy_block_offset(mm->roots[i]);
>>> +        __force_merge(mm, start, start + size, order);
>>> +
>>> +        root_size = mm->chunk_size << order;
>>> +        size -= root_size;
>>> +    }
>>> +
>>> +    for (i = 0; i <= mm->max_order; ++i) {
>>> +        struct drm_buddy_block *block;
>>> +
>>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>>> +                if (is_clear) {
>>> +                    mark_cleared(block);
>>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>>> +                } else {
>>> +                    clear_reset(block);
>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>>> +
>>>   /**
>>>    * drm_buddy_free_block - free a block
>>>    *
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 9689a7c5dd36..513837632b7d 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>                u64 new_size,
>>>                struct list_head *blocks);
>>>   +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>>> +
>>>   void drm_buddy_free_block(struct drm_buddy *mm, struct 
>>> drm_buddy_block *block);
>>>     void drm_buddy_free_list(struct drm_buddy *mm,
>>

