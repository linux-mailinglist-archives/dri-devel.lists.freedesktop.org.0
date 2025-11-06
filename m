Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E7C3BA4D
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17A10E8FC;
	Thu,  6 Nov 2025 14:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BMjS+u4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29F910E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:17:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0D94A6023A;
 Thu,  6 Nov 2025 14:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63DCC116C6;
 Thu,  6 Nov 2025 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762438658;
 bh=OkrmVTlPth9IyuIP4yCAplgc2YgJ5hCGI2gA/jkMiR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMjS+u4Arwgz6AnYsxSJEb9/ivitBYKgLPrLLpdo80MceS62fJmYV5K2eHXiuKGph
 PMhT2VR0N5SjcdO2N3zXNtDp9Lx8Nj0+ysJpvrhOgkL5mQ6c6fHJXL39A18YWdYkkj
 5P0ccL3DcNBckqteNKWLKi/sX8CZbRyZc1PrT5913Tms6PE0/WAaW1in3sKLqvTYka
 wqv+XJi6CJ1km+ohk7+C1JJH0mtVHq3EODYw3dSAHdQDrs7C63sgNbMdLkzDeb0pJn
 m1icrpR4YNVUGjV1eXi1L8Ax64K43CWixFJh57wXre3SIptAFyQoibKnqnfEfFHZ6X
 3QvauY8C5udlw==
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v7 10/11] vfio/pci: Add dma-buf export support for MMIO regions
Date: Thu,  6 Nov 2025 16:16:55 +0200
Message-ID: <20251106-dmabuf-vfio-v7-10-2503bf390699@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-3ae27
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

Currently VFIO can take MMIO regions from the device's BAR and map
them into a PFNMAP VMA with special PTEs. This mapping type ensures
the memory cannot be used with things like pin_user_pages(), hmm, and
so on. In practice only the user process CPU and KVM can safely make
use of these VMA. When VFIO shuts down these VMAs are cleaned by
unmap_mapping_range() to prevent any UAF of the MMIO beyond driver
unbind.

However, VFIO type 1 has an insecure behavior where it uses
follow_pfnmap_*() to fish a MMIO PFN out of a VMA and program it back
into the IOMMU. This has a long history of enabling P2P DMA inside
VMs, but has serious lifetime problems by allowing a UAF of the MMIO
after the VFIO driver has been unbound.

Introduce DMABUF as a new safe way to export a FD based handle for the
MMIO regions. This can be consumed by existing DMABUF importers like
RDMA or DRM without opening an UAF. A following series will add an
importer to iommufd to obsolete the type 1 code and allow safe
UAF-free MMIO P2P in VM cases.

DMABUF has a built in synchronous invalidation mechanism called
move_notify. VFIO keeps track of all drivers importing its MMIO and
can invoke a synchronous invalidation callback to tell the importing
drivers to DMA unmap and forget about the MMIO pfns. This process is
being called revoke. This synchronous invalidation fully prevents any
lifecycle problems. VFIO will do this before unbinding its driver
ensuring there is no UAF of the MMIO beyond the driver lifecycle.

Further, VFIO has additional behavior to block access to the MMIO
during things like Function Level Reset. This is because some poor
platforms may experience a MCE type crash when touching MMIO of a PCI
device that is undergoing a reset. Today this is done by using
unmap_mapping_range() on the VMAs. Extend that into the DMABUF world
and temporarily revoke the MMIO from the DMABUF importers during FLR
as well. This will more robustly prevent an errant P2P from possibly
upsetting the platform.

A DMABUF FD is a preferred handle for MMIO compared to using something
like a pgmap because:
 - VFIO is supported, including its P2P feature, on archs that don't
   support pgmap
 - PCI devices have all sorts of BAR sizes, including ones smaller
   than a section so a pgmap cannot always be created
 - It is undesirable to waste a lot of memory for struct pages,
   especially for a case like a GPU with ~100GB of BAR size
 - We want a synchronous revoke semantic to support FLR with light
   hardware requirements

