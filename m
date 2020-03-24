Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF6192270
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4A56E5A1;
	Wed, 25 Mar 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB596E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 15:47:11 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q188so14386934qke.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=chg4nJX1BOvdGdGINxOdA9wwXdMZK9Qvm7BfIQKXrzg=;
 b=VYd9ml7v8QtZcpe4vcg3np5ER9erstBwnj20p3vty5hai3xyAkIVlpWZ46/fcVgc2F
 qtBzRlGUmV9+6yb3IBPr41+d3nO8GyGSvYtD1RGgQmJih/p5Z+0jPcPokW/HmsC9n/zI
 gnl1GBossTqOAZgiYGailtXebNocAA91+pAcDto9nEWmaf78Disd7+5hFEYKBu4Z8JyY
 qexj/Qq5jQ9iu8TRUhW0lwOu0bd/qQ9Ki8ASxtDw0GrmUiHNmvN2/N1JM/CNWxbEnwpE
 NY5W/MGME3JjfZl6KKn3zlTv96810YuY3PcDAGAT56jdWJRhkmmubBFTP+p/A4eoWzF9
 Buww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=chg4nJX1BOvdGdGINxOdA9wwXdMZK9Qvm7BfIQKXrzg=;
 b=Gc1BWkNaXB+uKftfnjm1WzzrD3daVDvsRP1zA9qzjrEVJJ7cqRmpe+YtiVl8oV6h7k
 Id9FIgw1UuCfMlbtQyvU34OXWtEnCHJwRUMl7slV+a0Wfyp8vyGItfW9WwFwTU58QzUN
 dfZ81Tujo2ney8zLJwJh4ThJADt/xT2lKWtkQWBJpKCnfqQtGWnhLj1r7DBoQbelolaE
 /Of0QQ4G0MoooBFB2sqZ4GHUmXSSy0huahFc6db5glp+fS+IwwGPLZ6Ws3qMwkwEkQbJ
 ySe5sJKJ3Phm8WT4iBTLzbaLt7QB5pAJ2nG9hCS8hmLLW/pyB7VzCP9Fu7x2T3jDiWEO
 d7Ig==
X-Gm-Message-State: ANhLgQ1X+uf6YldcQEIZuf5zTkcmRXaXfRbvDxiqiku6PUARc/foIipG
 EwShoVKadsY1WIwfXx5mSwe/Fw==
X-Google-Smtp-Source: ADFU+vvUCi/JamBQy96zk6SSaTAFVfy03+IqbYwWkBYKcL6gmBSW32CQssk38STbHoXzwOAYDIKcxQ==
X-Received: by 2002:a37:8641:: with SMTP id i62mr26083263qkd.290.1585064830536; 
 Tue, 24 Mar 2020 08:47:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id t6sm5001434qkd.60.2020.03.24.08.47.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Mar 2020 08:47:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGllk-0004Yc-Jf; Tue, 24 Mar 2020 12:47:08 -0300
Date: Tue, 24 Mar 2020 12:47:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 hmm 7/9] mm/hmm: do not unconditionally set pfns when
 returning EBUSY
Message-ID: <20200324154708.GA14119@ziepe.ca>
References: <20200324011457.2817-1-jgg@ziepe.ca>
 <20200324011457.2817-8-jgg@ziepe.ca>
 <20200324073746.GF23447@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324073746.GF23447@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 08:37:46AM +0100, Christoph Hellwig wrote:
> On Mon, Mar 23, 2020 at 10:14:55PM -0300, Jason Gunthorpe wrote:
> >  	if (pte_none(pte)) {
> >  		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
> >  		if (required_fault)
> >  			goto fault;
> > +		*pfn = range->values[HMM_PFN_NONE];
> >  		return 0;
> >  	}
> >  
> > @@ -274,8 +274,10 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
> >  		}
> >  
> >  		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
> > -		if (!required_fault)
> > +		if (!required_fault) {
> > +			*pfn = range->values[HMM_PFN_NONE];
> >  			return 0;
> > +		}
> 
> Maybe throw in a goto hole to consolidaste the set PFN and return
> 0 cases?

Then we have goto fault and goto none both ending in returns. I
generally prefer the goto labels to have a single return

The pte_unmap() before faulting makes this routine twisty and I
haven't thought of a good way to untwist it

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
