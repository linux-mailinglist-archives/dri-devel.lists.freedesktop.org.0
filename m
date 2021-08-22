Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B33F41B0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 23:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BE289D77;
	Sun, 22 Aug 2021 21:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out02.smtpout.orange.fr [193.252.22.211])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB11A89D77
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 21:13:43 +0000 (UTC)
Received: from pop-os.home ([90.126.253.178]) by mwinf5d51 with ME
 id kl6A250043riaq203l6Aw9; Sun, 22 Aug 2021 23:06:12 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 23:06:12 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/i915: switch from 'pci_' to 'dma_' API
Date: Sun, 22 Aug 2021 23:06:09 +0200
Message-Id: <dbf1018fb773785e0b3b40e601246ed6438e645e.1629666258.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

It has been compile tested.

@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++--
 drivers/gpu/drm/i915/gvt/gtt.c              | 16 ++++++++--------
 drivers/gpu/drm/i915/gvt/kvmgt.c            |  4 ++--
 drivers/gpu/drm/i915/i915_gem_gtt.c         |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index a74b72f50cc9..afb35d2e5c73 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -32,7 +32,7 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
 	mem->remap_addr = dma_map_resource(i915->drm.dev,
 					   mem->region.start,
 					   mem->fake_mappable.size,
-					   PCI_DMA_BIDIRECTIONAL,
+					   DMA_BIDIRECTIONAL,
 					   DMA_ATTR_FORCE_CONTIGUOUS);
 	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
 		drm_mm_remove_node(&mem->fake_mappable);
@@ -62,7 +62,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
 	dma_unmap_resource(mem->i915->drm.dev,
 			   mem->remap_addr,
 			   mem->fake_mappable.size,
-			   PCI_DMA_BIDIRECTIONAL,
+			   DMA_BIDIRECTIONAL,
 			   DMA_ATTR_FORCE_CONTIGUOUS);
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index e5c2fdfc20e3..fb4e96a3e79e 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -745,7 +745,7 @@ static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
 	trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
 
 	dma_unmap_page(kdev, spt->shadow_page.mfn << I915_GTT_PAGE_SHIFT, 4096,
-		       PCI_DMA_BIDIRECTIONAL);
+		       DMA_BIDIRECTIONAL);
 
 	radix_tree_delete(&spt->vgpu->gtt.spt_tree, spt->shadow_page.mfn);
 
@@ -849,7 +849,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
 	 */
 	spt->shadow_page.type = type;
 	daddr = dma_map_page(kdev, spt->shadow_page.page,
-			     0, 4096, PCI_DMA_BIDIRECTIONAL);
+			     0, 4096, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(kdev, daddr)) {
 		gvt_vgpu_err("fail to map dma addr\n");
 		ret = -EINVAL;
@@ -865,7 +865,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
 	return spt;
 
 err_unmap_dma:
-	dma_unmap_page(kdev, daddr, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_page(kdev, daddr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 err_free_spt:
 	free_spt(spt);
 	return ERR_PTR(ret);
@@ -2410,7 +2410,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 	}
 
 	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0,
-			4096, PCI_DMA_BIDIRECTIONAL);
+			4096, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, daddr)) {
 		gvt_vgpu_err("fail to dmamap scratch_pt\n");
 		__free_page(virt_to_page(scratch_pt));
@@ -2461,7 +2461,7 @@ static int release_scratch_page_tree(struct intel_vgpu *vgpu)
 		if (vgpu->gtt.scratch_pt[i].page != NULL) {
 			daddr = (dma_addr_t)(vgpu->gtt.scratch_pt[i].page_mfn <<
 					I915_GTT_PAGE_SHIFT);
-			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
+			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
 			__free_page(vgpu->gtt.scratch_pt[i].page);
 			vgpu->gtt.scratch_pt[i].page = NULL;
 			vgpu->gtt.scratch_pt[i].page_mfn = 0;
@@ -2741,7 +2741,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 	}
 
 	daddr = dma_map_page(dev, virt_to_page(page), 0,
-			4096, PCI_DMA_BIDIRECTIONAL);
+			4096, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, daddr)) {
 		gvt_err("fail to dmamap scratch ggtt page\n");
 		__free_page(virt_to_page(page));
@@ -2755,7 +2755,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 		ret = setup_spt_oos(gvt);
 		if (ret) {
 			gvt_err("fail to initialize SPT oos\n");
-			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
+			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
 			__free_page(gvt->gtt.scratch_page);
 			return ret;
 		}
@@ -2779,7 +2779,7 @@ void intel_gvt_clean_gtt(struct intel_gvt *gvt)
 	dma_addr_t daddr = (dma_addr_t)(gvt->gtt.scratch_mfn <<
 					I915_GTT_PAGE_SHIFT);
 
-	dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
 
 	__free_page(gvt->gtt.scratch_page);
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7efa386449d1..20b82fb036f8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -328,7 +328,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		return ret;
 
 	/* Setup DMA mapping. */
-	*dma_addr = dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
+	*dma_addr = dma_map_page(dev, page, 0, size, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, *dma_addr)) {
 		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
 			     page_to_pfn(page), ret);
@@ -344,7 +344,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 {
 	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
 
-	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
 	gvt_unpin_guest_page(vgpu, gfn, size);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 36489be4896b..cd5f2348a187 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -30,7 +30,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 	do {
 		if (dma_map_sg_attrs(obj->base.dev->dev,
 				     pages->sgl, pages->nents,
-				     PCI_DMA_BIDIRECTIONAL,
+				     DMA_BIDIRECTIONAL,
 				     DMA_ATTR_SKIP_CPU_SYNC |
 				     DMA_ATTR_NO_KERNEL_MAPPING |
 				     DMA_ATTR_NO_WARN))
@@ -64,7 +64,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
 		usleep_range(100, 250);
 
 	dma_unmap_sg(i915->drm.dev, pages->sgl, pages->nents,
-		     PCI_DMA_BIDIRECTIONAL);
+		     DMA_BIDIRECTIONAL);
 }
 
 /**
-- 
2.30.2

