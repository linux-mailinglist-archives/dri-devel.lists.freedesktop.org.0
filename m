Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C872D2A7A64
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6A36E193;
	Thu,  5 Nov 2020 09:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059DD6E193
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:25:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so840365wmd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6viq27xeTxIz8acrTQ2jRGDu1L7mOoiJCMIWrZFHf74=;
 b=Pk45fCQQ7XngdYs3ziaP+ymxGzpakbhoUL7YEZ1pNacSF/8myikkPFyZUaHYgYV+MI
 jUFI0zhMI1Q5QNm1leQcIJl/cJaDXfbVVx+4uWz9xdSA/Fb7U7QrV97m7ySMNgMlnXw7
 FTghP2yCD22NR5UHFnL7m1NqQXsahfUUgl95A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6viq27xeTxIz8acrTQ2jRGDu1L7mOoiJCMIWrZFHf74=;
 b=KMT4bWr7rW4UVFdvMm8LPVDXbLYE+o/aUxRx0L63DGQxQW5ARaJduSUERFNKE3L99H
 asHy6jOm3cxiMiaSB9RHXJgGDfphSzMspYwM0khIgnZypdX3CqEglnH1ncWWWJMAj9i6
 f5yPMhccFJ57pPfKmkkticbsiQqZSnn46OBXKRDxWvYyCSnvGHgsv7OFZtMakfixUgrN
 4dAfvNcw67L7a11BdqSxjWfpMk7ofHgka4mV93+60qNqy6gMZcImYqbvYuPFXXiTAMQC
 RRZtdxeY8jlo/PCME7qHEoAeX5um8lQNxYJc5AiLEkSUWyj8p6q44cjxHpcuRmAXr/GJ
 MI8Q==
X-Gm-Message-State: AOAM531P9m0tEqVGXdRVxj2lIVvIbACQ/JqEnv+RsxwUSyWowD7R7PB2
 jpVjxxCCh+kpIjuP3MzRDNImKQ==
X-Google-Smtp-Source: ABdhPJy3n17GilkYmW9UEcOuB53n8WrP7NQoee5RAk40ap5hD72YnDNsNHhquJauR7fQm17EWWmhuQ==
X-Received: by 2002:a1c:497:: with SMTP id 145mr1699932wme.127.1604568327398; 
 Thu, 05 Nov 2020 01:25:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d63sm209171wmd.12.2020.11.05.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:25:26 -0800 (PST)
Date: Thu, 5 Nov 2020 10:25:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201105092524.GQ401619@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christoph Hellwig <hch@infradead.org>,
 J??r??me Glisse <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
 KVM list <kvm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 Pawel Osciak <pawel@osciak.com>, Linux MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 10:44:56AM -0800, John Hubbard wrote:
> On 11/4/20 10:17 AM, Jason Gunthorpe wrote:
> > On Wed, Nov 04, 2020 at 04:41:19PM +0000, Christoph Hellwig wrote:
> > > On Wed, Nov 04, 2020 at 04:37:58PM +0000, Christoph Hellwig wrote:
> > > > On Wed, Nov 04, 2020 at 05:26:58PM +0100, Daniel Vetter wrote:
> > > > > What we're discussing is whether gup_fast and pup_fast also obey this,
> > > > > or fall over and can give you the struct page that's backing the
> > > > > dma_mmap_* memory. Since the _fast variant doesn't check for
> > > > > vma->vm_flags, and afaict that's the only thing which closes this gap.
> > > > > And like you restate, that would be a bit a problem. So where's that
> > > > > check which Jason&me aren't spotting?
> > > > 
> > > > remap_pte_range uses pte_mkspecial to set up the PTEs, and gup_pte_range
> > > > errors out on pte_special.  Of course this only works for the
> > > > CONFIG_ARCH_HAS_PTE_SPECIAL case, for other architectures we do have
> > > > a real problem.
> > > 
> > > Except that we don't really support pte-level gup-fast without
> > > CONFIG_ARCH_HAS_PTE_SPECIAL, and in fact all architectures selecting
> > > HAVE_FAST_GUP also select ARCH_HAS_PTE_SPECIAL, so we should be fine.

Thanks for the explainer. I guess I can go back to _fast and instead
adjust the commit message to explain why that's all fine.

> > Mm, I thought it was probably the special flag..
> > 
> > Knowing that CONFIG_HAVE_FAST_GUP can't be set without
> > CONFIG_ARCH_HAS_PTE_SPECIAL is pretty insightful, can we put that in
> > the Kconfig?
> > 
> > config HAVE_FAST_GUP
> >          depends on MMU
> >          depends on ARCH_HAS_PTE_SPECIAL
> >          bool
> > 
> Well, the !CONFIG_ARCH_HAS_PTE_SPECIAL case points out in a comment that
> gup-fast is not *completely* unavailable there, so I don't think you want
> to shut it off like that:
> 
> /*
>  * If we can't determine whether or not a pte is special, then fail immediately
>  * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
>  * to be special.
>  *
>  * For a futex to be placed on a THP tail page, get_futex_key requires a
>  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
>  * useful to have gup_huge_pmd even if we can't operate on ptes.
>  */

We support hugepage faults in gpu drivers since recently, and I'm not
seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
just me missing something again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
