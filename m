Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB8D3A2DF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F157E10E3AA;
	Mon, 19 Jan 2026 09:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCUcN4om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40210E3CC;
 Mon, 19 Jan 2026 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768814840; x=1800350840;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1LWdKy0wxcp3AbNhZv5YgZA5HhjEKmlwhhAIxDXEKnI=;
 b=lCUcN4omlnVLN9ToWQL+8Os53D1o+igys0Zvkj+AmwYNh3yNMpzITGQ9
 LKVVm536jQWElFYBWjbDRfuTyXh8OGHIuiEU4bfBL6AEgip3PsMOtekuC
 UgkHnxyiVSuOIpqeUBcCsxK9d5CPOjflvWtNcls+sM3quly4iT2X1QmXD
 +Uj3JsByIjomPs5SNQnPZjQmmNNb9N4sdMNQmASFP0ncAl+HjbB6R/vXS
 9iX11OmRwFl2xgdnPcKoWGJNm3gXpMRhePV3RghoSVq8E/DzsF6o8DxVS
 CpVh4kTALyT5kciHzRfGdvTeWBvfCg85VGKs26DYKE4dLnnbLhnKByW2B A==;
X-CSE-ConnectionGUID: +u7F0y4nSiaGHF8yBkiesA==
X-CSE-MsgGUID: igF9WvVUThu3fpKA7bQLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69223451"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69223451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:27:19 -0800
X-CSE-ConnectionGUID: wVDcltDLQGSQ0FDWpueWJw==
X-CSE-MsgGUID: rdbnuLpiR2SkFhlwu7xzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210835738"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.32])
 ([10.245.244.32])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:27:11 -0800
Message-ID: <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,  Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu	 <olvaffe@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi	 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Alex Williamson <alex@shazbot.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 iommu@lists.linux.dev, kvm@vger.kernel.org
Date: Mon, 19 Jan 2026 10:27:00 +0100
In-Reply-To: <20260119075229.GE13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
 <20260119075229.GE13201@unreal>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Mon, 2026-01-19 at 09:52 +0200, Leon Romanovsky wrote:
> On Sun, Jan 18, 2026 at 03:16:25PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Hi, Leon,
> >=20
> > On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
> > > Changelog:
> > > v2:
> > > =C2=A0* Changed series to document the revoke semantics instead of
> > > =C2=A0=C2=A0 implementing it.
> > > v1:
> > > https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvi=
dia.com
> > >=20
> > > -----------------------------------------------------------------
> > > ----
> > > ----
> > > This series documents a dma-buf =E2=80=9Crevoke=E2=80=9D mechanism: t=
o allow a
> > > dma-
> > > buf
> > > exporter to explicitly invalidate (=E2=80=9Ckill=E2=80=9D) a shared b=
uffer after
> > > it
> > > has
> > > been distributed to importers, so that further CPU and device
> > > access
> > > is
> > > prevented and importers reliably observe failure.
> > >=20
> > > The change in this series is to properly document and use
> > > existing
> > > core
> > > =E2=80=9Crevoked=E2=80=9D state on the dma-buf object and a correspon=
ding
> > > exporter-
> > > triggered
> > > revoke operation. Once a dma-buf is revoked, new access paths are
> > > blocked so
> > > that attempts to DMA-map, vmap, or mmap the buffer fail in a
> > > consistent way.
> >=20
> > This sounds like it does not match how many GPU-drivers use the
> > move_notify() callback.
>=20
> No change for them.
>=20
> >=20
> > move_notify() would typically invalidate any device maps and any
> > asynchronous part of that invalidation would be complete when the
> > dma-
> > buf's reservation object becomes idle WRT DMA_RESV_USAGE_BOOKKEEP
> > fences.
>=20
> This part has not changed and remains the same for the revocation
> flow as well.
>=20
> >=20
> > However, the importer could, after obtaining the resv lock, obtain
> > a
> > new map using dma_buf_map_attachment(), and I'd assume the CPU maps
> > work in the same way, I.E. move_notify() does not *permanently*
> > revoke
> > importer access.
>=20
> This part diverges by design and is documented to match revoke
> semantics.=C2=A0=20
> It defines what must occur after the exporter requests that the
> buffer be=C2=A0=20
> "killed". An importer that follows revoke semantics will not attempt
> to call=C2=A0=20
> dma_buf_map_attachment(), and the exporter will block any remapping
> attempts=C2=A0=20
> regardless. See the priv->revoked flag in the VFIO exporter.
>=20
> In addition, in this email thread, Christian explains that revoke
> semantics already exists, with the combination of dma_buf_pin and
> dma_buf_move_notify, just not documented:
> https://lore.kernel.org/all/f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com/


