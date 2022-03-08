Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE94D21FA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F11C10E351;
	Tue,  8 Mar 2022 19:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7071810E4CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BED851F39B;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpEWdvhapfugcwyp/9xLTM68aqYgxliJApxGOZ1IQU8=;
 b=OGCaKHGIwLQ1A4wIlRbTSZFz5J9pSIxMNwf8ilm0Lb8K6uZDlezQg47avR3OzJIySOFwkP
 cIHn77cbt2KiIAUgotfHrUfBBGnyjavQpL24MD3g7yX8VTGLnTyYzM3wAxZnC2SQtSC8n4
 pH8GWeYw1yN6nGOlHx2wmeSs2JqHijM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpEWdvhapfugcwyp/9xLTM68aqYgxliJApxGOZ1IQU8=;
 b=xC4cx6bmkZp002vpkcfi7oVDTuL0YeiI8I+cbAjiVm5LBq/iXKn+Mq3uVNMRkZxnf1rVbX
 U3+fK0Jeu0qVfmAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D70113CFB;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GG6GJfmzJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 10/12] drm/gma500: Move GEM memory management functions to
 gem.c
Date: Tue,  8 Mar 2022 20:52:20 +0100
Message-Id: <20220308195222.13471-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308195222.13471-1-tzimmermann@suse.de>
References: <20220308195222.13471-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move GEM functions from gtt.c to gem.c. Adapt some names. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c     | 133 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/gma500/gem.h     |  12 +++
 drivers/gpu/drm/gma500/gtt.c     | 127 +----------------------------
 drivers/gpu/drm/gma500/gtt.h     |   5 +-
 drivers/gpu/drm/gma500/power.c   |   1 +
 drivers/gpu/drm/gma500/psb_drv.c |   1 +
 6 files changed, 149 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 2f44535f58e7..dffe37490206 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -21,6 +21,10 @@
 #include "gem.h"
 #include "psb_drv.h"
 
+/*
+ * PSB GEM object
+ */
+
 int psb_gem_pin(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
@@ -296,3 +300,132 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 
 	return ret;
 }
+
+/*
+ * Memory management
+ */
+
+/* Insert vram stolen pages into the GTT. */
+static void psb_gem_mm_populate_stolen(struct drm_psb_private *pdev)
+{
+	struct drm_device *dev = &pdev->dev;
+	unsigned int pfn_base;
+	unsigned int i, num_pages;
+	uint32_t pte;
+
+	pfn_base = pdev->stolen_base >> PAGE_SHIFT;
+	num_pages = pdev->vram_stolen_size >> PAGE_SHIFT;
+
+	drm_dbg(dev, "Set up %u stolen pages starting at 0x%08x, GTT offset %dK\n",
+		num_pages, pfn_base << PAGE_SHIFT, 0);
+
+	for (i = 0; i < num_pages; ++i) {
+		pte = psb_gtt_mask_pte(pfn_base + i, PSB_MMU_CACHED_MEMORY);
+		iowrite32(pte, pdev->gtt_map + i);
+	}
+
+	(void)ioread32(pdev->gtt_map + i - 1);
+}
+
+int psb_gem_mm_init(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	unsigned long stolen_size, vram_stolen_size;
+	struct psb_gtt *pg;
+	int ret;
+
+	mutex_init(&dev_priv->mmap_mutex);
+
+	pg = &dev_priv->gtt;
+
+	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
+	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
+
+	stolen_size = vram_stolen_size;
+
+	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
+		dev_priv->stolen_base, vram_stolen_size / 1024);
+
+	pg->stolen_size = stolen_size;
+	dev_priv->vram_stolen_size = vram_stolen_size;
+
+	dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
+	if (!dev_priv->vram_addr) {
+		dev_err(dev->dev, "Failure to map stolen base.\n");
+		ret = -ENOMEM;
+		goto err_mutex_destroy;
+	}
+
+	psb_gem_mm_populate_stolen(dev_priv);
+
+	return 0;
+
+err_mutex_destroy:
+	mutex_destroy(&dev_priv->mmap_mutex);
+	return ret;
+}
+
+void psb_gem_mm_fini(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
+	iounmap(dev_priv->vram_addr);
+
+	mutex_destroy(&dev_priv->mmap_mutex);
+}
+
+/* Re-insert all pinned GEM objects into GTT. */
+static void psb_gem_mm_populate_resources(struct drm_psb_private *pdev)
+{
+	unsigned int restored = 0, total = 0, size = 0;
+	struct resource *r = pdev->gtt_mem->child;
+	struct drm_device *dev = &pdev->dev;
+	struct psb_gem_object *pobj;
+
+	while (r) {
+		/*
+		 * TODO: GTT restoration needs a refactoring, so that we don't have to touch
+		 *       struct psb_gem_object here. The type represents a GEM object and is
+		 *       not related to the GTT itself.
+		 */
+		pobj = container_of(r, struct psb_gem_object, resource);
+		if (pobj->pages) {
+			psb_gtt_insert_pages(pdev, &pobj->resource, pobj->pages);
+			size += resource_size(&pobj->resource);
+			++restored;
+		}
+		r = r->sibling;
+		++total;
+	}
+
+	drm_dbg(dev, "Restored %u of %u gtt ranges (%u KB)", restored, total, (size / 1024));
+}
+
+int psb_gem_mm_resume(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	unsigned long stolen_size, vram_stolen_size;
+	struct psb_gtt *pg;
+
+	pg = &dev_priv->gtt;
+
+	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
+	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
+
+	stolen_size = vram_stolen_size;
+
+	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n", dev_priv->stolen_base,
+		vram_stolen_size / 1024);
+
+	if (stolen_size != pg->stolen_size) {
+		dev_err(dev->dev, "GTT resume error.\n");
+		return -EINVAL;
+	}
+
+	psb_gem_mm_populate_stolen(dev_priv);
+	psb_gem_mm_populate_resources(dev_priv);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 96ef864b4bf1..27df6ff4ed37 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -14,6 +14,10 @@
 
 struct drm_device;
 
