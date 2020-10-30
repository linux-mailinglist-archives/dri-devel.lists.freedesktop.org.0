Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CC29FC76
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 05:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAB06E938;
	Fri, 30 Oct 2020 04:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E464A6E938
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 04:04:42 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n15so4468910otl.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0QbgsLhT6Fyvwnbaijbhr3l5RA06hcZ/IdPt56ssLa8=;
 b=GariH0e4pbsh6GGADmUy/dS2os+uR5r4sOXfanz6DN+7fol5JKiM8tWtLEbf8zgBV7
 2CbQcwrWgKr2vJ11bjvSqQhshoGeY5e0vqec5+fTVIOVHjp10YRzACXkLJ8pU5j+LLJi
 jkWrGT3zvIYVGwD3MsxAr3AiEtcRzd7LFrM4Pj61lhdQf2ZlyRMd/GghvRRIcNDX5AS5
 WUnMDK84ziVUNlRa3ulbRSuAOgwlYl4385elWqjoihZT4dKHd6j5wnHhtY+RCqzTy0cU
 VeE/ZKMq5im3Z3qgeF3HtoYVCllg14h+SWNS5ge/11cQDgvwKYMYi8FAgx8qL+P01K/k
 k7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QbgsLhT6Fyvwnbaijbhr3l5RA06hcZ/IdPt56ssLa8=;
 b=NHrhdU56bi8CSPL4+Ry6QMzVffvwouZuSV0QLGdApNV91CBImOJ4+f+6kv8qJcag+G
 h4/4XhB7T3ALWZAwDnaaDFQix8B/66h0SgHYgEhDkBz6Zkdw88Y9rhQ+BARkwAzvQ9dn
 5sXuzYKvMCDnSmrWhUXvVVlHYlu3ufsYe/EJ4u/IAIhTnl28eVRgSRgmBDNYljvoBk/R
 kbR/N1e5KqBq9QsYsFkEEBxzFWZ34XZ1t68Bx6vC8xBO8eura5tuYHhYBKHhDy9Nmy0N
 Ajedox/SmbFR5u8+zTZSY40DmKtn5Q691VPP+liEwm7K128u/Pr8PC7Id7OeQFBXrGfI
 Gnew==
X-Gm-Message-State: AOAM530J6Yl/6VHO7BURCnQfBH8PmIjRwIYGv5uc3osv7NJTFOdZ7di0
 kzrp48WFXi8jG3HSbhvRwNcheIiVz8Uib87NJRmMzg==
X-Google-Smtp-Source: ABdhPJxrCBDhKCig/L03qPCOkK6xkvYmtMRhhDx50CzXEzRfvqmALH8yZdNAOgx9V2zMS9Ca92cGk+lDn4xB8OMhuZ8=
X-Received: by 2002:a05:6830:400c:: with SMTP id
 h12mr271298ots.102.1604030682075; 
 Thu, 29 Oct 2020 21:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201030024746.3128-1-hdanton@sina.com>
In-Reply-To: <20201030024746.3128-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 29 Oct 2020 21:04:30 -0700
Message-ID: <CALAqxLVqLdvEWH_jz-urLghVN7SbrktyN877A1QH47Hf6mqo3w@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: Hillf Danton <hdanton@sina.com>
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 7:48 PM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 15:28:34 -0700 John Stultz wrote:
> > On Thu, Oct 29, 2020 at 12:10 AM Hillf Danton <hdanton@sina.com> wrote:
> > > On Thu, 29 Oct 2020 00:16:24 +0000 John Stultz wrote:
> > > > @@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > > >       struct sg_page_iter piter;
> > > >       int ret;
> > > >
> > > > +     if (buffer->uncached)
> > > > +             vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > > > +
> > >
> > > Wonder why you turn back to dma_mmap_wc() and friends?
> >
> > Sorry, can you expand on what you are proposing here instead?  I'm not
> > sure I see how dma_alloc/mmap/*_wc() quite fits here.
>
> I just wondered if *_wc() could save you two minutes or three. Can you
> shed some light on your concerns about their unfitness?

Sorry, I feel a bit daft here. I'm still not exactly sure what you're
proposing, and your reply of saving minutes doesn't really clarify
things.
So I'm not sure it's a good use of time to try to (most likely,
incorrectly) refute all the possible things you might be suggesting.
:)

But I'll try to share my thoughts:

So the system heap allows for allocation of non-contiguous buffers
(currently allocated from page_alloc), which we keep track using
sglists.
Since the resulting dmabufs are shared between multiple devices, we
want to provide a *specific type of memory* (in this case
non-contiguous system memory), rather than what the underlying
dma_alloc_attr() allocates for a specific device.

My sense is dma_mmap_wc() likely ought to be paired with switching to
using dma_alloc_wc() as well, which calls down to dma_alloc_attr().
Maybe one could use dma_alloc_attr against the heap device to allocate
chunks that we track in the sglist. But I'm not sure how that saves us
much other than possibly swapping dma_mmap_wc() for remap_pfn_range()?

But again, I suspect I've mischaracterized what you're actually
suggesting. So please let me know what you're thinking and I'm happy
to consider it.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
