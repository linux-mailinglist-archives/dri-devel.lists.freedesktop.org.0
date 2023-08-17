Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AF7800CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3971E10E0E2;
	Thu, 17 Aug 2023 22:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A833510E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:08:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D961E64EEB;
 Thu, 17 Aug 2023 22:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C6BC433C8;
 Thu, 17 Aug 2023 22:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692310135;
 bh=a1orUgcHwxYmGrzRQ+v2rjU2RmkQYLHUPon2TagJ+sw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DPniugHCO81IqkDRf3YJBqDoXz/BYPiNmB+B4wkiwlU3QwDwNbZPfPo14oWMtiXkH
 G0W6MbU5JDxtOCAtJiXJmMBvTa82n5iNkmst20F7LdpiORS6Nr3bV5cuL58wFt22K5
 7K4JUhbk3BlU00PNgCCkSwys93fQKjykyDYqVhtuJbgd7+Rpr6ljqsAGReGo++Ooai
 MTbBoMX+lFLvOu2IfGZZC7O5Z+lcI27vGw1oGaI3ixY9nSbfGe6BVIv0DekoDi2Jgj
 SA1lNI3RAyIv+hn0ays8upINxdrDe+HP2egpcAEbGIpxgaApxiKdT50W5625weLM9f
 JC26E7X0XCd7Q==
Date: Thu, 17 Aug 2023 17:08:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Message-ID: <20230817220853.GA328159@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815220527.1316537-1-suijingfeng@loongson.cn>
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
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 06:05:27AM +0800, Sui Jingfeng wrote:
> Currently, the vga_is_firmware_default() function only works on x86 and
> ia64, it is a no-op on ARM, ARM64, PPC, RISC-V, etc. This patch completes
> the implementation for the rest of the architectures. The added code tries
> to identify the PCI(e) VGA device that owns the firmware framebuffer
> before PCI resource reallocation happens.

As far as I can tell, this is basically identical to the existing
vga_is_firmware_default(), except that this patch funs that code as a
header fixup, so it happens before any PCI BAR reallocations happen.

That sounds like a good idea, because this is all based on the
framebuffer in screen_info, and screen_info was initialized before PCI
enumeration, and it certainly doesn't account for any BAR changes done
by the PCI core.

So why would we keep vga_is_firmware_default() at all?  If the header
fixup has already identified the firmware framebuffer, it seems
pointless to look again later.

> This patch makes the vga_is_firmware_default() function works on whatever
> arch that has UEFI GOP support. But we make it available only on platforms
> where PCI resource relocation happens. if the provided method proves to be
> effective and reliable, it can be expanded to other arch easily.
>
> v2:
> 	* Fix test robot warnnings and fix typos
> 
> v3:
> 	* Fix linkage problems if the global screen_info is not exported
> 
> v4:
> 	* Handle linkage problems by hiding behind of CONFIG_SYSFB,
> 	* Drop side-effects and simplify.

The v2, v3, v4 changelog is nice, but we don't need it in the commit
log itself, where it will become part of the git history.  It should
go in a cover letter or after the "---" marker:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.0#n678

