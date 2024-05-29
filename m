Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD938D2C8A
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2D113146;
	Wed, 29 May 2024 05:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+V7ROdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39250113028
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960990; x=1748496990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icmPwJxBqq/SYdv+MT5vO+QjUq8IQyphhpw+Dkkb0Fw=;
 b=R+V7ROdXZcRSCRJwY4BfQGdEcuLRtardVySb8UDbPTcLOM+g5a9ll2j+
 SDNWz2H5Gxd36khj6eCLlwekIaLgPDPy56JYP/Obv/aRNK7aikMzXPm+w
 +MvrU44+WZM4Zrlil0RKKj3sQEo0vaE2FE3Bg47SDXqn6ilX4AP1BWXIX
 9vk4IvMDllR2VKmxbGkzgeyYErPxzm911k6+9FSWs3jgsmZZnthnS9C5s
 im9rQJTXCWI6oMDB7vrn6joVMnzE1oPUodaGOEVMPfWvAHEyFklmAl2NP
 UdMwHh1JPk0W7zO7m8PTsuzuKnhDqeol1dlZNK+AJuOFZKvrw/h/kixrm Q==;
X-CSE-ConnectionGUID: itMfuCX9SP+1Z/0EXu6C8A==
X-CSE-MsgGUID: OROs5oTeR1GNVKf4ywAFGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569100"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:36:29 -0700
X-CSE-ConnectionGUID: esSWeCJpSSi5aauFREJ3HQ==
X-CSE-MsgGUID: Fk69VRxaR02KBzRZ+jyvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257788"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:36:22 -0700
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
Subject: [PATCH 18/20] iommu/vt-d: Enhance compatibility check for paging
 domain attach
Date: Wed, 29 May 2024 13:32:48 +0800
Message-Id: <20240529053250.91284-19-baolu.lu@linux.intel.com>
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

The driver now supports domain_alloc_paging, ensuring that a valid device
pointer is provided whenever a paging domain is allocated. Additionally,
the dmar_domain attributes are set up at the time of allocation.

Consistent with the established semantics in the IOMMU core, if a domain is
attached to a device and found to be incompatible with the IOMMU hardware
capabilities, the operation will return an -EINVAL error. This implicitly
advises the caller to allocate a new domain for the device and attempt the
domain attachment again.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 39 ++++++++++++++++++-------------------
 drivers/iommu/intel/pasid.c | 28 +-------------------------
 2 files changed, 20 insertions(+), 47 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 693a6d7c79ed..e9393f5c2c50 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3826,27 +3826,26 @@ int prepare_domain_attach_device(struct iommu_domain *domain,
 	if (domain->dirty_ops && !ssads_supported(iommu))
 		return -EINVAL;
 
-	/* check if this iommu agaw is sufficient for max mapped address */
-	addr_width = agaw_to_width(iommu->agaw);
-	if (addr_width > cap_mgaw(iommu->cap))
-		addr_width = cap_mgaw(iommu->cap);
-
-	if (dmar_domain->max_addr > (1LL << addr_width))
+	if (dmar_domain->iommu_coherency !=
+			iommu_paging_structure_coherency(iommu))
 		return -EINVAL;
-	dmar_domain->gaw = addr_width;
-
-	/*
-	 * Knock out extra levels of page tables if necessary
-	 */
-	while (iommu->agaw < dmar_domain->agaw) {
-		struct dma_pte *pte;
-
-		pte = dmar_domain->pgd;
-		if (dma_pte_present(pte)) {
-			dmar_domain->pgd = phys_to_virt(dma_pte_addr(pte));
-			iommu_free_page(pte);
-		}
-		dmar_domain->agaw--;
+
+	if (domain->type & __IOMMU_DOMAIN_PAGING) {
+		if (dmar_domain->iommu_superpage !=
+				iommu_superpage_capability(iommu, dmar_domain->use_first_level))
+			return -EINVAL;
+
+		if (dmar_domain->use_first_level &&
+				(!sm_supported(iommu) || !ecap_flts(iommu->ecap)))
+			return -EINVAL;
+
+		/* check if this iommu agaw is sufficient for max mapped address */
+		addr_width = agaw_to_width(iommu->agaw);
+		if (addr_width > cap_mgaw(iommu->cap))
+			addr_width = cap_mgaw(iommu->cap);
+
+		if (dmar_domain->gaw > addr_width || dmar_domain->agaw > iommu->agaw)
+			return -EINVAL;
 	}
 
 	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev) &&
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index abce19e2ad6f..573e1b8e3cfb 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -345,25 +345,6 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 	return 0;
 }
 
-/*
- * Skip top levels of page tables for iommu which has less agaw
- * than default. Unnecessary for PT mode.
- */
-static int iommu_skip_agaw(struct dmar_domain *domain,
-			   struct intel_iommu *iommu,
-			   struct dma_pte **pgd)
-{
-	int agaw;
-
-	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
-		*pgd = phys_to_virt(dma_pte_addr(*pgd));
-		if (!dma_pte_present(*pgd))
-			return -EINVAL;
-	}
-
-	return agaw;
-}
-
 /*
  * Set up the scalable mode pasid entry for second only translation type.
  */
@@ -374,7 +355,6 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 	struct pasid_entry *pte;
 	struct dma_pte *pgd;
 	u64 pgd_val;
-	int agaw;
 	u16 did;
 
 	/*
@@ -388,12 +368,6 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 	}
 
 	pgd = domain->pgd;
-	agaw = iommu_skip_agaw(domain, iommu, &pgd);
-	if (agaw < 0) {
-		dev_err(dev, "Invalid domain page table\n");
-		return -EINVAL;
-	}
-
 	pgd_val = virt_to_phys(pgd);
 	did = domain_id_iommu(domain, iommu);
 
@@ -412,7 +386,7 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 	pasid_clear_entry(pte);
 	pasid_set_domain_id(pte, did);
 	pasid_set_slptr(pte, pgd_val);
-	pasid_set_address_width(pte, agaw);
+	pasid_set_address_width(pte, domain->agaw);
 	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_SL_ONLY);
 	pasid_set_fault_enable(pte);
 	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
-- 
2.34.1

