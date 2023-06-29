Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01B7425FF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDF410E3C9;
	Thu, 29 Jun 2023 12:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB5910E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:20:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D03942186E;
 Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688041201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKqppA9yoJZh0DiZwFUWalm8/3eVYO9+kOc1QaTDT1U=;
 b=GNmoPY2llgIzzKGALYCGCXujJoF8v3kumNCXFmuYjsIH7mTC1ESO1hzHUmvWxwEJjXVv+F
 ctb/570RZnfi7nsxRKlV4VzAM8j+Py9XRtnRv5wMp3UxCCXDlLGmUiRVqkWxBLYywKsYy5
 FKlDGCyem5GQ2H/Qk6hWZdY37D1mLw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688041201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKqppA9yoJZh0DiZwFUWalm8/3eVYO9+kOc1QaTDT1U=;
 b=zn2ycVN7bMs7MpMjurzeBDZvYIidBZ4ripZC2HXkAKRELmBxT7C4nSZT/5sVnb9LQGf2Kj
 pUzRMoQKnAC0euCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 587A713A43;
 Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WD2mFPF2nWRlVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 10/12] fbdev/core: Use fb_is_primary_device() in
 fb_firmware_edid()
Date: Thu, 29 Jun 2023 13:45:49 +0200
Message-ID: <20230629121952.10559-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Maik Broemme <mbroemme@libmpq.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Detect the primary VGA device with fb_is_primary_device() in the
implementation of fb_firmware_edid(). Remove the existing code.

Adapt the function to receive an instance of struct fb_info and
update all callers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Maik Broemme <mbroemme@libmpq.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c          | 25 +++++++----------------
 drivers/video/fbdev/i810/i810-i2c.c       |  2 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c  |  2 +-
 drivers/video/fbdev/nvidia/nv_i2c.c       |  2 +-
 drivers/video/fbdev/savage/savagefb-i2c.c |  2 +-
 include/linux/fb.h                        |  2 +-
 6 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 79e5bfbdd34c2..35be4431f649a 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -28,7 +28,6 @@
  */
 #include <linux/fb.h>
 #include <linux/module.h>
-#include <linux/pci.h>
 #include <linux/slab.h>
 #include <video/edid.h>
 #include <video/of_videomode.h>
@@ -1482,31 +1481,21 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
 }
 
 #if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
-
-/*
- * We need to ensure that the EDID block is only returned for
- * the primary graphics adapter.
- */
-
-const unsigned char *fb_firmware_edid(struct device *device)
+const unsigned char *fb_firmware_edid(struct fb_info *info)
 {
-	struct pci_dev *dev = NULL;
-	struct resource *res = NULL;
 	unsigned char *edid = NULL;
 
-	if (device)
-		dev = to_pci_dev(device);
-
-	if (dev)
-		res = &dev->resource[PCI_ROM_RESOURCE];
-
-	if (res && res->flags & IORESOURCE_ROM_SHADOW)
+	/*
+	 * We need to ensure that the EDID block is only
+	 * returned for the primary graphics adapter.
+	 */
+	if (fb_is_primary_device(info))
 		edid = edid_info.dummy;
 
 	return edid;
 }
 #else
-const unsigned char *fb_firmware_edid(struct device *device)
+const unsigned char *fb_firmware_edid(struct fb_info *info)
 {
 	return NULL;
 }
diff --git a/drivers/video/fbdev/i810/i810-i2c.c b/drivers/video/fbdev/i810/i810-i2c.c
index 7db17d0d8a8cf..b605e96620c1f 100644
--- a/drivers/video/fbdev/i810/i810-i2c.c
+++ b/drivers/video/fbdev/i810/i810-i2c.c
@@ -161,7 +161,7 @@ int i810_probe_i2c_connector(struct fb_info *info, u8 **out_edid, int conn)
 	if (conn < par->ddc_num) {
 		edid = fb_ddc_read(&par->chan[conn].adapter);
 	} else {
-		const u8 *e = fb_firmware_edid(info->device);
+		const u8 *e = fb_firmware_edid(info);
 
 		if (e != NULL) {
 			DPRINTK("i810-i2c: Getting EDID from BIOS\n");
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index a81095b2b1ea5..4633a75e3a613 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -1024,7 +1024,7 @@ static int intelfb_init_var(struct intelfb_info *dinfo)
 		       sizeof(struct fb_var_screeninfo));
 		msrc = 5;
 	} else {
-		const u8 *edid_s = fb_firmware_edid(&dinfo->pdev->dev);
+		const u8 *edid_s = fb_firmware_edid(dinfo->info);
 		u8 *edid_d = NULL;
 
 		if (edid_s) {
diff --git a/drivers/video/fbdev/nvidia/nv_i2c.c b/drivers/video/fbdev/nvidia/nv_i2c.c
index 0b48965a6420c..632e7d622ebfa 100644
--- a/drivers/video/fbdev/nvidia/nv_i2c.c
+++ b/drivers/video/fbdev/nvidia/nv_i2c.c
@@ -159,7 +159,7 @@ int nvidia_probe_i2c_connector(struct fb_info *info, int conn, u8 **out_edid)
 
 	if (!edid && conn == 1) {
 		/* try to get from firmware */
-		const u8 *e = fb_firmware_edid(info->device);
+		const u8 *e = fb_firmware_edid(info);
 
 		if (e != NULL)
 			edid = kmemdup(e, EDID_LENGTH, GFP_KERNEL);
diff --git a/drivers/video/fbdev/savage/savagefb-i2c.c b/drivers/video/fbdev/savage/savagefb-i2c.c
index 80fa87e2ae2ff..cf9c376f76526 100644
--- a/drivers/video/fbdev/savage/savagefb-i2c.c
+++ b/drivers/video/fbdev/savage/savagefb-i2c.c
@@ -227,7 +227,7 @@ int savagefb_probe_i2c_connector(struct fb_info *info, u8 **out_edid)
 
 	if (!edid) {
 		/* try to get from firmware */
-		const u8 *e = fb_firmware_edid(info->device);
+		const u8 *e = fb_firmware_edid(info);
 
 		if (e)
 			edid = kmemdup(e, EDID_LENGTH, GFP_KERNEL);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b098..5ffd2223326bf 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -761,7 +761,7 @@ extern int fb_get_mode(int flags, u32 val, struct fb_var_screeninfo *var,
 extern int fb_validate_mode(const struct fb_var_screeninfo *var,
 			    struct fb_info *info);
 extern int fb_parse_edid(unsigned char *edid, struct fb_var_screeninfo *var);
-extern const unsigned char *fb_firmware_edid(struct device *device);
+extern const unsigned char *fb_firmware_edid(struct fb_info *info);
 extern void fb_edid_to_monspecs(unsigned char *edid,
 				struct fb_monspecs *specs);
 extern void fb_destroy_modedb(struct fb_videomode *modedb);
-- 
2.41.0

