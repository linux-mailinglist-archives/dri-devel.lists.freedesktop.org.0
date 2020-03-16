Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0CB18871E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F806E175;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A49E6E210
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 18:25:42 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m33so15109363qtb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iJWE8TrI0ffeC3Sw+RcRtUnbRu8X59xIzG4mlob+7fY=;
 b=DCjng0Eaj6HsbWcNiFCJF+xC8Xk9BgVsXDx62rgE7yz5SfveIj38SorIiCEOoUa7js
 Q4IVmYevLv2UGcYf/mLcOQPXQR1t+P5y4tyU7bFUWKuRBb2vNiRnjus7GrAdRYxq1kjp
 B6J4OhOvN84SzJIorUukFE1+lOLMcgI5ZzqhXw4t5UP43h7gYy64UuehQbk65HUtIw/U
 nZKwNGJHtutDw5YNRYbjC+GLSeDNDgi86fScXxkugNWCbP/7BMGRkIuJUBUekRkN0TJK
 s75Fb2QVxt7azd3VwTD3WiKDxav8shUm08cY0MvWn1oEkMv5eKiwv2dZcqpCf8thyMpe
 qlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iJWE8TrI0ffeC3Sw+RcRtUnbRu8X59xIzG4mlob+7fY=;
 b=aE5o3AFYnnUrkM31eT1vCMAPl+ovJs6rlLHeUHZKGeWQKJTZ0EV/LZFETuo+mXWc/p
 OxSX20UUChHrNXP8NdJ3yFUs75y9ea85bI09VTNJO8X9QjSOscYb1topEC8sH+82zbzB
 LxsUV/EYhA1BJ7D76k/MmxtSWWqKjb9EGfljtcPlG3PKBf+92oKKKZ4yrrNlBzaxBhMA
 p7emzSvbfbFF/64uPEzwokD8r11HxT4B+agImM3Ljnhsxd1JGx9lv4SLZb9FVDx+imR5
 YQtPv1Hdn5MwC63040kbwCS82oX6DQogjq6zKsF6qer2bPsNRx3+KlGAeNVu0ZdlCx8G
 Ju0g==
X-Gm-Message-State: ANhLgQ088hbCacVzNHhCGVazs/V2D1bthDaOVIqSlfKmEDifEZuvAa98
 b4ojpDvZqMMcVBCXD0XvHUY07w==
X-Google-Smtp-Source: ADFU+vvfq4yHOpYtgjLPPUevf/Pne0zhXSDrRxuWoEydOpikvFwyL2cJYI4Bk8hFq8xZPBXAVYBn7A==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr1498877qtj.344.1584383141614; 
 Mon, 16 Mar 2020 11:25:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id q24sm361232qtk.45.2020.03.16.11.25.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 11:25:41 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDuQm-0005aw-Bf; Mon, 16 Mar 2020 15:25:40 -0300
Date: Mon, 16 Mar 2020 15:25:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Felix.Kuehling@amd.com
Subject: Re: [PATCH  hmm 0/8] Various error case bug fixes for
 hmm_range_fault()
Message-ID: <20200316182540.GA21434@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311183506.3997-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:34:58PM -0300, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> The hmm_range_fault() flow is fairly complicated. The scheme allows the
> caller to specify if it needs a usable result for each page, or if it only
> needs the current page table status filled in. This mixture of behavior is
> useful for a caller that wants to build a 'prefetch around fault'
> algorithm.
> 
> Although we have no in-tree users of this capability, I am working on
> having RDMA ODP work in this manner, and removing these bugs from
> hmm_range_fault() is a necessary step.
> 
> The basic principles are:
> 
>  - If the caller did not ask for a VA to be valid then hmm_range_fault()
>    should not fail because of that VA
> 
>  - If 0 is returned from hmm_range_fault() then the entire pfns array
>    contains valid data
> 
>  - HMM_PFN_ERROR is set if faulting fails, or if asking for faulting
>    would fail
> 
>  - A 0 return from hmm_range_fault() does not have HMM_PFN_ERROR in any
>    VA's the caller asked to be valid
> 
> This series does not get there completely, I have a followup series
> closing some more complex cases.
> 
> I tested this series using Ralph's hmm tester he posted a while back,
> other testing would be appreciated.
> 
> Jason Gunthorpe (8):
>   mm/hmm: add missing unmaps of the ptep during hmm_vma_handle_pte()
>   mm/hmm: do not call hmm_vma_walk_hole() while holding a spinlock
>   mm/hmm: add missing pfns set to hmm_vma_walk_pmd()
>   mm/hmm: add missing call to hmm_range_need_fault() before returning
>     EFAULT
>   mm/hmm: reorganize how !pte_present is handled in hmm_vma_handle_pte()
>   mm/hmm: return -EFAULT when setting HMM_PFN_ERROR on requested valid
>     pages
>   mm/hmm: add missing call to hmm_pte_need_fault in HMM_PFN_SPECIAL
>     handling
>   mm/hmm: do not check pmd_protnone twice in hmm_vma_handle_pmd()

I moved these toward linux-next, if others have remarks or tags please
feel free to continue.

>   mm/hmm: don't free the cached pgmap while scanning

I will respin

Thank you all for the reviews!

Regards,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
