Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0E3E4C8B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252BB89D00;
	Mon,  9 Aug 2021 18:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62E89D00
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 18:59:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F49560FE3;
 Mon,  9 Aug 2021 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628535543;
 bh=S0RgmCBdI1dbiqAimstrJEuW072G2RP/9teOq+ZKJ8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VsiijoOt+eWYgZlBVPueoOaEhsFmdX+6yYAXDtSb8eqZxMUUq6K41LcO0s0YKZdLh
 x9TU0rPHWxQkens1v1x2y6H1IWQttUIM2CFTm/+qTks5pxSxcowXFa2zjiMlWcziL5
 dCGkoUTVboafAslZLlFEMOVnODJbiatWHZrF12JLATKBHNGoi44fbG8mVZ4ZMt9WlE
 RW9PxVKOWW8hqP1WwNZpc9EtoVMz5Tu5cIwcGhy5ZHd5PPErZRkAvbLlXFCFmmcJwk
 sEEKsfGnMInzaTD6HigFiEPkst9Ln/ySeakhJ98mR2WirH0S0XVk6LAvNwkGB7ho2n
 pE+cPKsgZ1zpA==
Date: Mon, 9 Aug 2021 13:59:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
Message-ID: <20210809185901.GA2176971@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803170642.GA1556172@bjorn-Precision-5520>
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

