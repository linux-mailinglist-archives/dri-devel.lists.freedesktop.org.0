Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC41292CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556236E201;
	Mon, 23 Dec 2019 08:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE16E483
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 15:04:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m8so11371980edi.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 07:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qGY02LH8j9uJiNJ+7eMIAm0CaJsXFJgRNCiaAq5tb0=;
 b=qTtqyf7EPcVGfZE9BAmy8YlJfuqgUD6Tq0c2TYbh7m911PENWTukytx1Femz8yDspg
 SH0mLPSkjN1U5TR2P92gaDvjj6aC9DPQlXBWRgUIgURlUMGPgdC6EkqPyHuJQQTtoFeQ
 toU41vmZlcGDnzGFWy7hGt9MifLqCmMNCr/rf4Lbjz/DozpwSscM/uUHd2/+Lq8bC/Nl
 1X4sPYnK/OY3rFBmxqyjJnQnlzyivLlICWoel/3T6MogTJkHhC/rJAmPtGDiGJVhS418
 kOk5HSlGzsLwklC042BYPEHZuOv6CSpAuGncxnSUyLs5kYxFqJwJLaoGahNPhuCd1rIF
 0irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qGY02LH8j9uJiNJ+7eMIAm0CaJsXFJgRNCiaAq5tb0=;
 b=nUb8h9XrbMztmMSULQe/fQyWKhsnmG+u0dpb2DTDSQiTZzwfidS60F5DQebuWzNW/9
 ABhSVUeu2GvdvDxig+oxqdAteTSI/f477MOvEFx3jYrOm47NeYYTLSoiRrxzq1HvYm5B
 gR62ToALLcuu1np/nQ3c2AH20G3yfOXrX+ikXoyJpSiDbeoUjRfEVmKuA+DqBSYtJDNM
 NDhN56iKoE2fkTZuqeTpGsLa4j7R2I9z+NCsQbBg6pzwaRW4bVGie/KVIPLbHp0rjfHX
 f3YdrsVMpHja+fzYTI8msJXq+9+FASj7DoYqnmm8MpptAd5G0HZyoHi5nk8iknc6c9RR
 ts/A==
X-Gm-Message-State: APjAAAULFzg9Mr5p0QxF1i044gUxaQJHVvewihZTeS1UsH7Kewwn9XOP
 6Qh39atnw9DxyvoWB8n5mUbFYw==
X-Google-Smtp-Source: APXvYqykuleswl5AzWAw7pkmqPrpJkLagIaSkJpilGdR2JTEiuiCJqHvbqIfgc+FqZbeHj/n+RW3Cw==
X-Received: by 2002:a17:906:80b:: with SMTP id
 e11mr22288275ejd.278.1576940679670; 
 Sat, 21 Dec 2019 07:04:39 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
 by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 07:04:39 -0800 (PST)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 4/8] iommu: Handle freelists when using deferred flushing in
 iommu drivers
Date: Sat, 21 Dec 2019 15:03:56 +0000
Message-Id: <20191221150402.13868-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the iommu_unmap_fast to return newly freed page table pages and
pass the freelist to queue_iova in the dma-iommu ops path.

This is useful for iommu drivers (in this case the intel iommu driver)
which need to wait for the ioTLB to be flushed before newly
free/unmapped page table pages can be freed. This way we can still batch
ioTLB free operations and handle the freelists.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/amd_iommu.c       | 14 ++++++++-
 drivers/iommu/arm-smmu-v3.c     |  3 +-
 drivers/iommu/arm-smmu.c        |  3 +-
 drivers/iommu/dma-iommu.c       | 45 ++++++++++++++++++++++-------
 drivers/iommu/exynos-iommu.c    |  3 +-
 drivers/iommu/intel-iommu.c     | 51 +++++++++++++++++++++------------
 drivers/iommu/iommu.c           | 29 ++++++++++++++-----
 drivers/iommu/ipmmu-vmsa.c      |  3 +-
 drivers/iommu/msm_iommu.c       |  3 +-
 drivers/iommu/mtk_iommu.c       |  3 +-
 drivers/iommu/mtk_iommu_v1.c    |  3 +-
 drivers/iommu/omap-iommu.c      |  3 +-
 drivers/iommu/qcom_iommu.c      |  3 +-
 drivers/iommu/rockchip-iommu.c  |  3 +-
 drivers/iommu/s390-iommu.c      |  3 +-
 drivers/iommu/tegra-gart.c      |  3 +-
 drivers/iommu/tegra-smmu.c      |  3 +-
 drivers/iommu/virtio-iommu.c    |  3 +-
 drivers/vfio/vfio_iommu_type1.c |  2 +-
 include/linux/iommu.h           | 25 ++++++++++++----
 20 files changed, 151 insertions(+), 57 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index bd25674ee4db..e8a4c0842624 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2542,7 +2542,8 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
 
 static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
 			      size_t page_size,
