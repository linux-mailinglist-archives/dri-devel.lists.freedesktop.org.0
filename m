Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E217283E15
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF5489C49;
	Mon,  5 Oct 2020 18:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9891F89B69
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:16:45 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id c13so9637247oiy.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FN2AJgQesBFrflJe0AntQ7YnHAZ/BkQQlGgu8HacbQA=;
 b=g6/KKyKk/tBCaMaj97Lm7iHrYxg7bJ29XQV8IhKUtxpXBMElnA0Mbv+lpKUShMIfHO
 MqqLNs2Ci3XA+tHIPwb3KdmMIDgXvYMIh2Gq+/uts7XqiK36dJTgztw6Syp+RG3BsD5T
 Ppy21BbMDLHOP8TA62tHInwCRD/lrYW410N2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FN2AJgQesBFrflJe0AntQ7YnHAZ/BkQQlGgu8HacbQA=;
 b=oDOjsUq8YSEvGrizHRSG8Md/3VE0+LUBZNzkCtFQo2i1zHnHOU6LlTcAvimP45O+mk
 BgvnR1nzA3eKtMiBXwysEXL0SMO0NmUVJPNkrLSUAyro3UYutA/2S9/K/AlBBlSKc26c
 Uz4qQ2G5K18ecKdvHJcfcc8KS0Ghg1rXC55/sA73V6so2uHgwnNmCS3a5Er/HCfUNzbt
 ifCNtM6JnXZNjxX/PFlk0THDas2E9I04YSgQDC6bej/CMX/sIiEOiiVD7irNPsdrruXT
 cB9JkVrvtH4rzZJDfleXgT9V9ff0ma5y6bZ284LnD8icxAodcepvusS6i2FKPWRTnSvG
 76Sg==
X-Gm-Message-State: AOAM532VucHHxdo2ZPwLSGj9pLGzC0JBllCeOWIaorw6z4+qpzNQgnNK
 0e3Cexa7mAkjt8FE6DiSurEbF39oun5rOpgJaZuBdA==
X-Google-Smtp-Source: ABdhPJwE3O5vPlLIwwOdbL49TN4HbzWmZ5VHe6jljPtrdxkXMqN7oaPXtHoRcyjt74oM3jMzJ1cKkFt4Dx3tnDQvQtA=
X-Received: by 2002:aca:c6cc:: with SMTP id w195mr345570oif.101.1601921804728; 
 Mon, 05 Oct 2020 11:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
