Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD804C3BA56
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037F10E900;
	Thu,  6 Nov 2025 14:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qSfbrYle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79A910E8FD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4496F60232;
 Thu,  6 Nov 2025 14:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CACC19423;
 Thu,  6 Nov 2025 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762438665;
 bh=Ysr30Sn5K0VIh/QChgAA+mxNzBcIIHvszbujsNqJTIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qSfbrYleS0pgRnWFVOVVECfkmFN3RhXDUr/qoNyfh3zGJM1uA2s4UV18MtwOik7ka
 O4/CuPI1n6UVPro/r9Jyh/hs/0aO7rlsmwPkiXVCMLbBw0Bh9xwKkhVFBUffXCLwUj
 5b8B6F2h7nhjNngQA8Rq0R9L5064vJnmjKlDemXUyy2OEQdvyHHjaucrxksP26KgZ1
 rnT5Ep8vEinwOQ7uBWN57R2mEmsTM9V47wfGBgzEwiHvgH4i9Rv0SMKteBvBGq3dty
 +GPOfSKQdiHbe2RpZM3uiqyZNrzu0UXvfyY38PqqqLZdXOqMkkKwxarubXjozUjpZ3
 7AN5yEPxfo5Kg==
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
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH v7 11/11] vfio/nvgrace: Support get_dmabuf_phys
Date: Thu,  6 Nov 2025 16:16:56 +0200
Message-ID: <20251106-dmabuf-vfio-v7-11-2503bf390699@nvidia.com>
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

From: Jason Gunthorpe <jgg@nvidia.com>

Call vfio_pci_core_fill_phys_vec() with the proper physical ranges for the
synthetic BAR 2 and BAR 4 regions. Otherwise use the normal flow based on
the PCI bar.

This demonstrates a DMABUF that follows the region info report to only
allow mapping parts of the region that are mmapable. Since the BAR is
power of two sized and the "CXL" region is just page aligned the there can
be a padding region at the end that is not mmaped or passed into the
DMABUF.

The "CXL" ranges that are remapped into BAR 2 and BAR 4 areas are not PCI
MMIO, they actually run over the CXL-like coherent interconnect and for
the purposes of DMA behave identically to DRAM. We don't try to model this
distinction between true PCI BAR memory that takes a real PCI path and the
"CXL" memory that takes a different path in the p2p framework for now.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Alex Mastro <amastro@fb.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/nvgrace-gpu/main.c | 56 +++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index e346392b72f6..7d7ab2c84018 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -7,6 +7,7 @@
 #include <linux/vfio_pci_core.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
+#include <linux/pci-p2pdma.h>
 
 /*
  * The device memory usable to the workloads running in the VM is cached
@@ -683,6 +684,54 @@ nvgrace_gpu_write(struct vfio_device *core_vdev,
 	return vfio_pci_core_write(core_vdev, buf, count, ppos);
 }
 
+static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
+				   struct p2pdma_provider **provider,
+				   unsigned int region_index,
+				   struct dma_buf_phys_vec *phys_vec,
+				   struct vfio_region_dma_range *dma_ranges,
+				   size_t nr_ranges)
+{
+	struct nvgrace_gpu_pci_core_device *nvdev = container_of(
+		core_vdev, struct nvgrace_gpu_pci_core_device, core_device);
+	struct pci_dev *pdev = core_vdev->pdev;
+
+	if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
+		/*
+		 * The P2P properties of the non-BAR memory is the same as the
+		 * BAR memory, so just use the provider for index 0. Someday
+		 * when CXL gets P2P support we could create CXLish providers
+		 * for the non-BAR memory.
+		 */
+		*provider = pcim_p2pdma_provider(pdev, 0);
+		if (!*provider)
+			return -EINVAL;
+		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
+						   nr_ranges,
+						   nvdev->resmem.memphys,
+						   nvdev->resmem.memlength);
+	} else if (region_index == USEMEM_REGION_INDEX) {
+		/*
+		 * This is actually cachable memory and isn't treated as P2P in
+		 * the chip. For now we have no way to push cachable memory
+		 * through everything and the Grace HW doesn't care what caching
+		 * attribute is programmed into the SMMU. So use BAR 0.
+		 */
+		*provider = pcim_p2pdma_provider(pdev, 0);
+		if (!*provider)
+			return -EINVAL;
+		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
+						   nr_ranges,
+						   nvdev->usemem.memphys,
+						   nvdev->usemem.memlength);
+	}
+	return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
+					     phys_vec, dma_ranges, nr_ranges);
+}
+
+static const struct vfio_pci_device_ops nvgrace_gpu_pci_dev_ops = {
+	.get_dmabuf_phys = nvgrace_get_dmabuf_phys,
+};
+
 static const struct vfio_device_ops nvgrace_gpu_pci_ops = {
 	.name		= "nvgrace-gpu-vfio-pci",
 	.init		= vfio_pci_core_init_dev,
@@ -703,6 +752,10 @@ static const struct vfio_device_ops nvgrace_gpu_pci_ops = {
 	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 };
 
+static const struct vfio_pci_device_ops nvgrace_gpu_pci_dev_core_ops = {
+	.get_dmabuf_phys = vfio_pci_core_get_dmabuf_phys,
+};
+
 static const struct vfio_device_ops nvgrace_gpu_pci_core_ops = {
 	.name		= "nvgrace-gpu-vfio-pci-core",
 	.init		= vfio_pci_core_init_dev,
@@ -965,6 +1018,9 @@ static int nvgrace_gpu_probe(struct pci_dev *pdev,
 						    memphys, memlength);
 		if (ret)
 			goto out_put_vdev;
+		nvdev->core_device.pci_ops = &nvgrace_gpu_pci_dev_ops;
+	} else {
+		nvdev->core_device.pci_ops = &nvgrace_gpu_pci_dev_core_ops;
 	}
 
 	ret = vfio_pci_core_register_device(&nvdev->core_device);

-- 
2.51.1

