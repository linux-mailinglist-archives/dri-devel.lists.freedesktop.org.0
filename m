Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FAEB1A284
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 15:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9F410E50E;
	Mon,  4 Aug 2025 13:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EckcSGki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C6F10E513
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 13:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D10FA558E4;
 Mon,  4 Aug 2025 13:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A3C4CEF0;
 Mon,  4 Aug 2025 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754312497;
 bh=/BbRG9KlrveH/njZbFOIevsKMyAUr9+pk2igE0RXJZk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EckcSGkixZyZTiI9bPy/oFQaXMSXOt0HmOz9LTu4nv1bLeHjnwwjwkifQu/lVh+Bm
 YHSazs6F3zjYU84isNIdpmtdV5/utoG6BIM1HzH07vzMw/ziC02FhqriUM2ShXg7AM
 tGlgZLMSbeeTIws81k5l9PmQ0U/Shsf3Xxcg58WutWN0woQoFKVv9e6V1tsIfIbY9i
 yABhd9PCQ+G/tcLie3UxBmhwH0dr9L+hbPVrRztJ7/FK7bYFrP2YEEqktl9JJsbUCi
 iCE6+zR5zt6qRGVryPaOQVR9I5eCbxjzXLWNOpkVgomeJ5AeR4e4ZfifwAMaS+tmwp
 tZ+ZE6/Lmfa3A==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v1 10/10] vfio/pci: Add dma-buf export support for MMIO regions
Date: Mon,  4 Aug 2025 16:00:45 +0300
Message-ID: <5e043d8b95627441db6156e7f15e6e1658e9d537.1754311439.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754311439.git.leon@kernel.org>
References: <cover.1754311439.git.leon@kernel.org>
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

From: Leon Romanovsky <leonro@nvidia.com>

Add support for exporting PCI device MMIO regions through dma-buf,
enabling safe sharing of non-struct page memory with controlled
lifetime management. This allows RDMA and other subsystems to import
dma-buf FDs and build them into memory regions for PCI P2P operations.

The implementation provides a revocable attachment mechanism using
dma-buf move operations. MMIO regions are normally pinned as BARs
don't change physical addresses, but access is revoked when the VFIO
device is closed or a PCI reset is issued. This ensures kernel
self-defense against potentially hostile userspace.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/Kconfig           |  20 ++
 drivers/vfio/pci/Makefile          |   2 +
 drivers/vfio/pci/vfio_pci_config.c |  22 +-
 drivers/vfio/pci/vfio_pci_core.c   |  25 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 390 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
 include/linux/dma-buf.h            |   1 +
 include/linux/vfio_pci_core.h      |   3 +
 include/uapi/linux/vfio.h          |  25 ++
 9 files changed, 506 insertions(+), 5 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..55ae888bf26ae 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
 
 	  To enable s390x KVM vfio-pci extensions, say Y.
 
+config VFIO_PCI_DMABUF
+	bool "VFIO PCI extensions for DMA-BUF"
+	depends on VFIO_PCI_CORE
+	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
+	default y
+	help
+	  Enable support for VFIO PCI extensions that allow exporting
+	  device MMIO regions as DMA-BUFs for peer devices to access via
+	  peer-to-peer (P2P) DMA.
+
+	  This feature enables a VFIO-managed PCI device to export a portion
+	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
+	  to other userspace drivers or kernel subsystems capable of
+	  initiating DMA to that region.
+
+	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
+	  support for peer-to-peer DMA use cases.
+
+	  If unsure, say N.
+
 source "drivers/vfio/pci/mlx5/Kconfig"
 
 source "drivers/vfio/pci/hisilicon/Kconfig"
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f9155e9c5f630 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,7 +2,9 @@
 
 vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
+
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
+vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
 
 vfio-pci-y := vfio_pci.o
 vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 8f02f236b5b4b..7e23387a43b4d 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -589,10 +589,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
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
@@ -627,6 +629,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		*virt_cmd &= cpu_to_le16(~mask);
 		*virt_cmd |= cpu_to_le16(new_cmd & mask);
 
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
 		up_write(&vdev->memory_lock);
 	}
 
@@ -707,12 +711,16 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
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
 
@@ -900,7 +908,10 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 
 		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
