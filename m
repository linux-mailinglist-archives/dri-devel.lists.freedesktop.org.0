Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E465AEDC59
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617A110E21B;
	Mon, 30 Jun 2025 12:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACB6910E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 12:09:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7644D1D34;
 Mon, 30 Jun 2025 05:09:38 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3D7A3F58B;
 Mon, 30 Jun 2025 05:09:52 -0700 (PDT)
Message-ID: <fc6591c0-285e-4482-9ce3-6e2b671dd581@arm.com>
Date: Mon, 30 Jun 2025 13:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help: Samsung Exynos 7870 DECON SYSMMU panic
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org>
 <0bc60699-eeaa-4121-8d93-0274862f5aed@arm.com>
 <CGME20250625073955eucas1p2913134af8cc26dcb2145188f8a43256b@eucas1p2.samsung.com>
 <c338c9f7528fdcba56c088390c4ccffc@disroot.org>
 <833aef10-9fcf-4abd-bea8-c34ea7ed6bb2@samsung.com>
 <647ca0c3-9ea5-42e4-8f76-038987d5ae1e@arm.com>
 <d17f98b09deab279edf063465e9f654d@disroot.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <d17f98b09deab279edf063465e9f654d@disroot.org>
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

On 28/06/2025 4:39 pm, Kaustabh Chakraborty wrote:
> On 2025-06-25 11:34, Robin Murphy wrote:
>> On 2025-06-25 9:42 am, Marek Szyprowski wrote:
>>> On 25.06.2025 09:39, Kaustabh Chakraborty wrote:
>>>> On 2025-06-24 17:12, Robin Murphy wrote:
>>>>> On 2025-06-18 3:02 pm, Kaustabh Chakraborty wrote:
>>>>>> Since bcb81ac6ae3c (iommu: Get DT/ACPI parsing into the proper probe
>>>>>> path),
>>>>>> The Samsung Exynos 7870 DECON device (with patches [1], [2], and
>>>>>> [3]) seems
>>>>>> to not work anymore. Upon closer inspection, I observe that there 
>>>>>> is an
>>>>>> IOMMU crash.
>>>>>>
>>>>>> [    2.918189] exynos-sysmmu 14860000.sysmmu: 14830000.decon: [READ]
>>>>>> PAGE FAULT occurred at 0x6715b3e0
>>>>>> [    2.918199] exynos-sysmmu 14860000.sysmmu: Page table base:
>>>>>> 0x0000000044a14000
>>>>>> [    2.918243] exynos-drm exynos-drm: bound 14830000.decon (ops
>>>>>> decon_component_ops)
>>>>>> [    2.922868] exynos-sysmmu 14860000.sysmmu:   Lv1 entry: 0x4205001
>>>>>> [    2.922877] Kernel panic - not syncing: Unrecoverable System MMU
>>>>>> Fault!
>>>>>> [    2.922885] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
>>>>>> 6.16.0-rc2-exynos7870 #722 PREEMPT
>>>>>> [    2.995312] Hardware name: Samsung Galaxy J7 Prime (DT)
>>>>>> [    3.000509] Call trace:
>>>>>> [    3.002938]  show_stack+0x18/0x24 (C)
>>>>>> [    3.006582]  dump_stack_lvl+0x60/0x80
>>>>>> [    3.010224]  dump_stack+0x18/0x24
>>>>>> [    3.013521]  panic+0x168/0x360
>>>>>> [    3.016558]  exynos_sysmmu_irq+0x224/0x2ac
>>>>>> [         ...]
>>>>>> [    3.108786] ---[ end Kernel panic - not syncing: Unrecoverable
>>>>>> System MMU Fault! ]---
>>>>>
>>>>> For starters, what if you just remove this panic() from the IOMMU
>>>>> driver? Frankly it seems a bit excessive anyway...
>>>>
>>>> I've tried that, sysmmu repeatedly keeps issuing interrupts (yes, even
>>>> after clearing the interrupt bit) indefinitely.
>>>>
>>> Right, this is because decon device is still accessing system memory in
>>> a loop trying to display the splash screen. That panic is indeed a bit
>>> excessive, but what else IOMMU driver can do if no page fault handle is
>>> registered?
>>
>> Report the unhandled fault and continue, like most drivers already do. 
>> If there's another fault, then that can get reported as well. It's 
>> kind of the point that if a misbehaving device has been prevented from 
>> accessing memory then it has *not* adversely affected the rest of the 
>> system.
>>
>> I suppose if one wanted to be really clever then a driver could 
>> implement its own backoff mechanism where if it detects a sustained 
>> high rate of unhandled faults then it disables its interrupt for a 
>> bit, to mitigate the physical interrupt storm as well as avoid 
>> flooding the kernel log more than is useful.
>>
>>>>>  From the logs below it seems there is apparently unexpected traffic
>>>>> already going through the IOMMU when it wakes up. Is this the DRM
>>>>> drivers doing something sketchy, or has the bootloader left the
>>>>> display running for a splash screen? However in the latter case I
>>>>> don't obviously see why delaying the IOMMU probe should make much
>>>>> difference, given that the decon driver should still be waiting for
>>>>> it either way.
>>>>
>>>> The display is initialized by the bootloader for splash yes, but I 
>>>> reckon
>>>> it doesn't use the IOMMU as it's accessible from a framebuffer region.
>>>
>>> Right, bootloader configured decon device to display splash screen, what
>>> means that decon device is constantly reading splash screen pixel data
>>> from system memory. There is no such thing as a 'framebuffer region', it
>>> is just a system memory, which exynos sysmmu protects when enabled. So
>>> far this issue of splash screen from bootloader has not yet been solved
>>> in mainline. On other Exynos based supported boards this works only
>>> because there are also power domain drivers enabled, which are
>>> instantiated before the display related device and respective sysmmu
>>> device. That power domain driver shuts down power effectively disabling
>>> the display before the sysmmu gets probbed.
>>
>> And presumably the sysmmu device itself doesn't need to depend on that 
>> power domain? OK, that at least makes sense.
>>
>>> Long time ago I've pointed this issue and proposed some simple solution
>>> like a special initial identity mapping for the memory range used for
>>> splash screen, but that proposal is no longer applicable for the current
>>> code.
>>>
>>> As a workaround I would suggest to shutdown display in the decon device
>>> before starting the kernel (i.e. from the 'kernel loading mid-stage
>>> bootloader' if you have such).
>>
>> We do now have the tools to handle this properly - if the bootloader 
>> can be updated to add the appropriate "iommu-addresses" property[1] to 
>> the framebuffer reservation, then it's a case of hooking up support in 
>> exynos-iommu via of_iommu_get_resv_regions().
> 
> Hey, thanks a lot! I got it to work. [1] [2]

Hurrah!

> The Exynos IOMMU driver doesn't have support for get_resv_regions in
> iommu_ops. So I tried to find existing drivers which have it implemented,
> for examples. [3] [4] [5]
> 
> All of them have some reserved region allocation before calling
> iommu_dma_get_resv_regions(). I don't know what they are, and I don't know
> what base and length should be used for sysmmu. Either way I gave it a shot
> with [6]:
> 
> #define EXYNOS_DEV_ADDR_START    0x20000000
> #define EXYNOS_DEV_ADDR_SIZE    0x40000000
> 
> static void exynos_iommu_get_resv_regions(struct device *dev,
>                        struct list_head *head)
> {
>      struct iommu_resv_region *region;
>      int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> 
>      region = iommu_alloc_resv_region(EXYNOS_DEV_ADDR_START, 
> EXYNOS_DEV_ADDR_SIZE,
>                       prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
>      if (!region)
>          return;
> 
>      list_add_tail(&region->list, head);
> 
>      iommu_dma_get_resv_regions(dev, head);
> }
> 
> ...and it worked. It works even without that first allocation, so not
> sure why and if its needed.

No, unless you have client devices that use MSIs *and* you want to 
support VFIO for them, you don't need to make up a SW_MSI region - feel 
free to hook up ".get_resv_regions = iommu_dma_get_resv_regions" directly.

The only other thing to be wary of in general here is the window between 
initialising the IOMMU device itself and attaching the client(s) (e.g. 
SMMUv3 has to take special care there). However in this particular case 
I guess you're OK, since exynos_sysmmu_probe() doesn't really touch the 
hardware anyway, and you don't have that intermediate "globally enabled 
without client-specific config" state which can disrupt traffic on the 
bigger more complicated IOMMUs.

Thanks,
Robin.

> I need some input for making it upstreamable (mainly if the base and
> length are correct or no), I'll send a patch.
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.15.3/source/drivers/iommu/of_iommu.c#L206
> [2] 
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml
> [3] 
> https://elixir.bootlin.com/linux/v6.15.3/source/drivers/iommu/apple-dart.c#L966
> [4] 
> https://elixir.bootlin.com/linux/v6.15.3/source/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c#L3573
> [5] 
> https://elixir.bootlin.com/linux/v6.15.3/source/drivers/iommu/arm/arm-smmu/arm-smmu.c#L1594
> [6] 
> https://elixir.bootlin.com/linux/v6.15.3/source/drivers/gpu/drm/exynos/exynos_drm_dma.c#L30
> 
>>
>> For a short-term kernel-side hack you could probably implement 
>> .def_domain_type to force IDENTITY for decon devices, as long as you 
>> can then convince the DRM driver to pick another device to grab a DMA 
>> ops domain from.
>>
>> Thanks,
>> Robin.