Use the P2P subsystem to help generate the DMA mapping. This is a
significant upgrade over the abuse of dma_map_resource() that has
historically been used by DMABUF exporters. Experience with an OOT
version of this patch shows that real systems do need this. This
approach deals with all the P2P scenarios:
 - Non-zero PCI bus_offset
 - ACS flags routing traffic to the IOMMU
 - ACS flags that bypass the IOMMU - though vfio noiommu is required
   to hit this.

There will be further work to formalize the revoke semantic in
DMABUF. For now this acts like a move_notify dynamic exporter where
importer fault handling will get a failure when they attempt to map.
This means that only fully restartable fault capable importers can
import the VFIO DMABUFs. A future revoke semantic should open this up
to more HW as the HW only needs to invalidate, not handle restartable
faults.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/Kconfig           |   3 +
 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/vfio_pci.c        |   5 +
 drivers/vfio/pci/vfio_pci_config.c |  22 ++-
 drivers/vfio/pci/vfio_pci_core.c   |  18 ++-
 drivers/vfio/pci/vfio_pci_dmabuf.c | 315 +++++++++++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  23 +++
 include/linux/vfio_pci_core.h      |  42 +++++
 include/uapi/linux/vfio.h          |  28 ++++
 9 files changed, 452 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f54665..2b9fca00e9e8 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -55,6 +55,9 @@ config VFIO_PCI_ZDEV_KVM
 
 	  To enable s390x KVM vfio-pci extensions, say Y.
 
+config VFIO_PCI_DMABUF
+	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
+
 source "drivers/vfio/pci/mlx5/Kconfig"
 
 source "drivers/vfio/pci/hisilicon/Kconfig"
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c..53f59226ae01 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,6 +2,7 @@
 
 vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
+vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
 obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
 
 vfio-pci-y := vfio_pci.o
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index ac10f14417f2..6d41cf26b539 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -147,6 +147,10 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.pasid_detach_ioas	= vfio_iommufd_physical_pasid_detach_ioas,
 };
 
+static const struct vfio_pci_device_ops vfio_pci_dev_ops = {
+	.get_dmabuf_phys = vfio_pci_core_get_dmabuf_phys,
+};
+
 static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct vfio_pci_core_device *vdev;
@@ -161,6 +165,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return PTR_ERR(vdev);
 
 	dev_set_drvdata(&pdev->dev, vdev);
+	vdev->pci_ops = &vfio_pci_dev_ops;
 	ret = vfio_pci_core_register_device(vdev);
 	if (ret)
 		goto out_put_vdev;
diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 8f02f236b5b4..1f6008eabf23 100644
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
+				vfio_pci_dma_buf_move(vdev, false);
 			up_write(&vdev->memory_lock);
 		}
 	}
@@ -982,7 +993,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 
 		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
+			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
+			if (__vfio_pci_memory_enabled(vdev))
+				vfio_pci_dma_buf_move(vdev, false);
 			up_write(&vdev->memory_lock);
 		}
 	}
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 142b84b3f225..51a3bcc26f8b 100644
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
@@ -2095,6 +2106,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
 	ret = pcim_p2pdma_init(vdev->pdev);
 	if (ret && ret != -EOPNOTSUPP)
 		return ret;
+	INIT_LIST_HEAD(&vdev->dmabufs);
 	init_rwsem(&vdev->memory_lock);
 	xa_init(&vdev->ctx);
 
@@ -2459,6 +2471,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 			break;
 		}
 
+		vfio_pci_dma_buf_move(vdev, true);
 		vfio_pci_zap_bars(vdev);
 	}
 
@@ -2487,8 +2500,11 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 
 err_undo:
 	list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