-			      struct iommu_iotlb_gather *gather)
+			      struct iommu_iotlb_gather *gather,
+			      struct page **freelist)
 {
 	struct protection_domain *domain = to_pdomain(dom);
 
@@ -2668,6 +2669,16 @@ static void amd_iommu_flush_iotlb_all(struct iommu_domain *domain)
 	spin_unlock_irqrestore(&dom->lock, flags);
 }
 
+static void amd_iommu_flush_iotlb_range(struct iommu_domain *domain,
+					unsigned long iova, size_t size,
+					struct page *freelist)
+{
+	struct protection_domain *dom = to_pdomain(domain);
+
+	domain_flush_pages(dom, iova, size);
+	domain_flush_complete(dom);
+}
+
 static void amd_iommu_iotlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
@@ -2692,6 +2703,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
 	.flush_iotlb_all = amd_iommu_flush_iotlb_all,
+	.flush_iotlb_range = amd_iommu_flush_iotlb_range,
 	.iotlb_sync = amd_iommu_iotlb_sync,
 };
 
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index effe72eb89e7..a27d4bf4492c 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2459,7 +2459,8 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			     size_t size, struct iommu_iotlb_gather *gather)
+			     size_t size, struct iommu_iotlb_gather *gather,
+			     struct page **freelist)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 4f1a350d9529..ea1ab3387a07 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1205,7 +1205,8 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			     size_t size, struct iommu_iotlb_gather *gather)
+			     size_t size, struct iommu_iotlb_gather *gather,
+			     struct page **freelist)
 {
 	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
 	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0cc702a70a96..df28facdfb8b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -50,6 +50,19 @@ struct iommu_dma_cookie {
 	struct iommu_domain		*fq_domain;
 };
 
+static void iommu_dma_entry_dtor(unsigned long data)
+{
+	struct page *freelist = (struct page *)data;
+
+	while (freelist != NULL) {
+		unsigned long p = (unsigned long)page_address(freelist);
+
+		freelist = freelist->freelist;
+		free_page(p);
+	}
+}
+
+
 static inline size_t cookie_msi_granule(struct iommu_dma_cookie *cookie)
 {
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE)
@@ -345,7 +358,8 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
 			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
 		cookie->fq_domain = domain;
-		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all, NULL);
+		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
+				iommu_dma_entry_dtor);
 	}
 
 	if (!dev)
@@ -439,7 +453,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 }
 
 static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
-		dma_addr_t iova, size_t size)
+		dma_addr_t iova, size_t size, struct page *freelist)
 {
 	struct iova_domain *iovad = &cookie->iovad;
 
@@ -448,7 +462,8 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		cookie->msi_iova -= size;
 	else if (cookie->fq_domain)	/* non-strict mode */
 		queue_iova(iovad, iova_pfn(iovad, iova),
-				size >> iova_shift(iovad), 0);
+				size >> iova_shift(iovad),
+				(unsigned long) freelist);
 	else
 		free_iova_fast(iovad, iova_pfn(iovad, iova),
 				size >> iova_shift(iovad));
@@ -462,18 +477,26 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, dma_addr);
 	struct iommu_iotlb_gather iotlb_gather;
+	struct page *freelist = NULL;
 	size_t unmapped;
 
 	dma_addr -= iova_off;
 	size = iova_align(iovad, size + iova_off);
 	iommu_iotlb_gather_init(&iotlb_gather);
 
-	unmapped = iommu_unmap_fast(domain, dma_addr, size, &iotlb_gather);
+	unmapped = iommu_unmap_fast(domain, dma_addr, size, &iotlb_gather,
+			&freelist);
 	WARN_ON(unmapped != size);
 
