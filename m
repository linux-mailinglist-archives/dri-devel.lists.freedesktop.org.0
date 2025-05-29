Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C65AC77D9
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67C310E6E8;
	Thu, 29 May 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbL4Tf6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B03310E6EC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497389; x=1780033389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hunogpNwciqFH+bSwtWb6TQfi33+KNtBwWBoXqV5M4=;
 b=GbL4Tf6uH4Nvc73pNMn6tOHwHD6AFxL/Dopbm9oX4KqwkOgCYEYhOWWl
 fFNpbCma0i2eaP1VsXb8g0y1G/oLQZwXeGZNJ62mGFw7taxlZ/AK/M3Xm
 uPEHU4klWWKCIw1VopCxp0f4NN6QwGUynPmvTs/NEDgRqvAqW88wSoXbM
 JAJZBqaVtyBwgCKO36BVxYPqRlLq8iufiyWVScFiOXWLzP3F7Ospl9NUy
 gk6CtPEA/xdQ5kbRL+KUtz3GFZubQFsotzFKjDjaWV7rmUPNiY01CVjKr
 8Z61i5gTZ5u+Rip4NfEBwRaDmIZVCyhNuZxySYedBllgKKa9fCk9aBOT/ w==;
X-CSE-ConnectionGUID: 9FETqJz7SbWMwBb9OcIlWg==
X-CSE-MsgGUID: cdEpaHTlQImVhI6vKo+hJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963136"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:08 -0700
X-CSE-ConnectionGUID: ZmANZOTgTEGCPxcNuqIHBg==
X-CSE-MsgGUID: hzXAEOUOQ/O6ZKvbdS4Gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443399"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:01 -0700
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
Subject: [RFC PATCH 14/30] iommu/arm-smmu-v3-iommufd: Pass in kvm pointer to
 viommu_alloc
Date: Thu, 29 May 2025 13:34:57 +0800
Message-Id: <20250529053513.1592088-15-yilun.xu@linux.intel.com>
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

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

No functional changes.

This will be used in a later patch to add support to use
KVM VMID in ARM SMMUv3 s2 stage configuration.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
 drivers/iommu/iommufd/viommu.c                      | 3 ++-
 include/linux/iommu.h                               | 4 +++-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index e4fd8d522af8..5ee2b24e7bcf 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -383,6 +383,7 @@ static const struct iommufd_viommu_ops arm_vsmmu_ops = {
 };
 
 struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
+				       struct kvm *kvm,
 				       struct iommu_domain *parent,
 				       struct iommufd_ctx *ictx,
 				       unsigned int viommu_type)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd1ad56ce863..94b695b60c26 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1060,6 +1060,7 @@ struct arm_vsmmu {
 #if IS_ENABLED(CONFIG_ARM_SMMU_V3_IOMMUFD)
 void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type);
 struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
+				       struct kvm *kvm,
 				       struct iommu_domain *parent,
 				       struct iommufd_ctx *ictx,
 				       unsigned int viommu_type);
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 01df2b985f02..488905989b7c 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -47,7 +47,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_hwpt;
 	}
 
-	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
+	viommu = ops->viommu_alloc(idev->dev, idev->kvm,
+				   hwpt_paging->common.domain,
 				   ucmd->ictx, cmd->type);
 	if (IS_ERR(viommu)) {
 		rc = PTR_ERR(viommu);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ccce8a751e2a..3675a5a6cea0 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -47,6 +47,7 @@ struct iommufd_ctx;
 struct iommufd_viommu;
 struct msi_desc;
 struct msi_msg;
+struct kvm;
 
 #define IOMMU_FAULT_PERM_READ	(1 << 0) /* read */
 #define IOMMU_FAULT_PERM_WRITE	(1 << 1) /* write */
@@ -661,7 +662,8 @@ struct iommu_ops {
 	int (*def_domain_type)(struct device *dev);
 
 	struct iommufd_viommu *(*viommu_alloc)(
-		struct device *dev, struct iommu_domain *parent_domain,
+		struct device *dev, struct kvm *kvm,
+		struct iommu_domain *parent_domain,
 		struct iommufd_ctx *ictx, unsigned int viommu_type);
 
 	const struct iommu_domain_ops *default_domain_ops;
-- 
2.25.1

