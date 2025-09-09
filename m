Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED42B4FBB3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4310E701;
	Tue,  9 Sep 2025 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fnO036Fu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOaw69do";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BHigqScE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y988j1Jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6CA10E701
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 12:49:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2ED121FFD8;
 Tue,  9 Sep 2025 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757422146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXbkr+4cgZLwwrnUjo+/GvjaLMuCY/Ju3904Tb+aKU0=;
 b=fnO036Fu3RJdegvx/pc9wOpsTV1UoybHRZBbBZyr/vcRrVn0oi+Ken5IfchiRfjJ8GU/DM
 PeUmG216gUjdCz38W6M1/gcTRkUmitxfAZtkGw5IA+j1ai5iHktz/5WSrDj+bqSkuaHi86
 bLL/h6yfcIKVOwq/kxb+Uzgt6nnOu9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757422146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXbkr+4cgZLwwrnUjo+/GvjaLMuCY/Ju3904Tb+aKU0=;
 b=AOaw69doyO0pB9NNqss+sf119DIs6N1TATn05fBf6atwbmPIST5klJqHImdY42/tIJ2RfL
 rItnCWZlGRHGUNDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BHigqScE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y988j1Jh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757422145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXbkr+4cgZLwwrnUjo+/GvjaLMuCY/Ju3904Tb+aKU0=;
 b=BHigqScE4BfBkUAV7fn7TFFvrWXAVeynfbwjcnGCftFL9Relu0Szbn5c9pTzuD+q+T9O52
 RgrdphSuApG0MgQTZerI7+FRWTJhJLmF3fA+XQyPg4B46l5Aejtz8ZntpxPwUW5h832EIS
 9DjP9QZpGXxXvetsS8Kt85/3JqD4xyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757422145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXbkr+4cgZLwwrnUjo+/GvjaLMuCY/Ju3904Tb+aKU0=;
 b=y988j1JhBL2DPsrKJVSeXr0OzSLoI+8YP/V6tX9hLtL0iZ3JbzQxJh/iJV6YiMPg91fI4e
 RP8KJzFAbnQVDzDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F09DC13A56;
 Tue,  9 Sep 2025 12:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKqOOUAiwGilUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Sep 2025 12:49:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	simona@ffwll.ch,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/5] fbcon: Streamline setting rotated/unrotated bitops
Date: Tue,  9 Sep 2025 14:44:45 +0200
Message-ID: <20250909124616.143365-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909124616.143365-1-tzimmermann@suse.de>
References: <20250909124616.143365-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ravnborg.org,ffwll.ch,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2ED121FFD8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Support for console rotation is somewhat bolted onto the helper
fbcon_set_bitops() for unrotated displays.

Update fbcon_set_bitops() with a switch statement that picks the
correct settings helper for the current rotation. For unrotated
consoles, set the bitops for in the new helper fbcon_set_bitops_ur().
Rename the other, existing helpers to match the common naming
scheme.

The old helper fbcon_set_rotate() is no longer used.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/bitblit.c      |  5 +----
 drivers/video/fbdev/core/fbcon.c        | 21 +++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  8 +-------
 drivers/video/fbdev/core/fbcon_ccw.c    |  2 +-
 drivers/video/fbdev/core/fbcon_cw.c     |  2 +-
 drivers/video/fbdev/core/fbcon_rotate.c | 15 ---------------
 drivers/video/fbdev/core/fbcon_rotate.h | 15 ++++++++++++---
 drivers/video/fbdev/core/fbcon_ud.c     |  2 +-
 8 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 7a68372f0444..08cfcd81c6b4 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -393,10 +393,7 @@ static const struct fbcon_bitops bit_fbcon_bitops = {
 	.update_start = bit_update_start,
 };
 
