Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E389A14FE87
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 18:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380386EB0A;
	Sun,  2 Feb 2020 17:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4376EB0E;
 Sun,  2 Feb 2020 17:16:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20091964-1500050 
 for multiple; Sun, 02 Feb 2020 17:16:36 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/r128: Wean off drm_pci_alloc
Date: Sun,  2 Feb 2020 17:16:33 +0000
Message-Id: <20200202171635.4039044-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_pci_alloc is a thin wrapper over dma_coherent_alloc. Ditch the
wrapper and just use the dma routines directly.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/r128/ati_pcigart.c | 32 +++++++++++++++---------------
 drivers/gpu/drm/r128/ati_pcigart.h |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index 9b4072f97215..3d67afbbf0fc 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -44,9 +44,12 @@
 static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
 				       struct drm_ati_pcigart_info *gart_info)
 {
-	gart_info->table_handle = drm_pci_alloc(dev, gart_info->table_size,
-						PAGE_SIZE);
-	if (gart_info->table_handle == NULL)
+	gart_info->addr =
+		dma_alloc_coherent(&dev->pdev->dev,
+				  gart_info->table_size,
+				  ^gart_info->bus_addr,
+				  GFP_KERNEL);
+	if (!gart_info->addr)
 		return -ENOMEM;
 
 	return 0;
@@ -55,8 +58,10 @@ static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
 static void drm_ati_free_pcigart_table(struct drm_device *dev,
 				       struct drm_ati_pcigart_info *gart_info)
 {
-	drm_pci_free(dev, gart_info->table_handle);
-	gart_info->table_handle = NULL;
+	dma_free_coherent(&dev->pdev->dev,
+			  gart_info->table_size,
+			  gart_info->addr,
+			  gart_info->bus_addr);
 }
 
 int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info *gart_info)
@@ -89,8 +94,7 @@ int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info
 			gart_info->bus_addr = 0;
 	}
 
-	if (gart_info->gart_table_location == DRM_ATI_GART_MAIN &&
-	    gart_info->table_handle) {
+	if (gart_info->gart_table_location == DRM_ATI_GART_MAIN)
 		drm_ati_free_pcigart_table(dev, gart_info);
 	}
 
@@ -103,7 +107,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 	struct drm_sg_mem *entry = dev->sg;
 	void *address = NULL;
 	unsigned long pages;
-	u32 *pci_gart = NULL, page_base, gart_idx;
+	u32 *page_base, gart_idx;
 	dma_addr_t bus_address = 0;
 	int i, j, ret = -ENOMEM;
 	int max_ati_pages, max_real_pages;
@@ -128,18 +132,14 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 			DRM_ERROR("cannot allocate PCI GART page!\n");
 			goto done;
 		}
-
-		pci_gart = gart_info->table_handle->vaddr;
-		address = gart_info->table_handle->vaddr;
-		bus_address = gart_info->table_handle->busaddr;
 	} else {
-		address = gart_info->addr;
-		bus_address = gart_info->bus_addr;
 		DRM_DEBUG("PCI: Gart Table: VRAM %08LX mapped at %08lX\n",
 			  (unsigned long long)bus_address,
 			  (unsigned long)address);
 	}
 
+	address = gart_info->addr;
+	bus_address = gart_info->bus_addr;
 
 	max_ati_pages = (gart_info->table_size / sizeof(u32));
 	max_real_pages = max_ati_pages / (PAGE_SIZE / ATI_PCIGART_PAGE_SIZE);
@@ -147,7 +147,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 	    ? entry->pages : max_real_pages;
 
 	if (gart_info->gart_table_location == DRM_ATI_GART_MAIN) {
-		memset(pci_gart, 0, max_ati_pages * sizeof(u32));
+		memset(address, 0, max_ati_pages * sizeof(u32));
 	} else {
 		memset_io((void __iomem *)map->handle, 0, max_ati_pages * sizeof(u32));
 	}
@@ -185,7 +185,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 			}
 			if (gart_info->gart_table_location ==
 			    DRM_ATI_GART_MAIN) {
-				pci_gart[gart_idx] = cpu_to_le32(val);
+				address[gart_idx] = cpu_to_le32(val);
 			} else {
 				offset = gart_idx * sizeof(u32);
 				writel(val, (void __iomem *)map->handle + offset);
diff --git a/drivers/gpu/drm/r128/ati_pcigart.h b/drivers/gpu/drm/r128/ati_pcigart.h
index a728a1364e66..6219aced7e84 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.h
+++ b/drivers/gpu/drm/r128/ati_pcigart.h
@@ -18,7 +18,7 @@ struct drm_ati_pcigart_info {
 	void *addr;
 	dma_addr_t bus_addr;
 	dma_addr_t table_mask;
-	struct drm_dma_handle *table_handle;
+	dma_addr_t dma_addr;
 	struct drm_local_map mapping;
 	int table_size;
 };
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