+			if (__vfio_pci_memory_enabled(vdev))
+				vfio_pci_dma_buf_move(vdev, true);
 			up_write(&vdev->memory_lock);
 		}
 	}
@@ -982,7 +993,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 
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
index b1863d84b11aa..8e840ac413e9b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -28,7 +28,9 @@
 #include <linux/nospec.h>
 #include <linux/sched/mm.h>
 #include <linux/iommufd.h>
+#ifdef CONFIG_VFIO_PCI_DMABUF
 #include <linux/pci-p2pdma.h>
+#endif
 #if IS_ENABLED(CONFIG_EEH)
 #include <asm/eeh.h>
 #endif
@@ -287,6 +289,8 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * semaphore.
 	 */
 	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	vfio_pci_dma_buf_move(vdev, true);
+
 	if (vdev->pm_runtime_engaged) {
 		up_write(&vdev->memory_lock);
 		return -EINVAL;
@@ -370,6 +374,8 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
 	 */
 	down_write(&vdev->memory_lock);
 	__vfio_pci_runtime_pm_exit(vdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 }
 
@@ -690,6 +696,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 #endif
 	vfio_pci_core_disable(vdev);
 
+	vfio_pci_dma_buf_cleanup(vdev);
+
 	mutex_lock(&vdev->igate);
 	if (vdev->err_trigger) {
 		eventfd_ctx_put(vdev->err_trigger);
@@ -1222,7 +1230,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);
 
+	vfio_pci_dma_buf_move(vdev, true);
 	ret = pci_try_reset_function(vdev->pdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 
 	return ret;
@@ -1511,6 +1522,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
 		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF:
+		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -2085,9 +2098,13 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
 	INIT_LIST_HEAD(&vdev->dummy_resources_list);
 	INIT_LIST_HEAD(&vdev->ioeventfds_list);
 	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
+#ifdef CONFIG_VFIO_PCI_DMABUF
 	vdev->provider = pci_p2pdma_enable(vdev->pdev);
 	if (IS_ERR(vdev->provider))
 		return PTR_ERR(vdev->provider);
+
+	INIT_LIST_HEAD(&vdev->dmabufs);
+#endif
 	init_rwsem(&vdev->memory_lock);
 	xa_init(&vdev->ctx);
 
@@ -2470,11 +2487,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
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
 
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
new file mode 100644
index 0000000000000..74ec05935d50a
--- /dev/null
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES.
+ */
+#include <linux/dma-buf.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+
+#include "vfio_pci_priv.h"
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+struct vfio_pci_dma_buf {
+	struct dma_buf *dmabuf;
+	struct vfio_pci_core_device *vdev;
+	struct list_head dmabufs_elm;
+	size_t size;
+	struct phys_vec *phys_vec;
+	u32 nr_ranges;
+	u8 revoked : 1;
+};
+
+static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attachment)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	if (!attachment->peer2peer)
+		return -EOPNOTSUPP;
+
+	if (priv->revoked)
+		return -ENODEV;
+
+	switch (pci_p2pdma_map_type(priv->vdev->provider, attachment->dev)) {
+	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
+		break;
+	case PCI_P2PDMA_MAP_BUS_ADDR:
+		/*
+		 * There is no need in IOVA at all for this flow.
+		 * We rely on attachment->priv == NULL as a marker
+		 * for this mode.
+		 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+
+	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
+	if (!attachment->priv)
+		return -ENOMEM;
+
+	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->size);
+	return 0;
+}
+
+static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
+				    struct dma_buf_attachment *attachment)
+{
+	kfree(attachment->priv);
+}
+
+static void fill_sg_entry(struct scatterlist *sgl, unsigned int length,
+			 dma_addr_t addr)
+{
+	/*
+	 * Follow the DMABUF rules for scatterlist, the struct page can be
+	 * NULL'd for MMIO only memort.
+	 */
+	sg_set_page(sgl, NULL, length, 0);
+	sg_dma_address(sgl) = addr;
+	sg_dma_len(sgl) = length;
+}
+
+static struct sg_table *
+vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
+		     enum dma_data_direction dir)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct p2pdma_provider *provider = priv->vdev->provider;
+	struct dma_iova_state *state = attachment->priv;
+	struct phys_vec *phys_vec = priv->phys_vec;
+	unsigned long attrs = DMA_ATTR_MMIO;
+	unsigned int mapped_len = 9;
+	struct scatterlist *sgl;
+	struct sg_table *sgt;
+	dma_addr_t addr;
+	int ret, i;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL | __GFP_ZERO);
+	if (ret)
+		goto err_kfree_sgt;
+
+	sgl = sgt->sgl;
+
+	for (i = 0; i < priv->nr_ranges; i++) {
+		if (!state) {
+			addr = pci_p2pdma_bus_addr_map(provider,
+						       phys_vec[i].paddr);
+		} else if (dma_use_iova(state)) {
+			ret = dma_iova_link(attachment->dev, state,
+					    phys_vec[i].paddr, 0,
+					    phys_vec[i].len, dir, attrs);
+			if (ret)
+				goto err_unmap_dma;
+
+			mapped_len += phys_vec[i].len;
+		} else {
+			addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
+					    phys_vec[i].len, dir, attrs);
+			ret = dma_mapping_error(attachment->dev, addr);
+			if (ret)
+				goto err_unmap_dma;
+		}
+
+		if (!state || !dma_use_iova(state)) {
+			/*
+			 * In IOVA case, there is only one SG entry which spans
+			 * for whole IOVA address space. So there is no need
+			 * to call to sg_next() here.
+			 */
+			fill_sg_entry(sgl, phys_vec[i].len, addr);
+			sgl = sg_next(sgl);
+		}
+	}
+
+	if (state && dma_use_iova(state)) {
+		WARN_ON_ONCE(mapped_len != priv->size);
+		ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);
+		if (ret)
+			goto err_unmap_dma;
+		fill_sg_entry(sgl, mapped_len, state->addr);
+	}
+
+	return sgt;
+
+err_unmap_dma:
+	if (!i || !state)
+		; /* Do nothing */
+	else if (dma_use_iova(state))
+		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
+				 attrs);
+	else
+		for_each_sgtable_dma_sg(sgt, sgl, i)
+			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
+					sg_dma_len(sgl), dir, attrs);
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
+	struct dma_iova_state *state = attachment->priv;
+	unsigned long attrs = DMA_ATTR_MMIO;
+	struct scatterlist *sgl;
+	int i;
+
+	if (!state)
+		; /* Do nothing */
+	else if (dma_use_iova(state))
+		dma_iova_destroy(attachment->dev, state, priv->size, dir,
+				 attrs);
+	else
+		for_each_sgtable_dma_sg(sgt, sgl, i)
+			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
+				       sg_dma_len(sgl), dir, attrs);
+
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
+	kfree(priv->phys_vec);
+	kfree(priv);
+}
+
+static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+	.attach = vfio_pci_dma_buf_attach,
+	.detach = vfio_pci_dma_buf_detach,
+	.map_dma_buf = vfio_pci_dma_buf_map,
+	.release = vfio_pci_dma_buf_release,
+	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+};
+
+static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
+				   struct vfio_device_feature_dma_buf *dma_buf,
+				   struct vfio_region_dma_range *dma_ranges)
+{
+	struct pci_dev *pdev = priv->vdev->pdev;
+	phys_addr_t pci_start;
+	int i;
+
+	pci_start = pci_resource_start(pdev, dma_buf->region_index);
+	for (i = 0; i < dma_buf->nr_ranges; i++) {
+		priv->phys_vec[i].len = dma_ranges[i].length;
+		priv->phys_vec[i].paddr += pci_start + dma_ranges[i].offset;
+		priv->size += priv->phys_vec[i].len;
+	}
+	priv->nr_ranges = dma_buf->nr_ranges;
+}
+
+static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
+				 struct vfio_device_feature_dma_buf *dma_buf,
+				 struct vfio_region_dma_range *dma_ranges)
+{
+	struct pci_dev *pdev = vdev->pdev;
+	u32 bar = dma_buf->region_index;
+	resource_size_t bar_size;
+	u64 sum;
+	int i;
+
+	if (dma_buf->flags)
+		return -EINVAL;
+	/*
+	 * For PCI the region_index is the BAR number like  everything else.
+	 */
+	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
+		return -ENODEV;
+
+	if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+		return -EINVAL;
+
+	bar_size = pci_resource_len(pdev, bar);
+	for (i = 0; i < dma_buf->nr_ranges; i++) {
+		u64 offset = dma_ranges[i].offset;
+		u64 len = dma_ranges[i].length;
+
+		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
+			return -EINVAL;
+
+		if (check_add_overflow(offset, len, &sum) || sum > bar_size)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz)
+{
+	struct vfio_device_feature_dma_buf get_dma_buf = {};
+	struct vfio_region_dma_range *dma_ranges;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct vfio_pci_dma_buf *priv;
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
+	if (!get_dma_buf.nr_ranges)
+		return -EINVAL;
+
+	dma_ranges = memdup_array_user(&arg->dma_ranges, get_dma_buf.nr_ranges,
+				       sizeof(*dma_ranges));
+	if (IS_ERR(dma_ranges))
+		return PTR_ERR(dma_ranges);
+
+	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges);
+	if (ret)
+		return ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err_free_ranges;
+	}
+	priv->phys_vec = kcalloc(get_dma_buf.nr_ranges, sizeof(*priv->phys_vec),
+				 GFP_KERNEL);
+	if (!priv->phys_vec) {
+		ret = -ENOMEM;
+		goto err_free_priv;
+	}
+
+	priv->vdev = vdev;
+	dma_ranges_to_p2p_phys(priv, &get_dma_buf, dma_ranges);
+	kfree(dma_ranges);
+	dma_ranges = NULL;
+
+	if (!vfio_device_try_get_registration(&vdev->vdev)) {
+		ret = -ENODEV;
+		goto err_free_phys;
+	}
+
+	exp_info.ops = &vfio_pci_dmabuf_ops;
+	exp_info.size = priv->size;
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
+err_free_phys:
+	kfree(priv->phys_vec);
+err_free_priv:
+	kfree(priv);
+err_free_ranges:
+	kfree(dma_ranges);
+	return ret;
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
+		if (!get_file_active(&priv->dmabuf->file))
+			continue;
+
+		if (priv->revoked != revoked) {
+			dma_resv_lock(priv->dmabuf->resv, NULL);
+			priv->revoked = revoked;
+			dma_buf_move_notify(priv->dmabuf);
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
+		if (!get_file_active(&priv->dmabuf->file))
+			continue;
+
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		list_del_init(&priv->dmabufs_elm);
+		priv->vdev = NULL;
+		priv->revoked = true;
+		dma_buf_move_notify(priv->dmabuf);
+		dma_resv_unlock(priv->dmabuf->resv);
+		vfio_device_put_registration(&vdev->vdev);
+		dma_buf_put(priv->dmabuf);
+	}
+	up_write(&vdev->memory_lock);
+}
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index a9972eacb2936..28a405f8b97c9 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -107,4 +107,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
 	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
 }
 
