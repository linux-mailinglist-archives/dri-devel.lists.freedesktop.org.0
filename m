Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBA42ECA6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928E66ED00;
	Fri, 15 Oct 2021 08:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74F6E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:40:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5713121A6C;
 Fri, 15 Oct 2021 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634287256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJaf+mIgkMmzBPiM+7gAqVs433XVRQo6S9opah8IsNU=;
 b=F+1vB86h3fDGIvjo8qlUdrO2muQo3wr6SWHWfD34kWVvyQAJkCNZfssQosD310nRzujcA3
 QXRhdyrikLuHP/nPq9opUF9+8IFPI8hQXK0Qld0tEFWGifLX8TxuhURmtfTeRpz4j4mMD/
 cPyQ0BUO0DBEolg9BL73J0LTZPz3Vnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634287256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJaf+mIgkMmzBPiM+7gAqVs433XVRQo6S9opah8IsNU=;
 b=FPl74HuVOFCsjDCsNAP2r58JbK0zWFLj5LfzwwjBBN685UASFtViyX9Iwd9yr/2CHlgdmU
 4phxY3J02Td/4RCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 310AA13EE2;
 Fri, 15 Oct 2021 08:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kD4DC5g+aWHBGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 08:40:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/10] drm/gma500: Set page-caching flags in GEM pin/unpin
Date: Fri, 15 Oct 2021 10:40:51 +0200
Message-Id: <20211015084053.13708-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015084053.13708-1-tzimmermann@suse.de>
References: <20211015084053.13708-1-tzimmermann@suse.de>
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
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c |  9 ++++++++-
 drivers/gpu/drm/gma500/gtt.c | 17 ++---------------
 drivers/gpu/drm/gma500/gtt.h |  2 +-
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 425d183c76ca..def26d9ce89d 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -13,6 +13,8 @@
 
 #include <linux/pagemap.h>
 
+#include <asm/set_memory.h>
+
 #include <drm/drm.h>
 #include <drm/drm_vma_manager.h>
 
@@ -41,7 +43,9 @@ int psb_gem_pin(struct gtt_range *gt)
 
 	npages = gt->gem.size / PAGE_SIZE;
 
-	ret = psb_gtt_insert(dev, gt, 0);
+	set_pages_array_wc(pages, npages);
+
+	ret = psb_gtt_insert(dev, gt);
 	if (ret)
 		goto err_drm_gem_put_pages;
 
@@ -84,6 +88,9 @@ void psb_gem_unpin(struct gtt_range *gt)
 				     (gpu_base + gt->offset), gt->npage, 0, 0);
 	psb_gtt_remove(dev, gt);
 
+	/* Reset caching flags */
+	set_pages_array_wb(gt->pages, gt->npage);
+
 	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
 	gt->pages = NULL;
 
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index d00ca065f3d3..3a716a970a8a 100644
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
index 6f3808e29059..ddb4f3af93f7 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -49,7 +49,7 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
 			      const char *name, resource_size_t size, resource_size_t align,
 			      bool stolen, u32 *offset);
 
-int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
+int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r);
 void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
 
 #endif
-- 
2.33.0

