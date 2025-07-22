Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5AB0DF14
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A310E6C7;
	Tue, 22 Jul 2025 14:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0833A10E6BA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:48 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id D6D871C0740;
 Tue, 22 Jul 2025 16:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdcb:3c00:ce39:8bff:5db4:1ef8])
 by srv01.abscue.de (Postfix) with ESMTPSA id 378CE1C233C;
 Tue, 22 Jul 2025 16:41:45 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 22 Jul 2025 16:41:16 +0200
Subject: [PATCH v2 14/15] drm: sprd: implement IOMMU-based buffer
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-ums9230-drm-v2-14-054276ec213d@abscue.de>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
In-Reply-To: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

The default GEM DMA helpers use the DMA API to allocate and map buffers.
Since the DMA API integrates IOMMU support only in simple cases where the
main device has one IOMMU attached to it, this is not sufficient for
Unisoc SoCs in which multiple DPU instances with separate IOMMUs can
exist. Although this driver does not yet support such SoCs, the device
tree bindings specify that IOMMUs are connected to their respective DPU
nodes and not to the main "display-subsystem" node.

To utilize an IOMMU connected to the DPU node without ruling out future
use-cases as described in [1], implement buffer allocation and mapping
by using the IOMMU API directly, as done in other DRM drivers, e.g.
Rockchip and Tegra. Adding a second DPU should now automatically attach
its IOMMU to the same domain as the first IOMMU, causing the address
space to be shared between both DPUs.

[1]: https://lore.kernel.org/dri-devel/CAFPSGXZLXh__GuXT2NPqF0jpO2DnMAhz+NtE721EZfMCSKLBjQ@mail.gmail.com/

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/Makefile   |   3 +-
 drivers/gpu/drm/sprd/sprd_dpu.c |  15 ++
 drivers/gpu/drm/sprd/sprd_drm.c |  51 +++++-
 drivers/gpu/drm/sprd/sprd_drm.h |  10 ++
 drivers/gpu/drm/sprd/sprd_gem.c | 343 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_gem.h |  34 ++++
 6 files changed, 454 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index e82e6a6f89de2576b12af1975cc27045f3887570..80f6c66145b14372e0ce1f54ebdc09d1f4c2a569 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -3,6 +3,7 @@
 sprd-drm-y := sprd_drm.o \
 	sprd_dpu.o \
 	sprd_dsi.o \
+	sprd_gem.o \
 	megacores_pll.o
 
