Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D679710C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063210E7A9;
	Thu,  7 Sep 2023 08:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926310E788
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FA5B1F899;
 Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694076851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7aB+iI8HVpXRZs/ouviDwDfg+sBewP4mXukXSy4qUo=;
 b=gLtWi6K9tWyfe6QaBlVVwBEOuCpCU5HkUthOi57R/aEJbG4TfJsDMXu/SOmIZ+6s6bEchz
 lsPn64szjjMdK/PhLKd/ZVXBkz0nESbJOvfpiK8Vgn28mmRLgd5RCyvZeBvBkWcVVZXMZI
 o0DbkcDvjKAOubPoPdrZbOnmKfmkbAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694076851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7aB+iI8HVpXRZs/ouviDwDfg+sBewP4mXukXSy4qUo=;
 b=qHA0eaLNw1Nc3tQ8SzBCV2pL7GfBXOarodmEooBwWAXcTVDssGFbuNFeBGftUP8i93WzSy
 ghQBp15Se8uxEZDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22B5913ADD;
 Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OIKdB7OP+WT6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:54:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] fbdev/core: Unexport logo helpers
Date: Thu,  7 Sep 2023 10:52:03 +0200
Message-ID: <20230907085408.9354-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907085408.9354-1-tzimmermann@suse.de>
References: <20230907085408.9354-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The interfaces for the fbdev logo are not used outside of the fbdev
module. Hence declare the fbdev logo functions in the internal header
file and remove their symbol exports. Only build the functions if
CONFIG_LOGO has been selected.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_internal.h | 16 ++++++++++++++++
 drivers/video/fbdev/core/fbmem.c       |  5 -----
 include/linux/fb.h                     |  5 -----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 4c8d509a0026..1116faefa034 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -21,6 +21,22 @@ static inline void fb_unregister_chrdev(void)
 #endif
 
 /* fbmem.c */
+#if defined(CONFIG_LOGO)
+extern bool fb_center_logo;
+extern int fb_logo_count;
+int fb_prepare_logo(struct fb_info *fb_info, int rotate);
+int fb_show_logo(struct fb_info *fb_info, int rotate);
+#else
+static inline int fb_prepare_logo(struct fb_info *info, int rotate)
+{
+	return 0;
+}
+static inline int fb_show_logo(struct fb_info *info, int rotate)
+{
+	return 0;
+}
+#endif /* CONFIG_LOGO */
+
 extern struct class *fb_class;
 extern struct mutex registration_lock;
 extern struct fb_info *registered_fb[FB_MAX];
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 98e1847e4287..ee25ac38737d 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -696,12 +696,7 @@ int fb_show_logo(struct fb_info *info, int rotate)
 
 	return y;
 }
-#else
-int fb_prepare_logo(struct fb_info *info, int rotate) { return 0; }
-int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
 #endif /* CONFIG_LOGO */
-EXPORT_SYMBOL(fb_prepare_logo);
-EXPORT_SYMBOL(fb_show_logo);
 
 int
 fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 16c3e6d6c55d..d110676c9c83 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -591,8 +591,6 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
-extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
 extern void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx,
 				u32 height, u32 shift_high, u32 shift_low, u32 mod);
@@ -603,9 +601,6 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
-extern bool fb_center_logo;
-extern int fb_logo_count;
-
 static inline void lock_fb_info(struct fb_info *info)
 {
 	mutex_lock(&info->lock);
-- 
2.42.0

