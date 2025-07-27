Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65973B12DD1
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 08:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6510E154;
	Sun, 27 Jul 2025 06:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V6ve41Za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1896E10E154
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 06:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18BF9600AA;
 Sun, 27 Jul 2025 06:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49FC4CEEB;
 Sun, 27 Jul 2025 06:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753596121;
 bh=WWhFp00ABgRKsC2uOYcHpFSsCkih5U8N9S1/bm3HEt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6ve41Zak6FqYGIRPWdvNdwMfPpQHLnn/G1OPBuETwI5ItOPWDUXA170k7wALPl9R
 LV5UmgOfKcIWXOXmXNXDvg2oKFa+MPKmb44xV1RXo7qlaGXjb5InY7RkNyHDuLXjqv
 v7oaji5OpdebPV9NK4boMVjMbo8R5vodWngmOQReq+LAf/Pk1twkeVnZKn4GwEkpsz
 PkdhJo7R927PwoGPB1NoHxVC+twjz6EsFo0Rd7txaywXaV0GllSt+nRFydY1QMhg/W
 vOdJPaGwLvhMTWNq0jeRRpeR4GCWuudwZ02zlGFMIBWl0C4X6O3koj2oIy0WdW1VQb
 dL4srFTzXh3fw==
Date: Sun, 27 Jul 2025 09:01:57 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
Message-ID: <20250727060157.GV402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
 <20250725185402.GU402218@unreal>
 <a749c502-7794-42f0-8f86-163efd4640b2@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a749c502-7794-42f0-8f86-163efd4640b2@deltatee.com>
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

On Fri, Jul 25, 2025 at 01:12:35PM -0600, Logan Gunthorpe wrote:
> 
> 
> On 2025-07-25 12:54, Leon Romanovsky wrote:
> >> The solution that would make more sense to me would be for either
> >> dma_iova_try_alloc() or another helper in dma-iommu.c to handle the
> >> P2PDMA case. dma-iommu.c already uses those same interfaces and thus
> >> there would be no need to export the low level helpers from the p2pdma code.
> > 
> > I had same idea in early versions of DMA phys API discussion and it was
> > pointed (absolutely right) that this is layering violation.
> 
> Respectfully, I have to disagree with this. Having the layer (ie.
> dma-iommu) that normally checks how to handle a P2PDMA request now check
>  how to handle these DMA requests is the exact opposite of a layering
> violation. 

I'm aware of your implementation and have feeling that it was very
influenced by NVMe requirements, so the end result is very tailored
for it. Other users have very different paths if p2p is taken. Just
see last VFIO patch in this series, it skips all DMA logic.

> Expecting every driver that wants to do P2PDMA to have to
> figure out for themselves how to map the memory before calling into the
> DMA API doesn't seem like a good design choice to me.

We had this discussion earlier too on previous versions. The summary is
that p2p capable devices are very special anyway. They need to work with
p2p natively. BTW, the implementation is not supposed to be in the
drivers, but in their respective subsystems.

> 
> > So unfortunately, I think that dma*.c|h is not right place for p2p
> > type check.
> 
> dma*.c is already where those checks are done. I'm not sure patches to
> remove the code from that layer and put it into the NVMe driver would
> make a lot of sense (and then, of course, we'd have to put it into every
> other driver that wants to participate in p2p transactions).

I don't have plans to remove existing checks right now, but NVMe was already
converted to new DMA phys API.

Thanks

> 
> Logan
> 
> 
