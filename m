Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OFZEAencGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:14:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AF55072
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531210E73A;
	Wed, 21 Jan 2026 10:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N5mnHwlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1541410E72F;
 Wed, 21 Jan 2026 10:14:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DABD4408DC;
 Wed, 21 Jan 2026 10:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DD7C19422;
 Wed, 21 Jan 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768990466;
 bh=Tfo/OWueoKu8rex7Tl9fDhj3HYw8PFEJM2EofHNagw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5mnHwlZ4VBOzCaF2qAu+DjTaYQWAFbky4+JT2mBLPGjrNKxQ+fM9k9d6IllOUceW
 j1tAd0RJdJnA6QxkAhArkPbFRodriKbgtOU4tbyG0Ur1/cdjnP09GyrxTAfwHP4xnP
 X2So8WSV2cSYLZ1AZt0vyY20Gne5NDjhKQIqOjY28If9yXQcsOj1ST1qi7+CzWJcpx
 Bps75wKKBhcc5ddkolv1NkPvv+0fB5Nv0q0I8EgTvOodoH6D+g2E7dAFxYKe7BHlLR
 hPLlN+CWPcGoGBCvh/VKV743I73C6D0fJrJ2uaTEJdSDWeaB+0vclUS32VmzRQQIbg
 QHhoM3gbQHIKg==
Date: Wed, 21 Jan 2026 12:14:21 +0200
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
Subject: Re: [PATCH v3 2/7] dma-buf: Always build with DMABUF_MOVE_NOTIFY
Message-ID: <20260121101421.GZ13201@unreal>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-2-b7e0b07b8214@nvidia.com>
 <24c7a7e6-b1bd-4407-b62d-4d9ea4cdeee4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24c7a7e6-b1bd-4407-b62d-4d9ea4cdeee4@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: A02AF55072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 09:55:38AM +0100, Christian König wrote:
> On 1/20/26 15:07, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
> > experimental and disabled by default ever since. Six years later,
> > all new importers implement this callback.
> > 
> > It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
> > always build DMABUF with support for it enabled.
> > 
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/dma-buf/Kconfig                     | 12 ------------
> >  drivers/dma-buf/dma-buf.c                   | 12 ++----------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 10 +++-------
> >  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  3 +--
> >  drivers/gpu/drm/xe/xe_dma_buf.c             | 12 ++++--------
> >  6 files changed, 11 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index b46eb8a552d7..84d5e9b24e20 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -40,18 +40,6 @@ config UDMABUF
> >  	  A driver to let userspace turn memfd regions into dma-bufs.
> >  	  Qemu can use this to create host dmabufs for guest framebuffers.
> >  
> > -config DMABUF_MOVE_NOTIFY
> > -	bool "Move notify between drivers (EXPERIMENTAL)"
> > -	default n
> > -	depends on DMA_SHARED_BUFFER
> > -	help
> > -	  Don't pin buffers if the dynamic DMA-buf interface is available on
> > -	  both the exporter as well as the importer. This fixes a security
> > -	  problem where userspace is able to pin unrestricted amounts of memory
> > -	  through DMA-buf.
> > -	  This is marked experimental because we don't yet have a consistent
> > -	  execution context and memory management between drivers.
> > -
> >  config DMABUF_DEBUG
> >  	bool "DMA-BUF debug checks"
> >  	depends on DMA_SHARED_BUFFER
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 59cc647bf40e..cd3b60ce4863 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -837,18 +837,10 @@ static void mangle_sg_table(struct sg_table *sg_table)
> >  
> >  }
> >  
> > -static inline bool
> > -dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> 
> I would rather like to keep the wrapper and even add some explanation what it means when true is returned.

We have different opinion here. I don't like single line functions which
are called only twice. I'll keep this function to ensure progress the
series.

Thanks

> 
> Apart from that looks good to me.
> 
> Regards,
> Christian.
