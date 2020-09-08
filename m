Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CC260A42
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 07:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524F6E14F;
	Tue,  8 Sep 2020 05:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800326E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 05:44:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27E0535;
 Tue,  8 Sep 2020 07:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599543864;
 bh=9OUHQE1HIm3PdDdaONJrJVF3G4fY6PLo2ZEzzpdibbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/DjuneDtzMr8DEJp6n/cCivRLxDFxJHCZMD9KCfkeLnilGzd3IPfxvkmJ9azZbcL
 +QB1Zz6JnL5tUVu7Y7hjUH3XRwiAQ0O7xWKMDl2fuZd9RgKkGkwoLI4YwIqDZ9m1zX
 4ynohD6W/Wkm3a3JqL/f7ESfR0PzuJCruWGH5Pis=
Date: Tue, 8 Sep 2020 08:43:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200908054359.GA25682@pendragon.ideasonboard.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200901073222.GR2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901073222.GR2352366@phenom.ffwll.local>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, kernel@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 "Andrew F . Davis" <afd@ti.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Sep 01, 2020 at 09:32:22AM +0200, Daniel Vetter wrote:
> On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
> > This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> > which will allocate memory suitable for the given device.
> > 
> > The implementation is mostly a port of the Contiguous Videobuf2
> > memory allocator (see videobuf2/videobuf2-dma-contig.c)
> > over to the DMA-BUF Heap interface.
> > 
> > The intention of this allocator is to provide applications
> > with a more system-agnostic API: the only thing the application
> > needs to know is which device to get the buffer for.
> > 
> > Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> > is unknown to the application.
> > 
> > I'm not really expecting this patch to be correct or even
> > a good idea, but just submitting it to start a discussion on DMA-BUF
> > heap discovery and negotiation.
> > 
> > Given Plumbers is just a couple weeks from now, I've submitted
> > a BoF proposal to discuss this, as perhaps it would make
> > sense to discuss this live?
> > 
> > Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> I think on the uapi/constraint solving side there's been already tons of
> discussions while I enjoyed vacations, so different concern from me
> entirely on the implementation side:
> 
> In the past the only thing we had in upstream was subsystem/driver
> specific allocators, and dma-buf for sharing. With dma-buf heaps we kinda
> get a central allocator, which duplicates large chunks of of all these
> allocators. And since it's a central allocator by design, the reason for
> having per-subsystem allocators is kinda gone.
> 
> I think there's two approaches here:
> - we convert e.g. drm allocator helpers to internally use the right heap
>   implementation.

We however don't always have a need for a dmabuf, as not all buffers are
meant to be shared (and we often can't tell beforehand, at allocation
time, if a given buffer will be shared or not). While the overhead of
allocating a dmabuf should be file, assigning a file descriptor to each
buffer would be prohibitely expensive.

We would need to decouple the dma heaps from file descriptors. I think
that's doable, but it changes the philosophy of dma heaps and needs
careful consideration. In particular, one may wonder what that would
bring us, compared to the DMA mapping API for instance.

> That would also give us some fairly direct way to expose
>   these constraints in sysfs so a userspace allocator knows which dma-buf
>   heap to pick for shared stuff.

sysfs won't work I'm afraid, as constraints may depend on the format for
instace. We need subsystem-specific APIs to expose constraints.

