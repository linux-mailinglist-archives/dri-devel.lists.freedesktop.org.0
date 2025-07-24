Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E52B10270
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C69C10E8B3;
	Thu, 24 Jul 2025 07:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BmgGnxFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15010E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:55:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0E728A55FA7;
 Thu, 24 Jul 2025 07:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01868C4CEED;
 Thu, 24 Jul 2025 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753343737;
 bh=RejzoqE1QxLnfVJEcMygPRhvHl4TUui1JW/EXqf2Ekw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BmgGnxFd0m0ax8BCXu8Z23nkYEvrbYb+kfQKhThhtk3fHD05jyqUumNras/XMac1K
 fNsR+wJhnDxgDW3B0m/HYoEQYDy1trcfoIv3oJ5G6lK6WxOJgRTPmYPyorkEbtucoO
 lstjt+ChPXcIFyADPo+xmzPFYCtn+am83vuGKyQI9REWZ+4QOBGiYXPyVWpj/Mf6Qq
 1sj2VY/rutJ5LfhdVsfBdfsSZKWAiRCmF5WPvyewWqqP7ARQWZMzXtSEGh/Zr+/bJF
 bksCHkNXFT6a8dFppzN/TYVK3Vt0jyt6BKBOSqke/cENn8f6Uq9rDv+qbrJJvq5YYP
 D7SDuGtahnLuA==
Date: Thu, 24 Jul 2025 10:55:33 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Alex Williamson <alex.williamson@redhat.com>,
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
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/10] PCI/P2PDMA: Introduce p2pdma_provider structure
 for cleaner abstraction
Message-ID: <20250724075533.GR402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724075145.GB30590@lst.de>
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

On Thu, Jul 24, 2025 at 09:51:45AM +0200, Christoph Hellwig wrote:
> On Wed, Jul 23, 2025 at 04:00:03PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Extract the core P2PDMA provider information (device owner and bus
> > offset) from the dev_pagemap into a dedicated p2pdma_provider structure.
> > This creates a cleaner separation between the memory management layer and
> > the P2PDMA functionality.
> > 
> > The new p2pdma_provider structure contains:
> > - owner: pointer to the providing device
> > - bus_offset: computed offset for non-host transactions
> > 
> > This refactoring simplifies the P2PDMA state management by removing
> > the need to access pgmap internals directly. The pci_p2pdma_map_state
> > now stores a pointer to the provider instead of the pgmap, making
> > the API more explicit and easier to understand.
> 
> I really don't see how anything becomes cleaner or simpler here.
> It adds a new structure that only exists embedded in the exist one
> and more code for no apparent benefit.

Please, see last patch in the series https://lore.kernel.org/all/aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com
It gives me a way to call p2p code with stable pointer for whole BAR.

Thanks

> 
> 
