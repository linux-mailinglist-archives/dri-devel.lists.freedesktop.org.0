Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849B7166A9
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B9910E400;
	Tue, 30 May 2023 15:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992810E3C2;
 Tue, 30 May 2023 15:12:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B69821FDF7;
 Tue, 30 May 2023 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685459554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVW5aJsGfE5VOr+7NJFOTHYcDfsGVSKCoCoHPfylBpg=;
 b=J0BaJLe82vaWIEwhgawc5XWGfAdvXwEKFNqgUmOdmaxNdLlgJvNg+MK8DEjPxah6oNWDTd
 D9YhVWSkK1d6/fklFQlpFsQYtb4J82Q0ZC/vL7fR9HF6io8FQYECEz2MomYhAiC7d1xqv7
 4f6JZ+uZSJry74As8vu/CRq+r2fTGf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685459554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVW5aJsGfE5VOr+7NJFOTHYcDfsGVSKCoCoHPfylBpg=;
 b=s6x+w8SHbLmw3tOttTI0OAThF3fCeJvLgNbvtTk4Gz8+E+f3dK0a5GvbKlwEdck9EdRV6g
 8loCMEGwj3xpiMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7060C13A21;
 Tue, 30 May 2023 15:12:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sN+qGmISdmRjAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
 suijingfeng@loongson.cn
Subject: [PATCH v5 12/13] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
Date: Tue, 30 May 2023 17:12:27 +0200
Message-Id: <20230530151228.22979-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
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

Implement dedicated fbdev helpers for framebuffer I/O instead
of using DRM's helpers. Use an fbdev generator macro for
deferred I/O to create the callbacks. Fbdev-generic was the
only caller of the DRM helpers, so remove them from the helper
module.

v4:
	* generate deferred-I/O helpers
	* use initializer macros for fb_ops
v2:
	* use FB_SYS_HELPERS_DEFERRED option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/Kconfig             |   6 +-
 drivers/gpu/drm/drm_fb_helper.c     | 107 ----------------------------
 drivers/gpu/drm/drm_fbdev_generic.c |  11 ++-
 include/drm/drm_fb_helper.h         |  41 -----------
 4 files changed, 6 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 77fb10ddd8a2..92a782827b7b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -95,6 +95,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -135,11 +136,6 @@ config DRM_FBDEV_EMULATION
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select FB_DEFERRED_IO
-	select FB_SYS_FOPS
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7071c810ba83..7f6e54967acb 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-/**
- * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to read from framebuffer memory
- * @count: number of bytes to read from framebuffer memory
- * @ppos: read offset within framebuffer memory
- *
- * Returns:
- * The number of bytes read on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos)
-{
-	return fb_sys_read(info, buf, count, ppos);
-}
-EXPORT_SYMBOL(drm_fb_helper_sys_read);
-
-/**
- * drm_fb_helper_sys_write - Implements struct &fb_ops.fb_write for system memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to write to framebuffer memory
- * @count: number of bytes to write to framebuffer memory
- * @ppos: write offset within framebuffer memory
- *
- * Returns:
- * The number of bytes written on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct drm_fb_helper *helper = info->par;
-	loff_t pos = *ppos;
-	ssize_t ret;
-	struct drm_rect damage_area;
-
-	ret = fb_sys_write(info, buf, count, ppos);
-	if (ret <= 0)
-		return ret;
-
-	if (helper->funcs->fb_dirty) {
-		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_fb_helper_sys_write);
-
-/**
- * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
- * @info: fbdev registered by the helper
- * @rect: info about rectangle to fill
- *
- * A wrapper around sys_fillrect implemented by fbdev core
- */
-void drm_fb_helper_sys_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	sys_fillrect(info, rect);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
-
-/**
- * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
- * @info: fbdev registered by the helper
- * @area: info about area to copy
- *
- * A wrapper around sys_copyarea implemented by fbdev core
- */
-void drm_fb_helper_sys_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	sys_copyarea(info, area);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
-
-/**
- * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
- * @info: fbdev registered by the helper
- * @image: info about image to blit
- *
- * A wrapper around sys_imageblit implemented by fbdev core
- */
-void drm_fb_helper_sys_imageblit(struct fb_info *info,
-				 const struct fb_image *image)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	sys_imageblit(info, image);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
-
 /**
  * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
  * @info: fb_info struct pointer
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 8e5148bf40bb..98ae703848a0 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -34,6 +34,10 @@ static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(drm_fbdev_generic,
+				drm_fb_helper_damage_range,
+				drm_fb_helper_damage_area);
+
 static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -56,13 +60,8 @@ static const struct fb_ops drm_fbdev_generic_fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= drm_fbdev_generic_fb_open,
 	.fb_release	= drm_fbdev_generic_fb_release,
-	.fb_read	= drm_fb_helper_sys_read,
-	.fb_write	= drm_fb_helper_sys_write,
+	FB_DEFAULT_DEFERRED_OPS(drm_fbdev_generic),
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_fillrect	= drm_fb_helper_sys_fillrect,
-	.fb_copyarea	= drm_fb_helper_sys_copyarea,
-	.fb_imageblit	= drm_fb_helper_sys_imageblit,
-	.fb_mmap	= fb_deferred_io_mmap,
 	.fb_destroy	= drm_fbdev_generic_fb_destroy,
 };
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 7d5804882be7..b50fd0c0b713 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
 
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
-ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos);
-ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos);
-
-void drm_fb_helper_sys_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect);
-void drm_fb_helper_sys_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area);
-void drm_fb_helper_sys_imageblit(struct fb_info *info,
-				 const struct fb_image *image);
-
 ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos);
 ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
@@ -397,35 +385,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
 	return -ENODEV;
 }
 
-static inline ssize_t drm_fb_helper_sys_read(struct fb_info *info,
-					     char __user *buf, size_t count,
-					     loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline ssize_t drm_fb_helper_sys_write(struct fb_info *info,
-					      const char __user *buf,
-					      size_t count, loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline void drm_fb_helper_sys_fillrect(struct fb_info *info,
-					      const struct fb_fillrect *rect)
-{
-}
-
-static inline void drm_fb_helper_sys_copyarea(struct fb_info *info,
-					      const struct fb_copyarea *area)
-{
-}
-
-static inline void drm_fb_helper_sys_imageblit(struct fb_info *info,
-					       const struct fb_image *image)
-{
-}
-
 static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
 					     size_t count, loff_t *ppos)
 {
-- 
2.40.1