+/*
+ * PSB GEM object
+ */
+
 struct psb_gem_object {
 	struct drm_gem_object base;
 
@@ -36,4 +40,12 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 int psb_gem_pin(struct psb_gem_object *pobj);
 void psb_gem_unpin(struct psb_gem_object *pobj);
 
+/*
+ * Memory management
+ */
+
+int psb_gem_mm_init(struct drm_device *dev);
+void psb_gem_mm_fini(struct drm_device *dev);
+int psb_gem_mm_resume(struct drm_device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 9e1b19fcea28..b03feec64f01 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -49,7 +49,7 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
  *
  *	Set the GTT entry for the appropriate memory type.
  */
-static inline uint32_t psb_gtt_mask_pte(uint32_t pfn, int type)
+uint32_t psb_gtt_mask_pte(uint32_t pfn, int type)
 {
 	uint32_t mask = PSB_PTE_VALID;
 
@@ -125,15 +125,6 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 	mutex_unlock(&pdev->gtt_mutex);
 }
 
-void psb_gem_mm_fini(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-
-	iounmap(dev_priv->vram_addr);
-
-	mutex_destroy(&dev_priv->mmap_mutex);
-}
-
 void psb_gtt_fini(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -164,55 +155,6 @@ static void psb_gtt_clear(struct drm_psb_private *pdev)
 	(void)ioread32(pdev->gtt_map + i - 1);
 }
 
-/* Insert vram stolen pages into the GTT. */
-static void psb_gtt_populate_stolen(struct drm_psb_private *pdev)
-{
-	struct drm_device *dev = &pdev->dev;
-	unsigned int pfn_base;
-	unsigned int i, num_pages;
-	uint32_t pte;
-
-	pfn_base = pdev->stolen_base >> PAGE_SHIFT;
-	num_pages = pdev->vram_stolen_size >> PAGE_SHIFT;
-
-	drm_dbg(dev, "Set up %u stolen pages starting at 0x%08x, GTT offset %dK\n",
-		num_pages, pfn_base << PAGE_SHIFT, 0);
-
-	for (i = 0; i < num_pages; ++i) {
-		pte = psb_gtt_mask_pte(pfn_base + i, PSB_MMU_CACHED_MEMORY);
-		iowrite32(pte, pdev->gtt_map + i);
-	}
-
-	(void)ioread32(pdev->gtt_map + i - 1);
-}
-
-/* Re-insert all pinned GEM objects into GTT. */
-static void psb_gtt_populate_resources(struct drm_psb_private *pdev)
-{
-	unsigned int restored = 0, total = 0, size = 0;
-	struct resource *r = pdev->gtt_mem->child;
-	struct drm_device *dev = &pdev->dev;
-	struct psb_gem_object *pobj;
-
-	while (r) {
-		/*
-		 * TODO: GTT restoration needs a refactoring, so that we don't have to touch
-		 *       struct psb_gem_object here. The type represents a GEM object and is
-		 *       not related to the GTT itself.
-		 */
-		pobj = container_of(r, struct psb_gem_object, resource);
-		if (pobj->pages) {
-			psb_gtt_insert_pages(pdev, &pobj->resource, pobj->pages);
-			size += resource_size(&pobj->resource);
-			++restored;
-		}
-		r = r->sibling;
-		++total;
-	}
-
-	drm_dbg(dev, "Restored %u of %u gtt ranges (%u KB)", restored, total, (size / 1024));
-}
-
 int psb_gtt_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -300,45 +242,6 @@ int psb_gtt_init(struct drm_device *dev)
 	return ret;
 }
 
-int psb_gem_mm_init(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	unsigned long stolen_size, vram_stolen_size;
-	struct psb_gtt *pg;
-	int ret;
-
-	mutex_init(&dev_priv->mmap_mutex);
-
-	pg = &dev_priv->gtt;
-
-	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
-	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
-
-	stolen_size = vram_stolen_size;
-
-	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
-		dev_priv->stolen_base, vram_stolen_size / 1024);
-
-	pg->stolen_size = stolen_size;
-	dev_priv->vram_stolen_size = vram_stolen_size;
-
-	dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
-	if (!dev_priv->vram_addr) {
-		dev_err(dev->dev, "Failure to map stolen base.\n");
-		ret = -ENOMEM;
-		goto err_mutex_destroy;
-	}
-
-	psb_gtt_populate_stolen(dev_priv);
-
-	return 0;
-
-err_mutex_destroy:
-	mutex_destroy(&dev_priv->mmap_mutex);
-	return ret;
-}
-
 int psb_gtt_resume(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -421,31 +324,3 @@ int psb_gtt_resume(struct drm_device *dev)
 	(void)PSB_RVDC32(PSB_PGETBL_CTL);
 	return ret;
 }
