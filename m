Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2C3B04AD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8766E4E3;
	Tue, 22 Jun 2021 12:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550FA6E4D7;
 Tue, 22 Jun 2021 12:36:37 +0000 (UTC)
IronPort-SDR: cCtNR0yjcaFTdBVoJNggZhgSa7gdhKx57Ejtf/UF0c2sPDsSUD522d4ZJVIyzjV59fngR0RxHG
 Sa91Z4a/H5hw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="187425652"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="187425652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 05:36:36 -0700
IronPort-SDR: +N4rMsPQaqwFqXz1uIoPoN68a673jgDkS5yGMkDFxfVBe/wlQOmpePxK+sGQnVnIc3SwVrJbZe
 kvyXtl4DUkkQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452600489"
Received: from ctuckwel-mobl3.ger.corp.intel.com (HELO [10.213.202.56])
 ([10.213.202.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 05:36:35 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: consider all placements for the
 page alignment
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210622095843.132549-1-matthew.auld@intel.com>
 <1aeeac85-07d7-b6d5-4253-386801088307@linux.intel.com>
 <CAM0jSHOmtdAQ3GVzjAJxa9ZrdFYTuh78gy4Vbzhzf-r=9bofWw@mail.gmail.com>
 <96142f5a-6330-6a61-abef-c03c301425f3@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <c1532ab1-a940-1a8a-cdbb-0d55761826ee@intel.com>
Date: Tue, 22 Jun 2021 13:36:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <96142f5a-6330-6a61-abef-c03c301425f3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2021 13:29, Thomas Hellström wrote:
> 
> On 6/22/21 2:15 PM, Matthew Auld wrote:
>> On Tue, 22 Jun 2021 at 11:11, Thomas Hellström
>> <thomas.hellstrom@linux.intel.com> wrote:
>>>
>>> On 6/22/21 11:58 AM, Matthew Auld wrote:
>>>> Just checking the current region is not enough, if we later migrate the
>>>> object somewhere else. For example if the placements are {SMEM, LMEM},
>>>> then we might get this wrong. Another idea might be to make the
>>>> page_alignment part of the ttm_place, instead of the BO.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 21 ++++++++++++++++++++-
>>>>    1 file changed, 20 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> index c5deb8b7227c..5d894bba6430 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> @@ -753,6 +753,25 @@ void i915_ttm_bo_destroy(struct 
>>>> ttm_buffer_object *bo)
>>>>                call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
>>>>    }
>>>>
>>>> +static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +     u64 page_size;
>>>> +     int i;
>>>> +
>>>> +     if (!obj->mm.n_placements)
>>>> +             return obj->mm.region->min_page_size;
>>>> +
>>>> +     page_size = 0;
>>>> +     for (i = 0; i < obj->mm.n_placements; i++) {
>>>> +             struct intel_memory_region *mr = obj->mm.placements[i];
>>>> +
>>>> +             page_size = max_t(u64, mr->min_page_size, page_size);
>>>> +     }
>>>> +
>>>> +     GEM_BUG_ON(!page_size);
>>>> +     return page_size;
>>>> +}
>>>> +
>>>>    /**
>>>>     * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem 
>>>> object
>>>>     * @mem: The initial memory region for the object.
>>>> @@ -793,7 +812,7 @@ int __i915_gem_ttm_object_init(struct 
>>>> intel_memory_region *mem,
>>>>        obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>>>>        ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>>>>                          bo_type, &i915_sys_placement,
>>>> -                       mem->min_page_size >> PAGE_SHIFT,
>>>> +                       i915_gem_object_page_size(obj) >> PAGE_SHIFT,
>>> Hmm, can't we just have the buddy manager silently enforce its
>>> min_page_size?
>> Maybe, but we need some way of overriding it for all of our page-table
>> allocations(and some other stuff also), so being able to control the
>> page_alignment at the object level here seems reasonable? Could maybe
>> pass it through with create_lmem_with_page_size(..., page_size)? Ok,
>> it might be best to first type it and then see how it will all fit
>> together.
>>
> Hmm, OK, I'm not 100% sure what the various requirements are here on the 
> object level. But for region requirements, I think we've historically 
> enforced that through the manager, taking also the bo->page_alignment 
> into account and applying the larger of the two,
> 
> There is an example in vmw_thp_insert_aligned().

Yeah, so for our use case we need to support page_alignment < 
min_page_size, for page-tables(4K). I guess pushing the min_page_size 
into buddy_man, and then letting page_alignment override that, with the 
added caveat that it can be smaller could work. Otherwise just using 
mm.chunk_size would already fit the bill quite nicely.

> 
> /Thomas
> 
> 
