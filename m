Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCF901D73
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7C10E37A;
	Mon, 10 Jun 2024 08:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/x4UhIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFE310E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718009902; x=1749545902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lO/IPmdUqOg04lYCYxFPmCNa0L0veD8icxIpi6zQo+o=;
 b=n/x4UhIkTof5w+ZRw3FF9zNsx63ILD9bUj7OyYFGIpgAcXlpDTP5ggfC
 xx+loFAlgnRKwZUAtDeftb0Nw3gdpk/WcBSp2ZiQcvZXHYqFs3brctiUq
 XkRLgv11ruYxARBww1WQYbeGw0RFQeNl1HszogRPROWWCHhmb17scACm/
 vVVJApdGC57GrhgmCnNnJSySKqNrhTWe0aBUuG8+2Qsf8XvIpjCX2PZ7d
 C74DJPnYkghpthJUGq3WpNSPPKp51nhZOYWORJGJgZ/QXeR6ObXYTsglS
 SuiuDdqlyqnI5Z8j7p/0C8zuERvD0wb93BYomhljl3lpqZZT4p6lmZdpL A==;
X-CSE-ConnectionGUID: k+uqB8/cTxqubzISgNYfIA==
X-CSE-MsgGUID: QIbEDytvSuy9ZmmXVpr2Qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581511"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="17581511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:58:22 -0700
X-CSE-ConnectionGUID: T7ftFoB4QDSGxVb/F3iHkQ==
X-CSE-MsgGUID: ImRDR5fxSxuM0OMEzjzIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43432409"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:17 -0700
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
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v3 01/21] iommu: Add iommu_paging_domain_alloc() interface
Date: Mon, 10 Jun 2024 16:55:35 +0800
Message-Id: <20240610085555.88197-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
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
index 7bc8dff7cf6d..46f1348f1f0a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type *bus);
 extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
 extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
 extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
+struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
 extern void iommu_domain_free(struct iommu_domain *domain);
 extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
@@ -1086,6 +1087,11 @@ static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus
 	return NULL;
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
index 9df7cc75c1bc..e03c71a34347 100644
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
@@ -2032,6 +2036,22 @@ struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
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

