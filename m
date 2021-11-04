Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1944509C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A9A6ED0D;
	Thu,  4 Nov 2021 08:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0450E6ED00;
 Thu,  4 Nov 2021 08:49:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231511594"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="231511594"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 01:49:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="729230571"
Received: from crequinx-mobl1.ger.corp.intel.com (HELO [10.252.18.168])
 ([10.252.18.168])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 01:49:29 -0700
Message-ID: <40e7dc08-9d5c-4ddb-3875-e018eb2791b9@intel.com>
Date: Thu, 4 Nov 2021 08:49:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/8] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-6-Arunpravin.PaneerSelvam@amd.com>
 <55adb714-45f9-5af5-33df-ce4f4526a8c8@intel.com>
 <3b5fb9bb-13a0-a7db-cea2-1515aec96742@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <3b5fb9bb-13a0-a7db-cea2-1515aec96742@amd.com>
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2021 07:34, Christian König wrote:
> 
> 
> Am 03.11.21 um 20:25 schrieb Matthew Auld:
>> On 25/10/2021 14:00, Arunpravin wrote:
>>> - Remove drm_mm references and replace with drm buddy functionalities
>>> - Add res cursor support for drm buddy
>>>
>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>
>> <snip>
>>
>>> +        spin_lock(&mgr->lock);
>>> +        r = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
>>> +                    (uint64_t)lpfn << PAGE_SHIFT,
>>> +                    (uint64_t)n_pages << PAGE_SHIFT,
>>> +                     min_page_size, &node->blocks,
>>> +                     node->flags);
>>
>>
>> Is spinlock + GFP_KERNEL allowed?
> 
> Nope it isn't, but does that function really calls kmalloc()?

It calls kmem_cache_zalloc(..., GFP_KERNEL)

> 
> Christian.
> 
>>
>>> +        spin_unlock(&mgr->lock);
>>> +
>>> +        if (unlikely(r))
>>> +            goto error_free_blocks;
>>> +
>>>           pages_left -= pages;
>>>           ++i;
>>>             if (pages > pages_left)
>>>               pages = pages_left;
>>>       }
>>> -    spin_unlock(&mgr->lock);
>>> +
>>> +    /* Free unused pages for contiguous allocation */
>>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> +        uint64_t actual_size = (uint64_t)node->base.num_pages << 
>>> PAGE_SHIFT;
>>> +
>>> +        r = drm_buddy_free_unused_pages(mm,
>>> +                        actual_size,
>>> +                        &node->blocks);
>>
>> Needs some locking.
> 
