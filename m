Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A811C1D80
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 21:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16CD6ED31;
	Fri,  1 May 2020 19:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68076ED31
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 19:01:51 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t199so578238oif.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LMHcXNrz3zhrHnqit232OJlMzuARuHoUe7nsiYDOkco=;
 b=UntPIa0Cvl/kGm1Feg2IwMKj/LyidTxG24GKd+jWt7NC0FWh32Mo+L7v/raeC6ovRf
 ADYVNuFPCd+kiw17nIQhzCbWAVAukYbQ+8UmP+ySXXb2ziBYjBruuXz+8O0yFE+gBjpE
 zkeFaW/GLk8b2Lz5UX5r5JfawXzw+4HhNTZtEQgpRPA97wluyD/i17WepzTgof+gACX9
 n5n4GewjabnbZRDxX6DKw4084Q4FcSuexAMrnh6DZQ4QRsFyoQaBLXWdpNkv2QfdjXWi
 B9qn836vftMISEpaE1gzPC8ddaRZgavhorj7xAbff9tWbwKlIyEMQlabcYNnOwDE4YZ8
 qklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMHcXNrz3zhrHnqit232OJlMzuARuHoUe7nsiYDOkco=;
 b=ZwsBBt8wEFRUBF6OK8xsWjmXwoAfw3K54EMjqo6d5YIFcEntaj0mrJD5q48an62IDE
 xXIK1Th3MQfp8Hihrc31l4iqcghjZOcSfVgGCuR4I65L7iyrFRMND70HkYB+/Zs1qAaN
 ZEaaGao2Qbcib4kwOaJTdNYl2b/CGWqqsdg9DlVa10gQPvwaw2HU9tw2Sq3Ynel6wqLW
 bSVERm7jbXEl9eGeii980nv3Gic5/wwOypq62RUCjF4xPGI6L+yN76eIivQgQ7zOf659
 7iY3LNRRaSQGraT+ZyX0QBren35MliV6xvI2WC6kcFGkvU0lojhyuXj2x3tBgn2NsWSb
 kwaw==
X-Gm-Message-State: AGi0Pub5aV9zW+Gt+Pg+LYiu1Gb5kUDmWQdL90ls/FWj/d/W+bpFAA+/
 71rA6XbBWA4TnOdFOO5JPdM+IWa6MSOOLQN3e9HGFA==
X-Google-Smtp-Source: APiQypJYvqKKFvfOFQUK1ntLEscYvQrHeBF7fGsVt3flNjLdjYuuXkdbUHFmseAznhnmIL+vzVVh7igl6t18YXGu6mU=
X-Received: by 2002:a54:4f02:: with SMTP id e2mr838335oiy.10.1588359710953;
 Fri, 01 May 2020 12:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
In-Reply-To: <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 1 May 2020 12:01:40 -0700
Message-ID: <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
To: Robin Murphy <robin.murphy@arm.com>
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
 Sandeep Patil <sspatil@google.com>, Christoph Hellwig <hch@lst.de>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-05-01 11:21 am, Brian Starkey wrote:
> > Hi John,
> >
> > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> >> This patch reworks the cma_heap initialization so that
> >> we expose both the default CMA region and any CMA regions
> >> tagged with "linux,cma-heap" in the device-tree.
> >>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >> Cc: "Andrew F. Davis" <afd@ti.com>
> >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >> Cc: Liam Mark <lmark@codeaurora.org>
> >> Cc: Pratik Patel <pratikp@codeaurora.org>
> >> Cc: Laura Abbott <labbott@redhat.com>
> >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> >> Cc: Chenbo Feng <fengc@google.com>
> >> Cc: Alistair Strachan <astrachan@google.com>
> >> Cc: Sandeep Patil <sspatil@google.com>
> >> Cc: Hridya Valsaraju <hridya@google.com>
> >> Cc: Christoph Hellwig <hch@lst.de>
> >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Cc: Robin Murphy <robin.murphy@arm.com>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-mm@kvack.org
> >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> >> ---
> >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> >>   1 file changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> >> index 626cf7fd033a..dd154e2db101 100644
> >> --- a/drivers/dma-buf/heaps/cma_heap.c
> >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> >>   {
> >>      struct cma_heap *cma_heap;
> >>      struct dma_heap_export_info exp_info;
> >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> >> +
> >> +    /* We only add the default heap and explicitly tagged heaps */
> >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> >> +            return 0;
> >
> > Thinking about the pl111 thread[1], I'm wondering if we should also
> > let drivers call this directly to expose their CMA pools, even if they
> > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > policy.
>
> That sounds much like what my first thoughts were - apologies if I'm
> wildly off-base here, but as far as I understand:
>
> - Device drivers know whether they have their own "memory-region" or not.
> - Device drivers already have to do *something* to participate in dma-buf.
> - Device drivers know best how they make use of both the above.
> - Therefore couldn't it be left to drivers to choose whether to register
> their CMA regions as heaps, without having to mess with DT at all?

I guess I'm not opposed to this. But I guess I'd like to see some more
details? You're thinking the pl111 driver would add the
"memory-region" node itself?

Assuming that's the case, my only worry is what if that memory-region
node isn't a CMA area, but instead something like a carveout? Does the
driver need to parse enough of the dt to figure out where to register
the region as a heap?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