> Since only one GPU could owns the firmware fb in normal case, things
> are almost done once we determine the boot VGA selected by firmware.
> By using the DECLARE_PCI_FIXUP_CLASS_HEADER(), we also ensure that we
> could identify the primary display (if there do have one) before PCI
> resource reallocation happen.
> 
> The method provided in this patch will be effective as long as the target
> platform has a way set up the kernel's screen_info. For the machines with
> UEFI firmware, the screen_info is typically set up by the UEFI stub with
> respect to the UEFI GOP protocol. Since the UEFI stub executes in the
> context of the decompressor, and it cannot access the kernel's screen_info
> directly. Hence, the efi stub copies the screen_info provided by firmware
> to kernel's counterpart. Therefore, we handle linkage problems by using
> the CONFIG_EFI guard.  Since when CONFIG_EFI is set, the kernel's
> screen_info is guaranteed to be static linkable for arm, arm64, riscv.
> V4 of this patch handle linkage problems by hiding behind of CONFIG_SYSFB,
> since sysfb reference the global screen_info as well.
>
> This patch is tested on:
> 
> 1) LS3A5000+LS7A1000 platform with three video cards
> 
> $ lspci | grep VGA
> 
>  00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display Controller) (rev 01)
>  03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XT [Radeon HD 7470/8470 / R5 235/310 OEM]
>  07:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)
>  08:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)
> 
> Before apply this patch:
> 
> [    0.361748] pci 0000:00:06.1: vgaarb: setting as boot VGA device
> [    0.361751] pci 0000:00:06.1: vgaarb: bridge control possible
> [    0.361753] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.361763] pci 0000:03:00.0: vgaarb: bridge control possible
> [    0.361765] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361771] pci 0000:07:00.0: vgaarb: bridge control possible
> [    0.361773] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361777] pci 0000:08:00.0: vgaarb: bridge control possible
> [    0.361779] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361781] vgaarb: loaded
> [    0.367838] pci 0000:00:06.1: Overriding boot device as 1002:6778
> [    0.367841] pci 0000:00:06.1: Overriding boot device as 5333:9070
> [    0.367843] pci 0000:00:06.1: Overriding boot device as 5333:9070
> 
> After apply this patch:
> 
> [    0.357780] pci 0000:03:00.0: vgaarb: BAR 0 contains firmware FB
> [    0.361726] pci 0000:00:06.1: vgaarb: setting as boot VGA device
> [    0.361729] pci 0000:00:06.1: vgaarb: bridge control possible
> [    0.361731] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.361741] pci 0000:03:00.0: vgaarb: setting as boot VGA device (overriding previous)
> [    0.361743] pci 0000:03:00.0: vgaarb: bridge control possible
> [    0.361745] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361751] pci 0000:07:00.0: vgaarb: bridge control possible
> [    0.361753] pci 0000:07:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361757] pci 0000:08:00.0: vgaarb: bridge control possible
> [    0.361759] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.361761] vgaarb: loaded
> [   14.730255] radeon 0000:03:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> 
> Please note that before apply this patch, vgaarb can not select the
> right boot vga due to weird logic introduced with the commit
> 57fc7323a8e7c ("LoongArch: Add PCI controller support")

If we need this reference to 57fc7323a8e7c, we need more specifics
about what the "weird logic" is.  pci_fixup_vgadev() is the only
obvious VGA connection, so I suppose it's related to that.

> Please also note that VARM Bar do moves on LoongArch:
> 
> $ dmesg | grep 0000:03:00.0
> 
> [    0.357688] pci 0000:03:00.0: [1002:6778] type 00 class 0x030000
> [    0.357713] pci 0000:03:00.0: reg 0x10: [mem 0xe0050000000-0xe005fffffff 64bit pref]
> [    0.357730] pci 0000:03:00.0: reg 0x18: [mem 0xe0065300000-0xe006531ffff 64bit]
> [    0.357741] pci 0000:03:00.0: reg 0x20: [io  0x20000-0x200ff]
> [    0.357762] pci 0000:03:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
> [    0.357780] pci 0000:03:00.0: vgaarb: BAR0 contains firmware FB
> 
> [    0.359809] pci 0000:03:00.0: BAR 0: assigned [mem 0xe0030000000-0xe003fffffff 64bit pref]
> [    0.359821] pci 0000:03:00.0: BAR 2: assigned [mem 0xe0065200000-0xe006521ffff 64bit]
> [    0.359832] pci 0000:03:00.0: BAR 6: assigned [mem 0xe0065220000-0xe006523ffff pref]
> [    0.359846] pci 0000:03:00.0: BAR 4: assigned [io  0x5000-0x50ff]
> [    0.361741] pci 0000:03:00.0: vgaarb: setting as boot VGA device (overriding previous)
> [    0.361743] pci 0000:03:00.0: vgaarb: bridge control possible
> [    0.361745] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none

I guess the point here is that:

  - 03:00.0 BAR 0 is [mem 0xe0050000000-0xe005fffffff]

  - screen_info says the framebuffer is
    [mem 0xe0050000000-0xe005fffffff] (or part of it)

  - Therefore, we want 03:00.0 to be the default VGA

  - PCI core reassigns 03:00.0 BAR 0 to
    [mem 0xe0030000000-0xe003fffffff]

  - PCI core assigns a 00:06.1 BAR to contain
    [mem 0xe0050000000-0xe005fffffff]

  - vga_is_firmware_default() incorrectly decides 00:06.1 should be
    the default VGA because it has a BAR that contains the screen_info
    address range

