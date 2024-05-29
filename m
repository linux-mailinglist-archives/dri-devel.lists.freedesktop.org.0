Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895848D2C7C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96562113034;
	Wed, 29 May 2024 05:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3+6zYeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B56D113034
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960974; x=1748496974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xf05GvXEO+I215J3GQWK9zqCkzSYPhbVb/+Tz/JkYCQ=;
 b=G3+6zYeD+mjYTJww6E/DHC/b4MF+jX+lJ8CbJKXyk5DakmL2zA2Szohs
 BBhsye2DWJ+rENNilYHsipZWVhcdfoJt5/twUADc5z1pgDuzW7b87gXdi
 NDum1WEg82K+/OBSlWy8MjvUkaz2ujU1LNW0OWG+NrkXKsEKeEHb0oc48
 gxHCpXlyJui2owOIBjMuLgNYD6wQ4a17vEAfFKanE/2+7Bll+Xbfnb0F8
 rkGmAQVCVTs4rRKjbmezEmRzUIKW3Cy3jKcSZGcIiqiJuWviA2jy96OZb
 6zepFmDhyHHauoj7Yj9A5XTfW/4mLjCZkp212Uk0/6jm7SVVxHwAt2H5c w==;
X-CSE-ConnectionGUID: 1g5a3aJAQxGajdYmj16plg==
X-CSE-MsgGUID: Bmtxo+3wR3iWSQyw5rNwiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13568829"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13568829"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:25 -0700
X-CSE-ConnectionGUID: WkFEj6PrQYqnAeoLtI1GfQ==
X-CSE-MsgGUID: eszOZrvySa+kJnN3MKgnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257546"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:35:20 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 05/20] iommu: Add iommu_paging_domain_alloc() interface
Date: Wed, 29 May 2024 13:32:35 +0800
Message-Id: <20240529053250.91284-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529053250.91284-1-baolu.lu@linux.intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
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

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
bus. The iommu subsystem no longer relies on bus for operations. So the
bus parameter in iommu_domain_alloc() is no longer relevant.

Add a new interface named iommu_paging_domain_alloc(), which explicitly
indicates the allocation of a paging domain for DMA managed by a kernel
driver. The new interface takes a device pointer as its parameter, that
better aligns with the current iommu subsystem.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h |  6 ++++++
 drivers/iommu/iommu.c | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 6648b2415474..16401de7802d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -781,6 +781,7 @@ extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
 extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
 struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags);
+struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
 extern void iommu_domain_free(struct iommu_domain *domain);
 extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
@@ -1092,6 +1093,11 @@ static inline struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void iommu_domain_free(struct iommu_domain *domain)
 {
 }
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f1416892ef8e..7df4a021b040 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2016,6 +2016,10 @@ static int __iommu_domain_alloc_dev(struct device *dev, void *data)
 	return 0;
 }
 
+/*
+ * The iommu ops in bus has been retired. Do not use this interface in
+ * new drivers.
+ */
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
 	const struct iommu_ops *ops = NULL;
@@ -2074,6 +2078,22 @@ struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags)
 }
 EXPORT_SYMBOL_GPL(iommu_user_domain_alloc);
 
+/**
+ * iommu_paging_domain_alloc() - Allocate a paging domain
+ * @dev: device for which the domain is allocated
+ *
+ * Allocate a paging domain which will be managed by a kernel driver. Return
+ * allocated domain if successful, or a ERR pointer for failure.
+ */
+struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
+{
+	if (!dev_has_iommu(dev))
+		return ERR_PTR(-ENODEV);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, IOMMU_DOMAIN_UNMANAGED);
+}
+EXPORT_SYMBOL_GPL(iommu_paging_domain_alloc);
+
 void iommu_domain_free(struct iommu_domain *domain)
 {
 	if (domain->type == IOMMU_DOMAIN_SVA)
-- 
2.34.1