-	if (!cookie->fq_domain)
-		iommu_tlb_sync(domain, &iotlb_gather);
-	iommu_dma_free_iova(cookie, dma_addr, size);
+	if (!cookie->fq_domain) {
+		if (domain->ops->flush_iotlb_range)
+			domain->ops->flush_iotlb_range(domain, dma_addr, size,
+					freelist);
+		else
+			iommu_tlb_sync(domain, &iotlb_gather);
+	}
+
+	iommu_dma_free_iova(cookie, dma_addr, size, freelist);
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
@@ -495,7 +518,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		return DMA_MAPPING_ERROR;
 
 	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
-		iommu_dma_free_iova(cookie, iova, size);
+		iommu_dma_free_iova(cookie, iova, size, NULL);
 		return DMA_MAPPING_ERROR;
 	}
 	return iova + iova_off;
@@ -650,7 +673,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 out_free_sg:
 	sg_free_table(&sgt);
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size);
+	iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_pages:
 	__iommu_dma_free_pages(pages, count);
 	return NULL;
@@ -901,7 +924,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	return __finalise_sg(dev, sg, nents, iova);
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, iova_len);
+	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
 	return 0;
@@ -1194,7 +1217,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return msi_page;
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size);
+	iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_page:
 	kfree(msi_page);
 	return NULL;
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..e6456eb8ac4d 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1129,7 +1129,8 @@ static void exynos_iommu_tlb_invalidate_entry(struct exynos_iommu_domain *domain
 
 static size_t exynos_iommu_unmap(struct iommu_domain *iommu_domain,
 				 unsigned long l_iova, size_t size,
-				 struct iommu_iotlb_gather *gather)
+				 struct iommu_iotlb_gather *gather,
+				 struct page **freelist)
 {
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	sysmmu_iova_t iova = (sysmmu_iova_t)l_iova;
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 8d72ea0fb843..675ca2aa6e20 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1145,9 +1145,9 @@ static struct page *dma_pte_clear_level(struct dmar_domain *domain, int level,
    pages can only be freed after the IOTLB flush has been done. */
 static struct page *domain_unmap(struct dmar_domain *domain,
 				 unsigned long start_pfn,
-				 unsigned long last_pfn)
+				 unsigned long last_pfn,
+				 struct page *freelist)
 {
-	struct page *freelist;
 
 	BUG_ON(!domain_pfn_supported(domain, start_pfn));
 	BUG_ON(!domain_pfn_supported(domain, last_pfn));
@@ -1155,7 +1155,8 @@ static struct page *domain_unmap(struct dmar_domain *domain,
 
 	/* we don't need lock here; nobody else touches the iova range */
 	freelist = dma_pte_clear_level(domain, agaw_to_level(domain->agaw),
-				       domain->pgd, 0, start_pfn, last_pfn, NULL);
+				       domain->pgd, 0, start_pfn, last_pfn,
+				       freelist);
 
 	/* free pgd */
 	if (start_pfn == 0 && last_pfn == DOMAIN_MAX_PFN(domain->gaw)) {
@@ -1914,7 +1915,8 @@ static void domain_exit(struct dmar_domain *domain)
 	if (domain->pgd) {
 		struct page *freelist;
 
-		freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
+		freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw),
+				NULL);
 		dma_free_pagelist(freelist);
 	}
 
@@ -3541,7 +3543,7 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
 	if (dev_is_pci(dev))
 		pdev = to_pci_dev(dev);
 
-	freelist = domain_unmap(domain, start_pfn, last_pfn);
+	freelist = domain_unmap(domain, start_pfn, last_pfn, NULL);
 	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
 			!has_iova_flush_queue(&domain->iovad)) {
 		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
@@ -4607,7 +4609,7 @@ static int intel_iommu_memory_notifier(struct notifier_block *nb,
 			struct page *freelist;
 
 			freelist = domain_unmap(si_domain, start_vpfn,
-					last_vpfn);
+					last_vpfn, NULL);
 
 			rcu_read_lock();
 			for_each_active_iommu(iommu, drhd)
@@ -5412,13 +5414,12 @@ static int intel_iommu_map(struct iommu_domain *domain,
 
 static size_t intel_iommu_unmap(struct iommu_domain *domain,
 				unsigned long iova, size_t size,
-				struct iommu_iotlb_gather *gather)
+				struct iommu_iotlb_gather *gather,
+				struct page **freelist)
 {
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-	struct page *freelist = NULL;
 	unsigned long start_pfn, last_pfn;
-	unsigned int npages;
-	int iommu_id, level = 0;
+	int level = 0;
 
 	/* Cope with horrid API which requires us to unmap more than the
 	   size argument if it happens to be a large-page mapping. */
@@ -5432,20 +5433,33 @@ static size_t intel_iommu_unmap(struct iommu_domain *domain,
 	start_pfn = iova >> VTD_PAGE_SHIFT;
 	last_pfn = (iova + size - 1) >> VTD_PAGE_SHIFT;
 
-	freelist = domain_unmap(dmar_domain, start_pfn, last_pfn);
+	*freelist = domain_unmap(dmar_domain, start_pfn, last_pfn, *freelist);
 
-	npages = last_pfn - start_pfn + 1;
+	if (dmar_domain->max_addr == iova + size)
+		dmar_domain->max_addr = iova;
+
+	return size;
+}
+
+static void intel_iommu_flush_iotlb_range(struct iommu_domain *domain,
+		unsigned long iova, size_t size,
+		struct page *freelist)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	unsigned long start_pfn, last_pfn;
+	unsigned long iova_pfn = IOVA_PFN(iova);
+	unsigned long nrpages;
+	int iommu_id;
+
+	nrpages = aligned_nrpages(iova, size);
+	start_pfn = mm_to_dma_pfn(iova_pfn);
+	last_pfn = start_pfn + nrpages - 1;
 
 	for_each_domain_iommu(iommu_id, dmar_domain)
 		iommu_flush_iotlb_psi(g_iommus[iommu_id], dmar_domain,
-				      start_pfn, npages, !freelist, 0);
+				      start_pfn, nrpages, !freelist, 0);
 
 	dma_free_pagelist(freelist);
-
-	if (dmar_domain->max_addr == iova + size)
-		dmar_domain->max_addr = iova;
-
-	return size;
 }
 
 static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
