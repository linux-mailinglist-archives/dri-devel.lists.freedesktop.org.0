Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0EA24C17E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276A6E969;
	Thu, 20 Aug 2020 15:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B23C6E969
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:10:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51BFC1597;
 Thu, 20 Aug 2020 08:10:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6D8F3F6CF;
 Thu, 20 Aug 2020 08:09:58 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 18/18] ARM/dma-mapping: Remove legacy dma-iommu API
Date: Thu, 20 Aug 2020 16:08:37 +0100
Message-Id: <ae8fc6c61f38d8ddc8e94041deda0fcc6333bae3.1597931876.git.robin.murphy@arm.com>
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

With no users left and generic iommu-dma now doing all the work,
clean up the last traces of the arch-specific API, plus the temporary
workarounds that you'd forgotten about because you were thinking about
zebras instead.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/common/dmabounce.c      |   1 -
 arch/arm/include/asm/device.h    |   9 --
 arch/arm/include/asm/dma-iommu.h |  29 -----
 arch/arm/mm/dma-mapping.c        | 200 +------------------------------
 drivers/iommu/dma-iommu.c        |  38 ++----
 5 files changed, 11 insertions(+), 266 deletions(-)
 delete mode 100644 arch/arm/include/asm/dma-iommu.h

diff --git a/arch/arm/common/dmabounce.c b/arch/arm/common/dmabounce.c
index f4b719bde763..064349df7bbf 100644
--- a/arch/arm/common/dmabounce.c
+++ b/arch/arm/common/dmabounce.c
@@ -30,7 +30,6 @@
 #include <linux/scatterlist.h>
 
 #include <asm/cacheflush.h>
-#include <asm/dma-iommu.h>
 
 #undef STATS
 
