Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4D4CAE51
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 20:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36A110E16A;
	Wed,  2 Mar 2022 19:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8623910E16A;
 Wed,  2 Mar 2022 19:10:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16A8139F;
 Wed,  2 Mar 2022 11:10:36 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40F6A3F70D;
 Wed,  2 Mar 2022 11:10:34 -0800 (PST)
Message-ID: <9d09be2d-34f2-212c-70c0-c698a1d8145a@arm.com>
Date: Wed, 2 Mar 2022 19:10:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-GB
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
 <3750c398-e8fb-c4e1-ba31-e6ac5fbc01d0@intel.com>
 <2f82d150-47c4-d7c3-50da-eaf4aa4a24af@arm.com>
 <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-02 15:55, Michael Cheng wrote:
> Thanks for the feedback Robin!
> 
> Sorry my choices of word weren't that great, but what I meant is to 
> understand how ARM flushes a range of dcache for device drivers, and not 
> an equal to x86 clflush.
> 
> I believe the concern is if the CPU writes an update, that update might 
> only be sitting in the CPU cache and never make it to device memory 
> where the device can see it; there are specific places that we are 
> supposed to flush the CPU caches to make sure our updates are visible to 
> the hardware.

Ah, OK, if it's more about ordering, and it's actually write buffers 
rather than caches that you care about flushing, then we might be a lot 
safer, phew!

For a very simple overview, in a case where the device itself needs to 
observe memory writes in the correct order, e.g.:

	data_descriptor.valid = 1;

	clflush(&data_descriptor);

	command_descriptor.data = &data_descriptor

	writel(/* control register to read command to then read data */)

then dma_wmb() between the first two writes should be the right tool to 
ensure that the command does not observe the command update while the 
data update is still sat somewhere in a CPU write buffer.

If you want a slightly stronger notion that, at a given point, all prior 
writes have actually been issued and should now be visible (rather than 
just that they won't become visible in the wrong order whenever they 
do), then wmb() should suffice on arm64.

Note that wioth arm64 memory types, a Non-Cacheable mapping of DRAM for 
a non-coherent DMA mapping, or of VRAM in a prefetchable BAR, can still 
be write-buffered, so barriers still matter even when actual cache 
maintenance ops don't (and as before if you're trying to perform cache 
maintenance outside the DMA API then you've already lost anyway). MMIO 
registers should be mapped as Device memory via ioremap(), which is not 
bufferable, hence the barrier implicit in writel() effectively pushes 
out any prior buffered writes ahead of a register write, which is why we 
don't need to worry about this most of the time.

This is only a very rough overview, though, and I'm not familiar enough 
with x86 semantics, your hardware, or the exact use-case to be able to 
say whether barriers alone are anywhere near the right answer or not.

Robin.

> 
> +Matt Roper
> 
> Matt, Lucas, any feed back here?
> 
> On 2022-03-02 4:49 a.m., Robin Murphy wrote:
>> On 2022-02-25 19:27, Michael Cheng wrote:
>>> Hi Robin,
>>>
>>> [ +arm64 maintainers for their awareness, which would have been a 
>>> good thing to do from the start ]
>>>
>>>   * Thanks for adding the arm64 maintainer and sorry I didn't rope them
>>>     in sooner.
>>>
>>> Why does i915 need to ensure the CPU's instruction cache is coherent 
>>> with its data cache? Is it a self-modifying driver?
>>>
>>>   * Also thanks for pointing this out. Initially I was using
>>>     dcache_clean_inval_poc, which seem to be the equivalently to what
>>>     x86 is doing for dcache flushing, but it was giving me build errors
>>>     since its not on the global list of kernel symbols. And after
>>>     revisiting the documentation for caches_clean_inval_pou, it won't
>>>     fly for what we are trying to do. Moving forward, what would you (or
>>>     someone in the ARM community) suggest we do? Could it be possible to
>>>     export dcache_clean_inval_poc as a global symbol?
>>
>> Unlikely, unless something with a legitimate need for CPU-centric 
>> cache maintenance like kexec or CPU hotplug ever becomes modular.
>>
>> In the case of a device driver, it's not even the basic issues of 
>> assuming to find direct equivalents to x86 semantics in other CPU 
>> architectures, or effectively reinventing parts of the DMA API, it's 
>> even bigger than that. Once you move from being integrated in a single 
>> vendor's system architecture to being on a discrete card, you 
>> fundamentally *no longer have any control over cache coherency*. 
>> Whether the host CPU architecture happens to be AArch64, RISC-V, or 
>> whatever doesn't really matter, you're at the mercy of 3rd-party PCIe 
>> and interconnect IP vendors, and SoC integrators. You'll find yourself 
>> in systems where PCIe simply cannot snoop any caches, where you'd 
>> better have the correct DMA API calls in place to have any hope of 
>> even the most basic functionality working properly; you'll find 
>> yourself in systems where even if the PCIe root complex claims to 
>> support No Snoop, your uncached traffic will still end up snooping 
>> stale data that got prefetched back into caches you thought you'd 
>> invalidated; you'll find yourself in systems where your memory 
>> attributes may or may not get forcibly rewritten by an IOMMU depending 
>> on the kernel config and/or command line.
>>
>> It's not about simply finding a substitute for clflush, it's that the 
>> reasons you have for using clflush in the first place can no longer be 
>> assumed to be valid.
>>
>> Robin.
>>
>>> On 2022-02-25 10:24 a.m., Robin Murphy wrote:
>>>> [ +arm64 maintainers for their awareness, which would have been a 
>>>> good thing to do from the start ]
>>>>
>>>> On 2022-02-25 03:24, Michael Cheng wrote:
>>>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>>>>> performs a flush by first performing a clean, follow by an 
>>>>> invalidation
>>>>> operation.
>>>>>
>>>>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation 
>>>>> the
>>>>>             dcache. Thanks Tvrtko for the suggestion.
>>>>>
>>>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>>>>
>>>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
>>>>>             symbol that could be use by other modules, thus use
>>>>>             caches_clean_inval_pou instead. Also this version
>>>>>                 removes include for cacheflush, since its already
>>>>>             included base on architecture type.
>>>>>
>>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>>>>   1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>>>>> index c3e6e615bf09..81c28714f930 100644
>>>>> --- a/drivers/gpu/drm/drm_cache.c
>>>>> +++ b/drivers/gpu/drm/drm_cache.c
>>>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned 
>>>>> long length)
>>>>>         if (wbinvd_on_all_cpus())
>>>>>           pr_err("Timed out waiting for cache flush\n");
>>>>> +
>>>>> +#elif defined(CONFIG_ARM64)
>>>>> +    void *end = addr + length;
>>>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
>>>>
>>>> Why does i915 need to ensure the CPU's instruction cache is coherent 
>>>> with its data cache? Is it a self-modifying driver?
>>>>
>>>> Robin.
>>>>
>>>> (Note that the above is somewhat of a loaded question, and I do 
>>>> actually have half an idea of what you're trying to do here and why 
>>>> it won't fly, but I'd like to at least assume you've read the 
>>>> documentation of the function you decided was OK to use)
>>>>
>>>>> +
>>>>>   #else
>>>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>>>>   #endif