-void fbcon_set_bitops(struct fbcon_par *par)
+void fbcon_set_bitops_ur(struct fbcon_par *par)
 {
 	par->bitops = &bit_fbcon_bitops;
-
-	if (par->rotate)
-		fbcon_set_rotate(par);
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 1074dc90ed92..85f63f87d3c1 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -81,6 +81,7 @@
 #include <asm/irq.h>
 
 #include "fbcon.h"
+#include "fbcon_rotate.h"
 #include "fb_internal.h"
 
 /*
@@ -270,6 +271,26 @@ static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 }
 #endif /* CONFIG_FRAMEBUFFER_CONSOLE_ROTATION */
 
+static void fbcon_set_bitops(struct fbcon_par *par)
+{
+	switch (par->rotate) {
+	default:
+		fallthrough;
+	case FB_ROTATE_UR:
+		fbcon_set_bitops_ur(par);
+		break;
+	case FB_ROTATE_CW:
+		fbcon_set_bitops_cw(par);
+		break;
+	case FB_ROTATE_UD:
+		fbcon_set_bitops_ud(par);
+		break;
+	case FB_ROTATE_CCW:
+		fbcon_set_bitops_ccw(par);
+		break;
+	}
+}
+
 static int fbcon_get_rotate(struct fb_info *info)
 {
 	struct fbcon_par *par = info->fbcon_par;
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 4bff4f5b3ec1..44ea4ae4bba0 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -191,7 +191,7 @@ static inline u_short fb_scrollmode(struct fbcon_display *fb)
 #ifdef CONFIG_FB_TILEBLITTING
 extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
 #endif
-extern void fbcon_set_bitops(struct fbcon_par *par);
+extern void fbcon_set_bitops_ur(struct fbcon_par *par);
 extern int  soft_cursor(struct fb_info *info, struct fb_cursor *cursor);
 
 #define FBCON_ATTRIBUTE_UNDERLINE 1
@@ -229,10 +229,4 @@ static inline int get_attribute(struct fb_info *info, u16 c)
         (void) (&_r == &_v); \
         (i == FB_ROTATE_UR || i == FB_ROTATE_UD) ? _r : _v; })
 
-#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-extern void fbcon_set_rotate(struct fbcon_par *par);
-#else
-#define fbcon_set_rotate(x) do {} while(0)
-#endif /* CONFIG_FRAMEBUFFER_CONSOLE_ROTATION */
-
 #endif /* _VIDEO_FBCON_H */
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 4721f4b5e29a..2f394b5a17f7 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -400,7 +400,7 @@ static const struct fbcon_bitops ccw_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_ccw(struct fbcon_par *par)
+void fbcon_set_bitops_ccw(struct fbcon_par *par)
 {
 	par->bitops = &ccw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 2771924d0fb7..3c3ad3471ec4 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -383,7 +383,7 @@ static const struct fbcon_bitops cw_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_cw(struct fbcon_par *par)
+void fbcon_set_bitops_cw(struct fbcon_par *par)
 {
 	par->bitops = &cw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index 0c7cac71a9c2..1562a8f20b4f 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -92,18 +92,3 @@ int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 finished:
 	return err;
 }
-
-void fbcon_set_rotate(struct fbcon_par *par)
-{
-	switch (par->rotate) {
-	case FB_ROTATE_CW:
-		fbcon_rotate_cw(par);
-		break;
-	case FB_ROTATE_UD:
-		fbcon_rotate_ud(par);
-		break;
-	case FB_ROTATE_CCW:
-		fbcon_rotate_ccw(par);
-		break;
-	}
-}
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
index 784f3231a958..8cb019e8a9c0 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -92,8 +92,17 @@ static inline void rotate_ccw(const char *in, char *out, u32 width, u32 height)
 
 int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc);
 
-extern void fbcon_rotate_cw(struct fbcon_par *par);
-extern void fbcon_rotate_ud(struct fbcon_par *par);
-extern void fbcon_rotate_ccw(struct fbcon_par *par);
+#if defined(CONFIG_FRAMEBUFFER_CONSOLE_ROTATION)
+void fbcon_set_bitops_cw(struct fbcon_par *par);
+void fbcon_set_bitops_ud(struct fbcon_par *par);
+void fbcon_set_bitops_ccw(struct fbcon_par *par);
+#else
+static inline void fbcon_set_bitops_cw(struct fbcon_par *par)
+{ }
+static inline void fbcon_set_bitops_ud(struct fbcon_par *par)
+{ }
+static inline void fbcon_set_bitops_ccw(struct fbcon_par *par)
+{ }
+#endif
 
 #endif
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 148ca9b539d1..6fc30cad5b19 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -427,7 +427,7 @@ static const struct fbcon_bitops ud_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_ud(struct fbcon_par *par)
+void fbcon_set_bitops_ud(struct fbcon_par *par)
 {
 	par->bitops = &ud_fbcon_bitops;
 }
-- 
2.51.0

