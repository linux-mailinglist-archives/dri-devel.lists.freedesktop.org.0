Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDDAA050A4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D83210E7CB;
	Wed,  8 Jan 2025 02:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxb0xPUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3787D10E7CB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303322; x=1767839322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IxMVAkg+53rXDfSSEiAszqwBdp+SFB/CHo+r4gMxFl8=;
 b=cxb0xPUSDW12EOQdaNHA+MNgXdkgX6DgrT3HIvM4552phhR2k+Kp4871
 oQ8LM6goJSMf/Tt4QVUUs8rgIKKfsYxBOGQBp1ED+Q7L8iw+BcNkHPLhI
 1BjaasNCZlVUxBK6txsOrSeXRg8D6dDl/KbVvH4zFBZDknaEWs2suXjdl
 ztqgVleNVfbkdpFp7fA1vXw9c60oipjbDFmf5pKG8iblo1jnfo2IdU+06
 0RoQoF+ReisX5mtqqi57F1EM+QHNFnxafMAvFDDuR9/jZ6YsTb9qsLq9l
 4M4UJyCx+Hg80j4g3q50t2wh+ucZPx0LXqIkPOUtB42nfuwG+7HEHS4A8 Q==;
X-CSE-ConnectionGUID: suc0PJZrRRif5zSfMo3BHw==
X-CSE-MsgGUID: BtOd9HWBT1GrUb50mccGhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010466"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:28:41 -0800
X-CSE-ConnectionGUID: rnahsD3OT9q89XllgcYoJg==
X-CSE-MsgGUID: /UQPPeECQQuVBbmZ6+FLPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793588"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:36 -0800
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
Subject: [RFC PATCH 03/12] vfio/pci: Share the core device pointer while
 invoking feature functions
Date: Tue,  7 Jan 2025 22:27:10 +0800
Message-Id: <20250107142719.179636-4-yilun.xu@linux.intel.com>
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

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

There is no need to share the main device pointer (struct vfio_device *)
with all the feature functions as they only need the core device
pointer. Therefore, extract the core device pointer once in the
caller (vfio_pci_core_ioctl_feature) and share it instead.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1ab58da9f38a..c3269d708411 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -300,11 +300,9 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
 	return 0;
 }
 
-static int vfio_pci_core_pm_entry(struct vfio_device *device, u32 flags,
+static int vfio_pci_core_pm_entry(struct vfio_pci_core_device *vdev, u32 flags,
 				  void __user *arg, size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =
-		container_of(device, struct vfio_pci_core_device, vdev);
 	int ret;
 
 	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET, 0);
@@ -321,12 +319,10 @@ static int vfio_pci_core_pm_entry(struct vfio_device *device, u32 flags,
 }
 
 static int vfio_pci_core_pm_entry_with_wakeup(
-	struct vfio_device *device, u32 flags,
+	struct vfio_pci_core_device *vdev, u32 flags,
 	struct vfio_device_low_power_entry_with_wakeup __user *arg,
 	size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =
-		container_of(device, struct vfio_pci_core_device, vdev);
 	struct vfio_device_low_power_entry_with_wakeup entry;
 	struct eventfd_ctx *efdctx;
 	int ret;
@@ -377,11 +373,9 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
 	up_write(&vdev->memory_lock);
 }
 
-static int vfio_pci_core_pm_exit(struct vfio_device *device, u32 flags,
+static int vfio_pci_core_pm_exit(struct vfio_pci_core_device *vdev, u32 flags,
 				 void __user *arg, size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =
-		container_of(device, struct vfio_pci_core_device, vdev);
 	int ret;
 
 	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET, 0);
@@ -1486,11 +1480,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 }
 EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
 
-static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
-				       uuid_t __user *arg, size_t argsz)
+static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
+				       u32 flags, uuid_t __user *arg,
+				       size_t argsz)
 {
-	struct vfio_pci_core_device *vdev =
-		container_of(device, struct vfio_pci_core_device, vdev);
 	uuid_t uuid;
 	int ret;
 
@@ -1517,16 +1510,19 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz)
 {
+	struct vfio_pci_core_device *vdev =
+		container_of(device, struct vfio_pci_core_device, vdev);
+
 	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
 	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY:
-		return vfio_pci_core_pm_entry(device, flags, arg, argsz);
+		return vfio_pci_core_pm_entry(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY_WITH_WAKEUP:
-		return vfio_pci_core_pm_entry_with_wakeup(device, flags,
+		return vfio_pci_core_pm_entry_with_wakeup(vdev, flags,
 							  arg, argsz);
 	case VFIO_DEVICE_FEATURE_LOW_POWER_EXIT:
-		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
+		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
-		return vfio_pci_core_feature_token(device, flags, arg, argsz);
+		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
-- 
2.25.1

