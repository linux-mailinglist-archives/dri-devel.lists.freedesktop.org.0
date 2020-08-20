Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FACA24C147
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE3B6E591;
	Thu, 20 Aug 2020 15:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 459F66E591
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C0E61045;
 Thu, 20 Aug 2020 08:09:05 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3F923F6CF;
 Thu, 20 Aug 2020 08:09:01 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 03/18] ARM/dma-mapping: Merge IOMMU ops
Date: Thu, 20 Aug 2020 16:08:22 +0100
Message-Id: <bcab0427a3e827f4a4c033fbdf61239c8449773c.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_sync_* operations are now the only difference between the
coherent and non-coherent IOMMU ops. Some minor tweaks to make those
safe for coherent devices with minimal overhead, and we can condense
down to a single set of DMA ops.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mm/dma-mapping.c | 41 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 1bb7e9608f75..0537c97cebe1 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1677,6 +1677,9 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
+	if (dev->dma_coherent)
+		return;
+
 	for_each_sg(sg, s, nents, i)
 		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
 
@@ -1696,6 +1699,9 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
+	if (dev->dma_coherent)
+		return;
+
 	for_each_sg(sg, s, nents, i)
 		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
 }
@@ -1829,12 +1835,13 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
+	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
 
-	if (!iova)
+	if (dev->dma_coherent || !iova)
 		return;
 
+	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
 	__dma_page_dev_to_cpu(page, offset, size, dir);
 }
 
@@ -1843,12 +1850,13 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
+	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
 
-	if (!iova)
+	if (dev->dma_coherent || !iova)
 		return;
 
+	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
 	__dma_page_cpu_to_dev(page, offset, size, dir);
 }
 
@@ -1872,22 +1880,6 @@ static const struct dma_map_ops iommu_ops = {
 	.unmap_resource		= arm_iommu_unmap_resource,
 };
 
-static const struct dma_map_ops iommu_coherent_ops = {
-	.alloc		= arm_iommu_alloc_attrs,
-	.free		= arm_iommu_free_attrs,
-	.mmap		= arm_iommu_mmap_attrs,
-	.get_sgtable	= arm_iommu_get_sgtable,
-
-	.map_page	= arm_iommu_map_page,
-	.unmap_page	= arm_iommu_unmap_page,
-
-	.map_sg		= arm_iommu_map_sg,
-	.unmap_sg	= arm_iommu_unmap_sg,
-
-	.map_resource	= arm_iommu_map_resource,
-	.unmap_resource	= arm_iommu_unmap_resource,
-};
-
 /**
  * arm_iommu_create_mapping
  * @bus: pointer to the bus holding the client device (for IOMMU calls)
@@ -2067,11 +2059,6 @@ void arm_iommu_detach_device(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(arm_iommu_detach_device);
 
-static const struct dma_map_ops *arm_get_iommu_dma_map_ops(bool coherent)
-{
-	return coherent ? &iommu_coherent_ops : &iommu_ops;
-}
-
 static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
 				    const struct iommu_ops *iommu)
 {
@@ -2118,8 +2105,6 @@ static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 static void arm_teardown_iommu_dma_ops(struct device *dev) { }
 
-#define arm_get_iommu_dma_map_ops arm_get_dma_map_ops
-
 #endif	/* CONFIG_ARM_DMA_USE_IOMMU */
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
@@ -2141,7 +2126,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		return;
 
 	if (arm_setup_iommu_dma_ops(dev, dma_base, size, iommu))
-		dma_ops = arm_get_iommu_dma_map_ops(coherent);
+		dma_ops = &iommu_ops;
 	else
 		dma_ops = arm_get_dma_map_ops(coherent);
 
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
