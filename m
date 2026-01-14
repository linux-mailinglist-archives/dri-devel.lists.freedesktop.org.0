Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B75D1EB10
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268310E58C;
	Wed, 14 Jan 2026 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VtHY2A2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240E10E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:18:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B27CA43C65;
 Wed, 14 Jan 2026 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3159C16AAE;
 Wed, 14 Jan 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768393102;
 bh=kphkpO43U3xs8Hu/vDSQXNFGwyRGtpggdrrNZNCgHek=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=VtHY2A2PoHXvJAI3LMSsL+HyLEeHCtSGgKPp6a+dXtGF+CLsybGNKbmvKBUBWia3N
 WzDOaC8LZwddJrTiwDuAvztJ2Cj6lbzW1QhIsPa2Yj7gshUYGiE+UnyC+TOrtdMm/g
 w1z2AAwKhhUC2jnihuALXEURtgZdp20+biBdG4c3/EUMr7V2orcFxiAsimeIxtOnKS
 fLsmHd7cMnVsC8ycZcOC8GfU+l75TBXsIJOO7clPXSbuJAuxBDrzz2EjRR1ts6eoAt
 WlTQrxGaNTudz8vRy+m7KhkdV2QM6ewUI891wPgHouxLWeGmg1Hv3j8OlX/YjyDn48
 v0y4wibp7fC8w==
Date: Wed, 14 Jan 2026 14:18:19 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 kvm@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: types: reuse common =?utf-8?Q?phys=5Fv?=
 =?utf-8?Q?ec_type_instead_of_DMABUF_open=E2=80=91coded?= variant
Message-ID: <20260114121819.GB10680@unreal>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
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

On Wed, Jan 07, 2026 at 11:14:14AM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After commit fcf463b92a08 ("types: move phys_vec definition to common header"),
> we can use the shared phys_vec type instead of the DMABUF‑specific
> dma_buf_phys_vec, which duplicated the same structure and semantics.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
> Alex,
> 
> According to diffstat, VFIO is the subsystem with the largest set of changes,
> so it would be great if you could take it through your tree.
> 
> The series is based on the for-7.0/blk-pvec shared branch from Jens:
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.0/blk-pvec
> 
> Thanks
> ---

Alex,

Could you please move this patch forward? We have the RDMA series [1] that
depends on this rename, and I would like to base it on the shared branch.

[1] https://lore.kernel.org/all/20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com/

Thanks
