Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43E4181FE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 14:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491E16E405;
	Sat, 25 Sep 2021 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 515306E405
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 12:46:28 +0000 (UTC)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
 by Forcepoint Email with ESMTPS id 2ECBE2642B6E4D6F05C4;
 Sat, 25 Sep 2021 20:46:20 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 25 Sep 2021 20:46:20 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 25 Sep 2021 20:46:19 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <intel-gvt-dev@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Use direction definition DMA_BIDIRECTIONAL instead
 of PCI_DMA_BIDIRECTIONAL
Date: Sat, 25 Sep 2021 20:46:12 +0800
Message-ID: <20210925124613.144-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

Replace direction definition PCI_DMA_BIDIRECTIONAL
with DMA_BIDIRECTIONAL, because it helps to enhance readability
and avoid possible inconsistency.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++--
 drivers/gpu/drm/i915/gvt/gtt.c              | 17 ++++++++---------
 drivers/gpu/drm/i915/gvt/kvmgt.c            |  4 ++--
 drivers/gpu/drm/i915/i915_gem_gtt.c         |  4 ++--
 4 files changed, 14 insertions(+), 15 deletions(-)

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
index e5c2fdfc20e3..53d0cb327539 100644
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
@@ -2409,8 +2409,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 		return -ENOMEM;
 	}
 
-	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0,
-			4096, PCI_DMA_BIDIRECTIONAL);
+	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0, 4096, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, daddr)) {
 		gvt_vgpu_err("fail to dmamap scratch_pt\n");
 		__free_page(virt_to_page(scratch_pt));
@@ -2461,7 +2460,7 @@ static int release_scratch_page_tree(struct intel_vgpu *vgpu)
 		if (vgpu->gtt.scratch_pt[i].page != NULL) {
 			daddr = (dma_addr_t)(vgpu->gtt.scratch_pt[i].page_mfn <<
 					I915_GTT_PAGE_SHIFT);
-			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
+			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
 			__free_page(vgpu->gtt.scratch_pt[i].page);
 			vgpu->gtt.scratch_pt[i].page = NULL;
 			vgpu->gtt.scratch_pt[i].page_mfn = 0;
@@ -2741,7 +2740,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 	}
 
 	daddr = dma_map_page(dev, virt_to_page(page), 0,
-			4096, PCI_DMA_BIDIRECTIONAL);
+			4096, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, daddr)) {
 		gvt_err("fail to dmamap scratch ggtt page\n");
 		__free_page(virt_to_page(page));
@@ -2755,7 +2754,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
 		ret = setup_spt_oos(gvt);
 		if (ret) {
 			gvt_err("fail to initialize SPT oos\n");
-			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
+			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
 			__free_page(gvt->gtt.scratch_page);
 			return ret;
 		}
@@ -2779,7 +2778,7 @@ void intel_gvt_clean_gtt(struct intel_gvt *gvt)
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
2.25.1