Is that right?  If so, log messages like this would show the problem:

  pci 0000:00:06.0: reg 0x10: [mem ...]
  pci 0000:03:00.0: reg 0x10: [mem 0xe0050000000-0xe005fffffff]
  pci 0000:03:00.0: BAR 0: assigned [mem 0xe0030000000-0xe003fffffff]
  pci 0000:00:06.0: BAR X: assigned [mem 0xe0050000000-0xe005fffffff]
  pci 0000:00:06.1: vgaarb: setting as boot VGA device

and something like this would show the fix:

  pci 0000:00:06.0: reg 0x10: [mem ...]
  pci 0000:03:00.0: reg 0x10: [mem 0xe0050000000-0xe005fffffff]
  pci 0000:03:00.0: vgaarb: BAR 0 [mem 0xe0050000000-0xe005fffffff] contains firmware framebuffer [mem 0xe0050000000-0xe005fffffff]
  pci 0000:03:00.0: vgaarb: setting as boot VGA device
  pci 0000:03:00.0: BAR 0: assigned [mem 0xe0030000000-0xe003fffffff]
  pci 0000:00:06.0: BAR X: assigned [mem 0xe0050000000-0xe005fffffff]

I don't care about all the "bridge control possible" and "VGA device
added: decodes=..." messages.  Those aren't relevant to this problem.

I don't think the lspci output is relevant either.  That would be
relevant to a patch removing the Loongson pci_fixup_vgadev(), but as
far as I can see, only the screen_info framebuffer address, the BAR
contents, and the PCI core BAR reassignment are relevant to *this*
patch.

