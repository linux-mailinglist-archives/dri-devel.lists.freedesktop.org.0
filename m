Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6CB4D21FF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628EF10E4F2;
	Tue,  8 Mar 2022 19:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCF810E351
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 763F61F39A;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiqYTlwGNJ8WyMO5Xu1sKGqHw7A013pSnTDjI796LtE=;
 b=x5PocmVcua9XLabsfaNX/Ratma47HJyFQ+GOa6mHMvTPm3PwuBf/AESIsqo4rZIpDNdRYb
 TI7F/w9hzUfdX7Jb8t4xuZMUG5pVoGvwwnDzMrVuTcP/4XXhLuJKyYYTST/eO63XfwZkP4
 GtkCO2tY4oXeEljVE8PLCXQ9uiUJv0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiqYTlwGNJ8WyMO5Xu1sKGqHw7A013pSnTDjI796LtE=;
 b=FkhfEkn1RRLYhUOY9G+ZMi/Fp5IaXM/eLehE0FL199rfr6Oe84HppP61Nol8YuOITw3NOc
 5LKXhvScF1A6hGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5388713CFB;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WM9qE/mzJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 08/12] drm/gma500: Split GTT init/resume/fini into GTT and
 GEM functions
Date: Tue,  8 Mar 2022 20:52:18 +0100
Message-Id: <20220308195222.13471-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308195222.13471-1-tzimmermann@suse.de>
References: <20220308195222.13471-1-tzimmermann@suse.de>
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

The GTT init, fini and resume functions contain both, GTT and GEM,
code. Split each into a separate GTT and a GEM function. The GEM
code is responsible for mmap_mutex and the stolen memory area. The
rest of the functionality is left in GTT functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gtt.c     | 118 ++++++++++++++++++++-----------
 drivers/gpu/drm/gma500/gtt.h     |   3 +
 drivers/gpu/drm/gma500/psb_drv.c |   4 ++
 3 files changed, 83 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 99c644a5c5cb..0e99774c7e59 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -125,19 +125,26 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 	mutex_unlock(&pdev->gtt_mutex);
 }
 
+void psb_gem_mm_fini(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
+	iounmap(dev_priv->vram_addr);
+
+	mutex_destroy(&dev_priv->mmap_mutex);
+}
+
 void psb_gtt_fini(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	iounmap(dev_priv->vram_addr);
 	iounmap(dev_priv->gtt_map);
 
 	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
 	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
 	(void)PSB_RVDC32(PSB_PGETBL_CTL);
 
-	mutex_destroy(&dev_priv->mmap_mutex);
 	mutex_destroy(&dev_priv->gtt_mutex);
 }
 
@@ -211,12 +218,10 @@ int psb_gtt_init(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned gtt_pages;
-	unsigned long stolen_size, vram_stolen_size;
 	struct psb_gtt *pg;
 	int ret = 0;
 
 	mutex_init(&dev_priv->gtt_mutex);
-	mutex_init(&dev_priv->mmap_mutex);
 
 	pg = &dev_priv->gtt;
 
@@ -274,22 +279,8 @@ int psb_gtt_init(struct drm_device *dev)
 		dev_priv->gtt_mem = &fudge;
 	}
 
-	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
-	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base
-								- PAGE_SIZE;
-
-	stolen_size = vram_stolen_size;
-
-	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
-			dev_priv->stolen_base, vram_stolen_size / 1024);
-
 	pg->gtt_pages = gtt_pages;
-	pg->stolen_size = stolen_size;
-	dev_priv->vram_stolen_size = vram_stolen_size;
 
-	/*
-	 *	Map the GTT and the stolen memory area
-	 */
 	dev_priv->gtt_map = ioremap(pg->gtt_phys_start, gtt_pages << PAGE_SHIFT);
 	if (!dev_priv->gtt_map) {
 		dev_err(dev->dev, "Failure to map gtt.\n");
@@ -297,26 +288,54 @@ int psb_gtt_init(struct drm_device *dev)
 		goto err_gtt_disable;
 	}
 
