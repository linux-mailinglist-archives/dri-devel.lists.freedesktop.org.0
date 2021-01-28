Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85709306C9B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 06:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD66E8C8;
	Thu, 28 Jan 2021 05:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CD96E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:10:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id c18so4819028ljd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbySH8XGPeHypTQ5quW2/0H5BDl8PiMEsgfEVwoeeI4=;
 b=v0WZgt/3pzp9gQrGDilRFIBE1VUrEj5i/gJgcppmH3N0+htGlb9glkmXh3fwsYmhuP
 R6ECXFmWEz2+t1PvqYqX/zbAXF8r4adCx76XaHJ58SkfJBZv1a37Opmw51U3trAcpIVa
 lieq/+F1l/t+XzOMWdb4kHGdt5Zb9iNi1y5n6hypaEiM4Xg6SBpEWhfMbjaazGgPAsep
 QxaQmDK+zITPVJazdV73+6W/LKHoL0yqrYMQFOM5kO0dWKCMatbPTDyu7tztCEyGu1it
 Zb4/Tx7o02upoGqTw3eVhy0wLaOnB/J6f3dENS44UJtFqQnTtCt2tnNREYGnxahSLvBe
 e26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbySH8XGPeHypTQ5quW2/0H5BDl8PiMEsgfEVwoeeI4=;
 b=NWEb6mBMXOBhlTX8QRc9oUJWJep90JC9kOMEF0vYoTfMWH8xZb7TtxS3E+nZiUBYvj
 RCi6JvWcdLKpBKxX9svIkpzmOfKZCS+PKKVHTEP4JGtS9Jm1vuCuJcoUaUXb1misVWW1
 AqVcsDxmOch6h+f5AiCx+/t3Ld0IwujHI0KKoZGxwNax3mrlS9VQL1kj39rat/AonJKU
 HgqYnGZ5L38aPiWSJkV1SFiIJf81S60hN886zWCJYBVQUEr9FyAObh+aeQDjkaBTTWzd
 2ivG11SMIypwm+l0fMlIXagoScxvkyX9KG3yGwIHZCRM2PPy1GGFmKmxEB6dQ6sIKHOi
 zpcw==
X-Gm-Message-State: AOAM530xKq+SaZtUnlSkVarsrL36jiP2eMAWEz+TwIB9p9sbxR2QwOx9
 ElxZVNFsRPwJfk4q0oWPKyP9rYzsLM0uPWa8GtRd3Q==
X-Google-Smtp-Source: ABdhPJznnuALUFQ1RiOUQHbEpehWn9tdXxnoDjOzm3PmzFN7h8qtoK4IQ8LF9kFVl7tGyMalI6DJbeyAdOeLxNsPcCI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr7835128ljw.333.1611810627528; 
 Wed, 27 Jan 2021 21:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20210123034655.102813-1-john.stultz@linaro.org>
 <20210123034655.102813-2-john.stultz@linaro.org>
 <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
In-Reply-To: <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 27 Jan 2021 21:10:15 -0800
Message-ID: <CALAqxLWkTQwQ8Xqnc+PAMWUO_C84jaGzOLqKFqkuk3=AFNHD6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To: Daniel Mentz <danielmentz@google.com>
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

On Wed, Jan 27, 2021 at 12:21 PM Daniel Mentz <danielmentz@google.com> wrote:
>
> On Fri, Jan 22, 2021 at 7:47 PM John Stultz <john.stultz@linaro.org> wrote:
> > +static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
> > +{
> > +       void *addr = vmap(pages, num, VM_MAP, pgprot);
> > +
> > +       if (!addr)
> > +               return -ENOMEM;
> > +       memset(addr, 0, PAGE_SIZE * num);
> > +       vunmap(addr);
> > +       return 0;
> > +}
>
> I thought that vmap/vunmap are expensive, and I am wondering if
> there's a faster way that avoids vmap.
>
> How about lifting this code from lib/iov_iter.c
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
>
> Or what about lifting that code from the old ion_cma_heap.c
>
> if (PageHighMem(pages)) {
>         unsigned long nr_clear_pages = nr_pages;
>         struct page *page = pages;
>
>         while (nr_clear_pages > 0) {
>                 void *vaddr = kmap_atomic(page);
>
>                 memset(vaddr, 0, PAGE_SIZE);
>                 kunmap_atomic(vaddr);
>                 page++;
>                 nr_clear_pages--;
>         }
> } else {
>         memset(page_address(pages), 0, size);
> }

Though, this last memset only works since CMA is contiguous, so it
probably needs to always do the kmap_atomic for each page, right?

I'm still a little worried if this is right, as the current
implementation with the vmap comes from the old ion_heap_sglist_zero
logic, which similarly tries to batch the vmaps  32 pages at at time,
but I'll give it a try.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
