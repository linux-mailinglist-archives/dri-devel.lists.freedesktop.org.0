Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE476816E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F5210E21D;
	Sat, 29 Jul 2023 19:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636CA10E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:32:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 044921FE9C;
 Sat, 29 Jul 2023 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690659120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cqU6SzdUL2b8trn8/AY0WEBMdnUcl0n5WTUsOb4FFg=;
 b=F8AVJh2WSgI1L0F8a5PshfSxvP0wWJvL2jj9bbjTKzE+duHLwLYBWibEdhPP6vNCF8fM0g
 Fz7cKUxmgM+bydfqjw58IzcwfRM85yP8VMcXkes3J3Z8e0nnBqsMxFSPdZh3B3kl2q64ll
 1Q12pyyfKMayr2o27PT3cwh4vIT3lBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690659120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cqU6SzdUL2b8trn8/AY0WEBMdnUcl0n5WTUsOb4FFg=;
 b=MRtghX898sAfyvWTgzKXUsm/aZT5nxALwrvoxlCfipQDmUaDQOVXjn0mdAx/ru7C7UO7m2
 udaaoNkn3NPR45Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D13C3139EC;
 Sat, 29 Jul 2023 19:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qCZAMi9pxWSGGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 29 Jul 2023 19:31:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 3/4] fbdev: Use _DMAMEM_ infix for DMA-memory helpers
Date: Sat, 29 Jul 2023 21:26:48 +0200
Message-ID: <20230729193157.15446-4-tzimmermann@suse.de>
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

Change the infix for fbdev's DMA-memory helpers from _DMA_ to
_DMAMEM_. The helpers perform operations within DMA-able memory,
but they don't perform DMA operations. Naming should make this
clear. Adapt all users. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                   | 2 +-
 drivers/gpu/drm/drm_fbdev_dma.c           | 4 ++--
 drivers/gpu/drm/exynos/Kconfig            | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 4 ++--
 drivers/gpu/drm/omapdrm/Kconfig           | 2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c      | 4 ++--
 drivers/gpu/drm/tegra/Kconfig             | 2 +-
 drivers/gpu/drm/tegra/fbdev.c             | 4 ++--
 drivers/video/fbdev/core/Kconfig          | 2 +-
 include/linux/fb.h                        | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 34da733e8606..b51c6a141dfa 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -224,7 +224,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
-	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
 
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 6db168f94290..6c9427bb4053 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -62,9 +62,9 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = drm_fbdev_dma_fb_open,
 	.fb_release = drm_fbdev_dma_fb_release,
-	__FB_DEFAULT_DMA_OPS_RDWR,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	__FB_DEFAULT_DMA_OPS_DRAW,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_mmap = drm_fbdev_dma_fb_mmap,
 	.fb_destroy = drm_fbdev_dma_fb_destroy,
 };
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 661b42ad4873..733b109a5095 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -7,7 +7,7 @@ config DRM_EXYNOS
 	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	help
 	  Choose this option if you have a Samsung SoC Exynos chipset.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 4ccb385aff52..a379c8ca435a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -49,9 +49,9 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
-	__FB_DEFAULT_DMA_OPS_RDWR,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	__FB_DEFAULT_DMA_OPS_DRAW,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_mmap        = exynos_drm_fb_mmap,
 	.fb_destroy	= exynos_drm_fb_destroy,
 };
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index d3c4877e465c..b715301ec79f 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,7 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
-	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 5b33c789e17a..6b08b137af1a 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -106,13 +106,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMA_OPS_RDWR,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
-	__FB_DEFAULT_DMA_OPS_DRAW,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_ioctl	= drm_fb_helper_ioctl,
 	.fb_mmap	= omap_fbdev_fb_mmap,
 	.fb_destroy	= omap_fbdev_fb_destroy,
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 39452c8480c1..84e7e6bc3a0c 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -12,7 +12,7 @@ config DRM_TEGRA
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select TEGRA_HOST1X
 	select INTERCONNECT
 	select IOMMU_IOVA
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index 206a399c42d6..db6eaac3d30e 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -59,9 +59,9 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMA_OPS_RDWR,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	__FB_DEFAULT_DMA_OPS_DRAW,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_mmap = tegra_fb_mmap,
 	.fb_destroy = tegra_fbdev_fb_destroy,
 };
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 28e771a46df6..baf7e852c75b 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -136,7 +136,7 @@ config FB_DEFERRED_IO
 	bool
 	depends on FB_CORE
 
-config FB_DMA_HELPERS
+config FB_DMAMEM_HELPERS
 	bool
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 76472482dc30..d255263c2d1d 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -579,11 +579,11 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
  * Helpers for framebuffers in DMA-able memory
  */
 
-#define __FB_DEFAULT_DMA_OPS_RDWR \
+#define __FB_DEFAULT_DMAMEM_OPS_RDWR \
 	.fb_read	= fb_sys_read, \
 	.fb_write	= fb_sys_write
 
-#define __FB_DEFAULT_DMA_OPS_DRAW \
+#define __FB_DEFAULT_DMAMEM_OPS_DRAW \
 	.fb_fillrect	= sys_fillrect, \
 	.fb_copyarea	= sys_copyarea, \
 	.fb_imageblit	= sys_imageblit
-- 
2.41.0

