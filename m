Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3895CCA5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6918710E57A;
	Fri, 23 Aug 2024 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF3310E571
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C19722523;
 Fri, 23 Aug 2024 12:44:25 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E75C613A61;
 Fri, 23 Aug 2024 12:44:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UGJSNyiEyGbKVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 12:44:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/10] drm/bochs: Do managed resource cleanup
Date: Fri, 23 Aug 2024 14:28:46 +0200
Message-ID: <20240823124422.286989-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823124422.286989-1-tzimmermann@suse.de>
References: <20240823124422.286989-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2C19722523
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Do managed cleanup of all PCI resources. Remove the now-unused cleanup
helper bochs_hw_fini().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 42 +++++++++---------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 197fc00b373f..5d09b4cb28ed 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -212,14 +212,14 @@ static int bochs_hw_init(struct drm_device *dev)
 	u16 id;
 
 	if (pdev->resource[2].flags & IORESOURCE_MEM) {
+		ioaddr = pci_resource_start(pdev, 2);
+		iosize = pci_resource_len(pdev, 2);
 		/* mmio bar with vga and bochs registers present */
-		if (pci_request_region(pdev, 2, "bochs-drm") != 0) {
+		if (!devm_request_mem_region(&pdev->dev, ioaddr, iosize, "bochs-drm")) {
 			DRM_ERROR("Cannot request mmio region\n");
 			return -EBUSY;
 		}
-		ioaddr = pci_resource_start(pdev, 2);
-		iosize = pci_resource_len(pdev, 2);
-		bochs->mmio = ioremap(ioaddr, iosize);
+		bochs->mmio = devm_ioremap(&pdev->dev, ioaddr, iosize);
 		if (bochs->mmio == NULL) {
 			DRM_ERROR("Cannot map mmio region\n");
 			return -ENOMEM;
@@ -227,7 +227,7 @@ static int bochs_hw_init(struct drm_device *dev)
 	} else {
 		ioaddr = VBE_DISPI_IOPORT_INDEX;
 		iosize = 2;
-		if (!request_region(ioaddr, iosize, "bochs-drm")) {
+		if (!devm_request_region(&pdev->dev, ioaddr, iosize, "bochs-drm")) {
 			DRM_ERROR("Cannot request ioports\n");
 			return -EBUSY;
 		}
@@ -254,10 +254,10 @@ static int bochs_hw_init(struct drm_device *dev)
 		size = min(size, mem);
 	}
 
-	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
+	if (!devm_request_mem_region(&pdev->dev, addr, size, "bochs-drm"))
 		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
 
-	bochs->fb_map = ioremap(addr, size);
+	bochs->fb_map = devm_ioremap(&pdev->dev, addr, size);
 	if (bochs->fb_map == NULL) {
 		DRM_ERROR("Cannot map framebuffer\n");
 		return -ENOMEM;
@@ -286,21 +286,6 @@ static int bochs_hw_init(struct drm_device *dev)
 	return 0;
 }
 
-static void bochs_hw_fini(struct drm_device *dev)
-{
-	struct bochs_device *bochs = dev->dev_private;
-
-	/* TODO: shot down existing vram mappings */
-
-	if (bochs->mmio)
-		iounmap(bochs->mmio);
-	if (bochs->ioports)
-		release_region(VBE_DISPI_IOPORT_INDEX, 2);
-	if (bochs->fb_map)
-		iounmap(bochs->fb_map);
-	pci_release_regions(to_pci_dev(dev->dev));
-}
-
 static void bochs_hw_blank(struct bochs_device *bochs, bool blank)
 {
 	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
@@ -565,17 +550,13 @@ static int bochs_load(struct drm_device *dev)
 
 	ret = drmm_vram_helper_init(dev, bochs->fb_base, bochs->fb_size);
 	if (ret)
-		goto err_hw_fini;
+		return ret;
 
 	ret = bochs_kms_init(bochs);
 	if (ret)
-		goto err_hw_fini;
+		return ret;
 
 	return 0;
-
-err_hw_fini:
-	bochs_hw_fini(dev);
-	return ret;
 }
 
 DEFINE_DRM_GEM_FOPS(bochs_fops);
@@ -650,13 +631,11 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-		goto err_hw_fini;
+		goto err_free_dev;
 
 	drm_fbdev_ttm_setup(dev, 32);
 	return ret;
 
-err_hw_fini:
-	bochs_hw_fini(dev);
 err_free_dev:
 	drm_dev_put(dev);
 	return ret;
@@ -668,7 +647,6 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
-	bochs_hw_fini(dev);
 	drm_dev_put(dev);
 }
 
-- 
2.46.0

