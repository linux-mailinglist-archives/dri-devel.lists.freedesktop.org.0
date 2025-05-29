Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C28AC77E6
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D1010E6F0;
	Thu, 29 May 2025 05:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFh/4R0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DF410E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497428; x=1780033428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O68j6W8S4Lo+E07VyX4nc3K/JBnGY6gvWDiYv/6rh+0=;
 b=FFh/4R0mbkziojIi48I+ZYVQ2U4R/aKWTuRIZh0QYUKatEzp1wCMh89c
 2/5wmlWxk+yxVD87+MUQzKIeYcFb945ZVipF9TpN3NTFEDfrIF4Gz6pRA
 mUrS+R3vYYprHnlnpebZAK7a61IwyV3M5IaRrGxT0gz12qmrtAiw6nA9g
 59sFfG7YB9egVQbn6zl27C7+iF14NczBpyodrCEeV1dAtkD8HWu7q9Be1
 eQ4R6XYGkGh9vp0x9lDhK8bfQInyU50mhJ5GQe8EDYwpsBZzTi3fuulL7
 ygwH7TI7uNBnu5FoGMmaBTPStEvmMDkJ8m4S6HX6Y8IFjQOV1maYCxT0d Q==;
X-CSE-ConnectionGUID: zDLFWPsOTYOqh9NDdG1i2g==
X-CSE-MsgGUID: joQdGSOrRNSUG5SjH833iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963278"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963278"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:48 -0700
X-CSE-ConnectionGUID: 23TJ1BpZT2G5FZDTmgRQuA==
X-CSE-MsgGUID: lvsv/nzrRY2tMgaig+Q/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443514"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:41 -0700
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
Subject: [RFC PATCH 20/30] vfio/pci: Do TSM Unbind before zapping bars
Date: Thu, 29 May 2025 13:35:03 +0800
Message-Id: <20250529053513.1592088-21-yilun.xu@linux.intel.com>
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

When device is TSM Bound, some of its MMIO regions are controlled by
secure firmware. E.g. TDX Connect would require these MMIO regions
mappeed in S-EPT and never unmapped until device Unbound. Zapping bars
irrespective of TSM Bound state may cause unexpected secure firmware
errors. It is always safe to do TSM Unbind first, transiting the device
to shared, then do whatever needed as before.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/vfio_pci_config.c |  4 +++
 drivers/vfio/pci/vfio_pci_core.c   | 41 +++++++++++++++++++-----------
 drivers/vfio/pci/vfio_pci_priv.h   |  3 +++
 3 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 7ac062bd5044..4ffe661c9e59 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -590,6 +590,7 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
 		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
 
 		if (!new_mem) {
+			vfio_pci_tsm_unbind(vdev);
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
 			vfio_pci_dma_buf_move(vdev, true);
 		} else {
@@ -712,6 +713,7 @@ static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
 					  pci_power_t state)
 {
 	if (state >= PCI_D3hot) {
+		vfio_pci_tsm_unbind(vdev);
 		vfio_pci_zap_and_down_write_memory_lock(vdev);
 		vfio_pci_dma_buf_move(vdev, true);
 	} else {
@@ -907,6 +909,7 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 						 &cap);
 
 		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
+			vfio_pci_tsm_unbind(vdev);
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
@@ -992,6 +995,7 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 						&cap);
 
 		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
+			vfio_pci_tsm_unbind(vdev);
 			vfio_pci_zap_and_down_write_memory_lock(vdev);
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 92544e54c9c3..a8437fcecca1 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -286,6 +286,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	 * The vdev power related flags are protected with 'memory_lock'
 	 * semaphore.
 	 */
+	vfio_pci_tsm_unbind(vdev);
 	vfio_pci_zap_and_down_write_memory_lock(vdev);
 	vfio_pci_dma_buf_move(vdev, true);
 
@@ -693,11 +694,7 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 	eeh_dev_release(vdev->pdev);
 #endif
 
-	if (vdev->is_tsm_bound) {
-		vfio_iommufd_tsm_unbind(&vdev->vdev);
-		pci_release_regions(vdev->pdev);
-		vdev->is_tsm_bound = false;
-	}
+	__vfio_pci_tsm_unbind(vdev);
 
 	vfio_pci_core_disable(vdev);
 
@@ -1222,6 +1219,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
 	if (!vdev->reset_works)
 		return -EINVAL;
 
+	vfio_pci_tsm_unbind(vdev);
 	vfio_pci_zap_and_down_write_memory_lock(vdev);
 
 	/*
@@ -1491,12 +1489,32 @@ static int vfio_pci_ioctl_tsm_bind(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
+void __vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev)
+{
+	struct pci_dev *pdev = vdev->pdev;
+
+	lockdep_assert_held(&vdev->vdev.dev_set->lock);
+
+	if (!vdev->is_tsm_bound)
+		return;
+
+	vfio_iommufd_tsm_unbind(&vdev->vdev);
+	pci_release_regions(pdev);
+	vdev->is_tsm_bound = false;
+}
+
+void vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev)
+{
+	mutex_lock(&vdev->vdev.dev_set->lock);
+	__vfio_pci_tsm_unbind(vdev);
+	mutex_unlock(&vdev->vdev.dev_set->lock);
+}
+
 static int vfio_pci_ioctl_tsm_unbind(struct vfio_pci_core_device *vdev,
 				     void __user *arg)
 {
 	unsigned long minsz = offsetofend(struct vfio_pci_tsm_unbind, flags);
 	struct vfio_pci_tsm_unbind tsm_unbind;
-	struct pci_dev *pdev = vdev->pdev;
 
 	if (copy_from_user(&tsm_unbind, arg, minsz))
 		return -EFAULT;
@@ -1504,15 +1522,7 @@ static int vfio_pci_ioctl_tsm_unbind(struct vfio_pci_core_device *vdev,
 	if (tsm_unbind.argsz < minsz || tsm_unbind.flags)
 		return -EINVAL;
 
-	mutex_lock(&vdev->vdev.dev_set->lock);
-
-	if (!vdev->is_tsm_bound)
-		return 0;
-
-	vfio_iommufd_tsm_unbind(&vdev->vdev);
-	pci_release_regions(pdev);
-	vdev->is_tsm_bound = false;
-	mutex_unlock(&vdev->vdev.dev_set->lock);
+	vfio_pci_tsm_unbind(vdev);
 
 	return 0;
 }
@@ -2526,6 +2536,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 			break;
 		}
 
+		__vfio_pci_tsm_unbind(vdev);
 		/*
 		 * Take the memory write lock for each device and zap BAR
 		 * mappings to prevent the user accessing the device while in
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 6f3e8eafdc35..e5bf27f46a73 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -130,4 +130,7 @@ static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
 }
 #endif
 
+void __vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev);
+void vfio_pci_tsm_unbind(struct vfio_pci_core_device *vdev);
+
 #endif
-- 
2.25.1