-
-int psb_gem_mm_resume(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	unsigned long stolen_size, vram_stolen_size;
-	struct psb_gtt *pg;
-
-	pg = &dev_priv->gtt;
-
-	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
-	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
-
-	stolen_size = vram_stolen_size;
-
-	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n", dev_priv->stolen_base,
-		vram_stolen_size / 1024);
-
-	if (stolen_size != pg->stolen_size) {
-		dev_err(dev->dev, "GTT resume error.\n");
-		return -EINVAL;
-	}
-
-	psb_gtt_populate_stolen(dev_priv);
-	psb_gtt_populate_resources(dev_priv);
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 9a6d79200dce..d5a5fd4466c1 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -33,12 +33,9 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
 			      const char *name, resource_size_t size, resource_size_t align,
 			      bool stolen, u32 *offset);
 
+uint32_t psb_gtt_mask_pte(uint32_t pfn, int type);
 void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
 			  struct page **pages);
 void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res);
 
-int psb_gem_mm_init(struct drm_device *dev);
-void psb_gem_mm_fini(struct drm_device *dev);
-int psb_gem_mm_resume(struct drm_device *dev);
-
 #endif
diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index 28e472b31698..6f917cfef65b 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -28,6 +28,7 @@
  *    Alan Cox <alan@linux.intel.com>
  */
 
+#include "gem.h"
 #include "power.h"
 #include "psb_drv.h"
 #include "psb_reg.h"
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 6547967b51e1..e30b58184156 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -28,6 +28,7 @@
 #include <drm/drm_vblank.h>
 
 #include "framebuffer.h"
+#include "gem.h"
 #include "intel_bios.h"
 #include "mid_bios.h"
 #include "power.h"
-- 
2.35.1

