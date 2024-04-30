Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6398B82A4
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 00:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817410E9DE;
	Tue, 30 Apr 2024 22:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XtP0rpjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B3110E9D6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714515897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBVfn4SD5DgCDPTNLjWktsCqzAy1VXyAfNkt20vMdfo=;
 b=XtP0rpjFTNEg3qAZKen1WBADXz04g+YskOQrXpBxDduOV9rA46PpZApuPTmdLRcNV/mZQk
 DWjnCInNQ0qeOLGeMceR4jcslsLYXdoylgzUlU6Lu3Jm+VBBPUfK0VmqXV3EbxcwkMrZHF
 29KfBgaFcbM3OjMBZFsorXbOS7RchwQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-wUJkC3zRPeyFo_mxGdHJzQ-1; Tue, 30 Apr 2024 18:24:55 -0400
X-MC-Unique: wUJkC3zRPeyFo_mxGdHJzQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-6ef88ce1ef9so990113a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 15:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714515895; x=1715120695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBVfn4SD5DgCDPTNLjWktsCqzAy1VXyAfNkt20vMdfo=;
 b=T0MM+EJ17DbXpDMZkRFnyIErte/qiG1dJJa8DGqleALGjo3rZFPNPbX25XvD195mvm
 GxC3QYcwSoWu4xMVYzaO27bNHfaoYMpmDhtg2+yomFAvHXeyA1zPl/OBsSvQIDSTJTyH
 KTxbxvR1jnBc6WLFQMDEFVMLJYEwx5K/3sp3q/qpAO0KtxE8Pf5BfddQtQQe1Q3ZAvzu
 BMlmy54eJfRdiNAqK6w5/HTP+Kq0KtExTPA0sEJftC0vE54fV/A3mWgiKhDYyDiCvRN0
 daAjv89f03xjT439X5dYKasqcujxOPOY2xf5ktdjGteiJibCd+at9WX+uZuLVvUZmLyC
 cwgw==
X-Gm-Message-State: AOJu0YwbO4T0n3EdRS3dR8F1GTk4t8sa+u8Rk1uHToAp+k4D9o7Wc8YX
 o9l6ZtF1lUTYYuuIsEo4Wy3uWzyUKunuLdxN2nr/cZMu6MTXa8lHuWgHE4P74xEClGGVVKdHimj
 iaEulkl45N8GKAPq/VSMP2NoGvZTy7M/+7QVNh86UCMjjes6dDQMe1qmowbpLxhuBjA==
X-Received: by 2002:a9d:7617:0:b0:6ee:37be:c11d with SMTP id
 k23-20020a9d7617000000b006ee37bec11dmr801442otl.6.1714515894821; 
 Tue, 30 Apr 2024 15:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+96i+qJXJN4hgHxY4/BySh4VkTUyL779GT6EbfjRyAmsEjv4uIdAaKOQ89VcGsxuGQSJhLg==
X-Received: by 2002:a9d:7617:0:b0:6ee:37be:c11d with SMTP id
 k23-20020a9d7617000000b006ee37bec11dmr801428otl.6.1714515894285; 
 Tue, 30 Apr 2024 15:24:54 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 eu16-20020a056820309000b005a46d5bd558sm5561190oob.45.2024.04.30.15.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 15:24:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 16:24:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20240430162450.711f4616.alex.williamson@redhat.com>
In-Reply-To: <20240422063602.3690124-3-vivek.kasireddy@intel.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 21 Apr 2024 23:30:33 -0700
Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

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
> - Use P2P DMA APIs to create pages (ZONE_DEVICE) instead of DMA addrs
> - Add a mmap handler to provide CPU access to the dmabuf
> - Add support for creating dmabuf from multiple areas (or ranges)
> 
> Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/vfio/pci/Makefile          |   1 +
>  drivers/vfio/pci/dma_buf.c         | 348 +++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_config.c |   8 +-
>  drivers/vfio/pci/vfio_pci_core.c   |  28 ++-
>  drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
>  include/linux/vfio_pci_core.h      |   1 +
>  include/uapi/linux/vfio.h          |  25 +++
>  7 files changed, 426 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/vfio/pci/dma_buf.c
> 
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index ce7a61f1d912..b2374856ff62 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,6 +2,7 @@
>  
>  vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>  vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += dma_buf.o
>  obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>  
>  vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
> new file mode 100644
> index 000000000000..7bf00fdee69b
> --- /dev/null
> +++ b/drivers/vfio/pci/dma_buf.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#include <linux/dma-buf.h>
> +#include <linux/pci-p2pdma.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	struct page **pages;
> +	struct sg_table *sg;
> +	unsigned int nr_pages;
> +	bool revoked;
> +};
> +
> +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> +	pgoff_t pgoff = vmf->pgoff;
> +
> +	if (pgoff >= priv->nr_pages)
> +		return VM_FAULT_SIGBUS;
> +
> +	return vmf_insert_pfn(vma, vmf->address,
> +			      page_to_pfn(priv->pages[pgoff]));
> +}

