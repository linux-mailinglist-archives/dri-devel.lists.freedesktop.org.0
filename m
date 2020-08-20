Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73A24C14E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2F06E959;
	Thu, 20 Aug 2020 15:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C21E36E959
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01F2113E;
 Thu, 20 Aug 2020 08:09:12 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39E1D3F6CF;
 Thu, 20 Aug 2020 08:09:09 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 05/18] ARM/dma-mapping: Switch to iommu_dma_ops
Date: Thu, 20 Aug 2020 16:08:24 +0100
Message-Id: <4b51f1685a7ff88b673bf013ca6c27501e52f9b4.1597931876.git.robin.murphy@arm.com>
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

With the IOMMU ops now looking much the same shape as iommu_dma_ops,
switch them out in favour of the iommu-dma library, currently enhanced
with temporary workarounds that allow it to also sit underneath the
arch-specific API. With that in place, we can now start converting the
remaining IOMMU drivers and consumers to work with IOMMU API default
domains instead.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/Kconfig                 |  24 +-
 arch/arm/include/asm/dma-iommu.h |   8 -
 arch/arm/mm/dma-mapping.c        | 887 +------------------------------
 drivers/iommu/Kconfig            |   8 -
 drivers/media/platform/Kconfig   |   1 -
 5 files changed, 22 insertions(+), 906 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b91273f9fd43..79406fe5cd6b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -133,31 +133,11 @@ config ARM_HAS_SG_CHAIN
 	bool
 
 config ARM_DMA_USE_IOMMU
-	bool
+	def_bool IOMMU_SUPPORT
 	select ARM_HAS_SG_CHAIN
+	select IOMMU_DMA
 	select NEED_SG_DMA_LENGTH
 
-if ARM_DMA_USE_IOMMU
-
-config ARM_DMA_IOMMU_ALIGNMENT
-	int "Maximum PAGE_SIZE order of alignment for DMA IOMMU buffers"
-	range 4 9
-	default 8
-	help
-	  DMA mapping framework by default aligns all buffers to the smallest
-	  PAGE_SIZE order which is greater than or equal to the requested buffer
-	  size. This works well for buffers up to a few hundreds kilobytes, but
-	  for larger buffers it just a waste of address space. Drivers which has
-	  relatively small addressing window (like 64Mib) might run out of
-	  virtual space with just a few allocations.
-
-	  With this parameter you can specify the maximum PAGE_SIZE order for
-	  DMA IOMMU buffers. Larger buffers will be aligned only to this
-	  specified order. The order is expressed as a power of two multiplied
-	  by the PAGE_SIZE.
-
-endif
-
 config SYS_SUPPORTS_APM_EMULATION
 	bool
 
diff --git a/arch/arm/include/asm/dma-iommu.h b/arch/arm/include/asm/dma-iommu.h
index 86405cc81385..f39cfa509fe4 100644
--- a/arch/arm/include/asm/dma-iommu.h
+++ b/arch/arm/include/asm/dma-iommu.h
@@ -13,14 +13,6 @@ struct dma_iommu_mapping {
 	/* iommu specific data */
 	struct iommu_domain	*domain;
 
-	unsigned long		**bitmaps;	/* array of bitmaps */
-	unsigned int		nr_bitmaps;	/* nr of elements in array */
-	unsigned int		extensions;
-	size_t			bitmap_size;	/* size of a single bitmap */
-	size_t			bits;		/* per bitmap */
-	dma_addr_t		base;
-
-	spinlock_t		lock;
 	struct kref		kref;
 };
 
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 0537c97cebe1..0f69ede44cd7 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/dma-direct.h>
+#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/dma-contiguous.h>
@@ -1074,812 +1075,9 @@ static const struct dma_map_ops *arm_get_dma_map_ops(bool coherent)
 
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
 
