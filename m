Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC53B102DC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA26E10E8C0;
	Thu, 24 Jul 2025 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VOsjIIeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6110E8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:07:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA08B439A2;
 Thu, 24 Jul 2025 08:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0172DC4CEF1;
 Thu, 24 Jul 2025 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753344471;
 bh=1SX+zcqB99cjjB9BCfDjf9tPWG4xWING89rNVeEpf+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VOsjIIeIH9Rm+A+TaQ0V7RH51KmQgYil3OHypDB1K75Vw6Q633ZWqyufs6mpXmjgy
 8LsZTfLRMqu8Q3aUECPmaK6fz118qRgZxsQo52X8A22JJasuxKIhK8eiezk8hp9SAc
 jHnyZT944fThfEGK02iapsKBQc2GMyceVPsI5Ej6hFz/7GB9hjU2rY3MhXnDmg0Af3
 EmVL68MOlWu5/WtcynPwwwXn3gv5bFT1ONKBqH4E10CypSHNangIwHPWApThEuqWtj
 gZXy/mzxhxENu2F+hWSPwgeJkrW8aD7ChboSZ9kiIUCIRjgkp5GFEhH5TMyS7SGjaO
 J/E2lr1sMS9Pg==
Date: Thu, 24 Jul 2025 11:07:47 +0300
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
Message-ID: <20250724080747.GS402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de> <20250724075533.GR402218@unreal>
 <20250724075922.GD30590@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724075922.GD30590@lst.de>
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

On Thu, Jul 24, 2025 at 09:59:22AM +0200, Christoph Hellwig wrote:
> On Thu, Jul 24, 2025 at 10:55:33AM +0300, Leon Romanovsky wrote:
> > Please, see last patch in the series https://lore.kernel.org/all/aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com
> > It gives me a way to call p2p code with stable pointer for whole BAR.
> > 
> 
> That simply can't work.  So I guess you're trying to do the same stupid
> things shut down before again?  I might as well not waste my time
> reviewing this.

I'm not aware of anything that is not acceptable in this series.

This series focused on replacing dma_map_resource() call from v3
https://lore.kernel.org/all/20250307052248.405803-4-vivek.kasireddy@intel.com/
to proper API.

   92         if (!state) { 
   93                 addr = pci_p2pdma_bus_addr_map(provider, phys_vec->paddr); 
   94         } else if (dma_use_iova(state)) {                                 
   95                 ret = dma_iova_link(attachment->dev, state, phys_vec->paddr, 0,
   96                                     phys_vec->len, dir, DMA_ATTR_SKIP_CPU_SYNC); 
   97                 if (ret)                                                        
   98                         goto err_free_table;                                   
   99                                                                               
  100                 ret = dma_iova_sync(attachment->dev, state, 0, phys_vec->len);
  101                 if (ret)                                                     
  102                         goto err_unmap_dma;                                 
  103                                                                            
  104                 addr = state->addr;                                       
  105         } else {                                                         
  106                 addr = dma_map_phys(attachment->dev, phys_vec->paddr,   
  107                                     phys_vec->len, dir, DMA_ATTR_SKIP_CPU_SYNC);
  108                 ret = dma_mapping_error(attachment->dev, addr);                
  109                 if (ret)                                                      
  110                         goto err_free_table;                                 
  111         }            

Thanks

> 
> 