-obj-$(CONFIG_DRM_SPRD) += sprd-drm.o
\ No newline at end of file
+obj-$(CONFIG_DRM_SPRD) += sprd-drm.o
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index acf28de3fd08edaad03f01104f3e6cc7c243123c..c18fabbf670208f744cd59c8352726dc8c098590 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -841,11 +841,26 @@ static int sprd_dpu_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (device_iommu_mapped(dev)) {
+		ret = sprd_drm_iommu_attach(drm, dev);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
+static void sprd_dpu_unbind(struct device *dev,
+			    struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+
+	sprd_drm_iommu_detach(drm, dev);
+}
+
 static const struct component_ops dpu_component_ops = {
 	.bind = sprd_dpu_bind,
+	.unbind = sprd_dpu_unbind,
 };
 
 static const struct of_device_id dpu_match_table[] = {
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index ceacdcb7c566d00b98d83c27dbab80523bc6a7d5..4abc0b0b14f46ced91ea4478d861931db83dc87c 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -5,6 +5,7 @@
 
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
+#include <linux/iommu.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -20,6 +21,7 @@
 #include <drm/drm_vblank.h>
 
 #include "sprd_drm.h"
+#include "sprd_gem.h"
 
 #define DRIVER_NAME	"sprd"
 #define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
@@ -54,7 +56,8 @@ static struct drm_driver sprd_drm_drv = {
 	.fops			= &sprd_drm_fops,
 
 	/* GEM Operations */
-	DRM_GEM_DMA_DRIVER_OPS,
+	.dumb_create		= sprd_gem_dumb_create,
+	.gem_prime_import_sg_table = sprd_gem_prime_import_sg_table,
 
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
@@ -62,6 +65,49 @@ static struct drm_driver sprd_drm_drv = {
 	.minor			= DRIVER_MINOR,
 };
 
+int sprd_drm_iommu_attach(struct drm_device *drm, struct device *dpu_dev)
+{
+	struct sprd_drm *sprd = to_sprd_drm(drm);
+	struct iommu_domain_geometry *geometry;
+	int ret;
+
+	if (!sprd->iommu_domain) {
+		sprd->iommu_domain = iommu_paging_domain_alloc(dpu_dev);
+		if (IS_ERR(sprd->iommu_domain)) {
+			ret = PTR_ERR(sprd->iommu_domain);
+			sprd->iommu_domain = NULL;
+			return ret;
+		}
+
+		geometry = &sprd->iommu_domain->geometry;
+
+		drm_mm_init(&sprd->mm, geometry->aperture_start,
+			    geometry->aperture_end -
+			    geometry->aperture_start + 1);
+		mutex_init(&sprd->mm_lock);
+	}
+
+	return iommu_attach_device(sprd->iommu_domain, dpu_dev);
+}
+
+void sprd_drm_iommu_detach(struct drm_device *drm, struct device *dpu_dev)
+{
+	struct sprd_drm *sprd = to_sprd_drm(drm);
+
+	if (sprd->iommu_domain)
+		iommu_detach_device(sprd->iommu_domain, dpu_dev);
+}
+
+static void sprd_drm_iommu_cleanup(struct sprd_drm *sprd)
+{
+	if (!sprd->iommu_domain)
+		return;
+
+	mutex_destroy(&sprd->mm_lock);
+	drm_mm_takedown(&sprd->mm);
+	iommu_domain_free(sprd->iommu_domain);
+}
+
 static int sprd_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -112,6 +158,7 @@ static int sprd_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
+	sprd_drm_iommu_cleanup(sprd);
 	return ret;
 }
 
@@ -124,6 +171,8 @@ static void sprd_drm_unbind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 
 	component_unbind_all(drm->dev, drm);
+
+	sprd_drm_iommu_cleanup(to_sprd_drm(drm));
 }
 
 static const struct component_master_ops drm_component_ops = {
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
index 95d1b972f333c7056ac940d91255c6a812d264de..fa1f01ead6a55aa52ece483fd8f0bca2fad7a8a0 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.h
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -7,12 +7,22 @@
 #define _SPRD_DRM_H_
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_mm.h>
 #include <drm/drm_print.h>
 
 struct sprd_drm {
 	struct drm_device drm;
+
+	struct iommu_domain *iommu_domain;
+	struct mutex mm_lock;
+	struct drm_mm mm;
 };
 
+#define to_sprd_drm(x)	container_of(x, struct sprd_drm, drm)
+
+int sprd_drm_iommu_attach(struct drm_device *drm, struct device *dpu_dev);
+void sprd_drm_iommu_detach(struct drm_device *drm, struct device *dpu_dev);
+
 extern struct platform_driver sprd_dpu_driver;
 extern struct platform_driver sprd_dsi_driver;
 
diff --git a/drivers/gpu/drm/sprd/sprd_gem.c b/drivers/gpu/drm/sprd/sprd_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..5fa56ac35e977eae5f01d3f5c37873fa631fb224
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_gem.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ * Copyright (C) 2025 Otto Pflüger
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/vmalloc.h>
+
+#include <drm/drm_gem_dma_helper.h>
+
+#include "sprd_drm.h"
+#include "sprd_gem.h"
+
+static int sprd_gem_get_pages(struct sprd_gem_obj *sprd_gem)
+{
+	struct drm_gem_object *obj = &sprd_gem->base;
+	struct scatterlist *s;
+	int i, ret;
+
+	sprd_gem->pages = drm_gem_get_pages(obj);
+	if (IS_ERR(sprd_gem->pages))
+		return PTR_ERR(sprd_gem->pages);
+
+	sprd_gem->sgt = drm_prime_pages_to_sg(obj->dev, sprd_gem->pages,
+					      obj->size >> PAGE_SHIFT);
+	if (IS_ERR(sprd_gem->sgt)) {
+		ret = PTR_ERR(sprd_gem->sgt);
+		goto err_put_pages;
+	}
+
+	/*
+	 * From drivers/gpu/drm/rockchip/rockchip_drm_gem.c:
+	 *
+	 * Fake up the SG table so that dma_sync_sg_for_device() can be used
+	 * to flush the pages associated with it.
+	 *
+	 * TODO: Replace this by drm_clflush_sg() once it can be implemented
+	 * without relying on symbols that are not exported.
+	 */
+	for_each_sgtable_sg(sprd_gem->sgt, s, i)
+		sg_dma_address(s) = sg_phys(s);
+
+	dma_sync_sgtable_for_device(obj->dev->dev, sprd_gem->sgt, DMA_TO_DEVICE);
+
+	return 0;
+
+err_put_pages:
+	drm_gem_put_pages(obj, sprd_gem->pages, false, false);
+	return ret;
+}
+
+static void sprd_gem_put_pages(struct sprd_gem_obj *sprd_gem)
+{
+	sg_free_table(sprd_gem->sgt);
+	kfree(sprd_gem->sgt);
+	drm_gem_put_pages(&sprd_gem->base, sprd_gem->pages, true, true);
+}
+
+static int sprd_gem_iommu_map(struct sprd_gem_obj *sprd_gem)
+{
+	struct drm_gem_object *obj = &sprd_gem->base;
+	struct sprd_drm *sprd = to_sprd_drm(obj->dev);
+	ssize_t ret;
+
+	mutex_lock(&sprd->mm_lock);
+	ret = drm_mm_insert_node_generic(&sprd->mm, &sprd_gem->mm,
+					 obj->size, PAGE_SIZE, 0, 0);
+	mutex_unlock(&sprd->mm_lock);
+
+	if (ret) {
+		drm_err(obj->dev, "out of I/O virtual memory\n");
+		return ret;
+	}
+
+	sprd_gem->dma_addr = sprd_gem->mm.start;
+
+	ret = iommu_map_sgtable(sprd->iommu_domain, sprd_gem->dma_addr,
+				sprd_gem->sgt, IOMMU_READ | IOMMU_WRITE);
+	if (ret < (ssize_t)obj->size) {
+		drm_err(obj->dev,
+			"failed to map buffer: requested=%zd, ret=%zd\n",
+			obj->size, ret);
+		ret = -ENOMEM;
+		goto err_remove_node;
+	}
+
+	sprd_gem->map_size = ret;
+
+	return 0;
+
+err_remove_node:
+	mutex_lock(&sprd->mm_lock);
+	drm_mm_remove_node(&sprd_gem->mm);
+	mutex_unlock(&sprd->mm_lock);
+	return ret;
+}
+
+static void sprd_gem_iommu_unmap(struct sprd_gem_obj *sprd_gem)
+{
+	struct drm_gem_object *obj = &sprd_gem->base;
+	struct sprd_drm *sprd = to_sprd_drm(obj->dev);
+
+	iommu_unmap(sprd->iommu_domain, sprd_gem->dma_addr, sprd_gem->map_size);
+
+	mutex_lock(&sprd->mm_lock);
+	drm_mm_remove_node(&sprd_gem->mm);
+	mutex_unlock(&sprd->mm_lock);
+}
+
+static void sprd_gem_free_object(struct drm_gem_object *obj)
+{
+	struct sprd_drm *sprd = to_sprd_drm(obj->dev);
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+
+	if (obj->import_attach) {
+		if (sprd->iommu_domain)
+			sprd_gem_iommu_unmap(sprd_gem);
+		drm_prime_gem_destroy(obj, sprd_gem->sgt);
+	} else {
+		if (sprd->iommu_domain) {
+			sprd_gem_iommu_unmap(sprd_gem);
+			sprd_gem_put_pages(sprd_gem);
+		} else {
+			dma_free_wc(obj->dev->dev, obj->size,
+				    sprd_gem->vaddr, sprd_gem->dma_addr);
+		}
+	}
+
+	drm_gem_object_release(obj);
+
+	kfree(sprd_gem);
+}
+
+static struct sg_table *sprd_gem_object_get_sg_table(struct drm_gem_object *obj)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+	struct sg_table *sgt;
+	int ret;
+
+	if (sprd_gem->pages)
+		return drm_prime_pages_to_sg(obj->dev, sprd_gem->pages,
+					     obj->size >> PAGE_SHIFT);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = dma_get_sgtable(obj->dev->dev, sgt, sprd_gem->vaddr,
+			      sprd_gem->dma_addr, obj->size);
+	if (ret < 0) {
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	return 0;
+}
+
+static int sprd_gem_object_vmap(struct drm_gem_object *obj,
+				struct iosys_map *map)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+	void *vaddr;
+
+	if (!sprd_gem->pages) {
+		iosys_map_set_vaddr(map, sprd_gem->vaddr);
+		return 0;
+	}
+
+	vaddr = vmap(sprd_gem->pages, sprd_gem->base.size >> PAGE_SHIFT,
+		     VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr(map, vaddr);
+
+	return 0;
+}
+
+static void sprd_gem_object_vunmap(struct drm_gem_object *obj,
+				   struct iosys_map *map)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+
+	if (sprd_gem->pages)
+		vunmap(map->vaddr);
+}
+
+static int sprd_gem_object_mmap(struct drm_gem_object *obj,
+				struct vm_area_struct *vma)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+	int ret;
+
+	/*
+	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
+	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
+	 * the whole buffer.
+	 */
+	vm_flags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
+	vma->vm_pgoff = 0;
+
+	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+
+	if (sprd_gem->pages)
+		ret = vm_map_pages(vma, sprd_gem->pages,
+				   obj->size >> PAGE_SHIFT);
+	else
+		ret = dma_mmap_wc(obj->dev->dev, vma, sprd_gem->vaddr,
+				  sprd_gem->dma_addr, obj->size);
+
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+static const struct drm_gem_object_funcs sprd_gem_object_funcs = {
+	.free = sprd_gem_free_object,
+	.get_sg_table = sprd_gem_object_get_sg_table,
+	.vmap = sprd_gem_object_vmap,
+	.vunmap = sprd_gem_object_vunmap,
+	.mmap = sprd_gem_object_mmap,
+	.vm_ops = &drm_gem_dma_vm_ops,
+};
+
+static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_device *drm,
+						unsigned long size)
+{
+	struct sprd_gem_obj *sprd_gem;
+	int ret;
+
+	sprd_gem = kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
+	if (!sprd_gem)
+		return ERR_PTR(-ENOMEM);
+
+	sprd_gem->base.funcs = &sprd_gem_object_funcs;
+
+	ret = drm_gem_object_init(drm, &sprd_gem->base, size);
+	if (ret < 0) {
+		drm_err(drm, "failed to initialize gem object\n");
+		goto err_free;
+	}
+
+	return sprd_gem;
+
+err_free:
+	kfree(sprd_gem);
+	return ERR_PTR(ret);
+}
+
+int sprd_gem_dumb_create(struct drm_file *file_priv, struct drm_device *drm,
+			 struct drm_mode_create_dumb *args)
+{
+	struct sprd_drm *sprd = to_sprd_drm(drm);
+	struct sprd_gem_obj *sprd_gem;
+	int ret;
+
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = round_up(args->pitch * args->height, PAGE_SIZE);
+
+	sprd_gem = sprd_gem_obj_create(drm, args->size);
+	if (IS_ERR(sprd_gem))
+		return PTR_ERR(sprd_gem);
+
+	if (sprd->iommu_domain) {
+		ret = sprd_gem_get_pages(sprd_gem);
+		if (ret < 0)
+			goto err_free_object;
+
+		ret = sprd_gem_iommu_map(sprd_gem);
+		if (ret < 0) {
+			sprd_gem_put_pages(sprd_gem);
+			goto err_free_object;
+		}
+	} else {
+		sprd_gem->vaddr = dma_alloc_wc(drm->dev, args->size,
+					       &sprd_gem->dma_addr,
+					       GFP_KERNEL);
+		if (!sprd_gem->vaddr) {
+			drm_err(drm, "failed to allocate buffer of size %llu\n",
+				args->size);
+			ret = -ENOMEM;
+			goto err_free_object;
+		}
+	}
+
+	ret = drm_gem_handle_create(file_priv, &sprd_gem->base, &args->handle);
+	if (ret)
+		goto err_free_buf;
+
+	/* The handle holds its own reference, so we can drop ours now. */
+	drm_gem_object_put(&sprd_gem->base);
+
+	return 0;
+
+err_free_buf:
+	if (sprd->iommu_domain) {
+		sprd_gem_iommu_unmap(sprd_gem);
+		sprd_gem_put_pages(sprd_gem);
+	} else {
+		dma_free_wc(drm->dev, args->size, sprd_gem->vaddr,
+			    sprd_gem->dma_addr);
+	}
+err_free_object:
+	drm_gem_object_release(&sprd_gem->base);
+	kfree(sprd_gem);
+	return ret;
+}
+
+struct drm_gem_object *
+sprd_gem_prime_import_sg_table(struct drm_device *drm,
+			       struct dma_buf_attachment *attach,
+			       struct sg_table *sgt)
+{
+	struct sprd_drm *sprd = to_sprd_drm(drm);
+	struct sprd_gem_obj *sprd_gem;
+	int ret;
+
+	sprd_gem = sprd_gem_obj_create(drm, attach->dmabuf->size);
+	if (IS_ERR(sprd_gem))
+		return ERR_CAST(sprd_gem);
+
+	sprd_gem->sgt = sgt;
+
+	if (sprd->iommu_domain) {
+		ret = sprd_gem_iommu_map(sprd_gem);
+		if (ret < 0) {
+			drm_err(drm, "failed to import with IOMMU: %d\n", ret);
+			goto err_free_object;
+		}
+	} else {
+		sprd_gem->dma_addr = sg_dma_address(sgt->sgl);
+	}
+
+	return &sprd_gem->base;
+
+err_free_object:
+	drm_gem_object_release(&sprd_gem->base);
+	kfree(sprd_gem);
+	return ERR_PTR(ret);
+}
diff --git a/drivers/gpu/drm/sprd/sprd_gem.h b/drivers/gpu/drm/sprd/sprd_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..9531f37836c9f032aad28e4c8232651055f3b98c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_gem.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _SPRD_GEM_H_
+#define _SPRD_GEM_H_
+
+#include <drm/drm_gem.h>
+
+struct sprd_gem_obj {
+	struct drm_gem_object	base;
+	dma_addr_t		dma_addr;
+	struct sg_table		*sgt;
+	void			*vaddr;
+
+	/* Used when IOMMU is enabled */
+	struct drm_mm_node	mm;
+	struct page		**pages;
+	size_t			map_size;
+};
+
+#define to_sprd_gem_obj(x)	container_of(x, struct sprd_gem_obj, base)
+
+int sprd_gem_dumb_create(struct drm_file *file_priv,
+			 struct drm_device *dev,
+			 struct drm_mode_create_dumb *args);
+
+struct drm_gem_object *
+sprd_gem_prime_import_sg_table(struct drm_device *dev,
+			       struct dma_buf_attachment *attach,
+			       struct sg_table *sgtb);
+
+#endif

-- 
2.50.0
