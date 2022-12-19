Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087F650FD3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463610E2BE;
	Mon, 19 Dec 2022 16:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD03210E2B0;
 Mon, 19 Dec 2022 16:05:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38E023814A;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqquY0vRF4j2TZClbWT3UuEK0xCY+Dj3YMKH6n7ha14=;
 b=1oqZO6f7Z/UK84n1HDTBt6BQhym72ZyWuk2ESMExKZbV8MO0N7rtVzJ880pZ0h6s477vjm
 f9tqz07CfPWKgPKXZ9ychqFwzTUaKY2zhWShDBXxPZ836suqvL/KOpUsA00a2nmsiIu5Ql
 xeA4F2VVY2hIft7Hu7z5lm10b9phdhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqquY0vRF4j2TZClbWT3UuEK0xCY+Dj3YMKH6n7ha14=;
 b=1ANZjnO6UjrMzIpnHT3KrA22LyztidJt0BlWk2ZQ5LJVf4lyUGmVU4NfBdvaaZnfa8RMRW
 0zl4uWZWKK6zEKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 025F113910;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCZGO8CLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 11/18] fbdev/efifb: Do not use struct fb_info.apertures
Date: Mon, 19 Dec 2022 17:05:09 +0100
Message-Id: <20221219160516.23436-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire ownership of the firmware scanout buffer by calling Linux'
aperture helpers. Remove the use of struct fb_info.apertures and do
not set FBINFO_MISC_FIRMWARE; both of which previously configured
buffer ownership.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/efifb.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 694013f62781..a5779fb453a2 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/aperture.h>
 #include <linux/kernel.h>
 #include <linux/efi.h>
 #include <linux/efi-bgrt.h>
@@ -51,6 +52,8 @@ static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
 
 struct efifb_par {
 	u32 pseudo_palette[16];
+	resource_size_t base;
+	resource_size_t size;
 };
 
 static struct fb_var_screeninfo efifb_defined = {
@@ -253,6 +256,8 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
  */
 static void efifb_destroy(struct fb_info *info)
 {
+	struct efifb_par *par = info->par;
+
 	if (efifb_pci_dev)
 		pm_runtime_put(&efifb_pci_dev->dev);
 
@@ -264,8 +269,7 @@ static void efifb_destroy(struct fb_info *info)
 	}
 
 	if (request_mem_succeeded)
-		release_mem_region(info->apertures->ranges[0].base,
-				   info->apertures->ranges[0].size);
+		release_mem_region(par->base, par->size);
 	fb_dealloc_cmap(&info->cmap);
 
 	framebuffer_release(info);
@@ -461,13 +465,8 @@ static int efifb_probe(struct platform_device *dev)
 	par = info->par;
 	info->pseudo_palette = par->pseudo_palette;
 
-	info->apertures = alloc_apertures(1);
-	if (!info->apertures) {
-		err = -ENOMEM;
-		goto err_release_fb;
-	}
-	info->apertures->ranges[0].base = efifb_fix.smem_start;
-	info->apertures->ranges[0].size = size_remap;
+	par->base = efifb_fix.smem_start;
+	par->size = size_remap;
 
 	if (efi_enabled(EFI_MEMMAP) &&
 	    !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
@@ -556,7 +555,7 @@ static int efifb_probe(struct platform_device *dev)
 	info->fbops = &efifb_ops;
 	info->var = efifb_defined;
 	info->fix = efifb_fix;
-	info->flags = FBINFO_FLAG_DEFAULT | FBINFO_MISC_FIRMWARE;
+	info->flags = FBINFO_FLAG_DEFAULT;
 
 	orientation = drm_get_panel_orientation_quirk(efifb_defined.xres,
 						      efifb_defined.yres);
@@ -589,6 +588,11 @@ static int efifb_probe(struct platform_device *dev)
 	if (efifb_pci_dev)
 		WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
 
+	err = devm_aperture_acquire_for_platform_device(dev, par->base, par->size);
+	if (err) {
+		pr_err("efifb: cannot acquire aperture\n");
+		goto err_put_rpm_ref;
+	}
 	err = register_framebuffer(info);
 	if (err < 0) {
 		pr_err("efifb: cannot register framebuffer\n");
-- 
2.39.0

