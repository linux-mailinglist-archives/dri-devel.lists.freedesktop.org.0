Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874D452D6C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D886EE1B;
	Tue, 16 Nov 2021 09:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9929E6EE1B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:01:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233487929"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="233487929"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 01:01:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="645396834"
Received: from pheino-mobl.ger.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 01:01:01 -0800
Message-ID: <7196ce91-5897-3088-e7f4-f9c5b04152d9@linux.intel.com>
Date: Tue, 16 Nov 2021 10:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
 <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
 <ddc99a8c-0887-9fc3-718e-98963723415c@linux.intel.com>
 <5609a30f-2625-9b27-6ad6-4c6d73fb10f6@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <5609a30f-2625-9b27-6ad6-4c6d73fb10f6@amd.com>
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


On 11/16/21 09:54, Christian König wrote:
> Am 16.11.21 um 09:33 schrieb Thomas Hellström:
>> On 11/16/21 09:20, Christian König wrote:
>>> Am 16.11.21 um 08:43 schrieb Thomas Hellström:
>>>> On 11/16/21 08:19, Christian König wrote:
>>>>> Am 13.11.21 um 12:26 schrieb Thomas Hellström:
>>>>>> Hi, Zack,
>>>>>>
>>>>>> On 11/11/21 17:44, Zack Rusin wrote:
>>>>>>> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>>>>>>>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This 
>>>>>>>> makes
>>>>>>>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>>>>>>>> requires the drivers to manually handle all interactions 
>>>>>>>> between TTM
>>>>>>>> which can swap out those buffers whenever it thinks it's the right
>>>>>>>> thing to do and driver.
>>>>>>>>
>>>>>>>> CPU buffers which need to be fenced and shared with accelerators
>>>>>>>> should
>>>>>>>> be placed in driver specific placements that can explicitly handle
>>>>>>>> CPU/accelerator buffer fencing.
>>>>>>>> Currently, apart, from things silently failing nothing is 
>>>>>>>> enforcing
>>>>>>>> that requirement which means that it's easy for drivers and new
>>>>>>>> developers to get this wrong. To avoid the confusion we can 
>>>>>>>> document
>>>>>>>> this requirement and clarify the solution.
>>>>>>>>
>>>>>>>> This came up during a discussion on dri-devel:
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C582935bfd2d94d97fa4808d9a8dbd574%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726484406316306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4p9KuhMpWHabLEuIvJB2JEuKRhYx2gUuDywUuZ86s0o%3D&amp;reserved=0 
>>>>>>>>
>>>>>>
>>>>>> I took a slightly deeper look into this. I think we need to 
>>>>>> formalize this a bit more to understand pros and cons and what 
>>>>>> the restrictions are really all about. Anybody looking at the 
>>>>>> prevous discussion will mostly see arguments similar to "this is 
>>>>>> stupid and difficult" and "it has always been this way" which are 
>>>>>> not really constructive.
>>>>>>
>>>>>> First disregarding all accounting stuff, I think this all boils 
>>>>>> down to TTM_PL_SYSTEM having three distinct states:
>>>>>> 1) POPULATED
>>>>>> 2) LIMBO (Or whatever we want to call it. No pages present)
>>>>>> 3) SWAPPED.
>>>>>>
>>>>>> The ttm_bo_move_memcpy() helper understands these, and any 
>>>>>> standalone driver implementation of the move() callback 
>>>>>> _currently_ needs to understand these as well, unless using the 
>>>>>> ttm_bo_move_memcpy() helper.
>>>>>>
>>>>>> Now using a bounce domain to proxy SYSTEM means that the driver 
>>>>>> can forget about the SWAPPED state, it's automatically handled by 
>>>>>> the move setup code. However, another pitfall is LIMBO, in that 
>>>>>> if when you move from SYSTEM/LIMBO to your bounce domain, the BO 
>>>>>> will be populated. So any naive accelerated move() implementation 
>>>>>> creating a 1GB BO in fixed memory, like VRAM, will needlessly 
>>>>>> allocate and free 1GB of system memory in the process instead of 
>>>>>> just performing a clear operation. Looks like amdgpu suffers from 
>>>>>> this?
>>>>>>
>>>>>> I think what is really needed is either
>>>>>>
>>>>>> a) A TTM helper that helps move callback implementations resolve 
>>>>>> the issues populating system from LIMBO or SWAP, and then also 
>>>>>> formalize driver notification for swapping. At a minimum, I think 
>>>>>> the swap_notify() callback needs to be able to return a late error.
>>>>>>
>>>>>> b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd 
>>>>>> vote for this without looking into it in detail).
>>>>>>
>>>>>> In both these cases, we should really make SYSTEM bindable by 
>>>>>> GPU, otherwise we'd just be trading one pitfall for another 
>>>>>> related without really resolving the root problem.
>>>>>>
>>>>>> As for fencing not being supported by SYSTEM, I'm not sure why we 
>>>>>> don't want this, because it would for example prohibit async 
>>>>>> ttm_move_memcpy(), and also, async unbinding of ttm_tt memory 
>>>>>> like MOB on vmgfx. (I think it's still sync).
>>>>>>
>>>>>> There might be an accounting issue related to this as well, but I 
>>>>>> guess Christian would need to chime in on this. If so, I think it 
>>>>>> needs to be well understood and documented (in TTM, not in AMD 
>>>>>> drivers).
>>>>>
>>>>> I think the problem goes deeper than what has been mentioned here 
>>>>> so far.
>>>>>
>>>>> Having fences attached to BOs in the system domain is probably ok, 
>>>>> but the key point is that the BOs in the system domain are under 
>>>>> TTMs control and should not be touched by the driver.
>>>>>
>>>>> What we have now is that TTMs internals like the allocation state 
>>>>> of BOs in system memory (the populated, limbo, swapped you 
>>>>> mentioned above) is leaking into the drivers and I think exactly 
>>>>> that is the part which doesn't work reliable here. You can of 
>>>>> course can get that working, but that requires knowledge of the 
>>>>> internal state which in my eyes was always illegal.
>>>>>
>>>> Well, I tend to agree to some extent, but then, like said above 
>>>> even disregarding swap will cause trouble with the limbo state, 
>>>> because the driver's move callback would need knowledge of that to 
>>>> implement moves limbo -> vram efficiently.
>>>
>>> Well my long term plan is to audit the code base once more and 
>>> remove the limbo state from the SYSTEM domain.
>>>
>>> E.g. instead of a SYSTEM BO without pages you allocate a BO without 
>>> a resource in general which is now possible since bo->resource is a 
>>> pointer.
>>>
>>> This would still allow us to allocate "empty shell" BOs. But a 
>>> validation of those BOs doesn't cause a move, but rather just 
>>> allocates the resource for the first time.
>>>
>>> The problem so far was just that we access bo->resource way to often 
>>> without checking it.
>>
>> So the driver would then at least need to be aware of these empty 
>> shell bos without resource for their move callbacks? (Again thinking 
>> of the move from empty shell -> VRAM).
>
> My thinking goes more into the direction that this looks like a BO 
> directly allocated in VRAM to the driver.
>
> We could of course also make it a move, but of hand I don't see a 
> reason for it.

As long as there is a way to provide accelerated VRAM clearing if 
necessary the directly allocated view sounds fine with me. (Looking at 
amdgpu it looks like you clear on resource destroy? I'm not fully sure 
that would work with all i915 use cases)

/Thomas


>
> Christian.
>
>>
>> Thanks,
>>
>> /Thomas
>>
>>
>
