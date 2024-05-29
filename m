Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E358D2C91
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359FE10E7DF;
	Wed, 29 May 2024 05:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMgJEd1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01624113124
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960990; x=1748496990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ePUNFSt1UVyBK/XkIEBW5JIdBwW2K6T9xjoabFYw84=;
 b=hMgJEd1qtYfG8G2tjNEUh01HoANa7sHi5NU3BQvwrKYbFFa4yfIKmNN1
 3kATQnZ0IJZiYK2mS2rDNuw2PX9RJ4gxpW/5TsNXRUXxn4OWdbeRI5gn4
 T9pN/f61neDT85lGBPP00MWs71x+fMNZ2gl2p7sPSuJ7cTtjiWh80Eu8v
 oaAUk0ifdNJkV4okdTKxQzvyO3I8InD2rRTHPmeUXmAWGvTiCDZq/gd76
 IOqHjVuh5hnvkIGr07LFOwhBzzYbcQxLF6kZPChQToUtEBjjy/vfJ4Poc
 YvGVkQ97AJ7Vzjsu28EqpuqgDvZxpyG4alILyRAnLgkVgMOPa4A38XWvB w==;
X-CSE-ConnectionGUID: 4z41p8YFTyCD0twKqcpQyA==
X-CSE-MsgGUID: +Jbfy2DJT/yvbOW7czpaFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569072"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:36:18 -0700
X-CSE-ConnectionGUID: bMLT6m7ZQya8CnSU5hJh7Q==
X-CSE-MsgGUID: X6Uf2wUXQVWNu0/eZhCs2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257765"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:36:12 -0700
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
Subject: [PATCH 16/20] iommu/vt-d: Add domain_alloc_paging support
Date: Wed, 29 May 2024 13:32:46 +0800
Message-Id: <20240529053250.91284-17-baolu.lu@linux.intel.com>
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

Move paging domain allocation code out from intel_iommu_domain_alloc().
The intel_iommu_domain_alloc()  is still remaining to allocate an identity
domain. However, it will soon disappear as we are about to convert the
identity domain to a global static one.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 50 ++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index ccde5f5972e4..eb8e08699b80 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3708,35 +3708,8 @@ static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_st
 
 static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
-	struct dmar_domain *dmar_domain;
-	struct iommu_domain *domain;
-
-	switch (type) {
-	case IOMMU_DOMAIN_DMA:
-	case IOMMU_DOMAIN_UNMANAGED:
-		dmar_domain = alloc_domain(type);
-		if (!dmar_domain) {
-			pr_err("Can't allocate dmar_domain\n");
-			return NULL;
-		}
-		if (md_domain_init(dmar_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
-			pr_err("Domain initialization failed\n");
-			domain_exit(dmar_domain);
-			return NULL;
-		}
-
-		domain = &dmar_domain->domain;
-		domain->geometry.aperture_start = 0;
-		domain->geometry.aperture_end   =
-				__DOMAIN_MAX_ADDR(dmar_domain->gaw);
-		domain->geometry.force_aperture = true;
-
-		return domain;
-	case IOMMU_DOMAIN_IDENTITY:
+	if (type == IOMMU_DOMAIN_IDENTITY)
 		return &si_domain->domain;
-	default:
-		return NULL;
-	}
 
 	return NULL;
 }
@@ -3791,6 +3764,26 @@ intel_iommu_domain_alloc_user(struct device *dev, u32 flags,
 	return domain;
 }
 
+static struct iommu_domain *intel_iommu_domain_alloc_paging(struct device *dev)
+{
+	struct dmar_domain *dmar_domain;
+	struct device_domain_info *info;
+	struct intel_iommu *iommu;
+
+	/* Do not support the legacy iommu_domain_alloc() interface. */
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	info = dev_iommu_priv_get(dev);
+	iommu = info->iommu;
+	dmar_domain = paging_domain_alloc(dev,
+			sm_supported(iommu) && ecap_flts(iommu->ecap));
+	if (IS_ERR(dmar_domain))
+		return ERR_CAST(dmar_domain);
+
+	return &dmar_domain->domain;
+}
+
 static void intel_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
@@ -4650,6 +4643,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.domain_alloc		= intel_iommu_domain_alloc,
 	.domain_alloc_user	= intel_iommu_domain_alloc_user,
 	.domain_alloc_sva	= intel_svm_domain_alloc,
+	.domain_alloc_paging	= intel_iommu_domain_alloc_paging,
 	.probe_device		= intel_iommu_probe_device,
 	.release_device		= intel_iommu_release_device,
 	.get_resv_regions	= intel_iommu_get_resv_regions,
-- 
2.34.1

