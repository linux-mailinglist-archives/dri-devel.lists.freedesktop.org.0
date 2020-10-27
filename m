Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5829CEC1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30F6ECA1;
	Wed, 28 Oct 2020 08:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3B96E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:51:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 140so2422147qko.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tny+Go8Wlg2gBVQUisVFS/zNRhx6BeGWA7LrDqL6x2k=;
 b=ZzCQVs2cnQ3zSIELdpGRcFB5x/lUOzhctVtmCOMNH5B4ZbSqpAe1OmIL9qLoKdPC6s
 uZz5vfElPfOc2hKaE5pagJV5eYJeq7+QUXCNTdDD96AnAhr2DG0P9mzKD6BZelowxg6O
 aOKRwBDK7QW+UlCLyhsN1UEzdSKqYFrHzzS25CW9ZJ0VIEWgs+UZHBR5v3A6mTexzgV1
 T07EBp4zpXRbui0/w5QLhiKg/qyOdsT8YwiNzm4RBGTrwH3ovjTYHFjjx6M0j2uD/cs4
 a2wrVAOQdBuXjc1UGcN9SDwYwrXqCkMlFtz8928MBb4aUTGGxbb+COWj8kVkR1bl7sN7
 YSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tny+Go8Wlg2gBVQUisVFS/zNRhx6BeGWA7LrDqL6x2k=;
 b=XT/A8z08V2r+ioWp1pvrtJPIQzbIetEX83FgBQ5i7sXxnWKuJGXC1eiplFOYUqnEEE
 FzRw9TTvNxaAqN5IxIyNt7JLfezfNmLaTwBfa7VQkBF0vqm3sm3qoQ77UfgbKmkzmvDC
 NW8foByaqJe0ebT4HSQ96MRDmq5jMhcMC3ynBf3sU5hjCqWKa0PYKIrmDcVqzVjj+44k
 4rdBMKP3CzgvJrd2SH6eibsfEs8FbSYp3kP+ZnQn8m9cpizRPNlHfzxDjAfZEHI3fFbC
 oNuNa3taxEn2PhFp1Gb5YCVQvv/313CAJNNGaufd2wY7crUZAicjURluZFvRAt2R8s2l
 kIQQ==
X-Gm-Message-State: AOAM530YHBebi0GAzNpB698WAmueRfbDbzu2iUn94oHW2m5djnYLGdm7
 nNfGUU+sBlGD8hVRAtQWgU8tKg==
X-Google-Smtp-Source: ABdhPJyGHcDRkkajtNI9UZWjHFV5KNgtH9k54FQ77KgXBk8TbYuTisXXaKXk29QBcjrKDzRLrbteEA==
X-Received: by 2002:a37:e20d:: with SMTP id g13mr3839866qki.325.1603828300886; 
 Tue, 27 Oct 2020 12:51:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a30sm1538970qtn.55.2020.10.27.12.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:51:39 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kXV0N-009f0s-6M; Tue, 27 Oct 2020 16:51:39 -0300
Date: Tue, 27 Oct 2020 16:51:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201027195139.GV36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca>
 <20201024074807.GA3112@infradead.org>
 <20201026122637.GQ36674@ziepe.ca>
 <20201027080816.GA2692@infradead.org>
 <MW3PR11MB4555208D038CEFE6C468DAF5E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555208D038CEFE6C468DAF5E5160@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Doug Ledford <dledford@redhat.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 05:32:26PM +0000, Xiong, Jianxin wrote:
> > On Mon, Oct 26, 2020 at 09:26:37AM -0300, Jason Gunthorpe wrote:
> > > On Sat, Oct 24, 2020 at 08:48:07AM +0100, Christoph Hellwig wrote:
> > > > On Fri, Oct 23, 2020 at 03:20:05PM -0300, Jason Gunthorpe wrote:
> > > > > The problem is we have RDMA drivers that assume SGL's have a valid
> > > > > struct page, and these hacky/wrong P2P sgls that DMABUF creates
> > > > > cannot be passed into those drivers.
> > > >
> > > > RDMA drivers do not assume scatterlist have a valid struct page,
> > > > scatterlists are defined to have a valid struct page.  Any
> > > > scatterlist without a struct page is completely buggy.
> > >
> > > It is not just having the struct page, it needs to be a CPU accessible
> > > one for memcpy/etc. They aren't correct with the
> > > MEMORY_DEVICE_PCI_P2PDMA SGLs either.
> > 
> > Exactly.
> 
> In the function ib_umem_dmabuf_sgt_slice() (part of this patch) we could generate
> a dma address array instead of filling the scatterlist
> 'umem->sg_head'. 

I don't think we should change the format, the SGL comes out of the
dmabuf and all the umem code is able to process it like that. Adding
another datastructure just for this one case is going to be trouble.

Ultimately I'd like to see some 'dma only sgl', CH has been talking
about this for a while. When we have that settled just change
everything connected to umem

I think in the meantime the answer for this patch is drivers just
can't call these APIs and use the struct page side, just like they
can't call the DMA buf API and use the struct page side..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
