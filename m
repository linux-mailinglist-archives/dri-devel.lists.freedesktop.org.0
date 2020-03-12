Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DD184224
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140A86EB88;
	Fri, 13 Mar 2020 08:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955E66E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:35:23 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u25so6528881qkk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tqmo4Ss6J1xwONYAXrPu9XD0oNKXjQdv9HqBeUdgnS4=;
 b=e/OtmdQOKUz3UT7x9D0c5pN1gX2+j3NRWnOIewgqqlHYYa4xrbLRa2rejJCyBjoLGd
 CtXzD+0tDlBT3FepW68JtBZW2VtUEGYpOA+hPOZcelXPvaI6IWWLIAbeK7fTaC4pvkbG
 v9VSdOuSxUyaV0AAWFUkLE1GP6kVva/fdivF/eegDmgCAd70yCoX0vixMCHg7mQYiK7I
 1x+80UnL3LG9s/Ij8yJqIu1+oWsHmzsnBZJjfocsaXZSAXlMx4Br9SGykYliXgQPmrhE
 wIf+XwI3yGiXWFLNH9kAphb+yaXJD0wSxvrO1frleWQM1j9fKg0mIbR4BAlbe55Fhxe0
 tLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tqmo4Ss6J1xwONYAXrPu9XD0oNKXjQdv9HqBeUdgnS4=;
 b=eZ1pL62TkjHTyVOQvylIfqiLBc/pL2DvLsRXqKEf7VuivQZRKVWSYlEM2SsDoNHBRv
 /jtE2qh6f0cHZyrRYsy4OiQHTEytMggDh+deQfv+3phL5GvUJc3P1NHMf1Sf/fQMb76l
 2FE5UaylqCofk5jl0+a9bwF+4w9duzRb2ktwmERufds+gNPDQ6dOknScJ09OQD9CBul0
 GccVhVS9oTRj12FHccVeS/ZauXOLcQK/mPbiDSb9/Ld59Rlp7RgL/+CThxfcUXj9/Iqx
 hav46TzKE5oaKzzuIol72JJXjhIjnnwmctP01Cklsb4sObZOUvPvlM8iaLs0iY1yGTRm
 fklA==
X-Gm-Message-State: ANhLgQ3w+e8ezh4Ot8EhRbtS5VfFm8Ti7JUNLO/+ov37LemNVK+95FOO
 AlEt1m4VEeTuU86SivNvN3b0uA==
X-Google-Smtp-Source: ADFU+vvYf2U2kHAIQUg76/wWMu87VRsHRi/YQXlzdDhQg3wFhjTOM0AZzwj/e/xzDoVeSpoHdhRj4A==
X-Received: by 2002:a05:620a:a0d:: with SMTP id
 i13mr8096034qka.333.1584023722704; 
 Thu, 12 Mar 2020 07:35:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id q8sm8335388qkm.73.2020.03.12.07.35.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 07:35:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCOvh-0006e4-Mp; Thu, 12 Mar 2020 11:35:21 -0300
Date: Thu, 12 Mar 2020 11:35:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm 7/8] mm/hmm: return -EFAULT when setting
 HMM_PFN_ERROR on requested valid pages
Message-ID: <20200312143521.GN31668@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-8-jgg@ziepe.ca>
 <910ae485-5400-3795-4353-ce4d47e3ae52@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <910ae485-5400-3795-4353-ce4d47e3ae52@nvidia.com>
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

On Wed, Mar 11, 2020 at 06:36:47PM -0700, Ralph Campbell wrote:
> > @@ -390,8 +384,15 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
> >   			return -EBUSY;
> >   		}
> >   		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
> > -	} else if (!pmd_present(pmd))
> > +	}
> > +
> > +	if (!pmd_present(pmd)) {
> > +		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
> > +				     &write_fault);
> > +		if (fault || write_fault)
> > +			return -EFAULT;
> >   		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
> 
> Shouldn't this fill with HMM_PFN_NONE instead of HMM_PFN_ERROR?
> Otherwise, when a THP is swapped out, you will get a different
> value than if a PTE is swapped out and you are prefetching/snapshotting.

If this is the case then the problem is that the return -EFAULT path
needs to do something else.. ie since the above code can't trigger
swap in, it is correct to return PFN_ERROR.

I'm completely guessing, but do we need to call pmd_to_swp_entry() and
handle things similarly to the pte? What swp_entries are valid for a
pmd?

Do you understand this better, or know how to trigger a !pmd_present
for test?

I suppose another option would be this:

	if (!pmd_present(pmd)) {
		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
				     &write_fault);
                /* We can't handle this. Cause the PMD to be split and
		 * handle it in the pte handler. */
		if (fault || write_fault)
 		        return 0;
  		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
        }

Which, I think, must be correct, but inefficient?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
