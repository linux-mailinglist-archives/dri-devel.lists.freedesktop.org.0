Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4DAC77E5
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C09F10E6F2;
	Thu, 29 May 2025 05:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTvZXFxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD410E6F0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497422; x=1780033422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yM5Go8q551iYzcyzQ9ia7JqUoiyP6vgM15ae2CBubv0=;
 b=HTvZXFxgoUr0QJia5Xvg1M9X7Bcpl6FS7yBK3YGUVlsrp0d0yIzI373x
 gH+mwkQLCA6j1mW0x0aMd/5rgMFbKiFsBIEcudskGf7ndWGoLz+4uobrE
 7IuAY0n4jhsd4uVA6oOJlh9ehVvOmJPgPb1dje8Q6tdF2QfQLJXmFyN02
 RggdYLc0akGJ4XrOA1SbcCjbVUx6nrpcwhGSf3mXXpvfYtEwigMUKetk5
 sAQkdVXjwx5exwNHK/X/VnsnBiD59RdtMaoiJAW7UHayIg+CH+tvymRoO
 jI2laSzCtpBQWThaTed5ju3nq9cA50agjHiVZyw1qp4qXZGs+bv8937yv w==;
X-CSE-ConnectionGUID: 7BNUEutaS5OGOyVqwkb68w==
X-CSE-MsgGUID: qGPkH5OUTBKDIrIBLtgNVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963254"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963254"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:41 -0700
X-CSE-ConnectionGUID: /RMdZ+CQSgaFwpZlVfHZzQ==
X-CSE-MsgGUID: KGDFlmNISRCKp26GnMrMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443484"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:34 -0700
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
Subject: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for TEE-IO
 support
Date: Thu, 29 May 2025 13:35:02 +0800
Message-Id: <20250529053513.1592088-20-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Add new IOCTLs to do TSM based TDI bind/unbind. These IOCTLs are
expected to be called by userspace when CoCo VM issues TDI bind/unbind
command to VMM. Specifically for TDX Connect, these commands are some
secure Hypervisor call named GHCI (Guest-Hypervisor Communication
Interface).

The TSM TDI bind/unbind operations are expected to be initiated by a
running CoCo VM, which already have the legacy assigned device in place.
The TSM bind operation is to request VMM make all secure configurations
to support device work as a TDI, and then issue TDISP messages to move
the TDI to CONFIG_LOCKED or RUN state, waiting for guest's attestation.

Do TSM Unbind before vfio_pci_core_disable(), otherwise will lead
device to TDISP ERROR state.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/iommufd.c           | 22 ++++++++++
 drivers/vfio/pci/vfio_pci_core.c | 74 ++++++++++++++++++++++++++++++++
 include/linux/vfio.h             |  7 +++
 include/linux/vfio_pci_core.h    |  1 +
 include/uapi/linux/vfio.h        | 42 ++++++++++++++++++
 5 files changed, 146 insertions(+)

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 3441d24538a8..33fd20ffaeee 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -297,3 +297,25 @@ void vfio_iommufd_emulated_detach_ioas(struct vfio_device *vdev)
 	vdev->iommufd_attached = false;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_emulated_detach_ioas);
+
+int vfio_iommufd_tsm_bind(struct vfio_device *vdev, u32 vdevice_id)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (WARN_ON(!vdev->iommufd_device))
+		return -EINVAL;
+
+	return iommufd_device_tsm_bind(vdev->iommufd_device, vdevice_id);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_tsm_bind);
+
+void vfio_iommufd_tsm_unbind(struct vfio_device *vdev)
+{
+	lockdep_assert_held(&vdev->dev_set->lock);
+
+	if (WARN_ON(!vdev->iommufd_device))
+		return;
+
+	iommufd_device_tsm_unbind(vdev->iommufd_device);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_tsm_unbind);
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 116964057b0b..92544e54c9c3 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -692,6 +692,13 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 #if IS_ENABLED(CONFIG_EEH)
 	eeh_dev_release(vdev->pdev);
 #endif
+
+	if (vdev->is_tsm_bound) {
+		vfio_iommufd_tsm_unbind(&vdev->vdev);
+		pci_release_regions(vdev->pdev);
+		vdev->is_tsm_bound = false;
+	}
+
 	vfio_pci_core_disable(vdev);
 
 	vfio_pci_dma_buf_cleanup(vdev);
@@ -1447,6 +1454,69 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				  ioeventfd.fd);
 }
 
