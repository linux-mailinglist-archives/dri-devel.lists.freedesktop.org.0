Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F676816F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C25310E220;
	Sat, 29 Jul 2023 19:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DA510E21B
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:32:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD66D1FE9B;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690659119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cbbbQ3UkeqZIl+uqfxe5XVSlLXeaBct4xWzNcRBq/Y=;
 b=duS5YWx2pv6OY/Gqoa/ijFDvt4AUrLfYImrncqSrSGtqpgbddAXgFB/tnohuLrWnCSQlEp
 2tHjtxFgN+w9SB7owLtR1QPouiRAwhC1xuBNutAp8rCud+bttMSN7Tkxzn/Xz4ZDwJt1O1
 XXSMyB6qHsZ9e9fJ90ZVwv3PMsw1+6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690659119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cbbbQ3UkeqZIl+uqfxe5XVSlLXeaBct4xWzNcRBq/Y=;
 b=CyMLmzR6tWUaGVfp0SkGWQJDYNWBj8S//NTjFO6pX+vi4eisBc9Qfobb8xyw92j//rltfE
 AjWbWUL4OquTk3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AADEC13596;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EPTNKC9pxWSGGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 19:31:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 2/4] fbdev: Use _SYSMEM_ infix for system-memory helpers
Date: Sat, 29 Jul 2023 21:26:47 +0200
Message-ID: <20230729193157.15446-3-tzimmermann@suse.de>
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

Change the infix for fbdev's system-memory helpers from _SYS_ to
_SYSMEM_. The helpers perform operations within system memory, but
not on the state of the operating system itself. Naming should make
this clear. Adapt all users. No functional changes.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig          |  2 +-
 drivers/gpu/drm/msm/Kconfig      |  2 +-
 drivers/video/fbdev/Kconfig      | 10 +++++-----
 drivers/video/fbdev/core/Kconfig |  6 +++---
 include/linux/fb.h               |  4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0d499669d653..34da733e8606 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -11,7 +11,7 @@ menuconfig DRM
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
-	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
+	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index a78662bd6273..6309a857ca31 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,7 +21,7 @@ config DRM_MSM
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
+	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c0b0419e98b6..5f8392b4f2a1 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -48,7 +48,7 @@ menuconfig FB
 config FB_HECUBA
 	tristate
 	depends on FB
-	select FB_SYS_HELPERS_DEFERRED
+	select FB_SYSMEM_HELPERS_DEFERRED
 
 config FB_SVGALIB
 	tristate
@@ -1886,7 +1886,7 @@ config FB_VIRTUAL
 config XEN_FBDEV_FRONTEND
 	tristate "Xen virtual frame buffer support"
 	depends on FB && XEN
-	select FB_SYS_HELPERS_DEFERRED
+	select FB_SYSMEM_HELPERS_DEFERRED
 	select XEN_XENBUS_FRONTEND
 	default y
 	help
@@ -1897,7 +1897,7 @@ config XEN_FBDEV_FRONTEND
 config FB_METRONOME
 	tristate "E-Ink Metronome/8track controller support"
 	depends on FB
-	select FB_SYS_HELPERS_DEFERRED
+	select FB_SYSMEM_HELPERS_DEFERRED
 	help
 	  This driver implements support for the E-Ink Metronome
 	  controller. The pre-release name for this device was 8track
@@ -1979,7 +1979,7 @@ config FB_MX3
 config FB_BROADSHEET
 	tristate "E-Ink Broadsheet/Epson S1D13521 controller support"
 	depends on FB && (ARCH_PXA || COMPILE_TEST)
-	select FB_SYS_HELPERS_DEFERRED
+	select FB_SYSMEM_HELPERS_DEFERRED
 	help
 	  This driver implements support for the E-Ink Broadsheet
 	  controller. The release name for this device was Epson S1D13521
@@ -2021,7 +2021,7 @@ config FB_SSD1307
 	depends on FB && I2C
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
-	select FB_SYS_HELPERS_DEFERRED
+	select FB_SYSMEM_HELPERS_DEFERRED
 	help
 	  This driver implements support for the Solomon SSD1307
 	  OLED controller over I2C.
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 6d562f83dcc2..28e771a46df6 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -151,7 +151,7 @@ config FB_IOMEM_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
 
-config FB_SYS_HELPERS
+config FB_SYSMEM_HELPERS
 	bool
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
@@ -159,11 +159,11 @@ config FB_SYS_HELPERS
 	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
 
-config FB_SYS_HELPERS_DEFERRED
+config FB_SYSMEM_HELPERS_DEFERRED
 	bool
 	depends on FB_CORE
 	select FB_DEFERRED_IO
-	select FB_SYS_HELPERS
+	select FB_SYSMEM_HELPERS
 
 config FB_BACKLIGHT
 	tristate
diff --git a/include/linux/fb.h b/include/linux/fb.h
index bb5eb98cde83..76472482dc30 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -566,11 +566,11 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos);
 
-#define __FB_DEFAULT_SYS_OPS_RDWR \
+#define __FB_DEFAULT_SYSMEM_OPS_RDWR \
 	.fb_read	= fb_sys_read, \
 	.fb_write	= fb_sys_write
 
-#define __FB_DEFAULT_SYS_OPS_DRAW \
+#define __FB_DEFAULT_SYSMEM_OPS_DRAW \
 	.fb_fillrect	= sys_fillrect, \
 	.fb_copyarea	= sys_copyarea, \
 	.fb_imageblit	= sys_imageblit
-- 
2.41.0

