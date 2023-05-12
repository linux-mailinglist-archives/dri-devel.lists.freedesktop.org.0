Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7E7002CB
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7970010E633;
	Fri, 12 May 2023 08:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DB810E1AC;
 Fri, 12 May 2023 08:41:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3E4C22781;
 Fri, 12 May 2023 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683880916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w02s8f8cJ9HqyytEROGfv4NyKbnbsgx40Z9GRTlUz7Q=;
 b=1I5xXd6kNv4IA9qna8MjTnQ4HE39FC2SHd6sTOYGRCphawKMgHwN8CqEr9dHP2h4HY0q3i
 t2lUtKy7yjREszs3m5bjYMEG18O0+hEX4b0scIU2yuqwfIpYAKKfXue5Cp65YbaxQ4m8Xf
 kKZWxZzh2vydb+bWstHIE3OQKOElAg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683880916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w02s8f8cJ9HqyytEROGfv4NyKbnbsgx40Z9GRTlUz7Q=;
 b=NYKn35Pz06XMGgXcUg/QERkkoOEdbjVcjEtriTm7CWDyFyoU39LDsv0nZqRv3085h8XyoL
 CeE/yqbhjLefmmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7043113A0A;
 Fri, 12 May 2023 08:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QEyVGtT7XWQZKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 07/11] drm/omapdrm: Use regular fbdev I/O helpers
Date: Fri, 12 May 2023 10:41:48 +0200
Message-Id: <20230512084152.31233-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
References: <20230512084152.31233-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Omapdrm does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_OMAP_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/omapdrm/Kconfig        |  9 +++++++++
 drivers/gpu/drm/omapdrm/Makefile       |  2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c |  4 ++--
 drivers/gpu/drm/omapdrm/omap_fbdev.c   | 12 +++++++-----
 drivers/gpu/drm/omapdrm/omap_fbdev.h   |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c     |  4 ++--
 6 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 76ded1568bd0..7f7efc302752 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,6 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
+	select DRM_OMAP_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
@@ -130,3 +131,11 @@ config OMAP2_DSS_SLEEP_AFTER_VENC_RESET
 	  disable the sleep if it doesn't cause problems on your platform.
 
 endif
+
+config DRM_OMAP_FBDEV_EMULATION
+	tristate
+	depends on DRM_OMAP
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 710b4e0abcf0..917fcafc77c1 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -17,7 +17,7 @@ omapdrm-y := omap_drv.o \
 	omap_dmm_tiler.o \
 	tcm-sita.o
 
-omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) += omap_fbdev.o
+omapdrm-$(CONFIG_DRM_OMAP_FBDEV_EMULATION) += omap_fbdev.o
 
 omapdrm-y += dss/base.o dss/output.o dss/dss.o dss/dispc.o \
 		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..796d20d010c0 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -42,7 +42,7 @@ static int mm_show(struct seq_file *m, void *arg)
 	return 0;
 }
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_OMAP_FBDEV_EMULATION
 static int fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
@@ -71,7 +71,7 @@ static int fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list omap_debugfs_list[] = {
 	{"gem", gem_show, 0},
 	{"mm", mm_show, 0},
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_OMAP_FBDEV_EMULATION
 	{"fb", fb_show, 0},
 #endif
 };
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b950e93b3846..55a65b81ccdc 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <rob@ti.com>
  */
 
+#include <linux/fb.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -103,11 +105,11 @@ static const struct fb_ops omap_fb_ops = {
 	.fb_pan_display = omap_fbdev_pan_display,
 	.fb_ioctl	= drm_fb_helper_ioctl,
 
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_read = fb_sys_read,
+	.fb_write = fb_sys_write,
+	.fb_fillrect = sys_fillrect,
+	.fb_copyarea = sys_copyarea,
+	.fb_imageblit = sys_imageblit,
 
 	.fb_destroy = omap_fbdev_fb_destroy,
 };
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.h b/drivers/gpu/drm/omapdrm/omap_fbdev.h
index 74c691a8d45f..ee65bc05f34e 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.h
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.h
@@ -11,7 +11,7 @@
 
 struct drm_device;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_OMAP_FBDEV_EMULATION
 void omap_fbdev_setup(struct drm_device *dev);
 #else
 static inline void omap_fbdev_setup(struct drm_device *dev)
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 6b58a5bb7b44..96e8135f127b 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -634,7 +634,7 @@ int omap_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 	return ret;
 }
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_OMAP_FBDEV_EMULATION
 /* Set scrolling position.  This allows us to implement fast scrolling
  * for console.
  *
@@ -1067,7 +1067,7 @@ void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt)
 	omap_gem_unpin(obj);
 }
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_OMAP_FBDEV_EMULATION
 /*
  * Get kernel virtual address for CPU access.. this more or less only
  * exists for omap_fbdev.
-- 
2.40.1