+static int vfio_pci_ioctl_tsm_bind(struct vfio_pci_core_device *vdev,
+				   void __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_pci_tsm_bind, vdevice_id);
+	struct vfio_pci_tsm_bind tsm_bind;
+	struct pci_dev *pdev = vdev->pdev;
+	int ret;
+
+	if (copy_from_user(&tsm_bind, arg, minsz))
+		return -EFAULT;
+
+	if (tsm_bind.argsz < minsz || tsm_bind.flags)
+		return -EINVAL;
+
+	mutex_lock(&vdev->vdev.dev_set->lock);
+
+	/* To ensure no host side MMIO access is possible */
+	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
+	if (ret)
+		goto out_unlock;
+
+	ret = vfio_iommufd_tsm_bind(&vdev->vdev, tsm_bind.vdevice_id);
+	if (ret)
+		goto out_release_region;
+
+	vdev->is_tsm_bound = true;
+	mutex_unlock(&vdev->vdev.dev_set->lock);
+
+	return 0;
+
+out_release_region:
+	pci_release_regions(pdev);
+out_unlock:
+	mutex_unlock(&vdev->vdev.dev_set->lock);
+	return ret;
+}
+
+static int vfio_pci_ioctl_tsm_unbind(struct vfio_pci_core_device *vdev,
+				     void __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_pci_tsm_unbind, flags);
+	struct vfio_pci_tsm_unbind tsm_unbind;
+	struct pci_dev *pdev = vdev->pdev;
+
+	if (copy_from_user(&tsm_unbind, arg, minsz))
+		return -EFAULT;
+
+	if (tsm_unbind.argsz < minsz || tsm_unbind.flags)
+		return -EINVAL;
+
+	mutex_lock(&vdev->vdev.dev_set->lock);
+
+	if (!vdev->is_tsm_bound)
+		return 0;
+
+	vfio_iommufd_tsm_unbind(&vdev->vdev);
+	pci_release_regions(pdev);
+	vdev->is_tsm_bound = false;
+	mutex_unlock(&vdev->vdev.dev_set->lock);
+
+	return 0;
+}
+
 long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 			 unsigned long arg)
 {
@@ -1471,6 +1541,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_reset(vdev, uarg);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
+	case VFIO_DEVICE_TSM_BIND:
+		return vfio_pci_ioctl_tsm_bind(vdev, uarg);
+	case VFIO_DEVICE_TSM_UNBIND:
+		return vfio_pci_ioctl_tsm_unbind(vdev, uarg);
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index d521d2c01a92..747b94bb9758 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -70,6 +70,7 @@ struct vfio_device {
 	struct iommufd_device *iommufd_device;
 	struct ida pasids;
 	u8 iommufd_attached:1;
+	u8 iommufd_tsm_bound:1;
 #endif
 	u8 cdev_opened:1;
 #ifdef CONFIG_DEBUG_FS
@@ -155,6 +156,8 @@ int vfio_iommufd_emulated_bind(struct vfio_device *vdev,
 void vfio_iommufd_emulated_unbind(struct vfio_device *vdev);
 int vfio_iommufd_emulated_attach_ioas(struct vfio_device *vdev, u32 *pt_id);
 void vfio_iommufd_emulated_detach_ioas(struct vfio_device *vdev);
+int vfio_iommufd_tsm_bind(struct vfio_device *vdev, u32 vdevice_id);
+void vfio_iommufd_tsm_unbind(struct vfio_device *vdev);
 #else
 static inline struct iommufd_ctx *
 vfio_iommufd_device_ictx(struct vfio_device *vdev)
@@ -190,6 +193,10 @@ vfio_iommufd_get_dev_id(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 	((int (*)(struct vfio_device *vdev, u32 *pt_id)) NULL)
 #define vfio_iommufd_emulated_detach_ioas \
 	((void (*)(struct vfio_device *vdev)) NULL)
+#define vfio_iommufd_tsm_bind \
+	((int (*)(struct vfio_device *vdev, u32 vdevice_id)) NULL)
+#define vfio_iommufd_tsm_unbind \
+	((void (*)(struct vfio_device *vdev)) NULL)
 #endif
 
 static inline bool vfio_device_cdev_opened(struct vfio_device *device)
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index da5d8955ae56..b2982100221f 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -80,6 +80,7 @@ struct vfio_pci_core_device {
 	bool			needs_pm_restore:1;
 	bool			pm_intx_masked:1;
 	bool			pm_runtime_engaged:1;
+	bool			is_tsm_bound:1;
 	struct pci_saved_state	*pci_saved_state;
 	struct pci_saved_state	*pm_save;
 	int			ioeventfds_nr;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 9445fa36efd3..16bd93a5b427 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1493,6 +1493,48 @@ struct vfio_device_feature_dma_buf {
 	struct vfio_region_dma_range dma_ranges[];
 };
 
+/*
+ * Upon VFIO_DEVICE_TSM_BIND, Put the device in TSM Bind state.
+ *
+ * @argsz:	User filled size of this data.
+ * @flags:	Must be 0.
+ * @vdevice_id:	Input the target id which can represent an vdevice allocated
+ *		via iommufd subsystem.
+ *
+ * The vdevice holds all virtualization information needed for TSM Bind.
+ * TSM Bind means host finishes all host side trusted configurations to build
+ * a Tee Device Interface(TDI), then put the TDI in TDISP CONFIG_LOCKED or RUN
+ * state, waiting for guest's attestation. IOMMUFD finds all virtualization
+ * information from vdevice_id, and executes the TSM Bind. VFIO should be aware
+ * some operations (e.g. reset, toggle MSE, private MMIO access) to physical
+ * device impacts TSM Bind, so never do them or do them only after TSM Unbind.
+ * This IOCTL is only allowed on cdev fds.
+ */
+struct vfio_pci_tsm_bind {
+	__u32	argsz;
+	__u32	flags;
+	__u32	vdevice_id;
+	__u32	pad;
+};
+
+#define VFIO_DEVICE_TSM_BIND		_IO(VFIO_TYPE, VFIO_BASE + 22)
+
+/*
+ * Upon VFIO_DEVICE_TSM_UNBIND, put the device in TSM Unbind state.
+ *
+ * @argsz:	User filled size of this data.
+ * @flags:	Must be 0.
+ *
+ * TSM Unbind means host removes all trusted configurations, and put the TDI in
+ * CONFIG_UNLOCKED TDISP state.
+ */
+struct vfio_pci_tsm_unbind {
+	__u32	argsz;
+	__u32	flags;
+};
+
+#define VFIO_DEVICE_TSM_UNBIND		_IO(VFIO_TYPE, VFIO_BASE + 23)
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.25.1

