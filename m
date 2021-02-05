Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3951310776
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29F6E9A3;
	Fri,  5 Feb 2021 09:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0A6E9A3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:15:07 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w8so6804537oie.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXNMzkZKAQHAIrPBhbAfZJ1F8VP6J4t5+TSc68lOL4Y=;
 b=a+ji2SzyZm3n8vVEHzAMZc8QntIgLAYyHbAXu1DjdIj2YXSB95Kk9f0X7dpvSIMx4b
 ZOgF3PKpF755HKCdIJr6U5t6zLzDDh9y1RUPzOpqu9dSY2DlYKR39mapqWK/IkqzmmOQ
 jhaJmkwjl1dKvNndYYw0eyycjistU6FYnbvB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXNMzkZKAQHAIrPBhbAfZJ1F8VP6J4t5+TSc68lOL4Y=;
 b=mntRj7Onta6Rc72kIC0US2qp1MfeMXRFwn2nncXgghWmWcfyJtC7g0kCWfrZPt7hZe
 kI9yKrDi+aXxjZ8NPLFW9c8wZi+P6Xn/Q7PhW+XitYpJ8xu/zp1bpMPmhzdOpj1/lnGK
 HLnMr+4icFWcUb+f9UYgkSUHYq81UsGXDe9K+v54HXsWKp3W9NwCivKtNkpJ1T5JRLe9
 cev94RN1jovjy38yey26bjRVxiIr+xCq15Db+zbFSloeuJOGmzKPWtpPC9Y92LSJDexY
 Z8HqULQoqfk8wdL5sRpDR3wwFcnTUj3P+S3QJdsmuwaKQgHdkTORoI3ePBO7D+4eSqSx
 Z4iA==
X-Gm-Message-State: AOAM531NG+wKAUVsk6sZKdemuvcv48yMg0fYI69TJvFeRXE4/VUEYbqa
 6A90P33nOY7144uH13COtMgIfNR/pTBreM0O+ol5MA==
X-Google-Smtp-Source: ABdhPJxEMaYu1JXRr4pq0v6xG4RV1wNpt4QeaMRtr7VxclNNU/6kd9mpU8CVuZPrSywCRKR/06lHELNic7Bm/GFyf1k=
X-Received: by 2002:aca:df42:: with SMTP id w63mr2473363oig.128.1612516506743; 
 Fri, 05 Feb 2021 01:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
 <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
 <20210204200918.GA4718@ziepe.ca>
 <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
 <20210204205927.GD4718@ziepe.ca>
In-Reply-To: <20210204205927.GD4718@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 5 Feb 2021 10:14:55 +0100
Message-ID: <CAKMK7uH8yLtdzZkSLEfmbooDJSxaKPLXcHP_-xssJbDZz-eHMw@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 9:59 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 04, 2021 at 09:19:57PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 4, 2021 at 9:09 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:
> > >
> > > > So I think just checking for VM_PFNMAP after the vma is set up should
> > > > be enough to guarantee we'll only have pte_special ptes in there,
> > > > ever. But I'm not sure, this stuff all isn't really documented much
> > > > and the code is sometimes a maze (to me at least).
> > >
> > > Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
> > > check after the VMA is populated
> > >
> > > But how do you stuff special pfns into a VMA outside the fault
> > > handler?
> >
> > Many drivers we have don't have dynamic buffer management (kinda
> > overkill for a few framebuffers on a display-only IP block), so the
> > just remap_pfn_range on ->mmap, and don't have a fault handler at all.
>
> remap_pfn_range() makes sense, do you expect drivers using struct page
> backed memory to call that as well?

All the ones using CMA through dma_alloc_coherent end up in there with
the dma_mmap_wc function. So yeah we have tons already.

The drivers with dynamic memory management all use vm_insert_pfn, even
when the buffer is in system memory and struct page backed. I think
those are the two cases. There's another mmap in drm/i915, but that
should never leave intel-specific userspace, and I think we're also
phasing it out somewhat. Either way, should never show up in a shared
buffer usecase, ever, so I think we can ignore it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
