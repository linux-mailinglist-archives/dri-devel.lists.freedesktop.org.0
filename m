Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C040B7C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30D6E5A5;
	Tue, 14 Sep 2021 19:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F06E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:18:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E4A61056;
 Tue, 14 Sep 2021 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631647129;
 bh=lSJtyN1p/GXEGUbXOwvgRy04qIo0QpvCRGtPvbVHV7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZYJ973d8K6ibmK4VCZOxbz8liVixRbZxcn/+aFOllyTBPYYyibZXyY6X/rcW5U7w5
 lCqTOm8s4WYqp5CJYv2wsAj7oziMOWyJCKxWSTMqhlS8Rsn7VlD7Kt6yLtcCvAyWF3
 ttqd6PmOf96edRMrjP3K6ZmMS/o4leHPRpVN2OgOz59I+q9XCON9bIpBYqyUMWR25x
 2HoPY0JewNnVzr6TUd6uVAn4Y+IF9ILu/3EkCfX65Bgx9MdwKWJTMav5ofGv1qKBd2
 YJexpM1Kqn8JU4usJSfX95CT39eI03QFBX9jmCVaDHA7u9+3EVewU717K3ct4yY7De
 Xs5uZB1JAi8qA==
Date: Tue, 14 Sep 2021 14:18:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V5 00/11] PCI/VGA: Rework default VGA device selection
Message-ID: <20210914191847.GA1446332@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911093056.1555274-1-chenhuacai@loongson.cn>
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

On Sat, Sep 11, 2021 at 05:30:45PM +0800, Huacai Chen wrote:
> My original work is at [1].
> 
> Current default VGA device selection fails in some cases:
> 
>   - On BMC system, the AST2500 bridge [1a03:1150] does not implement
>     PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
>     legacy VGA resources won't reach downstream devices unless they're
>     included in the usual bridge windows.
> 
>   - vga_arb_select_default_device() will set a device below such a
>     bridge as the default VGA device as long as it has PCI_COMMAND_IO
>     and PCI_COMMAND_MEMORY enabled.
> 
>   - vga_arbiter_add_pci_device() is called for every VGA device,
>     either at boot-time or at hot-add time, and it will also set the
>     device as the default VGA device, but ONLY if all bridges leading
>     to it implement PCI_BRIDGE_CTL_VGA.
> 
>   - This difference between vga_arb_select_default_device() and
>     vga_arbiter_add_pci_device() means that a device below an AST2500
>     or similar bridge can only be set as the default if it is
>     enumerated before vga_arb_device_init().
> 
>   - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
>     which runs before vga_arb_device_init().
> 
>   - On non-ACPI systems, like on MIPS system, they are enumerated by
>     pcibios_init(), which typically runs *after*
>     vga_arb_device_init().
> 
> So I made vga_arb_update_default_device() to replace the current vga_
> arb_select_default_device(), which will be call from vga_arbiter_add_
> pci_device(), set the default device even if it does not own the VGA
> resources because an upstream bridge doesn't implement PCI_BRIDGE_CTL_
> VGA. And the default VGA device is updated if a better one is found
> (device with legacy resources enabled is better, device owns the
> firmware framebuffer is even better).
> 
> Bjorn do some rework and extension in V2. It moves the VGA arbiter to
> the PCI subsystem, fixes a few nits, and breaks a few pieces to make
> the main patch a little smaller.
> 
> V3 rewrite the commit log of the last patch (which is also summarized
> by Bjorn).
> 
> V4 split the last patch to two steps.
> 
> V5 split big patches again and sort the patches.

Not sure if I'm missing something, or if this is an interim version
and you're working on a v6.

From https://lore.kernel.org/r/20210909175926.GA996660@bjorn-Precision-5520,
I was looking for:

  BUT as I mentioned, I want the very first patch to be the very
  simple 2-line change to vga_arb_update_default_device() that actually
  fixes your problem.

That doesn't seem to be what we have here.

> All comments welcome!
> 
> [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> 
> Bjorn Helgaas (4):
>   PCI/VGA: Move vgaarb to drivers/pci
>   PCI/VGA: Remove empty vga_arb_device_card_gone()
>   PCI/VGA: Use unsigned format string to print lock counts
>   PCI/VGA: Replace full MIT license text with SPDX identifier
> 
> Huacai Chen (7):
>   PCI/VGA: Prefer vga_default_device()
>   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
>   PCI/VGA: Split out vga_arb_update_default_device()
>   PCI/VGA: Update default VGA device if a better one found
>   PCI/VGA: Update default VGA device again for X86/IA64
>   PCI/VGA: Remove vga_arb_select_default_device()
>   PCI/VGA: Log bridge control messages when adding devices
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com> 
> ---
>  drivers/gpu/vga/Kconfig           |  19 ---
>  drivers/gpu/vga/Makefile          |   1 -
>  drivers/pci/Kconfig               |  19 +++
>  drivers/pci/Makefile              |   1 +
>  drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
>  5 files changed, 126 insertions(+), 183 deletions(-)
>  rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
> --
> 2.27.0
> 
