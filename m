Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508E2A7908
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA4D6EA18;
	Thu,  5 Nov 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312389D73
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:02:16 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n63so7435740qte.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/UKgc10BslmqBEq+jaLxahr/MEdpryS7jFqE+Dnr3vI=;
 b=HhJHYDe4YHd+/a56BdoqnLrywV6UfuBf/DsyHbP4QvtBlGMcnvi67aThLz1LQnQ9C7
 8EemYt7CTkS9B+W9jO8pXOPnbTizt3Pe9397JG9VN2ZMIG13OJgH9kNFKGqXLgoE3Hzj
 V1vv8lw5Pa9YVxFQjZfe4EOFce5bInYTuWldtvqSVrDDdmTUopOFroR+gBfYNDg6Uuau
 3Jp2luUDv74e1JR/3SaJIovsmPrALIHM4h9v9NFcni+HQF+v8Dr91QTVCCYUEOxMud09
 LLulIis0YmYr2jolcahGS2sbLtv9wbZ7FKZV2VUnjcWsESvH7Lm4q6CoSzm/SgrhfDUT
 xwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/UKgc10BslmqBEq+jaLxahr/MEdpryS7jFqE+Dnr3vI=;
 b=F8tzGe6UbMj1GYsQjMpQYjRnc1fKLVEPxZYLTYq1qP6EcAbzKp/ZfmBfLn3ikBWhtW
 hTakfqlujcCglMb2oFmiVhmnaa8tp6+LqtspILpTEWH8EWLozYjkA54wsUX6EVkxgKRR
 LPSYrBosFbSexpcB3lC1bLmjoaorfU6Wnp0VLbmB/g7ZPZwiVOECk5qYLlsTHCCS5/UQ
 ypo7bBIzVNW/pqV1cLwUKtHhBvpL4EeOd3QHAxOIPbvf24gs07XmwUV7IAHHLkdc8lId
 1xMoh5zvTBLO2sVHKAwH+mXN85+jFux2GXTZ0ME/IyQJPDsiDlJ2shrT6+c7VUVnHzeg
 giWA==
X-Gm-Message-State: AOAM532wkmXhzJfpdt8trdX+CR0J2uofutG5aSi0qPRJ2lEogV3O9Pzw
 M8WhPZ881ziLcc6E6aF8T34+Aw==
X-Google-Smtp-Source: ABdhPJx0R0pt2rE5Fh6PKobat9BHCWAKjXRAimq+VPJpufi8x0s4Mnx78kA46TVhPrgcaUAjwr3r5w==
X-Received: by 2002:ac8:5948:: with SMTP id 8mr20543496qtz.215.1604516535414; 
 Wed, 04 Nov 2020 11:02:15 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h9sm710672qth.78.2020.11.04.11.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:02:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaO2w-00Gbbx-2K; Wed, 04 Nov 2020 15:02:14 -0400
Date: Wed, 4 Nov 2020 15:02:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201104190214.GW36674@ziepe.ca>
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
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
 Pawel Osciak <pawel@osciak.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
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
> > 
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

I saw that once and I really couldn't make sense of it..
What use is having futex's that only work on THP pages? Confused

CH said there was no case of HAVE_FAST_GUP !ARCH_HAS_PTE_SPECIAL, is
one hidden someplace then?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
