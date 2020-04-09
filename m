Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8C1A31FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 11:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4744899F0;
	Thu,  9 Apr 2020 09:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8BA6EB98
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 09:41:32 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x11so9857634otp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AAmPcakirZ+49aStGKItq0c+j+VEsXqfcBH/BMyGspk=;
 b=WXfJC2xvujS1NMEJmo8auNqU+zz3KoHNnFI/ZwIoQGqsenIlj1/rLp7i8g0wrHhNMA
 tB4UaPYqL8fo1FBLJD1QspR85zqLl/OHQQ2XW2wZhxbVmnvXaj4OEg2HGRtpK4xkfIA5
 QryyOXVdb1eBXsQfmBlDoe7W6QRuDag4YOw+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AAmPcakirZ+49aStGKItq0c+j+VEsXqfcBH/BMyGspk=;
 b=L6NuIOPGjjKJYzBplm332iFtdHY1UkfbpEzvxgXRHg5Vkf/sPvMlesTIXb10Iym+8Z
 BYv8sx8SmShxa8/h1HO5Sq27h+QFSoRZVv8d2O8uo4NMsgyeTyq0gnbfw9kcsy0sDvec
 9BEk9I2iF6TmtqLODdc2mjJaq9lxG+Nmhx2qjHlPyfyfaL0VSn8n42v6R1CLzj1GXPI2
 242blInKmZ0g/b+ipsvfLG1nhyfI8mE+2NZNASkjVbZkyMNaXKCfNEZSfso1NqbSVYLq
 O3rvBT4AXYwP++oeGNaS21EjTLtAUaEuhNKGvaE6hp6tRmPGo0Lqa11o+9YYXYIK5BsU
 74Ew==
X-Gm-Message-State: AGi0PuY3vujju0RZYXRkhTNiHC1GGEMR4KQShrhtMQBhZkC2LmWR9T3c
 z9aspEMAMIYDLOGsKsJd3GXgfiQrZ4HIcHih+DWfNQ==
X-Google-Smtp-Source: APiQypLHBVJAv55CZxyRjUHHZPFErxI7m2EAB+edMw28HekqHKAMU8pcbynFySqYUgFQY0OpR/l48dylQu4jTtXwGxw=
X-Received: by 2002:a4a:4190:: with SMTP id x138mr9186341ooa.35.1586425291875; 
 Thu, 09 Apr 2020 02:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
In-Reply-To: <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 9 Apr 2020 11:41:20 +0200
Message-ID: <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, X86 ML <x86@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 bpf <bpf@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 10:54 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-04-08 at 14:25 +0200, Daniel Vetter wrote:
> > On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
> > > If this code was broken for non-coherent caches a crude powerpc hack
> > > isn't going to help anyone else.  Remove the hack as it is the last
> > > user of __vmalloc passing a page protection flag other than PAGE_KERNEL.
> >
> > Well Ben added this to make stuff work on ppc, ofc the home grown dma
> > layer in drm from back then isn't going to work in other places. I guess
> > should have at least an ack from him, in case anyone still cares about
> > this on ppc. Adding Ben to cc.
>
> This was due to some drivers (radeon ?) trying to use vmalloc pages for
> coherent DMA, which means on those 4xx powerpc's need to be non-cached.
>
> There were machines using that (440 based iirc), though I honestly
> can't tell if anybody still uses any of it.

agp subsystem still seems to happily do that (vmalloc memory for
device access), never having been ported to dma apis (or well
converted to iommu drivers, which they kinda are really). So I think
this all still works exactly as back then, even with the kms radeon
drivers. Question really is whether we have users left, and I have no
clue about that either.

Now if these boxes didn't ever have agp then I think we can get away
with deleting this, since we've already deleted the legacy radeon
driver. And that one used vmalloc for everything. The new kms one does
use the dma-api if the gpu isn't connected through agp.
-Daniel

> Cheers,
> Ben.
>
> > -Daniel
> >
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  drivers/gpu/drm/drm_scatter.c | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> > > index ca520028b2cb..f4e6184d1877 100644
> > > --- a/drivers/gpu/drm/drm_scatter.c
> > > +++ b/drivers/gpu/drm/drm_scatter.c
> > > @@ -43,15 +43,6 @@
> > >
> > >  #define DEBUG_SCATTER 0
> > >
> > > -static inline void *drm_vmalloc_dma(unsigned long size)
> > > -{
> > > -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
> > > -   return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
> > > -#else
> > > -   return vmalloc_32(size);
> > > -#endif
> > > -}
> > > -
> > >  static void drm_sg_cleanup(struct drm_sg_mem * entry)
> > >  {
> > >     struct page *page;
> > > @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
> > >             return -ENOMEM;
> > >     }
> > >
> > > -   entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
> > > +   entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
> > >     if (!entry->virtual) {
> > >             kfree(entry->busaddr);
> > >             kfree(entry->pagelist);
> > > --
> > > 2.25.1
> > >
> >
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
