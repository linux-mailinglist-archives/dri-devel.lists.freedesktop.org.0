Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26E284C44
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 15:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75F89D44;
	Tue,  6 Oct 2020 13:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B36189D44
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 13:09:02 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m11so6580741otk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UIz7Ad1d8jfXlfMTcB0ZtI9qf0HUQ6fuKIJszWhIC+E=;
 b=LIcR3mxlTUwN2cQS3JOV9OT3XWZSqNM8o2MXOXJGnXBlTjosIunp2xH+4xIx4TFcmX
 bz9ZNBvOE+IWnnYFj2cRXRANjLRbYjiHsrPwgqT5Esz03Yaa5NJcAVZ84y6FBycdg5nl
 9BP1OZjIaAgLdnUyieEXrQHDpl2wkajyftiXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIz7Ad1d8jfXlfMTcB0ZtI9qf0HUQ6fuKIJszWhIC+E=;
 b=ExEuXV1bM6biSbQUjnjixSpYmazEP5deWqkNvaAWbZMhiEnxzCbHHe8JbeBiKPb9uo
 ANpfoxpDaknvhUnhOcNGApaRDuRbE1WM6F8Nni8KOMVVDm6yBBhOY0UW3NDliDyWtae6
 ImN+BN+zDQs9+ak/6LL8095gFwXiQaCm/+WquShJzNehO0HMe2cQ1xheBf93MUoMmQn0
 zMlsL0votW4COBT4Ltg/7IDSO6YDSeP0OVh1lt14cE7tGgrQPBpy2uyPVjnx11DfjvRa
 LZAXVkZ0dkWQfvaPRXPE43v7Uj0ULwKluzh7zBSLbVHQTYiisn2qbf7YvQtE5FwyrbRs
 wyjA==
X-Gm-Message-State: AOAM531WMigMxhWya3Xv1DIcpLe6BRrhXB8EouJmI2jXT+s3r5eRmQeb
 rv6ZI0IOI6O/mbrwp0n+jrUU4MPfEEDeWhwN4tBgZQ==
X-Google-Smtp-Source: ABdhPJzw1inwN+t+5foZtK0ezcoJPSOeTr206jyI3Yd7SrQuqlq6reZ+PEoA/n663vRpZhATnphV37mf6s0WcQ5NNFs=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr2992253otr.281.1601989741473; 
 Tue, 06 Oct 2020 06:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
 <20201005183704.GC5177@ziepe.ca>
 <CAKMK7uH97Yb2JFviG_ynGC1hbQ69h9hcyFVFd2PFYHCDzfBN6g@mail.gmail.com>
 <CAKMK7uHRxK3yNrvX=+n-XpSv7PDCz8w+mwof3pkUUJq3TpmiuQ@mail.gmail.com>
 <20201005234104.GD5177@ziepe.ca>
 <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
 <20201006122655.GG5177@ziepe.ca>
In-Reply-To: <20201006122655.GG5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Oct 2020 15:08:50 +0200
Message-ID: <CAKMK7uEsVOopEuWrjXOh+pjo=XZXkVf6Y6sC7WD7zr+t=rBdZg@mail.gmail.com>
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

On Tue, Oct 6, 2020 at 2:26 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Oct 06, 2020 at 08:23:23AM +0200, Daniel Vetter wrote:
> > On Tue, Oct 6, 2020 at 1:41 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:
> > >
> > > > > iow I think I can outright delete the frame vector stuff.
> > > >
> > > > Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> > > > which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> > > > not a carveout, we can't get the pages.
> > >
> > > If CMA memory has struct pages it probably should be mmap'd with
> > > different flags, and the lifecycle of the CMA memory needs to respect
> > > the struct page refcount?
> >
> > I guess yes and no. The problem is if there's pagecache in the cma
> > region, pup(FOLL_LONGTERM) needs to first migrate those pages out of
> > the cma range. Because all normal page allocation in cma regions must
> > be migratable at all times.
>
> Eh? Then how are we doing follow_pfn() on this stuff and not being
> completely broken?
>
> The entire point of this framevec API is to pin the memory and
> preventing it from moving around.
>
> Sounds like it is fundamentally incompatible with CMA. Why is
> something trying to mix the two?

I think the assumption way back when this started is that any VM_IO |
VM_PFNMAP vma is perma-pinned because it's just a piece of carveout.
Of course this ignored that it could also be a piece of iomem and
peer2peer dma doens't Just Work, so could result in all kinds of
hilarity and hw exceptions. But no leaks. Well, if you assume that the
ownership of a device never changes after you've booted the system.

But now we have dynamic gpu memory management, a bunch of subsystems
that fully support revoke semantics (in a subsystem specific way), and
CMA trying really hard to make the old carveouts useable for the
system at large when the memory isn't needed by the device. So all
these assumptions behind follow_pfn are out of the window, and
follow_pfn is pretty much broken.

What's worse I noticed that even for static pfnmaps (for userspace
drivers) we now revoke access to those mmaps. For example implemented
for /dev/mem in 3234ac664a87 ("/dev/mem: Revoke mappings when a driver
claims the region"). Which means follow_pfn isn't even working
correctly anymore for that case, and it's all pretty much broken.

> > This is actually worse than the gpu case I had in mind, where at most
> > you can sneak access other gpu buffers. With cma you should be able to
> > get at arbitrary pagecache (well anything that's GFP_MOVEABLE really).
> > Nice :-(
>
> Ah, we have a winner :\

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
