Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544EBB0B4E7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 12:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327DB10E1E9;
	Sun, 20 Jul 2025 10:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MFU0B/Ju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F710E1CD;
 Sun, 20 Jul 2025 10:30:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F5975C0C37;
 Sun, 20 Jul 2025 10:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C611BC4CEE7;
 Sun, 20 Jul 2025 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753007408;
 bh=J92ChcRnDttWm9ZMqpwKbQR0/39abVygpXfEDwM1XU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFU0B/JufihuasPZrquWC1GFzNqNRIWTymvqOvM+JUohH7UJtMwgY07U+OOEosiCS
 +sx76Fbp3KsfNU/7vYb22NP4keJGU8Ga1+o0HN1oYNr8xn27QNM0ZuneCOEqBINMJl
 QdYqf/Ngmtn9QBltRNeXxFGVG8/EeOPSaz2jKrfV7Ld7/AOEfDRQhniKT+hyDON73Q
 B8CoP6ZiOxBjXwbVS3jMoeo+nWg5/rLuyXsjUyKUl3J++Lu66U/VumCbEXeFK6h9rG
 nGgvHc27nkqlzL8lYqGvFDecUwPX+JrBwB2bHp82LeLAHmkWL1NVmIRS7KnVcaYFiv
 Rl+dwUvNcUO3Q==
Date: Sun, 20 Jul 2025 13:30:03 +0300
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
Message-ID: <20250720103003.GH402218@unreal>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
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

On Fri, Jul 18, 2025 at 02:51:07PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
> GPU-centric applications that utilize RDMA and private device pages. This
> enhancement reduces data transfer overhead by allowing the GPU to directly
> expose device private page data to devices such as NICs, eliminating the
> need to traverse system RAM, which is the native method for exposing
> device private page data.
> 
> To fully support Peer-to-Peer for device private pages, the following
> changes are proposed:
> 
> `Memory Management (MM)`
>  * Leverage struct pagemap_ops to support P2P page operations: This
> modification ensures that the GPU can directly map device private pages
> for P2P DMA.
>  * Utilize hmm_range_fault to support P2P connections for device private
> pages (instead of Page fault)
> 
> `IB Drivers`
> Add TRY_P2P_REQ flag for the hmm_range_fault call: This flag indicates the
> need for P2P mapping, enabling IB drivers to efficiently handle P2P DMA
> requests.
> 
> `Nouveau driver`
> Add support for the Nouveau p2p_page callback function: This update
> integrates P2P DMA support into the Nouveau driver, allowing it to handle
> P2P page operations seamlessly.
> 
> `MLX5 Driver`
> Utilize NIC Address Translation Service (ATS) for ODP memory, to optimize
> DMA P2P for private device pages. Also, when P2P DMA mapping fails due to
> inaccessible bridges, the system falls back to standard DMA, which uses host
> memory, for the affected PFNs

I'm probably missing something very important, but why can't you always
perform p2p if two devices support it? It is strange that IB and not HMM
has a fallback mode.

Thanks

> 
> Previous version:
> https://lore.kernel.org/linux-mm/20241201103659.420677-1-ymaman@nvidia.com/
> https://lore.kernel.org/linux-mm/20241015152348.3055360-1-ymaman@nvidia.com/
> 
> Yonatan Maman (5):
>   mm/hmm: HMM API to enable P2P DMA for device private pages
>   nouveau/dmem: HMM P2P DMA for private dev pages
>   IB/core: P2P DMA for device private pages
>   RDMA/mlx5: Enable P2P DMA with fallback mechanism
>   RDMA/mlx5: Enabling ATS for ODP memory
> 
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
>  drivers/infiniband/core/umem_odp.c     |   4 +
>  drivers/infiniband/hw/mlx5/mlx5_ib.h   |   6 +-
>  drivers/infiniband/hw/mlx5/odp.c       |  24 +++++-
>  include/linux/hmm.h                    |   3 +-
>  include/linux/memremap.h               |   8 ++
>  mm/hmm.c                               |  57 ++++++++++---
>  7 files changed, 195 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1
> 