+#ifdef CONFIG_VFIO_PCI_DMABUF
+int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
+				  struct vfio_device_feature_dma_buf __user *arg,
+				  size_t argsz);
+void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
+#else
+static inline int
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
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e71..f14b413aae48d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -483,6 +483,7 @@ struct dma_buf_attach_ops {
  * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @peer2peer: true if the importer can handle peer resources without pages.
+ * #state: DMA structure to provide support for physical addresses DMA interface
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index b017fae251811..548cbb51bf146 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -94,7 +94,10 @@ struct vfio_pci_core_device {
 	struct vfio_pci_core_device	*sriov_pf_core_dev;
 	struct notifier_block	nb;
 	struct rw_semaphore	memory_lock;
+#ifdef CONFIG_VFIO_PCI_DMABUF
 	struct p2pdma_provider  *provider;
+	struct list_head	dmabufs;
+#endif
 };
 
 /* Will be exported for vfio pci drivers usage */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 5764f315137f9..89f86dd2dffb2 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1468,6 +1468,31 @@ struct vfio_device_feature_bus_master {
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
+	__u64 offset;
+	__u64 length;
+};
+
+struct vfio_device_feature_dma_buf {
+	__u32	region_index;
+	__u32	open_flags;
+	__u32   flags;
+	__u32   nr_ranges;
+	struct vfio_region_dma_range dma_ranges[];
+};
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.50.1

