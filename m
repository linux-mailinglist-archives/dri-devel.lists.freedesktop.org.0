Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245FAC77F7
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587910E6FA;
	Thu, 29 May 2025 05:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPPfmNvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D55C10E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497481; x=1780033481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AyrKaCgBJ3r/A9+852gqJoO1wObY7IGy8rbLw4mCWCs=;
 b=cPPfmNvnb+oUrCX9v/6bcI/s5AdGFn8WUs5uWlN+wHaSGr+p93Gl+Dgo
 yyAfIIqlzQiLxguSeRtKNFmeIxMILulyYLOEdlYXnrq7GsdrXTO+tb3tT
 eXEvA1d9vze8GoGWKAIzmN7heQsiz4OP+Ff7gDthmlxxU8ztvjFn/BQN6
 pI/f1OBa/MPVBET11SyHw7CBfK2DjUQzlRNm8NintRvHiDwDdaTHGbj+z
 2blCR9gH1GP8zcuaWKPuvhiZKogXXtjG+2UBQur3k3prFKsh1tqJlXUIE
 E3hYg4kpqcqEcSWt674XxgyoiYmLFso9KRazRxnNNYtGMyFJImi2/m/0U g==;
X-CSE-ConnectionGUID: sKVsn6DPQ2eSt91NCDy4GQ==
X-CSE-MsgGUID: xLnqFyoWTp6OxcYHSoOO9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963485"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:40 -0700
X-CSE-ConnectionGUID: VT8q7GNFRs+Ealv7ugjQjA==
X-CSE-MsgGUID: PIlIdinVRtKIaFhRpIfP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443656"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:33 -0700
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
Subject: [RFC PATCH 28/30] vfio/pci: Implement TSM handlers for MMIO
Date: Thu, 29 May 2025 13:35:11 +0800
Message-Id: <20250529053513.1592088-29-yilun.xu@linux.intel.com>
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

VFIO invalidates MMIOs on disable_mmio() so that KVM could unmap them
from S-EPT. VFIO re-validate MMIOs on recover_mmio() so that KVM could
map them again for shared assigned device.

For now these handlers are mainly for Intel TDX Connect, but should
have no impact since other platform TSM drivers don't call these
handlers.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/vfio_pci.c      |  1 +
 drivers/vfio/pci/vfio_pci_core.c | 26 ++++++++++++++++++++++++++
 include/linux/vfio_pci_core.h    |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5ba39f7623bb..df25a3083fb0 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -202,6 +202,7 @@ static struct pci_driver vfio_pci_driver = {
 	.remove			= vfio_pci_remove,
 	.sriov_configure	= vfio_pci_sriov_configure,
 	.err_handler		= &vfio_pci_core_err_handlers,
+	.tsm_handler		= &vfio_pci_core_tsm_handlers,
 	.driver_managed_dma	= true,
 };
 
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index a8437fcecca1..405461583e2f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -20,6 +20,7 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/pci.h>
+#include <linux/pci-tsm.h>
 #include <linux/pfn_t.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -1452,6 +1453,31 @@ static int vfio_pci_ioctl_ioeventfd(struct vfio_pci_core_device *vdev,
 				  ioeventfd.fd);
 }
 
+static void vfio_pci_core_tsm_disable_mmio(struct pci_dev *pdev)
+{
+	struct vfio_pci_core_device *vdev = dev_get_drvdata(&pdev->dev);
+
+	down_write(&vdev->memory_lock);
+	vfio_pci_dma_buf_move(vdev, true);
+	up_write(&vdev->memory_lock);
+}
+
+static void vfio_pci_core_tsm_recover_mmio(struct pci_dev *pdev)
+{
+	struct vfio_pci_core_device *vdev = dev_get_drvdata(&pdev->dev);
+
+	down_write(&vdev->memory_lock);
+	if (__vfio_pci_memory_enabled(vdev))
+		vfio_pci_dma_buf_move(vdev, false);
+	up_write(&vdev->memory_lock);
+}
+
+struct pci_tsm_handlers vfio_pci_core_tsm_handlers = {
+	.disable_mmio = vfio_pci_core_tsm_disable_mmio,
+	.recover_mmio = vfio_pci_core_tsm_recover_mmio,
+};
+EXPORT_SYMBOL_GPL(vfio_pci_core_tsm_handlers);
+
 static int vfio_pci_ioctl_tsm_bind(struct vfio_pci_core_device *vdev,
 				   void __user *arg)
 {
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index b2982100221f..7da71b861d87 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -111,6 +111,7 @@ void vfio_pci_core_release_dev(struct vfio_device *core_vdev);
 int vfio_pci_core_register_device(struct vfio_pci_core_device *vdev);
 void vfio_pci_core_unregister_device(struct vfio_pci_core_device *vdev);
 extern const struct pci_error_handlers vfio_pci_core_err_handlers;
+extern struct pci_tsm_handlers vfio_pci_core_tsm_handlers;
 int vfio_pci_core_sriov_configure(struct vfio_pci_core_device *vdev,
 				  int nr_virtfn);
 long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
-- 
2.25.1

