Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFD830644
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 13:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7527110E6A9;
	Wed, 17 Jan 2024 12:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFFB10E69A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:56:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23FDE22267;
 Wed, 17 Jan 2024 12:55:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9DAE13800;
 Wed, 17 Jan 2024 12:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +Cb+N0HOp2X1YQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 12:55:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Subject: [PATCH 4/8] fbdev/efifb: Remove PM for parent device
Date: Wed, 17 Jan 2024 13:39:08 +0100
Message-ID: <20240117125527.23324-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117125527.23324-1-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 23FDE22267
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EFI device has the correct parent device set. This allows Linux
to handle the power management internally. Hence, remove the manual
PM management for the parent device from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/efifb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 10fc14ad5d12..e66ef35fa6b6 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -17,7 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
-#include <linux/pm_runtime.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
@@ -258,9 +257,6 @@ static void efifb_destroy(struct fb_info *info)
 {
 	struct efifb_par *par = info->par;
 
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
 	if (info->screen_base) {
 		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
 			iounmap(info->screen_base);
@@ -598,26 +594,20 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_groups;
 	}
 
-	if (efifb_pci_dev)
-		WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
-
 	err = devm_aperture_acquire_for_platform_device(dev, par->base, par->size);
 	if (err) {
 		pr_err("efifb: cannot acquire aperture\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	err = register_framebuffer(info);
 	if (err < 0) {
 		pr_err("efifb: cannot register framebuffer\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
 	return 0;
 
-err_put_rpm_ref:
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
+err_fb_dealloc_cmap:
 	fb_dealloc_cmap(&info->cmap);
 err_groups:
 	sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
-- 
2.43.0

