Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085654D4CC6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 16:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6F10E7FE;
	Thu, 10 Mar 2022 15:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC19B10E7D2;
 Thu, 10 Mar 2022 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646926162; x=1678462162;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gVGq9pgG5rukofAoVudOeifHbkS8o202PTexuCQmpzc=;
 b=Mivcyip9bGRrZaQVwkMqCrsjm+XJ2oiak+Nma7ChuIjG7kFBnHrFIa3F
 UM1oULxC6KVZyL6nqwFSLyHgc+6Mbqwpr/5IYQhQtqhL8gOGTENkU490g
 kCBENc1swOFmCH/u+ktlORougpacOxvP6AM3Lg67zV7sLoRkNGrNJ8hBF
 rQD6hMqrAIoQytBgoR4Jg9PxrvKxKIkB3Cpg2UFXF688bAjunjCRRqHGb
 60S2GQ2ldwvIDzx0Qs8oJHvGMkdbbZQGehuXHxI+I8nvDLcJwxCQpDvVA
 zbRZR8iZ66tUMNexHgAjaMZg493UCcK4yGCV5KZTnny5+GR+/K4h9RqM4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318500808"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="318500808"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 07:29:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="596695223"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO [10.252.3.1])
 ([10.252.3.1])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 07:29:19 -0800
Message-ID: <c3a4f6b5-3f61-4e52-da12-cbbe629fa080@intel.com>
Date: Thu, 10 Mar 2022 15:29:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-GB
To: Arunpravin <arunpravin.paneerselvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
 <78232c15-0d0c-3594-ab59-63560e63eb4e@intel.com>
 <1ff8a246-8df9-c098-302c-f73b4425ccbf@amd.com>
 <8909011e-d18b-03cd-aeb5-bae10db41a00@intel.com>
 <02812310-64ed-fc93-beeb-b8ee08ec14b3@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <02812310-64ed-fc93-beeb-b8ee08ec14b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/03/2022 14:47, Arunpravin wrote:
> 
> 
> On 08/03/22 10:31 pm, Matthew Auld wrote:
>> On 08/03/2022 13:59, Arunpravin wrote:
>>>
>>>
>>> On 07/03/22 10:11 pm, Matthew Auld wrote:
>>>> On 07/03/2022 14:37, Arunpravin wrote:
>>>>> place BUG_ON(order < min_order) outside do..while
>>>>> loop as it fails Unigine Heaven benchmark.
>>>>>
>>>>> Unigine Heaven has buffer allocation requests for
>>>>> example required pages are 161 and alignment request
>>>>> is 128. To allocate the remaining 33 pages, continues
>>>>> the iteration to find the order value which is 5 and
>>>>> when it compares with min_order = 7, enables the
>>>>> BUG_ON(). To avoid this problem, placed the BUG_ON
>>>>> check outside of do..while loop.
>>>>>
>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_buddy.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>> index 72f52f293249..ed94c56b720f 100644
>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>     	order = fls(pages) - 1;
>>>>>     	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>>>     
>>>>> +	BUG_ON(order < min_order);
>>>>
>>>> Isn't the issue that we are allowing a size that is not aligned to the
>>>> requested min_page_size? Should we not fix the caller(and throw a normal
>>>> error here), or perhaps add the round_up() here instead?
>>>>
>>> CASE 1:
>>> when size is not aligned to the requested min_page_size, for instance,
>>> required size = 161 pages, min_page_size = 128 pages, here we have 3
>>> possible options,
>>> a. AFAIK,This kind of situation is common in any workload,the first
>>> allocation (i.e) 128 pages is aligned to min_page_size, Should we just
>>> allocate the left over 33 pages (2 pow 5, 2 pow 0) since the caller does
>>> know the left over pages are not in min_page_size alignment?
>>
>> So IIUC looking at amdgpu_gem_create_ioctl(), userspace can specify some
>> arbitrary physical alignment for an object? Is that not meant to apply
>> to every page/chunk? The above example would only have the correct
>> physical alignment guaranteed for the first chunk, or so, is this the
>> expected ABI behaviour?
>>
> I gone through the function amdgpu_gem_create_ioctl(), it reads the
> physical alignment in bytes from userspace, does i915 round up the size
> value to the alignment or does i915 fails the allocation request if size
> is not aligned with min_page_size? If not, I think running unigine
> heaven or similar benchmark triggers BUG_ON() on current version of drm
> buddy

i915 will always round_up the obj->base.size as per the 
default_page_size. But in our case the default_page_size is selected by 
the kernel, which is always either PAGE_SIZE, or 64K on some platforms, 
due to the HW having some minimum GPU page-size for mapping VRAM pages. 
We don't currently have anything similar to 
amdgpu_gem_create_in.alignment, where userspace can request some 
arbitrary physical alignment.

>> Also looking at this some more, the other related bug here is the
>> order-- == min_order check, since it now won't bail when order == 0,
>> leading to order = -1, if we are unlucky...
> will add a fix
>>
>> Originally, if asking for min_page_size > chunk_size, then the
>> allocation was meant to fail if it can't fill the resource request with
>> pages of at least that size(and also alignment). Or at least that was
>> the original meaning in i915 IIRC.
> we can follow the same here too, failing the allocation request if size
> is not aligned with min_page_size?

Yeah, seems reasonable to me.

> 
> I added a debug print for requested num_pages from userspace and its
> alignment request and executed unigine heaven, I see many such instances
> where min_page_size is not aligned to the size, how i915 handles such
> requests?
>>
>>>
>>> b. There are many such instances in unigine heaven workload (there would
>>> be many such workloads), throwing a normal error would lower the FPS? is
>>> it possible to fix at caller application?
>>>
>>> c. adding the round_up() is possible, but in every such instances we end
>>> up allocating extra unused memory. For example, if required pages = 1028
>>> and min_page_size = 1024 pages, we end up round up of left over 4 pages
>>> to the min_page_size, so the total size would be 2048 pages.
>>>
>>>> i.e if someone does:
>>>>
>>>> alloc_blocks(mm, 0, end, 4096, 1<<16, &blocks, flags);
>>> CASE 2:
>>> I think this case should be detected (i.e) when min_page_size > size,
>>> should we return -EINVAL?
>>>>
>>>> This will still trigger the BUG_ON() even if we move it out of the loop,
>>>> AFAICT.
>>>>
>>>
>>> Should we just allow the CASE 1 proceed for the allocation and return
>>> -EINVAL for the CASE 2?
>>>
>>>>> +
>>>>>     	do {
>>>>>     		order = min(order, (unsigned int)fls(pages) - 1);
>>>>>     		BUG_ON(order > mm->max_order);
>>>>> -		BUG_ON(order < min_order);
>>>>>     
>>>>>     		do {
>>>>>     			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>>>
>>>>> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
