Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDXcMFyqfGkaOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:55:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587EBAC3D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBD610E9D9;
	Fri, 30 Jan 2026 12:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WJzfef1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1266710E9D5;
 Fri, 30 Jan 2026 12:55:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E21C46001A;
 Fri, 30 Jan 2026 12:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03C8C4CEF7;
 Fri, 30 Jan 2026 12:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769777750;
 bh=TRVxNgALhdVq3UF72R4/tO5tMWCJQNOfxrwhinpqw5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJzfef1mFWJvqqhgoKwPzjVYx5BqBw33sBFl2eKDp/Pfvj7OIsA58ekqM8jdY3BK0
 73Zf1ip4BeZTomQHhEjAraKiVgniCQCWfXnfLxvj9a/O/9oU8Z9NkWoMKtCCTYeCFF
 p2oXro+vc40lycbeKRa73+LghlplIp7Ams11CYwswNZzSY/7PwnmIoPtYvMVs9gpe8
 yx38R1aQxwUojvoiPQaCUXtWo6l8WJdKvIUidBM6L71DxpGdbxjw95NVRiDXP8aj08
 Scro6rXSvN7lLNXRce64nJxQhqvN5iJEhuGUtC+eZIxMtOGr27eOhNa4t+m02fVjfH
 M/lOMNd6BTANA==
Date: Fri, 30 Jan 2026 14:55:45 +0200
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
Subject: Re: [PATCH v5 5/8] dma-buf: Make .invalidate_mapping() truly optional
Message-ID: <20260130125545.GN10992@unreal>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-5-f98fca917e96@nvidia.com>
 <3dec1de0-0e5b-4a47-b2cc-949edea16328@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dec1de0-0e5b-4a47-b2cc-949edea16328@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 3587EBAC3D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 09:30:05AM +0100, Christian König wrote:
> On 1/24/26 20:14, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > The .invalidate_mapping() callback is documented as optional, yet it
> > effectively became mandatory whenever importer_ops were provided. This
> > led to cases where RDMA non-ODP code had to supply an empty stub.
> > 
> > Relax the checks in the dma-buf core so the callback can be omitted,
> > allowing RDMA code to drop the unnecessary function.
> > 
> > Removing the stub allows the next patch to tell that RDMA does not support
> > .invalidate_mapping() by checking for a NULL op.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/dma-buf/dma-buf.c             |  6 ++----
> >  drivers/infiniband/core/umem_dmabuf.c | 13 -------------
> >  2 files changed, 2 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index cd68c1c0bfd7..1629312d364a 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -947,9 +947,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> >  	if (WARN_ON(!dmabuf || !dev))
> >  		return ERR_PTR(-EINVAL);
> >  
> > -	if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
> > -		return ERR_PTR(-EINVAL);
> > -
> >  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> >  	if (!attach)
> >  		return ERR_PTR(-ENOMEM);
> > @@ -1260,7 +1257,8 @@ void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
> >  	dma_resv_assert_held(dmabuf->resv);
> >  
> >  	list_for_each_entry(attach, &dmabuf->attachments, node)
> > -		if (attach->importer_ops)
> > +		if (attach->importer_ops &&
> > +		    attach->importer_ops->invalidate_mappings)
> >  			attach->importer_ops->invalidate_mappings(attach);
> >  }
> >  EXPORT_SYMBOL_NS_GPL(dma_buf_invalidate_mappings, "DMA_BUF");
> > diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> > index d77a739cfe7a..256e34c15e6b 100644
> > --- a/drivers/infiniband/core/umem_dmabuf.c
> > +++ b/drivers/infiniband/core/umem_dmabuf.c
> > @@ -129,9 +129,6 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
> >  	if (check_add_overflow(offset, (unsigned long)size, &end))
> >  		return ret;
> >  
> > -	if (unlikely(!ops || !ops->invalidate_mappings))
> 
> You should probably keep "if (unlikely(!ops)).." here.

The unlikely is useless in this path.

> 
> Apart from that the patch looks good to me.
> 
> Regards,
> Christian.
> 
> > -		return ret;
> > -
> >  	dmabuf = dma_buf_get(fd);
> >  	if (IS_ERR(dmabuf))
> >  		return ERR_CAST(dmabuf);
> > @@ -184,18 +181,8 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
> >  }
> >  EXPORT_SYMBOL(ib_umem_dmabuf_get);
> >  
> > -static void
> > -ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
> > -{
> > -	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > -
> > -	ibdev_warn_ratelimited(umem_dmabuf->umem.ibdev,
> > -			       "Invalidate callback should not be called when memory is pinned\n");
> > -}
> > -
> >  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
> >  	.allow_peer2peer = true,
> > -	.invalidate_mappings = ib_umem_dmabuf_unsupported_move_notify,
> >  };
> >  
> >  struct ib_umem_dmabuf *
> > 
> 
