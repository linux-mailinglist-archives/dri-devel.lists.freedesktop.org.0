Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCA41AADF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836BF6E882;
	Tue, 28 Sep 2021 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDADB6E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A777B201E3;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oyd3uwxwp9Fa+NKU+hKs9ldV2oGH4g+T60nsXJTFdWw=;
 b=pFJFFHkGGwAqHiwDPfSF+1iZc/DC4wfBfS/3e5nEe6inaMbURkZnWQhRsHbnrTvcM1qmrH
 +G1AI93J0amvVfeYdP41I6nNMkDm1V/MkzWlMC/GCL/lPyczuubLSOR6BVi4AOeKDwcxpr
 DdDXtmji2Yq2iK+ZQ4sKkHNLBBj58XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oyd3uwxwp9Fa+NKU+hKs9ldV2oGH4g+T60nsXJTFdWw=;
 b=xLwL2L/6S0k6rhZ3SlxJIVZ1lQ40EXpux+tvRNc1NF3ZF5xVLfbUNG97G5frb2dQ1ejCqI
 yVCfE6UCT7hrJSCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8042D13BA5;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QPRhHgHWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/10] drm/gma500: Rewrite GTT page insert/remove without
 struct gtt_range
Date: Tue, 28 Sep 2021 10:44:45 +0200
Message-Id: <20210928084446.22580-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928084446.22580-1-tzimmermann@suse.de>
References: <20210928084446.22580-1-tzimmermann@suse.de>
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

struct gtt_range represents a GEM object and should not be used for GTT
setup. Change psb_gtt_insert() and psb_gtt_remove() to receive all
necessary parameters from their caller. This also eliminates possible
failure from psb_gtt_insert().

There's one exception in psb_gtt_restore(), which requires an upcast
from struct resource to struct gtt_range when restoring the GTT after
hibernation. A possible solution would track the GEM objects that need
restoration separately from the GTT resource.

Rename the functions to psb_gtt_insert_pages() and psb_gtt_remove_pages()
to reflect their similarity to MMU interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 13 ++----
 drivers/gpu/drm/gma500/gtt.c | 87 ++++++++++++------------------------
 drivers/gpu/drm/gma500/gtt.h |  5 ++-
 3 files changed, 35 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index a88d51a3aa2a..fd556ba2c044 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -23,7 +23,6 @@
 
 int psb_gem_pin(struct gtt_range *gt)
 {
-	int ret = 0;
 	struct drm_device *dev = gt->gem.dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
@@ -43,10 +42,7 @@ int psb_gem_pin(struct gtt_range *gt)
 
 	set_pages_array_wc(pages, npages);
 
-	ret = psb_gtt_insert(dev, gt);
-	if (ret)
-		goto err_drm_gem_put_pages;
-
+	psb_gtt_insert_pages(dev_priv, &gt->resource, pages);
 	psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
 			     (gpu_base + gt->offset), npages, 0, 0,
 			     PSB_MMU_CACHED_MEMORY);
@@ -59,10 +55,6 @@ int psb_gem_pin(struct gtt_range *gt)
 	mutex_unlock(&dev_priv->gtt_mutex);
 
 	return 0;
-
-err_drm_gem_put_pages:
-	drm_gem_put_pages(&gt->gem, pages, true, false);
-	return ret;
 }
 
 void psb_gem_unpin(struct gtt_range *gt)
@@ -82,13 +74,14 @@ void psb_gem_unpin(struct gtt_range *gt)
 
 	psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
 				     (gpu_base + gt->offset), gt->npage, 0, 0);
-	psb_gtt_remove(dev, gt);
+	psb_gtt_remove_pages(dev_priv, &gt->resource);
 
 	/* Reset caching flags */
 	set_pages_array_wb(gt->pages, gt->npage);
 
 	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
 	gt->pages = NULL;
+	gt->npage = 0;
 
 out:
 	mutex_unlock(&dev_priv->gtt_mutex);
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 244de618e612..cf71a2396c16 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -66,85 +66,51 @@ static inline uint32_t psb_gtt_mask_pte(uint32_t pfn, int type)
 	return (pfn << PAGE_SHIFT) | mask;
 }
 
