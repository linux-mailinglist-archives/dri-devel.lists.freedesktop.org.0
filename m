Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240476C16B6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0607710E58A;
	Mon, 20 Mar 2023 15:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861510E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AB091F895;
 Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvWjz7p9m4+gAb1O1HT1AcNR5dvwdJg4KhNr1Af2kig=;
 b=ANrbY00fmc8A+yMIM3dPiEmLZ200s8Lv1fgjGtMnN7oscXAljvH1/JNClOGItppXHWV6T8
 ZU3BdQAur0GDTboYs9G4aPqu6J8DMVNfEgX5W0mbhhMXl6ZQV+Y+BQzjsl0slnIEvsDFIx
 H6gbSKYHvQkz1aOiJEh2yIGNlRWpJb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvWjz7p9m4+gAb1O1HT1AcNR5dvwdJg4KhNr1Af2kig=;
 b=fwXL60kF1yG6dnDhamCmEKjXkzieEzDw8ewwUuIear56nwwQwdKJO1JtlVntX+TZHq5YJ2
 fGjnGCt8cgVOfECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CDD213A2F;
 Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QLcuAst2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 7/8] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Date: Mon, 20 Mar 2023 16:07:50 +0100
Message-Id: <20230320150751.20399-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consolidate all handling of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM by
making the module parameter optional in drm_fb_helper.c.

Without the config option, modules can set smem_start in struct
fb_info for internal usage, but not export if to userspace. The
address can only be exported by enabling the option and setting
the module parameter. Also update the comment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 22 ++++++++--------------
 drivers/gpu/drm/drm_fbdev_dma.c |  9 +--------
 include/drm/drm_fb_helper.h     |  9 ---------
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index bb0b25209b3e..63ec95e86d0e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -60,16 +60,17 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
  * In order to keep user-space compatibility, we want in certain use-cases
  * to keep leaking the fbdev physical address to the user-space program
  * handling the fbdev buffer.
- * This is a bad habit essentially kept into closed source opengl driver
- * that should really be moved into open-source upstream projects instead
- * of using legacy physical addresses in user space to communicate with
- * other out-of-tree kernel modules.
+ *
+ * This is a bad habit, essentially kept to support closed-source OpenGL
+ * drivers that should really be moved into open-source upstream projects
+ * instead of using legacy physical addresses in user space to communicate
+ * with other out-of-tree kernel modules.
  *
  * This module_param *should* be removed as soon as possible and be
  * considered as a broken and legacy behaviour from a modern fbdev device.
  */
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 static bool drm_leak_fbdev_smem;
+#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
 MODULE_PARM_DESC(drm_leak_fbdev_smem,
 		 "Allow unsafe leaking fbdev physical smem address [default=false]");
@@ -1983,10 +1984,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 		return ret;
 	}
 
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-	fb_helper->hint_leak_smem_start = drm_leak_fbdev_smem;
-#endif
-
 	/* push down into drivers */
 	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
 	if (ret < 0)
@@ -2185,11 +2182,8 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 
 	info = fb_helper->info;
 	info->var.pixclock = 0;
-	/* Shamelessly allow physical address leaking to userspace */
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-	if (!fb_helper->hint_leak_smem_start)
-#endif
-		/* don't leak any physical addresses to userspace */
+
+	if (!drm_leak_fbdev_smem)
 		info->flags |= FBINFO_HIDE_SMEM_START;
 
 	/* Need to drop locks to avoid recursive deadlock in
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index cf553ac12a0f..728deffcc0d9 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -136,16 +136,9 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		info->flags |= FBINFO_READS_FAST; /* signal caching */
 	info->screen_size = sizes->surface_height * fb->pitches[0];
 	info->screen_buffer = map.vaddr;
+	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
 	info->fix.smem_len = info->screen_size;
 
-#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-	/*
-	 * Shamelessly leak the physical address to user-space.
-	 */
-	if (fb_helper->hint_leak_smem_start && !info->fix.smem_start)
-		info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
-#endif
-
 	return 0;
 
 err_drm_client_buffer_vunmap:
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index c5822ec2fdd1..72032c354a30 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -195,15 +195,6 @@ struct drm_fb_helper {
 	 */
 	int preferred_bpp;
 
-	/**
-	 * @hint_leak_smem_start:
-	 *
-	 * Hint to the fbdev emulation to store the framebuffer's physical
-	 * address in struct &fb_info.fix.smem_start. If the hint is unset,
-	 * the smem_start field should always be cleared to zero.
-	 */
-	bool hint_leak_smem_start;
-
 #ifdef CONFIG_FB_DEFERRED_IO
 	/**
 	 * @fbdefio:
-- 
2.40.0

