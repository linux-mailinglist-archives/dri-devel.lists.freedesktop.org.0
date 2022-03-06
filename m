Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496A4CEDC4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F8C10E658;
	Sun,  6 Mar 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7042610E659
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB7911F395;
 Sun,  6 Mar 2022 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFJ9pdh4UE7Dc54yhzfMmmo9+htYnYRI/BuH+0wQ2n0=;
 b=Fb1aROgs6vLy/5t0L1kWgFwmFbHpmVVVe5FAzcpntRXXYTqdiHnY2rxytaW88Ox+kS29FO
 gXCdz5s44wyqd7TyOQafR/IiB0OszOuXPRrVH76HYsLzf9yG5Q4pfzX2/iJjcycFskg96f
 JVfXuT/EJiCbrjvo6Z8CKzSedo3eFKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFJ9pdh4UE7Dc54yhzfMmmo9+htYnYRI/BuH+0wQ2n0=;
 b=I2kDePZ52Vy9CZkOvZaMm64jSHkuVMfAU2sIuioGya8aNUqptnOtgTa6VNyp2sFMnryftY
 EHVUd2YH8RY3FKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA8231352A;
 Sun,  6 Mar 2022 20:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iL2OMEQbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 01/10] drm/gma500: Remove struct psb_gem_object.npage
Date: Sun,  6 Mar 2022 21:36:10 +0100
Message-Id: <20220306203619.22624-2-tzimmermann@suse.de>
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

Calculate the number of pages in the BO's backing storage from
the size. Remove the npage field.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c         | 9 +++++----
 drivers/gpu/drm/gma500/gem.h         | 1 -
 drivers/gpu/drm/gma500/gma_display.c | 8 +++-----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 8d65af80bb08..fe7d242567c0 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -51,7 +51,6 @@ int psb_gem_pin(struct psb_gem_object *pobj)
 			     (gpu_base + pobj->offset), npages, 0, 0,
 			     PSB_MMU_CACHED_MEMORY);
 
-	pobj->npage = npages;
 	pobj->pages = pages;
 
 out:
@@ -71,6 +70,7 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 	struct drm_device *dev = obj->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
+	unsigned long npages;
 
 	mutex_lock(&dev_priv->gtt_mutex);
 
@@ -81,16 +81,17 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 	if (pobj->in_gart || pobj->stolen)
 		goto out;
 
+	npages = obj->size / PAGE_SIZE;
+
 	psb_mmu_remove_pages(psb_mmu_get_default_pd(dev_priv->mmu),
-			     (gpu_base + pobj->offset), pobj->npage, 0, 0);
+			     (gpu_base + pobj->offset), npages, 0, 0);
 	psb_gtt_remove_pages(dev_priv, &pobj->resource);
 
 	/* Reset caching flags */
-	set_pages_array_wb(pobj->pages, pobj->npage);
+	set_pages_array_wb(pobj->pages, npages);
 
 	drm_gem_put_pages(obj, pobj->pages, true, false);
 	pobj->pages = NULL;
-	pobj->npage = 0;
 
 out:
 	mutex_unlock(&dev_priv->gtt_mutex);
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 79cced40c87f..96ef864b4bf1 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -23,7 +23,6 @@ struct psb_gem_object {
 	bool stolen;			/* Backed from stolen RAM */
 	bool mmapping;			/* Is mmappable */
 	struct page **pages;		/* Backing pages if present */
-	int npage;			/* Number of backing pages */
 };
 
 static inline struct psb_gem_object *to_psb_gem_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 60ba7de59139..dd801404cf99 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -391,11 +391,9 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 			goto unref_cursor;
 		}
 
-		/* Prevent overflow */
-		if (pobj->npage > 4)
-			cursor_pages = 4;
-		else
-			cursor_pages = pobj->npage;
+		cursor_pages = obj->size / PAGE_SIZE;
+		if (cursor_pages > 4)
+			cursor_pages = 4; /* Prevent overflow */
 
 		/* Copy the cursor to cursor mem */
 		tmp_dst = dev_priv->vram_addr + cursor_pobj->offset;
-- 
2.35.1