-/**
- *	psb_gtt_entry		-	find the GTT entries for a gtt_range
- *	@dev: our DRM device
- *	@r: our GTT range
- *
- *	Given a gtt_range object return the GTT offset of the page table
- *	entries for this gtt_range
- */
-static u32 __iomem *psb_gtt_entry(struct drm_device *dev, struct gtt_range *r)
+static u32 __iomem *psb_gtt_entry(struct drm_psb_private *pdev, const struct resource *res)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	unsigned long offset;
-
-	offset = r->resource.start - dev_priv->gtt_mem->start;
+	unsigned long offset = res->start - pdev->gtt_mem->start;
 
-	return dev_priv->gtt_map + (offset >> PAGE_SHIFT);
+	return pdev->gtt_map + (offset >> PAGE_SHIFT);
 }
 
-/**
- *	psb_gtt_insert	-	put an object into the GTT
- *	@dev: our DRM device
- *	@r: our GTT range
- *
- *	Take our preallocated GTT range and insert the GEM object into
- *	the GTT. This is protected via the gtt mutex which the caller
- *	must hold.
- */
-int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r)
+void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
+			  struct page **pages)
 {
+	resource_size_t npages, i;
 	u32 __iomem *gtt_slot;
 	u32 pte;
-	int i;
 
-	if (r->pages == NULL) {
-		WARN_ON(1);
-		return -EINVAL;
-	}
-
-	WARN_ON(r->stolen);	/* refcount these maybe ? */
+	/* Write our page entries into the GTT itself */
 
-	gtt_slot = psb_gtt_entry(dev, r);
+	npages = resource_size(res) >> PAGE_SHIFT;
+	gtt_slot = psb_gtt_entry(pdev, res);
 
-	/* Write our page entries into the GTT itself */
-	for (i = 0; i < r->npage; i++) {
-		pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
-				       PSB_MMU_CACHED_MEMORY);
-		iowrite32(pte, gtt_slot++);
+	for (i = 0; i < npages; ++i, ++gtt_slot) {
+		pte = psb_gtt_mask_pte(page_to_pfn(pages[i]), PSB_MMU_CACHED_MEMORY);
+		iowrite32(pte, gtt_slot);
 	}
 
 	/* Make sure all the entries are set before we return */
 	ioread32(gtt_slot - 1);
-
-	return 0;
 }
 
-/**
- *	psb_gtt_remove	-	remove an object from the GTT
- *	@dev: our DRM device
- *	@r: our GTT range
- *
- *	Remove a preallocated GTT range from the GTT. Overwrite all the
- *	page table entries with the dummy page. This is protected via the gtt
- *	mutex which the caller must hold.
- */
-void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r)
+void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	resource_size_t npages, i;
 	u32 __iomem *gtt_slot;
 	u32 pte;
-	int i;
 
-	WARN_ON(r->stolen);
+	/* Install scratch page for the resource */
+
+	pte = psb_gtt_mask_pte(page_to_pfn(pdev->scratch_page), PSB_MMU_CACHED_MEMORY);
 
-	gtt_slot = psb_gtt_entry(dev, r);
-	pte = psb_gtt_mask_pte(page_to_pfn(dev_priv->scratch_page),
-			       PSB_MMU_CACHED_MEMORY);
+	npages = resource_size(res) >> PAGE_SHIFT;
+	gtt_slot = psb_gtt_entry(pdev, res);
 
-	for (i = 0; i < r->npage; i++)
-		iowrite32(pte, gtt_slot++);
+	for (i = 0; i < npages; ++i, ++gtt_slot)
+		iowrite32(pte, gtt_slot);
+
+	/* Make sure all the entries are set before we return */
 	ioread32(gtt_slot - 1);
 }
 
@@ -334,9 +300,14 @@ int psb_gtt_restore(struct drm_device *dev)
 	psb_gtt_init(dev, 1);
 
 	while (r != NULL) {
+		/*
+		 * TODO: GTT restoration needs a refactoring, so that we don't have to touch
+		 *       struct gtt_range here. The type represents a GEM object and is not
+		 *       related to the GTT itself.
+		 */
 		range = container_of(r, struct gtt_range, resource);
 		if (range->pages) {
-			psb_gtt_insert(dev, range);
+			psb_gtt_insert_pages(dev_priv, &range->resource, range->pages);
 			size += range->resource.end - range->resource.start;
 			restored++;
 		}
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 7af71617e0c5..6a28e24a18b7 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -49,7 +49,8 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
 			      const char *name, resource_size_t size, resource_size_t align,
 			      bool stolen, u32 offset[static 1]);
 
-int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r);
-void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
+void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
+			  struct page **pages);
+void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res);
 
 #endif
-- 
2.33.0

