Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FtvFxbLgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:04:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B997CEA02
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9187710E51C;
	Mon,  2 Feb 2026 16:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f/aB5C6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48EF10E504;
 Mon,  2 Feb 2026 16:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B0F16600BB;
 Mon,  2 Feb 2026 16:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63C6C116C6;
 Mon,  2 Feb 2026 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770048272;
 bh=7imNtjuPs1te+Kisp0FjgtPNX3MVFkhCCfZGQjL0zdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/aB5C6XvMX7ySgFLbkB7nsbkNjnx01Vj3syyHczl0oLlRz9+pP1I+iCDjrW/iGE/
 O7AQHu69UN3T+TU5FuhDC1Gqg+whGbB6rUX5kvnaFYduFi4aQqmdZskSdFLIsH+yV/
 3WVLf9QxlXUBZ/YCuEJD7DKWz4xBbcsnh3zo8X8aT698GMC9lUyGwKC82KAXlXEAK+
 YSvnfx0cc6lZCbWhfI0bW1MJi2So9rZTK5TNjLGe78XaGFRLlFEPJTrTLXTdK+R0LO
 aJrihNOOGO4iUaVjnls8WcA2+TFWeUMSBuRwtDAFQoNTDAthUbI/n2zQR/DAnDLQwF
 kG55IL5/qUQWQ==
Date: Mon, 2 Feb 2026 18:04:25 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate
 shared buffers
Message-ID: <20260202160425.GO34749@unreal>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2B997CEA02
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 07:34:10AM +0200, Leon Romanovsky wrote:
> Changelog:
> v7:

<...>

> Leon Romanovsky (8):
>       dma-buf: Rename .move_notify() callback to a clearer identifier
>       dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings()
>       dma-buf: Always build with DMABUF_MOVE_NOTIFY
>       vfio: Wait for dma-buf invalidation to complete
>       dma-buf: Make .invalidate_mapping() truly optional
>       dma-buf: Add dma_buf_attach_revocable()
>       vfio: Permit VFIO to work with pinned importers
>       iommufd: Add dma_buf_pin()
> 
>  drivers/dma-buf/Kconfig                     | 12 -----
>  drivers/dma-buf/dma-buf.c                   | 69 ++++++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  7 ++-
>  drivers/gpu/drm/xe/xe_bo.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c             | 14 ++---
>  drivers/infiniband/core/umem_dmabuf.c       | 13 -----
>  drivers/infiniband/hw/mlx5/mr.c             |  2 +-
>  drivers/iommu/iommufd/pages.c               | 11 +++-
>  drivers/iommu/iommufd/selftest.c            |  2 +-
>  drivers/vfio/pci/vfio_pci_dmabuf.c          | 80 ++++++++++++++++++++++-------
>  include/linux/dma-buf.h                     | 17 +++---
>  15 files changed, 153 insertions(+), 96 deletions(-)

Christian,

Given the ongoing discussion around patch v5, I'm a bit unclear on the
current state. Is the series ready for merging, or do you need me to
rework anything further?

Thanks
