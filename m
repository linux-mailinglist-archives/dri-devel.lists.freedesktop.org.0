Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5238285959
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC096E03F;
	Wed,  7 Oct 2020 07:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E986E456
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 12:26:57 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z6so7858784qkz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xBjl3ijOtmAZHKFY2Q8VHDVWCHXszRzYVrHWQVZx7Tk=;
 b=SN4g7TUIcZiG8gkjZ1H/2y7nSkf/356q8TN46sZv42cMGw257ggPHqEIxcAVaP+JLI
 3COaYblkwqSkvZ3VvGo2aUITxO8n/evEej4R7WiuDd7vx54iTJcM3rODUcbY6fWaVTW4
 EVA/uoMKZADbRpGktJwSEyKjfdPmW4OZ5Pgj9gbyiUAeVG9BSCNrYKIVLMh5QYABE1hs
 w1jTd6DwqzNWx+JVVeImewGQMVDM8zVSKQkPPfvZMzsDUJL1mfqV3Q9BDqZ118Hyt26G
 gkZ1HAOD9Z0OMFKclpgVIarkGX2NI41znNb9Xowm3HI01KbpOjvjgZDdADe5bWIp/JNN
 qaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xBjl3ijOtmAZHKFY2Q8VHDVWCHXszRzYVrHWQVZx7Tk=;
 b=iOd2u27ayxlI4OYet2llrR0QiVhfzqUPmKf6a+wTrSnp5i1ysE63uNbGXTGD/tf61J
 ToUz58OkjRG28SPSnU60a9y9KSIFx23gX/eRmBpXfIutJqkuoSwt3+uUdo68HgfD/PmV
 J0tlpCF1G4m++pARJGGiu0nvJHKw68bJny3HIw+ETBjMNZq0l9KYk5JN9gPUheJcSnvn
 UGrmlpBoHf7P6DHzWM2eobzOboGklmJxDkXPNljRC8PpXZppBWZVtvrpA+c81BHQbLS9
 n30TlghJbCsGZZ8KgXvMZKKpUl6RJsl4XF2QOr93Q2AKRB6s1l6aRFXuFjMN6SZQgf36
 81lQ==
X-Gm-Message-State: AOAM530nnV+UHZCMgB9HuO4F+k4SeYWVwf6sweePVpQGarWnkzyTKDsD
 rrOsZ4p9t8siZ5VPT6HkWF/bbg==
X-Google-Smtp-Source: ABdhPJw5uBK6Jg1qFL06jjeM7TFRlowFnJJ0b29ROqLVECyy9T+v9Aj67lt6n4PC1ZTOH3f53Rrkvg==
X-Received: by 2002:a37:2c06:: with SMTP id s6mr4947152qkh.55.1601987216328;
 Tue, 06 Oct 2020 05:26:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m67sm2358458qkf.98.2020.10.06.05.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 05:26:55 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPm3T-000W9Y-2O; Tue, 06 Oct 2020 09:26:55 -0300
Date: Tue, 6 Oct 2020 09:26:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201006122655.GG5177@ziepe.ca>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHt=kD=njZvMULy-k-bY4emn=u8__t7etQDq3_WUL7VAw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

On Tue, Oct 06, 2020 at 08:23:23AM +0200, Daniel Vetter wrote:
> On Tue, Oct 6, 2020 at 1:41 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Oct 06, 2020 at 12:43:31AM +0200, Daniel Vetter wrote:
> >
> > > > iow I think I can outright delete the frame vector stuff.
> > >
> > > Ok this doesn't work, because dma_mmap always uses a remap_pfn_range,
> > > which is a VM_IO | VM_PFNMAP vma and so even if it's cma backed and
> > > not a carveout, we can't get the pages.
> >
> > If CMA memory has struct pages it probably should be mmap'd with
> > different flags, and the lifecycle of the CMA memory needs to respect
> > the struct page refcount?
> 
> I guess yes and no. The problem is if there's pagecache in the cma
> region, pup(FOLL_LONGTERM) needs to first migrate those pages out of
> the cma range. Because all normal page allocation in cma regions must
> be migratable at all times.

Eh? Then how are we doing follow_pfn() on this stuff and not being
completely broken?

The entire point of this framevec API is to pin the memory and
preventing it from moving around. 

Sounds like it is fundamentally incompatible with CMA. Why is
something trying to mix the two?

> This is actually worse than the gpu case I had in mind, where at most
> you can sneak access other gpu buffers. With cma you should be able to
> get at arbitrary pagecache (well anything that's GFP_MOVEABLE really).
> Nice :-(

Ah, we have a winner :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
