Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB324C144
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652C86E528;
	Thu, 20 Aug 2020 15:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCF566E528
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF761063;
 Thu, 20 Aug 2020 08:09:01 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B842E3F6CF;
 Thu, 20 Aug 2020 08:08:57 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 02/18] ARM/dma-mapping: Consolidate IOMMU ops callbacks
Date: Thu, 20 Aug 2020 16:08:21 +0100
Message-Id: <beb5f8f04c3bcb906bd9e216305de65efd70e046.1597931876.git.robin.murphy@arm.com>
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

Merge the coherent and non-coherent callbacks down to a single
implementation each, relying on the generic dev->dma_coherent
flag at the points where the difference matters.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/Kconfig          |   4 +-
 arch/arm/mm/dma-mapping.c | 281 +++++++++++---------------------------
 2 files changed, 79 insertions(+), 206 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e00d94b16658..b91273f9fd43 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -19,8 +19,8 @@ config ARM
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU
-	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if SWIOTLB
-	select ARCH_HAS_SYNC_DMA_FOR_CPU if SWIOTLB
+	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if SWIOTLB || ARM_DMA_USE_IOMMU
+	select ARCH_HAS_SYNC_DMA_FOR_CPU if SWIOTLB || ARM_DMA_USE_IOMMU
 	select ARCH_HAS_TEARDOWN_DMA_OPS if MMU
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAVE_CUSTOM_GPIO_H
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index ffa387f343dc..1bb7e9608f75 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1418,13 +1418,13 @@ static void __iommu_free_atomic(struct device *dev, void *cpu_addr,
 		__free_from_pool(cpu_addr, size);
 }
 
-static void *__arm_iommu_alloc_attrs(struct device *dev, size_t size,
-	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs,
-	    int coherent_flag)
+static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
+	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
 {
 	pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL);
 	struct page **pages;
 	void *addr = NULL;
+	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
 
 	*handle = DMA_MAPPING_ERROR;
 	size = PAGE_ALIGN(size);
@@ -1467,19 +1467,7 @@ static void *__arm_iommu_alloc_attrs(struct device *dev, size_t size,
 	return NULL;
 }
 
-static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
-	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
-{
-	return __arm_iommu_alloc_attrs(dev, size, handle, gfp, attrs, NORMAL);
-}
-
-static void *arm_coherent_iommu_alloc_attrs(struct device *dev, size_t size,
-		    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
-{
-	return __arm_iommu_alloc_attrs(dev, size, handle, gfp, attrs, COHERENT);
-}
-
-static int __arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
+static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 		    void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		    unsigned long attrs)
 {
@@ -1493,35 +1481,24 @@ static int __arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma
 	if (vma->vm_pgoff >= nr_pages)
 		return -ENXIO;
 
+	if (!dev->dma_coherent)
+		vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
+
 	err = vm_map_pages(vma, pages, nr_pages);
 	if (err)
 		pr_err("Remapping memory failed: %d\n", err);
 
 	return err;
 }
-static int arm_iommu_mmap_attrs(struct device *dev,
-		struct vm_area_struct *vma, void *cpu_addr,
-		dma_addr_t dma_addr, size_t size, unsigned long attrs)
-{
-	vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
-
-	return __arm_iommu_mmap_attrs(dev, vma, cpu_addr, dma_addr, size, attrs);
-}
-
-static int arm_coherent_iommu_mmap_attrs(struct device *dev,
-		struct vm_area_struct *vma, void *cpu_addr,
-		dma_addr_t dma_addr, size_t size, unsigned long attrs)
-{
-	return __arm_iommu_mmap_attrs(dev, vma, cpu_addr, dma_addr, size, attrs);
-}
 
 /*
  * free a page as defined by the above mapping.
  * Must not be called with IRQs disabled.
  */