-static int __dma_info_to_prot(enum dma_data_direction dir, unsigned long attrs)
-{
-	int prot = 0;
-
-	if (attrs & DMA_ATTR_PRIVILEGED)
-		prot |= IOMMU_PRIV;
-
-	switch (dir) {
-	case DMA_BIDIRECTIONAL:
-		return prot | IOMMU_READ | IOMMU_WRITE;
-	case DMA_TO_DEVICE:
-		return prot | IOMMU_READ;
-	case DMA_FROM_DEVICE:
-		return prot | IOMMU_WRITE;
-	default:
-		return prot;
-	}
-}
-
-/* IOMMU */
-
-static int extend_iommu_mapping(struct dma_iommu_mapping *mapping);
-
-static inline dma_addr_t __alloc_iova(struct dma_iommu_mapping *mapping,
-				      size_t size)
-{
-	unsigned int order = get_order(size);
-	unsigned int align = 0;
-	unsigned int count, start;
-	size_t mapping_size = mapping->bits << PAGE_SHIFT;
-	unsigned long flags;
-	dma_addr_t iova;
-	int i;
-
-	if (order > CONFIG_ARM_DMA_IOMMU_ALIGNMENT)
-		order = CONFIG_ARM_DMA_IOMMU_ALIGNMENT;
-
-	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	align = (1 << order) - 1;
-
-	spin_lock_irqsave(&mapping->lock, flags);
-	for (i = 0; i < mapping->nr_bitmaps; i++) {
-		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
-				mapping->bits, 0, count, align);
-
-		if (start > mapping->bits)
-			continue;
-
-		bitmap_set(mapping->bitmaps[i], start, count);
-		break;
-	}
-
-	/*
-	 * No unused range found. Try to extend the existing mapping
-	 * and perform a second attempt to reserve an IO virtual
-	 * address range of size bytes.
-	 */
-	if (i == mapping->nr_bitmaps) {
-		if (extend_iommu_mapping(mapping)) {
-			spin_unlock_irqrestore(&mapping->lock, flags);
-			return DMA_MAPPING_ERROR;
-		}
-
-		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
-				mapping->bits, 0, count, align);
-
-		if (start > mapping->bits) {
-			spin_unlock_irqrestore(&mapping->lock, flags);
-			return DMA_MAPPING_ERROR;
-		}
-
-		bitmap_set(mapping->bitmaps[i], start, count);
-	}
-	spin_unlock_irqrestore(&mapping->lock, flags);
-
-	iova = mapping->base + (mapping_size * i);
-	iova += start << PAGE_SHIFT;
-
-	return iova;
-}
-
-static inline void __free_iova(struct dma_iommu_mapping *mapping,
-			       dma_addr_t addr, size_t size)
-{
-	unsigned int start, count;
-	size_t mapping_size = mapping->bits << PAGE_SHIFT;
-	unsigned long flags;
-	dma_addr_t bitmap_base;
-	u32 bitmap_index;
-
-	if (!size)
-		return;
-
-	bitmap_index = (u32) (addr - mapping->base) / (u32) mapping_size;
-	BUG_ON(addr < mapping->base || bitmap_index > mapping->extensions);
-
-	bitmap_base = mapping->base + mapping_size * bitmap_index;
-
-	start = (addr - bitmap_base) >>	PAGE_SHIFT;
-
-	if (addr + size > bitmap_base + mapping_size) {
-		/*
-		 * The address range to be freed reaches into the iova
-		 * range of the next bitmap. This should not happen as
-		 * we don't allow this in __alloc_iova (at the
-		 * moment).
-		 */
-		BUG();
-	} else
-		count = size >> PAGE_SHIFT;
-
-	spin_lock_irqsave(&mapping->lock, flags);
-	bitmap_clear(mapping->bitmaps[bitmap_index], start, count);
-	spin_unlock_irqrestore(&mapping->lock, flags);
-}
-
-/* We'll try 2M, 1M, 64K, and finally 4K; array must end with 0! */
-static const int iommu_order_array[] = { 9, 8, 4, 0 };
-
-static struct page **__iommu_alloc_buffer(struct device *dev, size_t size,
-					  gfp_t gfp, unsigned long attrs,
-					  int coherent_flag)
-{
-	struct page **pages;
-	int count = size >> PAGE_SHIFT;
-	int array_size = count * sizeof(struct page *);
-	int i = 0;
-	int order_idx = 0;
-
-	if (array_size <= PAGE_SIZE)
-		pages = kzalloc(array_size, GFP_KERNEL);
-	else
-		pages = vzalloc(array_size);
-	if (!pages)
-		return NULL;
-
-	if (attrs & DMA_ATTR_FORCE_CONTIGUOUS)
-	{
-		unsigned long order = get_order(size);
-		struct page *page;
-
-		page = dma_alloc_from_contiguous(dev, count, order,
-						 gfp & __GFP_NOWARN);
-		if (!page)
-			goto error;
-
-		__dma_clear_buffer(page, size, coherent_flag);
-
-		for (i = 0; i < count; i++)
-			pages[i] = page + i;
-
-		return pages;
-	}
-
-	/* Go straight to 4K chunks if caller says it's OK. */
-	if (attrs & DMA_ATTR_ALLOC_SINGLE_PAGES)
-		order_idx = ARRAY_SIZE(iommu_order_array) - 1;
-
-	/*
-	 * IOMMU can map any pages, so himem can also be used here
-	 */
-	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
-
-	while (count) {
-		int j, order;
-
-		order = iommu_order_array[order_idx];
-
-		/* Drop down when we get small */
-		if (__fls(count) < order) {
-			order_idx++;
-			continue;
-		}
-
-		if (order) {
-			/* See if it's easy to allocate a high-order chunk */
-			pages[i] = alloc_pages(gfp | __GFP_NORETRY, order);
-
-			/* Go down a notch at first sign of pressure */
-			if (!pages[i]) {
-				order_idx++;
-				continue;
-			}
-		} else {
-			pages[i] = alloc_pages(gfp, 0);
-			if (!pages[i])
-				goto error;
-		}
-
-		if (order) {
-			split_page(pages[i], order);
-			j = 1 << order;
-			while (--j)
-				pages[i + j] = pages[i] + j;
-		}
-
-		__dma_clear_buffer(pages[i], PAGE_SIZE << order, coherent_flag);
-		i += 1 << order;
-		count -= 1 << order;
-	}
-
-	return pages;
-error:
-	while (i--)
-		if (pages[i])
-			__free_pages(pages[i], 0);
-	kvfree(pages);
-	return NULL;
-}
-
-static int __iommu_free_buffer(struct device *dev, struct page **pages,
-			       size_t size, unsigned long attrs)
-{
-	int count = size >> PAGE_SHIFT;
-	int i;
-
-	if (attrs & DMA_ATTR_FORCE_CONTIGUOUS) {
-		dma_release_from_contiguous(dev, pages[0], count);
-	} else {
-		for (i = 0; i < count; i++)
-			if (pages[i])
-				__free_pages(pages[i], 0);
-	}
-
-	kvfree(pages);
-	return 0;
-}
-
-/*
- * Create a mapping in device IO address space for specified pages
- */
-static dma_addr_t
-__iommu_create_mapping(struct device *dev, struct page **pages, size_t size,
-		       unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	dma_addr_t dma_addr, iova;
-	int i;
-
-	dma_addr = __alloc_iova(mapping, size);
-	if (dma_addr == DMA_MAPPING_ERROR)
-		return dma_addr;
-
-	iova = dma_addr;
-	for (i = 0; i < count; ) {
-		int ret;
-
-		unsigned int next_pfn = page_to_pfn(pages[i]) + 1;
-		phys_addr_t phys = page_to_phys(pages[i]);
-		unsigned int len, j;
-
-		for (j = i + 1; j < count; j++, next_pfn++)
-			if (page_to_pfn(pages[j]) != next_pfn)
-				break;
-
-		len = (j - i) << PAGE_SHIFT;
-		ret = iommu_map(mapping->domain, iova, phys, len,
-				__dma_info_to_prot(DMA_BIDIRECTIONAL, attrs));
-		if (ret < 0)
-			goto fail;
-		iova += len;
-		i = j;
-	}
-	return dma_addr;
-fail:
-	iommu_unmap(mapping->domain, dma_addr, iova-dma_addr);
-	__free_iova(mapping, dma_addr, size);
-	return DMA_MAPPING_ERROR;
-}
-
-static int __iommu_remove_mapping(struct device *dev, dma_addr_t iova, size_t size)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-
-	/*
-	 * add optional in-page offset from iova to size and align
-	 * result to page size
-	 */
-	size = PAGE_ALIGN((iova & ~PAGE_MASK) + size);
-	iova &= PAGE_MASK;
-
-	iommu_unmap(mapping->domain, iova, size);
-	__free_iova(mapping, iova, size);
-	return 0;
-}
-
-static struct page **__atomic_get_pages(void *addr)
-{
-	struct page *page;
-	phys_addr_t phys;
-
-	phys = gen_pool_virt_to_phys(atomic_pool, (unsigned long)addr);
-	page = phys_to_page(phys);
-
-	return (struct page **)page;
-}
-
-static struct page **__iommu_get_pages(void *cpu_addr, unsigned long attrs)
-{
-	if (__in_atomic_pool(cpu_addr, PAGE_SIZE))
-		return __atomic_get_pages(cpu_addr);
-
-	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
-		return cpu_addr;
-
-	return dma_common_find_pages(cpu_addr);
-}
-
-static void *__iommu_alloc_simple(struct device *dev, size_t size, gfp_t gfp,
-				  dma_addr_t *handle, int coherent_flag,
-				  unsigned long attrs)
-{
-	struct page *page;
-	void *addr;
-
-	if (coherent_flag  == COHERENT)
-		addr = __alloc_simple_buffer(dev, size, gfp, &page);
-	else
-		addr = __alloc_from_pool(size, &page);
-	if (!addr)
-		return NULL;
-
-	*handle = __iommu_create_mapping(dev, &page, size, attrs);
-	if (*handle == DMA_MAPPING_ERROR)
-		goto err_mapping;
-
-	return addr;
-
-err_mapping:
-	__free_from_pool(addr, size);
-	return NULL;
-}
-
-static void __iommu_free_atomic(struct device *dev, void *cpu_addr,
-			dma_addr_t handle, size_t size, int coherent_flag)
-{
-	__iommu_remove_mapping(dev, handle, size);
-	if (coherent_flag == COHERENT)
-		__dma_free_buffer(virt_to_page(cpu_addr), size);
-	else
-		__free_from_pool(cpu_addr, size);
-}
-
-static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
-	    dma_addr_t *handle, gfp_t gfp, unsigned long attrs)
-{
-	pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL);
-	struct page **pages;
-	void *addr = NULL;
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
-
-	*handle = DMA_MAPPING_ERROR;
-	size = PAGE_ALIGN(size);
-
-	if (coherent_flag  == COHERENT || !gfpflags_allow_blocking(gfp))
-		return __iommu_alloc_simple(dev, size, gfp, handle,
-					    coherent_flag, attrs);
-
-	/*
-	 * Following is a work-around (a.k.a. hack) to prevent pages
-	 * with __GFP_COMP being passed to split_page() which cannot
-	 * handle them.  The real problem is that this flag probably
-	 * should be 0 on ARM as it is not supported on this
-	 * platform; see CONFIG_HUGETLBFS.
-	 */
-	gfp &= ~(__GFP_COMP);
-
-	pages = __iommu_alloc_buffer(dev, size, gfp, attrs, coherent_flag);
-	if (!pages)
-		return NULL;
-
-	*handle = __iommu_create_mapping(dev, pages, size, attrs);
-	if (*handle == DMA_MAPPING_ERROR)
-		goto err_buffer;
-
-	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
-		return pages;
-
-	addr = dma_common_pages_remap(pages, size, prot,
-				   __builtin_return_address(0));
-	if (!addr)
-		goto err_mapping;
-
-	return addr;
-
-err_mapping:
-	__iommu_remove_mapping(dev, *handle, size);
-err_buffer:
-	__iommu_free_buffer(dev, pages, size, attrs);
-	return NULL;
-}
-
-static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
-		    void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		    unsigned long attrs)
-{
-	struct page **pages = __iommu_get_pages(cpu_addr, attrs);
-	unsigned long nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	int err;
-
-	if (!pages)
-		return -ENXIO;
-
-	if (vma->vm_pgoff >= nr_pages)
-		return -ENXIO;
-
-	if (!dev->dma_coherent)
-		vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
-
-	err = vm_map_pages(vma, pages, nr_pages);
-	if (err)
-		pr_err("Remapping memory failed: %d\n", err);
-
-	return err;
-}
-
-/*
- * free a page as defined by the above mapping.
- * Must not be called with IRQs disabled.
- */
-static void arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
-	dma_addr_t handle, unsigned long attrs)
-{
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
-	struct page **pages;
-	size = PAGE_ALIGN(size);
-
-	if (coherent_flag == COHERENT || __in_atomic_pool(cpu_addr, size)) {
-		__iommu_free_atomic(dev, cpu_addr, handle, size, coherent_flag);
-		return;
-	}
-
-	pages = __iommu_get_pages(cpu_addr, attrs);
-	if (!pages) {
-		WARN(1, "trying to free invalid coherent area: %p\n", cpu_addr);
-		return;
-	}
-
-	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
-		dma_common_free_remap(cpu_addr, size);
-
-	__iommu_remove_mapping(dev, handle, size);
-	__iommu_free_buffer(dev, pages, size, attrs);
-}
-
-static int arm_iommu_get_sgtable(struct device *dev, struct sg_table *sgt,
-				 void *cpu_addr, dma_addr_t dma_addr,
-				 size_t size, unsigned long attrs)
-{
-	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	struct page **pages = __iommu_get_pages(cpu_addr, attrs);
-
-	if (!pages)
-		return -ENXIO;
-
-	return sg_alloc_table_from_pages(sgt, pages, count, 0, size,
-					 GFP_KERNEL);
-}
-
-/*
- * Map a part of the scatter-gather list into contiguous io address space
- */
-static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
-			  size_t size, dma_addr_t *handle,
-			  enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova, iova_base;
-	int ret = 0;
-	unsigned int count;
-	struct scatterlist *s;
-	int prot;
-
-	size = PAGE_ALIGN(size);
-	*handle = DMA_MAPPING_ERROR;
-
-	iova_base = iova = __alloc_iova(mapping, size);
-	if (iova == DMA_MAPPING_ERROR)
-		return -ENOMEM;
-
-	for (count = 0, s = sg; count < (size >> PAGE_SHIFT); s = sg_next(s)) {
-		phys_addr_t phys = page_to_phys(sg_page(s));
-		unsigned int len = PAGE_ALIGN(s->offset + s->length);
-
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
-
-		prot = __dma_info_to_prot(dir, attrs);
-
-		ret = iommu_map(mapping->domain, iova, phys, len, prot);
-		if (ret < 0)
-			goto fail;
-		count += len >> PAGE_SHIFT;
-		iova += len;
-	}
-	*handle = iova_base;
-
-	return 0;
-fail:
-	iommu_unmap(mapping->domain, iova_base, count * PAGE_SIZE);
-	__free_iova(mapping, iova_base, size);
-	return ret;
-}
-
-/**
- * arm_iommu_map_sg - map a set of SG buffers for streaming mode DMA
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to map
- * @dir: DMA transfer direction
- *
- * Map a set of buffers described by scatterlist in streaming mode for DMA.
- * The scatter gather list elements are merged together (if possible) and
- * tagged with the appropriate dma address and length. They are obtained via
- * sg_dma_{address,length}.
- */
-static int arm_iommu_map_sg(struct device *dev, struct scatterlist *sg,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
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
-			    dir, attrs) < 0)
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
-	if (__map_sg_chunk(dev, start, size, &dma->dma_address, dir, attrs) < 0)
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
- * arm_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to unmap (same as was passed to dma_map_sg)
- * @dir: DMA transfer direction (same as was passed to dma_map_sg)
- *
- * Unmap a set of streaming mode DMA translations.  Again, CPU access
- * rules concerning calls here are the same as for dma_unmap_single().
- */
-static void arm_iommu_unmap_sg(struct device *dev,
-			       struct scatterlist *sg, int nents,
-			       enum dma_data_direction dir,
-			       unsigned long attrs)
-{
-	struct scatterlist *s;
-	int i;
-
-	for_each_sg(sg, s, nents, i) {
-		if (sg_dma_len(s))
-			__iommu_remove_mapping(dev, sg_dma_address(s),
-					       sg_dma_len(s));
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
-	}
-}
-
-/**
- * arm_iommu_sync_sg_for_cpu
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to map (returned from dma_map_sg)
- * @dir: DMA transfer direction (same as was passed to dma_map_sg)
- */
-static void arm_iommu_sync_sg_for_cpu(struct device *dev,
-			struct scatterlist *sg,
-			int nents, enum dma_data_direction dir)
-{
-	struct scatterlist *s;
-	int i;
-
-	if (dev->dma_coherent)
-		return;
-
-	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
-
-}
-
-/**
- * arm_iommu_sync_sg_for_device
- * @dev: valid struct device pointer
- * @sg: list of buffers
- * @nents: number of buffers to map (returned from dma_map_sg)
- * @dir: DMA transfer direction (same as was passed to dma_map_sg)
- */
-static void arm_iommu_sync_sg_for_device(struct device *dev,
-			struct scatterlist *sg,
-			int nents, enum dma_data_direction dir)
-{
-	struct scatterlist *s;
-	int i;
-
-	if (dev->dma_coherent)
-		return;
-
-	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
-}
-
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
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t dma_addr;
-	int ret, prot, len = PAGE_ALIGN(size + offset);
-
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
-
-	dma_addr = __alloc_iova(mapping, len);
-	if (dma_addr == DMA_MAPPING_ERROR)
-		return dma_addr;
-
-	prot = __dma_info_to_prot(dir, attrs);
-
-	ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len, prot);
-	if (ret < 0)
-		goto fail;
-
-	return dma_addr + offset;
-fail:
-	__free_iova(mapping, dma_addr, len);
-	return DMA_MAPPING_ERROR;
-}
-
-/**
- * arm_iommu_unmap_page
- * @dev: valid struct device pointer
- * @handle: DMA address of buffer
- * @size: size of buffer (same as passed to dma_map_page)
- * @dir: DMA transfer direction (same as passed to dma_map_page)
- *
- * IOMMU aware version of arm_dma_unmap_page()
- */
-static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
-	int offset = handle & ~PAGE_MASK;
-	int len = PAGE_ALIGN(size + offset);
-
-	if (!iova)
-		return;
-
-	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
-	}
-
-	iommu_unmap(mapping->domain, iova, len);
-	__free_iova(mapping, iova, len);
-}
-
-/**
- * arm_iommu_map_resource - map a device resource for DMA
- * @dev: valid struct device pointer
- * @phys_addr: physical address of resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static dma_addr_t arm_iommu_map_resource(struct device *dev,
-		phys_addr_t phys_addr, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t dma_addr;
-	int ret, prot;
-	phys_addr_t addr = phys_addr & PAGE_MASK;
-	unsigned int offset = phys_addr & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	dma_addr = __alloc_iova(mapping, len);
-	if (dma_addr == DMA_MAPPING_ERROR)
-		return dma_addr;
-
-	prot = __dma_info_to_prot(dir, attrs) | IOMMU_MMIO;
-
-	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot);
-	if (ret < 0)
-		goto fail;
-
-	return dma_addr + offset;
-fail:
-	__free_iova(mapping, dma_addr, len);
-	return DMA_MAPPING_ERROR;
-}
-
-/**
- * arm_iommu_unmap_resource - unmap a device DMA resource
- * @dev: valid struct device pointer
- * @dma_handle: DMA address to resource
- * @size: size of resource to map
- * @dir: DMA transfer direction
- */
-static void arm_iommu_unmap_resource(struct device *dev, dma_addr_t dma_handle,
-		size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = dma_handle & PAGE_MASK;
-	unsigned int offset = dma_handle & ~PAGE_MASK;
-	size_t len = PAGE_ALIGN(size + offset);
-
-	if (!iova)
-		return;
-
-	iommu_unmap(mapping->domain, iova, len);
-	__free_iova(mapping, iova, len);
-}
-
-static void arm_iommu_sync_single_for_cpu(struct device *dev,
-		dma_addr_t handle, size_t size, enum dma_data_direction dir)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset = handle & ~PAGE_MASK;
-
-	if (dev->dma_coherent || !iova)
-		return;
-
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
-}
-
-static void arm_iommu_sync_single_for_device(struct device *dev,
-		dma_addr_t handle, size_t size, enum dma_data_direction dir)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset = handle & ~PAGE_MASK;
-
-	if (dev->dma_coherent || !iova)
-		return;
-
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
-}
-
-static const struct dma_map_ops iommu_ops = {
-	.alloc		= arm_iommu_alloc_attrs,
-	.free		= arm_iommu_free_attrs,
-	.mmap		= arm_iommu_mmap_attrs,
-	.get_sgtable	= arm_iommu_get_sgtable,
-
-	.map_page		= arm_iommu_map_page,
-	.unmap_page		= arm_iommu_unmap_page,
-	.sync_single_for_cpu	= arm_iommu_sync_single_for_cpu,
-	.sync_single_for_device	= arm_iommu_sync_single_for_device,
-
-	.map_sg			= arm_iommu_map_sg,
-	.unmap_sg		= arm_iommu_unmap_sg,
-	.sync_sg_for_cpu	= arm_iommu_sync_sg_for_cpu,
-	.sync_sg_for_device	= arm_iommu_sync_sg_for_device,
-
-	.map_resource		= arm_iommu_map_resource,
-	.unmap_resource		= arm_iommu_unmap_resource,
-};
-
+extern const struct dma_map_ops iommu_dma_ops;
+extern int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
+		u64 size, struct device *dev);
 /**
  * arm_iommu_create_mapping
  * @bus: pointer to the bus holding the client device (for IOMMU calls)
@@ -1896,55 +1094,31 @@ static const struct dma_map_ops iommu_ops = {
 struct dma_iommu_mapping *
 arm_iommu_create_mapping(struct bus_type *bus, dma_addr_t base, u64 size)
 {
-	unsigned int bits = size >> PAGE_SHIFT;
-	unsigned int bitmap_size = BITS_TO_LONGS(bits) * sizeof(long);
 	struct dma_iommu_mapping *mapping;
-	int extensions = 1;
 	int err = -ENOMEM;
 
-	/* currently only 32-bit DMA address space is supported */
-	if (size > DMA_BIT_MASK(32) + 1)
-		return ERR_PTR(-ERANGE);
-
-	if (!bitmap_size)
-		return ERR_PTR(-EINVAL);
-
-	if (bitmap_size > PAGE_SIZE) {
-		extensions = bitmap_size / PAGE_SIZE;
-		bitmap_size = PAGE_SIZE;
-	}
-
-	mapping = kzalloc(sizeof(struct dma_iommu_mapping), GFP_KERNEL);
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
 	if (!mapping)
 		goto err;
 
