Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A9983E47
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877B010E582;
	Tue, 24 Sep 2024 07:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dIZqhdMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SGgQaJey";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dIZqhdMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SGgQaJey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8755610E557;
 Tue, 24 Sep 2024 07:17:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4010421BA4;
 Tue, 24 Sep 2024 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAKLPcdO3A7kJw2pJR6ISdrKtOaD8k+W78aqyWoafaU=;
 b=dIZqhdMGzAxpfRIlqjgmewkM6DZScl9emq/pK1Bf1hnuHZ1bre/fvp9h8m8kcG/9GCn3Th
 dhsAXyrR2qZcklbmQh6euUocS36Koa9Lv/UdNaMf/fF4pX0ftLz+7BbgI4hUKPkH1+RzB4
 XeYjV+QPB/2d2eZkDJiUhBkoYNUAVsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAKLPcdO3A7kJw2pJR6ISdrKtOaD8k+W78aqyWoafaU=;
 b=SGgQaJey8JBk5KwvGEASi/KCaeDEwm+0wyfWTpS3AGSR1bEAvbfHTQkLpA9TFl+mTa5qF4
 FcLJjc9IiPl6UWBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dIZqhdMG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SGgQaJey
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAKLPcdO3A7kJw2pJR6ISdrKtOaD8k+W78aqyWoafaU=;
 b=dIZqhdMGzAxpfRIlqjgmewkM6DZScl9emq/pK1Bf1hnuHZ1bre/fvp9h8m8kcG/9GCn3Th
 dhsAXyrR2qZcklbmQh6euUocS36Koa9Lv/UdNaMf/fF4pX0ftLz+7BbgI4hUKPkH1+RzB4
 XeYjV+QPB/2d2eZkDJiUhBkoYNUAVsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162274;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAKLPcdO3A7kJw2pJR6ISdrKtOaD8k+W78aqyWoafaU=;
 b=SGgQaJey8JBk5KwvGEASi/KCaeDEwm+0wyfWTpS3AGSR1bEAvbfHTQkLpA9TFl+mTa5qF4
 FcLJjc9IiPl6UWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 047AE13AE2;
 Tue, 24 Sep 2024 07:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gARyO6Fn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 49/80] drm/fbdev-shmem: Support struct
 drm_driver.fbdev_probe
Date: Tue, 24 Sep 2024 09:12:47 +0200
Message-ID: <20240924071734.98201-50-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4010421BA4
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework fbdev probing to support fbdev_probe in struct drm_driver
and reimplement the old fb_probe callback on top of it. Provide an
initializer macro for struct drm_driver that sets the callback
according to the kernel configuration.

This change allows the common fbdev client to run on top of SHMEM-
based DRM drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_shmem.c | 60 ++++++++++++++++++-------------
 include/drm/drm_fbdev_shmem.h     | 11 ++++++
 2 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 0c785007f11b..3bca333917d1 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -107,6 +107,40 @@ static struct page *drm_fbdev_shmem_get_page(struct fb_info *info, unsigned long
 
 static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					   struct drm_fb_helper_surface_size *sizes)
+{
+	return drm_fbdev_shmem_driver_fbdev_probe(fb_helper, sizes);
+}
+
+static int drm_fbdev_shmem_helper_fb_dirty(struct drm_fb_helper *helper,
+					   struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs drm_fbdev_shmem_helper_funcs = {
+	.fb_probe = drm_fbdev_shmem_helper_fb_probe,
+	.fb_dirty = drm_fbdev_shmem_helper_fb_dirty,
+};
+
+/*
+ * struct drm_driver
+ */
+
+int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				       struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
@@ -139,6 +173,7 @@ static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		goto err_drm_client_buffer_delete;
 	}
 
+	fb_helper->funcs = &drm_fbdev_shmem_helper_funcs;
 	fb_helper->buffer = buffer;
 	fb_helper->fb = fb;
 
@@ -182,30 +217,7 @@ static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_client_framebuffer_delete(buffer);
 	return ret;
 }
-
-static int drm_fbdev_shmem_helper_fb_dirty(struct drm_fb_helper *helper,
-					   struct drm_clip_rect *clip)
-{
-	struct drm_device *dev = helper->dev;
-	int ret;
-
-	/* Call damage handlers only if necessary */
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->fb->funcs->dirty) {
-		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
-			return ret;
-	}
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs drm_fbdev_shmem_helper_funcs = {
-	.fb_probe = drm_fbdev_shmem_helper_fb_probe,
-	.fb_dirty = drm_fbdev_shmem_helper_fb_dirty,
-};
+EXPORT_SYMBOL(drm_fbdev_shmem_driver_fbdev_probe);
 
 /*
  * struct drm_client_funcs
diff --git a/include/drm/drm_fbdev_shmem.h b/include/drm/drm_fbdev_shmem.h
index fb43cadd1950..3a5d1efa9d55 100644
--- a/include/drm/drm_fbdev_shmem.h
+++ b/include/drm/drm_fbdev_shmem.h
@@ -4,12 +4,23 @@
 #define DRM_FBDEV_SHMEM_H
 
 struct drm_device;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
+				       struct drm_fb_helper_surface_size *sizes);
+
+#define DRM_FBDEV_SHMEM_DRIVER_OPS \
+	.fbdev_probe = drm_fbdev_shmem_driver_fbdev_probe
+
 void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
 static inline void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int preferred_bpp)
 { }
+
+#define DRM_FBDEV_SHMEM_DRIVER_OPS \
+	.fbdev_probe = NULL
 #endif
 
 #endif
-- 
2.46.0

