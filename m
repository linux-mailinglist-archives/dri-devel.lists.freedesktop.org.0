Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E22A6A5D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 17:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D6B6E1F6;
	Wed,  4 Nov 2020 16:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E086E249
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:19 +0000 (UTC)
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01712206CA;
 Wed,  4 Nov 2020 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604508619;
 bh=KzXcQsv6oXQiPT6pQbTFR35Ks2A09AmGg4NdOMxDZU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C3pX6cmo6q8mwyEj5GO30o1K3DmrMhjsd197OHFiySwAIRZVIm3gcmWDrE+eCPQYz
 sPh4rcY/+zTADvqe8t10fQKgN6B/uva7r/Rm33jjbBhTlqD9gCI3SGCFFhZSFec0de
 QvdkQtLCYpZ8r9E77lkRpGYf+6s0+xBDMYsFK0NQ=
Date: Wed, 4 Nov 2020 10:50:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201104165017.GA352206@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF0QjesaNs97N-G8cZkXuAmFgcmTfHvoCP94br_WVcV6Q@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 09:44:04AM +0100, Daniel Vetter wrote:
> On Tue, Nov 3, 2020 at 11:09 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > > > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > > > files, and the old proc interface. Two check against
> > > > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > > > this starts to matter, since we don't want random userspace having
> > > > access to PCI BARs while a driver is loaded and using it.
> > > >
> > > > Fix this by adding the same iomem_is_exclusive() check we already have
> > > > on the sysfs side in pci_mmap_resource().
> > > >
> > > > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >
> > > This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> > > only used in a few places:
> > >
> > >   e1000_probe() calls pci_request_selected_regions_exclusive(),
> > >   ne_pci_probe() calls pci_request_regions_exclusive(),
> > >   vmbus_allocate_mmio() calls request_mem_region_exclusive()
> > >
> > > which raises the question of whether it's worth keeping
> > > IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> > > completely.
> >
> > Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
> > IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
> > be in favor of removing it as well.
> 
> Still has some value since it enforces exclusive access even if the
> config isn't enabled, and iirc e1000 had some fun with userspace tools
> clobbering the firmware and bricking the chip.

There's *some* value; I'm just skeptical since only three drivers use
it.

IORESOURCE_EXCLUSIVE is from e8de1481fd71 ("resource: allow MMIO
exclusivity for device drivers"), and the commit message says this is
only active when CONFIG_STRICT_DEVMEM is set.  I didn't check to see
whether that's still true.

That commit adds a bunch of wrappers and "__"-prefixed functions to
pass the IORESOURCE_EXCLUSIVE flag around.  That's a fair bit of
uglification for three drivers.

> Another thing I kinda wondered, since pci maintainer is here: At least
> in drivers/gpu I see very few drivers explicitly requestion regions
> (this might be a historical artifact due to the shadow attach stuff
> before we had real modesetting drivers). And pci core doesn't do that
> either, even when a driver is bound. Is this intentional, or
> should/could we do better? Since drivers work happily without
> reserving regions I don't think "the drivers need to remember to do
> this" will ever really work out well.

You're right, many drivers don't call pci_request_regions().  Maybe we
could do better, but I haven't looked into that recently.  There is a
related note in Documentation/PCI/pci.rst that's been there for a long
time (it refers to "pci_request_resources()", which has never existed
AFAICT).  I'm certainly open to proposals.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
