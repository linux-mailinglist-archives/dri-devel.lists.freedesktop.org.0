Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F2D3A9D0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81210E452;
	Mon, 19 Jan 2026 13:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="scELuI2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAC610E451;
 Mon, 19 Jan 2026 13:02:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C5FC60127;
 Mon, 19 Jan 2026 13:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F21C116C6;
 Mon, 19 Jan 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827768;
 bh=cCxg8035viPJsz2XBq1ifbK2lrZlRG1OCR5jkwA4Q7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=scELuI2GW3wYYW2ZENuAuFSaCJYKTwxSRnj2LRAqiwezAEBgiUivhNWu7wR7lsvrp
 JMiPt96eHalhzJp6zdj/VOztYexbL9CNdValyZad3QIoRwUqy2SNCBXDS5ZUmr2r5B
 3Q2LYZFjRo+TpYc7rFstqRHfbtMAFjLvRsXdqreX7yo2gyOr+diw1+LoloRIJTcEFf
 H3YM1NaUjV02Jdtuy+J3LR9/YjENpaZ6LVp9bzMZphF9Lehv4mUuhwTkRGGGpb2kcJ
 Ej14CRJRVv6csc6KuHzgzAe+xhdGGLSRvHHCsaiwAmERVJ+yIM5atMLB3FZRNKxX/w
 fRLM6YcjAxsPA==
Date: Mon, 19 Jan 2026 15:02:44 +0200
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
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke
 semantics
Message-ID: <20260119130244.GN13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
 <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
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

On Mon, Jan 19, 2026 at 01:12:45PM +0100, Christian König wrote:
> On 1/18/26 13:08, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > DMABUF ->pin() interface is called when the DMABUF importer perform
> > its DMA mapping, so let's use this opportunity to check if DMABUF
> > exporter revoked its buffer or not.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index d4d0f7d08c53..af9c315ddf71 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -20,6 +20,20 @@ struct vfio_pci_dma_buf {
> >  	u8 revoked : 1;
> >  };
> >  
> > +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> > +{
> > +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> > +
> > +	dma_resv_assert_held(priv->dmabuf->resv);
> > +
> > +	return dma_buf_attachment_is_revoke(attachment) ? 0 : -EOPNOTSUPP;
> 
> It's probably better to do that check in vfio_pci_dma_buf_attach.

I assume you are proposing to add this check in both
vfio_pci_dma_buf_attach() and vfio_pci_dma_buf_pin(). Otherwise,
importers that lack .invalidate_mapping() will invoke dma_buf_pin()
and will not fail.

> 
> And BTW the function vfio_pci_dma_buf_move() seems to be broken:
> 
> void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> {
>         struct vfio_pci_dma_buf *priv;
>         struct vfio_pci_dma_buf *tmp;
> 
>         lockdep_assert_held_write(&vdev->memory_lock);
> 
>         list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>                 if (!get_file_active(&priv->dmabuf->file))
>                         continue;
> 
>                 if (priv->revoked != revoked) {
>                         dma_resv_lock(priv->dmabuf->resv, NULL);
>                         priv->revoked = revoked;
>                         dma_buf_move_notify(priv->dmabuf);
> 
> A dma_buf_move_notify() just triggers asynchronous invalidation of the mapping!
> 
> You need to use dma_resv_wait() to wait for that to finish.

We (VFIO and IOMMUFD) followed the same pattern used in  
amdgpu_bo_move_notify(), which also does not wait.

I'll add wait here.

Thanks

> 
>                         dma_resv_unlock(priv->dmabuf->resv);
>                 }
>                 fput(priv->dmabuf->file);
>         }
> }
> 
> Regards,
> Christian.
> 
> 
> > +}
> > +
> > +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> > +{
> > +	/* Do nothing */
> > +}
> > +
> >  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >  				   struct dma_buf_attachment *attachment)
> >  {
> > @@ -76,6 +90,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> >  }
> >  
> >  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> > +	.pin = vfio_pci_dma_buf_pin,
> > +	.unpin = vfio_pci_dma_buf_unpin,
> >  	.attach = vfio_pci_dma_buf_attach,
> >  	.map_dma_buf = vfio_pci_dma_buf_map,
> >  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> > 
> 