Hmm,

Considering=20

https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/infiniband/core/u=
mem_dmabuf.c#L192

this sounds like it's not just undocumented but also in some cases
unimplemented. The xe driver for one doesn't expect move_notify() to be
called on pinned buffers, so if that is indeed going to be part of the
dma-buf protocol,  wouldn't support for that need to be advertised by
the importer?

Thanks,
Thomas

>=20
> Thanks
>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > Thanks
> > >=20
> > > Cc: linux-media@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: virtualization@lists.linux.dev
> > > Cc: intel-xe@lists.freedesktop.org
> > > Cc: linux-rdma@vger.kernel.org
> > > Cc: iommu@lists.linux.dev
> > > Cc: kvm@vger.kernel.org
> > > To: Sumit Semwal <sumit.semwal@linaro.org>
> > > To: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > To: Alex Deucher <alexander.deucher@amd.com>
> > > To: David Airlie <airlied@gmail.com>
> > > To: Simona Vetter <simona@ffwll.ch>
> > > To: Gerd Hoffmann <kraxel@redhat.com>
> > > To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > > To: Gurchetan Singh <gurchetansingh@chromium.org>
> > > To: Chia-I Wu <olvaffe@gmail.com>
> > > To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > To: Maxime Ripard <mripard@kernel.org>
> > > To: Thomas Zimmermann <tzimmermann@suse.de>
> > > To: Lucas De Marchi <lucas.demarchi@intel.com>
> > > To: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > To: Jason Gunthorpe <jgg@ziepe.ca>
> > > To: Leon Romanovsky <leon@kernel.org>
> > > To: Kevin Tian <kevin.tian@intel.com>
> > > To: Joerg Roedel <joro@8bytes.org>
> > > To: Will Deacon <will@kernel.org>
> > > To: Robin Murphy <robin.murphy@arm.com>
> > > To: Alex Williamson <alex@shazbot.org>
> > >=20
> > > ---
> > > Leon Romanovsky (4):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-buf: Rename .move_notify() callbac=
k to a clearer
> > > identifier
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-buf: Document revoke semantics
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommufd: Require DMABUF revoke semanti=
cs
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfio: Add pinned interface to perform =
revoke semantics
> > >=20
> > > =C2=A0drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +++---
> > > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |=C2=A0 4 ++--
> > > =C2=A0drivers/gpu/drm/virtio/virtgpu_prime.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/xe/tests/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 +++---
> > > =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/infiniband/core/umem_dmabuf.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++--
> > > =C2=A0drivers/infiniband/hw/mlx5/mr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0drivers/iommu/iommufd/pages.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++--
> > > =C2=A0drivers/vfio/pci/vfio_pci_dmabuf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16
> > > ++++++++++++++++
> > > =C2=A0include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 25
> > > ++++++++++++++++++++++---
> > > =C2=A010 files changed, 60 insertions(+), 18 deletions(-)
> > > ---
> > > base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> > > change-id: 20251221-dmabuf-revoke-b90ef16e4236
> > >=20
> > > Best regards,
> > > --=C2=A0=20
> > > Leon Romanovsky <leonro@nvidia.com>
> > >=20
> >=20

