Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA8C701B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2197F10E102;
	Wed, 19 Nov 2025 16:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mafG8ZOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E65410E102
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14CFF43BF9;
 Wed, 19 Nov 2025 16:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D05C116B1;
 Wed, 19 Nov 2025 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763570012;
 bh=SQB43V1lcm01gCfrVBWXeZWkfWYzDLNLnZu9KWeWJcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mafG8ZOF8WzHpM0Ap0HV10HNQ+V26iii16RmNEh8xlVGt/3Fyif1MM/ooh0K/pfIz
 szK/RWtsKgEJUAwJCF4Ei2amklh14ZMnM9irxppUQrCUJkvt/EZVFJcbPn28NcqEGY
 H5mQcoOTZFTUtioKEvXhb//Hd+eC/e25r6Py2bHgQa/vmQ3b9ezpxZIBWcXV9ncmwt
 7e2asxChIzWsMtQIBzyz1HCL0UngdmumU3R+J6sfLJMWs0oS7ZF4iSIBsph8VRgCK0
 +t4iS375piSkus/kTsSOX82JCK0IrwbeeJvL9xKC8TF2BvGIttU+8sQ9kfioC2gTlg
 KCxDuQf1gZvsw==
Date: Wed, 19 Nov 2025 18:33:26 +0200
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
Message-ID: <20251119163326.GL18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
 <20251119145007.GJ18335@unreal>
 <26d7ecab-33ed-4aab-82d5-954b0d1d1718@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26d7ecab-33ed-4aab-82d5-954b0d1d1718@amd.com>
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

On Wed, Nov 19, 2025 at 03:53:30PM +0100, Christian König wrote:

<...>

> >>>>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
> >>>>
> >>>> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
> >>>
> >>> This function performs DMA mapping, so what name do you suggest instead of dma_buf_map()?
> >>
> >> Something like dma_buf_phys_vec_to_sg_table(). I'm not good at naming either.
> > 
> > Can I call it simply dma_buf_mapping() as I plan to put that function in dma_buf_mapping.c
> > file per-your request.
> 
> No, just completely drop the term "mapping" here. This is about phys_vector to sg_table conversion and nothing else.

In order to progress, I renamed these functions to be
dma_buf_phys_vec_to_sgt() and dma_buf_free_sgt(), and put everything in dma_buf_mapping.c file.

Thanks
