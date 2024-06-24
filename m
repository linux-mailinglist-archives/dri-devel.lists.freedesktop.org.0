Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B7914375
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840AC10E379;
	Mon, 24 Jun 2024 07:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKAI6bDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5710E377
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213678; x=1750749678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NprWFRZ0bgtdsj2245zo4GdVY+xS2WxiuRdvmAHCU1M=;
 b=kKAI6bDU39oHLfhixDI4Cr2U0anLCb8p/y5yjNpWOuc8MQx1fV7/JHMT
 MooHG3aLfoDlvzwTf6fzkWrLgTm+1MnwoyrP7N+K6nMEw+z/TKcNuZI6e
 SP+vricJnD9E3p3FULQgOCf5ekrpyTjI7nHZd78h5s/BwsmaCTk6e9z6N
 iiNVWhUIyS6kSj8T3gpPNQ/dNHoGpWlKiF8Vh91mRD7r1gMocq6H8iYPn
 cRt7beDEKzG8+2PzreL6RTzC0Z0GTqXMrHcTuzPqTWuoiR+1dMAddPSPY
 X6DJNS4s5FMCNNAWfnG7hEofOxOMQNQpLYB/Oxwz1M7U/IaaEc3b1bUDI g==;
X-CSE-ConnectionGUID: 0/C6IG0jREqhE+pJ49wL1A==
X-CSE-MsgGUID: IzqNmoq5TdWf/SKHV67rRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="41574856"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208,223";a="41574856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:21:17 -0700
X-CSE-ConnectionGUID: JBSM89pjRUeZNoSpOGLZ7A==
X-CSE-MsgGUID: q9me4RIPTFug2ACpkOrwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208,223";a="43085347"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:21:17 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 3/3] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Sun, 23 Jun 2024 23:53:11 -0700
Message-ID: <20240624065552.1572580-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624065552.1572580-1-vivek.kasireddy@intel.com>
References: <20240624065552.1572580-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From Jason Gunthorpe:
"dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

The patch design loosely follows the pattern in commit
db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
does not support pinning.

Instead, this implements what, in the past, we've called a revocable
attachment using move. In normal situations the attachment is pinned, as a
BAR does not change physical address. However when the VFIO device is
closed, or a PCI reset is issued, access to the MMIO memory is revoked.

Revoked means that move occurs, but an attempt to immediately re-map the
memory will fail. In the reset case a future move will be triggered when
MMIO access returns. As both close and reset are under userspace control
it is expected that userspace will suspend use of the dma-buf before doing
these operations, the revoke is purely for kernel self-defense against a
hostile userspace."

Following enhancements are made to the original patch:
- Add support for creating dmabuf from multiple areas (or ranges)
- Add a mmap handler to provide CPU access to the dmabuf

Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/dma_buf.c         | 438 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_config.c |  22 +-
 drivers/vfio/pci/vfio_pci_core.c   |  20 +-
 drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  25 ++
 7 files changed, 525 insertions(+), 5 deletions(-)
 create mode 100644 drivers/vfio/pci/dma_buf.c

diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c..0cfdc9ede82f 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,6 +2,7 @@
 
 vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
+vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += dma_buf.o
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
 
 vfio-pci-y := vfio_pci.o
diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
new file mode 100644
index 000000000000..68760677c6a0
--- /dev/null
+++ b/drivers/vfio/pci/dma_buf.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES.
+ */
+#include <linux/dma-buf.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+
+#include "vfio_pci_priv.h"
+
+MODULE_IMPORT_NS(DMA_BUF);
+
+struct vfio_pci_dma_buf {
+	struct dma_buf *dmabuf;
+	struct vfio_pci_core_device *vdev;
+	struct list_head dmabufs_elm;
+	unsigned int nr_ranges;
+	struct vfio_region_dma_range *dma_ranges;
+	unsigned int orig_nents;
+	bool revoked;
+};
+
+static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
+{
+	unsigned long addr = vmf->address - (vmf->pgoff << PAGE_SHIFT);
+	struct vm_area_struct *vma = vmf->vma;
+	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
+	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
+	unsigned long pfn, i, j;
+	phys_addr_t phys;
+	size_t offset;
+
+	if (priv->revoked)
+		return VM_FAULT_SIGBUS;
+
+	down_read(&priv->vdev->memory_lock);
+
+	for (i = 0, j = 0; i < priv->nr_ranges && j < vma_pages(vma); i++) {
+		phys = pci_resource_start(priv->vdev->pdev,
+					  dma_ranges[i].region_index);
+		phys += dma_ranges[i].offset;
+
+		for (offset = 0; offset != dma_ranges[i].length;) {
+			pfn = (phys + offset) >> PAGE_SHIFT;
+
+			if (vmf_insert_pfn(vma, addr, pfn) != VM_FAULT_NOPAGE) {
+				up_read(&priv->vdev->memory_lock);
+				return VM_FAULT_SIGBUS;
+			}
+
+			addr += PAGE_SIZE;
+			offset += PAGE_SIZE;
+			if (++j == vma_pages(vma))
+				break;
+		}
+	}
+
+	up_read(&priv->vdev->memory_lock);
+
+	return VM_FAULT_NOPAGE;
+}
+
+static const struct vm_operations_struct vfio_pci_dma_buf_vmops = {
+	.fault = vfio_pci_dma_buf_fault,
+};
+
+static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf,
+				 struct vm_area_struct *vma)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	struct vfio_pci_core_device *vdev = priv->vdev;
+	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
+	int i;
+
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
+		return -EINVAL;
+
+	for (i = 0; i < priv->nr_ranges; i++)
+		if (!vdev->bar_mmap_supported[dma_ranges[i].region_index])
+			return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_ops = &vfio_pci_dma_buf_vmops;
+	vma->vm_private_data = priv;
+	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
+		     VM_DONTEXPAND | VM_DONTDUMP);
+	return 0;
+}
+
+static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attachment)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+	int rc;
+
+	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
+				      true);
+	if (rc < 0)
+		attachment->peer2peer = false;
+	return 0;
+}
+
+static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
+{
+}
+
+static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
+{
+	/*
+	 * Uses the dynamic interface but must always allow for
+	 * dma_buf_move_notify() to do revoke
+	 */
+	return -EINVAL;
+}
+
+static int populate_sgt(struct dma_buf_attachment *attachment,
+			enum dma_data_direction dir,
+			struct sg_table *sgt, size_t sgl_size)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
+	size_t offset, chunk_size;
+	struct scatterlist *sgl;
+	dma_addr_t dma_addr;
+	phys_addr_t phys;
+	int i, j, ret;
+
+	for_each_sgtable_sg(sgt, sgl, j)
+		sgl->length = 0;
+
+	sgl = sgt->sgl;
+	for (i = 0; i < priv->nr_ranges; i++) {
+		phys = pci_resource_start(priv->vdev->pdev,
+					  dma_ranges[i].region_index);
+		phys += dma_ranges[i].offset;
+
+		/*
+		 * Break the BAR's physical range up into max sized SGL's
+		 * according to the device's requirement.
+		 */
+		for (offset = 0; offset != dma_ranges[i].length;) {
+			chunk_size = min(dma_ranges[i].length - offset,
+					 sgl_size);
+
+			/*
+			 * Since the memory being mapped is a device memory
+			 * it could never be in CPU caches.
+			 */
+			dma_addr = dma_map_resource(attachment->dev,
+						    phys + offset,
+						    chunk_size, dir,
+						    DMA_ATTR_SKIP_CPU_SYNC);
+			ret = dma_mapping_error(attachment->dev, dma_addr);
+			if (ret)
+				goto err;
+
+			sg_set_page(sgl, NULL, chunk_size, 0);
+			sg_dma_address(sgl) = dma_addr;
+			sg_dma_len(sgl) = chunk_size;
+			sgl = sg_next(sgl);
+			offset += chunk_size;
+		}
+	}
+
+	return 0;
+err:
+	for_each_sgtable_sg(sgt, sgl, j) {
+		if (!sg_dma_len(sgl))
+			continue;
+
+		dma_unmap_resource(attachment->dev, sg_dma_address(sgl),
+				   sg_dma_len(sgl),
+				   dir, DMA_ATTR_SKIP_CPU_SYNC);
+	}
+
+	return ret;
+}
+
+static struct sg_table *
+vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
+		     enum dma_data_direction dir)
+{
+	size_t sgl_size = dma_get_max_seg_size(attachment->dev);
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct sg_table *sgt;
+	unsigned int nents;
+	int ret;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (!attachment->peer2peer)
+		return ERR_PTR(-EPERM);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
+	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
+	if (ret)
+		goto err_kfree_sgt;
+
+	ret = populate_sgt(attachment, dir, sgt, sgl_size);
+	if (ret)
+		goto err_free_sgt;
+
+	/*
+	 * Because we are not going to include a CPU list we want to have some
+	 * chance that other users will detect this by setting the orig_nents to
+	 * 0 and using only nents (length of DMA list) when going over the sgl
+	 */
+	priv->orig_nents = sgt->orig_nents;
+	sgt->orig_nents = 0;
+	return sgt;
+
+err_free_sgt:
+	sg_free_table(sgt);
+err_kfree_sgt:
+	kfree(sgt);
+	return ERR_PTR(ret);
+}
+
+static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct scatterlist *sgl;
+	int i;
+
+	for_each_sgtable_dma_sg(sgt, sgl, i)
+		dma_unmap_resource(attachment->dev,
+				   sg_dma_address(sgl),
+				   sg_dma_len(sgl),
+				   dir, DMA_ATTR_SKIP_CPU_SYNC);
+
+	sgt->orig_nents = priv->orig_nents;
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	/*
+	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
+	 * The refcount prevents both.
+	 */
+	if (priv->vdev) {
+		down_write(&priv->vdev->memory_lock);
+		list_del_init(&priv->dmabufs_elm);
+		up_write(&priv->vdev->memory_lock);
+		vfio_device_put_registration(&priv->vdev->vdev);
+	}
+	kfree(priv);
+}
+
+static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+	.attach = vfio_pci_dma_buf_attach,
+	.map_dma_buf = vfio_pci_dma_buf_map,
+	.pin = vfio_pci_dma_buf_pin,
+	.unpin = vfio_pci_dma_buf_unpin,
+	.release = vfio_pci_dma_buf_release,
+	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+	.mmap = vfio_pci_dma_buf_mmap,
+};
+
+static int check_dma_ranges(struct vfio_pci_dma_buf *priv,
+			    uint64_t *dmabuf_size)
+{
+	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
+	struct pci_dev *pdev = priv->vdev->pdev;
+	resource_size_t bar_size;
+	int i;
+
+	for (i = 0; i < priv->nr_ranges; i++) {
+		/*
+		 * For PCI the region_index is the BAR number like
+		 * everything else.
+		 */
+		if (dma_ranges[i].region_index >= VFIO_PCI_ROM_REGION_INDEX)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(dma_ranges[i].offset, PAGE_SIZE) ||
+		    !IS_ALIGNED(dma_ranges[i].length, PAGE_SIZE))
+			return -EINVAL;
+
+		bar_size = pci_resource_len(pdev, dma_ranges[i].region_index);
+		if (dma_ranges[i].offset > bar_size ||
+		    dma_ranges[i].offset + dma_ranges[i].length > bar_size)
+			return -EINVAL;
+
+		*dmabuf_size += dma_ranges[i].length;
+	}
+
+	return 0;
+}
+
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz)
+{
+	struct vfio_device_feature_dma_buf get_dma_buf;
+	struct vfio_region_dma_range *dma_ranges;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct vfio_pci_dma_buf *priv;
+	uint64_t dmabuf_size = 0;
+	int ret;
+
+	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
+				 sizeof(get_dma_buf));
+	if (ret != 1)
+		return ret;
+
+	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
+		return -EFAULT;
+
+	dma_ranges = memdup_array_user(&arg->dma_ranges,
+				      get_dma_buf.nr_ranges,
+				      sizeof(*dma_ranges));
+	if (IS_ERR(dma_ranges))
+		return PTR_ERR(dma_ranges);
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		kfree(dma_ranges);
+		return -ENOMEM;
+	}
+
+	priv->vdev = vdev;
+	priv->nr_ranges = get_dma_buf.nr_ranges;
+	priv->dma_ranges = dma_ranges;
+
+	ret = check_dma_ranges(priv, &dmabuf_size);
+	if (ret)
+		goto err_free_priv;
+
+	if (!vfio_device_try_get_registration(&vdev->vdev)) {
+		ret = -ENODEV;
+		goto err_free_priv;
+	}
+
+	exp_info.ops = &vfio_pci_dmabuf_ops;
+	exp_info.size = dmabuf_size;
+	exp_info.flags = get_dma_buf.open_flags;
+	exp_info.priv = priv;
+
+	priv->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(priv->dmabuf)) {
+		ret = PTR_ERR(priv->dmabuf);
+		goto err_dev_put;
+	}
+
+	/* dma_buf_put() now frees priv */
+	INIT_LIST_HEAD(&priv->dmabufs_elm);
+	down_write(&vdev->memory_lock);
+	dma_resv_lock(priv->dmabuf->resv, NULL);
+	priv->revoked = !__vfio_pci_memory_enabled(vdev);
+	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
+	dma_resv_unlock(priv->dmabuf->resv);
+	up_write(&vdev->memory_lock);
+
+	/*
+	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
+	 * will be released.
+	 */
+	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
+
+err_dev_put:
+	vfio_device_put_registration(&vdev->vdev);
+err_free_priv:
+	kfree(dma_ranges);
+	kfree(priv);
+	return ret;
+}
+
+static void revoke_mmap_mappings(struct vfio_pci_dma_buf *priv)
+{
+	struct inode *inode = file_inode(priv->dmabuf->file);
+
+	unmap_mapping_range(inode->i_mapping, 0, priv->dmabuf->size, true);
+}
+
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+
+	lockdep_assert_held_write(&vdev->memory_lock);
+
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		/*
+		 * Returns true if a reference was successfully obtained.
+		 * The caller must interlock with the dmabuf's release
+		 * function in some way, such as RCU, to ensure that this
+		 * is not called on freed memory.
+		 */
+		if (!get_file_rcu(&priv->dmabuf->file))
+			continue;
+
+		if (priv->revoked != revoked) {
+			dma_resv_lock(priv->dmabuf->resv, NULL);
+			priv->revoked = revoked;
+			dma_buf_move_notify(priv->dmabuf);
+
+			if (revoked)
+				revoke_mmap_mappings(priv);
+
+			dma_resv_unlock(priv->dmabuf->resv);
+		}
+		dma_buf_put(priv->dmabuf);
+	}
+}
+
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
+{
+	struct vfio_pci_dma_buf *priv;
+	struct vfio_pci_dma_buf *tmp;
+
+	down_write(&vdev->memory_lock);
+	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+		if (!get_file_rcu(&priv->dmabuf->file))
+			continue;
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		list_del_init(&priv->dmabufs_elm);
+		priv->vdev = NULL;
+		priv->revoked = true;
+		dma_buf_move_notify(priv->dmabuf);
+		revoke_mmap_mappings(priv);
+		dma_resv_unlock(priv->dmabuf->resv);
+		vfio_device_put_registration(&vdev->vdev);
+		dma_buf_put(priv->dmabuf);
+	}
+	up_write(&vdev->memory_lock);
+}
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 97422aafaa7b..5cd7ec4b5e40 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -585,10 +585,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
 		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
 
