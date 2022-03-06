Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01014CEDC2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9277E10E665;
	Sun,  6 Mar 2022 20:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382010E661
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 659BF1F396;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoiuKHs2PxNewC6Y3m4brdPLeGgMrShPgoOV7l8c/mw=;
 b=ExcAYOA6Y83pVr4LYPMXtvoHAH6ycKxaoGu44VOYcxK4WTkELEZ8jqqyFD8AbmuEsP0vfs
 J4C5PlG/fkm0R7OUmBveBszOmIrP33lN7ucL3irt75j8cQjZHfBsmnvl4ABoDnObo3rS2z
 97YUPwAvL41UqgNEDmNJNyeARGbWkTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoiuKHs2PxNewC6Y3m4brdPLeGgMrShPgoOV7l8c/mw=;
 b=sN8o+8esYyXeOZ75Y9jQliu0BjMjjFWNakivauaAa++r24nhDYWYzQWIDDjX3OAsgOQ3qx
 3dOH1ZrxEJm2iKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44D8A134CD;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KHnlD0UbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 04/10] drm/gma500: Remove struct psb_gtt.sem sempahore
Date: Sun,  6 Mar 2022 21:36:13 +0100
Message-Id: <20220306203619.22624-5-tzimmermann@suse.de>
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

The semaphore at struct psb_mmu_driver.sem protects access to the MMU
fields. Additional locking with struct psb_gtt.sem is unnecessary. Remove
the field and related code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c     | 7 -------
 drivers/gpu/drm/gma500/gtt.h     | 1 -
 drivers/gpu/drm/gma500/psb_drv.c | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 4202e88e5f84..c7b7cb1f2d13 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -125,12 +125,6 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 	mutex_unlock(&pdev->gtt_mutex);
 }
 
-static void psb_gtt_alloc(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	init_rwsem(&dev_priv->gtt.sem);
-}
-
 void psb_gtt_takedown(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -166,7 +160,6 @@ int psb_gtt_init(struct drm_device *dev, int resume)
 	if (!resume) {
 		mutex_init(&dev_priv->gtt_mutex);
 		mutex_init(&dev_priv->mmap_mutex);
-		psb_gtt_alloc(dev);
 	}
 
 	pg = &dev_priv->gtt;
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index ff1dcdd1ff52..31500533ac45 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -22,7 +22,6 @@ struct psb_gtt {
 	unsigned gatt_pages;
 	unsigned long stolen_size;
 	unsigned long vram_stolen_size;
-	struct rw_semaphore sem;
 };
 
 /* Exported functions */
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index eeb681be9c95..7227a8e44d23 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -184,13 +184,11 @@ static void psb_driver_unload(struct drm_device *dev)
 	if (dev_priv->mmu) {
 		struct psb_gtt *pg = &dev_priv->gtt;
 
-		down_read(&pg->sem);
 		psb_mmu_remove_pfn_sequence(
 			psb_mmu_get_default_pd
 			(dev_priv->mmu),
 			pg->mmu_gatt_start,
 			dev_priv->vram_stolen_size >> PAGE_SHIFT);
-		up_read(&pg->sem);
 		psb_mmu_driver_takedown(dev_priv->mmu);
 		dev_priv->mmu = NULL;
 	}
@@ -345,12 +343,10 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 		return ret;
 
 	/* Add stolen memory to SGX MMU */
-	down_read(&pg->sem);
 	ret = psb_mmu_insert_pfn_sequence(psb_mmu_get_default_pd(dev_priv->mmu),
 					  dev_priv->stolen_base >> PAGE_SHIFT,
 					  pg->gatt_start,
 					  pg->stolen_size >> PAGE_SHIFT, 0);
-	up_read(&pg->sem);
 
 	psb_mmu_set_pd_context(psb_mmu_get_default_pd(dev_priv->mmu), 0);
 	psb_mmu_set_pd_context(dev_priv->pf_pd, 1);
-- 
2.35.1