-static void __arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
-	dma_addr_t handle, unsigned long attrs, int coherent_flag)
+static void arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
+	dma_addr_t handle, unsigned long attrs)
 {
+	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
 	struct page **pages;
 	size = PAGE_ALIGN(size);
 
@@ -1543,19 +1520,6 @@ static void __arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_ad
 	__iommu_free_buffer(dev, pages, size, attrs);
 }
 
-static void arm_iommu_free_attrs(struct device *dev, size_t size,
-				 void *cpu_addr, dma_addr_t handle,
-				 unsigned long attrs)
-{
-	__arm_iommu_free_attrs(dev, size, cpu_addr, handle, attrs, NORMAL);
-}
-
-static void arm_coherent_iommu_free_attrs(struct device *dev, size_t size,
-		    void *cpu_addr, dma_addr_t handle, unsigned long attrs)
-{
-	__arm_iommu_free_attrs(dev, size, cpu_addr, handle, attrs, COHERENT);
-}
-
 static int arm_iommu_get_sgtable(struct device *dev, struct sg_table *sgt,
 				 void *cpu_addr, dma_addr_t dma_addr,
 				 size_t size, unsigned long attrs)
@@ -1575,8 +1539,7 @@ static int arm_iommu_get_sgtable(struct device *dev, struct sg_table *sgt,
  */
 static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 			  size_t size, dma_addr_t *handle,
-			  enum dma_data_direction dir, unsigned long attrs,
-			  bool is_coherent)
+			  enum dma_data_direction dir, unsigned long attrs)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova, iova_base;
@@ -1596,7 +1559,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		phys_addr_t phys = page_to_phys(sg_page(s));
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
-		if (!is_coherent && (attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
+		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
@@ -1616,70 +1579,6 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 	return ret;
 }
 
-static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
-		     enum dma_data_direction dir, unsigned long attrs,
-		     bool is_coherent)
-{
-	struct scatterlist *s = sg, *dma = sg, *start = sg;
-	int i, count = 0;
-	unsigned int offset = s->offset;
-	unsigned int size = s->offset + s->length;
-	unsigned int max = dma_get_max_seg_size(dev);
-
-	for (i = 1; i < nents; i++) {
-		s = sg_next(s);
-
-		s->dma_address = DMA_MAPPING_ERROR;
-		s->dma_length = 0;
-
-		if (s->offset || (size & ~PAGE_MASK) || size + s->length > max) {
-			if (__map_sg_chunk(dev, start, size, &dma->dma_address,
-			    dir, attrs, is_coherent) < 0)
-				goto bad_mapping;
-
-			dma->dma_address += offset;
-			dma->dma_length = size - offset;
-
-			size = offset = s->offset;
-			start = s;
-			dma = sg_next(dma);
-			count += 1;
-		}
-		size += s->length;
-	}
-	if (__map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs,
-		is_coherent) < 0)
-		goto bad_mapping;
-
-	dma->dma_address += offset;
-	dma->dma_length = size - offset;
-
-	return count+1;
-
-bad_mapping:
-	for_each_sg(sg, s, count, i)
-		__iommu_remove_mapping(dev, sg_dma_address(s), sg_dma_len(s));
-	return 0;
-}
-
-/**
- * arm_coherent_iommu_map_sg - map a set of SG buffers for streaming mode DMA
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to map
- * @dir: DMA transfer direction
- *
- * Map a set of i/o coherent buffers described by scatterlist in streaming
- * mode for DMA. The scatter gather list elements are merged together (if
- * possible) and tagged with the appropriate dma address and length. They are
- * obtained via sg_dma_{address,length}.
- */
-static int arm_coherent_iommu_map_sg(struct device *dev, struct scatterlist *sg,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	return __iommu_map_sg(dev, sg, nents, dir, attrs, true);
-}
-
 /**
  * arm_iommu_map_sg - map a set of SG buffers for streaming mode DMA
  * @dev: valid struct device pointer
@@ -1695,41 +1594,45 @@ static int arm_coherent_iommu_map_sg(struct device *dev, struct scatterlist *sg,
 static int arm_iommu_map_sg(struct device *dev, struct scatterlist *sg,
 		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
-	return __iommu_map_sg(dev, sg, nents, dir, attrs, false);
-}
+	struct scatterlist *s = sg, *dma = sg, *start = sg;
+	int i, count = 0;
+	unsigned int offset = s->offset;
+	unsigned int size = s->offset + s->length;
+	unsigned int max = dma_get_max_seg_size(dev);
 
-static void __iommu_unmap_sg(struct device *dev, struct scatterlist *sg,
-		int nents, enum dma_data_direction dir,
-		unsigned long attrs, bool is_coherent)
-{
-	struct scatterlist *s;
-	int i;
+	for (i = 1; i < nents; i++) {
+		s = sg_next(s);
 
-	for_each_sg(sg, s, nents, i) {
-		if (sg_dma_len(s))
-			__iommu_remove_mapping(dev, sg_dma_address(s),
-					       sg_dma_len(s));
-		if (!is_coherent && (attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+		s->dma_address = DMA_MAPPING_ERROR;
+		s->dma_length = 0;
+
+		if (s->offset || (size & ~PAGE_MASK) || size + s->length > max) {
+			if (__map_sg_chunk(dev, start, size, &dma->dma_address,
+			    dir, attrs) < 0)
+				goto bad_mapping;
+
+			dma->dma_address += offset;
+			dma->dma_length = size - offset;
+
+			size = offset = s->offset;
+			start = s;
+			dma = sg_next(dma);
+			count += 1;
+		}
+		size += s->length;
 	}
-}
+	if (__map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs) < 0)
+		goto bad_mapping;
 
-/**
- * arm_coherent_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to unmap (same as was passed to dma_map_sg)
- * @dir: DMA transfer direction (same as was passed to dma_map_sg)
- *
- * Unmap a set of streaming mode DMA translations.  Again, CPU access
- * rules concerning calls here are the same as for dma_unmap_single().
- */
-static void arm_coherent_iommu_unmap_sg(struct device *dev,
-		struct scatterlist *sg, int nents, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	__iommu_unmap_sg(dev, sg, nents, dir, attrs, true);
+	dma->dma_address += offset;
+	dma->dma_length = size - offset;
+
+	return count+1;
+
+bad_mapping:
+	for_each_sg(sg, s, count, i)
+		__iommu_remove_mapping(dev, sg_dma_address(s), sg_dma_len(s));
+	return 0;
 }
 
 /**
@@ -1747,7 +1650,17 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			       enum dma_data_direction dir,
 			       unsigned long attrs)
 {
-	__iommu_unmap_sg(dev, sg, nents, dir, attrs, false);
+	struct scatterlist *s;
+	int i;
+
+	for_each_sg(sg, s, nents, i) {
+		if (sg_dma_len(s))
+			__iommu_remove_mapping(dev, sg_dma_address(s),
+					       sg_dma_len(s));
+		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+			__dma_page_dev_to_cpu(sg_page(s), s->offset,
+					      s->length, dir);
+	}
 }
 
 /**
@@ -1787,18 +1700,17 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
 }
 
-
 /**
- * arm_coherent_iommu_map_page
+ * arm_iommu_map_page
  * @dev: valid struct device pointer
  * @page: page that buffer resides in
  * @offset: offset into page for start of buffer
  * @size: size of buffer to map
  * @dir: DMA transfer direction
  *
- * Coherent IOMMU aware version of arm_dma_map_page()
+ * IOMMU aware version of arm_dma_map_page()
  */
