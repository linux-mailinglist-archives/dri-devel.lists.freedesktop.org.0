Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3742AADF2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F9289259;
	Sun,  8 Nov 2020 22:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975FC6EA87
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 12:55:08 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id h15so861366qkl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 04:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y9u4GqsYFp3yQokc1modUW8kbXKOkRHXB2lqruGcudE=;
 b=VKArHGzBXh6z/A+MygU+amo68YTqsv8wcX06tMjQJtSaCh73j9dK84DDYNiOFbWqbG
 oWPby5Nt17abP3CNuT4Y8hOrMF9IphjmFlJ+1LFTGZJslKxvYBCkSQrvO11j5gLNPiyD
 dVfekpRDt0jU+YzoaecvEZ4LCFhH+XfiNy4waUk/+nEQ0mmuEpuYBI6Uswsojiaa1B6R
 4eHm926I6a27i5ah9cJ5gtV9zfeyLjLkJD44KWC+QIdKscIOwG27BP9X+Qsw/8/Tj3Ln
 mUTJhpKjLu76fxGa66zDAX1JckZqgFcVUxJppOLi4JuOkrAZQ52ZBCQ/Pp5o1ft2CM/4
 MpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y9u4GqsYFp3yQokc1modUW8kbXKOkRHXB2lqruGcudE=;
 b=MRJRin+a1JAOcK3WYxvdqe8oWTP9IJdhsNVmPrqO/RFLHi/1oWsn9uqQXPpiFLoNJB
 wcoCLiDfPFTpIt8ubAtt4ASqxei4TWWNNkgf90grXLFu0qMIvcsCSVlFo5VIRc4Nb0G0
 z0+fgmLqPMinAo6CIFrxsImk1xjOleMUauTx7hnLWPVZQ3LUjcG1HI3gLYoaSzc8UKhM
 TyxpF/q6GPnTNBkRBz5N6boDACQd497ZqW0XLxE5zUdA7tBjEfYouAFkUJyBBWSEDgi+
 t83gSuXwzboefjJVFJTSZ/EVPzp1UR00p+uILLZMAI9CxMQeDL2xlww64y+RPiArGHXS
 NebQ==
X-Gm-Message-State: AOAM5325z4ptrvfTKg4D7BZHyviPb1C1LOkHOXmgAVNIuUCUYsf8saqG
 sQW841gFBG1UiIpjLL0/9XYxRQ==
X-Google-Smtp-Source: ABdhPJypDSdSDlm1WvWqsV5KWCBdZzp9Y89hHRIKGgXQ8bDqOzWA3qxmMNugSM6RB0Bn+AiihIdxtQ==
X-Received: by 2002:a37:7d84:: with SMTP id y126mr1335251qkc.36.1604667306647; 
 Fri, 06 Nov 2020 04:55:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y187sm408537qka.116.2020.11.06.04.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 04:55:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb1Gj-000lY1-5o; Fri, 06 Nov 2020 08:55:05 -0400
Date: Fri, 6 Nov 2020 08:55:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201106125505.GO36674@ziepe.ca>
References: <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org>
 <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
 <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
 <CAKMK7uFb2uhfRCwe1y5Kafd-WWqE_F3_FfpHR9f8-X-aHhgjOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFb2uhfRCwe1y5Kafd-WWqE_F3_FfpHR9f8-X-aHhgjOQ@mail.gmail.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
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

On Fri, Nov 06, 2020 at 11:27:59AM +0100, Daniel Vetter wrote:
> On Fri, Nov 6, 2020 at 11:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Nov 6, 2020 at 5:08 AM John Hubbard <jhubbard@nvidia.com> wrote:
> > >
> > > On 11/5/20 4:49 AM, Jason Gunthorpe wrote:
> > > > On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
> > > >>> /*
> > > >>>   * If we can't determine whether or not a pte is special, then fail immediately
> > > >>>   * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
> > > >>>   * to be special.
> > > >>>   *
> > > >>>   * For a futex to be placed on a THP tail page, get_futex_key requires a
> > > >>>   * get_user_pages_fast_only implementation that can pin pages. Thus it's still
> > > >>>   * useful to have gup_huge_pmd even if we can't operate on ptes.
> > > >>>   */
> > > >>
> > > >> We support hugepage faults in gpu drivers since recently, and I'm not
> > > >> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
> > > >> just me missing something again.
> > > >
> > > > It means ioremap can't create an IO page PUD, it has to be broken up.
> > > >
> > > > Does ioremap even create anything larger than PTEs?
> >
> > gpu drivers also tend to use vmf_insert_pfn* directly, so we can do
> > on-demand paging and move buffers around. From what I glanced for
> > lowest level we to the pte_mkspecial correctly (I think I convinced
> > myself that vm_insert_pfn does that), but for pud/pmd levels it seems
> > just yolo.
> 
> So I dug around a bit more and ttm sets PFN_DEV | PFN_MAP to get past
> the various pft_t_devmap checks (see e.g. vmf_insert_pfn_pmd_prot()).
> x86-64 has ARCH_HAS_PTE_DEVMAP, and gup.c seems to handle these
> specially, but frankly I got totally lost in what this does.

The fact vmf_insert_pfn_pmd_prot() has all those BUG_ON's to prevent
putting VM_PFNMAP pages into the page tables seems like a big red
flag.

The comment seems to confirm what we are talking about here:

	/*
	 * If we had pmd_special, we could avoid all these restrictions,
	 * but we need to be consistent with PTEs and architectures that
	 * can't support a 'special' bit.
	 */

ie without the ability to mark special we can't block fast gup and
anyone who does O_DIRECT on these ranges will crash the kernel when it
tries to convert a IO page into a struct page.

Should be easy enough to directly test?

Putting non-struct page PTEs into a VMA without setting VM_PFNMAP just
seems horribly wrong to me.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
