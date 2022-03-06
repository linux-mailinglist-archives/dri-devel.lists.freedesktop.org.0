Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D854CEDC9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E3D10E66E;
	Sun,  6 Mar 2022 20:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24810E665
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3C4121115;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJXf7TkVM20PWGYUki30b7QHxVZo9239vcoA+lPcd8E=;
 b=DnTH/vWY9L8YeYaYTbD7DVZN534RUEmlDvHHdaQWw8s5ZpOR+KKQghqKfe7h+KfJneSKrv
 6hbwt33smpBvvv6OjFyal20xMjow1KeeI4JO1BtWqojMocxVY10e5Ng01Vvapo6uIOfzFG
 2sLbOmpWD0KxrSxcjoGX/DLijlaUnb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJXf7TkVM20PWGYUki30b7QHxVZo9239vcoA+lPcd8E=;
 b=DnqHlC9It2OA/AKIXJ2Qp+NdBDeuKaIg8BhvYB17RzNmPCMeWtB/qBRVGnhck2QCtL9eIC
 jYU22NotfXh7cmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7D89134CD;
 Sun,  6 Mar 2022 20:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +Fn/K0UbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 07/10] drm/gma500: Cleanup GTT uninit and error handling
Date: Sun,  6 Mar 2022 21:36:16 +0100
Message-Id: <20220306203619.22624-8-tzimmermann@suse.de>
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

Replace psb_gtt_takedown() with finalizer function that is only called
for unloading the driver. Use roll-back pattern for error handling in
psb_gtt_init() and _resume(). Also fixes a bug where vmap_addr was never
unmapped.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c     | 49 ++++++++++++++++----------------
 drivers/gpu/drm/gma500/gtt.h     |  2 +-
 drivers/gpu/drm/gma500/psb_drv.c |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h |  1 -
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 43ad3ec38c80..99c644a5c5cb 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -125,23 +125,20 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 	mutex_unlock(&pdev->gtt_mutex);
 }
 
-void psb_gtt_takedown(struct drm_device *dev)
+void psb_gtt_fini(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	if (dev_priv->gtt_map) {
-		iounmap(dev_priv->gtt_map);
-		dev_priv->gtt_map = NULL;
-	}
-	if (dev_priv->gtt_initialized) {
-		pci_write_config_word(pdev, PSB_GMCH_CTRL,
-				      dev_priv->gmch_ctrl);
-		PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
-		(void) PSB_RVDC32(PSB_PGETBL_CTL);
-	}
-	if (dev_priv->vram_addr)
-		iounmap(dev_priv->gtt_map);
+	iounmap(dev_priv->vram_addr);
+	iounmap(dev_priv->gtt_map);
+
+	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
+	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
+	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+
+	mutex_destroy(&dev_priv->mmap_mutex);
+	mutex_destroy(&dev_priv->gtt_mutex);
 }
 
 /* Clear GTT. Use a scratch page to avoid accidents or scribbles. */
@@ -233,8 +230,6 @@ int psb_gtt_init(struct drm_device *dev)
 	(void) PSB_RVDC32(PSB_PGETBL_CTL);
 
 	/* The root resource we allocate address space from */
-	dev_priv->gtt_initialized = 1;
-
 	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
 
 	/*
@@ -299,14 +294,14 @@ int psb_gtt_init(struct drm_device *dev)
 	if (!dev_priv->gtt_map) {
 		dev_err(dev->dev, "Failure to map gtt.\n");
 		ret = -ENOMEM;
-		goto out_err;
+		goto err_gtt_disable;
 	}
 
 	dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
 	if (!dev_priv->vram_addr) {
 		dev_err(dev->dev, "Failure to map stolen base.\n");
 		ret = -ENOMEM;
-		goto out_err;
+		goto err_iounmap;
 	}
 
 	psb_gtt_clear(dev_priv);
@@ -314,8 +309,14 @@ int psb_gtt_init(struct drm_device *dev)
 
 	return 0;
 
-out_err:
-	psb_gtt_takedown(dev);
+err_iounmap:
+	iounmap(dev_priv->gtt_map);
+err_gtt_disable:
+	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
+	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
+	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+	mutex_destroy(&dev_priv->mmap_mutex);
+	mutex_destroy(&dev_priv->gtt_mutex);
 	return ret;
 }
 
@@ -340,8 +341,6 @@ static int psb_gtt_resume(struct drm_device *dev)
 	(void) PSB_RVDC32(PSB_PGETBL_CTL);
 
 	/* The root resource we allocate address space from */
-	dev_priv->gtt_initialized = 1;
-
 	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
 
 	/*
@@ -398,7 +397,7 @@ static int psb_gtt_resume(struct drm_device *dev)
 	if ((gtt_pages != pg->gtt_pages) && (stolen_size != pg->stolen_size)) {
 		dev_err(dev->dev, "GTT resume error.\n");
 		ret = -EINVAL;
-		goto out_err;
+		goto err_gtt_disable;
 	}
 
 	pg->gtt_pages = gtt_pages;
@@ -410,8 +409,10 @@ static int psb_gtt_resume(struct drm_device *dev)
 
 	return 0;
 
-out_err:
-	psb_gtt_takedown(dev);
+err_gtt_disable:
+	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
+	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
+	(void)PSB_RVDC32(PSB_PGETBL_CTL);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index cb270ea40794..5839d5d06adc 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -26,7 +26,7 @@ struct psb_gtt {
 
 /* Exported functions */
 int psb_gtt_init(struct drm_device *dev);
-extern void psb_gtt_takedown(struct drm_device *dev);
+void psb_gtt_fini(struct drm_device *dev);
 extern int psb_gtt_restore(struct drm_device *dev);
 
 int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2891a3dc8d2e..41be6e1ac7f9 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -192,7 +192,7 @@ static void psb_driver_unload(struct drm_device *dev)
 		psb_mmu_driver_takedown(dev_priv->mmu);
 		dev_priv->mmu = NULL;
 	}
-	psb_gtt_takedown(dev);
+	psb_gtt_fini(dev);
 	if (dev_priv->scratch_page) {
 		set_pages_wb(dev_priv->scratch_page, 1);
 		__free_page(dev_priv->scratch_page);
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 0439b10d3db5..553d03190ce1 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -408,7 +408,6 @@ struct drm_psb_private {
 	uint32_t stolen_base;
 	u8 __iomem *vram_addr;
 	unsigned long vram_stolen_size;
-	int gtt_initialized;
 	u16 gmch_ctrl;		/* Saved GTT setup */
 	u32 pge_ctl;
 
-- 
2.35.1

