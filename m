Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBC69F5F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 14:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FF010E9A5;
	Wed, 22 Feb 2023 13:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66F110E9A5;
 Wed, 22 Feb 2023 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677074086; x=1708610086;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pu8KT0HJXdQdCveCdk+Zny18DWgwpPZzitZNIyuPn5k=;
 b=iAeBe3tAky+Kg1ZOH1bp6OZa5tReREXyzEfawQ99N5v3SWdf1O3vfeqI
 oFkzzyBTl9RfMsZEnHHdu1OOKdkrn/wUOcEeC1J7ZiL47+21dhZ7jKjC1
 XYENE89MfzjIl5/0RLD8g2GGptM3LSEh5oiV3gmyryw7pCKQS2ajLHm+o
 6+7mZWrzOVXS+55sMSOEOBsQ400SKFrwu+JBf2kRchdblLpPLB8Pvc0oR
 ekku2IwhRbEriZhW+juOlEiLwrBwncnyJC50iF07YVj1wdKBz5kz1qZB/
 CF5VBNWI+3TUnkU4jrNxPHA2H17+N56u2mSvPmi1O4b/4J+iYYz8YFGmU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395410379"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="395410379"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 05:54:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001004017"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="1001004017"
Received: from abibas-mobl.ger.corp.intel.com (HELO [10.249.254.220])
 ([10.249.254.220])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 05:54:43 -0800
Message-ID: <b246a499-2d00-32a6-4e75-f31e311afa9a@linux.intel.com>
Date: Wed, 22 Feb 2023 14:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Intel-xe] [PATCH 1/3] drm/suballoc: Introduce a generic
 suballocation manager
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
 <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
 <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
 <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
 <1ca4881b-c470-1f59-03c9-edcddbaa7a6a@linux.intel.com>
 <24ada492-c951-46ad-6771-3af88caf2fb3@linux.intel.com>
 <592a66a8-2265-ec51-b38e-baf7fd005e6e@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <592a66a8-2265-ec51-b38e-baf7fd005e6e@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/22/23 12:39, Christian König wrote:
> Hi Thomas,
>
> Am 22.02.23 um 12:00 schrieb Thomas Hellström:
>> Hi, Christian,
>>
>> So I resurrected Maarten's previous patch series around this (the 
>> amdgpu suballocator) slightly modified the code to match the API of 
>> this patch series, re-introduced the per-allocation alignment as per 
>> a previous review comment from you on that series, and made 
>> checkpatch.pl pass mostly, except for pre-existing style problems, 
>> and added / fixed some comments. No memory corruption seen so far on 
>> limited Xe testing.
>>
>> To move this forward I suggest starting with that as a common drm 
>> suballocator. I'll post the series later today. We can follow up with 
>> potential simplifactions lif needed.
>>
>> I also made a kunit test also reporting some timing information. Will 
>> post that as a follow up. Some interesting preliminary conclusions:
>>
>> * drm_mm is per se not a cpu hog, If the rb tree processing is 
>> disabled and the EVICT algorithm is changed from MRU to ring-like LRU 
>> traversal, it's more or less just as fast as the ring suballocator.
>>
>> * With a single ring, and the suballocation buffer never completely 
>> filled (no sleeps) the amd suballocator is a bit faster per 
>> allocation / free. (Around 250 ns instead of 350). Allocation is 
>> slightly slower on the amdgpu one, freeing is faster, mostly due to 
>> the locking overhead incurred when setting up the fence callbacks, 
>> and for avoiding irq-disabled processing on the one I proposed.
>
> For some more realistic numbers try to signal the fence from another 
> CPU. Alternative you can invalidate all the CPU read cache lines 
> touched by the fence callback so that they need to be read in again 
> from the allocating CPU.

Fences are signalled using hr-timer driven fake "ring"s, so should 
probably be distributed among cpus in a pretty realistic way. But anyway 
I agree results obtained from that kunit test can and should be 
challenged before we actually use them for improvements.