In-Reply-To: <20201005172854.GA5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 5 Oct 2020 20:16:33 +0200
Message-ID: <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 7:28 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sun, Oct 04, 2020 at 06:09:29PM +0200, Daniel Vetter wrote:
> > On Sun, Oct 4, 2020 at 2:51 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Sat, Oct 03, 2020 at 11:40:22AM +0200, Daniel Vetter wrote:
> > >
> > > > > That leaves the only interesting places as vb2_dc_get_userptr() and
> > > > > vb2_vmalloc_get_userptr() which both completely fail to follow the
> > > > > REQUIRED behavior in the function's comment about checking PTEs. It
> > > > > just DMA maps them. Badly broken.
> > > > >
> > > > > Guessing this hackery is for some embedded P2P DMA transfer?
> > > >
> > > > Yeah, see also the follow_pfn trickery in
> > > > videobuf_dma_contig_user_get(), I think this is fully intentional and
> > > > userspace abi we can't break :-/
> > >
> > > We don't need to break uABI, it just needs to work properly in the
> > > kernel:
> > >
> > >   vma = find_vma_intersection()
> > >   dma_buf = dma_buf_get_from_vma(vma)
> > >   sg = dma_buf_p2p_dma_map(dma_buf)
> > >   [.. do dma ..]
> > >   dma_buf_unmap(sg)
> > >   dma_buf_put(dma_buf)
> > >
> > > It is as we discussed before, dma buf needs to be discoverable from a
> > > VMA, at least for users doing this kind of stuff.
> >
> > I'm not a big fan of magic behaviour like this, there's more to
> > dma-buf buffer sharing than just "how do I get at the backing
> > storage". Thus far we've done everything rather explicitly. Plus with
> > exynos and habanalabs converted there's only v4l left over, and that
> > has a proper dma-buf import path already.
>
> Well, any VA approach like this has to access some backing refcount
> via the VMA. Not really any way to avoid something like that
>
> > > A VM flag doesn't help - we need to introduce some kind of lifetime,
> > > and that has to be derived from the VMA. It needs data not just a flag
> >
> > I don't want to make it work, I just want to make it fail. Rough idea
> > I have in mind is to add a follow_pfn_longterm, for all callers which
> > aren't either synchronized through mmap_sem or an mmu_notifier.
>
> follow_pfn() doesn't work outside the pagetable locks or mmu notifier
> protection. Can't be fixed.
>
> We only have a few users:
>
> arch/s390/pci/pci_mmio.c:       ret = follow_pfn(vma, user_addr, pfn);
> drivers/media/v4l2-core/videobuf-dma-contig.c:          ret = follow_pfn(vma, user_address, &this_pfn);
> drivers/vfio/vfio_iommu_type1.c:        ret = follow_pfn(vma, vaddr, pfn);
> drivers/vfio/vfio_iommu_type1.c:                ret = follow_pfn(vma, vaddr, pfn);
> mm/frame_vector.c:                      err = follow_pfn(vma, start, &nums[ret]);
> virt/kvm/kvm_main.c:    r = follow_pfn(vma, addr, &pfn);
> virt/kvm/kvm_main.c:            r = follow_pfn(vma, addr, &pfn);
>
> VFIO is broken like media, but I saw patches fixing the vfio cases
> using the VMA and a vfio specific refcount.
>
> media & frame_vector we are talking about here.
>
> kvm is some similar hack added for P2P DMA, see commit
> add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..

Yeah my thinking is that kvm (and I think also vfio, also seems to
have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
that one works correctly.

> s390 looks broken too, needs to hold the page table locks.

Hm yeah I guess that looks fairly reasonable to fix too.

> So, the answer really is that s390 and media need fixing, and this API
> should go away (or become kvm specific)

I'm still not clear how you want fo fix this, since your vma->dma_buf
idea is kinda a decade long plan and so just not going to happen:
- v4l used this mostly (afaik the lore at least) for buffer sharing
with v4l itself, and also a bit with fbdev. Neither even has any
dma-buf exporter code as-is.
- like I said, there's no central dma-buf instance, it was fairly
intentionally create as an all-to-all abstraction. Which means you
either have to roll out a vm_ops->gimme_the_dmabuf or, even more work,
refactor all the dma-buf exporters to go through the same things
- even where we have dma-buf, most mmaps of buffer objects aren't a
dma-buf. Those  are only set up when userspace explicitly asks for
one, so we'd also need to change the mmap code of all drivers involved
to make sure the dma-buf is always created when we do any kind of
mmap.

I don't see that as a realistic thing to ever happen, and meanwhile we
can't leave the gap open for a few years.

> > If this really breaks anyone's use-case we can add a tainting kernel
> > option which re-enables this (we've done something similar for
> > phys_addr_t based buffer sharing in fbdev, entirely unfixable since
> > the other driver has to just blindly trust that what userspace
> > passes around is legit). This here isn't unfixable, but if v4l
> > people want to keep it without a big "security hole here" sticker,
> > they should do the work, not me :-)
>
> This seems fairly reasonable..
>
> So after frame_vec is purged and we have the one caller in media, move
> all this stuff to media and taint the kernel if it goes down the
> follow_pfn path

Yeah I think moving frame_vec back to media sounds like a good idea,
it should stop new users like habanalbas/exynos from popping up at
least. It's follow_pfn that freaks me out more.
-Daniel

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