> 2) LS3A5000+LS7A2000 platform with four video cards
> 
> $ lspci | grep VGA
> 
> 00:06.1 VGA compatible controller: Loongson Technology LLC Device 7a36 (rev 02)
> 01:00.0 VGA compatible controller: Silicon Motion, Inc. Device 0768 (rev 03)
> 04:00.0 VGA compatible controller: Device 0709:0001 (rev 01)
> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Lexa PRO [Radeon 540/540X/550/550X / RX 540X/550/550X] (rev c7)
> 
> Before apply this patch:
> 
> [    0.359345] pci 0000:00:06.1: vgaarb: setting as boot VGA device
> [    0.359347] pci 0000:00:06.1: vgaarb: bridge control possible
> [    0.359349] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.359358] pci 0000:01:00.0: vgaarb: bridge control possible
> [    0.359360] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359364] pci 0000:04:00.0: vgaarb: bridge control possible
> [    0.359366] pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359369] pci 0000:05:00.0: vgaarb: bridge control possible
> [    0.359370] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359373] vgaarb: loaded
> [    0.365852] pci 0000:00:06.1: Overriding boot device as 126F:768
> [    0.365855] pci 0000:00:06.1: Overriding boot device as 709:1
> [    0.365857] pci 0000:00:06.1: Overriding boot device as 1002:699F
> [   14.011380] amdgpu 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> 
> After apply this patch:
> 
> [    0.357142] pci 0000:05:00.0: vgaarb: BAR 0 contains firmware FB
> [    0.359291] pci 0000:00:06.1: vgaarb: setting as boot VGA device
> [    0.359294] pci 0000:00:06.1: vgaarb: bridge control possible
> [    0.359296] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [    0.359305] pci 0000:01:00.0: vgaarb: bridge control possible
> [    0.359307] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359311] pci 0000:04:00.0: vgaarb: bridge control possible
> [    0.359312] pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359316] pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
> [    0.359318] pci 0000:05:00.0: vgaarb: bridge control possible
> [    0.359319] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> [    0.359321] vgaarb: loaded
> [   14.399907] amdgpu 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> 
> Again, the VRAM Bar do moves:
> 
> $ dmesg | grep 0000:05:00.0
> 
> [    0.357076] pci 0000:05:00.0: [1002:699f] type 00 class 0x030000
> [    0.357093] pci 0000:05:00.0: reg 0x10: [mem 0xe0030000000-0xe003fffffff 64bit pref]
> [    0.357104] pci 0000:05:00.0: reg 0x18: [mem 0xe0040000000-0xe00401fffff 64bit pref]
> [    0.357112] pci 0000:05:00.0: reg 0x20: [io  0x40000-0x400ff]
> [    0.357120] pci 0000:05:00.0: reg 0x24: [mem 0xe0074300000-0xe007433ffff]
> [    0.357128] pci 0000:05:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
> [    0.357142] pci 0000:05:00.0: vgaarb: BAR0 contains firmware FB
> [    0.357720] pci 0000:05:00.0: BAR 0: assigned [mem 0xe0060000000-0xe006fffffff 64bit pref]
> [    0.357728] pci 0000:05:00.0: BAR 2: assigned [mem 0xe0058000000-0xe00581fffff 64bit pref]
> [    0.357736] pci 0000:05:00.0: BAR 5: assigned [mem 0xe0072b00000-0xe0072b3ffff]
> [    0.357740] pci 0000:05:00.0: BAR 6: assigned [mem 0xe0072b40000-0xe0072b5ffff pref]
> [    0.357750] pci 0000:05:00.0: BAR 4: assigned [io  0x5000-0x50ff]
> [    0.359316] pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
> [    0.359318] pci 0000:05:00.0: vgaarb: bridge control possible
> [    0.359319] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> 
> 3) Mips (LS3A4000/LS7A1000 + SM750 + Radeon)
> 
> Loongson Mips have no UEFI GOP support, we test this patch by modifying the
> screen_info manually.
> 
> $ lspci | grep VGA
> 
>  04:00.0 VGA compatible controller: Silicon Motion, Inc. SM750 (rev a1)
>  05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] (rev 87)
> 
> $ dmesg | grep 04:00.0
> 
>  pci 0000:04:00.0: [126f:0750] type 00 class 0x030000
>  pci 0000:04:00.0: reg 0x10: [mem 0x58000000-0x5bffffff pref]
>  pci 0000:04:00.0: reg 0x14: [mem 0x5f000000-0x5f1fffff]
>  pci 0000:04:00.0: reg 0x30: [mem 0xffff0000-0xffffffff pref]
>  pci 0000:04:00.0: BAR 0: assigned [mem 0x50000000-0x53ffffff pref]
>  pci 0000:04:00.0: BAR 1: assigned [mem 0x54000000-0x541fffff]
>  pci 0000:04:00.0: BAR 6: assigned [mem 0x54200000-0x5420ffff pref]
> 
> $ dmesg | grep 05:00.0
> 
>  pci 0000:05:00.0: [1002:6611] type 00 class 0x030000
>  pci 0000:05:00.0: reg 0x10: [mem 0x40000000-0x4fffffff 64bit pref]
>  pci 0000:05:00.0: reg 0x18: [mem 0x5f300000-0x5f33ffff 64bit]
>  pci 0000:05:00.0: reg 0x20: [io  0x40000-0x400ff]
>  pci 0000:05:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
>  pci 0000:05:00.0: BAR 0: assigned [mem 0x40000000-0x4fffffff 64bit pref]
>  pci 0000:05:00.0: BAR 2: assigned [mem 0x5b300000-0x5b33ffff 64bit]
>  pci 0000:05:00.0: BAR 6: assigned [mem 0x5b340000-0x5b35ffff pref]
>  pci 0000:05:00.0: BAR 4: assigned [io  0x21000-0x210ff]
> 
> Specify the firmware fb at BAR 0 of SM750 by hardcode:
> 
> screen_info = (struct screen_info) {
>     .orig_video_isVGA = VIDEO_TYPE_EFI,
>     .lfb_base = 0x58000000,
>     .lfb_size = 1280 * 800 * 4 * 2,
> };
> 
> $ dmesg | grep vgaarb
> 
>  vgaarb: loaded
>  pci 0000:04:00.0: vgaarb: BAR 0 contains firmware FB
>  pci 0000:04:00.0: vgaarb: setting as boot VGA device
>  pci 0000:04:00.0: vgaarb: bridge control possible
>  pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:05:00.0: vgaarb: bridge control possible
>  pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> 
> Specify the firmware fb at BAR 0 of ATI GPU by hardcode:
> 
> screen_info = (struct screen_info) {
>     .orig_video_isVGA = VIDEO_TYPE_EFI,
>     .lfb_base = 0x40000000,
>     .lfb_size = 1280 * 800 * 4 * 2,
> };
> 
> $ dmesg | grep vgaarb
> 
>  vgaarb: loaded
>  pci 0000:04:00.0: vgaarb: setting as boot VGA device
>  pci 0000:04:00.0: vgaarb: bridge control possible
>  pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:05:00.0: vgaarb: BAR 0 contains firmware FB
>  pci 0000:05:00.0: vgaarb: setting as boot VGA device (overriding previous)
>  pci 0000:05:00.0: vgaarb: bridge control possible
>  pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
>  radeon 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 76 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 5a696078b382..7b6c3a772e91 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -60,7 +60,8 @@ static int vga_count, vga_decode_count;
>  static bool vga_arbiter_used;
>  static DEFINE_SPINLOCK(vga_lock);
>  static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
> -
> +/* The PCI(e) device who owns the firmware framebuffer */
> +static struct pci_dev *pdev_boot_vga;
>  
>  static const char *vga_iostate_to_str(unsigned int iostate)
>  {
> @@ -571,6 +572,9 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
>  
>  		return true;
>  	}
> +#else
> +	if (pdev_boot_vga && pdev_boot_vga == pdev)
> +		return true;
>  #endif
>  	return false;
>  }
> @@ -1555,3 +1559,73 @@ static int __init vga_arb_device_init(void)
>  	return rc;
>  }
>  subsys_initcall_sync(vga_arb_device_init);
> +
> +/*
> + * Get the physical address range that the firmware framebuffer occupies.
> + *
> + * The global screen_info is arch-specific, CONFIG_SYSFB is chosen as
> + * compile-time conditional to suppress linkage problems.
> + */
> +static bool vga_arb_get_firmware_fb_range(resource_size_t *start,
> +					  resource_size_t *end)
> +{
> +	resource_size_t fb_start = 0;
> +	resource_size_t fb_size = 0;
> +	resource_size_t fb_end;
> +
> +#if defined(CONFIG_X86) || defined(CONFIG_IA64) || defined(CONFIG_SYSFB)
> +	fb_start = screen_info.lfb_base;
> +	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_start |= (u64)screen_info.ext_lfb_base << 32;
> +
> +	fb_size = screen_info.lfb_size;
> +#endif
> +
> +	/* No firmware framebuffer support */
> +	if (!fb_start || !fb_size)
> +		return false;
> +
> +	fb_end = fb_start + fb_size - 1;
> +
> +	*start = fb_start;
> +	*end = fb_end;
> +
> +	return true;
> +}
> +
> +/*
> + * Identify the PCI VGA device that contains the firmware framebuffer
> + */
> +static void pci_boot_vga_finder(struct pci_dev *pdev)
> +{
> +	resource_size_t fb_start;
> +	resource_size_t fb_end;
> +	unsigned int i;
> +
> +	/* Already found the pdev which has firmware framebuffer ownership */
> +	if (pdev_boot_vga)
> +		return;
> +
> +	if (!vga_arb_get_firmware_fb_range(&fb_start, &fb_end))
> +		return;
> +
> +	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> +		struct resource *res = &pdev->resource[i];

This is essentially identical to vga_is_firmware_default() so it
should look the same, i.e., it should use pci_dev_for_each_resource().

> +		if (resource_type(res) != IORESOURCE_MEM)
> +			continue;
> +
> +		if (!res->start || !res->end)
> +			continue;
> +
> +		if (res->start <= fb_start && fb_end <= res->end) {
> +			pdev_boot_vga = pdev;
> +
> +			vgaarb_info(&pdev->dev,
> +				    "BAR %d contains firmware FB\n", i);

Print the BAR with %pR and include the framebuffer region from
screen_info in the same format.

> +			break;
> +		}
> +	}
> +}
> +DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
> +			       8, pci_boot_vga_finder);
> -- 
> 2.34.1
> 
