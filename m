Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFF18DF88
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879966E2F2;
	Sat, 21 Mar 2020 10:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889626EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:58:16 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id m2so2836855qvu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7tshdo6c8ufpkvS21qNDq3o1JI++3fGdgC9NNzUitoU=;
 b=IvTQLQxfTudOZo6mQWXcw0MoAViFLghOoPbxW/9yZkUMgOiZ4Pv9Z04Csj2TJq5vca
 qb/NOPGNHtZJ6s24cM+QRSb5JuK21NJyav0y6/cJqE7vqjvLZeiPQwWPggHqBJHigTLB
 ymmND/5GQ89u7BiyP07RYIjAcCIa+vFjUpz4zOgJSTVCkcudYccK0vOVEQgM0fc99dpd
 Vs62xPG18t0GhZadO3Oap9mTCctOwTr0CiUfvnOTXVINl2qtmYv1/+hwvSX1r+r/EA1v
 Ke5XvA9K39riwOsICVFnrILW1mFcLwADDE6udlfAI2AZmQRk3mQ4NBUc46ebi+QLcJNF
 7/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7tshdo6c8ufpkvS21qNDq3o1JI++3fGdgC9NNzUitoU=;
 b=fgqPWP2jkGTiu7sgSPdlr2m03siwK+s2LFQeLfitSt5NBsHhy84wdP5/YfG0sAp1ly
 JD+uYb7ZmnlOFsxzR3VjZ04TPrWdSvHlPR8S+nyzvsqnDLSkXNMYWNpA6PFrRJPRLxSP
 FHC+mImEGleqS53QEC6slc0cIw058KiIFPIfzWjDaXP8h/SVms31viMfwHG4+9zR0ynz
 C2jdfDLgHzy4e+IV7+KVWI6MTq6enpBWQOdf4U9ormJksStZukuUxrJJVVTUq/ZsPonX
 E9rO+UdRFLJjCJX7lb0ZEEVJ5XvMU6NR9oGdt0/uFiYxWh1ws+C9Ud3gDFzQ5aCD+0Wk
 Vxng==
X-Gm-Message-State: ANhLgQ2dzIpdfL8VQ3M3exveVWiJvbVF9klUAVWqqep7sAUk68DvKYOA
 GWpAzywbDCyJHJbJX3HAastQIg==
X-Google-Smtp-Source: ADFU+vvR+3vAV1p7d+fDNfmTEDRX1I6s0r0r+8MeuA2PAqUC3MBTAsQJGe+LIm8TG0FJxBXCYdsOGw==
X-Received: by 2002:a0c:ec02:: with SMTP id y2mr7683694qvo.171.1584709095500; 
 Fri, 20 Mar 2020 05:58:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id y15sm4157894qky.33.2020.03.20.05.58.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 05:58:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFHE5-0007Cq-2w; Fri, 20 Mar 2020 09:58:13 -0300
Date: Fri, 20 Mar 2020 09:58:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Message-ID: <20200320125813.GQ20941@ziepe.ca>
References: <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
 <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
 <20200320001428.GA9199@ziepe.ca>
 <8d549ef6-14ae-7055-58c8-d56de8bf4ba6@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d549ef6-14ae-7055-58c8-d56de8bf4ba6@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:25 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 06:33:04PM -0700, Ralph Campbell wrote:

> > > +		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
> > > +				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
> > > +		.dev_private_owner = dmirror->mdevice,
> > > +	};
> > > +	int ret = 0;
> > 
> > > +static int dmirror_snapshot(struct dmirror *dmirror,
> > > +			    struct hmm_dmirror_cmd *cmd)
> > > +{
> > > +	struct mm_struct *mm = dmirror->mm;
> > > +	unsigned long start, end;
> > > +	unsigned long size = cmd->npages << PAGE_SHIFT;
> > > +	unsigned long addr;
> > > +	unsigned long next;
> > > +	uint64_t pfns[64];
> > > +	unsigned char perm[64];
> > > +	char __user *uptr;
> > > +	struct hmm_range range = {
> > > +		.pfns = pfns,
> > > +		.flags = dmirror_hmm_flags,
> > > +		.values = dmirror_hmm_values,
> > > +		.pfn_shift = DPT_SHIFT,
> > > +		.pfn_flags_mask = ~0ULL,
> > 
> > Same here, especially since this is snapshot
> > 
> > Jason
> 
> Actually, snapshot ignores pfn_flags_mask and default_flags.

Yes, so no reason to set them to not 0..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