-		if (!new_mem)
+		if (!new_mem) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
-		else
+			vfio_pci_dma_buf_move(vdev, true);
+		} else {
 			down_write(&vdev->memory_lock);
+		}
 
 		/*
 		 * If the user is writing mem/io enable (new_mem/io) and we
@@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		*virt_cmd &= cpu_to_le16(~mask);
 		*virt_cmd |= cpu_to_le16(new_cmd & mask);
 
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
 		up_write(&vdev->memory_lock);
 	}
 
@@ -703,12 +707,16 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
 static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
 					  pci_power_t state)
 {
-	if (state >= PCI_D3hot)
+	if (state >= PCI_D3hot) {
 		vfio_pci_zap_and_down_write_memory_lock(vdev);
-	else
+		vfio_pci_dma_buf_move(vdev, true);
+	} else {
 		down_write(&vdev->memory_lock);
+	}
 
 	vfio_pci_set_power_state(vdev, state);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 }
 
@@ -896,7 +904,10 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 
 		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
+			if (__vfio_pci_memory_enabled(vdev))
+				vfio_pci_dma_buf_move(vdev, true);
 			up_write(&vdev->memory_lock);
 		}
 	}
@@ -978,7 +989,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 
 		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
+			if (__vfio_pci_memory_enabled(vdev))
+				vfio_pci_dma_buf_move(vdev, true);
 			up_write(&vdev->memory_lock);
 		}
 	}
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 3282ef2dddea..154129133d5e 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -291,6 +291,8 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * semaphore.
 	 */
 	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	vfio_pci_dma_buf_move(vdev, true);
