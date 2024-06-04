Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399068FA7E0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D72310E419;
	Tue,  4 Jun 2024 01:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4QF+BTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F6210E40E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466145; x=1749002145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fB0WT/uFAD/6kyoV4UsQtcUjaYUF0Qf8FTDYMb+l8Rw=;
 b=B4QF+BTWm9Nfsz2hTrk9Cw3jodZzg4BlnldUUepl7FvIgZblkrAOYWWa
 kXij+QMpmjrvfccOnx7N5SNebe0xM5vxiSePPzID9VNY4061uNL9T9+Kz
 zZSRfdlhteUtZHblJgGt81+VdaORgyQEGFZU5pykqt5UPUQypIf7fLf+b
 JosnTe3KTIsX2HVAgxcv1B45rapnKUDtf6WKr4yjTOe/HIsc3qYvJ8Kpo
 2sPyn8ZVPfg1AB7drWDjo4QPZFFjo8eQJn37PbQ9Q616nNpuOCtGUNNj0
 5OVEKhEeyeNbaJ0hTaoS7e5Ngl5D3PH9D2zJBcOs+ws4Nsvs8ygVXqIn+ A==;
X-CSE-ConnectionGUID: 9aorQTwuSrOoslzqGqyy8w==
X-CSE-MsgGUID: mdyt6NvOTA6WFraGKuazEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25385286"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25385286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:55:45 -0700
X-CSE-ConnectionGUID: zu00YDKoTgCrApgAN111bg==
X-CSE-MsgGUID: kCjus9/aSU67aafbZZIwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37662070"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:55:41 -0700
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
Subject: [PATCH v2 22/22] iommu: Remove iommu_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:34 +0800
Message-Id: <20240604015134.164206-23-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604015134.164206-1-baolu.lu@linux.intel.com>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
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

The iommu_domain_alloc() interface is no longer used in the tree anymore.
Remove it to avoid dead code.

There is increasing demand for supporting multiple IOMMU drivers, and this
is the last bus-based thing standing in the way of that.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h |  6 ------
 drivers/iommu/iommu.c | 36 ------------------------------------
 2 files changed, 42 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b0bd16a7768e..8b4ce7aa16ac 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -778,7 +778,6 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 extern int bus_iommu_probe(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
-extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
 struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags);
 struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
 extern void iommu_domain_free(struct iommu_domain *domain);
@@ -1077,11 +1076,6 @@ static inline bool device_iommu_capable(struct device *dev, enum iommu_cap cap)
 	return false;
 }
 
-static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
-{
-	return NULL;
-}
-
 static inline struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags)
 {
 	return ERR_PTR(-ENODEV);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3e4195c28e85..9ce8bc18485b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1975,42 +1975,6 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
 }
 
-static int __iommu_domain_alloc_dev(struct device *dev, void *data)
-{
-	const struct iommu_ops **ops = data;
-
-	if (!dev_has_iommu(dev))
-		return 0;
-
-	if (WARN_ONCE(*ops && *ops != dev_iommu_ops(dev),
-		      "Multiple IOMMU drivers present for bus %s, which the public IOMMU API can't fully support yet. You will still need to disable one or more for this to work, sorry!\n",
-		      dev_bus_name(dev)))
-		return -EBUSY;
-
-	*ops = dev_iommu_ops(dev);
-	return 0;
-}
-
-/*
- * The iommu ops in bus has been retired. Do not use this interface in
- * new drivers.
- */
-struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
-{
-	const struct iommu_ops *ops = NULL;
-	int err = bus_for_each_dev(bus, NULL, &ops, __iommu_domain_alloc_dev);
-	struct iommu_domain *domain;
-
-	if (err || !ops)
-		return NULL;
-
-	domain = __iommu_domain_alloc(ops, NULL, IOMMU_DOMAIN_UNMANAGED);
-	if (IS_ERR(domain))
-		return NULL;
-	return domain;
-}
-EXPORT_SYMBOL_GPL(iommu_domain_alloc);
-
 /**
  * iommu_user_domain_alloc() - Allocate a user domain
  * @dev: device for which the domain is allocated
-- 
2.34.1

