Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048192DE509
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C9A6E182;
	Fri, 18 Dec 2020 14:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADDAA6E182
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:42:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2838D1FB;
 Fri, 18 Dec 2020 06:42:37 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 592143F66B;
 Fri, 18 Dec 2020 06:42:36 -0800 (PST)
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <159c72db-1316-6155-2209-8e0e9a7f5224@arm.com>
 <87wnxfy71f.wl-chenli@uniontech.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <90a89839-651d-71b0-b0eb-5535b6f6f4f5@arm.com>
Date: Fri, 18 Dec 2020 14:42:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87wnxfy71f.wl-chenli@uniontech.com>
Content-Language: en-GB
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-18 06:14, Chen Li wrote:
[...]
>>> No, not performance. See standards like OpenGL, Vulkan as well as VA-API and
>>> VDPAU require that you can mmap() device memory and execute memset/memcpy on
>>> the memory from userspace.
>>>
>>> If your ARM base board can't do that for some then you can't use the hardware
>>> with that board.
>>
>> If the VRAM lives in a prefetchable PCI bar then on most sane Arm-based systems
>> I believe it should be able to mmap() to userspace with the Normal memory type,
>> where unaligned accesses and such are allowed, as opposed to the Device memory
>> type intended for MMIO mappings, which has more restrictions but stricter
>> ordering guarantees.
>   
> Hi, Robin. I cannot understand it allow unaligned accesses. prefetchable PCI bar should also be mmio, and accesses will end with device memory, so why does this allow unaligned access?

Because even Device-GRE is a bit too restrictive to expose to userspace 
that's likely to expect it to behave as regular memory, so, for better 
or worse, we use MT_NORMAL_MC for pgrprot_writecombine().

>> Regardless of what happens elsewhere though, if something is mapped *into the
>> kernel* with ioremap(), then it is fundamentally wrong per the kernel memory
>> model to reference that mapping directly without using I/O accessors. That is
>> not specific to any individual architecture, and Sparse should be screaming
>> about it already. I guess in this case the UVD code needs to pay more attention
>> to whether radeon_bo_kmap() ends up going via ttm_bo_ioremap() or not.
>>
>> (I'm assuming the initial fault was memset() with 0 trying to perform "DC ZVA"
>> on a Device-type mapping from ioremap() - FYI a stacktrace on its own without
>> the rest of the error dump showing what actually triggered it isn't overly
>> useful)
>>
>> Robin.
> why it may be 'DC ZVA'? I'm not sure the pc in initial kernel fault memset, but I capture the userspace crash pc: stp(128bit) or str with neon(also 128bit) to render node(/dev/dri/renderD128).

As I said it was an assumption. I guessed at it being more likely to be 
an MMU fault than an external abort, and given the size and the fact 
that it's a variable initialisation guessed at it being slightly more 
likely to hit the ZVA special-case rather than being unaligned. Looking 
again, I guess starting at an odd-numbered 32-bit element might lead to 
an unaligned store of XZR, but either way it doesn't really matter - 
what it showed is it clearly *could* be an MMU fault because TTM seems 
to be a bit careless with iomem pointers.

That said, if you're also getting external aborts from your host bridge 
not liking 128-bit transactions, then as Christian says you're probably 
going to have a bad time on this platform either way.

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
