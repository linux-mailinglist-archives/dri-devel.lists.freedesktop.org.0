Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06382AC77F9
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0AA10E6FD;
	Thu, 29 May 2025 05:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQALThth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BA910E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497487; x=1780033487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5t1xbsesQU/RfLeQac4mL21mX07YhXCrMjP205S8yWk=;
 b=GQALThth886LPpqFb32T//2/yZDnHXFngYsNea9mRzKju0k5AKFFoDQE
 aq7k1I5iYE78Y5KlpRQnh2r7U2Gd7thC6buHgewWF8WiPDGw61jUqAboH
 oPZGRaCfP6MG6bU5c5WAGMb3NgJoRGLIVS9VPjz073jz+wWdbLqQ4082U
 YBo6AbD+N/oXSnBKDaWVlv9qij8AuH5VnBTskhNSb8SyavlNExLfDFvFn
 eKq4hSIyFLbjwOot+QM6l0L16kNhQI5gVJAzH8j0agPIvDc//XG2lnccp
 F0KV/muQIsEUvN/8fNApZIsBlfQ5ugrcCCN5VUuwyNi6xGwxvG2J+nswn A==;
X-CSE-ConnectionGUID: lCLucWd0QU+nzjtMprLCHQ==
X-CSE-MsgGUID: lxcRQq9dQbKye4UT7LvljQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963500"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: w8s4Yi3kTTiJadEJ5384Ag==
X-CSE-MsgGUID: PoWShFvhTNGfLLU1Qt6FIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443689"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:40 -0700
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
Subject: [RFC PATCH 29/30] iommufd/vdevice: Implement TSM handlers for trusted
 DMA
Date: Thu, 29 May 2025 13:35:12 +0800
Message-Id: <20250529053513.1592088-30-yilun.xu@linux.intel.com>
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

IOMMUFD implements disable_trusted_dma() handler to clean up trusted
DMA configuration when device is to be unbound.

For now these handlers are mainly for Intel TDX Connect, but should
have no impact since other platform TSM drivers don't call these
handlers.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/iommu/iommufd/viommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index c64ce1a9f87d..b7281a4422ff 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -255,8 +255,16 @@ static void iommufd_vdevice_disable_trusted_dma(struct iommufd_vdevice *vdev)
 	vdev->trusted_dma_enabled = false;
 }
 
+static void pci_driver_disable_trusted_dma(struct pci_dev *pdev)
+{
+	struct iommufd_vdevice *vdev = pdev->trusted_dma_owner;
+
+	iommufd_vdevice_disable_trusted_dma(vdev);
+}
+
 int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev)
 {
+	struct pci_dev *pdev = to_pci_dev(vdev->dev);
 	struct kvm *kvm;
 	int rc;
 
@@ -272,6 +280,9 @@ int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev)
 		goto out_unlock;
 	}
 
+	pdev->trusted_dma_owner = vdev;
+	pdev->driver->tsm_handler->disable_trusted_dma = pci_driver_disable_trusted_dma;
+
 	rc = iommufd_vdevice_enable_trusted_dma(vdev);
 	if (rc)
 		goto out_unlock;
@@ -292,12 +303,16 @@ int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev)
 
 void iommufd_vdevice_tsm_unbind(struct iommufd_vdevice *vdev)
 {
+	struct pci_dev *pdev = to_pci_dev(vdev->dev);
+
 	mutex_lock(&vdev->tsm_lock);
 	if (!vdev->tsm_bound)
 		goto out_unlock;
 
 	pci_tsm_unbind(to_pci_dev(vdev->dev));
 	iommufd_vdevice_disable_trusted_dma(vdev);
+	pdev->trusted_dma_owner = NULL;
+	pdev->driver->tsm_handler->disable_trusted_dma = NULL;
 	vdev->tsm_bound = false;
 
 out_unlock:
-- 
2.25.1

