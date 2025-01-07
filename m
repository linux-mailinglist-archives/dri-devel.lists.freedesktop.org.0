Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796BA050AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4910E7DB;
	Wed,  8 Jan 2025 02:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ax4rACUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9A10E7DB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303349; x=1767839349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0Ctyg+ZzScKG7XiWzZtdkCCkALH2qE1Urf72jJEyPc=;
 b=ax4rACUhUdkXLSGrIrxdUv7PdWzA8SW0z9ap+UaHula1maDs2x8YyTUJ
 dqgFMDcDIWou8Y6Nip00sW66FfeBtwEMTa1YbJ/LEjSpTQF2agNSg7K19
 IeMJebqNgPPUmMRmIXwhXYNyyJKTzMFDsU1Y03lneJs3AxXhpJQeAzZDa
 A0GghIHHvpHMa/Vo/tsc2uzw8FxnnTItpJHeX1jfTbvqAYaXjrWJNFQqk
 sX375VpMcy0ErwA32HdaeTa5D2l6S71Cwl4J0D8/8R+41A5FdlsZcC7FO
 WhymD/4ZLgVbZnKCQx3UsRGBH1xF+o5NZ+OyyEeiLnC5DTS10iP0mI+FX Q==;
X-CSE-ConnectionGUID: E5tSVxptQ3uj4cGy02tknA==
X-CSE-MsgGUID: 4RcB3MpHRGq8OdzDYb40pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010562"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:29:09 -0800
X-CSE-ConnectionGUID: jzF6RmRtRFWNznlKn1mnww==
X-CSE-MsgGUID: d4vAvP1EQ+mbgV8wjEZ0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793735"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:29:04 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Date: Tue,  7 Jan 2025 22:27:15 +0800
Message-Id: <20250107142719.179636-9-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
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

Add a flag for ioctl(VFIO_DEVICE_BIND_IOMMUFD) to mark a device as
for private assignment. For these private assigned devices, disallow
host accessing their MMIO resources.

Since the MMIO regions for private assignment are not accessible from
host, remove the VFIO_REGION_INFO_FLAG_MMAP/READ/WRITE for these
regions, instead add a new VFIO_REGION_INFO_FLAG_PRIVATE flag to
indicate users should create dma-buf for MMIO mapping in KVM MMU.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/device_cdev.c       |  9 ++++++++-
 drivers/vfio/pci/vfio_pci_core.c | 14 ++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h |  2 ++
 drivers/vfio/pci/vfio_pci_rdwr.c |  3 +++
 include/linux/vfio.h             |  1 +
 include/uapi/linux/vfio.h        |  5 ++++-
 6 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index bb1817bd4ff3..919285c1cd7a 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -75,7 +75,10 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 	if (copy_from_user(&bind, arg, minsz))
 		return -EFAULT;
 
-	if (bind.argsz < minsz || bind.flags || bind.iommufd < 0)
+	if (bind.argsz < minsz || bind.iommufd < 0)
+		return -EINVAL;
+
+	if (bind.flags & ~(VFIO_DEVICE_BIND_IOMMUFD_PRIVATE))
 		return -EINVAL;
 
 	/* BIND_IOMMUFD only allowed for cdev fds */
@@ -118,6 +121,9 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 		goto out_close_device;
 
 	device->cdev_opened = true;
+	if (bind.flags & VFIO_DEVICE_BIND_IOMMUFD_PRIVATE)
+		device->is_private = true;
+
 	/*
 	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
 	 * read/write/mmap
@@ -151,6 +157,7 @@ void vfio_df_unbind_iommufd(struct vfio_device_file *df)
 		return;
 
 	mutex_lock(&device->dev_set->lock);
+	device->is_private = false;
 	vfio_df_close(df);
 	vfio_device_put_kvm(device);
 	iommufd_ctx_put(df->iommufd);
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index f69eda5956ad..11c735dfe1f7 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1005,6 +1005,12 @@ static int vfio_pci_ioctl_get_info(struct vfio_pci_core_device *vdev,
 	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
 }
 
+bool is_vfio_pci_bar_private(struct vfio_pci_core_device *vdev, int bar)
+{
+	/* Any mmap supported bar can be used as vfio dmabuf */
+	return vdev->bar_mmap_supported[bar] && vdev->vdev.is_private;
+}
+
 static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
 					  struct vfio_region_info __user *arg)
 {
@@ -1035,6 +1041,11 @@ static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
 			break;
 		}
 
