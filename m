Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C6184211
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D646EB7D;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBE16EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:24:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id e20so4467355qto.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=52ZZzeEs2+/pEqqEqbFCeogGP38EHvEOX2S5bgO8/Z8=;
 b=jrATH5N4qry8StY9pugG0+Ke0KycR/1N2zDWcpjLUXgUtOruYPniperiSYRi0PgRPj
 SA/RFmVPGSlhzzKalOXPR0wertWcVSG882vtQ2Cb6na8jnpL+druFTgZ5rlV3/rhUbNR
 lBLtmLQ1Jmh979ccU6Nu63pbpXDGsGFS0JF+pa9lXCzdlUkAAyPxh5G6stEAb8ATAYVp
 pnCFpbfZDe6kcdMTTjIAgUds7v/kbayqFnGX1B9S65GsHbTW48wQL1N0dsUqgn962TjC
 CYCsxlb/EMUAediX8rr0bMIgCbFMCrldcF5fA6z+Y/Cj0v/0e1bbYt+cKkQmCOSHYlon
 64Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=52ZZzeEs2+/pEqqEqbFCeogGP38EHvEOX2S5bgO8/Z8=;
 b=NAuFO3wKoh7TuQNnaddE0ps4S05WUiAO4MLA9aLfiqkuPwoFJvtnR4c8gOLadZiwL+
 skuB22pgOviLpfJxHFFUZyTppj/9zUr2Ibs6TP1yDiQ6NH/LdqxHprUw6/wpxKp64wOJ
 w2I0+pr6C5U00y4Cthsk9IPe10o1jKt43/JtSfnBn4+mX28vpbbFy5ykh2jon7bjGd7u
 +FULNqrFsJgMk/ZNL21y4MuKQoRC9rHnKADeLG6nYoaRQ5KiT3GmuM+nmWTqtmI2b9JL
 mSVavnLMG0Z3czJmqC6b3uAsnnYogi6W6+c3hK34spz/o9GEM4WENfHMlOW8jzwZ5Nyd
 2Pkg==
X-Gm-Message-State: ANhLgQ3qCD49noBixH6i2zSwten43H7GAGV/znyfCm3Db74fa+HND0dU
 57Sx0n92Po95rqVpmT23phLiVw==
X-Google-Smtp-Source: ADFU+vu5Fkd5eDw/Rl+GHYbcM47zQEIC0ZRocx7GR91XzXr+d17sBdhNME00hrVEuCo/+2TJubSNAw==
X-Received: by 2002:aed:2535:: with SMTP id v50mr1091436qtc.354.1584023070460; 
 Thu, 12 Mar 2020 07:24:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id l13sm12836457qke.116.2020.03.12.07.24.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 07:24:29 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCOlB-0006Wf-C8; Thu, 12 Mar 2020 11:24:29 -0300
Date: Thu, 12 Mar 2020 11:24:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm 1/8] mm/hmm: add missing unmaps of the ptep during
 hmm_vma_handle_pte()
Message-ID: <20200312142429.GL31668@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-2-jgg@ziepe.ca>
 <1cfdfdff-6d41-b73a-fe48-c7a10c221482@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cfdfdff-6d41-b73a-fe48-c7a10c221482@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 06:28:30PM -0700, Ralph Campbell wrote:
> >   mm/hmm.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index 72e5a6d9a41756..35f85424176d14 100644
> > +++ b/mm/hmm.c
> > @@ -325,6 +325,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
> >   		}
> >   		/* Report error for everything else */
> > +		pte_unmap(ptep);
> >   		*pfn = range->values[HMM_PFN_ERROR];
> >   		return -EFAULT;
> >   	} else {
> > @@ -339,10 +340,13 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
> >   	if (pte_devmap(pte)) {
> >   		hmm_vma_walk->pgmap = get_dev_pagemap(pte_pfn(pte),
> >   					      hmm_vma_walk->pgmap);
> > -		if (unlikely(!hmm_vma_walk->pgmap))
> > +		if (unlikely(!hmm_vma_walk->pgmap)) {
> > +			pte_unmap(ptep);
> >   			return -EBUSY;
> > +		}
> >   	} else if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) && pte_special(pte)) {
> >   		if (!is_zero_pfn(pte_pfn(pte))) {
> > +			pte_unmap(ptep);
> >   			*pfn = range->values[HMM_PFN_SPECIAL];
> >   			return -EFAULT;
> >   		}
> > @@ -437,7 +441,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
> >   		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, &pfns[i]);
> >   		if (r) {
> > -			/* hmm_vma_handle_pte() did unmap pte directory */
> > +			/* hmm_vma_handle_pte() did pte_unmap() */
> >   			hmm_vma_walk->last = addr;
> >   			return r;
> >   		}
> > 
> 
> I think there is a case where hmm_vma_handle_pte() is called, a fault is requested,
> pte_unmap() and hmm_vma_walk_hole_() are called, the latter returns zero (the fault
> was handled OK)

Not quite, hmm_vma_walk_hole_() never returns 0 if called with fault:

        return (fault || write_fault) ? -EBUSY : 0;

And all the call sites of hmm_vma_walk_hole_() in hmm_vma_handle_pte()
are structured as:

                if (fault || write_fault)
                        goto fault;
fault:
        return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);

So, it never returns 0.

I already made a patch making this less twisty while fixing something
else:

https://github.com/jgunthorpe/linux/commit/078e10ca5919f2c263c245784fb5fe63ddbb61f4

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