-					 vdev.dev_set_list)
+					 vdev.dev_set_list) {
+		if (__vfio_pci_memory_enabled(vdev))
+			vfio_pci_dma_buf_move(vdev, false);
 		up_write(&vdev->memory_lock);
+	}
 
 	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
 		pm_runtime_put(&vdev->pdev->dev);
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
new file mode 100644
index 000000000000..cbf502b14e3c
--- /dev/null
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -0,0 +1,315 @@
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
+	struct dma_buf_phys_vec *phys_vec;
+	struct p2pdma_provider *provider;
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
+	return 0;
+}
+
+static struct sg_table *
+vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
+		     enum dma_data_direction dir)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	return dma_buf_map(attachment, priv->provider, priv->phys_vec,
+			   priv->nr_ranges, priv->size, dir);
+}
+
+static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
+				   struct sg_table *sgt,
+				   enum dma_data_direction dir)
+{
+	dma_buf_unmap(attachment, sgt, dir);
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
+	.map_dma_buf = vfio_pci_dma_buf_map,
+	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+	.release = vfio_pci_dma_buf_release,
+};
+
+int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
+				struct vfio_region_dma_range *dma_ranges,
+				size_t nr_ranges, phys_addr_t start,
+				phys_addr_t len)
+{
+	phys_addr_t max_addr;
+	unsigned int i;
+
+	max_addr = start + len;
+	for (i = 0; i < nr_ranges; i++) {
+		phys_addr_t end;
+
+		if (!dma_ranges[i].length)
+			return -EINVAL;
+
+		if (check_add_overflow(start, dma_ranges[i].offset,
+				       &phys_vec[i].paddr) ||
+		    check_add_overflow(phys_vec[i].paddr,
+				       dma_ranges[i].length, &end))
+			return -EOVERFLOW;
+		if (end > max_addr)
+			return -EINVAL;
+
+		phys_vec[i].len = dma_ranges[i].length;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vfio_pci_core_fill_phys_vec);
+
+int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
+				  struct p2pdma_provider **provider,
+				  unsigned int region_index,
+				  struct dma_buf_phys_vec *phys_vec,
+				  struct vfio_region_dma_range *dma_ranges,
+				  size_t nr_ranges)
+{
+	struct pci_dev *pdev = vdev->pdev;
+
+	*provider = pcim_p2pdma_provider(pdev, region_index);
+	if (!*provider)
+		return -EINVAL;
+
+	return vfio_pci_core_fill_phys_vec(
+		phys_vec, dma_ranges, nr_ranges,
+		pci_resource_start(pdev, region_index),
+		pci_resource_len(pdev, region_index));
+}
+EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
+
+static int validate_dmabuf_input(struct vfio_device_feature_dma_buf *dma_buf,
+				 struct vfio_region_dma_range *dma_ranges,
+				 size_t *lengthp)
+{
+	size_t length = 0;
+	u32 i;
+
+	for (i = 0; i < dma_buf->nr_ranges; i++) {
+		u64 offset = dma_ranges[i].offset;
+		u64 len = dma_ranges[i].length;
+
+		if (!len || !PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
+			return -EINVAL;
+
+		if (check_add_overflow(length, len, &length))
+			return -EINVAL;
+	}
+
+	/*
+	 * dma_iova_try_alloc() will WARN on if userspace proposes a size that
+	 * is too big, eg with lots of ranges.
+	 */
+	if ((u64)(length) & DMA_IOVA_USE_SWIOTLB)
+		return -EINVAL;
+
+	*lengthp = length;
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
+	size_t length;
+	int ret;
+
+	if (!vdev->pci_ops->get_dmabuf_phys)
+		return -EOPNOTSUPP;
+
+	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
+				 sizeof(get_dma_buf));
+	if (ret != 1)
+		return ret;
+
+	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
+		return -EFAULT;
+
+	if (!get_dma_buf.nr_ranges || get_dma_buf.flags)
+		return -EINVAL;
+
+	/*
+	 * For PCI the region_index is the BAR number like everything else.
+	 */
+	if (get_dma_buf.region_index >= VFIO_PCI_ROM_REGION_INDEX)
+		return -ENODEV;
+
+	dma_ranges = memdup_array_user(&arg->dma_ranges, get_dma_buf.nr_ranges,
+				       sizeof(*dma_ranges));
+	if (IS_ERR(dma_ranges))
+		return PTR_ERR(dma_ranges);
+
+	ret = validate_dmabuf_input(&get_dma_buf, dma_ranges, &length);
+	if (ret)
+		goto err_free_ranges;
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
+	priv->nr_ranges = get_dma_buf.nr_ranges;
+	priv->size = length;
+	ret = vdev->pci_ops->get_dmabuf_phys(vdev, &priv->provider,
+					     get_dma_buf.region_index,
+					     priv->phys_vec, dma_ranges,
+					     priv->nr_ranges);
+	if (ret)
+		goto err_free_phys;
+
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
+	ret = dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
+	if (ret < 0)
+		goto err_dma_buf;
+	return ret;
+
+err_dma_buf:
+	dma_buf_put(priv->dmabuf);
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
+		fput(priv->dmabuf->file);
+	}
+	up_write(&vdev->memory_lock);
+}
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index a9972eacb293..28a405f8b97c 100644
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
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index f541044e42a2..c9466ba323fa 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -26,6 +26,8 @@
 
 struct vfio_pci_core_device;
 struct vfio_pci_region;
