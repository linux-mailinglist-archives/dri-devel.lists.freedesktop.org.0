Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680376816B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C4810E0F6;
	Sat, 29 Jul 2023 19:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238410E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:32:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B0AFC1FE9A;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690659119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=civs/8xdYWi3mr9A7iDWpHZ633rPLL6n/s0mzWxs6Yo=;
 b=SwAqZ6sJs+DE9Bzk+3sCBG3taxCWSzJEdZA+qHYBHsGQKIESdzH36hyclMYl/88Fm9k5fE
 jXIC+Dq9pWGDJQGjMrWx4ffbI7/4vm/JITr7hcZGen6FQeLTd9uQTRXWWYo8LCmGZoXNG7
 j0/WNn3gzcF9/VNw6tTNLcNbYbXH7Sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690659119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=civs/8xdYWi3mr9A7iDWpHZ633rPLL6n/s0mzWxs6Yo=;
 b=ACuhYb1l9jm+VmuxjCa2AF1nsI8CAT1r6R+oZZyZnWjBzNb4etn5wpyatvdJuRn37sNmdq
 U5DaiRvC570S9ZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 806B1139EC;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SEV3Hi9pxWSGGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 19:31:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 1/4] fbdev: Use _IOMEM_ infix for I/O-memory helpers
Date: Sat, 29 Jul 2023 21:26:46 +0200
Message-ID: <20230729193157.15446-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230729193157.15446-1-tzimmermann@suse.de>
References: <20230729193157.15446-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the infix for fbdev's I/O-memory helpers from _IO_ to _IOMEM_
to distiguish them from other types of I/O, such as file operations.
The helpers operate on memory ranges in the I/O address space and the
naming should make this clear. Adapt all users. No functional changes.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/Kconfig        |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c |  2 +-
 drivers/gpu/drm/gma500/Kconfig        |  2 +-
 drivers/gpu/drm/gma500/fbdev.c        |  4 ++--
 drivers/gpu/drm/i915/Kconfig          |  2 +-
 drivers/gpu/drm/radeon/Kconfig        |  2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c |  2 +-
 drivers/video/fbdev/core/Kconfig      |  2 +-
 include/linux/fb.h                    | 14 +++++++-------
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index 5afade25e217..e5597d7c9ae1 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -3,7 +3,7 @@ config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
 	depends on DRM && HAVE_CLK && ARM && MMU
 	select DRM_KMS_HELPER
-	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	help
 	  Support the "LCD" controllers found on the Marvell Armada 510
 	  devices.  There are two controllers on the device, each controller
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index e40a95e51785..d223176912b6 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -34,7 +34,7 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
-	FB_DEFAULT_IO_OPS,
+	FB_DEFAULT_IOMEM_OPS,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_destroy	= armada_fbdev_fb_destroy,
 };
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index cd3d92725ed4..efb4a2dd2f80 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -3,7 +3,7 @@ config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
-	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select I2C
 	select I2C_ALGOBIT
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index be8f5fbd5260..98b44974d42d 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -135,10 +135,10 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops psb_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_IO_OPS_RDWR,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psb_fbdev_fb_setcolreg,
-	__FB_DEFAULT_IO_OPS_DRAW,
+	__FB_DEFAULT_IOMEM_OPS_DRAW,
 	.fb_mmap = psb_fbdev_fb_mmap,
 	.fb_destroy = psb_fbdev_fb_destroy,
 };
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 01b5a8272a27..ce397a8797f7 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -17,7 +17,7 @@ config DRM_I915
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
-	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select RELAY
 	select I2C
 	select I2C_ALGOBIT
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index fe498c8af1bb..f98356be0af2 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -11,7 +11,7 @@ config DRM_RADEON
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
-	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select POWER_SUPPLY
 	select HWMON
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 68c06ac9acce..02bf25759059 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -193,7 +193,7 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = radeon_fbdev_fb_open,
 	.fb_release = radeon_fbdev_fb_release,
-	FB_DEFAULT_IO_OPS,
+	FB_DEFAULT_IOMEM_OPS,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 85434381b6c6..6d562f83dcc2 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -144,7 +144,7 @@ config FB_DMA_HELPERS
 	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
 
-config FB_IO_HELPERS
+config FB_IOMEM_HELPERS
 	bool
 	depends on FB_CORE
 	select FB_CFB_COPYAREA
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 2ef7788311fc..bb5eb98cde83 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -537,22 +537,22 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 			   size_t count, loff_t *ppos);
 
-#define __FB_DEFAULT_IO_OPS_RDWR \
+#define __FB_DEFAULT_IOMEM_OPS_RDWR \
 	.fb_read	= fb_io_read, \
 	.fb_write	= fb_io_write
 
-#define __FB_DEFAULT_IO_OPS_DRAW \
+#define __FB_DEFAULT_IOMEM_OPS_DRAW \
 	.fb_fillrect	= cfb_fillrect, \
 	.fb_copyarea	= cfb_copyarea, \
 	.fb_imageblit	= cfb_imageblit
 
-#define __FB_DEFAULT_IO_OPS_MMAP \
+#define __FB_DEFAULT_IOMEM_OPS_MMAP \
 	.fb_mmap	= NULL /* default implementation */
 
-#define FB_DEFAULT_IO_OPS \
-	__FB_DEFAULT_IO_OPS_RDWR, \
-	__FB_DEFAULT_IO_OPS_DRAW, \
-	__FB_DEFAULT_IO_OPS_MMAP
+#define FB_DEFAULT_IOMEM_OPS \
+	__FB_DEFAULT_IOMEM_OPS_RDWR, \
+	__FB_DEFAULT_IOMEM_OPS_DRAW, \
+	__FB_DEFAULT_IOMEM_OPS_MMAP
 
 /*
  * Helpers for framebuffers in system memory
-- 
2.41.0

