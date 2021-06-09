Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9B3A1BAC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F62A6E9B6;
	Wed,  9 Jun 2021 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD706E9B6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:12 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:09 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id BA8012024E;
 Wed,  9 Jun 2021 10:23:11 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] drm/vmwgfx: remove code that was using physical page
 addresses
Date: Wed, 9 Jun 2021 13:23:03 -0400
Message-ID: <20210609172307.131929-6-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609172307.131929-1-zackr@vmware.com>
References: <20210609172307.131929-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code has been unused for a while now. When the explicit checks
for whether the driver is running on top of non-coherent swiotlb
have been deprecated we lost the ability to fallback to physical
mappings. Instead of trying to readd a module parameter to force
usage of physical addresses it's better to just force coherent
TTM pages via the force_coherent module parameter making this
code pointless.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  7 +------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 19 -------------------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index b9f18151663a..be3db4988949 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -272,7 +272,6 @@ static const struct pci_device_id vmw_pci_id_list[] = {
 MODULE_DEVICE_TABLE(pci, vmw_pci_id_list);
 
 static int enable_fbdev = IS_ENABLED(CONFIG_DRM_VMWGFX_FBCON);
-static int vmw_force_iommu;
 static int vmw_restrict_iommu;
 static int vmw_force_coherent;
 static int vmw_restrict_dma_mask;
@@ -284,8 +283,6 @@ static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 
 MODULE_PARM_DESC(enable_fbdev, "Enable vmwgfx fbdev");
 module_param_named(enable_fbdev, enable_fbdev, int, 0600);
-MODULE_PARM_DESC(force_dma_api, "Force using the DMA API for TTM pages");
-module_param_named(force_dma_api, vmw_force_iommu, int, 0600);
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
@@ -645,7 +642,6 @@ static void vmw_get_initial_size(struct vmw_private *dev_priv)
 static int vmw_dma_select_mode(struct vmw_private *dev_priv)
 {
 	static const char *names[vmw_dma_map_max] = {
-		[vmw_dma_phys] = "Using physical TTM page addresses.",
 		[vmw_dma_alloc_coherent] = "Using coherent TTM pages.",
 		[vmw_dma_map_populate] = "Caching DMA mappings.",
 		[vmw_dma_map_bind] = "Giving up DMA mappings early."};
@@ -679,8 +675,7 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
 	int ret = 0;
 
 	ret = dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(64));
-	if (dev_priv->map_mode != vmw_dma_phys &&
-	    (sizeof(unsigned long) == 4 || vmw_restrict_dma_mask)) {
+	if (sizeof(unsigned long) == 4 || vmw_restrict_dma_mask) {
 		DRM_INFO("Restricting DMA addresses to 44 bits.\n");
 		return dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(44));
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 0d8699a43491..31519b78cb6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -314,7 +314,6 @@ struct vmw_res_cache_entry {
  * enum vmw_dma_map_mode - indicate how to perform TTM page dma mappings.
  */
 enum vmw_dma_map_mode {
-	vmw_dma_phys,           /* Use physical page addresses */
 	vmw_dma_alloc_coherent, /* Use TTM coherent pages */
 	vmw_dma_map_populate,   /* Unmap from DMA just after unpopulate */
 	vmw_dma_map_bind,       /* Unmap from DMA just before unbind */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0488042fb287..a6015f2a297f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -237,21 +237,6 @@ static struct page *__vmw_piter_non_sg_page(struct vmw_piter *viter)
 	return viter->pages[viter->i];
 }
 
-/**
- * __vmw_piter_phys_addr: Helper functions to return the DMA
- * address of the current page.
- *
- * @viter: Pointer to the iterator
- *
- * These functions return the DMA address of the page currently
- * pointed to by @viter. Functions are selected depending on the
- * current mapping mode.
- */
-static dma_addr_t __vmw_piter_phys_addr(struct vmw_piter *viter)
-{
-	return page_to_phys(viter->pages[viter->i]);
-}
-
 static dma_addr_t __vmw_piter_dma_addr(struct vmw_piter *viter)
 {
 	return viter->addrs[viter->i];
@@ -282,10 +267,6 @@ void vmw_piter_start(struct vmw_piter *viter, const struct vmw_sg_table *vsgt,
 	viter->page = &__vmw_piter_non_sg_page;
 	viter->pages = vsgt->pages;
 	switch (vsgt->mode) {
-	case vmw_dma_phys:
-		viter->next = &__vmw_piter_non_sg_next;
-		viter->dma_address = &__vmw_piter_phys_addr;
-		break;
 	case vmw_dma_alloc_coherent:
 		viter->next = &__vmw_piter_non_sg_next;
 		viter->dma_address = &__vmw_piter_dma_addr;
-- 
2.30.2

