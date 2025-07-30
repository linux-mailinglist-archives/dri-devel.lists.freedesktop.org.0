Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCBB15BAC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 11:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13910E0C9;
	Wed, 30 Jul 2025 09:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="re3qBfXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C51510E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 09:32:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1CC2445B43;
 Wed, 30 Jul 2025 09:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5ABC4CEE7;
 Wed, 30 Jul 2025 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753867941;
 bh=4W4puONHgBcGHwoNV0CY3xma0bboz0RMz11XR/y9JNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=re3qBfXG4XyZtA/RqPxafo444qv+5COTZZvAJcsIAudJvNJ5GRUrGxzmLMht7qn04
 hwCyO3Hzt2ruEpZEzwjjG5TqM57jCt7NS/wTLq9A4i30flu1luxSTT3gmO7ssNsvS2
 Lb5pXFUz6XiBnwlYG8HhanlHIjmJFWfrePje/Dln8nbnfZZITOpG3X+Mc4VYGCgMtY
 LtRFBtuou9BEeShW+H/gLAcqTOk0FFSJQaVIa0Z6ohVZeUE9/L2qylX3UiuRgQ91sw
 bEWg/OKcbPZyTRB/9hC19ZqDyhbFiEikEPzuwYdJ2SVd4jtrfVeKeJap5nBj7dN4c4
 1MrJJzfkPtKTQ==
Date: Wed, 30 Jul 2025 12:32:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
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
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250730093215.GP402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
 <8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com>
 <20250729201351.GA82395@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729201351.GA82395@nvidia.com>
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

On Tue, Jul 29, 2025 at 05:13:51PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 29, 2025 at 08:44:21PM +0100, Robin Murphy wrote:
> 
> > In this case with just one single
> > contiguous mapping, it is clearly objectively worse to have to bounce in and
> > out of the IOMMU layer 3 separate times and store a dma_map_state,
> 
> The non-contiguous mappings are comming back, it was in earlier drafts
> of this. Regardless, the point is to show how to use the general API
> that we would want to bring into the DRM drivers that don't have
> contiguity even though VFIO is a bit special.

Yes, we will see comeback of DMA ranges in v2.

Thanks