@@ -5902,6 +5916,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.aux_get_pasid		= intel_iommu_aux_get_pasid,
 	.map			= intel_iommu_map,
 	.unmap			= intel_iommu_unmap,
+	.flush_iotlb_range      = intel_iommu_flush_iotlb_range,
 	.iova_to_phys		= intel_iommu_iova_to_phys,
 	.add_device		= intel_iommu_add_device,
 	.remove_device		= intel_iommu_remove_device,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index db7bfd4f2d20..cec728f40d9c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -667,7 +667,7 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group,
 
 	}
 
-	iommu_flush_tlb_all(domain);
+	iommu_flush_iotlb_all(domain);
 
 out:
 	iommu_put_resv_regions(dev, &mappings);
@@ -1961,11 +1961,13 @@ EXPORT_SYMBOL_GPL(iommu_map_atomic);
 
 static size_t __iommu_unmap(struct iommu_domain *domain,
 			    unsigned long iova, size_t size,
-			    struct iommu_iotlb_gather *iotlb_gather)
+			    struct iommu_iotlb_gather *iotlb_gather,
+			    struct page **freelist)
 {
 	const struct iommu_ops *ops = domain->ops;
 	size_t unmapped_page, unmapped = 0;
 	unsigned long orig_iova = iova;
+	struct page *freelist_head = NULL;
 	unsigned int min_pagesz;
 
 	if (unlikely(ops->unmap == NULL ||
@@ -1998,7 +2000,8 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	while (unmapped < size) {
 		size_t pgsize = iommu_pgsize(domain, iova, size - unmapped);
 
-		unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather);
+		unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather,
+				&freelist_head);
 		if (!unmapped_page)
 			break;
 
@@ -2009,6 +2012,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		unmapped += unmapped_page;
 	}
 
+	if (freelist)
+		*freelist = freelist_head;
+
 	trace_unmap(orig_iova, size, unmapped);
 	return unmapped;
 }
