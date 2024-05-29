Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA38D2C96
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB581122D8;
	Wed, 29 May 2024 05:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Klis21kM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F60113128
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960998; x=1748496998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KWn8VzkwrmikfdY6Ercb38rCkbe5TmNZrNn/P2jtlY=;
 b=Klis21kMJD1gQdyxf0VTTacJhvx7ZkXK4XYj7AGY3NbocKHLMhxN1pNu
 +Hc/MAPBsl2uNCo7ydLlU41AJw7aFYuFuQ6Rm9bLHeR6vxhR+kFXHscwa
 XFnP+x+3xVsldYSrWKLvP5fBnDVuPvpPWJSIpjqXk53rDJUK/z6ugRX/p
 ELY8SYSSp7+CIo5B34IKA1zDKBYdcjf3Ckdxi+Acu5uWMUA29gGf/T8jS
 Sxnx94EEjR2iQMi86BwZkV/+AncbCrSlZplqFGBASFSnXvZ1jDX7ci/uu
 KhBzPWgErURqQon262ZQU97SKWnS/WaeHrt3IY2DJP+R6165m/LEGvYxI Q==;
X-CSE-ConnectionGUID: g0BSjT4iQRSUSkpmC658MQ==
X-CSE-MsgGUID: kWyywqRITXiHtaZrtDCNRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569118"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:36:32 -0700
X-CSE-ConnectionGUID: tfyd8XLnTFavgJ6eGMD+/g==
X-CSE-MsgGUID: 8sz1WYkaSFSx14UMZlVbhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257798"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:36:27 -0700
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
Subject: [PATCH 19/20] iommu/vt-d: Remove domain_update_iommu_cap()
Date: Wed, 29 May 2024 13:32:49 +0800
Message-Id: <20240529053250.91284-20-baolu.lu@linux.intel.com>
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

The attributes of a paging domain are initialized during the allocation
process, and any attempt to attach a domain that is not compatible will
result in a failure. Therefore, there is no need to update the domain
attributes at the time of domain attachment.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 86 +------------------------------------
 1 file changed, 2 insertions(+), 84 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e9393f5c2c50..74e005b1c4b4 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -366,36 +366,6 @@ static bool iommu_paging_structure_coherency(struct intel_iommu *iommu)
 			ecap_smpwc(iommu->ecap) : ecap_coherent(iommu->ecap);
 }
 
-static void domain_update_iommu_coherency(struct dmar_domain *domain)
-{
-	struct iommu_domain_info *info;
-	struct dmar_drhd_unit *drhd;
-	struct intel_iommu *iommu;
-	bool found = false;
-	unsigned long i;
-
-	domain->iommu_coherency = true;
-	xa_for_each(&domain->iommu_array, i, info) {
-		found = true;
-		if (!iommu_paging_structure_coherency(info->iommu)) {
-			domain->iommu_coherency = false;
-			break;
-		}
-	}
-	if (found)
-		return;
-
-	/* No hardware attached; use lowest common denominator */
-	rcu_read_lock();
-	for_each_active_iommu(iommu, drhd) {
-		if (!iommu_paging_structure_coherency(iommu)) {
-			domain->iommu_coherency = false;
-			break;
-		}
-	}
-	rcu_read_unlock();
-}
-
 static int domain_update_iommu_superpage(struct dmar_domain *domain,
 					 struct intel_iommu *skip)
 {
@@ -426,29 +396,6 @@ static int domain_update_iommu_superpage(struct dmar_domain *domain,
 	return fls(mask);
 }
 
-static int domain_update_device_node(struct dmar_domain *domain)
-{
-	struct device_domain_info *info;
-	int nid = NUMA_NO_NODE;
-	unsigned long flags;
-
-	spin_lock_irqsave(&domain->lock, flags);
-	list_for_each_entry(info, &domain->devices, link) {
-		/*
-		 * There could possibly be multiple device numa nodes as devices
-		 * within the same domain may sit behind different IOMMUs. There
-		 * isn't perfect answer in such situation, so we select first
-		 * come first served policy.
-		 */
-		nid = dev_to_node(info->dev);
-		if (nid != NUMA_NO_NODE)
-			break;
-	}
-	spin_unlock_irqrestore(&domain->lock, flags);
-
-	return nid;
-}
-
 /* Return the super pagesize bitmap if supported. */
 static unsigned long domain_super_pgsize_bitmap(struct dmar_domain *domain)
 {
@@ -466,35 +413,6 @@ static unsigned long domain_super_pgsize_bitmap(struct dmar_domain *domain)
 	return bitmap;
 }
 
-/* Some capabilities may be different across iommus */
-void domain_update_iommu_cap(struct dmar_domain *domain)
-{
-	domain_update_iommu_coherency(domain);
-	domain->iommu_superpage = domain_update_iommu_superpage(domain, NULL);
-
-	/*
-	 * If RHSA is missing, we should default to the device numa domain
-	 * as fall back.
-	 */
-	if (domain->nid == NUMA_NO_NODE)
-		domain->nid = domain_update_device_node(domain);
-
-	/*
-	 * First-level translation restricts the input-address to a
-	 * canonical address (i.e., address bits 63:N have the same
-	 * value as address bit [N-1], where N is 48-bits with 4-level
-	 * paging and 57-bits with 5-level paging). Hence, skip bit
-	 * [N-1].
-	 */
-	if (domain->use_first_level)
-		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw - 1);
-	else
-		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw);
-
-	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);
-	domain_update_iotlb(domain);
-}
-
 struct context_entry *iommu_context_addr(struct intel_iommu *iommu, u8 bus,
 					 u8 devfn, int alloc)
 {
@@ -1589,7 +1507,7 @@ int domain_attach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 		ret = xa_err(curr) ? : -EBUSY;
 		goto err_clear;
 	}
-	domain_update_iommu_cap(domain);
+	domain_update_iotlb(domain);
 
 	spin_unlock(&iommu->lock);
 	return 0;
@@ -1615,7 +1533,7 @@ void domain_detach_iommu(struct dmar_domain *domain, struct intel_iommu *iommu)
 		clear_bit(info->did, iommu->domain_ids);
 		xa_erase(&domain->iommu_array, iommu->seq_id);
 		domain->nid = NUMA_NO_NODE;
-		domain_update_iommu_cap(domain);
+		domain_update_iotlb(domain);
 		kfree(info);
 	}
 	spin_unlock(&iommu->lock);
-- 
2.34.1

