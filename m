Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJFWFmcAg2keggMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:16:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A367E3029
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51F510E54A;
	Wed,  4 Feb 2026 08:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C8gh/pKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5010E511;
 Wed,  4 Feb 2026 08:16:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 427AB60127;
 Wed,  4 Feb 2026 08:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C9FC4CEF7;
 Wed,  4 Feb 2026 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770192994;
 bh=WxXDZS2gldEUv9hekLIDTwnn7p4L/bRv9DrzbhJlydY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8gh/pKqW818z793jik11p+RF2eKWnDcp1gWr/jawmdvjsCileab1iXvIktQu5ed+
 a5etFyS7OvZ37MJ6nsVJNDLqEY8KXIl6crwOW6WukBc3/4pdvqOxbSikvU4DVweI8p
 +Ug/VnOlDi1yrmRFGPo7MYhqBTBH3VhlsOcrmTpk6Agpjgx0WdkEXD2ACy0FoqhGhC
 EzURj9FItdFt4arK3CPzaVxx5epO06ezuNSWSFgtCVRIGXZkFEFAr6m/zSCbixOPdY
 mze1siTSphF/Jt71N0OqCQS1vG5a2SGtDtP0qRsECfsTkGJMGH9grnUEkjBJ9VmoKW
 9WYJKyb0fY6jg==
Date: Wed, 4 Feb 2026 10:16:30 +0200
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
Message-ID: <20260204081630.GA6771@unreal>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260202160425.GO34749@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202160425.GO34749@unreal>
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
X-Rspamd-Queue-Id: 0A367E3029
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 06:04:25PM +0200, Leon Romanovsky wrote:
> On Sat, Jan 31, 2026 at 07:34:10AM +0200, Leon Romanovsky wrote:
> > Changelog:
> > v7:
> 
> <...>
> 
> > Leon Romanovsky (8):
> >       dma-buf: Rename .move_notify() callback to a clearer identifier
> >       dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings()
> >       dma-buf: Always build with DMABUF_MOVE_NOTIFY
> >       vfio: Wait for dma-buf invalidation to complete
> >       dma-buf: Make .invalidate_mapping() truly optional
> >       dma-buf: Add dma_buf_attach_revocable()
> >       vfio: Permit VFIO to work with pinned importers
> >       iommufd: Add dma_buf_pin()
> > 
> >  drivers/dma-buf/Kconfig                     | 12 -----
> >  drivers/dma-buf/dma-buf.c                   | 69 ++++++++++++++++++++-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 ++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
> >  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
> >  drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  7 ++-
> >  drivers/gpu/drm/xe/xe_bo.c                  |  2 +-
> >  drivers/gpu/drm/xe/xe_dma_buf.c             | 14 ++---
> >  drivers/infiniband/core/umem_dmabuf.c       | 13 -----
> >  drivers/infiniband/hw/mlx5/mr.c             |  2 +-
> >  drivers/iommu/iommufd/pages.c               | 11 +++-
> >  drivers/iommu/iommufd/selftest.c            |  2 +-
> >  drivers/vfio/pci/vfio_pci_dmabuf.c          | 80 ++++++++++++++++++++++-------
> >  include/linux/dma-buf.h                     | 17 +++---
> >  15 files changed, 153 insertions(+), 96 deletions(-)
> 
> Christian,
> 
> Given the ongoing discussion around patch v5, I'm a bit unclear on the
> current state. Is the series ready for merging, or do you need me to
> rework anything further?

Christian,

Let's not miss the merge window for work that is already ready.

Thanks

> 
> Thanks
> 