How does this prevent the MMIO space from being mmap'd when disabled at
the device?  How is the mmap revoked when the MMIO becomes disabled?
Is it part of the move protocol?

> +
> +static const struct vm_operations_struct vfio_pci_dma_buf_vmops = {
> +	.fault = vfio_pci_dma_buf_fault,
> +};
> +
> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf,
> +				 struct vm_area_struct *vma)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> +		return -EINVAL;
> +
> +	vma->vm_ops = &vfio_pci_dma_buf_vmops;
> +	vma->vm_private_data = priv;
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +	return 0;
> +}

Does this need to include the new VM_ALLOW_ANY_UNCACHED flag?

> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +	int rc;
> +
> +	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
> +				      true);
> +	if (rc < 0)
> +		attachment->peer2peer = false;
> +	return 0;
> +}
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +}
> +
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +	/*
> +	 * Uses the dynamic interface but must always allow for
> +	 * dma_buf_move_notify() to do revoke
> +	 */
> +	return -EINVAL;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	unsigned int i = 0;
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
> +	ret = sg_alloc_table(sgt, priv->nr_pages, GFP_KERNEL);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	for_each_sg(sgt->sgl, sgl, priv->nr_pages, i)
> +		sg_set_page(sgl, priv->pages[i], PAGE_SIZE, 0);
> +
> +	ret = dma_map_sgtable(attachment->dev, sgt, dir, 0);
> +	if (ret < 0)
> +		goto err_free_sgt;
> +
> +	return sgt;
> +
> +err_free_sgt:
> +	sg_free_table(sgt);
> +err_kfree_sgt:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	dma_unmap_sgtable(attachment->dev, sgt, dir, 0);
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
> +
> +static void release_p2p_pages(struct vfio_pci_dma_buf *priv,
> +			      unsigned int nr_pages)
> +{
> +	while (nr_pages > 0 && priv->pages[--nr_pages])
> +		pci_free_p2pmem(priv->vdev->pdev,
> +				page_to_virt(priv->pages[nr_pages]),
> +				PAGE_SIZE);
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	/*
> +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +	 * The refcount prevents both.
> +	 */
> +	if (priv->vdev) {
> +		release_p2p_pages(priv, priv->nr_pages);
> +		kfree(priv->pages);
> +		down_write(&priv->vdev->memory_lock);
> +		list_del_init(&priv->dmabufs_elm);
> +		up_write(&priv->vdev->memory_lock);

Why are we acquiring and releasing the memory_lock write lock
throughout when we're not modifying the device memory enable state?
Ugh, we're using it to implicitly lock dmabufs_elm/dmabufs aren't we...

> +		vfio_device_put_registration(&priv->vdev->vdev);
> +	}
> +	kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.attach = vfio_pci_dma_buf_attach,
> +	.map_dma_buf = vfio_pci_dma_buf_map,
> +	.pin = vfio_pci_dma_buf_pin,
> +	.unpin = vfio_pci_dma_buf_unpin,
> +	.release = vfio_pci_dma_buf_release,
> +	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +	.mmap = vfio_pci_dma_buf_mmap,
> +};
> +
> +static int create_p2p_pages(struct vfio_pci_dma_buf *priv, uint32_t nr_areas,
> +			    struct vfio_region_p2p_area *p2p_areas)
> +{
> +	struct pci_dev *pdev = priv->vdev->pdev;
> +	resource_size_t bar_size;
> +	unsigned int pg = 0;
> +	void *vaddr;
> +	size_t size;
> +	int i, ret;
> +
> +	for (i = 0; i < nr_areas; i++) {
> +		bar_size = pci_resource_len(pdev, p2p_areas[i].region_index);
> +		if (p2p_areas[i].offset > bar_size ||
> +		    p2p_areas[i].offset + p2p_areas[i].length > bar_size) {
> +			ret = -ERANGE;
> +			goto err;
> +		}
> +
> +		ret = pci_p2pdma_add_resource(pdev,
> +					      p2p_areas[i].region_index,
> +					      p2p_areas[i].length,
> +					      p2p_areas[i].offset);
> +		if (ret)
> +			goto err;
> +
> +		vaddr = pci_alloc_p2pmem(pdev, p2p_areas[i].length);
> +		if (!vaddr) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		for (size = 0; size < p2p_areas[i].length;) {
> +			priv->pages[pg++] = virt_to_page(vaddr + size);
> +			size += PAGE_SIZE;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	release_p2p_pages(priv, pg);
> +	return ret;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf;
> +	struct vfio_region_p2p_area *p2p_areas;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	int i, ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	p2p_areas = memdup_array_user(&arg->p2p_areas,
> +				      get_dma_buf.nr_areas,
> +				      sizeof(*p2p_areas));
> +	if (IS_ERR(p2p_areas))
> +		return PTR_ERR(p2p_areas);
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

p2p_areas is leaked.

> +
> +	ret = -ERANGE;
> +	for (i = 0; i < get_dma_buf.nr_areas; i++) {
> +		/*
> +		 * For PCI the region_index is the BAR number like
> +		 * everything else.
> +		 */
> +		if (p2p_areas[i].region_index >= VFIO_PCI_ROM_REGION_INDEX) {
> +			goto err_free_priv;
> +		}
> +
> +		if (!IS_ALIGNED(p2p_areas[i].offset, PAGE_SIZE) ||
> +		    !IS_ALIGNED(p2p_areas[i].length, PAGE_SIZE))
> +			goto err_free_priv;
> +
> +		priv->nr_pages += p2p_areas[i].length >> PAGE_SHIFT;
> +	}
> +
> +	if (!priv->nr_pages)
> +		goto err_free_priv;
> +
> +	priv->pages = kmalloc_array(priv->nr_pages,
> +				    sizeof(*priv->pages), GFP_KERNEL);
> +	if (!priv->pages) {
> +		ret = -ENOMEM;
> +		goto err_free_priv;
> +	}
> +
> +	priv->vdev = vdev;
> +	ret = create_p2p_pages(priv, get_dma_buf.nr_areas, p2p_areas);
> +	if (ret)
> +		goto err_free_priv;
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = priv->nr_pages << PAGE_SHIFT;
> +	exp_info.flags = get_dma_buf.open_flags;

open_flags from userspace are unchecked.

> +	exp_info.priv = priv;
> +
> +	priv->dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		ret = PTR_ERR(priv->dmabuf);
> +		goto err_free_pages;
> +	}
> +
> +	/* dma_buf_put() now frees priv */
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> +	vfio_device_try_get_registration(&vdev->vdev);

I guess we're assuming this can't fail in the ioctl path of an open
device?

> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);

What was the purpose of locking this?

> +	up_write(&vdev->memory_lock);
> +	kfree(p2p_areas);
> +
> +	/*
> +	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
> +	 * will be released.
> +	 */
> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +
> +err_free_pages:
> +	release_p2p_pages(priv, priv->nr_pages);
> +err_free_priv:
> +	kfree(p2p_areas);
> +	kfree(priv->pages);
> +	kfree(priv);
> +	return ret;
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;

Does this indicate the file was closed?

> +		if (priv->revoked != revoked) {
> +			dma_resv_lock(priv->dmabuf->resv, NULL);
> +			priv->revoked = revoked;
> +			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_unlock(priv->dmabuf->resv);
> +		}
> +		dma_buf_put(priv->dmabuf);
> +	}
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	down_write(&vdev->memory_lock);
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		list_del_init(&priv->dmabufs_elm);
> +		priv->vdev = NULL;
> +		priv->revoked = true;
> +		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		vfio_device_put_registration(&vdev->vdev);
> +		dma_buf_put(priv->dmabuf);
> +	}
> +	up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index 97422aafaa7b..c605c5cb0078 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -585,10 +585,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>  
> -		if (!new_mem)
> +		if (!new_mem) {
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		else
> +			vfio_pci_dma_buf_move(vdev, true);
> +		} else {
>  			down_write(&vdev->memory_lock);
> +		}
>  
>  		/*
>  		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		*virt_cmd &= cpu_to_le16(~mask);
>  		*virt_cmd |= cpu_to_le16(new_cmd & mask);
>  
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>  		up_write(&vdev->memory_lock);
>  	}
>  

FLR is also accessible through config space.

> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index d94d61b92c1a..d2ef982bdb3e 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -700,6 +700,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>  #endif
>  	vfio_pci_core_disable(vdev);
>  
> +	vfio_pci_dma_buf_cleanup(vdev);
> +
>  	mutex_lock(&vdev->igate);
>  	if (vdev->err_trigger) {
>  		eventfd_ctx_put(vdev->err_trigger);
> @@ -1246,7 +1248,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	 */
>  	vfio_pci_set_power_state(vdev, PCI_D0);
>  
> +	vfio_pci_dma_buf_move(vdev, true);
>  	ret = pci_try_reset_function(vdev->pdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>  	up_write(&vdev->memory_lock);
>  

What about runtime power management?


>  	return ret;
> @@ -1467,11 +1472,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
>  
> -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> -				       uuid_t __user *arg, size_t argsz)
> +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> +				       u32 flags, uuid_t __user *arg,
> +				       size_t argsz)
>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);

