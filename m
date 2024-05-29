Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC928D2C92
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E95112A26;
	Wed, 29 May 2024 05:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaZT/mxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52C0113147
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716961004; x=1748497004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uZ18e0DpTIgHLOpzfBuHcXvVKSj+fUz+S5osI7EsSTY=;
 b=gaZT/mxpLDIP2gP2yr2JZam0yRyejPM5ASQJzfEpJ3Ukat7/5DYG/XKY
 2MEvXKQNL56+IVwyENHHdIEaPX9A8NrLsRSDYXGxlxGFNVqz3MCwgL8Am
 eXCycmTq9JAghEfqGYiDTA1dQg4opKQWqovTedHahmFxgFqG3fpquv95L
 T1gROj+Dsl26KxbIpe6PrwTy8x6vmgZWDaAtlWEP3tZKEJJ58Q0+BD1Sx
 8u9YZjLN4dN8vz9YStHPG1942TaJ/JMAHolaiW7xRvSpxN5pwM1O3sHkE
 GTTmBteZplAY2AFU7HKA0LAMAif3DUUALxYsJuKv4WE7oC9GsAHYMa1Kj Q==;
X-CSE-ConnectionGUID: s7p4HG/oRyGHeNh9+fGUaA==
X-CSE-MsgGUID: Y2nrLKzgRt6f9fyPqSHedg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569136"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:36:37 -0700
X-CSE-ConnectionGUID: X+RiNsarRtKW3lpRtSJ0IA==
X-CSE-MsgGUID: nvefUVcKRTqj8DSSs+S92A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257811"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:36:32 -0700
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
Subject: [PATCH 20/20] iommu/vt-d: Remove domain_update_iommu_superpage()
Date: Wed, 29 May 2024 13:32:50 +0800
Message-Id: <20240529053250.91284-21-baolu.lu@linux.intel.com>
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

The requirement for consistent super page support across all the IOMMU
hardware in the system has been removed. In the past, if a new IOMMU
was hot-added and lacked consistent super page capability, the hot-add
process would be aborted. However, with the updated attachment semantics,
it is now permissible for the super page capability to vary among
different IOMMU hardware units.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 39 +------------------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 74e005b1c4b4..660d2b6c531b 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -366,36 +366,6 @@ static bool iommu_paging_structure_coherency(struct intel_iommu *iommu)
 			ecap_smpwc(iommu->ecap) : ecap_coherent(iommu->ecap);
 }
 
-static int domain_update_iommu_superpage(struct dmar_domain *domain,
-					 struct intel_iommu *skip)
-{
-	struct dmar_drhd_unit *drhd;
-	struct intel_iommu *iommu;
-	int mask = 0x3;
-
-	if (!intel_iommu_superpage)
-		return 0;
-
-	/* set iommu_superpage to the smallest common denominator */
-	rcu_read_lock();
-	for_each_active_iommu(iommu, drhd) {
-		if (iommu != skip) {
-			if (domain && domain->use_first_level) {
-				if (!cap_fl1gp_support(iommu->cap))
-					mask = 0x1;
-			} else {
-				mask &= cap_super_page_val(iommu->cap);
-			}
-
-			if (!mask)
-				break;
-		}
-	}
-	rcu_read_unlock();
-
-	return fls(mask);
-}
-
 /* Return the super pagesize bitmap if supported. */
 static unsigned long domain_super_pgsize_bitmap(struct dmar_domain *domain)
 {
@@ -2845,8 +2815,8 @@ int dmar_parse_one_satc(struct acpi_dmar_header *hdr, void *arg)
 
 static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 {
-	int sp, ret;
 	struct intel_iommu *iommu = dmaru->iommu;
+	int ret;
 
 	ret = intel_cap_audit(CAP_AUDIT_HOTPLUG_DMAR, iommu);
 	if (ret)
@@ -2858,13 +2828,6 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 		return -ENXIO;
 	}
 
-	sp = domain_update_iommu_superpage(NULL, iommu) - 1;
-	if (sp >= 0 && !(cap_super_page_val(iommu->cap) & (1 << sp))) {
-		pr_warn("%s: Doesn't support large page.\n",
-			iommu->name);
-		return -ENXIO;
-	}
-
 	/*
 	 * Disable translation if already enabled prior to OS handover.
 	 */
-- 
2.34.1

