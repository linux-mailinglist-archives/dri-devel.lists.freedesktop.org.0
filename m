Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C274A5249
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 23:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0644810E2EB;
	Mon, 31 Jan 2022 22:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B142C10E2EB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 22:23:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25C74615C4;
 Mon, 31 Jan 2022 22:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9D5C340E8;
 Mon, 31 Jan 2022 22:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643667824;
 bh=0Y3rqgHlAMjH8w1RLY+36FufBDg9B2bU0SqT42dDkig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VJGnBnmU3SXGd+G8IsHvhCOl83XvQO75dgqmOmMAvwsNtgc7jUQIDgXypI4KMnd6O
 Bm8HkYi16UX7+jZJu+BTLKhPD1I2BXJ5tvRSymVdDkzsYffNO+Rg9LNRsuS1YbM1bG
 kgivmCN/59omZJUGTrFfb3YHyg4PpE4QXH8Pq91DaF7XgqbU69sv5u/CIvPX+orVIJ
 EPuv0ZngdPeFm7gHFKwl4Xt3DkT+0m1g8rsYaSqJ7dsn0zdxNvPNEPIWrw33fJFm/s
 fnAxKaPT4d+di9wmjOfNwKLI61t3b+6q76AIr+03hGGZv7IIiMazLbJy1RRaXb1xrW
 RJpMQ65e/JnFA==
Date: Mon, 31 Jan 2022 16:23:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v8 00/10] vgaarb: Rework default VGA device selection
Message-ID: <20220131222342.GA517488@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106000658.243509-1-helgaas@kernel.org>
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

[+to Maarten, Maxime, Thomas; beginning of thread:
https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]

On Wed, Jan 05, 2022 at 06:06:48PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Current default VGA device selection fails in some cases because part of it
> is done in the vga_arb_device_init() subsys_initcall, and some arches
> enumerate PCI devices in pcibios_init(), which runs *after* that.

Where are we at with this series?  Is there anything I can do to move
it forward?

Bjorn

> For example:
> 
>   - On BMC system, the AST2500 bridge [1a03:1150] does not implement
>     PCI_BRIDGE_CTL_VGA.  This is perfectly legal but means the legacy VGA
>     resources won't reach downstream devices unless they're included in the
>     usual bridge windows.
> 
>   - vga_arb_select_default_device() will set a device below such a bridge
>     as the default VGA device as long as it has PCI_COMMAND_IO and
>     PCI_COMMAND_MEMORY enabled.
> 
>   - vga_arbiter_add_pci_device() is called for every VGA device, either at
>     boot-time or at hot-add time, and it will also set the device as the
>     default VGA device, but ONLY if all bridges leading to it implement
>     PCI_BRIDGE_CTL_VGA.
> 
>   - This difference between vga_arb_select_default_device() and
>     vga_arbiter_add_pci_device() means that a device below an AST2500 or
>     similar bridge can only be set as the default if it is enumerated
>     before vga_arb_device_init().
> 
>   - On ACPI-based systems, PCI devices are enumerated by acpi_init(), which
>     runs before vga_arb_device_init().
> 
>   - On non-ACPI systems, like on MIPS system, they are enumerated by
>     pcibios_init(), which typically runs *after* vga_arb_device_init().
> 
> This series consolidates all the default VGA device selection in
> vga_arbiter_add_pci_device(), which is always called after enumerating a
> PCI device.
> 
> Almost all the work here is Huacai's.  I restructured it a little bit and
> added a few trivial patches on top.
> 
> I'd like to move vgaarb.c to drivers/pci eventually, but there's another
> initcall ordering snag that needs to be resolved first, so this leaves 
> it where it is.
> 
> Bjorn
> 
> Version history:
> V0 original implementation as final quirk to set default device.
> https://lore.kernel.org/r/20210514080025.1828197-6-chenhuacai@loongson.cn
> 
> V1 rework vgaarb to do all default device selection in
> vga_arbiter_add_pci_device().
> https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
> 
> V2 move arbiter to PCI subsystem, fix nits.
> https://lore.kernel.org/r/20210722212920.347118-1-helgaas@kernel.org
> 
> V3 rewrite the commit log of the last patch (which is also summarized
> by Bjorn).
> https://lore.kernel.org/r/20210820100832.663931-1-chenhuacai@loongson.cn
> 
> V4 split the last patch to two steps.
> https://lore.kernel.org/r/20210827083129.2781420-1-chenhuacai@loongson.cn
> 
> V5 split Patch-9 again and sort the patches.
> https://lore.kernel.org/r/20210911093056.1555274-1-chenhuacai@loongson.cn
> 
> V6 split Patch-5 again and sort the patches again.
> https://lore.kernel.org/r/20210916082941.3421838-1-chenhuacai@loongson.cn
> 
> V7 stop moving vgaarb to drivers/pci because of ordering issues with
> misc_init().
> https://lore.kernel.org/r/20211015061512.2941859-1-chenhuacai@loongson.cn
> https://lore.kernel.org/r/CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU27KHWcyWKkMftEsA@mail.gmail.com
> 
> 
> Bjorn Helgaas (8):
>   vgaarb: Factor out vga_select_framebuffer_device()
>   vgaarb: Factor out default VGA device selection
>   vgaarb: Move framebuffer detection to ADD_DEVICE path
>   vgaarb: Move non-legacy VGA detection to ADD_DEVICE path
>   vgaarb: Move disabled VGA device detection to ADD_DEVICE path
>   vgaarb: Remove empty vga_arb_device_card_gone()
>   vgaarb: Use unsigned format string to print lock counts
>   vgaarb: Replace full MIT license text with SPDX identifier
> 
> Huacai Chen (2):
>   vgaarb: Move vga_arb_integrated_gpu() earlier in file
>   vgaarb: Log bridge control messages when adding devices
> 
>  drivers/gpu/vga/vgaarb.c | 311 +++++++++++++++++++--------------------
>  1 file changed, 154 insertions(+), 157 deletions(-)
> 
> -- 
> 2.25.1
> 