Why is only this existing function updated?  If the core device deref
is common then apply it to all and do so in a separate patch.  Thanks,

Alex

>  	uuid_t uuid;
>  	int ret;
>  
> @@ -1498,6 +1502,9 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
>  int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  				void __user *arg, size_t argsz)
>  {
> +	struct vfio_pci_core_device *vdev =
> +			container_of(device, struct vfio_pci_core_device, vdev);
> +
>  	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
>  	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY:
>  		return vfio_pci_core_pm_entry(device, flags, arg, argsz);
> @@ -1507,7 +1514,9 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  	case VFIO_DEVICE_FEATURE_LOW_POWER_EXIT:
>  		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> -		return vfio_pci_core_feature_token(device, flags, arg, argsz);
> +		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -2182,6 +2191,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  	mutex_init(&vdev->vma_lock);
>  	INIT_LIST_HEAD(&vdev->vma_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +	INIT_LIST_HEAD(&vdev->dmabufs);
>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);
>  
> @@ -2576,11 +2586,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  	 * cause the PCI config space reset without restoring the original
>  	 * state (saved locally in 'vdev->pm_save').
>  	 */
> -	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		vfio_pci_dma_buf_move(cur, true);
>  		vfio_pci_set_power_state(cur, PCI_D0);
> +	}
>  
>  	ret = pci_reset_bus(pdev);
>  
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(cur))
> +			vfio_pci_dma_buf_move(cur, false);
> +
>  err_undo:
>  	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
>  		if (cur == cur_mem)
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 5e4fa69aee16..09d3c300918c 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -101,4 +101,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>  	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>  }
>  
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
> +#else
> +static int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +			      struct vfio_device_feature_dma_buf __user *arg,
> +			      size_t argsz)
> +{
> +	return -ENOTTY;
> +}
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +}
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> +					 bool revoked)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index a2c8b8bba711..387cce561dad 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -96,6 +96,7 @@ struct vfio_pci_core_device {
>  	struct mutex		vma_lock;
>  	struct list_head	vma_list;
>  	struct rw_semaphore	memory_lock;
> +	struct list_head	dmabufs;
>  };
>  
>  /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 2b68e6cdf190..47d230c5df25 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1458,6 +1458,31 @@ struct vfio_device_feature_bus_master {
>  };
>  #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
>  
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * region selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf from.
> + * If both are 0 then the whole region is used.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_region_p2p_area {
> +	__u32	region_index;
> +	__u32	__pad;
> +	__u64	offset;
> +	__u64	length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +	__u32	open_flags;
> +	__u32	nr_areas;
> +	struct vfio_region_p2p_area p2p_areas[];
> +};
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>  
>  /**

