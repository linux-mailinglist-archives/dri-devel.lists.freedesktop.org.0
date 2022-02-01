Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11284A606E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401010E60A;
	Tue,  1 Feb 2022 15:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD4310E60A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643730399; x=1675266399;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d9eKHUfVREYlEXOMy6/dbAqRNvB0R5n8Xjyt6b1+6HE=;
 b=d/Jx2ga3CIukNweVndQXc/EMFAs7jYvJantwB9CJlSKeXH/GB8GOCm0B
 V5VsimeUIvRH+03XBD4i1yACVNTfVyeOqG8J6gTNLzR1n2gzkUvOzBsg0
 xspWxa0tAwlexd9AiKvck026IZ9J4RB4eTq+7PLjbPDAdqdKRaJiZKUpM
 3vvcvi971xvnL4HNDWeI4VEDWiar+ravQlKux4Xbk5jQuP+7akcMH/fXi
 6U8qwVh4pGuhdrsuF75P3HQeIonbhMRde2AO2749jKP3hOA/EGqXxo6nr
 tSDN76Z4o1ChYcaQJXC7crOnf59tZx3okshUL/McUB+vXWf2B8qwH2Q0P Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="231288601"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="231288601"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 07:46:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="537853590"
Received: from tveit-mobl1.ger.corp.intel.com (HELO [10.252.37.11])
 ([10.252.37.11])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 07:46:36 -0800
Message-ID: <b0a06a30-f479-df9f-980c-b789f0f26ce9@linux.intel.com>
Date: Tue, 1 Feb 2022 16:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v8 00/10] vgaarb: Rework default VGA device selection
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220131222342.GA517488@bhelgaas>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20220131222342.GA517488@bhelgaas>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,
 
Op 31-01-2022 om 23:23 schreef Bjorn Helgaas:
> [+to Maarten, Maxime, Thomas; beginning of thread:
> https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]
>
> On Wed, Jan 05, 2022 at 06:06:48PM -0600, Bjorn Helgaas wrote:
>> From: Bjorn Helgaas <bhelgaas@google.com>
>>
>> Current default VGA device selection fails in some cases because part of it
>> is done in the vga_arb_device_init() subsys_initcall, and some arches
>> enumerate PCI devices in pcibios_init(), which runs *after* that.
> Where are we at with this series?  Is there anything I can do to move
> it forward?
>
> Bjorn

Hi Bjorn,


I'm afraid that I don't understand the vga arbiter or the vga code well enough to review.

Could you perhaps find someone who could review?

I see Chen wrote some patches and tested, so perhaps they could?

~Maarten

>> For example:
>>
>>   - On BMC system, the AST2500 bridge [1a03:1150] does not implement
>>     PCI_BRIDGE_CTL_VGA.  This is perfectly legal but means the legacy VGA
>>     resources won't reach downstream devices unless they're included in the
>>     usual bridge windows.
>>
>>   - vga_arb_select_default_device() will set a device below such a bridge
>>     as the default VGA device as long as it has PCI_COMMAND_IO and
>>     PCI_COMMAND_MEMORY enabled.
>>
>>   - vga_arbiter_add_pci_device() is called for every VGA device, either at
>>     boot-time or at hot-add time, and it will also set the device as the
>>     default VGA device, but ONLY if all bridges leading to it implement
>>     PCI_BRIDGE_CTL_VGA.
>>
>>   - This difference between vga_arb_select_default_device() and
>>     vga_arbiter_add_pci_device() means that a device below an AST2500 or
>>     similar bridge can only be set as the default if it is enumerated
>>     before vga_arb_device_init().
>>
>>   - On ACPI-based systems, PCI devices are enumerated by acpi_init(), which
>>     runs before vga_arb_device_init().
>>
>>   - On non-ACPI systems, like on MIPS system, they are enumerated by
>>     pcibios_init(), which typically runs *after* vga_arb_device_init().
>>
>> This series consolidates all the default VGA device selection in
>> vga_arbiter_add_pci_device(), which is always called after enumerating a
>> PCI device.
>>
>> Almost all the work here is Huacai's.  I restructured it a little bit and
>> added a few trivial patches on top.
>>
>> I'd like to move vgaarb.c to drivers/pci eventually, but there's another
>> initcall ordering snag that needs to be resolved first, so this leaves 
>> it where it is.
>>
>> Bjorn
>>
>> Version history:
>> V0 original implementation as final quirk to set default device.
>> https://lore.kernel.org/r/20210514080025.1828197-6-chenhuacai@loongson.cn
>>
>> V1 rework vgaarb to do all default device selection in
>> vga_arbiter_add_pci_device().
>> https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
>>
>> V2 move arbiter to PCI subsystem, fix nits.
>> https://lore.kernel.org/r/20210722212920.347118-1-helgaas@kernel.org
>>
>> V3 rewrite the commit log of the last patch (which is also summarized
>> by Bjorn).
>> https://lore.kernel.org/r/20210820100832.663931-1-chenhuacai@loongson.cn
>>
>> V4 split the last patch to two steps.
>> https://lore.kernel.org/r/20210827083129.2781420-1-chenhuacai@loongson.cn
>>
>> V5 split Patch-9 again and sort the patches.
>> https://lore.kernel.org/r/20210911093056.1555274-1-chenhuacai@loongson.cn
>>
>> V6 split Patch-5 again and sort the patches again.
>> https://lore.kernel.org/r/20210916082941.3421838-1-chenhuacai@loongson.cn
>>
>> V7 stop moving vgaarb to drivers/pci because of ordering issues with
>> misc_init().
>> https://lore.kernel.org/r/20211015061512.2941859-1-chenhuacai@loongson.cn
>> https://lore.kernel.org/r/CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU27KHWcyWKkMftEsA@mail.gmail.com
>>
>>
>> Bjorn Helgaas (8):
>>   vgaarb: Factor out vga_select_framebuffer_device()
>>   vgaarb: Factor out default VGA device selection
>>   vgaarb: Move framebuffer detection to ADD_DEVICE path
>>   vgaarb: Move non-legacy VGA detection to ADD_DEVICE path
>>   vgaarb: Move disabled VGA device detection to ADD_DEVICE path
>>   vgaarb: Remove empty vga_arb_device_card_gone()
>>   vgaarb: Use unsigned format string to print lock counts
>>   vgaarb: Replace full MIT license text with SPDX identifier
>>
>> Huacai Chen (2):
>>   vgaarb: Move vga_arb_integrated_gpu() earlier in file
>>   vgaarb: Log bridge control messages when adding devices
>>
>>  drivers/gpu/vga/vgaarb.c | 311 +++++++++++++++++++--------------------
>>  1 file changed, 154 insertions(+), 157 deletions(-)
>>
>> -- 
>> 2.25.1
>>

