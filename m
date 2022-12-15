Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087C64DAAD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4227B10E53F;
	Thu, 15 Dec 2022 11:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D6FE10E53F;
 Thu, 15 Dec 2022 11:54:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B65B1063;
 Thu, 15 Dec 2022 03:54:42 -0800 (PST)
Received: from [10.57.88.90] (unknown [10.57.88.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C7FC3F73B;
 Thu, 15 Dec 2022 03:54:00 -0800 (PST)
Message-ID: <e15133af-d3d9-de47-b01a-bca9053b0d8f@arm.com>
Date: Thu, 15 Dec 2022 11:53:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Content-Language: en-GB
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
 <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
 <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
 <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
 <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
 <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
 <80e10a8d-275f-8e3c-8b91-f5f6d6729dee@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <80e10a8d-275f-8e3c-8b91-f5f6d6729dee@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-15 11:40, Luben Tuikov wrote:
> On 2022-12-15 06:27, Christian König wrote:
>> Am 15.12.22 um 11:19 schrieb Luben Tuikov:
>>> On 2022-12-15 04:46, Christian König wrote:
>>>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>>>>> On 2022-12-15 03:07, Christian König wrote:
>>>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>>>>>> wrote:
>>>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>>>>>
>>>>>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>>>>>> AGP chip,
>>>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>>>>>> 0x7FFFFFF, and
>>>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>>>>>> the last
>>>>>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>>>>>> use GFP_DMA32
>>>>>>>>>> when allocating DMA buffers.
>>>>>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>>>>>> going to the wrong place, that is also equally consistent with a
>>>>>>>>> loss of
>>>>>>>>> cache coherency.
>>>>>>>>>
>>>>>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>>>>>> alias
>>>>>>>>> memory to a second physical address, so I could well believe that
>>>>>>>>> something somewhere in the driver stack needs to perform some cache
>>>>>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>>>>>> and thus going wrong for highmem pages.
>>>>>>>>>
>>>>>>>>> So as I said before, I really think this is not about using
>>>>>>>>> GFP_DMA32 at
>>>>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>>>>> One of the wonderful features of AGP is that it has to be used with
>>>>>>>> uncached memory.  The aperture basically just provides a remapping of
>>>>>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>>>>>> has to jump through quite a few hoops to get uncached memory in the
>>>>>>>> first place, so it's likely that that somehow isn't compatible with
>>>>>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>>>>>> I guess in principle yes, if you're careful not to use regular
>>>>>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>>>>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>>>>>> slipping up.
>>>>>> I theory we should do exactly that in TTM, but we have very few users
>>>>>> who actually still exercise that functionality.
>>>>>>
>>>>>>> Working backwards from primitives like set_memory_uc(), I see various
>>>>>>> paths in TTM where manipulating the caching state is skipped for
>>>>>>> highmem pages, but I wouldn't even know where to start looking for
>>>>>>> whether the right state is propagated to all the places where they
>>>>>>> might eventually be mapped somewhere.
>>>>>> The tt object has the caching state for the pages and
>>>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>>>>>> userspace/vmalloc mappings.
>>>>>>
>>>>> The point of this patch is that dma_addressing_limited() is unsuitable as
>>>>> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
>>>>> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
>>>>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
>>>> Well I would rather say that dma_addressing_limited() works, but the
>>>> default value from dma_get_required_mask() is broken.
>>>>
>>> dma_get_required_mask() for his setup of 1.5 GiB of memory returns 0x7FFFFFF.
>>
>> This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB
>> addressable memory (27 bits set)? Or is there another F missing?
> 
> Yeah, I'm missing an F--it is correctly described at the top of the thread above,
> i.e. in the commit of v2 patch.
> 
> 0x7FFF_FFFF, which seems correct, no?
> 
>>> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in radeon_device_init().
>>>
>>>> 32 bits only work with bounce buffers and we can't use those on graphics
>>>> hardware.
>>>>
>>>>> Is there an objection to this patch, if it fixes the screen corruption?
>>>> Not from my side, but fixing the underlying issues would be better I think.
>>>>
>>> Have they been identified?
>>
>> I'm not 100% sure. I think by using GFP_DMA32 we just work around the
>> issue somehow.
> 
> Right. Using GFP_DMA32, we don't touch high-mem. I was looking at the DRM
> code trying to understand what we do when GFP_DMA32 is not set, and the immediate
> thing I see is that we set GFP_HIGHUSER when use_dma32 is unset in the device struct.
> (Then I got down to the caching attributes...)
> 
> It's be nice if we can find the actual issue--what else would it show us that needs fixing...?
> 
> So what do we do with this patch?
> 
> Shouldn't leave it in a limbo--some OSes ship their kernel
> with 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations") wholly
> reverted.

Removing dma_addressing_limited() is still wrong, for the reasons given 
in that commit. What we need is an *additional* condition that 
encapsulates "also pass use_dma32 for AGP devices because it avoids some 
weird coherency issue with 32-bit highmem that isn't worth trying to 
debug further".

Thanks,
Robin.