-	mapping->bitmap_size = bitmap_size;
-	mapping->bitmaps = kcalloc(extensions, sizeof(unsigned long *),
-				   GFP_KERNEL);
-	if (!mapping->bitmaps)
-		goto err2;
-
-	mapping->bitmaps[0] = kzalloc(bitmap_size, GFP_KERNEL);
-	if (!mapping->bitmaps[0])
-		goto err3;
-
-	mapping->nr_bitmaps = 1;
-	mapping->extensions = extensions;
-	mapping->base = base;
-	mapping->bits = BITS_PER_BYTE * bitmap_size;
-
-	spin_lock_init(&mapping->lock);
-
 	mapping->domain = iommu_domain_alloc(bus);
 	if (!mapping->domain)
+		goto err2;
+
+	err = iommu_get_dma_cookie(mapping->domain);
+	if (err)
+		goto err3;
+
+	err = iommu_dma_init_domain(mapping->domain, base, size, NULL);
+	if (err)
 		goto err4;
 
 	kref_init(&mapping->kref);
 	return mapping;
 err4:
-	kfree(mapping->bitmaps[0]);
+	iommu_put_dma_cookie(mapping->domain);
 err3:
-	kfree(mapping->bitmaps);
+	iommu_domain_free(mapping->domain);
 err2:
 	kfree(mapping);
 err:
