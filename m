Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF441AAE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC436E883;
	Tue, 28 Sep 2021 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ABB89D5F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BB8822323;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryy1NJ17W4XcYPTkIDR3uSK1QhQu8nNR0KsLkiaBWUw=;
 b=dvykxddTeTf86+FbEDFD0izDUjl0hPJkC+WfUSCCdyguv9MwcVnuKBALWJutJIhXQpnWhw
 GyKrjUP9g1qY09JjkGoQq93Kr+HGhkcGlWIm2IOj6BzhKpbSDY3M+HvZ86nt/48U+EUTfP
 FVe15F+i2XFwHyOdjmHAwimG0iMKHk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryy1NJ17W4XcYPTkIDR3uSK1QhQu8nNR0KsLkiaBWUw=;
 b=/aM6cHmmzXYeFLVWfPTv51uPp2PzZ0r72w6WTy11qC5dXdW1VajY5dMdQMDIJcQuFa/aR7
 49gGIyCFlL5qzYAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5ABE313B94;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mMw6FQHWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/10] drm/gma500: Set page-caching flags in GEM pin/unpin
Date: Tue, 28 Sep 2021 10:44:44 +0200
Message-Id: <20210928084446.22580-9-tzimmermann@suse.de>
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

Caching of the GEM object's backing pages are unrelated to GTT
management. Move the respective calls from GTT code to GEM code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c |  9 ++++++++-
 drivers/gpu/drm/gma500/gtt.c | 17 ++---------------
 drivers/gpu/drm/gma500/gtt.h |  2 +-
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 46209e10dcc2..a88d51a3aa2a 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -13,6 +13,8 @@
 
 #include <linux/pagemap.h>
 
+#include <asm/set_memory.h>
+
 #include <drm/drm.h>
 #include <drm/drm_vma_manager.h>
 
@@ -39,7 +41,9 @@ int psb_gem_pin(struct gtt_range *gt)
 
 	npages = gt->gem.size / PAGE_SIZE;
 
-	ret = psb_gtt_insert(dev, gt, 0);
+	set_pages_array_wc(pages, npages);
+
+	ret = psb_gtt_insert(dev, gt);
 	if (ret)
 		goto err_drm_gem_put_pages;
 
@@ -80,6 +84,9 @@ void psb_gem_unpin(struct gtt_range *gt)
 				     (gpu_base + gt->offset), gt->npage, 0, 0);
 	psb_gtt_remove(dev, gt);
 
+	/* Reset caching flags */
+	set_pages_array_wb(gt->pages, gt->npage);
+
 	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
 	gt->pages = NULL;
 
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 5d940fdbe6b8..244de618e612 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -7,10 +7,6 @@
  *	    Alan Cox <alan@linux.intel.com>
  */
 
-#include <linux/shmem_fs.h>
-
-#include <asm/set_memory.h>
-
 #include "psb_drv.h"
 
 
@@ -92,17 +88,15 @@ static u32 __iomem *psb_gtt_entry(struct drm_device *dev, struct gtt_range *r)
  *	psb_gtt_insert	-	put an object into the GTT
  *	@dev: our DRM device
  *	@r: our GTT range
- *	@resume: on resume
  *
  *	Take our preallocated GTT range and insert the GEM object into
  *	the GTT. This is protected via the gtt mutex which the caller
  *	must hold.
  */
-int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume)
+int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r)
 {
 	u32 __iomem *gtt_slot;
 	u32 pte;
-	struct page **pages;
 	int i;
 
 	if (r->pages == NULL) {
@@ -113,12 +107,6 @@ int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume)
 	WARN_ON(r->stolen);	/* refcount these maybe ? */
 
 	gtt_slot = psb_gtt_entry(dev, r);
-	pages = r->pages;
-
-	if (!resume) {
-		/* Make sure changes are visible to the GPU */
-		set_pages_array_wc(pages, r->npage);
-	}
 
 	/* Write our page entries into the GTT itself */
 	for (i = 0; i < r->npage; i++) {
@@ -158,7 +146,6 @@ void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r)
 	for (i = 0; i < r->npage; i++)
 		iowrite32(pte, gtt_slot++);
 	ioread32(gtt_slot - 1);
-	set_pages_array_wb(r->pages, r->npage);
 }
 
 static void psb_gtt_alloc(struct drm_device *dev)
@@ -349,7 +336,7 @@ int psb_gtt_restore(struct drm_device *dev)
 	while (r != NULL) {
 		range = container_of(r, struct gtt_range, resource);
 		if (range->pages) {
-			psb_gtt_insert(dev, range, 1);
+			psb_gtt_insert(dev, range);
 			size += range->resource.end - range->resource.start;
 			restored++;
 		}
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 459a03141e8b..7af71617e0c5 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -49,7 +49,7 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
 			      const char *name, resource_size_t size, resource_size_t align,
 			      bool stolen, u32 offset[static 1]);
 
-int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
+int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r);
 void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
 
 #endif
-- 
2.33.0