+struct p2pdma_provider;
+struct dma_buf_phys_vec;
 
 struct vfio_pci_regops {
 	ssize_t (*rw)(struct vfio_pci_core_device *vdev, char __user *buf,
@@ -49,9 +51,48 @@ struct vfio_pci_region {
 	u32				flags;
 };
 
+struct vfio_pci_device_ops {
+	int (*get_dmabuf_phys)(struct vfio_pci_core_device *vdev,
+			       struct p2pdma_provider **provider,
+			       unsigned int region_index,
+			       struct dma_buf_phys_vec *phys_vec,
+			       struct vfio_region_dma_range *dma_ranges,
+			       size_t nr_ranges);
+};
+
+#if IS_ENABLED(CONFIG_VFIO_PCI_DMABUF)
+int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
+				struct vfio_region_dma_range *dma_ranges,
+				size_t nr_ranges, phys_addr_t start,
+				phys_addr_t len);
+int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
+				  struct p2pdma_provider **provider,
+				  unsigned int region_index,
+				  struct dma_buf_phys_vec *phys_vec,
+				  struct vfio_region_dma_range *dma_ranges,
+				  size_t nr_ranges);
+#else
+static inline int
+vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
+			    struct vfio_region_dma_range *dma_ranges,
+			    size_t nr_ranges, phys_addr_t start,
+			    phys_addr_t len)
+{
+	return -EINVAL;
+}
+static inline int vfio_pci_core_get_dmabuf_phys(
+	struct vfio_pci_core_device *vdev, struct p2pdma_provider **provider,
+	unsigned int region_index, struct dma_buf_phys_vec *phys_vec,
+	struct vfio_region_dma_range *dma_ranges, size_t nr_ranges)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 struct vfio_pci_core_device {
 	struct vfio_device	vdev;
 	struct pci_dev		*pdev;
+	const struct vfio_pci_device_ops *pci_ops;
 	void __iomem		*barmap[PCI_STD_NUM_BARS];
 	bool			bar_mmap_supported[PCI_STD_NUM_BARS];
 	u8			*pci_config_map;
@@ -94,6 +135,7 @@ struct vfio_pci_core_device {
 	struct vfio_pci_core_device	*sriov_pf_core_dev;
 	struct notifier_block	nb;
 	struct rw_semaphore	memory_lock;
+	struct list_head	dmabufs;
 };
 
 /* Will be exported for vfio pci drivers usage */
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 75100bf009ba..ac2329f24141 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/ioctl.h>
+#include <linux/stddef.h>
 
 #define VFIO_API_VERSION	0
 
@@ -1478,6 +1479,33 @@ struct vfio_device_feature_bus_master {
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
+ * flags should be 0.
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
+	struct vfio_region_dma_range dma_ranges[] __counted_by(nr_ranges);
+};
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**

-- 
2.51.1

