Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD0D3A0A0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3910E387;
	Mon, 19 Jan 2026 07:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VL41eV1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5F210E158;
 Mon, 19 Jan 2026 07:52:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9503B60159;
 Mon, 19 Jan 2026 07:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EE5C19424;
 Mon, 19 Jan 2026 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768809154;
 bh=FgccbxSW4ALrowfCLmsRR/Zu7j7Ob42C2Xqwm3A13m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VL41eV1F4pT4aqEBXrqmgMj8ay967tZwnXgdE3sr95zj66Szyt/gEQZ9ZHC1/ZCoI
 zHdHVoh19kPdrpptXHDlZLHPfMWdCRNwsBdwJ7VBIbjsDDrXymv7wyQjLraR/owc8z
 evQ3EyRQBsTDbPFCBP+u0no9EvPNSeIC1y3//MY6sa/XWAJj/UJTznEsT5zeykc+UM
 MOLIbXeG3taFetfPJqqhIWgSSkBbREOAi0MKLUbM9986sLho/+clz8Gf3zrknd4884
 dnnSFY+E5761ocKkG9RiPkmSgCPvhyyXYSXwcxbhpYQalj7/p76ack/evO/E3Y0LdM
 pnmfKlRF+LN7g==
Date: Mon, 19 Jan 2026 09:52:29 +0200
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
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
Message-ID: <20260119075229.GE13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
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

On Sun, Jan 18, 2026 at 03:16:25PM +0100, Thomas Hellström wrote:
> Hi, Leon,
> 
> On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
> > Changelog:
> > v2:
> >  * Changed series to document the revoke semantics instead of
> >    implementing it.
> > v1:
> > https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com
> > 
> > ---------------------------------------------------------------------
> > ----
> > This series documents a dma-buf “revoke” mechanism: to allow a dma-
> > buf
> > exporter to explicitly invalidate (“kill”) a shared buffer after it
> > has
> > been distributed to importers, so that further CPU and device access
> > is
> > prevented and importers reliably observe failure.
> > 
> > The change in this series is to properly document and use existing
> > core
> > “revoked” state on the dma-buf object and a corresponding exporter-
> > triggered
> > revoke operation. Once a dma-buf is revoked, new access paths are
> > blocked so
> > that attempts to DMA-map, vmap, or mmap the buffer fail in a
> > consistent way.
> 
> This sounds like it does not match how many GPU-drivers use the
> move_notify() callback.

No change for them.

> 
> move_notify() would typically invalidate any device maps and any
> asynchronous part of that invalidation would be complete when the dma-
> buf's reservation object becomes idle WRT DMA_RESV_USAGE_BOOKKEEP
> fences.

This part has not changed and remains the same for the revocation flow as well.

> 
> However, the importer could, after obtaining the resv lock, obtain a
> new map using dma_buf_map_attachment(), and I'd assume the CPU maps
> work in the same way, I.E. move_notify() does not *permanently* revoke
> importer access.

This part diverges by design and is documented to match revoke semantics.  
It defines what must occur after the exporter requests that the buffer be  
"killed". An importer that follows revoke semantics will not attempt to call  
dma_buf_map_attachment(), and the exporter will block any remapping attempts  
regardless. See the priv->revoked flag in the VFIO exporter.

In addition, in this email thread, Christian explains that revoke
semantics already exists, with the combination of dma_buf_pin and
dma_buf_move_notify, just not documented:
https://lore.kernel.org/all/f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com/

Thanks

> 
> /Thomas
> 
> 
> > 
> > Thanks
> > 
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: virtualization@lists.linux.dev
> > Cc: intel-xe@lists.freedesktop.org
> > Cc: linux-rdma@vger.kernel.org
> > Cc: iommu@lists.linux.dev
> > Cc: kvm@vger.kernel.org
> > To: Sumit Semwal <sumit.semwal@linaro.org>
> > To: Christian König <christian.koenig@amd.com>
> > To: Alex Deucher <alexander.deucher@amd.com>
> > To: David Airlie <airlied@gmail.com>
> > To: Simona Vetter <simona@ffwll.ch>
> > To: Gerd Hoffmann <kraxel@redhat.com>
> > To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > To: Gurchetan Singh <gurchetansingh@chromium.org>
> > To: Chia-I Wu <olvaffe@gmail.com>
> > To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > To: Maxime Ripard <mripard@kernel.org>
> > To: Thomas Zimmermann <tzimmermann@suse.de>
> > To: Lucas De Marchi <lucas.demarchi@intel.com>
> > To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > To: Leon Romanovsky <leon@kernel.org>
> > To: Kevin Tian <kevin.tian@intel.com>
> > To: Joerg Roedel <joro@8bytes.org>
> > To: Will Deacon <will@kernel.org>
> > To: Robin Murphy <robin.murphy@arm.com>
> > To: Alex Williamson <alex@shazbot.org>
> > 
> > ---
> > Leon Romanovsky (4):
> >       dma-buf: Rename .move_notify() callback to a clearer identifier
> >       dma-buf: Document revoke semantics
> >       iommufd: Require DMABUF revoke semantics
> >       vfio: Add pinned interface to perform revoke semantics
> > 
> >  drivers/dma-buf/dma-buf.c                   |  6 +++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
> >  drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  6 +++---
> >  drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
> >  drivers/infiniband/core/umem_dmabuf.c       |  4 ++--
> >  drivers/infiniband/hw/mlx5/mr.c             |  2 +-
> >  drivers/iommu/iommufd/pages.c               | 11 +++++++++--
> >  drivers/vfio/pci/vfio_pci_dmabuf.c          | 16 ++++++++++++++++
> >  include/linux/dma-buf.h                     | 25
> > ++++++++++++++++++++++---
> >  10 files changed, 60 insertions(+), 18 deletions(-)
> > ---
> > base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> > change-id: 20251221-dmabuf-revoke-b90ef16e4236
> > 
> > Best regards,
> > --  
> > Leon Romanovsky <leonro@nvidia.com>
> > 
> 
