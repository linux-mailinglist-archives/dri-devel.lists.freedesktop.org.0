Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79E307114
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561756E957;
	Thu, 28 Jan 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618006E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:04:28 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id b5so2515910vsh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 23:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8+5dcejhRaQpDCwiyEVn753oCGrTihEzoxoKOU9kwWA=;
 b=ZRaEUkWxALHTVzsipCFQj35joZ7/P6/xdlQtefyyRmxLlAGo8gHta0a7fC8kj3x5r+
 GxclBFXoUJx51nRjfo+V34nIRM63VqC/CQshNpy3h2dCgg8646a+2U4jrEa/dypNRyfO
 ZzJFbe98NYDv4NAT5C9qLzoTHoB78A3YTmV/7UZbnOQjoHOPMZ63eCQc9UurepxD2ksp
 Qhi0d9fpObvKbsfnqNPTho1MZsOnUbK5865rJz/INF/EsZplNtp0r68tFpIzxJ3TRz1a
 IsJZaR/mrnNzbZgwxEb+QCC6k/kAWhsb4OndU91f+iluj6lJFf8tpaglkzhUZHz7qT7g
 GD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+5dcejhRaQpDCwiyEVn753oCGrTihEzoxoKOU9kwWA=;
 b=HYFAgRQGA58W0nSAPLZltVq+yiRfGWeq4WBTDxg3q3nVzIxN8AcXjSZGVXFIBCdGFQ
 TpwjvhEQ5TRnxiw+mPPPx5Ltv7cmV0DRmrG1D2v0oWPHty6BgG6fTElOKWK2zxClQdML
 G6RE7FqS17AJGRapn8imrbgcJrhxLkILtwwCqxK9eE1GRnkJkHAxTEeFXlRHpgAKaxug
 tpc0ZaYYzhoDFlhXjUUAetZn8xmdOoZ8MgRVmibT9A1dTxwHQsjzyCzeanNwIg7XPKoh
 OZ9oduQKj+atJcfe6oOjMgT+6NCD382YpCaCpBoaxwlINLKMhaDq6Snpn4TTTGCxeXE5
 VNig==
X-Gm-Message-State: AOAM530JacG2pzXowKzCC2aER0GjU3GNP1cp8P4SvF6zVFUiuSM6ozsr
 xbxN5ccBM03kTbXNIs846KCDhGPp7pTZFWnAkralCw==
X-Google-Smtp-Source: ABdhPJwSIFhyRLM20J+i0UEgD++xaYJdmbeJOtujr1vKiolKVw9/Eda+jgrZU0PTyDT5E6na4d2MivXZJp3MV5R/2I0=
X-Received: by 2002:a05:6102:199:: with SMTP id
 r25mr10592240vsq.56.1611817467057; 
 Wed, 27 Jan 2021 23:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20210123034655.102813-1-john.stultz@linaro.org>
 <20210123034655.102813-2-john.stultz@linaro.org>
 <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
 <CALAqxLWkTQwQ8Xqnc+PAMWUO_C84jaGzOLqKFqkuk3=AFNHD6g@mail.gmail.com>
In-Reply-To: <CALAqxLWkTQwQ8Xqnc+PAMWUO_C84jaGzOLqKFqkuk3=AFNHD6g@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 27 Jan 2021 23:04:15 -0800
Message-ID: <CAE2F3rAvg1-jtpsJdgzmBkZ5CDnGG4S0-oVxw74LY3O+N=0JZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Jan 27, 2021 at 12:21 PM Daniel Mentz <danielmentz@google.com> wrote:
> >
> > On Fri, Jan 22, 2021 at 7:47 PM John Stultz <john.stultz@linaro.org> wrote:
> > > +static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
> > > +{
> > > +       void *addr = vmap(pages, num, VM_MAP, pgprot);
> > > +
> > > +       if (!addr)
> > > +               return -ENOMEM;
> > > +       memset(addr, 0, PAGE_SIZE * num);
> > > +       vunmap(addr);
> > > +       return 0;
> > > +}
> >
> > I thought that vmap/vunmap are expensive, and I am wondering if
> > there's a faster way that avoids vmap.
> >
> > How about lifting this code from lib/iov_iter.c
> > static void memzero_page(struct page *page, size_t offset, size_t len)
> > {
> >         char *addr = kmap_atomic(page);
> >         memset(addr + offset, 0, len);
> >         kunmap_atomic(addr);
> > }
> >
> > Or what about lifting that code from the old ion_cma_heap.c
> >
> > if (PageHighMem(pages)) {
> >         unsigned long nr_clear_pages = nr_pages;
> >         struct page *page = pages;
> >
> >         while (nr_clear_pages > 0) {
> >                 void *vaddr = kmap_atomic(page);
> >
> >                 memset(vaddr, 0, PAGE_SIZE);
> >                 kunmap_atomic(vaddr);
> >                 page++;
> >                 nr_clear_pages--;
> >         }
> > } else {
> >         memset(page_address(pages), 0, size);
> > }
>
> Though, this last memset only works since CMA is contiguous, so it
> probably needs to always do the kmap_atomic for each page, right?

Yeah, but with the system heap page pool, some of these pages might be
64KB or 1MB large. kmap_atomic(page) just maps to page_address(page)
in most cases. I think iterating over all pages individually in this
manner might still be faster than using vmap.

>
> I'm still a little worried if this is right, as the current
> implementation with the vmap comes from the old ion_heap_sglist_zero
> logic, which similarly tries to batch the vmaps  32 pages at at time,
> but I'll give it a try.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
