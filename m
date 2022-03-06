Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738A4CEDC0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9CA10E651;
	Sun,  6 Mar 2022 20:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CCD10E651
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A8B61F397;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvNRwGUS3BnftXC5CcuBNozOkkEHmidwc4jah4aRfs0=;
 b=zfhs1litSrKpyRAu/0jTKtulHqfdtvcaFN/0u/GnqRXKpSYq7yoNSRQJovfTo/PPsGYSWQ
 ycyKg48WxxntkdkHZe1/XJJfHxDpaauR0Owz5gZ3/neOhLASbS1aWd7yCuU0kYg1ljyC3g
 J51wHk8jS+Xao68BuGnSNCCp412viaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvNRwGUS3BnftXC5CcuBNozOkkEHmidwc4jah4aRfs0=;
 b=UJIk78mMNhOQBn1UQNVyU6jX+4zbBv3V3t5Y53dj6Guw0MXKzmrDdtRpuuoTlbBXiizF7U
 zuAZ4RrA1gaV8sDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A629134CD;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPvQGEUbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 05/10] drm/gma500: Move GTT setup and restoration into helper
 funtions
Date: Sun,  6 Mar 2022 21:36:14 +0100
Message-Id: <20220306203619.22624-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306203619.22624-1-tzimmermann@suse.de>
References: <20220306203619.22624-1-tzimmermann@suse.de>
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

The GTT init and restore functions contain logic to populate the
GTT entries. Move the code into helper functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c | 115 +++++++++++++++++++++--------------
 1 file changed, 68 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index c7b7cb1f2d13..acd50ee26b03 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -144,18 +144,79 @@ void psb_gtt_takedown(struct drm_device *dev)
 		iounmap(dev_priv->gtt_map);
 }
 
+/* Clear GTT. Use a scratch page to avoid accidents or scribbles. */
+static void psb_gtt_clear(struct drm_psb_private *pdev)
+{
+	resource_size_t pfn_base;
+	unsigned long i;
+	uint32_t pte;
+
+	pfn_base = page_to_pfn(pdev->scratch_page);
+	pte = psb_gtt_mask_pte(pfn_base, PSB_MMU_CACHED_MEMORY);
+
+	for (i = 0; i < pdev->gtt.gtt_pages; ++i)
+		iowrite32(pte, pdev->gtt_map + i);
+
+	(void)ioread32(pdev->gtt_map + i - 1);
+}
+
+/* Insert vram stolen pages into the GTT. */
+static void psb_gtt_populate_stolen(struct drm_psb_private *pdev)
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
+/* Re-insert all pinned GEM objects into GTT. */
+static void psb_gtt_populate_resources(struct drm_psb_private *pdev)
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
 int psb_gtt_init(struct drm_device *dev, int resume)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned gtt_pages;
 	unsigned long stolen_size, vram_stolen_size;
-	unsigned i, num_pages;
-	unsigned pfn_base;
 	struct psb_gtt *pg;
-
 	int ret = 0;
-	uint32_t pte;
 
 	if (!resume) {
 		mutex_init(&dev_priv->gtt_mutex);
@@ -262,29 +323,9 @@ int psb_gtt_init(struct drm_device *dev, int resume)
 		goto out_err;
 	}
 
-	/*
-	 * Insert vram stolen pages into the GTT
-	 */
-
-	pfn_base = dev_priv->stolen_base >> PAGE_SHIFT;
-	num_pages = vram_stolen_size >> PAGE_SHIFT;
-	dev_dbg(dev->dev, "Set up %d stolen pages starting at 0x%08x, GTT offset %dK\n",
-		num_pages, pfn_base << PAGE_SHIFT, 0);
-	for (i = 0; i < num_pages; ++i) {
-		pte = psb_gtt_mask_pte(pfn_base + i, PSB_MMU_CACHED_MEMORY);
-		iowrite32(pte, dev_priv->gtt_map + i);
-	}
-
-	/*
-	 * Init rest of GTT to the scratch page to avoid accidents or scribbles
-	 */
-
-	pfn_base = page_to_pfn(dev_priv->scratch_page);
-	pte = psb_gtt_mask_pte(pfn_base, PSB_MMU_CACHED_MEMORY);
-	for (; i < gtt_pages; ++i)
-		iowrite32(pte, dev_priv->gtt_map + i);
+	psb_gtt_clear(dev_priv);
+	psb_gtt_populate_stolen(dev_priv);
 
-	(void) ioread32(dev_priv->gtt_map + i - 1);
 	return 0;
 
 out_err:
@@ -295,30 +336,10 @@ int psb_gtt_init(struct drm_device *dev, int resume)
 int psb_gtt_restore(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct resource *r = dev_priv->gtt_mem->child;
-	struct psb_gem_object *pobj;
-	unsigned int restored = 0, total = 0, size = 0;
 
 	psb_gtt_init(dev, 1);
 
-	while (r != NULL) {
-		/*
-		 * TODO: GTT restoration needs a refactoring, so that we don't have to touch
-		 *       struct psb_gem_object here. The type represents a GEM object and is
-		 *       not related to the GTT itself.
-		 */
-		pobj = container_of(r, struct psb_gem_object, resource);
-		if (pobj->pages) {
-			psb_gtt_insert_pages(dev_priv, &pobj->resource, pobj->pages);
-			size += pobj->resource.end - pobj->resource.start;
-			restored++;
-		}
-		r = r->sibling;
-		total++;
-	}
-
-	DRM_DEBUG_DRIVER("Restored %u of %u gtt ranges (%u KB)", restored,
-			 total, (size / 1024));
+	psb_gtt_populate_resources(dev_priv);
 
 	return 0;
 }
-- 
2.35.1

