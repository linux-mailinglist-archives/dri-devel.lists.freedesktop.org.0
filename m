Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF9679997
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE5410E6A4;
	Tue, 24 Jan 2023 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0052610E69B;
 Tue, 24 Jan 2023 13:40:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FA9D21888;
 Tue, 24 Jan 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674567614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umu1oYNzuXuDKuOEF0oRXjztfv6/2EpKs/EPAOugwHA=;
 b=0Y5Hvj6232/XrFnj7bJLQREWGtx7luGnOjUPrtFrXTZ7Gpf9++5V3DS/jUGFXH2OE6J5Bg
 QldnPy1qLE94XgxtclhdkvFFcGhYl3Bu4AuyTbpcbL6m4Ahv7aJvlMyAWA+7XarQILWn65
 xp5wiB8PJciZpvE6maR+uD08n9kMb9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674567614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umu1oYNzuXuDKuOEF0oRXjztfv6/2EpKs/EPAOugwHA=;
 b=dGScla0Sl1YZ81J810UQ+K9PbplCn5jC/erVivNYFUTB0LUbcdRRZqiqFTISxyAFX36xek
 +0HUDq5HWLe5DtBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F08613487;
 Tue, 24 Jan 2023 13:40:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2B9WFr7fz2PWZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH v2 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to
 'info'
Date: Tue, 24 Jan 2023 14:40:10 +0100
Message-Id: <20230124134010.30263-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
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

The generic fbdev emulation names variables of type struct fb_info
both 'fbi' and 'info'. The latter seems to be more common in fbdev
code, so name fbi accordingly.

Also replace the duplicate variable in drm_fbdev_fb_destroy().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 47 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 13b31a95d434..b6565c1e3531 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -46,16 +46,15 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 static void drm_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct fb_info *fbi = fb_helper->info;
 	void *shadow = NULL;
 
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi->fbdefio)
-		fb_deferred_io_cleanup(fbi);
+	if (info->fbdefio)
+		fb_deferred_io_cleanup(info);
 	if (drm_fbdev_use_shadow_fb(fb_helper))
-		shadow = fbi->screen_buffer;
+		shadow = info->screen_buffer;
 
 	drm_fb_helper_fini(fb_helper);
 
@@ -171,7 +170,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_framebuffer *fb;
-	struct fb_info *fbi;
+	struct fb_info *info;
 	u32 format;
 	struct iosys_map map;
 	int ret;
@@ -190,35 +189,35 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->fb = buffer->fb;
 	fb = buffer->fb;
 
-	fbi = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(fbi))
-		return PTR_ERR(fbi);
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
 
-	fbi->fbops = &drm_fbdev_fb_ops;
-	fbi->screen_size = sizes->surface_height * fb->pitches[0];
-	fbi->fix.smem_len = fbi->screen_size;
-	fbi->flags = FBINFO_DEFAULT;
+	info->fbops = &drm_fbdev_fb_ops;
+	info->screen_size = sizes->surface_height * fb->pitches[0];
+	info->fix.smem_len = info->screen_size;
+	info->flags = FBINFO_DEFAULT;
 
-	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	if (drm_fbdev_use_shadow_fb(fb_helper)) {
-		fbi->screen_buffer = vzalloc(fbi->screen_size);
-		if (!fbi->screen_buffer)
+		info->screen_buffer = vzalloc(info->screen_size);
+		if (!info->screen_buffer)
 			return -ENOMEM;
-		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
+		info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
 
-		fbi->fbdefio = &drm_fbdev_defio;
-		fb_deferred_io_init(fbi);
+		info->fbdefio = &drm_fbdev_defio;
+		fb_deferred_io_init(info);
 	} else {
 		/* buffer is mapped for HW framebuffer */
 		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
 		if (ret)
 			return ret;
 		if (map.is_iomem) {
-			fbi->screen_base = map.vaddr_iomem;
+			info->screen_base = map.vaddr_iomem;
 		} else {
-			fbi->screen_buffer = map.vaddr;
-			fbi->flags |= FBINFO_VIRTFB;
+			info->screen_buffer = map.vaddr;
+			info->flags |= FBINFO_VIRTFB;
 		}
 
 		/*
@@ -227,10 +226,10 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 		 * case.
 		 */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-		if (fb_helper->hint_leak_smem_start && fbi->fix.smem_start == 0 &&
+		if (fb_helper->hint_leak_smem_start && info->fix.smem_start == 0 &&
 		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
-			fbi->fix.smem_start =
-				page_to_phys(virt_to_page(fbi->screen_buffer));
+			info->fix.smem_start =
+				page_to_phys(virt_to_page(info->screen_buffer));
 #endif
 	}
 
-- 
2.39.0

