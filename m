Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F3AC77C6
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9B10E6E0;
	Thu, 29 May 2025 05:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak6olYaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D4410E6E1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497324; x=1780033324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BZUqH7fy4jIrOBL4+ESCmWpxVOr+YN/WirSjxbsneV0=;
 b=ak6olYaGR4txb1CfCZaq2WD/ytQ6/VpvEP8SSvT16Xm83zFN3OSd52pX
 Riv8XwY4wwklbBFdqmATdYKbzLdpUUhS9G3kWTTKJDV5f05IJ3OYWuZIb
 gRkXslXiMKSsDb7d0gyNdfyH4GTDdoszgqz45LtAG3QI2NgTUqOqztLNq
 FUmbKDvbS1lJMKMKpNtlZo63tvUbfAk1LZqh9ZL/hRnDYln87IS6/DaAU
 dzgCSonMylmi/hDHTwoDGGxJXpZCpyqEbngUQqMUYJHv43a8GeXafPxI7
 ZfPrcgF24R4e3OwnqRDL79mcuyMlfG93xivOQjUM6V/0mMNTI8BuTdrcz g==;
X-CSE-ConnectionGUID: atR8BHycQ0y24hcFYadhmQ==
X-CSE-MsgGUID: ifBf47T1Tq+L7W5QD2wOxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67962943"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67962943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:42:04 -0700
X-CSE-ConnectionGUID: hJkpmOPNQM6k1HLQ2PV6HA==
X-CSE-MsgGUID: +eBON0SOS+SVZir5i6qQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443284"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:41:57 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 04/30] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Thu, 29 May 2025 13:34:47 +0800
Message-Id: <20250529053513.1592088-5-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

>From Jason Gunthorpe:
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

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/vfio_pci_config.c |  22 +-
 drivers/vfio/pci/vfio_pci_core.c   |  20 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 359 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  25 ++
 7 files changed, 446 insertions(+), 5 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c

diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c..c33ec0cbe930 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,6 +2,7 @@
 
 vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
+vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += vfio_pci_dmabuf.o
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
 
 vfio-pci-y := vfio_pci.o
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 14437396d721..efccbb2d2a42 100644
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
index adfcbc2231cb..116964057b0b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -287,6 +287,8 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * semaphore.
 	 */
 	vfio_pci_zap_and_down_write_memory_lock(vdev);
+	vfio_pci_dma_buf_move(vdev, true);
+
 	if (vdev->pm_runtime_engaged) {
 		up_write(&vdev->memory_lock);
 		return -EINVAL;
@@ -370,6 +372,8 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
 	 */
 	down_write(&vdev->memory_lock);
 	__vfio_pci_runtime_pm_exit(vdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 }
 
@@ -690,6 +694,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 #endif
 	vfio_pci_core_disable(vdev);
 
+	vfio_pci_dma_buf_cleanup(vdev);
+
 	mutex_lock(&vdev->igate);
 	if (vdev->err_trigger) {
 		eventfd_ctx_put(vdev->err_trigger);
@@ -1222,7 +1228,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	 */
 	vfio_pci_set_power_state(vdev, PCI_D0);
 
+	vfio_pci_dma_buf_move(vdev, true);
 	ret = pci_try_reset_function(vdev->pdev);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
 	up_write(&vdev->memory_lock);
 
 	return ret;
@@ -1511,6 +1520,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
 		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF:
+		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
@@ -2087,6 +2098,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
 	INIT_LIST_HEAD(&vdev->dummy_resources_list);
 	INIT_LIST_HEAD(&vdev->ioeventfds_list);
 	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
+	INIT_LIST_HEAD(&vdev->dmabufs);
 	init_rwsem(&vdev->memory_lock);
 	xa_init(&vdev->ctx);
 
@@ -2469,11 +2481,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
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
index 000000000000..a4c313ca5bda
--- /dev/null
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -0,0 +1,359 @@
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
+	unsigned int nr_ranges;
+	struct vfio_region_dma_range *dma_ranges;
+	unsigned int orig_nents;
+	bool revoked;
+};
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
+		if (!PAGE_ALIGNED(dma_ranges[i].offset) ||
+		    !PAGE_ALIGNED(dma_ranges[i].length))
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
index a9972eacb293..6f3e8eafdc35 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -107,4 +107,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
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
index fbb472dd99b3..da5d8955ae56 100644
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
index 5764f315137f..9445fa36efd3 100644
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
2.25.1