+
 	if (vdev->pm_runtime_engaged) {
 		up_write(&vdev->memory_lock);
 		return -EINVAL;
@@ -374,6 +376,8 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
 	 */
 	down_write(&vdev->memory_lock);
 	__vfio_pci_runtime_pm_exit(vdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 }
 
@@ -694,6 +698,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 #endif
 	vfio_pci_core_disable(vdev);
 
+	vfio_pci_dma_buf_cleanup(vdev);
+
 	mutex_lock(&vdev->igate);
 	if (vdev->err_trigger) {
 		eventfd_ctx_put(vdev->err_trigger);
@@ -1238,7 +1244,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);
 
+	vfio_pci_dma_buf_move(vdev, true);
 	ret = pci_try_reset_function(vdev->pdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 
 	return ret;
@@ -1527,6 +1536,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
 		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF:
+		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -2077,6 +2088,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
 	INIT_LIST_HEAD(&vdev->dummy_resources_list);
 	INIT_LIST_HEAD(&vdev->ioeventfds_list);
 	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
+	INIT_LIST_HEAD(&vdev->dmabufs);
 	init_rwsem(&vdev->memory_lock);
 	xa_init(&vdev->ctx);
 
@@ -2459,11 +2471,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 	 * cause the PCI config space reset without restoring the original
 	 * state (saved locally in 'vdev->pm_save').
 	 */
-	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
+	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list) {
+		vfio_pci_dma_buf_move(vdev, true);
 		vfio_pci_set_power_state(vdev, PCI_D0);
+	}
 
 	ret = pci_reset_bus(pdev);
 
+	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
+
 	vdev = list_last_entry(&dev_set->device_list,
 			       struct vfio_pci_core_device, vdev.dev_set_list);
 
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 5e4fa69aee16..09d3c300918c 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -101,4 +101,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
 	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
 }
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz);
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
+#else
+static int
+vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+			      struct vfio_device_feature_dma_buf __user *arg,
+			      size_t argsz)
+{
+	return -ENOTTY;
+}
+static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
+{
+}
+static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
+					 bool revoked)
+{
+}
+#endif
+
 #endif
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index f87067438ed4..3756e0904de2 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -94,6 +94,7 @@ struct vfio_pci_core_device {
 	struct vfio_pci_core_device	*sriov_pf_core_dev;
 	struct notifier_block	nb;
 	struct rw_semaphore	memory_lock;
+	struct list_head	dmabufs;
 };
 
 /* Will be exported for vfio pci drivers usage */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 2b68e6cdf190..6f283dadacb7 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1458,6 +1458,31 @@ struct vfio_device_feature_bus_master {
 };
 #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
 
+/**
+ * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
+ * regions selected.
+ *
+ * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
+ * etc. offset/length specify a slice of the region to create the dmabuf from.
+ * nr_ranges is the total number of (P2P DMA) ranges that comprise the dmabuf.
+ *
+ * Return: The fd number on success, -1 and errno is set on failure.
+ */
+#define VFIO_DEVICE_FEATURE_DMA_BUF 11
+
+struct vfio_region_dma_range {
+	__u32	region_index;
+	__u32	__pad;
+	__u64	offset;
+	__u64	length;
+};
+
+struct vfio_device_feature_dma_buf {
+	__u32	open_flags;
+	__u32	nr_ranges;
+	struct vfio_region_dma_range dma_ranges[];
+};
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.45.1

