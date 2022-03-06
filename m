Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABA4CEDC1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78B110E661;
	Sun,  6 Mar 2022 20:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4437110E651
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 41A3021111;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bg7rlNV+F8aTI5gE750WpqHerh0BTCxtUdUeoz0+q4=;
 b=ma+w4dK8AJBT5q3XNDzz7SKOikSvEBr+zDDGCGIUL5eTRRbY0MB6/7uDVzwVttvSjl21Y1
 FSY1FPnQWNv4ezzfXcgrHHHwWL4LZRHIrECg2kUmiPZPgThmOXM6ntnrsDSOHo3Od1HU2M
 8UhMm9ceMm1Nis21SEUycoF/QwcIecs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bg7rlNV+F8aTI5gE750WpqHerh0BTCxtUdUeoz0+q4=;
 b=XdRoAbd+2zrITUtLG5j3NTOvHPj8V5kmdOoNxY4z7ANmzMiDoR2BER+h8hbpvKKU+jrmUG
 og+lCLpfCoyW6JDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FBAA1352A;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WNrLBkUbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 03/10] drm/gma500: Move GTT locking into GTT helpers
Date: Sun,  6 Mar 2022 21:36:12 +0100
Message-Id: <20220306203619.22624-4-tzimmermann@suse.de>
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

Acquire the GTT mutex in psb_gtt_{insert,remove}_pages(). Remove
locking from callers. Also remove the GTT locking around the resume
code. Resume does not run concurrently with other GTT operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 11 ++---------
 drivers/gpu/drm/gma500/gtt.c | 24 +++++++++++-------------
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 026ce11f7460..2f44535f58e7 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -35,15 +35,13 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
 		return ret;
 
-	mutex_lock(&dev_priv->gtt_mutex);
-
 	if (pobj->in_gart || pobj->stolen)
 		goto out; /* already mapped */
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
-		goto err_mutex_unlock;
+		goto err_dma_resv_unlock;
 	}
 
 	npages = obj->size / PAGE_SIZE;
@@ -59,13 +57,11 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 
 out:
 	++pobj->in_gart;
-	mutex_unlock(&dev_priv->gtt_mutex);
 	dma_resv_unlock(obj->resv);
 
 	return 0;
 
-err_mutex_unlock:
-	mutex_unlock(&dev_priv->gtt_mutex);
+err_dma_resv_unlock:
 	dma_resv_unlock(obj->resv);
 	return ret;
 }
@@ -83,8 +79,6 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
 		return;
 
-	mutex_lock(&dev_priv->gtt_mutex);
-
 	WARN_ON(!pobj->in_gart);
 
 	--pobj->in_gart;
@@ -105,7 +99,6 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 	pobj->pages = NULL;
 
 out:
-	mutex_unlock(&dev_priv->gtt_mutex);
 	dma_resv_unlock(obj->resv);
 }
 
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 309ffe921bfd..4202e88e5f84 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -74,11 +74,7 @@ static u32 __iomem *psb_gtt_entry(struct drm_psb_private *pdev, const struct res
 	return pdev->gtt_map + (offset >> PAGE_SHIFT);
 }
 
-/*
- * Take our preallocated GTT range and insert the GEM object into
- * the GTT. This is protected via the gtt mutex which the caller
- * must hold.
- */
+/* Acquires GTT mutex internally. */
 void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *res,
 			  struct page **pages)
 {
@@ -86,6 +82,8 @@ void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *r
 	u32 __iomem *gtt_slot;
 	u32 pte;
 
+	mutex_lock(&pdev->gtt_mutex);
+
 	/* Write our page entries into the GTT itself */
 
 	npages = resource_size(res) >> PAGE_SHIFT;
@@ -98,19 +96,19 @@ void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *r
 
 	/* Make sure all the entries are set before we return */
 	ioread32(gtt_slot - 1);
+
+	mutex_unlock(&pdev->gtt_mutex);
 }
 
-/*
- * Remove a preallocated GTT range from the GTT. Overwrite all the
- * page table entries with the dummy page. This is protected via the gtt
- * mutex which the caller must hold.
- */
+/* Acquires GTT mutex internally. */
 void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res)
 {
 	resource_size_t npages, i;
 	u32 __iomem *gtt_slot;
 	u32 pte;
 
+	mutex_lock(&pdev->gtt_mutex);
+
 	/* Install scratch page for the resource */
 
 	pte = psb_gtt_mask_pte(page_to_pfn(pdev->scratch_page), PSB_MMU_CACHED_MEMORY);
@@ -123,6 +121,8 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 
 	/* Make sure all the entries are set before we return */
 	ioread32(gtt_slot - 1);
+
+	mutex_unlock(&pdev->gtt_mutex);
 }
 
 static void psb_gtt_alloc(struct drm_device *dev)
@@ -306,8 +306,6 @@ int psb_gtt_restore(struct drm_device *dev)
 	struct psb_gem_object *pobj;
 	unsigned int restored = 0, total = 0, size = 0;
 
-	/* On resume, the gtt_mutex is already initialized */
-	mutex_lock(&dev_priv->gtt_mutex);
 	psb_gtt_init(dev, 1);
 
 	while (r != NULL) {
@@ -325,7 +323,7 @@ int psb_gtt_restore(struct drm_device *dev)
 		r = r->sibling;
 		total++;
 	}
-	mutex_unlock(&dev_priv->gtt_mutex);
+
 	DRM_DEBUG_DRIVER("Restored %u of %u gtt ranges (%u KB)", restored,
 			 total, (size / 1024));
 
-- 
2.35.1

