Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E26BE6727
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F16710EB00;
	Fri, 17 Oct 2025 05:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpP2Mu5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88DB10EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:40:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D083A641DD;
 Fri, 17 Oct 2025 05:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD16DC4CEE7;
 Fri, 17 Oct 2025 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760679611;
 bh=QatSK3vs5GP8c8e8mP/n3Zh7cEbbQ3Zbp2cyGT+36CI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpP2Mu5B3aLEq2tithF2l4ekoWI7PQCF+VFS8MQGgHf4eBvOc+yXOj+6j3SF1JJGp
 pEWPTs1ub7jCDFoztpJusE1SvuXOPIOS3EDzNJKolsvP7ynn443SDWb6+4ru7KM3Ik
 4j+XYNWMaoFpTvU03u3ve6ByEq+Ss1Fm2ijL//zmgS/KjrczzYtQkY9DonD8sLZBjR
 wAsx5V7EeXmlXZROMgB5Yk8A5L2w8KdUAli094vKeMAxXL3wpcyYeEh7KW2U9dbVP1
 B/DzVQ/2C+MLErckpLFiu2Jq3uo28qrca2pT6QzZpBpkxmTwNhHCgEXgkTF1WRW82g
 apdepzvlnSlOA==
Date: Fri, 17 Oct 2025 08:40:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251017054007.GB6199@unreal>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251016235332.GA265079@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016235332.GA265079@nvidia.com>
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

On Thu, Oct 16, 2025 at 08:53:32PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> > +
> > +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> > +				   struct dma_buf_attachment *attachment)
> > +{
> > +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > +
> > +	if (!attachment->peer2peer)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (priv->revoked)
> > +		return -ENODEV;
> > +
> > +	switch (pci_p2pdma_map_type(priv->provider, attachment->dev)) {
> > +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> > +		break;
> > +	case PCI_P2PDMA_MAP_BUS_ADDR:
> > +		/*
> > +		 * There is no need in IOVA at all for this flow.
> > +		 * We rely on attachment->priv == NULL as a marker
> > +		 * for this mode.
> > +		 */
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
> > +	if (!attachment->priv)
> > +		return -ENOMEM;
> > +
> > +	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->size);
> 
> The lifetime of this isn't good..
> 
> > +	return 0;
> > +}
> > +
> > +static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
> > +				    struct dma_buf_attachment *attachment)
> > +{
> > +	kfree(attachment->priv);
> > +}
> 
> If the caller fails to call map then it leaks the iova.

I'm relying on dmabuf code and documentation:

   926 /**
   927  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
...   
   932  *
   933  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
   934  * must be cleaned up by calling dma_buf_detach().

Successful call to vfio_pci_dma_buf_attach() MUST be accompanied by call
to vfio_pci_dma_buf_detach(), so as far as dmabuf implementation follows
it, there is no leak.

> 
> > +static struct sg_table *
> > +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> > +		     enum dma_data_direction dir)
> > +{
> [..]
> 
> 
> > +err_unmap_dma:
> > +	if (!i || !state)
> > +		; /* Do nothing */
> > +	else if (dma_use_iova(state))
> > +		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
> > +				 attrs);
> 
> If we hit this error path then it is freed..
> 
> > +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> > +				   struct sg_table *sgt,
> > +				   enum dma_data_direction dir)
> > +{
> > +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> > +	struct dma_iova_state *state = attachment->priv;
> > +	unsigned long attrs = DMA_ATTR_MMIO;
> > +	struct scatterlist *sgl;
> > +	int i;
> > +
> > +	if (!state)
> > +		; /* Do nothing */
> > +	else if (dma_use_iova(state))
> > +		dma_iova_destroy(attachment->dev, state, priv->size, dir,
> > +				 attrs);
> 
> It is freed here too, but we can call map multiple times. Every time a
> move_notify happens can trigger another call to map.
> 
> I think just call unlink in those two and put dma_iova_free in detach

Yes, it can work.

Thanks

> 
> Jason
