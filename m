Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751402F5D38
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512F6E0F7;
	Thu, 14 Jan 2021 09:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9289FF7;
 Thu, 14 Jan 2021 09:24:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23592012-1500050 for multiple; Thu, 14 Jan 2021 09:23:20 +0000
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
 <161057213487.6195.581396740566956696@build.alporthouse.com>
 <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 John Stultz <john.stultz@linaro.org>
Date: Thu, 14 Jan 2021 09:23:18 +0000
Message-ID: <161061619887.19482.10606780107376365239@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-01-14 09:02:57)
> On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Daniel Vetter (2021-01-13 20:50:11)
> > > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > > We have too many people abusing the struct page they can get at but
> > > > > really shouldn't in importers. Aside from that the backing page might
> > > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > > completely. Importers really must go through the proper interface like
> > > > > dma_buf_mmap for everything.
> > > >
> > > > If the exporter doesn't want to expose the struct page, why are they
> > > > setting it in the exported sg_table?
> > >
> > > You need to store it somewhere, otherwise the dma-api doesn't work.
> > > Essentially this achieves clearing/resetting the struct page pointer,
> > > without additional allocations somewhere, or tons of driver changes
> > > (since presumably the driver does keep track of the struct page
> > > somewhere too).
> >
> > Only for mapping, and that's before the export -- if there's even a
> > struct page to begin with.
> >
> > > Also as long as we have random importers looking at struct page we
> > > can't just remove it, or crashes everywhere. So it has to be some
> > > debug option you can disable.
> >
> > Totally agreed that nothing generic can rely on pages being transported
> > via dma-buf, and memfd is there if you do want a suitable transport. The
> > one I don't know about is dma-buf heap, do both parties there consent to
> > transport pages via the dma-buf? i.e. do they have special cases for
> > import/export between heaps?
> 
> heaps shouldn't be any different wrt the interface exposed to
> importers. Adding John just in case I missed something.
> 
> I think the only problem we have is that the first import for ttm
> simply pulled out the struct page and ignored the sgtable otherwise,
> then that copypasted to places and we're still have some of that left.
> Although it's a lot better. So largely the problem is importers being
> a bit silly.
> 
> I also think I should change the defaulty y to default y if
> DMA_API_DEBUG or something like that, to make sure it's actually
> enabled often enough.

It felt overly draconian, but other than the open question of dma-buf
heaps (which I realise that we need some CI coverage for), I can't
think of a good reason to argue for hiding a struct page transport
within dma-buf.

The only other problem I see with the implementation is that there's
nothing that says that each dmabuf->ops->map_dma_buf() returns a new
sg_table, so we may end up undoing the xor. Or should each dma-buf
return a fresh dma-mapping for iommu isolation?
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
