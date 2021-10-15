Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1542EC9B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609E26ECF9;
	Fri, 15 Oct 2021 08:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9454A6E8E1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:40:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AB8F21A69;
 Fri, 15 Oct 2021 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634287256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCd2Bn9nakKCewehii9WIMsbfMz5NC2X31H+oLBDRWY=;
 b=dpA75raB68zFsbZuM9HAMQlYaepBM49XdYJJm2YoyUgR8yaqMcDVfkLFW8nX7ZrY0P9/Zr
 EnVaXufwu6g96ezWjOGHZgwNL7h7sH0C8q0/7l9OfJ0QrZz1FGqnoEV66WJCUoNE0FefNi
 SEpMBWT3UOYN8F20GzdtF7NfuUZ4xRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634287256;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCd2Bn9nakKCewehii9WIMsbfMz5NC2X31H+oLBDRWY=;
 b=vLzgnRcYWBUqkF7CpFF5SYFIM36eDrEmPAri09yosZ1+aDo330EAjyWFdRKhNLZBFsZpnx
 k4c/+JBCvgNR9yCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCED913EE2;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yG8aNZc+aWHBGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 08:40:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/10] drm/gma500: Inline psb_gtt_attach_pages() and
 psb_gtt_detach_pages()
Date: Fri, 15 Oct 2021 10:40:49 +0200
Message-Id: <20211015084053.13708-7-tzimmermann@suse.de>
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

psb_gtt_attach_pages() are not GTT functions but deal with the GEM
object's SHMEM pages. The only callers of psb_gtt_attach_pages() and
psb_gtt_detach_pages() are the GEM pin helpers. Inline the calls and
cleanup the resulting code.

v2:
	* unlock gtt_mutex in pin-error handling (Patrik)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c | 94 ++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 1905468924ca..37b61334ade2 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -19,63 +19,48 @@
 #include "gem.h"
 #include "psb_drv.h"
 
-/*
- * Pin and build an in-kernel list of the pages that back our GEM object.
- * While we hold this the pages cannot be swapped out. This is protected
- * via the gtt mutex which the caller must hold.
- */
-static int psb_gtt_attach_pages(struct gtt_range *gt)
-{
-	struct page **pages;
-
-	WARN_ON(gt->pages);
-
-	pages = drm_gem_get_pages(&gt->gem);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
-
-	gt->npage = gt->gem.size / PAGE_SIZE;
-	gt->pages = pages;
-
-	return 0;
-}
-
-/*
- * Undo the effect of psb_gtt_attach_pages. At this point the pages
- * must have been removed from the GTT as they could now be paged out
- * and move bus address. This is protected via the gtt mutex which the
- * caller must hold.
- */
-static void psb_gtt_detach_pages(struct gtt_range *gt)
-{
-	drm_gem_put_pages(&gt->gem, gt->pages, true, false);
-	gt->pages = NULL;
-}
-
 int psb_gem_pin(struct gtt_range *gt)
 {
 	int ret = 0;
 	struct drm_device *dev = gt->gem.dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
+	struct page **pages;
+	unsigned int npages;
 
 	mutex_lock(&dev_priv->gtt_mutex);
 
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
+	if (gt->in_gart || gt->stolen)
+		goto out; /* already mapped */
+
+	pages = drm_gem_get_pages(&gt->gem);
+	if (IS_ERR(pages)) {
+		ret = PTR_ERR(pages);
+		goto err_mutex_unlock;
 	}
-	gt->in_gart++;
+
+	npages = gt->gem.size / PAGE_SIZE;
+
+	ret = psb_gtt_insert(dev, gt, 0);
+	if (ret)
+		goto err_drm_gem_put_pages;
+
+	psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
+			     (gpu_base + gt->offset), npages, 0, 0,
+			     PSB_MMU_CACHED_MEMORY);
+
+	gt->npage = npages;
+	gt->pages = pages;
+
 out:
+	++gt->in_gart;
+	mutex_unlock(&dev_priv->gtt_mutex);
+
+	return 0;
+
+err_drm_gem_put_pages:
+	drm_gem_put_pages(&gt->gem, pages, true, false);
+err_mutex_unlock:
 	mutex_unlock(&dev_priv->gtt_mutex);
 	return ret;
 }
@@ -90,14 +75,19 @@ void psb_gem_unpin(struct gtt_range *gt)
 
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

