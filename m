Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A251BB14A4E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 10:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82C10E1D6;
	Tue, 29 Jul 2025 08:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mtjx7aNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2F10E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:45:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4605A54C7C;
 Tue, 29 Jul 2025 08:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFDBC4CEEF;
 Tue, 29 Jul 2025 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753778732;
 bh=jkDZ+7UedrBceUBz8tlmLsJhxKV0IBvkz5SAqWUmQpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtjx7aNoJVq9DvGD4ORxhlZmNSbDYw4VpIt5G+1PbR6Rre8lAWRCRQDkAz4KTJ/bm
 BxOO9PzCPjXSeWidky8QMCKZKV2QSFneK6+i7wXzmhFeCMmGPsUu+Uy8H23JTs1bR5
 SBAPBVl6JzLSEXRQh+LZJX7ikFN585m8EXq0Nqd8+eigGIwYYpnp+T2AW9EPD5Qm2R
 IQhv3G+CGzUj9jLEaAYGbBzjIi0YUwqQckxK9Csm1y+KGwG6KpqkBl4LHIvFc569cc
 xXopr3S7OAVJSk8wPuanNo4rGMQEBZyFc3yISHfeC6xtoUaght3ICDAFyg47naXy+n
 xTgrSU4QNB9rQ==
Date: Tue, 29 Jul 2025 11:45:27 +0300
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
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
Message-ID: <20250729084527.GF402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <20250729075230.GB23823@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729075230.GB23823@lst.de>
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

On Tue, Jul 29, 2025 at 09:52:30AM +0200, Christoph Hellwig wrote:
> On Thu, Jul 24, 2025 at 11:13:21AM +0300, Leon Romanovsky wrote:
> > On Thu, Jul 24, 2025 at 10:03:13AM +0200, Christoph Hellwig wrote:
> > > On Wed, Jul 23, 2025 at 04:00:06PM +0300, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Export the pci_p2pdma_map_type() function to allow external modules
> > > > and subsystems to determine the appropriate mapping type for P2PDMA
> > > > transfers between a provider and target device.
> > > 
> > > External modules have no business doing this.
> > 
> > VFIO PCI code is built as module. There is no way to access PCI p2p code
> > without exporting functions in it.
> 
> We never ever export anything for "external" modules, and you really
> should know that.

It is just a wrong word in commit message. I clearly need it for
vfio-pci module and nothing more.

"Never attribute to malice that which is adequately explained by stupidity." - Hanlon's razor.

Thanks

> 
> 
