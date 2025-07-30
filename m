Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B7B15A21
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20CF10E424;
	Wed, 30 Jul 2025 08:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Phq6ne8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FAB10E420
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CC0543D89;
 Wed, 30 Jul 2025 08:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C439C4CEE7;
 Wed, 30 Jul 2025 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753862603;
 bh=HEgPRodovJalgZ/g1kb94tmKLk2QtGEpj7zW37uzKec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Phq6ne8jeiHRh+g/jyaIbVu24BslXtOFr5jlNeVkeq5Pd4JP4IP/urevgfTH7y8Ng
 IM4N1EVTTw6lIyVWLMQ5K0tdY5QpmQj79Qaao8gIoOMRohyP/vZ3M9ekEqXib6GZL+
 Vd2t51G/uWQd6oD58QoSzV0VWLuJ8QqSIDQStXuXWQ5G8gEHsTZDXx81LTTpzH1daZ
 ezVZXuukAwl9TGk23btBxOterY1GjPt8BN4i8ULPTxzKhdnMZ1IhejtxHnXHMC5Wo6
 rXCmw6UrvY7ectigm1BvmYyiZfOF9dlvJf0mlr92yHUxxT/i06Xv2nhdtuZ9olDn3p
 c3RNuuUGIqBAg==
Date: Wed, 30 Jul 2025 11:03:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Alex Williamson <alex.williamson@redhat.com>,
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
Message-ID: <20250730080317.GO402218@unreal>
References: <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
 <20250727190514.GG7551@nvidia.com>
 <d69e0d74-285e-4cde-a2e4-a803accfa9e1@deltatee.com>
 <20250728164136.GD402218@unreal>
 <d3c8c573-f201-4450-9400-cc3ccafd2c04@deltatee.com>
 <20250728231107.GE36037@nvidia.com>
 <f332e2b9-151f-49ca-ac0c-8c9494c38027@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f332e2b9-151f-49ca-ac0c-8c9494c38027@deltatee.com>
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

On Tue, Jul 29, 2025 at 02:54:13PM -0600, Logan Gunthorpe wrote:
> 
> 
> On 2025-07-28 17:11, Jason Gunthorpe wrote:
> >> If the dma mapping for P2P memory doesn't need to create an iommu
> >> mapping then that's fine. But it should be the dma-iommu layer to decide
> >> that.
> > 
> > So above, we can't use dma-iommu.c, it might not be compiled into the
> > kernel but the dma_map_phys() path is still valid.
> 
> This is an easily solved problem. I did a very rough sketch below to say
> it's really not that hard. (Note it has some rough edges that could be
> cleaned up and I based it off Leon's git repo which appears to not be
> the same as what was posted, but the core concept is sound).

I started to prepare v2, this is why posted version is slightly
different from dmabuf-vfio branch.

In addition to what Jason wrote. there is an extra complexity with using
state. The wrappers which operate on dma_iova_state assume that all memory,
which is going to be mapped, is the same type: or p2p or not.

This is not the cased for HMM/RDMA users, there you create state in
advance and get mixed type of pages.

Thanks
