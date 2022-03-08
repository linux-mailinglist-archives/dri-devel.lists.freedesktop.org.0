Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3414D21FC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3810E4C0;
	Tue,  8 Mar 2022 19:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7FA10E4C0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E18A31F39D;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vQOOYp9EkEJgP7bO7NXKBvLbvVRAqNLNscVuLOxejo=;
 b=PdZASLRUmzwud98KFwE8u0KrrsWyOw98Qv7LRztyRfyBYl8QbruBOG5kasTK/eLI6AYnaz
 hOC/4QhzHnFd8Ecs08Es6cuAig3dxKd3ewX71lebhj/ZlWGRetnba031GdTh8J2VIiZGwe
 ub9cTN/dxO/ocHzlTU9Nl0j8hEB7Gs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vQOOYp9EkEJgP7bO7NXKBvLbvVRAqNLNscVuLOxejo=;
 b=QJqoeGUjqW+lD7h/hls5YVKCqqim54urjnvF3YOmuAPM45FwWOAjlhs9qUAePb9y4JMEVy
 kOjewtkh8PfhOdBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C240113D4F;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QEGHLvmzJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 11/12] drm/gma500: Move GTT enable and disable code into
 helpers
Date: Tue,  8 Mar 2022 20:52:21 +0100
Message-Id: <20220308195222.13471-12-tzimmermann@suse.de>
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

Move the code for enabling and disabling the GTT into helpers and call
the functions in psb_gtt_init(), psb_gtt_fini() and psb_gtt_resume().
Removes code duplication.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c | 81 ++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index b03feec64f01..83d9a9f7c73c 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -125,17 +125,44 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
 	mutex_unlock(&pdev->gtt_mutex);
 }
 
-void psb_gtt_fini(struct drm_device *dev)
+static int psb_gtt_enable(struct drm_psb_private *dev_priv)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_device *dev = &dev_priv->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	int ret;
 
-	iounmap(dev_priv->gtt_map);
+	ret = pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
+	if (ret)
+		return pcibios_err_to_errno(ret);
+	ret = pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
+	if (ret)
+		return pcibios_err_to_errno(ret);
+
+	dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
+	PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
+
+	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+
+	return 0;
+}
+
+static void psb_gtt_disable(struct drm_psb_private *dev_priv)
+{
+	struct drm_device *dev = &dev_priv->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
 	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
+
 	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+}
 
+void psb_gtt_fini(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
+	iounmap(dev_priv->gtt_map);
+	psb_gtt_disable(dev_priv);
 	mutex_destroy(&dev_priv->gtt_mutex);
 }
 
@@ -159,22 +186,15 @@ int psb_gtt_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct psb_gtt *pg = &dev_priv->gtt;
 	unsigned gtt_pages;
-	struct psb_gtt *pg;
-	int ret = 0;
+	int ret;
 
 	mutex_init(&dev_priv->gtt_mutex);
 
-	pg = &dev_priv->gtt;
-
-	/* Enable the GTT */
-	pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
-	pci_write_config_word(pdev, PSB_GMCH_CTRL,
-			      dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
-
-	dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
-	PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
-	(void) PSB_RVDC32(PSB_PGETBL_CTL);
+	ret = psb_gtt_enable(dev_priv);
+	if (ret)
+		goto err_mutex_destroy;
 
 	/* The root resource we allocate address space from */
 	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
@@ -227,17 +247,16 @@ int psb_gtt_init(struct drm_device *dev)
 	if (!dev_priv->gtt_map) {
 		dev_err(dev->dev, "Failure to map gtt.\n");
 		ret = -ENOMEM;
-		goto err_gtt_disable;
+		goto err_psb_gtt_disable;
 	}
 
 	psb_gtt_clear(dev_priv);
 
 	return 0;
 
-err_gtt_disable:
-	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
-	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
-	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+err_psb_gtt_disable:
+	psb_gtt_disable(dev_priv);
+err_mutex_destroy:
 	mutex_destroy(&dev_priv->gtt_mutex);
 	return ret;
 }
@@ -246,20 +265,14 @@ int psb_gtt_resume(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct psb_gtt *pg = &dev_priv->gtt;
 	unsigned int gtt_pages;
-	struct psb_gtt *pg;
 	int ret;
 
-	pg = &dev_priv->gtt;
-
 	/* Enable the GTT */
-	pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
-	pci_write_config_word(pdev, PSB_GMCH_CTRL,
-			      dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
-
-	dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
-	PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
-	(void) PSB_RVDC32(PSB_PGETBL_CTL);
+	ret = psb_gtt_enable(dev_priv);
+	if (ret)
+		return ret;
 
 	/* The root resource we allocate address space from */
 	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
@@ -311,16 +324,14 @@ int psb_gtt_resume(struct drm_device *dev)
 	if (gtt_pages != pg->gtt_pages) {
 		dev_err(dev->dev, "GTT resume error.\n");
 		ret = -EINVAL;
-		goto err_gtt_disable;
+		goto err_psb_gtt_disable;
 	}
 
 	pg->gtt_pages = gtt_pages;
 
 	psb_gtt_clear(dev_priv);
 
-err_gtt_disable:
-	pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
-	PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
-	(void)PSB_RVDC32(PSB_PGETBL_CTL);
+err_psb_gtt_disable:
+	psb_gtt_disable(dev_priv);
 	return ret;
 }
-- 
2.35.1