+		if (is_vfio_pci_bar_private(vdev, info.index)) {
+			info.flags = VFIO_REGION_INFO_FLAG_PRIVATE;
+			break;
+		}
+
 		info.flags = VFIO_REGION_INFO_FLAG_READ |
 			     VFIO_REGION_INFO_FLAG_WRITE;
 		if (vdev->bar_mmap_supported[info.index]) {
@@ -1735,6 +1746,9 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 	u64 phys_len, req_len, pgoff, req_start;
 	int ret;
 
+	if (vdev->vdev.is_private)
+		return -EINVAL;
+
 	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
 
 	if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index d27f383f3931..2b61e35145fd 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -126,4 +126,6 @@ static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
 }
 #endif
 
+bool is_vfio_pci_bar_private(struct vfio_pci_core_device *vdev, int bar);
+
 #endif
diff --git a/drivers/vfio/pci/vfio_pci_rdwr.c b/drivers/vfio/pci/vfio_pci_rdwr.c
index 66b72c289284..e385f7f63414 100644
--- a/drivers/vfio/pci/vfio_pci_rdwr.c
+++ b/drivers/vfio/pci/vfio_pci_rdwr.c
@@ -242,6 +242,9 @@ ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
 	struct resource *res = &vdev->pdev->resource[bar];
 	ssize_t done;
 
+	if (is_vfio_pci_bar_private(vdev, bar))
+		return -EINVAL;
+
 	if (pci_resource_start(pdev, bar))
 		end = pci_resource_len(pdev, bar);
 	else if (bar == PCI_ROM_RESOURCE &&
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 2258b0585330..e99d856c6cd8 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -69,6 +69,7 @@ struct vfio_device {
 	struct iommufd_device *iommufd_device;
 	u8 iommufd_attached:1;
 #endif
+	u8 is_private:1;
 	u8 cdev_opened:1;
 #ifdef CONFIG_DEBUG_FS
 	/*
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index f43dfbde7352..6a1c703e3185 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -275,6 +275,7 @@ struct vfio_region_info {
 #define VFIO_REGION_INFO_FLAG_WRITE	(1 << 1) /* Region supports write */
 #define VFIO_REGION_INFO_FLAG_MMAP	(1 << 2) /* Region supports mmap */
 #define VFIO_REGION_INFO_FLAG_CAPS	(1 << 3) /* Info supports caps */
+#define VFIO_REGION_INFO_FLAG_PRIVATE	(1 << 4) /* Region supports private MMIO */
 	__u32	index;		/* Region index */
 	__u32	cap_offset;	/* Offset within info struct of first cap */
 	__aligned_u64	size;	/* Region size (bytes) */
@@ -904,7 +905,8 @@ struct vfio_device_feature {
  * VFIO_DEVICE_BIND_IOMMUFD - _IOR(VFIO_TYPE, VFIO_BASE + 18,
  *				   struct vfio_device_bind_iommufd)
  * @argsz:	 User filled size of this data.
- * @flags:	 Must be 0.
+ * @flags:	 Optional device initialization flags:
+ *		 VFIO_DEVICE_BIND_IOMMUFD_PRIVATE:	for private assignment
  * @iommufd:	 iommufd to bind.
  * @out_devid:	 The device id generated by this bind. devid is a handle for
  *		 this device/iommufd bond and can be used in IOMMUFD commands.
@@ -921,6 +923,7 @@ struct vfio_device_feature {
 struct vfio_device_bind_iommufd {
 	__u32		argsz;
 	__u32		flags;
+#define VFIO_DEVICE_BIND_IOMMUFD_PRIVATE	(1 << 0)
 	__s32		iommufd;
 	__u32		out_devid;
 };
-- 
2.25.1