>
>>
>> * With multiple rings and varying allocation sizes and signalling 
>> times creating fragmentation, the picture becomes different as the 
>> amdgpu allocator starts to sleep/throttle already round 50% - 75% 
>> fill. The one I proposed between 75% to 90% fill, and once that 
>> happens, the CPU cost of putting to sleep and waking up should really 
>> shadow the above numbers.
>>
>> So it's really a tradeoff. Where IMO also code size and 
>> maintainability should play a role.
>>
>> Also I looked at the history of the amdgpu allocator originating back 
>> to Radeon 2012-ish, but couldn't find any commits mentioning fence 
>> callbacks nor problem with those. Could you point me to that discussion?
>
> Uff that was ~10 years ago. I don't think I can find that again.

OK, fair enough. But what was the objective reasoning against using 
fence callbacks for this sort of stuff, was it unforeseen locking 
problems, caching issues or something else?

Thanks,

Thomas



>
>
> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>
>> On 2/17/23 14:51, Thomas Hellström wrote:
>>>
>>> On 2/17/23 14:18, Christian König wrote:
>>>> Am 17.02.23 um 14:10 schrieb Thomas Hellström:
>>>>> [SNIP]
>>>>>>>>>
>>>>>>>>> Any chance you could do a quick performance comparison? If 
>>>>>>>>> not, anything against merging this without the amd / radeon 
>>>>>>>>> changes until we can land a simpler allocator?
>>>>>>>>
>>>>>>>> Only if you can stick the allocator inside Xe and not drm, 
>>>>>>>> cause this seems to be for a different use case than the 
>>>>>>>> allocators inside radeon/amdgpu.
>>>>>>>
>>>>>>> Hmm. No It's allocating in a ring-like fashion as well. Let me 
>>>>>>> put together a unit test for benchmaking. I think it would be a 
>>>>>>> failure for the community to end up with three separate 
>>>>>>> suballocators doing the exact same thing for the same problem, 
>>>>>>> really.
>>>>>>
>>>>>> Well exactly that's the point. Those allocators aren't the same 
>>>>>> because they handle different problems.
>>>>>>
>>>>>> The allocator in radeon is simpler because it only had to deal 
>>>>>> with a limited number of fence timelines. The one in amdgpu is a 
>>>>>> bit more complex because of the added complexity for more fence 
>>>>>> timelines.
>>>>>>
>>>>>> We could take the one from amdgpu and use it for radeon and 
>>>>>> others as well, but the allocator proposed here doesn't even 
>>>>>> remotely matches the requirements.
>>>>>
>>>>> But again, what *are* those missing requirements exactly? What is 
>>>>> the pathological case you see for the current code?
>>>>
>>>> Well very low CPU overhead and don't do anything in a callback.
>>>
>>> Well, dma_fence_wait_any() will IIRC register callbacks on all 
>>> affected fences, although admittedly there is no actual allocator 
>>> processing in them.
>>>
>>>>
>>>>>
>>>>> From what I can tell the amdgpu suballocator introduces excessive 
>>>>> complexity to coalesce waits for fences from the same contexts, 
>>>>> whereas the present code just frees from the fence callback if the 
>>>>> fence wasn't already signaled.
>>>>
>>>> And this is exactly the design we had previously which we removed 
>>>> after Dave stumbled over tons of problems with it.
>>>
>>> So is the worry that those problems have spilled over in this code 
>>> then? It's been pretty extensively tested, or is it you should never 
>>> really use dma-fence callbacks?
>>>
>>>>
>>>>> The fence signalling code that fires that callback is typcally 
>>>>> always run anyway on scheduler fences.
>>>>>
>>>>> The reason we had for not using the amdgpu suballocator as 
>>>>> originally planned was that this complexity made it very hard for 
>>>>> us to undertand it and to fix issues we had with it.
>>>>
>>>> Well what are those problems? The idea is actually not that 
>>>> hardware to understand.
>>>
>>> We hit memory corruption, and we spent substantially more time 
>>> trying to debug it than to put together this patch, while never 
>>> really understanding what  happened, nor why you don't see that with 
>>> amdgpu.
>>>
>>>>
>>>> We could simplify it massively for the cost of only waiting for the 
>>>> oldest fence if that helps.
>>>
>>> Let me grab the latest version from amdgpu and give it a try again, 
>>> but yes I think that to make it common code we'll need it simpler 
>>> (and my personal wish would be to separate the allocator 
>>> functionality a bit more from the fence waiting, which I guess 
>>> should be OK if the fence waiting is vastly simplified).
>>>
>>> /Thomas
>>>
>>>
>>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Thomas
>>>>
>
