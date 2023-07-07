Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F174AD26
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800AB10E53C;
	Fri,  7 Jul 2023 08:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF5810E52D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:34:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9B611FE9F;
 Fri,  7 Jul 2023 08:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688718868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQb6IlG62XQo7ECKPZHeGs/kIp3cTj1XvxOVONelJVM=;
 b=Yp3tLA1C98+qgFvCh67kcu+sWYrS7IGuXy+Vh/2tfK/lyf/qN8i81d16xqbiZF66XBRukx
 QHF3IK+/B5vJvcXaNDiq5eNEeHhD1PUFmonzs86NQjMd8L0iS2on41YNpqn6pGCEkpbAaa
 6EOl+7JTcxTgzV0fCzG9feSowNU2uTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688718868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQb6IlG62XQo7ECKPZHeGs/kIp3cTj1XvxOVONelJVM=;
 b=5bA7Nqz+lSeoJSzvAOS70AP3dA0vobKR9294FnvuXmuP8NChw2nMp53rkwCeEF/WjxmDZR
 5fDlyUT1MTGf8CAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF18A1346D;
 Fri,  7 Jul 2023 08:34:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFnVKRTOp2RdQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 08:34:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 09/12] drm/omapdrm: Use GEM mmap for fbdev emulation
Date: Fri,  7 Jul 2023 10:32:00 +0200
Message-ID: <20230707083422.18691-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707083422.18691-1-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev emulation currently uses fbdev's default mmap code, which
has been written for I/O memory. Provide an mmap that uses GEM's mmap
infrastructure.

Utilize fine-grained fbdev macros to initialize struct fb_ops. The
macros set the read/write and the draw callbacks for DMA memory. Set
the fb_mmap callback to omapdrm's new mmap helper. Also select the
correct Kconfig token for fbdev's DMA helpers. Note that the DMA
helpers are the same as for system memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Kconfig      |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index b4ac76c9f31b..d3c4877e465c 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,7 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
-	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b7ccce0704a3..b1a2d00ef52d 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -76,6 +76,15 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return drm_fb_helper_pan_display(var, fbi);
 }
 
+static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
+
+	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
+}
+
 static void omap_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *helper = info->par;
@@ -97,14 +106,16 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	FB_DEFAULT_SYS_OPS,
+	__FB_DEFAULT_DMA_OPS_RDWR,
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
+	__FB_DEFAULT_DMA_OPS_DRAW,
 	.fb_ioctl	= drm_fb_helper_ioctl,
-	.fb_destroy = omap_fbdev_fb_destroy,
+	.fb_mmap	= omap_fbdev_fb_mmap,
+	.fb_destroy	= omap_fbdev_fb_destroy,
 };
 
 static int omap_fbdev_create(struct drm_fb_helper *helper,
-- 
2.41.0