+	psb_gtt_clear(dev_priv);
+
+	return 0;
+
+err_gtt_disable:
+	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
+	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
+	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+	mutex_destroy(&dev_priv->gtt_mutex);
+	return ret;
+}
+
+int psb_gem_mm_init(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	unsigned long stolen_size, vram_stolen_size;
+	struct psb_gtt *pg;
+	int ret;
+
+	mutex_init(&dev_priv->mmap_mutex);
+
+	pg = &dev_priv->gtt;
+
+	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
+	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
+
+	stolen_size = vram_stolen_size;
+
+	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
+		dev_priv->stolen_base, vram_stolen_size / 1024);
+
+	pg->stolen_size = stolen_size;
+	dev_priv->vram_stolen_size = vram_stolen_size;
+
 	dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
 	if (!dev_priv->vram_addr) {
 		dev_err(dev->dev, "Failure to map stolen base.\n");
 		ret = -ENOMEM;
-		goto err_iounmap;
+		goto err_mutex_destroy;
 	}
 
-	psb_gtt_clear(dev_priv);
 	psb_gtt_populate_stolen(dev_priv);
 
 	return 0;
 
-err_iounmap:
-	iounmap(dev_priv->gtt_map);
-err_gtt_disable:
-	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
-	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
-	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+err_mutex_destroy:
 	mutex_destroy(&dev_priv->mmap_mutex);
-	mutex_destroy(&dev_priv->gtt_mutex);
 	return ret;
 }
 
@@ -325,9 +344,8 @@ static int psb_gtt_resume(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	unsigned int gtt_pages;
-	unsigned long stolen_size, vram_stolen_size;
 	struct psb_gtt *pg;
-	int ret = 0;
+	int ret;
 
 	pg = &dev_priv->gtt;
 
@@ -387,27 +405,15 @@ static int psb_gtt_resume(struct drm_device *dev)
 		dev_priv->gtt_mem = &fudge;
 	}
 
-	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
-	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
-	stolen_size = vram_stolen_size;
-
-	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
-			dev_priv->stolen_base, vram_stolen_size / 1024);
-
-	if ((gtt_pages != pg->gtt_pages) && (stolen_size != pg->stolen_size)) {
+	if (gtt_pages != pg->gtt_pages) {
 		dev_err(dev->dev, "GTT resume error.\n");
 		ret = -EINVAL;
 		goto err_gtt_disable;
 	}
 
 	pg->gtt_pages = gtt_pages;
-	pg->stolen_size = stolen_size;
-	dev_priv->vram_stolen_size = vram_stolen_size;
 
 	psb_gtt_clear(dev_priv);
-	psb_gtt_populate_stolen(dev_priv);
-
-	return 0;
 
 err_gtt_disable:
 	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
@@ -416,11 +422,39 @@ static int psb_gtt_resume(struct drm_device *dev)
 	return ret;
 }
 
+static int psb_gem_mm_resume(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	unsigned long stolen_size, vram_stolen_size;
+	struct psb_gtt *pg;
+
+	pg = &dev_priv->gtt;
+
+	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
+	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
+
+	stolen_size = vram_stolen_size;
+
+	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n", dev_priv->stolen_base,
+		vram_stolen_size / 1024);
+
+	if (stolen_size != pg->stolen_size) {
+		dev_err(dev->dev, "GTT resume error.\n");
+		return -EINVAL;
+	}
+
+	psb_gtt_populate_stolen(dev_priv);
+
+	return 0;
+}
+
 int psb_gtt_restore(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
 	psb_gtt_resume(dev);
+	psb_gem_mm_resume(dev);
 
 	psb_gtt_populate_resources(dev_priv);
 
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 5839d5d06adc..45e1926dfce1 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -37,4 +37,7 @@ void psb_gtt_insert_pages(struct drm_psb_private *pdev, const struct resource *r
 			  struct page **pages);
 void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *res);
 
+int psb_gem_mm_init(struct drm_device *dev);
+void psb_gem_mm_fini(struct drm_device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 41be6e1ac7f9..6547967b51e1 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -192,6 +192,7 @@ static void psb_driver_unload(struct drm_device *dev)
 		psb_mmu_driver_takedown(dev_priv->mmu);
 		dev_priv->mmu = NULL;
 	}
+	psb_gem_mm_fini(dev);
 	psb_gtt_fini(dev);
 	if (dev_priv->scratch_page) {
 		set_pages_wb(dev_priv->scratch_page, 1);
@@ -325,6 +326,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	set_pages_uc(dev_priv->scratch_page, 1);
 
 	ret = psb_gtt_init(dev);
+	if (ret)
+		goto out_err;
+	ret = psb_gem_mm_init(dev);
 	if (ret)
 		goto out_err;
 
-- 
2.35.1

