Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 591267BB778
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 14:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD610E1FE;
	Fri,  6 Oct 2023 12:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 545 seconds by postgrey-1.36 at gabe;
 Fri, 06 Oct 2023 12:19:53 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B2EF10E1FE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 12:19:53 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 899A492009C; Fri,  6 Oct 2023 14:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 7CC1892009B;
 Fri,  6 Oct 2023 13:10:45 +0100 (BST)
Date: Fri, 6 Oct 2023 13:10:45 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [-next 1/5] PCI: Add the pci_is_vga() helper
In-Reply-To: <42a15522-7bed-c5b1-1dc3-65446b65e348@loongson.cn>
Message-ID: <alpine.DEB.2.21.2310061246430.20732@angie.orcam.me.uk>
References: <20231005225101.GA792747@bhelgaas>
 <42a15522-7bed-c5b1-1dc3-65446b65e348@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Oct 2023, Sui Jingfeng wrote:

> > I think this makes sense per the spec, but there's always a risk of
> > breaking something, so it's nice if the change actually *fixes*
> > something to make that risk worthwhile.
> 
> 
> Maciej mentioned that PCI_CLASS_NOT_DEFINED_VGA device should also be handled
> in the past.
> see [1]. But if no one interested in PCI_CLASS_NOT_DEFINED_VGA nowaday, then I
> guess
> the gains of this patch may not deserve the time and risk. But I don't mind if
> someone
> would like pick it up for other purpose.

 Well, if we need to determine for whatever purpose whether a PCI/e device 
presents a VGA programming interface, then I think we ought to do this in 
a complete manner.  I'm not sure offhand what could possibly break if we 
write our code according to specs and include PCI_CLASS_NOT_DEFINED_VGA 
devices in the class.

 Yes, I'm aware they won't be the latest and greatest, but they may still 
be there out there in service.  For one I continue using my 30 years old 
Trident 8900C ISA VGA adapter with the most recent Linux kernel.  The card 
serves its purpose, mostly as a glass TTY, so why should I replace it?

 Of course there are broken devices out there regardless, which won't work 
as we expect without special handling or sometimes at all even.  It does 
not mean we should refrain from making the best effort for good compliant 
devices and assume in advance that something will break even if we write 
our code according to the relevant specs.  I'd say do write according to 
specs and only try to sort out the situation somehow if something actually 
does break.

 In any case if we actually do choose to ignore PCI_CLASS_NOT_DEFINED_VGA 
devices, then I wanted to make sure we do it deliberately rather than from 
the lack of awareness of the existence of such devices.

  Maciej
