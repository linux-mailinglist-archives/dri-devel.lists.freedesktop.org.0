Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62861AE78D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 09:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A33610E0C3;
	Wed, 25 Jun 2025 07:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="NWcpCm7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE410E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:39:55 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id DA06020B0B;
 Wed, 25 Jun 2025 09:39:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aONj4NaHxltX; Wed, 25 Jun 2025 09:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750837187; bh=AuR96wc9Rq7SVW8BvDL6W1qqi62iyIosXRkHfO52IhE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NWcpCm7Nr7TXICQZ6AorjyBPiInrQlpImUpAh8TvZheLgKJunXH/hki/Ivh54fO8L
 58acLyiaz/WUGLcjOaBIs2BmJtL+0E6WMGQQY7/hJTqD8HOmK+caTt1liUfv9dEF+m
 q+l3LZZotMgGjyanYT2BQI6MwrSlbVHE9NWJbp7m18pm2uEXrfylNr3Dsx4wOYyrKF
 6PDjBMmDB3Yjnf8oxwQLw56msI7tPFiv13d93G3oxlQLEbXJD47jTyOmZvvuEpiz4N
 j0FxuFJQoIQNXPf8IWT1E/WXqliss8PquffY2sGX61qJexCd6WACcMd2eQyCXi/IDP
 Wf1QdfG98CpOw==
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 07:39:47 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: Help: Samsung Exynos 7870 DECON SYSMMU panic
In-Reply-To: <0bc60699-eeaa-4121-8d93-0274862f5aed@arm.com>
References: <544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org>
 <0bc60699-eeaa-4121-8d93-0274862f5aed@arm.com>
Message-ID: <c338c9f7528fdcba56c088390c4ccffc@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

On 2025-06-24 17:12, Robin Murphy wrote:
> On 2025-06-18 3:02 pm, Kaustabh Chakraborty wrote:
>> Since bcb81ac6ae3c (iommu: Get DT/ACPI parsing into the proper probe 
>> path),
>> The Samsung Exynos 7870 DECON device (with patches [1], [2], and [3]) 
>> seems
>> to not work anymore. Upon closer inspection, I observe that there is 
>> an
>> IOMMU crash.
>> 
>> [    2.918189] exynos-sysmmu 14860000.sysmmu: 14830000.decon: [READ] 
>> PAGE FAULT occurred at 0x6715b3e0
>> [    2.918199] exynos-sysmmu 14860000.sysmmu: Page table base: 
>> 0x0000000044a14000
>> [    2.918243] exynos-drm exynos-drm: bound 14830000.decon (ops 
>> decon_component_ops)
>> [    2.922868] exynos-sysmmu 14860000.sysmmu:   Lv1 entry: 0x4205001
>> [    2.922877] Kernel panic - not syncing: Unrecoverable System MMU 
>> Fault!
>> [    2.922885] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 
>> 6.16.0-rc2-exynos7870 #722 PREEMPT
>> [    2.995312] Hardware name: Samsung Galaxy J7 Prime (DT)
>> [    3.000509] Call trace:
>> [    3.002938]  show_stack+0x18/0x24 (C)
>> [    3.006582]  dump_stack_lvl+0x60/0x80
>> [    3.010224]  dump_stack+0x18/0x24
>> [    3.013521]  panic+0x168/0x360
>> [    3.016558]  exynos_sysmmu_irq+0x224/0x2ac
>> [         ...]
>> [    3.108786] ---[ end Kernel panic - not syncing: Unrecoverable 
>> System MMU Fault! ]---
> 
> For starters, what if you just remove this panic() from the IOMMU 
> driver? Frankly it seems a bit excessive anyway...

I've tried that, sysmmu repeatedly keeps issuing interrupts (yes, even
after clearing the interrupt bit) indefinitely.

> 
> From the logs below it seems there is apparently unexpected traffic 
> already going through the IOMMU when it wakes up. Is this the DRM 
> drivers doing something sketchy, or has the bootloader left the display 
> running for a splash screen? However in the latter case I don't 
> obviously see why delaying the IOMMU probe should make much difference, 
> given that the decon driver should still be waiting for it either way.

The display is initialized by the bootloader for splash yes, but I 
reckon
it doesn't use the IOMMU as it's accessible from a framebuffer region.

