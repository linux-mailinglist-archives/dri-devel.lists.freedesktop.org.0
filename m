Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC11D3396
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7AC6EB58;
	Thu, 14 May 2020 14:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC046EB58
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:52:50 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A506620748
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589467970;
 bh=KyMeowribavtsIbTUR+vWwY63ali5afdWjqtehs4ado=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jO+lD2cCU6q+5tJVkwkyOBKh8wI3TB5mInfIHe4hmQgT8JBiuB9lCqG8j40WAUs2e
 GBE/X3aXCrtmqPdF7LYRETB7jvg2CCP1UwQonVipOc7Lb97gzY0+t4ax94t/WeNM0h
 vketF0DJ9519leZRWWEsKTbZZQSFsyacHizFkUxo=
Received: by mail-oi1-f174.google.com with SMTP id 19so24748425oiy.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:52:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuZt993ChieCCrJ2G43NmlxPXHjtkJBX78nj4XkFxsgwbh6DX7lT
 YGUwYm2YNnwWSvWiT02RUoTb86xceQhNb2HHHw==
X-Google-Smtp-Source: APiQypLD1q0aJ+FQry7uiKJF40s+kUkpHEeLYwhAf8rdZYNoqrECkbbBawOpUYBN2DKPnQ4iPCEQXyF96LsbhjXfFTU=
X-Received: by 2002:aca:1904:: with SMTP id l4mr31504767oii.106.1589467969912; 
 Thu, 14 May 2020 07:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
 <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
 <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
 <20200512163714.GA22577@bogus>
 <20200513104401.lhh2m5avlasev6mj@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200513104401.lhh2m5avlasev6mj@DESKTOP-E1NTVVP.localdomain>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 May 2020 09:52:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+V-YA9B7i+9U0as3oXNC=HLPHmZ2NrPzNJu5CXpvD3tg@mail.gmail.com>
Message-ID: <CAL_Jsq+V-YA9B7i+9U0as3oXNC=HLPHmZ2NrPzNJu5CXpvD3tg@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Pratik Patel <pratikp@codeaurora.org>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm <linux-mm@kvack.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 5:44 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi Rob,
>
> On Tue, May 12, 2020 at 11:37:14AM -0500, Rob Herring wrote:
> > On Mon, May 04, 2020 at 10:06:28AM +0100, Brian Starkey wrote:
> > > On Fri, May 01, 2020 at 12:01:40PM -0700, John Stultz wrote:
> > > > On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > > > >
> > > > > On 2020-05-01 11:21 am, Brian Starkey wrote:
> > > > > > Hi John,
> > > > > >
> > > > > > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> > > > > >> This patch reworks the cma_heap initialization so that
> > > > > >> we expose both the default CMA region and any CMA regions
> > > > > >> tagged with "linux,cma-heap" in the device-tree.
> > > > > >>
> > > > > >> Cc: Rob Herring <robh+dt@kernel.org>
> > > > > >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > >> Cc: "Andrew F. Davis" <afd@ti.com>
> > > > > >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > > > >> Cc: Liam Mark <lmark@codeaurora.org>
> > > > > >> Cc: Pratik Patel <pratikp@codeaurora.org>
> > > > > >> Cc: Laura Abbott <labbott@redhat.com>
> > > > > >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > > > >> Cc: Chenbo Feng <fengc@google.com>
> > > > > >> Cc: Alistair Strachan <astrachan@google.com>
> > > > > >> Cc: Sandeep Patil <sspatil@google.com>
> > > > > >> Cc: Hridya Valsaraju <hridya@google.com>
> > > > > >> Cc: Christoph Hellwig <hch@lst.de>
> > > > > >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > > >> Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > >> Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > >> Cc: devicetree@vger.kernel.org
> > > > > >> Cc: dri-devel@lists.freedesktop.org
> > > > > >> Cc: linux-mm@kvack.org
> > > > > >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > > > >> ---
> > > > > >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> > > > > >>   1 file changed, 9 insertions(+), 9 deletions(-)
> > > > > >>
> > > > > >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > > > > >> index 626cf7fd033a..dd154e2db101 100644
> > > > > >> --- a/drivers/dma-buf/heaps/cma_heap.c
> > > > > >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > > > >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> > > > > >>   {
> > > > > >>      struct cma_heap *cma_heap;
> > > > > >>      struct dma_heap_export_info exp_info;
> > > > > >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> > > > > >> +
> > > > > >> +    /* We only add the default heap and explicitly tagged heaps */
> > > > > >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> > > > > >> +            return 0;
> > > > > >
> > > > > > Thinking about the pl111 thread[1], I'm wondering if we should also
> > > > > > let drivers call this directly to expose their CMA pools, even if they
> > > > > > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > > > > > policy.
> > > > >
> > > > > That sounds much like what my first thoughts were - apologies if I'm
> > > > > wildly off-base here, but as far as I understand:
> > > > >
> > > > > - Device drivers know whether they have their own "memory-region" or not.
> > > > > - Device drivers already have to do *something* to participate in dma-buf.
> > > > > - Device drivers know best how they make use of both the above.
> > > > > - Therefore couldn't it be left to drivers to choose whether to register
> > > > > their CMA regions as heaps, without having to mess with DT at all?
> >
> > +1, but I'm biased toward any solution not using DT. :)
> >
> > > > I guess I'm not opposed to this. But I guess I'd like to see some more
> > > > details? You're thinking the pl111 driver would add the
> > > > "memory-region" node itself?
> > > >
> > > > Assuming that's the case, my only worry is what if that memory-region
> > > > node isn't a CMA area, but instead something like a carveout? Does the
> > > > driver need to parse enough of the dt to figure out where to register
> > > > the region as a heap?
> > >
> > > My thinking was more like there would already be a reserved-memory
> > > node in DT for the chunk of memory, appropriately tagged so that it
> > > gets added as a CMA region.
> > >
> > > The device's node would have "memory-region=<&blah>;" and would use
> > > of_reserved_mem_device_init() to link up dev->cma_area to the
> > > corresponding cma region.
> > >
> > > So far, that's all in-place already. The bit that's missing is
> > > exposing that dev->cma_area to userspace as a dma_heap - so we could
> > > just have "int cma_heap_add(struct cma *cma)" or "int
> > > cma_heap_dev_add(struct device *dev)" or something exported for
> > > drivers to expose their device-assigned cma region if they wanted to.
> > >
> > > I don't think this runs into the lifetime problems of generalised
> > > heaps-as-modules either, because the CMA region will never go away
> > > even if the driver does.
> > >
> > > Alongside that, I do think the completely DT-driven approach can be
> > > useful too - because there may be regions which aren't associated with
> > > any specific device driver, that we want exported as heaps.
> >
> > And they are associated with the hardware description rather than the
> > userspace environment?
>
> I'm not sure how to answer that. We already have CMA regions being
> created from device-tree, so we're only talking about explicitly
> exposing those to userspace.

It's easier to argue that how much CMA memory a system/device needs is
h/w description as that's more a function of devices and frame sizes.
But exposing to userspace or not is an OS architecture decision. It's
not really any different than a kernel vs. userspace driver question.
What's exposed by UIO or spi-dev is purely a kernel thing.

> Are you thinking that userspace should be deciding whether they get
> exposed or not? I don't know how userspace would discover them in
> order to make that decision.

Or perhaps the kernel should be deciding. Expose to userspace what the
kernel doesn't need or drivers decide?

It's hard to argue against 1 new property. It's death by a 1000 cuts though.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
