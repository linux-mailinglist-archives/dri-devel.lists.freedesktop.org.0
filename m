Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6245970639
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979410E25A;
	Sun,  8 Sep 2024 09:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="IN9lxvYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AEF10E25A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFbiV7+jKERuFZV0+njLTL51G8+NtDFLzvINhYAgKkM=;
 b=IN9lxvYQKsCMvwt3swO8UmDv7uVXnheWKYefpHYOq5kFBk0dpYMLDkNidDRpDCaUXt/sx6
 pA33fhUiYQk3Wqmh3pF46UY362jNT4Y4VvOhADuWiBRUoLwVTZMcsy94qx0cs3qHcvdvbI
 fyfKobqRqs2GeNUN7UmP8Kp70P3lIl0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 17/19] drm/etnaviv: Support to manage dedicated VRAM base
 on drm_mm
Date: Sun,  8 Sep 2024 17:43:55 +0800
Message-ID: <20240908094357.291862-18-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The dedicated VRAM is seen as a kind of device memory (IOMEM) at present,
we should use ioremap() to make device memory CPU accessible, we should
also need to implement mmap() driver for userspace. Therefore, we add a
simple drm-mm based range allocator for the upper (GEM object function)
layer.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/Makefile           |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c      |  12 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h      |  11 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.h      |   5 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c | 258 +++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h |  12 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c  |  13 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h  |   6 +
 8 files changed, 318 insertions(+)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h

diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 383f181bfc4c..aba2578966ff 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -6,6 +6,7 @@ etnaviv-y := \
 	etnaviv_drv.o \
 	etnaviv_dump.o \
 	etnaviv_gem_prime.o \
+	etnaviv_gem_vram.o \
 	etnaviv_gem_submit.o \
 	etnaviv_gem.o \
 	etnaviv_gpu.o \
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7fc654f051a3..f10661fe079f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -23,6 +23,7 @@
 #include "etnaviv_drv.h"
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
+#include "etnaviv_gem_vram.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
@@ -46,6 +47,8 @@ static struct device_node *etnaviv_of_first_available_node(void)
 static int etnaviv_private_init(struct device *dev,
 				struct etnaviv_drm_private *priv)
 {
+	int ret;
+
 	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
 
 	mutex_init(&priv->gem_lock);
@@ -61,6 +64,10 @@ static int etnaviv_private_init(struct device *dev,
 
 	priv->cached_coherent = dev_is_dma_coherent(dev);
 
+	ret = etnaviv_init_dedicated_vram(dev, priv);
+	if (ret)
+		dev_err(dev, "Failed to init dedicated vram\n");
+
 	return 0;
 }
 
@@ -74,6 +81,11 @@ static void etnaviv_private_fini(struct etnaviv_drm_private *priv)
 	xa_destroy(&priv->active_contexts);
 
 	mutex_destroy(&priv->gem_lock);
+
+	if (priv->dedicated_vram) {
+		drm_mm_takedown(&priv->vram.mm);
+		priv->dedicated_vram = false;
+	}
 }
 
 static void load_gpu(struct drm_device *dev)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 84f2e79f0a53..b093f832599f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -58,6 +58,17 @@ struct etnaviv_drm_private {
 	 */
 	bool cached_coherent;
 
+	/*
+	 * dedicated VRAM (device memory) resource
+	 */
+	struct {
+		struct drm_mm mm;
+		u64 gpu_base;
+		u64 cpu_base;
+		u64 size;
+	} vram;
+	bool dedicated_vram;
+
 	/* list of GEM objects: */
 	struct mutex gem_lock;
 	struct list_head gem_list;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 8d8fc5b3a541..60bbbbc2dd19 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -59,6 +59,9 @@ struct etnaviv_gem_object {
 	u32 last_cpu_prep_op;
 
 	struct etnaviv_gem_userptr userptr;
+
+	/* dedicated vram, which is physically contiguous */
+	struct drm_mm_node *vram_np;
 };
 
 static inline
@@ -129,4 +132,6 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 	u64 va);
 void etnaviv_gem_mapping_unreference(struct etnaviv_vram_mapping *mapping);
 
+u64 etnaviv_obj_gpu_phys_addr(struct etnaviv_gem_object *etnaviv_obj);
+
 #endif /* __ETNAVIV_GEM_H__ */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c
