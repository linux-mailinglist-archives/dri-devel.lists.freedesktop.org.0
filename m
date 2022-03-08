Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB14D2202
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BE310E4F9;
	Tue,  8 Mar 2022 19:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A389910E351
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 122C21F39E;
 Tue,  8 Mar 2022 19:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ur4G2eEW3Y3URYb715xgR1bM9avwKczfnCkTyEqxH/U=;
 b=ZD1OB+qDwz9/gTxV7ZqC+UJKWvQ9byufIPlM09I8mYab4q6bAkm5XFqhKeyyU14CU7V20V
 aZu9VbEppShAQX1FfwlmJtFvwnb6rlY03C2IRUW9gKSK8c3MpP9+BF3oHp87fhmiG002OC
 T9h9IcfdIGTAElHr5fxu6DzcRLTO1XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ur4G2eEW3Y3URYb715xgR1bM9avwKczfnCkTyEqxH/U=;
 b=JYijV0Bd1vYjjz3KSnqsKnSAiqcs7TN20U5LFg3w6RLDpfsIyqg2rOMeUGK/UbzqyA1LzH
 iDW5UE7uMTq5g5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E60E013CFB;
 Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MI+N/mzJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 12/12] drm/gma500: Move GTT memory-range setup into helper
Date: Tue,  8 Mar 2022 20:52:22 +0100
Message-Id: <20220308195222.13471-13-tzimmermann@suse.de>
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

Move the setup code for GTT/GATT memory ranges into a new helper and
call the function from psb_gtt_init() and psb_gtt_resume(). Removes
code duplication.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gtt.c | 153 +++++++++++++++--------------------
 1 file changed, 64 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 83d9a9f7c73c..379bc218aa6b 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -182,68 +182,91 @@ static void psb_gtt_clear(struct drm_psb_private *pdev)
 	(void)ioread32(pdev->gtt_map + i - 1);
 }
 
-int psb_gtt_init(struct drm_device *dev)
+static void psb_gtt_init_ranges(struct drm_psb_private *dev_priv)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_device *dev = &dev_priv->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct psb_gtt *pg = &dev_priv->gtt;
-	unsigned gtt_pages;
-	int ret;
-
-	mutex_init(&dev_priv->gtt_mutex);
-
-	ret = psb_gtt_enable(dev_priv);
-	if (ret)
-		goto err_mutex_destroy;
+	resource_size_t gtt_phys_start, mmu_gatt_start, gtt_start, gtt_pages,
+			gatt_start, gatt_pages;
+	struct resource *gtt_mem;
 
 	/* The root resource we allocate address space from */
-	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
+	gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
 
 	/*
-	 *	The video mmu has a hw bug when accessing 0x0D0000000.
-	 *	Make gatt start at 0x0e000,0000. This doesn't actually
-	 *	matter for us but may do if the video acceleration ever
-	 *	gets opened up.
+	 * The video MMU has a HW bug when accessing 0x0d0000000. Make
+	 * GATT start at 0x0e0000000. This doesn't actually matter for
+	 * us now, but maybe will if the video acceleration ever gets
+	 * opened up.
 	 */
-	pg->mmu_gatt_start = 0xE0000000;
+	mmu_gatt_start = 0xe0000000;
+
+	gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
+	gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE) >> PAGE_SHIFT;
 
-	pg->gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
-	gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE)
-								>> PAGE_SHIFT;
 	/* CDV doesn't report this. In which case the system has 64 gtt pages */
-	if (pg->gtt_start == 0 || gtt_pages == 0) {
+	if (!gtt_start || !gtt_pages) {
 		dev_dbg(dev->dev, "GTT PCI BAR not initialized.\n");
 		gtt_pages = 64;
-		pg->gtt_start = dev_priv->pge_ctl;
+		gtt_start = dev_priv->pge_ctl;
 	}
 
-	pg->gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
-	pg->gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE)
-								>> PAGE_SHIFT;
-	dev_priv->gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
+	gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
+	gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE) >> PAGE_SHIFT;
 
