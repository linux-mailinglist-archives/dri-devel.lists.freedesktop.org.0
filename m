Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2B2A6E8D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 21:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2E96E220;
	Wed,  4 Nov 2020 20:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8837E6E220
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 20:12:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id f93so13111680qtb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEEEXt1os4uvlr5FpRnmuBcc7L7msKpqjcsUXwjQF/c=;
 b=DLnfeD9J1ORdQ1bfs5+3AntXSfjpW/03OlgMKpfMczcb0Yo31gAQmfKmU/MxwQ17Tz
 p8ZagfXHFsC1dHS6FW5fSkhChMKNOPBoZuaf0P1ssilDHMYkmfYcvMK/N4bu0vQXK3wy
 c2tGk1nId5n4tetbAX3T+IoXKixnSiRJU2P+RgF0i9/MzM9vLJQC4pR4SHkQIDhJjOCm
 nI9uYdoL8DUDIOHzXzueS+XUGj/Xv/0E4OLEq6oqPKUHmkx/sfooqnKn5e06EiNpsCvu
 pIeS4Ja9kfYHVEpTmDFGZ6rRJqSaQZ+CUMbWPT9DrPeXAPhB8c08+nN3zrd9Xy424Dsr
 vK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEEEXt1os4uvlr5FpRnmuBcc7L7msKpqjcsUXwjQF/c=;
 b=fMoXTwNfjezFR2jmdEsHXZtlK9LKMh2gstpnAlS08sSi6dwlahULar117VSMtsTrVE
 78gwu6A4KtNhEHca9xGHoBQM/MYyJw7l9hyqUxgi4HIw1ZLn/Dy/M6wGYrV9lJglnwJN
 U8OpQNMjwK+DFZdwFGpP4Fa86K2Gxk6Mrr9NLqnKPV7fgPD2t+W9oo+dNsXXJrEbWJKU
 QiSJzTjG4whuIHEb4eZE4kwP7Jp52y/lwD/0GfGN70VWdJ0meLyVLxOh4wlFtdPkSiOo
 dN6euGu7xh1MmqT5AOCwi1w2vjt+5eNk9dyDesOiqsEqXXpl4myy/r1yuQBBb093MEP9
 JuFw==
X-Gm-Message-State: AOAM530/4srAS0RF+PJFtcaMUQts1LsdgnCYN1t0f4v5nydLwC2O3btP
 7Z4nd4GuCZHRjpiGbiiZ1Z6y00xFg4DhAhnzczjdVA==
X-Google-Smtp-Source: ABdhPJyImQ0VMkgJ13gDdAbq5pEtNIjA5jffxfB/P+jRlJioL0jIF2z8jDtJ1zF31+FQiHcdLBXSWIzDRip6n19HrNg=
X-Received: by 2002:ac8:4b79:: with SMTP id g25mr21823130qts.19.1604520747497; 
 Wed, 04 Nov 2020 12:12:27 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uF0QjesaNs97N-G8cZkXuAmFgcmTfHvoCP94br_WVcV6Q@mail.gmail.com>
 <20201104165017.GA352206@bjorn-Precision-5520>
In-Reply-To: <20201104165017.GA352206@bjorn-Precision-5520>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 4 Nov 2020 12:12:15 -0800
Message-ID: <CAPcyv4idORJzHVD2vCOnO3REqWHKVn_-otOzTBf0HhcWq4iJRQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
To: Bjorn Helgaas <helgaas@kernel.org>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 8:50 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Nov 04, 2020 at 09:44:04AM +0100, Daniel Vetter wrote:
> > On Tue, Nov 3, 2020 at 11:09 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > > On Tue, Nov 3, 2020 at 1:28 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Fri, Oct 30, 2020 at 11:08:11AM +0100, Daniel Vetter wrote:
> > > > > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > > > > files, and the old proc interface. Two check against
> > > > > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > > > > this starts to matter, since we don't want random userspace having
> > > > > access to PCI BARs while a driver is loaded and using it.
> > > > >
> > > > > Fix this by adding the same iomem_is_exclusive() check we already have
> > > > > on the sysfs side in pci_mmap_resource().
> > > > >
> > > > > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > >
> > > > This is OK with me but it looks like IORESOURCE_EXCLUSIVE is currently
> > > > only used in a few places:
> > > >
> > > >   e1000_probe() calls pci_request_selected_regions_exclusive(),
> > > >   ne_pci_probe() calls pci_request_regions_exclusive(),
> > > >   vmbus_allocate_mmio() calls request_mem_region_exclusive()
> > > >
> > > > which raises the question of whether it's worth keeping
> > > > IORESOURCE_EXCLUSIVE at all.  I'm totally fine with removing it
> > > > completely.
> > >
> > > Now that CONFIG_IO_STRICT_DEVMEM upgrades IORESOURCE_BUSY to
> > > IORESOURCE_EXCLUSIVE semantics the latter has lost its meaning so I'd
> > > be in favor of removing it as well.
> >
> > Still has some value since it enforces exclusive access even if the
> > config isn't enabled, and iirc e1000 had some fun with userspace tools
> > clobbering the firmware and bricking the chip.
>
> There's *some* value; I'm just skeptical since only three drivers use
> it.
>
> IORESOURCE_EXCLUSIVE is from e8de1481fd71 ("resource: allow MMIO
> exclusivity for device drivers"), and the commit message says this is
> only active when CONFIG_STRICT_DEVMEM is set.  I didn't check to see
> whether that's still true.
>
> That commit adds a bunch of wrappers and "__"-prefixed functions to
> pass the IORESOURCE_EXCLUSIVE flag around.  That's a fair bit of
> uglification for three drivers.
>
> > Another thing I kinda wondered, since pci maintainer is here: At least
> > in drivers/gpu I see very few drivers explicitly requestion regions
> > (this might be a historical artifact due to the shadow attach stuff
> > before we had real modesetting drivers). And pci core doesn't do that
> > either, even when a driver is bound. Is this intentional, or
> > should/could we do better? Since drivers work happily without
> > reserving regions I don't think "the drivers need to remember to do
> > this" will ever really work out well.
>
> You're right, many drivers don't call pci_request_regions().  Maybe we
> could do better, but I haven't looked into that recently.  There is a
> related note in Documentation/PCI/pci.rst that's been there for a long
> time (it refers to "pci_request_resources()", which has never existed
> AFAICT).  I'm certainly open to proposals.

It seems a bug that the kernel permits MMIO regions with side effects
to be ioremap()'ed without request_mem_region() on the resource. I
wonder how much log spam would happen if ioremap() reported whenever a
non-IORESOURE_BUSY range was passed to it? The current state of
affairs to trust *remap users to have claimed their remap target seems
too ingrained to unwind now.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
