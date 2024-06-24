Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50C914F9E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3272E10E45F;
	Mon, 24 Jun 2024 14:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i2yXp0bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38E310E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED40160C2B;
 Mon, 24 Jun 2024 14:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2433DC2BBFC;
 Mon, 24 Jun 2024 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719238303;
 bh=eyuAqIjSQOj/4tkmhD0aalItYE+pJ+NSsK6iiE2xzb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i2yXp0bsXfnJsY37B1TVOV1CiiNpoWJ6jeVeFcEi/69G9y5ChUJLJvuCuPXXquEpi
 VlaAhRYSpSztpqSMlrm7/56aCidWse1dvzNLYBYxBIFPLj4S7cg0xEBKJ2nkf2m+CY
 mH3CL6RASdYe5wKD7C1HovYx1TUAIQNQJXwhsDk8EBV/5IM/lBjP9VYnrdZfApGLoK
 pgF8x3b9RRHkmPIZFVpVxE90TckzJKuV340uQE7qChH1UxqCA6SiTT/2jTVLwSzhAX
 PjrHxIyaSdPNrNYnp5E8BONew5XkqE+akPsrcUJf8XtS/jkpAq1YZmVq2ubdcXeK5w
 KtFZA6qEjm/UA==
Date: Mon, 24 Jun 2024 17:11:39 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 3/3] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20240624141139.GH29266@unreal>
References: <20240624065552.1572580-1-vivek.kasireddy@intel.com>
 <20240624065552.1572580-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624065552.1572580-4-vivek.kasireddy@intel.com>
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

On Sun, Jun 23, 2024 at 11:53:11PM -0700, Vivek Kasireddy wrote:
> From Jason Gunthorpe:
> "dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
> 
> The patch design loosely follows the pattern in commit
> db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
> does not support pinning.
> 
> Instead, this implements what, in the past, we've called a revocable
> attachment using move. In normal situations the attachment is pinned, as a
> BAR does not change physical address. However when the VFIO device is
> closed, or a PCI reset is issued, access to the MMIO memory is revoked.
> 
> Revoked means that move occurs, but an attempt to immediately re-map the
> memory will fail. In the reset case a future move will be triggered when
> MMIO access returns. As both close and reset are under userspace control
> it is expected that userspace will suspend use of the dma-buf before doing
> these operations, the revoke is purely for kernel self-defense against a
> hostile userspace."
> 
> Following enhancements are made to the original patch:
> - Add support for creating dmabuf from multiple areas (or ranges)
> - Add a mmap handler to provide CPU access to the dmabuf
> 
> Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/vfio/pci/Makefile          |   1 +
>  drivers/vfio/pci/dma_buf.c         | 438 +++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_config.c |  22 +-
>  drivers/vfio/pci/vfio_pci_core.c   |  20 +-
>  drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
>  include/linux/vfio_pci_core.h      |   1 +
>  include/uapi/linux/vfio.h          |  25 ++
>  7 files changed, 525 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/vfio/pci/dma_buf.c

<...>

> +static int populate_sgt(struct dma_buf_attachment *attachment,
> +			enum dma_data_direction dir,
> +			struct sg_table *sgt, size_t sgl_size)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
> +	size_t offset, chunk_size;
> +	struct scatterlist *sgl;
> +	dma_addr_t dma_addr;
> +	phys_addr_t phys;
> +	int i, j, ret;
> +
> +	for_each_sgtable_sg(sgt, sgl, j)
> +		sgl->length = 0;
> +
> +	sgl = sgt->sgl;
> +	for (i = 0; i < priv->nr_ranges; i++) {
> +		phys = pci_resource_start(priv->vdev->pdev,
> +					  dma_ranges[i].region_index);
> +		phys += dma_ranges[i].offset;
> +
> +		/*
> +		 * Break the BAR's physical range up into max sized SGL's
> +		 * according to the device's requirement.
> +		 */
> +		for (offset = 0; offset != dma_ranges[i].length;) {
> +			chunk_size = min(dma_ranges[i].length - offset,
> +					 sgl_size);
> +
> +			/*
> +			 * Since the memory being mapped is a device memory
> +			 * it could never be in CPU caches.
> +			 */
> +			dma_addr = dma_map_resource(attachment->dev,
> +						    phys + offset,
> +						    chunk_size, dir,
> +						    DMA_ATTR_SKIP_CPU_SYNC);
> +			ret = dma_mapping_error(attachment->dev, dma_addr);
> +			if (ret)
> +				goto err;
> +
> +			sg_set_page(sgl, NULL, chunk_size, 0);
> +			sg_dma_address(sgl) = dma_addr;
> +			sg_dma_len(sgl) = chunk_size;
> +			sgl = sg_next(sgl);
> +			offset += chunk_size;
> +		}
> +	}
> +
> +	return 0;
> +err:
> +	for_each_sgtable_sg(sgt, sgl, j) {
> +		if (!sg_dma_len(sgl))
> +			continue;
> +
> +		dma_unmap_resource(attachment->dev, sg_dma_address(sgl),
> +				   sg_dma_len(sgl),
> +				   dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	}
> +
> +	return ret;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	size_t sgl_size = dma_get_max_seg_size(attachment->dev);
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct sg_table *sgt;
> +	unsigned int nents;
> +	int ret;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	if (!attachment->peer2peer)
> +		return ERR_PTR(-EPERM);
> +
> +	if (priv->revoked)
> +		return ERR_PTR(-ENODEV);
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	ret = populate_sgt(attachment, dir, sgt, sgl_size);

One of the outcomes of the discussion over original Jason's series was
the decision do not use scatter-gather list, but provide DMA API
to be usable for non-struct page memory, which eliminates the need
of intermediate SG list.

This is why we had this series https://lore.kernel.org/all/cover.1709635535.git.leon@kernel.org

And new version is available here:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dma-split-v1

Thanks
