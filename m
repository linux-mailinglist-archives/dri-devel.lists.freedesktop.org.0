Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134C64D304
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 00:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6AE10E4C0;
	Wed, 14 Dec 2022 23:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E18710E4C0;
 Wed, 14 Dec 2022 23:08:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BA22FEC;
 Wed, 14 Dec 2022 15:09:36 -0800 (PST)
Received: from [10.57.88.237] (unknown [10.57.88.237])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82263F5A1;
 Wed, 14 Dec 2022 15:08:54 -0800 (PST)
Message-ID: <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
Date: Wed, 14 Dec 2022 23:08:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Content-Language: en-GB
To: Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-14 22:02, Alex Deucher wrote:
> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>
>>> On older systems with little memory, for instance 1.5 GiB, using an AGP chip,
>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is 0x7FFFFFF, and
>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>> false. As such the result of this static inline isn't suitable for the last
>>> argument to ttm_device_init()--it simply needs to now whether to use GFP_DMA32
>>> when allocating DMA buffers.
>>
>> This sounds wrong to me. If the issues happen on systems without PAE it
>> clearly can't have anything to with the actual DMA address size. Not to
>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>> GFP_DMA32 would be functionally meaningless anyway. Although the
>> reported symptoms initially sounded like they could be caused by DMA
>> going to the wrong place, that is also equally consistent with a loss of
>> cache coherency.
>>
>> My (limited) understanding of AGP is that the GART can effectively alias
>> memory to a second physical address, so I could well believe that
>> something somewhere in the driver stack needs to perform some cache
>> maintenance to avoid coherency issues, and that in these particular
>> setups whatever that is might be assuming the memory is direct-mapped
>> and thus going wrong for highmem pages.
>>
>> So as I said before, I really think this is not about using GFP_DMA32 at
>> all, but about *not* using GFP_HIGHUSER.
> 
> One of the wonderful features of AGP is that it has to be used with
> uncached memory.  The aperture basically just provides a remapping of
> physical pages into a linear aperture that you point the GPU at.  TTM
> has to jump through quite a few hoops to get uncached memory in the
> first place, so it's likely that that somehow isn't compatible with
> HIGHMEM.  Can you get uncached HIGHMEM?

I guess in principle yes, if you're careful not to use regular 
kmap()/kmap_atomic(), and always use pgprot_noncached() for 
userspace/vmalloc mappings, but clearly that leaves lots of scope for 
slipping up.

Working backwards from primitives like set_memory_uc(), I see various 
paths in TTM where manipulating the caching state is skipped for highmem 
pages, but I wouldn't even know where to start looking for whether the 
right state is propagated to all the places where they might eventually 
be mapped somewhere.

Cheers,
Robin.
