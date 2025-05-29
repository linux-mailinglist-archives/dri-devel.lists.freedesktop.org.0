Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEBAC77E2
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885B510E6EF;
	Thu, 29 May 2025 05:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyxX3sBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B003C10E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497415; x=1780033415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5T1oQeKOf7EV6IY5wLyfFhALN/V22r5lDzPWKVIEGY=;
 b=IyxX3sBzqQ6+OGef4dLVaaOrSiFSzD6DeEfgsHumHwW5hQsT7jBe2vPM
 I6hChHaHvtqzdo/GU3WAk/QbwFDZc1pucrriaGutK9KK8NI1kY+UHJn2r
 t9Rnp++88hoWkbwGxZogKS9gqBYVyDG4JmbkN+unVbrLLKx0I5RE85Y/V
 E5VYaEoXS4x8EA5BgLN2efDyrufxVUo1fEYqBZtLWdfpeqEU3xyC9U+ng
 bl4UlzNID8XUli/avc4QQ5FEoYlC1e2zKfimz8rIRxNq8ots45v9rJgFw
 iPu6EIk1OGyvZBS9qYDzz/LffWQ8fXzx25w9VMfeJfrJITqDxNir8b18s Q==;
X-CSE-ConnectionGUID: +dcM46zLQYObpEg9V6ByLQ==
X-CSE-MsgGUID: Fhniha4WTeKM+tUM7+FrkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963239"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:35 -0700
X-CSE-ConnectionGUID: uP6OUWujSrKq+yVSnWdvuw==
X-CSE-MsgGUID: smGeTrTaTj6FUFOgx2fVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443460"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:27 -0700
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
Subject: [RFC PATCH 18/30] iommufd/viommu: Add trusted IOMMU configuration
 handlers for vdev
Date: Thu, 29 May 2025 13:35:01 +0800
Message-Id: <20250529053513.1592088-19-yilun.xu@linux.intel.com>
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

Add handlers for setting up/removing trusted IOMMU configurations
against vdevice. IOMMUFD calls these handlers on TSM bind/unbind. Most
vendors extend the trusted IOMMU engine for private device assignment,
thus require extra IOMMU configuration for TSM bind. E.g. Intel TDX
Connect requires host to build extra trusted Device Conext Table
entries (but not present), while AMD requires to clear Domain-ID on
non-secure DTE.

Existing DMA setup flow against IOMMUFD are driven by userspace, usually
start with allocating a domain, then attach the domain to the device.
While trusted DMA setup is embedded in TSM bind/unbind() IOCTLs. This is
because platform secure firmwares have various configuration
enforcements for trusted. E.g. Intel TDX Connect enforces trusted IOPT
detach after TDI STOP but before TDI metadata free. Using coarser uAPIs
like TSM bind/unbind that wrap all trusted configurations prevent these
low level complexities propagating to userspace.

Coarser uAPI means userspace lose the flexibility to attach different
domains to trusted part of the device. Also it cannot operate on the
trusted domain. That seems not a problem cause VMM is out of the TCB so
secure firmware either disallows VMM touching the trusted domain or only
allows a fixed configuration set. E.g. TDX Connect enforces all assigned
devices in the same VM must share the same trusted domain. It also
specifies every value of the trusted Context Table entries. So just
setup everything for trusted DMA in IOMMU driver is a reasonable choice.

OPEN: Should these handlers be viommu ops or vdevice ops?

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  1 +
 drivers/iommu/iommufd/viommu.c          | 41 ++++++++++++++++++++++++-
 include/linux/iommufd.h                 |  2 ++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 29af8616e4aa..0db9a0e53a77 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -618,6 +618,7 @@ struct iommufd_vdevice {
 	u64 id; /* per-vIOMMU virtual ID */
 	struct mutex tsm_lock;
 	bool tsm_bound;
+	bool trusted_dma_enabled;
 };
 
 int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev);
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 296143e21368..8437e936c278 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -224,6 +224,37 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	return rc;
 }
 
+static int iommufd_vdevice_enable_trusted_dma(struct iommufd_vdevice *vdev)
+{
+	struct iommufd_viommu *viommu = vdev->viommu;
+	int rc;
+
+	if (vdev->trusted_dma_enabled)
+		return 0;
+
+	if (viommu->ops->setup_trusted_vdev) {
+		rc = viommu->ops->setup_trusted_vdev(viommu, vdev->id);
+		if (rc)
+			return rc;
+	}
+
+	vdev->trusted_dma_enabled = true;
+	return 0;
+}
+
+static void iommufd_vdevice_disable_trusted_dma(struct iommufd_vdevice *vdev)
+{
+	struct iommufd_viommu *viommu = vdev->viommu;
+
+	if (!vdev->trusted_dma_enabled)
+		return;
+
+	if (viommu->ops->remove_trusted_vdev)
+		viommu->ops->remove_trusted_vdev(viommu, vdev->id);
+
+	vdev->trusted_dma_enabled = false;
+}
+
 int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev)
 {
 	struct kvm *kvm;
@@ -241,12 +272,19 @@ int iommufd_vdevice_tsm_bind(struct iommufd_vdevice *vdev)
 		goto out_unlock;
 	}
 
-	rc = pci_tsm_bind(to_pci_dev(vdev->dev), kvm, vdev->id);
+	rc = iommufd_vdevice_enable_trusted_dma(vdev);
 	if (rc)
 		goto out_unlock;
 
+	rc = pci_tsm_bind(to_pci_dev(vdev->dev), kvm, vdev->id);
+	if (rc)
+		goto out_disable_trusted_dma;
+
 	vdev->tsm_bound = true;
+	goto out_unlock;
 
+out_disable_trusted_dma:
+	iommufd_vdevice_disable_trusted_dma(vdev);
 out_unlock:
 	mutex_unlock(&vdev->tsm_lock);
 	return rc;
@@ -259,6 +297,7 @@ void iommufd_vdevice_tsm_unbind(struct iommufd_vdevice *vdev)
 		goto out_unlock;
 
 	pci_tsm_unbind(to_pci_dev(vdev->dev));
+	iommufd_vdevice_disable_trusted_dma(vdev);
 	vdev->tsm_bound = false;
 
 out_unlock:
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 5f9a286232ac..d73e8d3b9b95 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -136,6 +136,8 @@ struct iommufd_viommu_ops {
 		const struct iommu_user_data *user_data);
 	int (*cache_invalidate)(struct iommufd_viommu *viommu,
 				struct iommu_user_data_array *array);
+	int (*setup_trusted_vdev)(struct iommufd_viommu *viommu, u64 vdev_id);
+	void (*remove_trusted_vdev)(struct iommufd_viommu *viommu, u64 vdev_id);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
-- 
2.25.1

