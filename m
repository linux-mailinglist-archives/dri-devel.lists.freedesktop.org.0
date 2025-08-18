Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0AB29F8A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDBD10E42D;
	Mon, 18 Aug 2025 10:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WN7XiqjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8I4AkLO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WN7XiqjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8I4AkLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7461210E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A7F421254;
 Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2TZ48VDTt1jbJ/079dh0Dt6TM12VQX3cMjlOnsLeV0=;
 b=WN7XiqjMC2CXeB7IIC3TK5W+k8ibKJe2ix9IIDmv674S9Zl+mMzrtLv4/VT4qg28roKz9Y
 SivRobi7jv0Xo5uyBD3/Q7lWP6Cqz6Jiibec6PHKKWIFysY0rFTOi0Op7tBCOBTn1eVMBZ
 h/MQIGuGS5f7gFZ20tLcEuJlVZV/nHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2TZ48VDTt1jbJ/079dh0Dt6TM12VQX3cMjlOnsLeV0=;
 b=T8I4AkLOdhW8Gm86qgVPLemZ0++JzOtzAn8yK6Y9a/pI+KRllE0TRMR8G3RU+XGrEotmvb
 ArpGxsmU8BkM95CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2TZ48VDTt1jbJ/079dh0Dt6TM12VQX3cMjlOnsLeV0=;
 b=WN7XiqjMC2CXeB7IIC3TK5W+k8ibKJe2ix9IIDmv674S9Zl+mMzrtLv4/VT4qg28roKz9Y
 SivRobi7jv0Xo5uyBD3/Q7lWP6Cqz6Jiibec6PHKKWIFysY0rFTOi0Op7tBCOBTn1eVMBZ
 h/MQIGuGS5f7gFZ20tLcEuJlVZV/nHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2TZ48VDTt1jbJ/079dh0Dt6TM12VQX3cMjlOnsLeV0=;
 b=T8I4AkLOdhW8Gm86qgVPLemZ0++JzOtzAn8yK6Y9a/pI+KRllE0TRMR8G3RU+XGrEotmvb
 ArpGxsmU8BkM95CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A95D13686;
 Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MIUhAUoFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] fbcon: Streamline setting rotated/unrotated bitops
Date: Mon, 18 Aug 2025 12:36:40 +0200
Message-ID: <20250818104655.235001-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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
---
 drivers/video/fbdev/core/bitblit.c      |  5 +----
 drivers/video/fbdev/core/fbcon.c        | 21 +++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.h        |  8 +-------
 drivers/video/fbdev/core/fbcon_ccw.c    |  2 +-
 drivers/video/fbdev/core/fbcon_cw.c     |  2 +-
 drivers/video/fbdev/core/fbcon_rotate.c | 15 ---------------
 drivers/video/fbdev/core/fbcon_rotate.h | 16 +++++++++++++---
 drivers/video/fbdev/core/fbcon_ud.c     |  2 +-
 8 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 267bd1635a41..5fd5fa69a796 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -393,10 +393,7 @@ static const struct fbcon_bitops bit_fbcon_bitops = {
 	.update_start = bit_update_start,
 };
 
