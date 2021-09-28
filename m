Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F641AAE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B966E885;
	Tue, 28 Sep 2021 08:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B389DC2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38418201E1;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+OSUHlpinqBJEk02Sdok6CHx3LMP0aN3ADCR6xKNaw=;
 b=Fy4NPkuBF2DNLmrAgSXrS5F/G2X6bjMV/e3NXYn4r6Zdi8nZf1sHnhnkrkdoHh7rX1dQNI
 Gofjfm5edwVIjKP/PBGrN8xtQqkNkfNdS17iPBfUwTcdlUn0XjZt4PPNeQnZxlb3LQH5QG
 JDVST0RIdb6Mag2b++Zh26e44ampUWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+OSUHlpinqBJEk02Sdok6CHx3LMP0aN3ADCR6xKNaw=;
 b=TMKign/5UGbXGAhLYmfnQMafT5Q0be7EIfidozeiJJrTskisIvJsIL/tN9b8FCQt53sg1w
 Ib/1j6AxxKrf9CBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E9BC13B94;
 Tue, 28 Sep 2021 08:44:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UMGbAgHWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/10] drm/gma500: Inline psb_gtt_attach_pages() and
 psb_gtt_detach_pages()
Date: Tue, 28 Sep 2021 10:44:42 +0200
Message-Id: <20210928084446.22580-7-tzimmermann@suse.de>
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

psb_gtt_attach_pages() are not GTT functions but deal with the GEM
object's SHMEM pages. The only callers of psb_gtt_attach_pages() and
psb_gtt_detach_pages() are the GEM pin helpers. Inline the calls and
cleanup the resulting code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 75 +++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 369910d0091e..a48d7d5ed026 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -19,53 +19,45 @@
 #include "gem.h"
 #include "psb_drv.h"
 
-static int psb_gtt_attach_pages(struct gtt_range *gt)
+int psb_gem_pin(struct gtt_range *gt)
 {
+	int ret = 0;
+	struct drm_device *dev = gt->gem.dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	u32 gpu_base = dev_priv->gtt.gatt_start;
 	struct page **pages;
+	unsigned int npages;
 
-	WARN_ON(gt->pages);
+	mutex_lock(&dev_priv->gtt_mutex);
+
+	if (gt->in_gart || gt->stolen)
+		goto out; /* already mapped */
 
 	pages = drm_gem_get_pages(&gt->gem);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	gt->npage = gt->gem.size / PAGE_SIZE;
-	gt->pages = pages;
-
-	return 0;
-}
+	npages = gt->gem.size / PAGE_SIZE;
 
-static void psb_gtt_detach_pages(struct gtt_range *gt)
-{
-	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
-	gt->pages = NULL;
-}
+	ret = psb_gtt_insert(dev, gt, 0);
+	if (ret)
+		goto err_drm_gem_put_pages;
 
-int psb_gem_pin(struct gtt_range *gt)
-{
-	int ret = 0;
-	struct drm_device *dev = gt->gem.dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 gpu_base = dev_priv->gtt.gatt_start;
+	psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
+			     (gpu_base + gt->offset), npages, 0, 0,
+			     PSB_MMU_CACHED_MEMORY);
 
-	mutex_lock(&dev_priv->gtt_mutex);
+	gt->npage = npages;
+	gt->pages = pages;
 
-	if (gt->in_gart == 0 && gt->stolen == 0) {
-		ret = psb_gtt_attach_pages(gt);
-		if (ret < 0)
-			goto out;
-		ret = psb_gtt_insert(dev, gt, 0);
-		if (ret < 0) {
-			psb_gtt_detach_pages(gt);
-			goto out;
-		}
-		psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu),
-				     gt->pages, (gpu_base + gt->offset),
-				     gt->npage, 0, 0, PSB_MMU_CACHED_MEMORY);
-	}
-	gt->in_gart++;
 out:
+	++gt->in_gart;
 	mutex_unlock(&dev_priv->gtt_mutex);
+
+	return 0;
+
+err_drm_gem_put_pages:
+	drm_gem_put_pages(&gt->gem, pages, true, false);
 	return ret;
 }
 
@@ -79,14 +71,19 @@ void psb_gem_unpin(struct gtt_range *gt)
 
 	WARN_ON(!gt->in_gart);
 
-	gt->in_gart--;
-	if (gt->in_gart == 0 && gt->stolen == 0) {
-		psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
+	--gt->in_gart;
+
+	if (gt->in_gart || gt->stolen)
+		goto out;
+
+	psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
 				     (gpu_base + gt->offset), gt->npage, 0, 0);
-		psb_gtt_remove(dev, gt);
-		psb_gtt_detach_pages(gt);
-	}
+	psb_gtt_remove(dev, gt);
 
+	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
+	gt->pages = NULL;
+
+out:
 	mutex_unlock(&dev_priv->gtt_mutex);
 }
 
-- 
2.33.0