-	if (pg->gatt_pages == 0 || pg->gatt_start == 0) {
+	if (!gatt_pages || !gatt_start) {
 		static struct resource fudge;	/* Preferably peppermint */
-		/* This can occur on CDV systems. Fudge it in this case.
-		   We really don't care what imaginary space is being allocated
-		   at this point */
+
+		/*
+		 * This can occur on CDV systems. Fudge it in this case. We
+		 * really don't care what imaginary space is being allocated
+		 * at this point.
+		 */
 		dev_dbg(dev->dev, "GATT PCI BAR not initialized.\n");
-		pg->gatt_start = 0x40000000;
-		pg->gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
-		/* This is a little confusing but in fact the GTT is providing
-		   a view from the GPU into memory and not vice versa. As such
-		   this is really allocating space that is not the same as the
-		   CPU address space on CDV */
+		gatt_start = 0x40000000;
+		gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
+
+		/*
+		 * This is a little confusing but in fact the GTT is providing
+		 * a view from the GPU into memory and not vice versa. As such
+		 * this is really allocating space that is not the same as the
+		 * CPU address space on CDV.
+		 */
 		fudge.start = 0x40000000;
 		fudge.end = 0x40000000 + 128 * 1024 * 1024 - 1;
 		fudge.name = "fudge";
 		fudge.flags = IORESOURCE_MEM;
-		dev_priv->gtt_mem = &fudge;
+
+		gtt_mem = &fudge;
+	} else {
+		gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
 	}
 
+	pg->gtt_phys_start = gtt_phys_start;
+	pg->mmu_gatt_start = mmu_gatt_start;
+	pg->gtt_start = gtt_start;
 	pg->gtt_pages = gtt_pages;
+	pg->gatt_start = gatt_start;
+	pg->gatt_pages = gatt_pages;
+	dev_priv->gtt_mem = gtt_mem;
+}
+
+int psb_gtt_init(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct psb_gtt *pg = &dev_priv->gtt;
+	int ret;
+
+	mutex_init(&dev_priv->gtt_mutex);
+
+	ret = psb_gtt_enable(dev_priv);
+	if (ret)
+		goto err_mutex_destroy;
 
-	dev_priv->gtt_map = ioremap(pg->gtt_phys_start, gtt_pages << PAGE_SHIFT);
+	psb_gtt_init_ranges(dev_priv);
+
+	dev_priv->gtt_map = ioremap(pg->gtt_phys_start, pg->gtt_pages << PAGE_SHIFT);
 	if (!dev_priv->gtt_map) {
 		dev_err(dev->dev, "Failure to map gtt.\n");
 		ret = -ENOMEM;
@@ -264,9 +287,8 @@ int psb_gtt_init(struct drm_device *dev)
 int psb_gtt_resume(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct psb_gtt *pg = &dev_priv->gtt;
-	unsigned int gtt_pages;
+	unsigned int old_gtt_pages = pg->gtt_pages;
 	int ret;
 
 	/* Enable the GTT */
@@ -274,61 +296,14 @@ int psb_gtt_resume(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	/* The root resource we allocate address space from */
-	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
-
-	/*
-	 *	The video mmu has a hw bug when accessing 0x0D0000000.
-	 *	Make gatt start at 0x0e000,0000. This doesn't actually
-	 *	matter for us but may do if the video acceleration ever
-	 *	gets opened up.
-	 */
-	pg->mmu_gatt_start = 0xE0000000;
-
-	pg->gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
-	gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE) >> PAGE_SHIFT;
-	/* CDV doesn't report this. In which case the system has 64 gtt pages */
-	if (pg->gtt_start == 0 || gtt_pages == 0) {
-		dev_dbg(dev->dev, "GTT PCI BAR not initialized.\n");
-		gtt_pages = 64;
-		pg->gtt_start = dev_priv->pge_ctl;
-	}
-
-	pg->gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
-	pg->gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE) >> PAGE_SHIFT;
-	dev_priv->gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
+	psb_gtt_init_ranges(dev_priv);
 
-	if (pg->gatt_pages == 0 || pg->gatt_start == 0) {
-		static struct resource fudge;	/* Preferably peppermint */
-		/*
-		 * This can occur on CDV systems. Fudge it in this case. We
-		 * really don't care what imaginary space is being allocated
-		 * at this point.
-		 */
-		dev_dbg(dev->dev, "GATT PCI BAR not initialized.\n");
-		pg->gatt_start = 0x40000000;
-		pg->gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
-		/*
-		 * This is a little confusing but in fact the GTT is providing
-		 * a view from the GPU into memory and not vice versa. As such
-		 *  this is really allocating space that is not the same as the
-		 *  CPU address space on CDV.
-		 */
-		fudge.start = 0x40000000;
-		fudge.end = 0x40000000 + 128 * 1024 * 1024 - 1;
-		fudge.name = "fudge";
-		fudge.flags = IORESOURCE_MEM;
-		dev_priv->gtt_mem = &fudge;
-	}
-
-	if (gtt_pages != pg->gtt_pages) {
+	if (old_gtt_pages != pg->gtt_pages) {
 		dev_err(dev->dev, "GTT resume error.\n");
-		ret = -EINVAL;
+		ret = -ENODEV;
 		goto err_psb_gtt_disable;
 	}
 
-	pg->gtt_pages = gtt_pages;
-
 	psb_gtt_clear(dev_priv);
 
 err_psb_gtt_disable:
-- 
2.35.1

