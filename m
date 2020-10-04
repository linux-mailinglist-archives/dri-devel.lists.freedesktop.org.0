Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B92830C8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0379089FFD;
	Mon,  5 Oct 2020 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B03E89FE8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 12:51:02 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id di5so4283822qvb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Oct 2020 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UGbXQ0m+bhJCTErRPquTM6BteOTMiFqzd2EWO2s4mFY=;
 b=W9fKhhT9gZPcLblKAmPnfnimQd8ftf00/a+144bKPFTEsVyurYJ7UddnCfhpXYHyp7
 W6zQWz2EGYx9I5z3YLpofo7PF0pbpROUQF+LTjn9ADPVpuQdRTPWTQ/f8WO4ZsOQSrXT
 KABDUKUgPFWiqJXqRLAKwbuysocQ7zyJzNbPGVnGZAdQTjXQHGXgDuACQlMKrRM3JqQB
 zKGtw4NJG10hTUnjpBpn/YOm2rbi2HVPtHishpuDuBxjziPpR1p/4ifk4VbMan1Z6ZZr
 K8NmhM1NL7g46JQIPx7kmCQzRw0OkwO9xlDTAULE1eLpvxp5rFfeR+MYjcEU39Ue7bCd
 d1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UGbXQ0m+bhJCTErRPquTM6BteOTMiFqzd2EWO2s4mFY=;
 b=Em2sS0fTYFrD3be/83iiOllKgQhoFKhIk5NO6hD/WpDMBPYRs5exq24y/4TRNply0o
 5hhEkd04NKpe2Az1aXJh+D6fhQAx10HzjfRX2OI2MowO3no2zVUcBm5QknWVBxgTTeDb
 5xoKRO9lXxxZM4oXSuwmQhi3QJ5RDL9XQnly8LsYCt7U0svFr+G2C/TVxRjgn8xdbuXd
 Vi35YoeeoFiykZxlRPok+MlaQxbYgdW+3/FFFOB2hoSg3ekkjIrNukiUtwZtfry9X150
 lVk6KkEczlhI+2nYr+xyqme6ORdAYY0hYlzBQbLkIVmIjR/P76KOKVa7q9qjuTwgFn0A
 sl4w==
X-Gm-Message-State: AOAM53139tCGqT/AFb6S8yj5M0eZtVoZtg9EYCF+pRRMPAWZmstTAGG4
 WTkMBszjGIsPPSYYaqFA1gVgWQ==
X-Google-Smtp-Source: ABdhPJy8Yfds4NEUHCufWQMM3OiOFZaJGgKnGPYb9qLMVbqTTnA5dMcD8m9CgoMS4BHgfwkh5pPdXA==
X-Received: by 2002:ad4:4af4:: with SMTP id cp20mr10200433qvb.40.1601815861241; 
 Sun, 04 Oct 2020 05:51:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id n11sm5205534qkk.105.2020.10.04.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 05:51:00 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kP3Tf-007HEC-QI; Sun, 04 Oct 2020 09:50:59 -0300
Date: Sun, 4 Oct 2020 09:50:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201004125059.GP9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 03, 2020 at 11:40:22AM +0200, Daniel Vetter wrote:

> > That leaves the only interesting places as vb2_dc_get_userptr() and
> > vb2_vmalloc_get_userptr() which both completely fail to follow the
> > REQUIRED behavior in the function's comment about checking PTEs. It
> > just DMA maps them. Badly broken.
> >
> > Guessing this hackery is for some embedded P2P DMA transfer?
> 
> Yeah, see also the follow_pfn trickery in
> videobuf_dma_contig_user_get(), I think this is fully intentional and
> userspace abi we can't break :-/

We don't need to break uABI, it just needs to work properly in the
kernel:

  vma = find_vma_intersection()
  dma_buf = dma_buf_get_from_vma(vma)
  sg = dma_buf_p2p_dma_map(dma_buf)
  [.. do dma ..]
  dma_buf_unmap(sg)
  dma_buf_put(dma_buf)

It is as we discussed before, dma buf needs to be discoverable from a
VMA, at least for users doing this kind of stuff.

> Yup this should be done with dma_buf instead, and v4l has that. But
> old uapi and all that. This is why I said we might need a new
> VM_DYNAMIC_PFNMAP or so, to make follow_pfn not resolve this in the
> case where the driver manages the underlying iomem range (or whatever
> it is) dynamically and moves buffer objects around, like drm drivers
> do. But I looked, and we've run out of vma->vm_flags :-(

A VM flag doesn't help - we need to introduce some kind of lifetime,
and that has to be derived from the VMA. It needs data not just a flag

> The other problem is that I also have no real working clue about all
> the VM_* flags and what they all mean, and whether drm drivers set the
> right ones in all cases (they probably don't, but oh well).
> Documentation for this stuff in headers is a bit thin at times.

Yah, I don't really know either :\

The comment above vm_normal_page() is a bit helpful. Don't know what
VM_IO/VM_PFNMAP mean in their 3 combinations

There are very few places that set VM_PFNMAP without VM_IO..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