diff --git a/arch/arm/include/asm/device.h b/arch/arm/include/asm/device.h
index be666f58bf7a..db33f389c94e 100644
--- a/arch/arm/include/asm/device.h
+++ b/arch/arm/include/asm/device.h
@@ -8,9 +8,6 @@
 struct dev_archdata {
 #ifdef CONFIG_DMABOUNCE
 	struct dmabounce_device_info *dmabounce;
-#endif
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-	struct dma_iommu_mapping	*mapping;
 #endif
 	unsigned int dma_coherent:1;
 	unsigned int dma_ops_setup:1;
@@ -24,10 +21,4 @@ struct pdev_archdata {
 #endif
 };
 
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-#define to_dma_iommu_mapping(dev) ((dev)->archdata.mapping)
-#else
-#define to_dma_iommu_mapping(dev) NULL
-#endif
-
 #endif
diff --git a/arch/arm/include/asm/dma-iommu.h b/arch/arm/include/asm/dma-iommu.h
deleted file mode 100644
index f39cfa509fe4..000000000000
--- a/arch/arm/include/asm/dma-iommu.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASMARM_DMA_IOMMU_H
-#define ASMARM_DMA_IOMMU_H
-
-#ifdef __KERNEL__
-
-#include <linux/mm_types.h>
-#include <linux/scatterlist.h>
-#include <linux/dma-debug.h>
-#include <linux/kref.h>
-
-struct dma_iommu_mapping {
-	/* iommu specific data */
-	struct iommu_domain	*domain;
-
-	struct kref		kref;
-};
-
-struct dma_iommu_mapping *
-arm_iommu_create_mapping(struct bus_type *bus, dma_addr_t base, u64 size);
-
-void arm_iommu_release_mapping(struct dma_iommu_mapping *mapping);
-
-int arm_iommu_attach_device(struct device *dev,
-					struct dma_iommu_mapping *mapping);
-void arm_iommu_detach_device(struct device *dev);
-
-#endif /* __KERNEL__ */
-#endif
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 2ef0afc17645..ff6c4962161a 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -33,7 +33,6 @@
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/mach/arch.h>
-#include <asm/dma-iommu.h>
 #include <asm/mach/map.h>
 #include <asm/system_info.h>
 #include <asm/dma-contiguous.h>
@@ -1073,201 +1072,6 @@ static const struct dma_map_ops *arm_get_dma_map_ops(bool coherent)
 	return coherent ? &arm_coherent_dma_ops : &arm_dma_ops;
 }
 
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-
-extern const struct dma_map_ops iommu_dma_ops;
-extern int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
-		u64 size, struct device *dev);
-/**
- * arm_iommu_create_mapping
- * @bus: pointer to the bus holding the client device (for IOMMU calls)
- * @base: start address of the valid IO address space
- * @size: maximum size of the valid IO address space
- *
- * Creates a mapping structure which holds information about used/unused
- * IO address ranges, which is required to perform memory allocation and
- * mapping with IOMMU aware functions.
- *
- * The client device need to be attached to the mapping with
- * arm_iommu_attach_device function.
- */
-struct dma_iommu_mapping *
-arm_iommu_create_mapping(struct bus_type *bus, dma_addr_t base, u64 size)
-{
-	struct dma_iommu_mapping *mapping;
-	int err = -ENOMEM;
-
-	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
-	if (!mapping)
-		goto err;
-
-	mapping->domain = iommu_domain_alloc(bus);
-	if (!mapping->domain)
-		goto err2;
-
-	err = iommu_get_dma_cookie(mapping->domain);
-	if (err)
-		goto err3;
-
-	err = iommu_dma_init_domain(mapping->domain, base, size, NULL);
-	if (err)
-		goto err4;
-
-	kref_init(&mapping->kref);
-	return mapping;
-err4:
-	iommu_put_dma_cookie(mapping->domain);
-err3:
-	iommu_domain_free(mapping->domain);
-err2:
-	kfree(mapping);
-err:
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL_GPL(arm_iommu_create_mapping);
-
-static void release_iommu_mapping(struct kref *kref)
-{
-	struct dma_iommu_mapping *mapping =
-		container_of(kref, struct dma_iommu_mapping, kref);
-
-	iommu_put_dma_cookie(mapping->domain);
-	iommu_domain_free(mapping->domain);
-	kfree(mapping);
-}
-
-void arm_iommu_release_mapping(struct dma_iommu_mapping *mapping)
-{
-	if (mapping)
-		kref_put(&mapping->kref, release_iommu_mapping);
-}
-EXPORT_SYMBOL_GPL(arm_iommu_release_mapping);
-
-static int __arm_iommu_attach_device(struct device *dev,
-				     struct dma_iommu_mapping *mapping)
-{
-	int err;
-
-	err = iommu_attach_device(mapping->domain, dev);
-	if (err)
-		return err;
-
-	kref_get(&mapping->kref);
-	to_dma_iommu_mapping(dev) = mapping;
-
-	pr_debug("Attached IOMMU controller to %s device.\n", dev_name(dev));
-	return 0;
-}
-
-/**
- * arm_iommu_attach_device
- * @dev: valid struct device pointer
- * @mapping: io address space mapping structure (returned from
- *	arm_iommu_create_mapping)
- *
- * Attaches specified io address space mapping to the provided device.
- * This replaces the dma operations (dma_map_ops pointer) with the
- * IOMMU aware version.
- *
- * More than one client might be attached to the same io address space
- * mapping.
- */
-int arm_iommu_attach_device(struct device *dev,
-			    struct dma_iommu_mapping *mapping)
-{
-	int err;
-
-	err = __arm_iommu_attach_device(dev, mapping);
-	if (err)
-		return err;
-
-	set_dma_ops(dev, &iommu_dma_ops);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(arm_iommu_attach_device);
-
-/**
- * arm_iommu_detach_device
- * @dev: valid struct device pointer
- *
- * Detaches the provided device from a previously attached map.
- * This overwrites the dma_ops pointer with appropriate non-IOMMU ops.
- */
-void arm_iommu_detach_device(struct device *dev)
-{
-	struct dma_iommu_mapping *mapping;
-
-	mapping = to_dma_iommu_mapping(dev);
-	if (!mapping) {
-		dev_warn(dev, "Not attached\n");
-		return;
-	}
-
-	iommu_detach_device(mapping->domain, dev);
-	kref_put(&mapping->kref, release_iommu_mapping);
-	to_dma_iommu_mapping(dev) = NULL;
-	set_dma_ops(dev, arm_get_dma_map_ops(dev->archdata.dma_coherent));
-
-	pr_debug("Detached IOMMU controller from %s device.\n", dev_name(dev));
-}
-EXPORT_SYMBOL_GPL(arm_iommu_detach_device);
-
-static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
-				    const struct iommu_ops *iommu)
-{
-	struct dma_iommu_mapping *mapping;
-
-	if (!iommu)
-		return false;
-
-	/* If a default domain exists, just let iommu-dma work normally */
-	if (iommu_get_domain_for_dev(dev)) {
-		iommu_setup_dma_ops(dev, dma_base, size);
-		return true;
-	}
-
-	/* Otherwise, use the workaround until the IOMMU driver is updated */
-	mapping = arm_iommu_create_mapping(dev->bus, dma_base, size);
-	if (IS_ERR(mapping)) {
-		pr_warn("Failed to create %llu-byte IOMMU mapping for device %s\n",
-				size, dev_name(dev));
-		return false;
-	}
-
-	if (__arm_iommu_attach_device(dev, mapping)) {
-		pr_warn("Failed to attached device %s to IOMMU_mapping\n",
-				dev_name(dev));
-		arm_iommu_release_mapping(mapping);
-		return false;
-	}
-
-	set_dma_ops(dev, &iommu_dma_ops);
-	return true;
-}
-
-static void arm_teardown_iommu_dma_ops(struct device *dev)
-{
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-
-	if (!mapping)
-		return;
-
-	arm_iommu_detach_device(dev);
-	arm_iommu_release_mapping(mapping);
-}
-
-#else
-
-static bool arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
-				    const struct iommu_ops *iommu)
-{
-	return false;
-}
-
-static void arm_teardown_iommu_dma_ops(struct device *dev) { }
-
-#endif	/* CONFIG_ARM_DMA_USE_IOMMU */
-
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 			const struct iommu_ops *iommu, bool coherent)
 {
@@ -1286,7 +1090,8 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 	set_dma_ops(dev, arm_get_dma_map_ops(coherent));
 
-	arm_setup_iommu_dma_ops(dev, dma_base, size, iommu);
+	if (iommu)
+		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
 	if (xen_initial_domain())
@@ -1300,7 +1105,6 @@ void arch_teardown_dma_ops(struct device *dev)
 	if (!dev->archdata.dma_ops_setup)
 		return;
 
-	arm_teardown_iommu_dma_ops(dev);
 	/* Let arch_setup_dma_ops() start again from scratch upon re-probe */
 	set_dma_ops(dev, NULL);
 }
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ab157d155bf7..4959f5df21bd 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -25,19 +25,6 @@
 #include <linux/vmalloc.h>
 #include <linux/crash_dump.h>
 