> - we require that any heap is just a different uapi for an existing driver
>   allocator, e.g. by having a dma-buf wrapper for all gem drivers.
> 
> Otherwise I think what we end up with is a pile of dma-buf heaps for
> android's blob gpu driver world, and not used anywhere else. Not something
> even remotely interesting for upstream :-)
> 
> tldr; I'd like to see how dma-buf heaps closely integrate with all the
> existing buffer management code we have. Both kernel (and throuhg some
> allocator library effort) in userspace.
> 
> > ---
> >  drivers/dma-buf/heaps/Kconfig       |   9 +
> >  drivers/dma-buf/heaps/Makefile      |   1 +
> >  drivers/dma-buf/heaps/device_heap.c | 268 ++++++++++++++++++++++++++++
> >  include/linux/device.h              |   5 +
> >  include/linux/dma-heap.h            |   6 +
> >  5 files changed, 289 insertions(+)
> >  create mode 100644 drivers/dma-buf/heaps/device_heap.c
> > 
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> > index a5eef06c4226..2bb3604184bd 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
> >  	  Choose this option to enable dma-buf CMA heap. This heap is backed
> >  	  by the Contiguous Memory Allocator (CMA). If your system has these
> >  	  regions, you should say Y here.
> > +
> > +config DMABUF_HEAPS_DEVICES
> > +	bool "DMA-BUF Device DMA Heap (Experimental)"
> > +	depends on DMABUF_HEAPS
> > +	help
> > +	  Choose this option to enable dma-buf per-device heap. This heap is backed
> > +	  by the DMA-API and it's an Experimental feature, meant mostly for testing
> > +	  and experimentation.
> > +	  Just say N here.
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> > index 6e54cdec3da0..c691d85b3044 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -2,3 +2,4 @@
> >  obj-y					+= heap-helpers.o
> >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> > +obj-$(CONFIG_DMABUF_HEAPS_DEVICES)	+= device_heap.o
> > diff --git a/drivers/dma-buf/heaps/device_heap.c b/drivers/dma-buf/heaps/device_heap.c
> > new file mode 100644
> > index 000000000000..1803dc622dd8
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/device_heap.c
> > @@ -0,0 +1,268 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * DMABUF Device DMA heap exporter
> > + *
> > + * Copyright (C) 2020, Collabora Ltd.
> > + *
> > + * Based on:
> > + *   videobuf2-dma-contig.c - DMA contig memory allocator for videobuf2
> > + *   Copyright (C) 2010 Samsung Electronics
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +#include <linux/module.h>
> > +
> > +struct dev_dmabuf_attachment {
> > +	struct sg_table sgt;
> > +	enum dma_data_direction dma_dir;
> > +};
> > +
> > +struct dev_dmabuf {
> > +	struct dma_heap *heap;
> > +	struct dma_buf *dmabuf;
> > +	struct device *dev;
> > +	size_t size;
> > +	void *vaddr;
> > +	dma_addr_t dma_addr;
> > +	unsigned long attrs;
> > +
> > +	struct sg_table sgt;
> > +};
> > +
> > +static struct sg_table *dev_dmabuf_ops_map(struct dma_buf_attachment *db_attach,
> > +					   enum dma_data_direction dma_dir)
> > +{
> > +	struct dev_dmabuf_attachment *attach = db_attach->priv;
> > +	/* stealing dmabuf mutex to serialize map/unmap operations */
> > +	struct mutex *lock = &db_attach->dmabuf->lock;
> > +	struct sg_table *sgt;
> > +
> > +	mutex_lock(lock);
> > +
> > +	sgt = &attach->sgt;
> > +	/* return previously mapped sg table */
> > +	if (attach->dma_dir == dma_dir) {
> > +		mutex_unlock(lock);
> > +		return sgt;
> > +	}
> > +
> > +	/* release any previous cache */
> > +	if (attach->dma_dir != DMA_NONE) {
> > +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > +				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +		attach->dma_dir = DMA_NONE;
> > +	}
> > +
> > +	/*
> > +	 * mapping to the client with new direction, no cache sync
> > +	 * required see comment in .dmabuf_ops_detach()
> > +	 */
> > +	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > +				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +	if (!sgt->nents) {
> > +		dev_err(db_attach->dev, "failed to map scatterlist\n");
> > +		mutex_unlock(lock);
> > +		return ERR_PTR(-EIO);
> > +	}
> > +
> > +	attach->dma_dir = dma_dir;
> > +
> > +	mutex_unlock(lock);
> > +
> > +	return sgt;
> > +}
> > +
> > +static void dev_dmabuf_ops_unmap(struct dma_buf_attachment *db_attach,
> > +				 struct sg_table *sgt,
> > +				 enum dma_data_direction dma_dir)
> > +{
> > +	/* nothing to be done here */
> > +}
> > +
> > +static int dev_dmabuf_ops_attach(struct dma_buf *dmabuf,
> > +				 struct dma_buf_attachment *dbuf_attach)
> > +{
> > +	struct dev_dmabuf_attachment *attach;
> > +	unsigned int i;
> > +	struct scatterlist *rd, *wr;
> > +	struct sg_table *sgt;
> > +	struct dev_dmabuf *buf = dmabuf->priv;
> > +	int ret;
> > +
> > +	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> > +	if (!attach)
> > +		return -ENOMEM;
> > +	sgt = &attach->sgt;
> > +
> > +	/*
> > +	 * Copy the buf->sgt scatter list to the attachment, as we can't
> > +	 * map the same scatter list to multiple attachments at the same time.
> > +	 */
> > +	ret = sg_alloc_table(sgt, buf->sgt.orig_nents, GFP_KERNEL);
> > +	if (ret) {
> > +		kfree(attach);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	rd = buf->sgt.sgl;
> > +	wr = sgt->sgl;
> > +	for (i = 0; i < sgt->orig_nents; ++i) {
> > +		sg_set_page(wr, sg_page(rd), rd->length, rd->offset);
> > +		rd = sg_next(rd);
> > +		wr = sg_next(wr);
> > +	}
> > +
> > +	attach->dma_dir = DMA_NONE;
> > +	dbuf_attach->priv = attach;
> > +
> > +	return 0;
> > +}
> > +
> > +static void dev_dmabuf_ops_detach(struct dma_buf *dmabuf,
> > +				  struct dma_buf_attachment *db_attach)
> > +{
> > +	struct dev_dmabuf_attachment *attach = db_attach->priv;
> > +	struct sg_table *sgt;
> > +
> > +	if (!attach)
> > +		return;
> > +	sgt = &attach->sgt;
> > +
> > +	/* release the scatterlist cache */
> > +	if (attach->dma_dir != DMA_NONE)
> > +		/*
> > +		 * Cache sync can be skipped here, as the memory is
> > +		 * allocated from device coherent memory, which means the
> > +		 * memory locations do not require any explicit cache
> > +		 * maintenance prior or after being used by the device.
> > +		 *
> > +		 * XXX: This needs a revisit.
> > +		 */
> > +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > +				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +	sg_free_table(sgt);
> > +	kfree(attach);
> > +	db_attach->priv = NULL;
> > +}
> > +
> > +
> > +static void *dev_dmabuf_ops_vmap(struct dma_buf *dmabuf)
> > +{
> > +	struct dev_dmabuf *buf = dmabuf->priv;
> > +
> > +	return buf->vaddr;
> > +}
> > +
> > +static void dev_dmabuf_ops_release(struct dma_buf *dmabuf)
> > +{
> > +	struct dev_dmabuf *buf = dmabuf->priv;
> > +
> > +	sg_free_table(&buf->sgt);
> > +	dma_free_attrs(buf->dev, buf->size, buf->vaddr,
> > +		       buf->dma_addr, buf->attrs);
> > +	put_device(buf->dev);
> > +	kfree(buf);
> > +}
> > +
> > +static int dev_dmabuf_ops_mmap(struct dma_buf *dmabuf,
> > +			       struct vm_area_struct *vma)
> > +{
> > +	struct dev_dmabuf *buf = dmabuf->priv;
> > +	int ret;
> > +
> > +	ret = dma_mmap_attrs(buf->dev, vma, buf->vaddr,
> > +			     buf->dma_addr, buf->size,
> > +			     buf->attrs);
> > +	if (ret) {
> > +		dev_err(buf->dev, "remapping memory failed, error: %d\n", ret);
> > +		return ret;
> > +	}
> > +	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dma_buf_ops dev_dmabuf_ops = {
> > +	.attach = dev_dmabuf_ops_attach,
> > +	.detach = dev_dmabuf_ops_detach,
> > +	.map_dma_buf = dev_dmabuf_ops_map,
> > +	.unmap_dma_buf = dev_dmabuf_ops_unmap,
> > +	.vmap = dev_dmabuf_ops_vmap,
> > +	.mmap = dev_dmabuf_ops_mmap,
> > +	.release = dev_dmabuf_ops_release,
> > +};
> > +
> > +static int dev_heap_allocate(struct dma_heap *heap,
> > +			unsigned long size,
> > +			unsigned long fd_flags,
> > +			unsigned long heap_flags)
> > +{
> > +	struct device *dev = dma_heap_get_drvdata(heap);
> > +	struct dev_dmabuf *buf;
> > +	struct dma_buf_export_info exp_info = {};
> > +	unsigned long attrs = 0;
> > +	int ret = -ENOMEM;
> > +
> > +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	buf->vaddr = dma_alloc_attrs(dev, size, &buf->dma_addr,
> > +				     GFP_KERNEL, attrs);
> > +	/* Prevent the device from being released while the buffer is used */
> > +	buf->dev = get_device(dev);
> > +	buf->heap = heap;
> > +	buf->size = size;
> > +	buf->attrs = attrs;
> > +
> > +	/* XXX: This call is documented as unsafe. See dma_get_sgtable_attrs(). */
> > +	ret = dma_get_sgtable_attrs(buf->dev, &buf->sgt,
> > +				    buf->vaddr, buf->dma_addr,
> > +				    buf->size, buf->attrs);
> > +	if (ret < 0) {
> > +		dev_err(buf->dev, "failed to get scatterlist from DMA API\n");
> > +		return ret;
> > +	}
> > +
> > +	exp_info.exp_name = dev_name(dev);
> > +	exp_info.owner = THIS_MODULE;
> > +	exp_info.ops = &dev_dmabuf_ops;
> > +	exp_info.size = size;
> > +	exp_info.flags = fd_flags;
> > +	exp_info.priv = buf;
> > +
> > +	buf->dmabuf = dma_buf_export(&exp_info);
> > +	if (IS_ERR(buf->dmabuf)) {
> > +		dev_err(buf->dev, "failed to export dmabuf\n");
> > +		return PTR_ERR(buf->dmabuf);
> > +	}
> > +
> > +	ret = dma_buf_fd(buf->dmabuf, fd_flags);
> > +	if (ret < 0) {
> > +		dev_err(buf->dev, "failed to get dmabuf fd: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct dma_heap_ops dev_heap_ops = {
> > +	.allocate = dev_heap_allocate,
> > +};
> > +
> > +void dev_dma_heap_add(struct device *dev)
> > +{
> > +	struct dma_heap_export_info exp_info;
> > +
> > +	exp_info.name = dev_name(dev);
> > +	exp_info.ops = &dev_heap_ops;
> > +	exp_info.priv = dev;
> > +
> > +	dev->heap = dma_heap_add(&exp_info);
> > +}
> > +EXPORT_SYMBOL(dev_dma_heap_add);
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index ca18da4768e3..1fae95d55ea1 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -45,6 +45,7 @@ struct iommu_ops;
> >  struct iommu_group;
> >  struct dev_pin_info;
> >  struct dev_iommu;
> > +struct dma_heap;
> >  
> >  /**
> >   * struct subsys_interface - interfaces to device functions
> > @@ -597,6 +598,10 @@ struct device {
> >  	struct iommu_group	*iommu_group;
> >  	struct dev_iommu	*iommu;
> >  
> > +#ifdef CONFIG_DMABUF_HEAPS_DEVICES
> > +	struct dma_heap		*heap;
> > +#endif
> > +
> >  	bool			offline_disabled:1;
> >  	bool			offline:1;
> >  	bool			of_node_reused:1;
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index 454e354d1ffb..dcf7cca2f487 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
> >   */
> >  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
> >  
> > +#ifdef CONFIG_DMABUF_HEAPS_DEVICES
> > +void dev_dma_heap_add(struct device *dev);
> > +#else
> > +static inline void dev_dma_heap_add(struct device *dev) {}
> > +#endif
> > +
> >  #endif /* _DMA_HEAPS_H */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
