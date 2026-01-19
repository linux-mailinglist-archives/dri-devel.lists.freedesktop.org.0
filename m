Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570AD3A25C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C68410E3CE;
	Mon, 19 Jan 2026 09:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e33bUuuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A1710E3C5;
 Mon, 19 Jan 2026 09:04:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2140A44114;
 Mon, 19 Jan 2026 09:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B57CC116C6;
 Mon, 19 Jan 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768813486;
 bh=9ibwmwir6DNuwcFVFVRMrnxNeKv3ejBMBmArbCsPm6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e33bUuuFuYAfNmaAVBINTTMiHDitg3Ewo284Wv30/72Z5sl3bIG03XiqzmmtksV2N
 E9d2cJoHjdjKYaYooTlSPB4iJpWVL91L1AN491690/uRHfcmT6wUBbopZdfCbx77Px
 Q3HC1qDJGA9Pt3HYbxuqrUGdEozMHTi5LrmTjFyJYKE+R+M0iAaeaStvmIivkeGtTZ
 mxhJNSrhHrd2zaHDTg7GSf/GrHIQaeet8ghZgUq43q6WrWChlkPf5q6E/9m4Skchfc
 5l1Di/szMWkD2gAlw1okBT15wo+lo6dJX8Dgm6WcIx/IrIDWLVWHnzHUEXQ9299Wj5
 PA/zo+uxfkTlQ==
Date: Mon, 19 Jan 2026 11:04:40 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
Message-ID: <20260119090440.GG13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <8bc75706c18c410f9564805c487907aba0aab627.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bc75706c18c410f9564805c487907aba0aab627.camel@linux.intel.com>
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

On Sun, Jan 18, 2026 at 03:29:02PM +0100, Thomas Hellström wrote:
> On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Document a DMA-buf revoke mechanism that allows an exporter to
> > explicitly
> > invalidate ("kill") a shared buffer after it has been handed out to
> > importers. Once revoked, all further CPU and device access is
> > blocked, and
> > importers consistently observe failure.
> 
> See previous comment WRT this.
> 
> > 
> > This requires both importers and exporters to honor the revoke
> > contract.
> > 
> > For importers, this means implementing .invalidate_mappings() and
> > calling
> > dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s
> > support
> > for revocation.
> 
> Why would the importer want to verify the exporter's support for
> revocation? If the exporter doesn't support it, the only consequence
> would be that invalidate_mappings() would never be called, and that
> dma_buf_pin() is a NOP. Besides, dma_buf_pin() would not return an
> error if the exporter doesn't implement the pin() callback?

The idea is that both should do revoke and there is a need to indicate
that this exporter has some expectations from the importers. One of them
is that invalidate_mappings exists.

Thanks

> 
> Or perhaps I missed a prereq patch?
> 
> Thanks,
> Thomas
> 
> 