-#ifdef CONFIG_ARM
-#include <asm/dma-iommu.h>
-#endif
-static struct iommu_domain *__iommu_get_dma_domain(struct device *dev)
-{
-#ifdef CONFIG_ARM
-	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	if (mapping)
-		return mapping->domain;
-#endif
-	return iommu_get_dma_domain(dev);
-}
-
 struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
@@ -311,11 +298,8 @@ static void iommu_dma_flush_iotlb_all(struct iova_domain *iovad)
  * avoid rounding surprises. If necessary, we reserve the page at address 0
  * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
  * any change which could make prior IOVAs invalid will fail.
- *
- * XXX: Not formally exported, but needs to be referenced
- * from arch/arm/mm/dma-mapping.c temporarily
  */
-int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
+static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 		u64 size, struct device *dev)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -472,7 +456,7 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 		size_t size)
 {
-	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, dma_addr);
@@ -494,7 +478,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size_t size, int prot, u64 dma_mask)
 {
-	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, phys);
@@ -598,7 +582,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
-	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	bool coherent = dev_is_dma_coherent(dev);
@@ -694,7 +678,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 	if (dev_is_dma_coherent(dev))
 		return;
 
-	phys = iommu_iova_to_phys(__iommu_get_dma_domain(dev), dma_handle);
+	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
 	arch_sync_dma_for_cpu(phys, size, dir);
 }
 
@@ -706,7 +690,7 @@ static void iommu_dma_sync_single_for_device(struct device *dev,
 	if (dev_is_dma_coherent(dev))
 		return;
 
-	phys = iommu_iova_to_phys(__iommu_get_dma_domain(dev), dma_handle);
+	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
 	arch_sync_dma_for_device(phys, size, dir);
 }
 
@@ -847,7 +831,7 @@ static void __invalidate_sg(struct scatterlist *sg, int nents)
 static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
-	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	struct scatterlist *s, *prev = NULL;
@@ -1128,16 +1112,12 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 
 static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
 {
-	struct iommu_domain *domain = __iommu_get_dma_domain(dev);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 
 	return (1UL << __ffs(domain->pgsize_bitmap)) - 1;
 }
 
-/*
- * XXX: Not formally exported, but needs to be referenced
- * from arch/arm/mm/dma-mapping.c temporarily
- */
-const struct dma_map_ops iommu_dma_ops = {
+static const struct dma_map_ops iommu_dma_ops = {
 	.alloc			= iommu_dma_alloc,
 	.free			= iommu_dma_free,
 	.mmap			= iommu_dma_mmap,
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