-static dma_addr_t arm_coherent_iommu_map_page(struct device *dev, struct page *page,
+static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 	     unsigned long offset, size_t size, enum dma_data_direction dir,
 	     unsigned long attrs)
 {
@@ -1806,6 +1718,9 @@ static dma_addr_t arm_coherent_iommu_map_page(struct device *dev, struct page *p
 	dma_addr_t dma_addr;
 	int ret, prot, len = PAGE_ALIGN(size + offset);
 
+	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		__dma_page_cpu_to_dev(page, offset, size, dir);
+
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
 		return dma_addr;
@@ -1822,50 +1737,6 @@ static dma_addr_t arm_coherent_iommu_map_page(struct device *dev, struct page *p
 	return DMA_MAPPING_ERROR;
 }
 
-/**
- * arm_iommu_map_page
- * @dev: valid struct device pointer
- * @page: page that buffer resides in
- * @offset: offset into page for start of buffer
- * @size: size of buffer to map
- * @dir: DMA transfer direction
- *
- * IOMMU aware version of arm_dma_map_page()
- */
-static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
-	     unsigned long offset, size_t size, enum dma_data_direction dir,
-	     unsigned long attrs)
-{
-	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
-		__dma_page_cpu_to_dev(page, offset, size, dir);
-
-	return arm_coherent_iommu_map_page(dev, page, offset, size, dir, attrs);
-}
-
-/**
- * arm_coherent_iommu_unmap_page
- * @dev: valid struct device pointer
- * @handle: DMA address of buffer
- * @size: size of buffer (same as passed to dma_map_page)
- * @dir: DMA transfer direction (same as passed to dma_map_page)
- *
- * Coherent IOMMU aware version of arm_dma_unmap_page()
- */
-static void arm_coherent_iommu_unmap_page(struct device *dev, dma_addr_t handle,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	int offset = handle & ~PAGE_MASK;
-	int len = PAGE_ALIGN(size + offset);
-
-	if (!iova)
-		return;
-
-	iommu_unmap(mapping->domain, iova, len);
-	__free_iova(mapping, iova, len);
-}
-
 /**
  * arm_iommu_unmap_page
  * @dev: valid struct device pointer
@@ -1880,15 +1751,17 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
+	struct page *page;
 	int offset = handle & ~PAGE_MASK;
 	int len = PAGE_ALIGN(size + offset);
 
 	if (!iova)
 		return;
 
-	if ((attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
+	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
+		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
 		__dma_page_dev_to_cpu(page, offset, size, dir);
+	}
 
 	iommu_unmap(mapping->domain, iova, len);
 	__free_iova(mapping, iova, len);
@@ -2000,16 +1873,16 @@ static const struct dma_map_ops iommu_ops = {
 };
 
 static const struct dma_map_ops iommu_coherent_ops = {
-	.alloc		= arm_coherent_iommu_alloc_attrs,
-	.free		= arm_coherent_iommu_free_attrs,
-	.mmap		= arm_coherent_iommu_mmap_attrs,
+	.alloc		= arm_iommu_alloc_attrs,
+	.free		= arm_iommu_free_attrs,
+	.mmap		= arm_iommu_mmap_attrs,
 	.get_sgtable	= arm_iommu_get_sgtable,
 
-	.map_page	= arm_coherent_iommu_map_page,
-	.unmap_page	= arm_coherent_iommu_unmap_page,
+	.map_page	= arm_iommu_map_page,
+	.unmap_page	= arm_iommu_unmap_page,
 
-	.map_sg		= arm_coherent_iommu_map_sg,
-	.unmap_sg	= arm_coherent_iommu_unmap_sg,
+	.map_sg		= arm_iommu_map_sg,
+	.unmap_sg	= arm_iommu_unmap_sg,
 
 	.map_resource	= arm_iommu_map_resource,
 	.unmap_resource	= arm_iommu_unmap_resource,
@@ -2291,7 +2164,7 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
-#ifdef CONFIG_SWIOTLB
+#if defined(CONFIG_SWIOTLB) || defined(CONFIG_ARM_DMA_USE_IOMMU)
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
@@ -2319,4 +2192,4 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
 {
 	__arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
 }
-#endif /* CONFIG_SWIOTLB */
+#endif /* CONFIG_SWIOTLB || CONFIG_ARM_DMA_USE_IOMMU */
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