> 
> Thanks,
> Robin.
> 
>> The commit has been introduced in mainline v6.15-rc1. I've also tested 
>> in
>> v6.15, v6.15.2, and v6.16-rc2, and there have been no apparent 
>> changes.
>> 
>> I've tried to revert the commit, and it does work that way. But on 
>> reading
>> the commit message I understand that I need to find a proper solution 
>> here.
>> I've tried to skim down the revert, and this is what I get - if i 
>> change
>> line [4] as follows:
>> 
>> -		dev->bus->dma_configure(dev);
>> +		if (!strcmp(dev_name(dev), "14830000.decon"))
>> +			dev->bus->dma_configure(dev);
>> 
>> It really doesn't like dma_configure for some reason. It works, but:
>> 
>> [    2.779291] exynos-decon 14830000.decon: late IOMMU probe at driver 
>> bind, something fishy here!
>> 
>> I believe the IOMMU hardware doesn't like the fact that it is being
>> initialized/resumed too early. I formed this conclusion by comparing 
>> the
>> logs:
>> 
>> mainline:
>> [    1.274575] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_resume enter
>> [    2.859656] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable enter
>> [    2.864192] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_clocks 
>> enter
>> [    2.869299] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>> 0x00000007
>> [    2.875062] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_init_config enter
>> [    2.880006] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000004 val 
>> 0x01100784
>> [    2.885819] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_set_ptbase enter
>> [    2.890677] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x0000000c val 
>> 0x00044a14
>> [    2.896490] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_tlb_invalidate 
>> enter
>> [    2.901695] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000010 val 
>> 0x00000001
>> [    2.907507] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_vid enter
>> [    2.912366] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>> 0x00000005
>> [    2.912371] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_irq enter
>> [    2.912836] [drm] Exynos DRM: using 14830000.decon device for DMA 
>> mapping operations
>> [    2.918175] I_HAVE_ADDED_THESE: SYSMMU: 
>> exynos_sysmmu_v5_get_fault_info enter
>> [    2.918182] I_HAVE_ADDED_THESE: SYSMMU: show_fault_information 
>> enter
>> [    2.918189] exynos-sysmmu 14860000.sysmmu: 14830000.decon: [READ] 
>> PAGE FAULT occurred at 0x6715b3e0
>> [    2.918199] exynos-sysmmu 14860000.sysmmu: Page table base: 
>> 0x0000000044a14000
>> [    2.918243] exynos-drm exynos-drm: bound 14830000.decon (ops 
>> decon_component_ops)
>> [    2.922859] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>> [    2.922864] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    2.922868] exynos-sysmmu 14860000.sysmmu:   Lv1 entry: 0x4205001
>> [    2.922877] Kernel panic - not syncing: Unrecoverable System MMU 
>> Fault!
>> 
>> and with the patch above applied:
>> [    3.018478] [drm] Exynos DRM: using 14830000.decon device for DMA 
>> mapping operations
>> [    3.025794] exynos-drm exynos-drm: bound 14830000.decon (ops 
>> decon_component_ops)
>> [    3.058655] exynos-dsi 14800000.dsi: [drm:samsung_dsim_host_attach] 
>> Attached td4300-panel device (lanes:4 bpp:24 mode-flags:0x23)
>> [    3.070189] exynos-drm exynos-drm: bound 14800000.dsi (ops 
>> exynos_dsi_component_ops)
>> [    3.078506] [drm] Initialized exynos 1.1.0 for exynos-drm on minor 
>> 1
>> [    3.090747] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_map enter
>> [    3.090845] I_HAVE_ADDED_THESE: SYSMMU: to_exynos_domain enter
>> [    3.093325] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>> [    3.097662] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    3.102000] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    3.106337] I_HAVE_ADDED_THESE: SYSMMU: lv1set_section enter
>> [    3.110762] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>> [    3.115726] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_map enter
>> [    3.120317] I_HAVE_ADDED_THESE: SYSMMU: to_exynos_domain enter
>> [    3.124914] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>> [    3.129240] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    3.133578] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    3.137916] I_HAVE_ADDED_THESE: SYSMMU: lv1set_section enter
>> [    3.142340] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>> [         ...] (a lot of repetitions later)
>> [    4.322904] I_HAVE_ADDED_THESE: SYSMMU: section_entry enter
>> [    4.327230] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    4.331567] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    4.335905] I_HAVE_ADDED_THESE: SYSMMU: alloc_lv2entry enter
>> [    4.340329] I_HAVE_ADDED_THESE: SYSMMU: page_entry enter
>> [    4.344407] I_HAVE_ADDED_THESE: SYSMMU: lv2ent_offset enter
>> [    4.348744] I_HAVE_ADDED_THESE: SYSMMU: lv1ent_offset enter
>> [    4.353082] I_HAVE_ADDED_THESE: SYSMMU: lv2set_page enter
>> [    4.357246] I_HAVE_ADDED_THESE: SYSMMU: exynos_iommu_set_pte enter
>> [    4.362751] I_HAVE_ADDED_THESE: SYSMMU: exynos_sysmmu_resume enter
>> [    4.362767] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable enter
>> [    4.362771] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_clocks 
>> enter
>> [    4.362777] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>> 0x00000007
>> [    4.362782] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_init_config enter
>> [    4.362786] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000004 val 
>> 0x01100784
>> [    4.362791] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_set_ptbase enter
>> [    4.362795] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x0000000c val 
>> 0x00042a64
>> [    4.362799] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_tlb_invalidate 
>> enter
>> [    4.362803] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000010 val 
>> 0x00000001
>> [    4.362808] I_HAVE_ADDED_THESE: SYSMMU: __sysmmu_enable_vid enter
>> [    4.362811] I_HAVE_ADDED_THESE: SYSMMU: write: reg 0x00000000 val 
>> 0x00000005
>> 
>> Then it continues booting as usual.
>> 
>> My lack of understanding of the IOMMU and DRM subsystems are really
>> limiting my triaging capabilities here, therefore I ask for any form
>> guidance or assistance with this.
>> 
>> Thank you.
>> 
>> [1] 
>> https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
>> [2] 
>> https://lore.kernel.org/all/20250612-exynos7870-drm-dts-v1-2-88c0779af6cb@disroot.org
>> [3] 
>> https://lore.kernel.org/all/20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org
>> [4] 
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/iommu/iommu.c#L431
