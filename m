Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC733F227F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 23:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C306E903;
	Thu, 19 Aug 2021 21:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D16E903
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 21:52:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16DA661029;
 Thu, 19 Aug 2021 21:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629409962;
 bh=lVxMSHjueZlMfEBoUSerhjw3+tnhPwfYJwK4Bjj66FE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=U5X0Iox8zg+g4AdUXxKc66LA0Ku4gfX4YtZXt8g0KcL1qPsxVaXnc1oRXTm9Sm+Aj
 9oMnyecskuAJgQtaKLbpj5C8C23tXWjlF/q8hQpZEiCxHicpOq9IBTIGaSZwWq7Tu6
 W7AEHT6IWUcDyxvbrXz/SfPxuE5SBGY55wnwTIaTHiwAxOMlzCJh4WTlnMasPJLK2H
 WvEhKG9CPEsYvzMNL6aa9D0bg5v6xqkp4JH8C8AUkK0eLo3LFVCMcBp4eyMKPJto70
 N/FAp6hRtvWinx99Uf8sCTFxPot4aIyB87TfXypFUJ4hx9h7Rc1Q1memGl26W67BIt
 L418Cy9FD+8gQ==
Date: Thu, 19 Aug 2021 16:52:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
Message-ID: <20210819215240.GA3241693@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809185901.GA2176971@bjorn-Precision-5520>
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

On Mon, Aug 09, 2021 at 01:59:01PM -0500, Bjorn Helgaas wrote:
> On Tue, Aug 03, 2021 at 12:06:44PM -0500, Bjorn Helgaas wrote:
> > On Sat, Jul 24, 2021 at 05:30:02PM +0800, Huacai Chen wrote:
> > > On Sat, Jul 24, 2021 at 8:10 AM Bjorn Helgaas <helgaas@kernel.org> wrote:

> > > > Thanks for the above; that was helpful.  To summarize:
> > > >
> > > >   - On your system, the AST2500 bridge [1a03:1150] does not implement
> > > >     PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
> > > >     legacy VGA resources won't reach downstream devices unless they're
> > > >     included in the usual bridge windows.
> > > >
> > > >   - vga_arb_select_default_device() will set a device below such a
> > > >     bridge as the default VGA device as long as it has PCI_COMMAND_IO
> > > >     and PCI_COMMAND_MEMORY enabled.
> > > >
> > > >   - vga_arbiter_add_pci_device() is called for every VGA device,
> > > >     either at boot-time or at hot-add time, and it will also set the
> > > >     device as the default VGA device, but ONLY if all bridges leading
> > > >     to it implement PCI_BRIDGE_CTL_VGA.
> > > >
> > > >   - This difference between vga_arb_select_default_device() and
> > > >     vga_arbiter_add_pci_device() means that a device below an AST2500
> > > >     or similar bridge can only be set as the default if it is
> > > >     enumerated before vga_arb_device_init().
> > > >
> > > >   - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
> > > >     which runs before vga_arb_device_init().
> > > >
> > > >   - On non-ACPI systems, like your MIPS system, they are enumerated by
> > > >     pcibios_init(), which typically runs *after*
> > > >     vga_arb_device_init().
> > > >
> > > > So I think the critical change is actually that you made
> > > > vga_arb_update_default_device(), which you call from
> > > > vga_arbiter_add_pci_device(), set the default device even if it does
> > > > not own the VGA resources because an upstream bridge doesn't implement
> > > > PCI_BRIDGE_CTL_VGA, i.e.,
> > > >
> > > >   (vgadev->owns & VGA_RSRC_LEGACY_MASK) != VGA_RSRC_LEGACY_MASK
> > > >
> > > > Does that seem right?
> > >
> > > Yes, that's right.
> > 
> > I think that means I screwed up.  I somehow had it in my head that the
> > hot-add path would never set the default VGA device.  But that is
> > false.
> > 
> > I still think we should move vgaarb.c to drivers/pci/ and get it more
> > tightly integrated into the PCI core.
> > 
> > BUT that's a lot of churn and obscures the simple change that fixes
> > the problem for you.  So I think the first step should be the change
> > to vga_arb_update_default_device() so it sets the default device even
> > when the upstream bridge doesn't implement PCI_BRIDGE_CTL_VGA.
> > 
> > That should be a relatively small change, and I think it's better to
> > make the fix before embarking on major restructuring.
> 
> To make sure this doesn't get lost: I'm hoping you can separate out
> and post the small patch to vga_arb_update_default_device().
> 
> I can look at the move/restructure stuff later.

What's happening with this?  I'm still assuming you can post a small
patch to vga_arb_update_default_device() that's suitable for v5.15,
Huacai.

Otherwise I'm afraid we won't make any forward progress this cycle.

Bjorn
