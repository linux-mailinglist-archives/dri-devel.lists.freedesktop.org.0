Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF81AA9B1A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B0910E31D;
	Mon,  5 May 2025 17:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pVgeuiOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F32010E31D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 17:53:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E83F5C28BA;
 Mon,  5 May 2025 17:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFE2C4CEE4;
 Mon,  5 May 2025 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746467620;
 bh=If2yQHUpOYXNi7h5WH2xXUgl2H6BEu4nX0tI5Wsf/6A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pVgeuiOt37I2LFerAHoX6oPZW/dK5DC0NL3P9h53wbYEKbkZwu5GmDJORp0pxKaD2
 6AfTh59G7uVc/+PymfRnSrC+1YM3T2+9pg1Ax/pRbn0sYNaY/DgFJIvhtaFt/bt1JJ
 HNT4CtLh1Y8wrYx1hU0304Hmylx4wmbudx6MEl6+gGXCMfi+c+CwFqROj/d5bmAZ6z
 6wDWZ3lDbqU69SwFa6zSHuOL05IQzJuBpkSK0C8IDl4MYElwoue7fft1xBgsH8wGlv
 Qlo7XY5nnsh9+XMDCt89G/z8o4sl8/F+1UKbMgeWoXYrdOBCU1dHuT15cHQ/zC6Ytm
 dVqd1uGidZK+A==
Date: Mon, 5 May 2025 12:53:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, iivanov@suse.de, tiwai@suse.de, bhelgaas@google.com,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] video: screen_info: Relocate framebuffers behind PCI
 bridges
Message-ID: <20250505175338.GA986436@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14971422-04af-4f0e-8c3b-7aa97e7af2a5@suse.de>
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

On Mon, May 05, 2025 at 03:05:34PM +0200, Thomas Zimmermann wrote:
> Am 22.04.25 um 23:47 schrieb Bjorn Helgaas:
> > On Tue, Apr 22, 2025 at 09:49:57AM +0200, Thomas Zimmermann wrote:
> > > Apply bridge window offsets to screen_info framebuffers during
> > > relocation. Fixes invalid access to I/O memory.
> > > 
> > > Resources behind a PCI bridge can be located at a certain offset
> > > in the kernel's I/O range. The framebuffer memory range stored in
> > > screen_info refers to the offset as seen during boot (essentialy 0).
> > > During boot up, the kernel may assign a different memory offset to
> > > the bridge device and thereby relocating the framebuffer address of
> > > the PCI graphics device as seen by the kernel. The information in
> > > screen_info must be updated as well.
> > I can't see the bug report below, so I'm not sure what's happening
> > here.  Apparently the platform is one where PCI bus addresses are not
> > identical to CPU physical addresses.  On such platforms, the PCI host
> > bridge applies an offset between CPU and PCI addresses.  There are
> > several systems like that, but I'm not aware of any that change that
> > CPU->PCI bus address offset at runtime.
> > 
> > So I suspect the problem is not that the kernel has assigned a
> > different offset.  I think it's more likely that the hardware or
> > firmware has determined the offset before the kernel starts, and this
> > code just doesn't account for that.
> 
> Right, that's what I'm trying to say. I guess my explanation simply isn't
> clear.

Yeah, the part about the "kernel assigning a different offset" is a
bit misleading because the kernel doesn't actually assign or *change*
that offset; it only *discovers* the offset, typically from an ACPI
_TRA method or from device tree.

> > > Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696
> > This bug isn't public.  Can it be made public?  Or even better, a
> > report at https://bugzilla.kernel.org?
> 
> Try again, please. I've updated the settings of this bug report.

Works now, thanks!

> > > @@ -69,10 +69,21 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
> > >   	for (i = 0; i < numres; ++i) {
> > >   		struct resource *r = &res[i];
> > > +		struct pci_bus_region bus_region = {
> > > +			.start = r->start,
> > > +			.end = r->end,
> > > +		};
> >
> > screen_info_resources() above fills in "struct resource res[]", but
> > that's not quite right.  A struct resource contains CPU addresses, and
> > screen_info_resources() fills in PCI bus addresses (0xa0000, etc).
> > 
> > struct pci_bus_region is meant to hold PCI bus addresses, so this
> > assignment gets them back where they should be.
> > 
> > >   		const struct resource *pr;
> > >   		if (!(r->flags & IORESOURCE_MEM))
> > >   			continue;
> > > +
> > > +		/*
> > > +		 * Translate the address to resource if the framebuffer
> > > +		 * is behind a PCI bridge.
> > > +		 */
> > > +		pcibios_bus_to_resource(pdev->bus, r, &bus_region);
> >
> > And this converts the PCI bus addresses to CPU addresses, so this
> > makes sense.
> > 
> > The comment might be a little misleading, though.  When PCI bus
> > addresses are different from CPU addresses, it's because the PCI host
> > bridge has applied an offset.  This only happens at the host bridge,
> > never at a PCI-PCI bridge (which is what "PCI bridge" usually means).
> > 
> > The commit log and comments could maybe be clarified, but this all
> > looks to me like it's doing the right thing in spite of abusing the
> > use of struct resource.
> 
> Thanks for reviewing. I'll try to clarify on the commit message. Not sure
> how to change the issue with struct pci_bus_region though.

Yeah, I don't know either.  screen_info_resources() takes a struct
resource pointer, but puts bus addresses into it.  That's misleading
at best, but it would be quite a bit more work to fix that.

I'm not sure we have a generic struct for bus addresses.  We have
struct pci_bus_region, but I'm not sure if screen_info is necessarily
specific to PCI.

Bjorn