@@ -2016,12 +2022,20 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 size_t iommu_unmap(struct iommu_domain *domain,
 		   unsigned long iova, size_t size)
 {
+	const struct iommu_ops *ops = domain->ops;
 	struct iommu_iotlb_gather iotlb_gather;
+	struct page *freelist;
 	size_t ret;
 
 	iommu_iotlb_gather_init(&iotlb_gather);
-	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
-	iommu_tlb_sync(domain, &iotlb_gather);
+	ret = __iommu_unmap(domain, iova, size, &iotlb_gather,
+			&freelist);
+
+	if (ops->flush_iotlb_range)
+		ops->flush_iotlb_range(domain, iova, ret,
+				freelist);
+	else
+		iommu_tlb_sync(domain, &iotlb_gather);
 
 	return ret;
 }
@@ -2029,9 +2043,10 @@ EXPORT_SYMBOL_GPL(iommu_unmap);
 
 size_t iommu_unmap_fast(struct iommu_domain *domain,
 			unsigned long iova, size_t size,
-			struct iommu_iotlb_gather *iotlb_gather)
+			struct iommu_iotlb_gather *iotlb_gather,
+			struct page **freelist)
 {
-	return __iommu_unmap(domain, iova, size, iotlb_gather);
+	return __iommu_unmap(domain, iova, size, iotlb_gather, freelist);
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d02edd2751f3..63bbee653859 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -693,7 +693,8 @@ static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
 }
 
 static size_t ipmmu_unmap(struct iommu_domain *io_domain, unsigned long iova,
-			  size_t size, struct iommu_iotlb_gather *gather)
+			  size_t size, struct iommu_iotlb_gather *gather,
+			  struct page **freelist)
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
 
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 93f14bca26ee..66d1587ab714 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -518,7 +518,8 @@ static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t msm_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
-			      size_t len, struct iommu_iotlb_gather *gather)
+			      size_t len, struct iommu_iotlb_gather *gather,
+			      struct page **freelist)
 {
 	struct msm_priv *priv = to_msm_priv(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fc1f5ecf91e..6bd9f39bb259 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -402,7 +402,8 @@ static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 
 static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 			      unsigned long iova, size_t size,
-			      struct iommu_iotlb_gather *gather)
+			      struct iommu_iotlb_gather *gather,
+			      struct page **freelist)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index e93b94ecac45..f94d225c3404 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -325,7 +325,8 @@ static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 
 static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 			      unsigned long iova, size_t size,
-			      struct iommu_iotlb_gather *gather)
+			      struct iommu_iotlb_gather *gather,
+			      struct page **freelist)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index be551cc34be4..c5e012267f2b 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1383,7 +1383,8 @@ static int omap_iommu_map(struct iommu_domain *domain, unsigned long da,
 }
 
 static size_t omap_iommu_unmap(struct iommu_domain *domain, unsigned long da,
-			       size_t size, struct iommu_iotlb_gather *gather)
+			       size_t size, struct iommu_iotlb_gather *gather,
+			       struct page **freelist)
 {
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
 	struct device *dev = omap_domain->dev;
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 52f38292df5b..99ebf34e50be 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -440,7 +440,8 @@ static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t qcom_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t size, struct iommu_iotlb_gather *gather)
+			       size_t size, struct iommu_iotlb_gather *gather,
+			       struct page **freelist)
 {
 	size_t ret;
 	unsigned long flags;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index b33cdd5aad81..ec16e01c376a 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -795,7 +795,8 @@ static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
 }
 
 static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
