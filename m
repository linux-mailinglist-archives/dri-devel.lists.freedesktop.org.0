Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C310C23725
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 07:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B4C10E13F;
	Fri, 31 Oct 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a1h6FTwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3310E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:48:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DAAB14386B;
 Fri, 31 Oct 2025 06:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30340C4CEF1;
 Fri, 31 Oct 2025 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761893335;
 bh=R5M/BZuEUeO6MNnujDu/RdiqPqOvxifgK+E/jWj/M64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a1h6FTwN+q+A4td6LvgwCZbm56rsVEOnHoTSFeQoA8kEIgslHwi8eKhmcAv9St0Ok
 W80x4Wj8UXuXSY+0aKudJ5lih9rGfReoMhWTywfeghp1RUox6v4uqV5oNv5qbYEg56
 QbNeAscqzR9+MyI87V97tP4x1PtA/rtR2xTBusZX/rYO0ZXMXvRQOdHykNpR4S0/F0
 1WmfFbl2veaaeJ/gkMhFWNLbBDpTqt/7ZKw1BnTuN4+koJ6EwRipT90WVcZLqWqcZF
 nn5bH+8Pi8nXwLiOrgVS7RmUROm+rQImaoV3BWpLLmivAW/zoQbjZp2iEz7zcV0W1P
 XuCupc4+xACzg==
Date: Fri, 31 Oct 2025 08:48:51 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
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
Message-ID: <20251031064851.GA74544@unreal>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251030143836.66cdf116@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030143836.66cdf116@shazbot.org>
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

On Thu, Oct 30, 2025 at 02:38:36PM -0600, Alex Williamson wrote:
> On Mon, 13 Oct 2025 18:26:11 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index fe247d0e2831..56b1320238a9 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -1511,6 +1520,19 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
> >  		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
> >  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> >  		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> > +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> > +		if (device->ops->ioctl != vfio_pci_core_ioctl)
> > +			/*
> > +			 * Devices that overwrite general .ioctl() callback
> > +			 * usually do it to implement their own
> > +			 * VFIO_DEVICE_GET_REGION_INFO handlerm and they present
> 
> Typo, "handlerm"

Thanks, this part of code is going to be different in v6.

> 

<...>

> > @@ -2482,6 +2506,10 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> >  
> >  	ret = pci_reset_bus(pdev);
> >  
> > +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> > +		if (__vfio_pci_memory_enabled(vdev))
> > +			vfio_pci_dma_buf_move(vdev, false);
> > +
> >  	vdev = list_last_entry(&dev_set->device_list,
> >  			       struct vfio_pci_core_device, vdev.dev_set_list);
> >  
> 
> This needs to be placed in the existing undo loop with the up_write(),
> otherwise it can be missed in the error case.

I'll move, but it caused me to wonder what did you want to achieve with
this "vdev = list_last_entry ..." line? vdev is overwritten immediately
after that line.

> 
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > new file mode 100644
> > index 000000000000..eaba010777f3
> > --- /dev/null
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +static unsigned int calc_sg_nents(struct vfio_pci_dma_buf *priv,
> > +				  struct dma_iova_state *state)
> > +{
> > +	struct phys_vec *phys_vec = priv->phys_vec;
> > +	unsigned int nents = 0;
> > +	u32 i;
> > +
> > +	if (!state || !dma_use_iova(state))
> > +		for (i = 0; i < priv->nr_ranges; i++)
> > +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> > +	else
> > +		/*
> > +		 * In IOVA case, there is only one SG entry which spans
> > +		 * for whole IOVA address space, but we need to make sure
> > +		 * that it fits sg->length, maybe we need more.
> > +		 */
> > +		nents = DIV_ROUND_UP(priv->size, UINT_MAX);
> 
> I think we're arguably running afoul of the coding style standard here
> that this is not a single simple statement and should use braces.
> 

<...>

> > +err_unmap_dma:
> > +	if (!i || !state)
> > +		; /* Do nothing */
> > +	else if (dma_use_iova(state))
> > +		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
> > +				 attrs);
> > +	else
> > +		for_each_sgtable_dma_sg(sgt, sgl, i)
> > +			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
> > +					sg_dma_len(sgl), dir, attrs);
> 
> Same, here for braces.
> 

<...>

> > +	if (!state)
> > +		; /* Do nothing */
> > +	else if (dma_use_iova(state))
> > +		dma_iova_destroy(attachment->dev, state, priv->size, dir,
> > +				 attrs);
> > +	else
> > +		for_each_sgtable_dma_sg(sgt, sgl, i)
> > +			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
> > +				       sg_dma_len(sgl), dir, attrs);
> > +
> 
> Here too.

I will change it, but it is worth to admit that I'm consistent in my
coding style.

> 
> > +	sg_free_table(sgt);
> > +	kfree(sgt);
> > +}
> ...
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index 75100bf009ba..63214467c875 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -1478,6 +1478,31 @@ struct vfio_device_feature_bus_master {
> >  };
> >  #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
> >  
> > +/**
> > + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> > + * regions selected.
> > + *
> > + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> > + * etc. offset/length specify a slice of the region to create the dmabuf from.
> > + * nr_ranges is the total number of (P2P DMA) ranges that comprise the dmabuf.
> > + *
> 
> Probably worth noting that .flags should be zero, I see we enforce
> that.  Thanks,

Added, thanks

> 
> Alex
> 
