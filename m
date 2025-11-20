Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B97C729F8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD00910E6F6;
	Thu, 20 Nov 2025 07:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fk1GOwXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D491B10E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:38:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 32E2D6014A;
 Thu, 20 Nov 2025 07:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2CDC4CEF1;
 Thu, 20 Nov 2025 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763624294;
 bh=TBmcKl0VoEim/6SAhgGNXn7s3ldHbwABAdg4lb6XQUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fk1GOwXX+8I2wrjVFUFCs8eOHzSYMIpbSRNsybaaYnqmR1hvk8o1qyzeHekcACEa7
 0yEVvvcB58TVkvjvuQ+g/DQOgZnEaPJs34D8Vdf/e9Zwg/WSSr8nANTFzZTxu1EY4w
 f+G77YPyofCyVfOqnqhJ1EEumdeOwl1cYYCiSj7kjTatwWqUljRJ6vu6RxqRHEAEU8
 HRAo+V91htNpmPP70IHNTW6yrAz7B8PMq5q1hNDWdzinzbtY3bxLpPYfEP2VVI+Xgm
 NiTNPnC07XH/GYQn22i+8qeLjGe/j0I0H3GmLnYmVwrnbgDp8dKA8f5MMMocC3fZuC
 Xf3HRBvJIpyCw==
Date: Thu, 20 Nov 2025 09:38:10 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251120073810.GQ18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
 <20251119145007.GJ18335@unreal>
 <26d7ecab-33ed-4aab-82d5-954b0d1d1718@amd.com>
 <20251119163326.GL18335@unreal>
 <3053398d-94d8-42fa-aedc-927746375521@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3053398d-94d8-42fa-aedc-927746375521@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 20, 2025 at 08:03:09AM +0100, Christian König wrote:
> On 11/19/25 17:33, Leon Romanovsky wrote:
> > On Wed, Nov 19, 2025 at 03:53:30PM +0100, Christian König wrote:
> > 
> > <...>
> > 
> >>>>>>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
> >>>>>>
> >>>>>> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
> >>>>>
> >>>>> This function performs DMA mapping, so what name do you suggest instead of dma_buf_map()?
> >>>>
> >>>> Something like dma_buf_phys_vec_to_sg_table(). I'm not good at naming either.
> >>>
> >>> Can I call it simply dma_buf_mapping() as I plan to put that function in dma_buf_mapping.c
> >>> file per-your request.
> >>
> >> No, just completely drop the term "mapping" here. This is about phys_vector to sg_table conversion and nothing else.
> > 
> > In order to progress, I renamed these functions to be
> > dma_buf_phys_vec_to_sgt() and dma_buf_free_sgt(), and put everything in dma_buf_mapping.c file.
> 
> Yeah, the problem is I even thought more about it and came to the conclusion that this is still not sufficient for an rb or an Ack-by.
> 
> A core concept of DMA-buf is that the exporter takes care of all the mappings and not the framework.
> 
> Calling pci_p2pdma_bus_addr_map(), dma_map_phys() or dma_map_phys() from DMA-buf code is extremely questionable.
> 
> That should really be inside VFIO and not DMA-buf code, so to move forward I strongly suggest to either move that into VFIO or the DMA API directly.

We got the request to move to DMABUF and agreement a long time ago, in v5.
https://lore.kernel.org/all/aPYrEroyWVOvAu-5@infradead.org/

Thanks

> 
> Regards,
> Christian.
> 
> > 
> > Thanks
> 
