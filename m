Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB5CJPmYcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:14:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D0542A2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6210E71B;
	Wed, 21 Jan 2026 09:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hFx5mfJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718510E22C;
 Wed, 21 Jan 2026 09:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 04BF641A65;
 Wed, 21 Jan 2026 09:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C475C116D0;
 Wed, 21 Jan 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768986867;
 bh=lkxSsg325o6Y+SdMNgqIjpVEFcBa4/ALLRUPgSh2DSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hFx5mfJfrvbZ1IbosMhxQ9ll+jp2S67M4l88fKAHfoK1pU2zC/d4iFNMP0wl+3Dn3
 b9Qf/kr9pBcANjcA7m2St0p7poT6TCmVjJt4ojtfqyPeefTsFFN9M/DK1kJ3aHij+v
 oGzDTHYv1dFlArm/REbTBeBeSbOMbD8cQymlnTKzNY+yz5cj5BrBcRs+34/mavmVUL
 /bf49KY9oabpHoj1MXKY3BK6GK44fF8YbS4P8bDesv2egQYUaIQlJ6xwZb0QwYBrUf
 qrPPc3Z6O4+3sBXl/V4VnIxhgzxJ0eefehaK1FwfyXZPrdb6NshWB6LYjaYfv3GA3Y
 PlHRAtfN6IyPg==
Date: Wed, 21 Jan 2026 11:14:23 +0200
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
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
Message-ID: <20260121091423.GY13201@unreal>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
 <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: EC2D0542A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 09:59:59AM +0100, Christian König wrote:
> On 1/20/26 15:07, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > The .invalidate_mapping() callback is documented as optional, yet it
> > effectively became mandatory whenever importer_ops were provided. This
> > led to cases where RDMA non-ODP code had to supply an empty stub just to
> > provide allow_peer2peer.
> > 
> > Document this behavior by creating a dedicated export for the
> > dma_buf_unsupported_invalidate_mappings() function. This function is
> > intended solely for the RDMA non-ODP case and must not be used by any
> > other dma-buf importer.
> > 
> > This makes it possible to rely on a valid .invalidate_mappings()
> > callback to determine whether an importer supports revocation.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/dma-buf/dma-buf.c             | 14 ++++++++++++++
> >  drivers/infiniband/core/umem_dmabuf.c | 11 +----------
> >  include/linux/dma-buf.h               |  4 +++-
> >  3 files changed, 18 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index cd3b60ce4863..c4fa35034b92 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1238,6 +1238,20 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> >  }
> >  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
> >  
> > +/*
> > + * This function shouldn't be used by anyone except RDMA non-ODP case.
> > + * The reason to it is UAPI mistake where dma-buf was exported to the
> > + * userspace without knowing that .invalidate_mappings() can be called
> > + * for pinned memory too.
> > + *
> > + * This warning shouldn't be seen in real production scenario.
> > + */
> > +void dma_buf_unsupported_invalidate_mappings(struct dma_buf_attachment *attach)
> > +{
> > +	pr_warn("Invalidate callback should not be called when memory is pinned\n");
> > +}
> > +EXPORT_SYMBOL_FOR_MODULES(dma_buf_unsupported_invalidate_mappings, "ib_uverbs");
> > +
> 
> Well that is exactly the opposite of what I had in mind.
> 
> The RDMA non-ODP case should explicitly not provide an invalidate_mappings callback, but only the dma_buf_attach_ops with allow_peer2peer set to true.
> 
> This is done to explicitly note that RDMA non-ODP can't do invalidation's.

We want to achieve two goals:
1. Provide a meaningful warning to developers, rather than failing later
   because dma_buf_move_notify() was called on this problematic imported dma-buf.
2. Require all users to supply a valid .invalidate_mapping().

If I allow empty .invalidate_mapping(), this check will go too:
   932 struct dma_buf_attachment *
   933 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
   934                        const struct dma_buf_attach_ops *importer_ops,
   935                        void *importer_priv)
...
   943         if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
   944                 return ERR_PTR(-EINVAL);

And it is important part of dma-buf.

Thanks
