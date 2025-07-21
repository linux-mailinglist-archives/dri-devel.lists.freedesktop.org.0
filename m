Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC9B0BCF9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 08:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE210E482;
	Mon, 21 Jul 2025 06:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hXfMo9FY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C100910E478;
 Mon, 21 Jul 2025 06:49:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 273A7A527F6;
 Mon, 21 Jul 2025 06:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A71C4CEF4;
 Mon, 21 Jul 2025 06:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753080550;
 bh=R4gstohCCiEcB83QHp4vePC6Vl/FRbG01v8oYCtIJb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hXfMo9FYah+I/klWyq3E4MM8uAEW+sVZ6ODTWsq5JUGj0H3aocK/YvbN4TFt88Hvo
 Rn06q7poo3PqWnBummfdHCv3BPx6GuFba9cIihgDNPzUzVyMGM+iS0hPLeAsvnHP3l
 U16vKWM2EvhSN9ENkKqsKLL6P+hah8+TgBzcVXJobxUE7ZVqOKbmm4hm0TXfKYNChx
 SSFWMkt4DOwbPfkKpjrcSjqtEzEmHFxNyFpppZlLc8Cu6Ru5oSdrYYLOQST7PAChe3
 CoqaxGFV0y1PwQZKEVuQqLnMxUFjEdPhV9/PxlWmOLfWgwSQKGbvScbg47BtI5mlQ2
 IcE2ZN/gKY35Q==
Date: Mon, 21 Jul 2025 09:49:04 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] *** GPU Direct RDMA (P2P DMA) for Device Private
 Pages ***
Message-ID: <20250721064904.GK402218@unreal>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250720103003.GH402218@unreal>
 <35ff6080-9cb8-43cf-b77a-9ef3afd2ae59@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35ff6080-9cb8-43cf-b77a-9ef3afd2ae59@nvidia.com>
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

On Mon, Jul 21, 2025 at 12:03:51AM +0300, Yonatan Maman wrote:
> 
> 
> On 20/07/2025 13:30, Leon Romanovsky wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, Jul 18, 2025 at 02:51:07PM +0300, Yonatan Maman wrote:
> > > From: Yonatan Maman <Ymaman@Nvidia.com>
> > > 
> > > This patch series aims to enable Peer-to-Peer (P2P) DMA access in
> > > GPU-centric applications that utilize RDMA and private device pages. This
> > > enhancement reduces data transfer overhead by allowing the GPU to directly
> > > expose device private page data to devices such as NICs, eliminating the
> > > need to traverse system RAM, which is the native method for exposing
> > > device private page data.
> > > 
> > > To fully support Peer-to-Peer for device private pages, the following
> > > changes are proposed:
> > > 
> > > `Memory Management (MM)`
> > >   * Leverage struct pagemap_ops to support P2P page operations: This
> > > modification ensures that the GPU can directly map device private pages
> > > for P2P DMA.
> > >   * Utilize hmm_range_fault to support P2P connections for device private
> > > pages (instead of Page fault)
> > > 
> > > `IB Drivers`
> > > Add TRY_P2P_REQ flag for the hmm_range_fault call: This flag indicates the
> > > need for P2P mapping, enabling IB drivers to efficiently handle P2P DMA
> > > requests.
> > > 
> > > `Nouveau driver`
> > > Add support for the Nouveau p2p_page callback function: This update
> > > integrates P2P DMA support into the Nouveau driver, allowing it to handle
> > > P2P page operations seamlessly.
> > > 
> > > `MLX5 Driver`
> > > Utilize NIC Address Translation Service (ATS) for ODP memory, to optimize
> > > DMA P2P for private device pages. Also, when P2P DMA mapping fails due to
> > > inaccessible bridges, the system falls back to standard DMA, which uses host
> > > memory, for the affected PFNs
> > 
> > I'm probably missing something very important, but why can't you always
> > perform p2p if two devices support it? It is strange that IB and not HMM
> > has a fallback mode.
> > 
> > Thanks
> > 
> 
> P2P mapping can fail even when both devices support it, due to PCIe bridge
> limitations or IOMMU restrictions that block direct P2P access.

Yes, it is how p2p works. The decision "if p2p is supported or not" is
calculated by pci_p2pdma_map_type(). That function needs to get which two
devices will be connected.

In proposed HMM_PFN_ALLOW_P2P flag, you don't provide device information
and for the system with more than 2 p2p devices, you will get completely
random result.


> The fallback is in IB rather than HMM because HMM only manages memory pages - it doesn't
> do DMA mapping. The IB driver does the actual DMA operations, so it knows
> when P2P mapping fails and can fall back to copying through system memory.

The thing is that in proposed patch, IB doesn't check that p2p is
established with right device.
https://lore.kernel.org/all/20250718115112.3881129-5-ymaman@nvidia.com/

> In fact, hmm_range_fault doesn't have information about the destination
> device that will perform the DMA mapping.

So probably you need to teach HMM to perform page_faults on specific device.

Thansk

> > > 
> > > Previous version:
> > > https://lore.kernel.org/linux-mm/20241201103659.420677-1-ymaman@nvidia.com/
> > > https://lore.kernel.org/linux-mm/20241015152348.3055360-1-ymaman@nvidia.com/
> > > 
> > > Yonatan Maman (5):
> > >    mm/hmm: HMM API to enable P2P DMA for device private pages
> > >    nouveau/dmem: HMM P2P DMA for private dev pages
> > >    IB/core: P2P DMA for device private pages
> > >    RDMA/mlx5: Enable P2P DMA with fallback mechanism
> > >    RDMA/mlx5: Enabling ATS for ODP memory
> > > 
> > >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
> > >   drivers/infiniband/core/umem_odp.c     |   4 +
> > >   drivers/infiniband/hw/mlx5/mlx5_ib.h   |   6 +-
> > >   drivers/infiniband/hw/mlx5/odp.c       |  24 +++++-
> > >   include/linux/hmm.h                    |   3 +-
> > >   include/linux/memremap.h               |   8 ++
> > >   mm/hmm.c                               |  57 ++++++++++---
> > >   7 files changed, 195 insertions(+), 17 deletions(-)
> > > 
> > > --
> > > 2.34.1
> > > 
> 
> 
> 