-			     size_t size, struct iommu_iotlb_gather *gather)
+			     size_t size, struct iommu_iotlb_gather *gather,
+			     struct page **freelist)
 {
 	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 1137f3ddcb85..d69d7cf4dee3 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -315,7 +315,8 @@ static phys_addr_t s390_iommu_iova_to_phys(struct iommu_domain *domain,
 
 static size_t s390_iommu_unmap(struct iommu_domain *domain,
 			       unsigned long iova, size_t size,
-			       struct iommu_iotlb_gather *gather)
+			       struct iommu_iotlb_gather *gather,
+			       struct page **freelist)
 {
 	struct s390_domain *s390_domain = to_s390_domain(domain);
 	int flags = ZPCI_PTE_INVALID;
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 3fb7ba72507d..68e7eee9172f 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -207,7 +207,8 @@ static inline int __gart_iommu_unmap(struct gart_device *gart,
 }
 
 static size_t gart_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t bytes, struct iommu_iotlb_gather *gather)
+			       size_t bytes, struct iommu_iotlb_gather *gather,
+			       struct page **freelist)
 {
 	struct gart_device *gart = gart_handle;
 	int err;
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 63a147b623e6..0c5e5f2c3c7d 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -686,7 +686,8 @@ static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t size, struct iommu_iotlb_gather *gather)
+			       size_t size, struct iommu_iotlb_gather *gather,
+			       struct page **freelist)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 315c7cc4f99d..e74baab27b61 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -750,7 +750,8 @@ static int viommu_map(struct iommu_domain *domain, unsigned long iova,
 }
 
 static size_t viommu_unmap(struct iommu_domain *domain, unsigned long iova,
-			   size_t size, struct iommu_iotlb_gather *gather)
+			   size_t size, struct iommu_iotlb_gather *gather,
+			   struct page *freelist)
 {
 	int ret = 0;
 	size_t unmapped;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 2ada8e6cdb88..d24ea1181c03 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -685,7 +685,7 @@ static size_t unmap_unpin_fast(struct vfio_domain *domain,
 
 	if (entry) {
 		unmapped = iommu_unmap_fast(domain->domain, *iova, len,
-					    iotlb_gather);
+					    iotlb_gather, NULL);
 
 		if (!unmapped) {
 			kfree(entry);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f2223cbb5fd5..61cac25410b5 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -219,6 +219,7 @@ struct iommu_iotlb_gather {
  * @map: map a physically contiguous memory region to an iommu domain
  * @unmap: unmap a physically contiguous memory region from an iommu domain
  * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
+ * @flush_iotlb_range: Flush given iova range of hardware TLBs for this domain
  * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
  * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
  *            queue
@@ -262,8 +263,12 @@ struct iommu_ops {
 	int (*map)(struct iommu_domain *domain, unsigned long iova,
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
-		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
+		     size_t size, struct iommu_iotlb_gather *iotlb_gather,
+		     struct page **freelist);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
+	void (*flush_iotlb_range)(struct iommu_domain *domain,
+			unsigned long iova, size_t size,
+			struct page *freelist);
 	void (*iotlb_sync_map)(struct iommu_domain *domain);
 	void (*iotlb_sync)(struct iommu_domain *domain,
 			   struct iommu_iotlb_gather *iotlb_gather);
@@ -444,7 +449,8 @@ extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 			  size_t size);
 extern size_t iommu_unmap_fast(struct iommu_domain *domain,
 			       unsigned long iova, size_t size,
-			       struct iommu_iotlb_gather *iotlb_gather);
+			       struct iommu_iotlb_gather *iotlb_gather,
+			       struct page **freelist);
 extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			   struct scatterlist *sg,unsigned int nents, int prot);
 extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
@@ -518,12 +524,20 @@ extern void iommu_domain_window_disable(struct iommu_domain *domain, u32 wnd_nr)
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
 
-static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
+static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
 {
 	if (domain->ops->flush_iotlb_all)
 		domain->ops->flush_iotlb_all(domain);
 }
 
+static inline void flush_iotlb_range(struct iommu_domain *domain,
+			unsigned long iova, size_t size,
+			struct page *freelist)
+{
+	if (domain->ops->flush_iotlb_range)
+		domain->ops->flush_iotlb_range(domain, iova, size, freelist);
+}
+
 static inline void iommu_tlb_sync(struct iommu_domain *domain,
 				  struct iommu_iotlb_gather *iotlb_gather)
 {
@@ -699,7 +713,8 @@ static inline size_t iommu_unmap(struct iommu_domain *domain,
 
 static inline size_t iommu_unmap_fast(struct iommu_domain *domain,
 				      unsigned long iova, int gfp_order,
-				      struct iommu_iotlb_gather *iotlb_gather)
+				      struct iommu_iotlb_gather *iotlb_gather,
+				      struct page **freelist)
 {
 	return 0;
 }
@@ -718,7 +733,7 @@ static inline size_t iommu_map_sg_atomic(struct iommu_domain *domain,
 	return 0;
 }
 
-static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
+static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
 {
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