On Tue, Aug 03, 2021 at 12:06:44PM -0500, Bjorn Helgaas wrote:
> On Sat, Jul 24, 2021 at 05:30:02PM +0800, Huacai Chen wrote:
> > Hi, Bjorn,
> > 
> > On Sat, Jul 24, 2021 at 8:10 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Fri, Jul 23, 2021 at 05:53:36PM +0800, Huacai Chen wrote:
> > > > Hi, Bjorn,
> > > >
> > > > On Fri, Jul 23, 2021 at 5:29 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > >
> > > > > From: Bjorn Helgaas <bhelgaas@google.com>
> > > > >
> > > > > This is a little bit of rework and extension of Huacai's nice work at [1].
> > > > >
> > > > > It moves the VGA arbiter to the PCI subsystem, fixes a few nits, and breaks
> > > > > a few pieces off Huacai's patch to make the main patch a little smaller.
> > > > >
> > > > > That last patch is still not very small, and it needs a commit log, as I
> > > > > mentioned at [2].
> > > > >
> > > > > All comments welcome!
> > > > >
> > > > > [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> > > > > [2] https://lore.kernel.org/r/20210720221923.GA43331@bjorn-Precision-5520
> > > > Thank you for your splitting. Your two questions are answered in the following.
> > > >
> > > > (1) explain why your initcall ordering is unusual.
> > > > The original problem happens on MIPS. vga_arb_device_init() and
> > > > pcibios_init() are both wrapped by subsys_initcall(). The order of
> > > > functions in the same level depends on the Makefile.
> > > >
> > > > TOP level Makefile:
> > > > drivers-y       := drivers/ sound/
> > > > ....
> > > > include arch/$(SRCARCH)/Makefile
> > > >
> > > > drivers/Makefile:
> > > > obj-$(CONFIG_ACPI)              += acpi/
> > > > ....
> > > > obj-y                           += gpu/
> > > >
> > > > arch/mips/Makefile:
> > > > drivers-$(CONFIG_PCI)           += arch/mips/pci/
> > > >
> > > > This makes pcibios_init() in arch/mips/pci/ placed after
> > > > vga_arb_device_init() in drivers/gpu. ACPI-based systems have no
> > > > problems because acpi_init() in drivers/acpi is placed before
> > > > vga_arb_device_init().
> > >
> > > Thanks for the above; that was helpful.  To summarize:
> > >
> > >   - On your system, the AST2500 bridge [1a03:1150] does not implement
> > >     PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
> > >     legacy VGA resources won't reach downstream devices unless they're
> > >     included in the usual bridge windows.
> > >
> > >   - vga_arb_select_default_device() will set a device below such a
> > >     bridge as the default VGA device as long as it has PCI_COMMAND_IO
> > >     and PCI_COMMAND_MEMORY enabled.
> > >
> > >   - vga_arbiter_add_pci_device() is called for every VGA device,
> > >     either at boot-time or at hot-add time, and it will also set the
> > >     device as the default VGA device, but ONLY if all bridges leading
> > >     to it implement PCI_BRIDGE_CTL_VGA.
> > >
> > >   - This difference between vga_arb_select_default_device() and
> > >     vga_arbiter_add_pci_device() means that a device below an AST2500
> > >     or similar bridge can only be set as the default if it is
> > >     enumerated before vga_arb_device_init().
> > >
> > >   - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
> > >     which runs before vga_arb_device_init().
> > >
> > >   - On non-ACPI systems, like your MIPS system, they are enumerated by
> > >     pcibios_init(), which typically runs *after*
> > >     vga_arb_device_init().
> > >
> > > So I think the critical change is actually that you made
> > > vga_arb_update_default_device(), which you call from
> > > vga_arbiter_add_pci_device(), set the default device even if it does
> > > not own the VGA resources because an upstream bridge doesn't implement
> > > PCI_BRIDGE_CTL_VGA, i.e.,
> > >
> > >   (vgadev->owns & VGA_RSRC_LEGACY_MASK) != VGA_RSRC_LEGACY_MASK
> > >
> > > Does that seem right?
> >
> > Yes, that's right.
> 
> I think that means I screwed up.  I somehow had it in my head that the
> hot-add path would never set the default VGA device.  But that is
> false.
> 
> I still think we should move vgaarb.c to drivers/pci/ and get it more
> tightly integrated into the PCI core.
> 
> BUT that's a lot of churn and obscures the simple change that fixes
> the problem for you.  So I think the first step should be the change
> to vga_arb_update_default_device() so it sets the default device even
> when the upstream bridge doesn't implement PCI_BRIDGE_CTL_VGA.
> 
> That should be a relatively small change, and I think it's better to
> make the fix before embarking on major restructuring.

To make sure this doesn't get lost: I'm hoping you can separate out
and post the small patch to vga_arb_update_default_device().

I can look at the move/restructure stuff later.

> > > [1] https://lore.kernel.org/r/CAAhV-H4pn53XC7qVvwM792ppkQRnjWpPDwmrhBv8twgQu0eabQ@mail.gmail.com
> > >
> > > > (2) explain the approach, which IIUC is basically to add the
> > > > vga_arb_select_default_device() functionality to
> > > > vga_arbiter_add_pci_device().
> > > > vga_arb_select_default_device() has only one chance to be called, we
> > > > want to make it be called every time a new vga device is added. So
> > > > rename it to vga_arb_update_default_device() and move the callsite to
> > > > vga_arbiter_add_pci_device().
> > > >
> > > > I think you know all the information which you need now. And you can
> > > > reorganize the commit message based on the existing one. As English is
> > > > not my first language, the updated commit message written by me may
> > > > still not be as good as you want.:)
> > > >
> > > > Huacai
> > > >
> > > > > Bjorn Helgaas (4):
> > > > >   PCI/VGA: Move vgaarb to drivers/pci
> > > > >   PCI/VGA: Replace full MIT license text with SPDX identifier
> > > > >   PCI/VGA: Use unsigned format string to print lock counts
> > > > >   PCI/VGA: Remove empty vga_arb_device_card_gone()
> > > > >
> > > > > Huacai Chen (5):
> > > > >   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
> > > > >   PCI/VGA: Prefer vga_default_device()
> > > > >   PCI/VGA: Split out vga_arb_update_default_device()
> > > > >   PCI/VGA: Log bridge control messages when adding devices
> > > > >   PCI/VGA: Rework default VGA device selection
> > > > >
> > > > >  drivers/gpu/vga/Kconfig           |  19 ---
> > > > >  drivers/gpu/vga/Makefile          |   1 -
> > > > >  drivers/pci/Kconfig               |  19 +++
> > > > >  drivers/pci/Makefile              |   1 +
> > > > >  drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
> > > > >  5 files changed, 126 insertions(+), 183 deletions(-)
> > > > >  rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