new file mode 100644
index 000000000000..c2942317a64e
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_gem.h"
+#include "etnaviv_pci_drv.h"
+
+static struct lock_class_key etnaviv_vram_lock_class;
+
+static u64 etnaviv_obj_cpu_phys_addr(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct drm_gem_object *obj = &etnaviv_obj->base;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(obj->dev);
+
+	if (!etnaviv_obj->vram_np) {
+		drm_err(obj->dev, "No backing vram node, please pin it\n");
+		return 0;
+	}
+
+	return priv->vram.cpu_base + etnaviv_obj->vram_np->start;
+}
+
+u64 etnaviv_obj_gpu_phys_addr(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct drm_gem_object *obj = &etnaviv_obj->base;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(obj->dev);
+
+	if (!etnaviv_obj->vram_np) {
+		drm_err(obj->dev, "No backing vram node, no gpu offset\n");
+		return 0;
+	}
+
+	return priv->vram.gpu_base + etnaviv_obj->vram_np->start;
+}
+
+/* Called with etnaviv_obj->lock held, allocate pages from dedicated VRAM */
+static int etnaviv_gem_vram_get_pages(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct drm_gem_object *obj = &etnaviv_obj->base;
+	struct drm_device *drm = obj->dev;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(drm);
+	unsigned int npages = obj->size >> PAGE_SHIFT;
+	struct drm_mm_node *vram_np;
+	struct page **ppages;
+	u64 gpu_paddr;
+	unsigned int i;
+	int ret;
+
+	lockdep_assert_held(&etnaviv_obj->lock);
+
+	vram_np = kzalloc(sizeof(*vram_np), GFP_KERNEL);
+	if (!vram_np)
+		return -ENOMEM;
+
+	ret = drm_mm_insert_node(&priv->vram.mm, vram_np, obj->size);
+	if (ret) {
+		drm_err(drm, "Failed to insert %zu KiB\n", obj->size >> 10);
+		goto fail_allocate_range;
+	}
+
+	ppages = kvmalloc_array(npages, sizeof(*ppages), GFP_KERNEL);
+	if (!ppages) {
+		ret = -ENOMEM;
+		goto fail_allocate_pages;
+	}
+
+	etnaviv_obj->vram_np = vram_np;
+
+	gpu_paddr = etnaviv_obj_gpu_phys_addr(etnaviv_obj);
+	for (i = 0; i < npages; ++i) {
+		ppages[i] = pfn_to_page(__phys_to_pfn(gpu_paddr));
+		gpu_paddr += PAGE_SIZE;
+	}
+
+	etnaviv_obj->pages = ppages;
+
+	return 0;
+
+fail_allocate_pages:
+	drm_mm_remove_node(vram_np);
+fail_allocate_range:
+	kfree(vram_np);
+
+	return ret;
+}
+
+static void *etnaviv_gem_vram_vmap(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct drm_device *drm = etnaviv_obj->base.dev;
+	u64 offset;
+	u64 size;
+	int ret;
+
+	lockdep_assert_held(&etnaviv_obj->lock);
+
+	/*
+	 * This is equivalent to pin, we need the dedicated vram node
+	 * inserted into the whole drm_mm, to get a valid offset.
+	 */
+	if (!etnaviv_obj->pages) {
+		ret = etnaviv_obj->ops->get_pages(etnaviv_obj);
+		if (ret) {
+			drm_err(drm, "Failed to pin %p\n", etnaviv_obj);
+			return NULL;
+		}
+	}
+
+	offset = etnaviv_obj_cpu_phys_addr(etnaviv_obj);
+	size = etnaviv_obj->base.size;
+
+	drm_dbg(drm, "offset : 0x%llx, %llu\n", offset, size >> 10);
+
+	if (etnaviv_obj->flags & ETNA_BO_WC)
+		return ioremap_wc(offset, size);
+
+	return ioremap(offset, size);
+}
+
+static void etnaviv_gem_vram_vunmap(struct etnaviv_gem_object *etnaviv_obj)
+{
+	lockdep_assert_held(&etnaviv_obj->lock);
+
+	iounmap(etnaviv_obj->vaddr);
+}
+
+static void etnaviv_gem_vram_release(struct etnaviv_gem_object *etnaviv_obj)
+{
+	if (etnaviv_obj->sgt) {
+		sg_free_table(etnaviv_obj->sgt);
+		kfree(etnaviv_obj->sgt);
+		etnaviv_obj->sgt = NULL;
+	}
+
+	if (etnaviv_obj->pages) {
+		kvfree(etnaviv_obj->pages);
+		etnaviv_obj->pages = NULL;
+	}
+
+	if (etnaviv_obj->vram_np) {
+		drm_mm_remove_node(etnaviv_obj->vram_np);
+		kfree(etnaviv_obj->vram_np);
+		etnaviv_obj->vram_np = NULL;
+	}
+}
+
+static int etnaviv_gem_vram_mmap(struct etnaviv_gem_object *etnaviv_obj,
+				 struct vm_area_struct *vma)
+{
+	pgprot_t vm_page_prot;
+
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+	if (etnaviv_obj->flags & ETNA_BO_WC)
+		vma->vm_page_prot = pgprot_writecombine(vm_page_prot);
+	else if (etnaviv_obj->flags & ETNA_BO_UNCACHED)
+		vma->vm_page_prot = pgprot_noncached(vm_page_prot);
+	else
+		vma->vm_page_prot = vm_page_prot;
+
+	return 0;
+}
+
+static const struct etnaviv_gem_ops etnaviv_gem_vram_ops = {
+	.get_pages = etnaviv_gem_vram_get_pages,
+	.release = etnaviv_gem_vram_release,
+	.vmap = etnaviv_gem_vram_vmap,
+	.vunmap = etnaviv_gem_vram_vunmap,
+	.mmap = etnaviv_gem_vram_mmap,
+};
+
+int etnaviv_gem_new_vram(struct drm_device *dev, struct drm_file *file,
+			 u32 size, u32 flags, u32 *handle)
+{
+	struct etnaviv_gem_object *etnaviv_obj;
+	struct drm_gem_object *obj;
+	int ret;
+
+	size = PAGE_ALIGN(size);
+
+	ret = etnaviv_gem_new_private(dev, size, flags, false,
+				      &etnaviv_gem_vram_ops, &etnaviv_obj);
+	if (ret)
+		return ret;
+
+	lockdep_set_class(&etnaviv_obj->lock, &etnaviv_vram_lock_class);
+
+	obj = &etnaviv_obj->base;
+
+	ret = drm_gem_handle_create(file, obj, handle);
+
+	/* drop reference from allocate - handle holds it now */
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static int etnaviv_pci_init_dedicated_vram(struct device *dev,
+					   struct etnaviv_drm_private *priv)
+{
+	struct pci_dev *gpu = to_pci_dev(dev);
+	static const struct etnaviv_pci_gpu_data *pdata;
+	resource_size_t base, size;
+	u32 bar;
+
+	pdata = etnaviv_pci_get_match_data(dev);
+	if (!pdata)
+		return -ENOENT;
+
+	if (pdata->num_vram <= 0) {
+		dev_err(dev, "Don't has a dedicated VRAM\n");
+		return -ENODEV;
+	}
+
+	/* Using the first vram bar */
+	bar = pdata->vram_bars[0];
+
+	base = pci_resource_start(gpu, bar);
+	size = pci_resource_len(gpu, bar);
+	if (!base || !size)
+		return -ENOSPC;
+
+	priv->vram.gpu_base = pci_bus_address(gpu, bar);
+	priv->vram.cpu_base = base;
+	priv->vram.size = size;
+	priv->dedicated_vram = true;
+
+	dev_info(dev, "GPU Bar %u contains dedicated VRAM\n", bar);
+
+	return 0;
+}
+
+int etnaviv_init_dedicated_vram(struct device *dev,
+				struct etnaviv_drm_private *priv)
+{
+	int ret;
+
+	if (dev->parent && dev_is_pci(dev->parent)) {
+		ret = etnaviv_pci_init_dedicated_vram(dev->parent, priv);
+		if (ret)
+			return ret;
+	}
+
+	if (!priv->vram.size)
+		return 0;
+
+	/* CPU physical address */
+	drm_mm_init(&priv->vram.mm, 0, priv->vram.size);
+
+	dev_info(dev, "VRAM device address range: %08llx-%08llx\n",
+		 priv->vram.gpu_base, priv->vram.gpu_base + priv->vram.size);
+	dev_info(dev, "VRAM CPU physical address range: %08llx~%08llx\n",
+		 priv->vram.cpu_base, priv->vram.cpu_base + priv->vram.size);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h b/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h
new file mode 100644
index 000000000000..bbce93f118a2
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_GEM_VRAM_H__
+#define __ETNAVIV_GEM_VRAM_H__
+
+int etnaviv_gem_new_vram(struct drm_device *dev, struct drm_file *file,
+			 u32 size, u32 flags, u32 *handle);
+
+int etnaviv_init_dedicated_vram(struct device *dev,
+				struct etnaviv_drm_private *priv);
+
+#endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
index 9911bfdc41a9..cbb7bc0947a7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -191,6 +191,19 @@ static struct pci_driver etnaviv_pci_driver = {
 	.remove = etnaviv_pci_remove,
 };
 
+const struct etnaviv_pci_gpu_data *
+etnaviv_pci_get_match_data(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const struct pci_device_id *entity;
+
+	entity = pci_match_id(etnaviv_pci_id_list, pdev);
+	if (!entity)
+		return NULL;
+
+	return etnaviv_pci_get_platform_data(entity);
+}
+
 int etnaviv_register_pci_driver(void)
 {
 	return pci_register_driver(&etnaviv_pci_driver);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
index 39eb2851355a..f5184fb35f50 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -42,6 +42,9 @@ struct etnaviv_pci_gpu_data {
 	char market_name[24];
 };
 
+const struct etnaviv_pci_gpu_data *
+etnaviv_pci_get_match_data(struct device *dev);
+
 int etnaviv_register_pci_driver(void);
 void etnaviv_unregister_pci_driver(void);
 
@@ -52,6 +55,9 @@ int jemo_pcie_init(struct pci_dev *pdev);
 static inline int etnaviv_register_pci_driver(void) { return 0; }
 static inline void etnaviv_unregister_pci_driver(void) { }
 
+static inline struct etnaviv_pci_gpu_data *
+etnaviv_pci_get_match_data(struct device *dev) { return NULL; }
+
 #endif
 
 #endif
-- 
2.43.0

