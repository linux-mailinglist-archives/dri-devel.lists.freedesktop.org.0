Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B67002BD
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B95610E143;
	Fri, 12 May 2023 08:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061D110E11C;
 Fri, 12 May 2023 08:41:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7546620438;
 Fri, 12 May 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683880915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcdLjrEdU29TNQCZsQL4m88DQQqjwBs7iIoaOgkHlRg=;
 b=jcQz68kTUMQAs73Qjm2vHwoZRkeFPNiC0LXfZDAnEJuyZzdbxMxjB+Oh/E5bb8cQcJ52S3
 7kEc645LcFjQlzlFCucSKPZAv+EXZrImcdZd9KQTTphIOINGqxFsGQHAYaHEasK3iYwfq8
 fAFHb2My0wxzCLntmAtzScc7lPZmsds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683880915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcdLjrEdU29TNQCZsQL4m88DQQqjwBs7iIoaOgkHlRg=;
 b=0QoD+dpt6/O6s0hofIvSvab9ZC5ckSRTYOP9mBjgCzyngWh4uE9pUIJEBJpj/kv3Bjl5hc
 KzaKZshKUgGHdzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CA2813A0A;
 Fri, 12 May 2023 08:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFDuCdP7XWQZKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 03/11] drm/gma500: Use regular fbdev I/O helpers
Date: Fri, 12 May 2023 10:41:44 +0200
Message-Id: <20230512084152.31233-4-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Gma500 does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_GMA500_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Kconfig   | 8 ++++++++
 drivers/gpu/drm/gma500/Makefile  | 2 +-
 drivers/gpu/drm/gma500/fbdev.c   | 9 ++++-----
 drivers/gpu/drm/gma500/psb_drv.h | 2 +-
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 2efc0eb41c64..b9655e01b0af 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -3,6 +3,7 @@ config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
+	select DRM_GMA500_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select I2C
 	select I2C_ALGOBIT
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
@@ -15,3 +16,10 @@ config DRM_GMA500
 	  Say yes for an experimental 2D KMS framebuffer driver for the
 	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
 	  Intel GMA3600/3650 (Cedar Trail).
+
+config DRM_GMA500_FBDEV_EMULATION
+	bool
+	depends on DRM_GMA500
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 4f302cd5e1a6..ea86d6627c51 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -38,6 +38,6 @@ gma500_gfx-y += \
 	  psb_irq.o
 
 gma500_gfx-$(CONFIG_ACPI) +=  opregion.o
-gma500_gfx-$(CONFIG_DRM_FBDEV_EMULATION) +=  fbdev.o
+gma500_gfx-$(CONFIG_DRM_GMA500_FBDEV_EMULATION) +=  fbdev.o
 
 obj-$(CONFIG_DRM_GMA500) += gma500_gfx.o
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 62287407e717..60005c3d01d0 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -5,6 +5,7 @@
  *
  **************************************************************************/
 
+#include <linux/fb.h>
 #include <linux/pfn_t.h>
 
 #include <drm/drm_crtc_helper.h>
@@ -136,11 +137,9 @@ static const struct fb_ops psb_fbdev_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_setcolreg = psb_fbdev_fb_setcolreg,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+	.fb_fillrect = cfb_fillrect,
+	.fb_copyarea = cfb_copyarea,
+	.fb_imageblit = cfb_imageblit,
 	.fb_mmap = psb_fbdev_fb_mmap,
 	.fb_destroy = psb_fbdev_fb_destroy,
 };
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index f7f709df99b4..aa2922a0ebf6 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -612,7 +612,7 @@ struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
 					       struct drm_gem_object *obj);
 
 /* fbdev */
-#if defined(CONFIG_DRM_FBDEV_EMULATION)
+#if defined(CONFIG_DRM_GMA500_FBDEV_EMULATION)
 void psb_fbdev_setup(struct drm_psb_private *dev_priv);
 #else
 static inline void psb_fbdev_setup(struct drm_psb_private *dev_priv)
-- 
2.40.1