@@ -1954,35 +1128,14 @@ EXPORT_SYMBOL_GPL(arm_iommu_create_mapping);
 
 static void release_iommu_mapping(struct kref *kref)
 {
-	int i;
 	struct dma_iommu_mapping *mapping =
 		container_of(kref, struct dma_iommu_mapping, kref);
 
+	iommu_put_dma_cookie(mapping->domain);
 	iommu_domain_free(mapping->domain);
-	for (i = 0; i < mapping->nr_bitmaps; i++)
-		kfree(mapping->bitmaps[i]);
-	kfree(mapping->bitmaps);
 	kfree(mapping);
 }
 
-static int extend_iommu_mapping(struct dma_iommu_mapping *mapping)
-{
-	int next_bitmap;
-
-	if (mapping->nr_bitmaps >= mapping->extensions)
-		return -EINVAL;
-
-	next_bitmap = mapping->nr_bitmaps;
-	mapping->bitmaps[next_bitmap] = kzalloc(mapping->bitmap_size,
-						GFP_ATOMIC);
-	if (!mapping->bitmaps[next_bitmap])
-		return -ENOMEM;
-
-	mapping->nr_bitmaps++;
-
-	return 0;
-}
-
 void arm_iommu_release_mapping(struct dma_iommu_mapping *mapping)
 {
 	if (mapping)
@@ -2028,7 +1181,7 @@ int arm_iommu_attach_device(struct device *dev,
 	if (err)
 		return err;
 
-	set_dma_ops(dev, &iommu_ops);
+	set_dma_ops(dev, &iommu_dma_ops);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arm_iommu_attach_device);
@@ -2126,7 +1279,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		return;
 
 	if (arm_setup_iommu_dma_ops(dev, dma_base, size, iommu))
-		dma_ops = &iommu_ops;
+		dma_ops = &iommu_dma_ops;
 	else
 		dma_ops = arm_get_dma_map_ops(coherent);
 
@@ -2149,7 +1302,7 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
-#if defined(CONFIG_SWIOTLB) || defined(CONFIG_ARM_DMA_USE_IOMMU)
+#if defined(CONFIG_SWIOTLB) || defined(CONFIG_IOMMU_DMA)
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
@@ -2177,4 +1330,4 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
 {
 	__arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
 }
-#endif /* CONFIG_SWIOTLB || CONFIG_ARM_DMA_USE_IOMMU */
+#endif /* CONFIG_SWIOTLB || CONFIG_IOMMU_DMA */
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bef5d75e306b..ca0bdf826e9d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -163,7 +163,6 @@ config ROCKCHIP_IOMMU
 	bool "Rockchip IOMMU Support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select IOMMU_API
-	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMUs found on Rockchip rk32xx SOCs.
 	  These IOMMUs allow virtualization of the address space used by most
@@ -175,7 +174,6 @@ config SUN50I_IOMMU
 	bool "Allwinner H6 IOMMU Support"
 	depends on HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
-	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
 	help
 	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
@@ -206,7 +204,6 @@ config EXYNOS_IOMMU
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN # revisit driver if we can enable big-endian ptes
 	select IOMMU_API
-	select ARM_DMA_USE_IOMMU
 	help
 	  Support for the IOMMU (System MMU) of Samsung Exynos application
 	  processor family. This enables H/W multimedia accelerators to see
@@ -229,7 +226,6 @@ config IPMMU_VMSA
 	depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
-	select ARM_DMA_USE_IOMMU
 	help
 	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
 	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.
@@ -250,7 +246,6 @@ config ARM_SMMU
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
-	select ARM_DMA_USE_IOMMU if ARM
 	help
 	  Support for implementations of the ARM System MMU architecture
 	  versions 1 and 2.
@@ -334,7 +329,6 @@ config S390_AP_IOMMU
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
-	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_ARMV7S
 	select MEMORY
@@ -350,7 +344,6 @@ config MTK_IOMMU_V1
 	bool "MTK IOMMU Version 1 (M4U gen1) Support"
 	depends on ARM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
-	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
 	select MEMORY
 	select MTK_SMI
@@ -367,7 +360,6 @@ config QCOM_IOMMU
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
-	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
 
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..9d6ff7b5f7f1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -76,7 +76,6 @@ config VIDEO_OMAP3
 	depends on VIDEO_V4L2 && I2C
 	depends on (ARCH_OMAP3 && OMAP_IOMMU) || COMPILE_TEST
 	depends on COMMON_CLK && OF
-	select ARM_DMA_USE_IOMMU if OMAP_IOMMU
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
