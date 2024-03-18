Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82C87EA84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDFE10E8A7;
	Mon, 18 Mar 2024 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13C7F10E8A7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:04:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B01CDA7;
 Mon, 18 Mar 2024 07:04:56 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC3033F67D;
 Mon, 18 Mar 2024 07:04:20 -0700 (PDT)
Message-ID: <689eed7c-836f-4ca8-9d57-f7ff045a6cf8@arm.com>
Date: Mon, 18 Mar 2024 14:04:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix the CONFIG_PM=n case
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
References: <20240318085855.994179-1-boris.brezillon@collabora.com>
 <2af13565-f3d7-47c3-8083-da86669a34e1@arm.com>
 <20240318140815.44de8110@collabora.com>
 <5c9257cb-8307-4f9e-9323-2ed367c48a11@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <5c9257cb-8307-4f9e-9323-2ed367c48a11@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2024 1:49 pm, Steven Price wrote:
> On 18/03/2024 13:08, Boris Brezillon wrote:
>> On Mon, 18 Mar 2024 11:31:05 +0000
>> Steven Price <steven.price@arm.com> wrote:
>>
>>> On 18/03/2024 08:58, Boris Brezillon wrote:
>>>> Putting a hard dependency on CONFIG_PM is not possible because of a
>>>> circular dependency issue, and it's actually not desirable either. In
>>>> order to support this use case, we forcibly resume at init time, and
>>>> suspend at unplug time.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>>
>>>> ---
>>>> Tested by faking CONFIG_PM=n in the driver (basically commenting
>>>> all pm_runtime calls, and making the panthor_device_suspend/resume()
>>>> calls unconditional in the panthor_device_unplug/init() path) since
>>>> CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
>>>> can't be 100% sure this will work correctly on a platform that has
>>>> CONFIG_PM=n.
>>>
>>> The same - I can't test this properly :(
>>>
>>> Note that the other option (which AFAICT doesn't cause any problems) is
>>> to "select PM" rather than depend on it - AIUI the 'select' dependency
>>> is considered in the opposite direction by kconfig so won't cause the
>>> dependency loop.
>>
>> Doesn't seem to work with COMPILE_TEST though? I mean, we need
>> something like
>>
>> 	depends on ARM || ARM64 || (COMPILE_TEST && PM)
>> 	...
>> 	select PM
>>
>> but kconfig doesn't like that
> 
> Why do we need the "&& PM" part? Just:
> 
> 	depends on ARM || ARM64 || COMPILE_TEST
> 	...
> 	select PM
> 
> Or at least that appears to work for me.
> 
>> drivers/gpu/drm/panthor/Kconfig:3:error: recursive dependency detected!
>> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on
>> PM kernel/power/Kconfig:183:	symbol PM is selected by DRM_PANTHOR
>>
>> which id why I initially when for a depends on PM
>>
>>
>>> Of course if there is actually anyone who has a
>>> platform which can be built !CONFIG_PM then that won't help. But the
>>> inability of anyone to actually properly test this configuration does
>>> worry me a little.
>>
>> Well, as long as it doesn't regress the PM behavior, I think I'm happy
>> to take the risk. Worst case scenario, someone complains that this is
>> not working properly when they do the !PM bringup :-).
> 
> Indeed, I've no objection to this patch - although I really should have
> compiled tested it as Robin pointed out ;)
> 
> But one other thing I've noticed when compile testing it - we don't
> appear to have fully fixed the virt_to_pfn() problem. On x86 with
> COMPILE_TEST I still get an error. Looking at the code it appears that
> virt_to_pfn() isn't available on x86... it overrides asm/page.h and
> doesn't provide a definition. The definition on x86 is hiding in
> asm/xen/page.h.
> 
> Outside of arch code it's only drivers/xen that currently uses that
> function. So I guess it's probably best to do a
> PFN_DOWN(virt_to_phys(...)) instead. Or look to fix x86 :)

FWIW from a quick look it might be cleaner to store the struct page 
pointer for the dummy page - especially since the VA only seems to be 
used once in panthor_device_init() anyway - then use page_to_pfn() at 
the business end.

Cheers,
Robin.