-void fbcon_set_bitops(struct fbcon *confb)
+void fbcon_set_bitops_ur(struct fbcon *confb)
 {
 	confb->bitops = &bit_fbcon_bitops;
-
-	if (confb->rotate)
-		fbcon_set_rotate(confb);
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index baaed48dbb4f..369a656521bd 100644
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
 
+static void fbcon_set_bitops(struct fbcon *confb)
+{
+	switch (confb->rotate) {
+	default:
+		fallthrough;
+	case FB_ROTATE_UR:
+		fbcon_set_bitops_ur(confb);
+		break;
+	case FB_ROTATE_CW:
+		fbcon_set_bitops_cw(confb);
+		break;
+	case FB_ROTATE_UD:
+		fbcon_set_bitops_ud(confb);
+		break;
+	case FB_ROTATE_CCW:
+		fbcon_set_bitops_ccw(confb);
+		break;
+	}
+}
+
 static int fbcon_get_rotate(struct fb_info *info)
 {
 	struct fbcon *confb = info->fbcon_par;
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 6a4dac3fd12e..8d5a4b980747 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -191,7 +191,7 @@ static inline u_short fb_scrollmode(struct fbcon_display *fb)
 #ifdef CONFIG_FB_TILEBLITTING
 extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
 #endif
-extern void fbcon_set_bitops(struct fbcon *confb);
+extern void fbcon_set_bitops_ur(struct fbcon *confb);
 extern int  soft_cursor(struct fb_info *info, struct fb_cursor *cursor);
 
 #define FBCON_ATTRIBUTE_UNDERLINE 1
@@ -229,10 +229,4 @@ static inline int get_attribute(struct fb_info *info, u16 c)
         (void) (&_r == &_v); \
         (i == FB_ROTATE_UR || i == FB_ROTATE_UD) ? _r : _v; })
 
-#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-extern void fbcon_set_rotate(struct fbcon *confb);
-#else
-#define fbcon_set_rotate(x) do {} while(0)
-#endif /* CONFIG_FRAMEBUFFER_CONSOLE_ROTATION */
-
 #endif /* _VIDEO_FBCON_H */
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 4902541305dd..1b1a0c923297 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -400,7 +400,7 @@ static const struct fbcon_bitops ccw_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_ccw(struct fbcon *confb)
+void fbcon_set_bitops_ccw(struct fbcon *confb)
 {
 	confb->bitops = &ccw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 0c924581e65d..72288b0cd27f 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -383,7 +383,7 @@ static const struct fbcon_bitops cw_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_cw(struct fbcon *confb)
+void fbcon_set_bitops_cw(struct fbcon *confb)
 {
 	confb->bitops = &cw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index 8100d6f28e70..d311f15519dc 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -92,18 +92,3 @@ int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 finished:
 	return err;
 }
-
-void fbcon_set_rotate(struct fbcon *confb)
-{
-	switch (confb->rotate) {
-	case FB_ROTATE_CW:
-		fbcon_rotate_cw(confb);
-		break;
-	case FB_ROTATE_UD:
-		fbcon_rotate_ud(confb);
-		break;
-	case FB_ROTATE_CCW:
-		fbcon_rotate_ccw(confb);
-		break;
-	}
-}
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
index c378687dd09d..ca70b91fab00 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -92,7 +92,17 @@ static inline void rotate_ccw(const char *in, char *out, u32 width, u32 height)
 
 int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc);
 
-extern void fbcon_rotate_cw(struct fbcon *confb);
-extern void fbcon_rotate_ud(struct fbcon *confb);
-extern void fbcon_rotate_ccw(struct fbcon *confb);
+#if defined(CONFIG_FRAMEBUFFER_CONSOLE_ROTATION)
+void fbcon_set_bitops_cw(struct fbcon *confb);
+void fbcon_set_bitops_ud(struct fbcon *confb);
+void fbcon_set_bitops_ccw(struct fbcon *confb);
+#else
+static inline void fbcon_set_bitops_cw(struct fbcon *confb)
+{ }
+static inline void fbcon_set_bitops_ud(struct fbcon *confb)
+{ }
+static inline void fbcon_set_bitops_ccw(struct fbcon *confb)
+{ }
+#endif
+
 #endif
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 6bc73966e1ff..1f31eb87ec81 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -427,7 +427,7 @@ static const struct fbcon_bitops ud_fbcon_bitops = {
 	.rotate_font = fbcon_rotate_font,
 };
 
-void fbcon_rotate_ud(struct fbcon *confb)
+void fbcon_set_bitops_ud(struct fbcon *confb)
 {
 	confb->bitops = &ud_fbcon_bitops;
 }
-- 
2.50.1

