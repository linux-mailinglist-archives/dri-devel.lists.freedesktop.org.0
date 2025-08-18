Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5DB29F86
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25610E42B;
	Mon, 18 Aug 2025 10:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uXTgdKPQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fvR0qvYE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uXTgdKPQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fvR0qvYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820D10E429
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 702581F457;
 Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkdAJVoUrJ2qITTHQy428sqTD7xKPgcpv9G/w5jcG30=;
 b=uXTgdKPQHiKBG0E72GHaUaS2q5TcVgKqM/tP4sIkvbMr57agy/WGZ3+jPAxSbiInTrhML9
 REFZobUWAPDvuX0RjYmywVL+fZKAE07oGrtrIp0zYkrH4pNjooJehCeXCEtpgl7j8DVrkn
 TToF6XEfLKaTVf7QZEpHARTEf3aG1qY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkdAJVoUrJ2qITTHQy428sqTD7xKPgcpv9G/w5jcG30=;
 b=fvR0qvYEi6RGmhBXg4dD+75eM/FNhHRcgtj1Ku6ERudkLDiqymjvJuQMfRAsL+ngq1eUf+
 YfjLOCLyTSfFUSBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uXTgdKPQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fvR0qvYE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkdAJVoUrJ2qITTHQy428sqTD7xKPgcpv9G/w5jcG30=;
 b=uXTgdKPQHiKBG0E72GHaUaS2q5TcVgKqM/tP4sIkvbMr57agy/WGZ3+jPAxSbiInTrhML9
 REFZobUWAPDvuX0RjYmywVL+fZKAE07oGrtrIp0zYkrH4pNjooJehCeXCEtpgl7j8DVrkn
 TToF6XEfLKaTVf7QZEpHARTEf3aG1qY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkdAJVoUrJ2qITTHQy428sqTD7xKPgcpv9G/w5jcG30=;
 b=fvR0qvYEi6RGmhBXg4dD+75eM/FNhHRcgtj1Ku6ERudkLDiqymjvJuQMfRAsL+ngq1eUf+
 YfjLOCLyTSfFUSBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4135F13A73;
 Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ACO1DkoFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] fbcon: Pass struct fbcon to callbacks in struct
 fbcon_bitops
Date: Mon, 18 Aug 2025 12:36:41 +0200
Message-ID: <20250818104655.235001-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email,image.data:url];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 702581F457
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

The callbacks in struct fbcon_bitops are for struct fbcon. Pass an
instance to the callbacks; instead of the respective struct fb_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c      | 30 ++++++++++-------
 drivers/video/fbdev/core/fb_internal.h  |  2 ++
 drivers/video/fbdev/core/fbcon.c        | 44 ++++++++++++-------------
 drivers/video/fbdev/core/fbcon.h        | 16 +++++----
 drivers/video/fbdev/core/fbcon_ccw.c    | 41 ++++++++++++-----------
 drivers/video/fbdev/core/fbcon_cw.c     | 33 ++++++++++---------
 drivers/video/fbdev/core/fbcon_rotate.c |  4 +--
 drivers/video/fbdev/core/fbcon_rotate.h |  2 +-
 drivers/video/fbdev/core/fbcon_ud.c     | 39 +++++++++++-----------
 drivers/video/fbdev/core/tileblit.c     | 19 +++++++----
 10 files changed, 124 insertions(+), 106 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 5fd5fa69a796..b70783e815c6 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -43,9 +43,10 @@ static void update_attr(u8 *dst, u8 *src, int attribute,
 	}
 }
 
-static void bit_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+static void bit_bmove(struct vc_data *vc, struct fbcon *confb, int sy,
 		      int sx, int dy, int dx, int height, int width)
 {
+	struct fb_info *info = confb->info;
 	struct fb_copyarea area;
 
 	area.sx = sx * vc->vc_font.width;
@@ -58,9 +59,10 @@ static void bit_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_copyarea(info, &area);
 }
 
-static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
+static void bit_clear(struct vc_data *vc, struct fbcon *confb, int sy,
 		      int sx, int height, int width, int fg, int bg)
 {
+	struct fb_info *info = confb->info;
 	struct fb_fillrect region;
 
 	region.color = bg;
@@ -73,11 +75,12 @@ static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_fillrect(info, &region);
 }
 
-static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
+static inline void bit_putcs_aligned(struct vc_data *vc, struct fbcon *confb,
 				     const u16 *s, u32 attr, u32 cnt,
 				     u32 d_pitch, u32 s_pitch, u32 cellsize,
 				     struct fb_image *image, u8 *buf, u8 *dst)
 {
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = vc->vc_font.width >> 3;
 	u8 *src;
@@ -105,12 +108,13 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 }
 
 static inline void bit_putcs_unaligned(struct vc_data *vc,
-				       struct fb_info *info, const u16 *s,
+				       struct fbcon *confb, const u16 *s,
 				       u32 attr, u32 cnt, u32 d_pitch,
 				       u32 s_pitch, u32 cellsize,
 				       struct fb_image *image, u8 *buf,
 				       u8 *dst)
 {
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
@@ -139,10 +143,11 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 
 }
 
-static void bit_putcs(struct vc_data *vc, struct fb_info *info,
+static void bit_putcs(struct vc_data *vc, struct fbcon *confb,
 		      const unsigned short *s, int count, int yy, int xx,
 		      int fg, int bg)
 {
+	struct fb_info *info = confb->info;
 	struct fb_image image;
 	u32 width = DIV_ROUND_UP(vc->vc_font.width, 8);
 	u32 cellsize = width * vc->vc_font.height;
@@ -181,10 +186,10 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 		image.data = dst;
 
 		if (!mod)
-			bit_putcs_aligned(vc, info, s, attribute, cnt, pitch,
+			bit_putcs_aligned(vc, confb, s, attribute, cnt, pitch,
 					  width, cellsize, &image, buf, dst);
 		else
-			bit_putcs_unaligned(vc, info, s, attribute, cnt,
+			bit_putcs_unaligned(vc, confb, s, attribute, cnt,
 					    pitch, width, cellsize, &image,
 					    buf, dst);
 
@@ -201,9 +206,10 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 
 }
 
-static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
+static void bit_clear_margins(struct vc_data *vc, struct fbcon *confb,
 			      int color, int bottom_only)
 {
+	struct fb_info *info = confb->info;
 	unsigned int cw = vc->vc_font.width;
 	unsigned int ch = vc->vc_font.height;
 	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
@@ -232,11 +238,11 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
+static void bit_cursor(struct vc_data *vc, struct fbcon *confb, bool enable,
 		       int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = DIV_ROUND_UP(vc->vc_font.width, 8), c;
 	int y = real_y(confb->p, vc->state.y);
@@ -372,9 +378,9 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	confb->cursor_reset = 0;
 }
 
-static int bit_update_start(struct fb_info *info)
+static int bit_update_start(struct fbcon *confb)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	int err;
 
 	err = fb_pan_display(info, &confb->var);
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 613832d335fe..9811eb54e924 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -7,6 +7,8 @@
 #include <linux/fb.h>
 #include <linux/mutex.h>
 
+#include "fbcon.h"
+
 /* fb_devfs.c */
 #if defined(CONFIG_FB_DEVICE)
 int fb_register_chrdev(void);
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 369a656521bd..56295c7adaed 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -426,7 +426,7 @@ static void fb_flashcursor(struct work_struct *work)
 
 	c = scr_readw((u16 *) vc->vc_pos);
 	enable = confb->cursor_flash && !confb->cursor_state.enable;
-	confb->bitops->cursor(vc, info, enable,
+	confb->bitops->cursor(vc, confb, enable,
 			      get_fg_color(vc, info, c),
 			      get_bg_color(vc, info, c));
 	console_unlock();
@@ -1183,7 +1183,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	if (logo)
 		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_rows);
 
-	if (confb->bitops->rotate_font && confb->bitops->rotate_font(info, vc)) {
+	if (confb->bitops->rotate_font && confb->bitops->rotate_font(confb, vc)) {
 		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -1324,11 +1324,11 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	y_break = p->vrows - p->yscroll;
 	if (sy < y_break && sy + height - 1 >= y_break) {
 		u_int b = y_break - sy;
-		confb->bitops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
-		confb->bitops->clear(vc, info, real_y(p, sy + b), sx, height - b,
+		confb->bitops->clear(vc, confb, real_y(p, sy), sx, b, width, fg, bg);
+		confb->bitops->clear(vc, confb, real_y(p, sy + b), sx, height - b,
 				     width, fg, bg);
 	} else
-		confb->bitops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
+		confb->bitops->clear(vc, confb, real_y(p, sy), sx, height, width, fg, bg);
 }
 
 static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
@@ -1345,7 +1345,7 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		confb->bitops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
+		confb->bitops->putcs(vc, confb, s, count, real_y(p, ypos), xpos,
 				     get_fg_color(vc, info, scr_readw(s)),
 				     get_bg_color(vc, info, scr_readw(s)));
 }
@@ -1356,7 +1356,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		confb->bitops->clear_margins(vc, info, margin_color, bottom_only);
+		confb->bitops->clear_margins(vc, confb, margin_color, bottom_only);
 }
 
 static void fbcon_cursor(struct vc_data *vc, bool enable)
@@ -1380,7 +1380,7 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
 	if (!confb->bitops->cursor)
 		return;
 
-	confb->bitops->cursor(vc, info, enable,
+	confb->bitops->cursor(vc, confb, enable,
 			      get_fg_color(vc, info, c),
 			      get_bg_color(vc, info, c));
 }
@@ -1466,7 +1466,7 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode |= FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
 		scrollback_max = scrollback_phys_max;
@@ -1485,7 +1485,7 @@ static __inline__ void ywrap_down(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode |= FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
 		scrollback_max = 0;
@@ -1500,7 +1500,7 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 
 	p->yscroll += count;
 	if (p->yscroll > p->vrows - vc->vc_rows) {
-		confb->bitops->bmove(vc, info, p->vrows - vc->vc_rows,
+		confb->bitops->bmove(vc, confb, p->vrows - vc->vc_rows,
 				     0, 0, 0, vc->vc_rows, vc->vc_cols);
 		p->yscroll -= p->vrows - vc->vc_rows;
 	}
@@ -1508,7 +1508,7 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1532,7 +1532,7 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1548,7 +1548,7 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 
 	p->yscroll -= count;
 	if (p->yscroll < 0) {
-		confb->bitops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
+		confb->bitops->bmove(vc, confb, 0, 0, p->vrows - vc->vc_rows,
 				     0, vc->vc_rows, vc->vc_cols);
 		p->yscroll += p->vrows - vc->vc_rows;
 	}
@@ -1556,7 +1556,7 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1580,7 +1580,7 @@ static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->bitops->update_start(info);
+	confb->bitops->update_start(confb);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1642,7 +1642,7 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 
 			if (c == scr_readw(d)) {
 				if (s > start) {
-					confb->bitops->bmove(vc, info, line + ycount, x,
+					confb->bitops->bmove(vc, confb, line + ycount, x,
 							     line, x, 1, s - start);
 					x += s - start + 1;
 					start = s + 1;
@@ -1658,7 +1658,7 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 			d++;
 		} while (s < le);
 		if (s > start)
-			confb->bitops->bmove(vc, info, line + ycount, x, line, x, 1,
+			confb->bitops->bmove(vc, confb, line + ycount, x, line, x, 1,
 					     s - start);
 		console_conditional_schedule();
 		if (ycount > 0)
@@ -1764,7 +1764,7 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 		}
 		return;
 	}
-	confb->bitops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
+	confb->bitops->bmove(vc, confb, real_y(p, sy), sx, real_y(p, dy), dx,
 			     height, width);
 }
 
@@ -2185,7 +2185,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	set_blitting_type(vc, info);
 	confb->cursor_reset = 1;
 
-	if (confb->bitops->rotate_font && confb->bitops->rotate_font(info, vc)) {
+	if (confb->bitops->rotate_font && confb->bitops->rotate_font(confb, vc)) {
 		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -2218,7 +2218,7 @@ static bool fbcon_switch(struct vc_data *vc)
 
 	if (fbcon_is_active(vc, info)) {
 	    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
-	    confb->bitops->update_start(info);
+	    confb->bitops->update_start(confb);
 	}
 
 	fbcon_set_palette(vc, color_table);
@@ -2717,7 +2717,7 @@ static void fbcon_modechanged(struct fb_info *info)
 
 		if (fbcon_is_active(vc, info)) {
 		    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
-		    confb->bitops->update_start(info);
+		    confb->bitops->update_start(confb);
 		}
 
 		fbcon_set_palette(vc, color_table);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 8d5a4b980747..f3c02f4344cd 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -18,6 +18,8 @@
 
 #include <asm/io.h>
 
+struct fbcon;
+
    /*
     *    This is the interface between the low-level console driver and the
     *    low-level frame buffer device
@@ -52,19 +54,19 @@ struct fbcon_display {
 };
 
 struct fbcon_bitops {
-	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
+	void (*bmove)(struct vc_data *vc, struct fbcon *confb, int sy,
 		      int sx, int dy, int dx, int height, int width);
-	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
+	void (*clear)(struct vc_data *vc, struct fbcon *confb, int sy,
 		      int sx, int height, int width, int fb, int bg);
-	void (*putcs)(struct vc_data *vc, struct fb_info *info,
+	void (*putcs)(struct vc_data *vc, struct fbcon *confb,
 		      const unsigned short *s, int count, int yy, int xx,
 		      int fg, int bg);
-	void (*clear_margins)(struct vc_data *vc, struct fb_info *info,
+	void (*clear_margins)(struct vc_data *vc, struct fbcon *confb,
 			      int color, int bottom_only);
-	void (*cursor)(struct vc_data *vc, struct fb_info *info,
+	void (*cursor)(struct vc_data *vc, struct fbcon *confb,
 		       bool enable, int fg, int bg);
-	int  (*update_start)(struct fb_info *info);
-	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
+	int  (*update_start)(struct fbcon *confb);
+	int  (*rotate_font)(struct fbcon *confb, struct vc_data *vc);
 };
 
 struct fbcon {
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 1b1a0c923297..64970e3b18df 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -60,10 +60,10 @@ static void ccw_update_attr(u8 *dst, u8 *src, int attribute,
 }
 
 
-static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
-		     int sx, int dy, int dx, int height, int width)
+static void ccw_bmove(struct vc_data *vc, struct fbcon *confb, int sy,
+		      int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_copyarea area;
 	u32 vyres = GETVYRES(confb->p, info);
 
@@ -77,10 +77,10 @@ static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_copyarea(info, &area);
 }
 
-static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		     int sx, int height, int width, int fg, int bg)
+static void ccw_clear(struct vc_data *vc, struct fbcon *confb, int sy,
+		      int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_fillrect region;
 	u32 vyres = GETVYRES(confb->p, info);
 
@@ -94,12 +94,12 @@ static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_fillrect(info, &region);
 }
 
-static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
-				    const u16 *s, u32 attr, u32 cnt,
-				    u32 d_pitch, u32 s_pitch, u32 cellsize,
-				    struct fb_image *image, u8 *buf, u8 *dst)
+static inline void ccw_putcs_aligned(struct vc_data *vc, struct fbcon *confb,
+				     const u16 *s, u32 attr, u32 cnt,
+				     u32 d_pitch, u32 s_pitch, u32 cellsize,
+				     struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = (vc->vc_font.height + 7) >> 3;
 	u8 *src;
@@ -125,12 +125,12 @@ static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	info->fbops->fb_imageblit(info, image);
 }
 
-static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
+static void ccw_putcs(struct vc_data *vc, struct fbcon *confb,
 		      const unsigned short *s, int count, int yy, int xx,
 		      int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u32 width = (vc->vc_font.height + 7)/8;
 	u32 cellsize = width * vc->vc_font.width;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -172,8 +172,8 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 		size &= ~buf_align;
 		dst = fb_get_buffer_offset(info, &info->pixmap, size);
 		image.data = dst;
-		ccw_putcs_aligned(vc, info, s, attribute, cnt, pitch,
-				 width, cellsize, &image, buf, dst);
+		ccw_putcs_aligned(vc, confb, s, attribute, cnt, pitch,
+				  width, cellsize, &image, buf, dst);
 		image.dy += image.height;
 		count -= cnt;
 		s -= cnt;
@@ -187,9 +187,10 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 
 }
 
-static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
+static void ccw_clear_margins(struct vc_data *vc, struct fbcon *confb,
 			      int color, int bottom_only)
 {
+	struct fb_info *info = confb->info;
 	unsigned int cw = vc->vc_font.width;
 	unsigned int ch = vc->vc_font.height;
 	unsigned int rw = info->var.yres - (vc->vc_cols*cw);
@@ -217,11 +218,11 @@ static void ccw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
+static void ccw_cursor(struct vc_data *vc, struct fbcon *confb, bool enable,
 		       int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
 	int y = real_y(confb->p, vc->state.y);
@@ -373,9 +374,9 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	confb->cursor_reset = 0;
 }
 
-static int ccw_update_start(struct fb_info *info)
+static int ccw_update_start(struct fbcon *confb)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u32 yoffset;
 	u32 vyres = GETVYRES(confb->p, info);
 	int err;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 72288b0cd27f..6e775cf2a601 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -45,10 +45,10 @@ static void cw_update_attr(u8 *dst, u8 *src, int attribute,
 }
 
 
-static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+static void cw_bmove(struct vc_data *vc, struct fbcon *confb, int sy,
 		     int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_copyarea area;
 	u32 vxres = GETVXRES(confb->p, info);
 
@@ -62,10 +62,10 @@ static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_copyarea(info, &area);
 }
 
-static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
+static void cw_clear(struct vc_data *vc, struct fbcon *confb, int sy,
 		     int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_fillrect region;
 	u32 vxres = GETVXRES(confb->p, info);
 
@@ -79,12 +79,12 @@ static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_fillrect(info, &region);
 }
 
-static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
+static inline void cw_putcs_aligned(struct vc_data *vc, struct fbcon *confb,
 				    const u16 *s, u32 attr, u32 cnt,
 				    u32 d_pitch, u32 s_pitch, u32 cellsize,
 				    struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = (vc->vc_font.height + 7) >> 3;
 	u8 *src;
@@ -110,12 +110,12 @@ static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	info->fbops->fb_imageblit(info, image);
 }
 
-static void cw_putcs(struct vc_data *vc, struct fb_info *info,
-		      const unsigned short *s, int count, int yy, int xx,
-		      int fg, int bg)
+static void cw_putcs(struct vc_data *vc, struct fbcon *confb,
+		     const unsigned short *s, int count, int yy, int xx,
+		     int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u32 width = (vc->vc_font.height + 7)/8;
 	u32 cellsize = width * vc->vc_font.width;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -155,7 +155,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 		size &= ~buf_align;
 		dst = fb_get_buffer_offset(info, &info->pixmap, size);
 		image.data = dst;
-		cw_putcs_aligned(vc, info, s, attribute, cnt, pitch,
+		cw_putcs_aligned(vc, confb, s, attribute, cnt, pitch,
 				 width, cellsize, &image, buf, dst);
 		image.dy += image.height;
 		count -= cnt;
@@ -170,9 +170,10 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 
 }
 
-static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
+static void cw_clear_margins(struct vc_data *vc, struct fbcon *confb,
 			     int color, int bottom_only)
 {
+	struct fb_info *info = confb->info;
 	unsigned int cw = vc->vc_font.width;
 	unsigned int ch = vc->vc_font.height;
 	unsigned int rw = info->var.yres - (vc->vc_cols*cw);
@@ -200,11 +201,11 @@ static void cw_clear_margins(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
+static void cw_cursor(struct vc_data *vc, struct fbcon *confb, bool enable,
 		      int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
 	int y = real_y(confb->p, vc->state.y);
@@ -356,9 +357,9 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	confb->cursor_reset = 0;
 }
 
-static int cw_update_start(struct fb_info *info)
+static int cw_update_start(struct fbcon *confb)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u32 vxres = GETVXRES(confb->p, info);
 	u32 xoffset;
 	int err;
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index d311f15519dc..b4a11b64b699 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -18,9 +18,9 @@
 #include "fbcon.h"
 #include "fbcon_rotate.h"
 
-int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
+int fbcon_rotate_font(struct fbcon *confb, struct vc_data *vc)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	int len, err = 0;
 	int s_cellsize, d_cellsize, i;
 	const u8 *src;
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
index ca70b91fab00..5463e8f171f8 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -90,7 +90,7 @@ static inline void rotate_ccw(const char *in, char *out, u32 width, u32 height)
 	}
 }
 
-int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc);
+int fbcon_rotate_font(struct fbcon *confb, struct vc_data *vc);
 
 #if defined(CONFIG_FRAMEBUFFER_CONSOLE_ROTATION)
 void fbcon_set_bitops_cw(struct fbcon *confb);
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 1f31eb87ec81..5498ec8e8749 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -45,10 +45,10 @@ static void ud_update_attr(u8 *dst, u8 *src, int attribute,
 }
 
 
-static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+static void ud_bmove(struct vc_data *vc, struct fbcon *confb, int sy,
 		     int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_copyarea area;
 	u32 vyres = GETVYRES(confb->p, info);
 	u32 vxres = GETVXRES(confb->p, info);
@@ -63,10 +63,10 @@ static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_copyarea(info, &area);
 }
 
-static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
+static void ud_clear(struct vc_data *vc, struct fbcon *confb, int sy,
 		     int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	struct fb_fillrect region;
 	u32 vyres = GETVYRES(confb->p, info);
 	u32 vxres = GETVXRES(confb->p, info);
@@ -81,12 +81,12 @@ static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
 	info->fbops->fb_fillrect(info, &region);
 }
 
-static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
+static inline void ud_putcs_aligned(struct vc_data *vc, struct fbcon *confb,
 				    const u16 *s, u32 attr, u32 cnt,
 				    u32 d_pitch, u32 s_pitch, u32 cellsize,
 				    struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = vc->vc_font.width >> 3;
 	u8 *src;
@@ -113,13 +113,13 @@ static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 }
 
 static inline void ud_putcs_unaligned(struct vc_data *vc,
-				      struct fb_info *info, const u16 *s,
+				      struct fbcon *confb, const u16 *s,
 				      u32 attr, u32 cnt, u32 d_pitch,
 				      u32 s_pitch, u32 cellsize,
 				      struct fb_image *image, u8 *buf,
 				      u8 *dst)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
@@ -147,12 +147,12 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 
 }
 
-static void ud_putcs(struct vc_data *vc, struct fb_info *info,
-		      const unsigned short *s, int count, int yy, int xx,
-		      int fg, int bg)
+static void ud_putcs(struct vc_data *vc, struct fbcon *confb,
+		     const unsigned short *s, int count, int yy, int xx,
+		     int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	u32 width = (vc->vc_font.width + 7)/8;
 	u32 cellsize = width * vc->vc_font.height;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -197,10 +197,10 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 		image.data = dst;
 
 		if (!mod)
-			ud_putcs_aligned(vc, info, s, attribute, cnt, pitch,
+			ud_putcs_aligned(vc, confb, s, attribute, cnt, pitch,
 					 width, cellsize, &image, buf, dst);
 		else
-			ud_putcs_unaligned(vc, info, s, attribute, cnt, pitch,
+			ud_putcs_unaligned(vc, confb, s, attribute, cnt, pitch,
 					   width, cellsize, &image,
 					   buf, dst);
 
@@ -218,9 +218,10 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 
 }
 
-static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
+static void ud_clear_margins(struct vc_data *vc, struct fbcon *confb,
 			     int color, int bottom_only)
 {
+	struct fb_info *info = confb->info;
 	unsigned int cw = vc->vc_font.width;
 	unsigned int ch = vc->vc_font.height;
 	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
@@ -247,11 +248,11 @@ static void ud_clear_margins(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
+static void ud_cursor(struct vc_data *vc, struct fbcon *confb, bool enable,
 		      int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.width + 7) >> 3, c;
 	int y = real_y(confb->p, vc->state.y);
@@ -396,9 +397,9 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	confb->cursor_reset = 0;
 }
 
-static int ud_update_start(struct fb_info *info)
+static int ud_update_start(struct fbcon *confb)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	int xoffset, yoffset;
 	u32 vyres = GETVYRES(confb->p, info);
 	u32 vxres = GETVXRES(confb->p, info);
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index f84219b403ff..2b6fae0afe46 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -16,9 +16,10 @@
 #include <asm/types.h>
 #include "fbcon.h"
 
-static void tile_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+static void tile_bmove(struct vc_data *vc, struct fbcon *confb, int sy,
 		       int sx, int dy, int dx, int height, int width)
 {
+	struct fb_info *info = confb->info;
 	struct fb_tilearea area;
 
 	area.sx = sx;
@@ -31,9 +32,10 @@ static void tile_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 	info->tileops->fb_tilecopy(info, &area);
 }
 
-static void tile_clear(struct vc_data *vc, struct fb_info *info, int sy,
+static void tile_clear(struct vc_data *vc, struct fbcon *confb, int sy,
 		       int sx, int height, int width, int fg, int bg)
 {
+	struct fb_info *info = confb->info;
 	struct fb_tilerect rect;
 
 	rect.index = vc->vc_video_erase_char &
@@ -49,10 +51,11 @@ static void tile_clear(struct vc_data *vc, struct fb_info *info, int sy,
 	info->tileops->fb_tilefill(info, &rect);
 }
 
-static void tile_putcs(struct vc_data *vc, struct fb_info *info,
+static void tile_putcs(struct vc_data *vc, struct fbcon *confb,
 		       const unsigned short *s, int count, int yy, int xx,
 		       int fg, int bg)
 {
+	struct fb_info *info = confb->info;
 	struct fb_tileblit blit;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int size = sizeof(u32) * count, i;
@@ -71,9 +74,10 @@ static void tile_putcs(struct vc_data *vc, struct fb_info *info,
 	info->tileops->fb_tileblit(info, &blit);
 }
 
-static void tile_clear_margins(struct vc_data *vc, struct fb_info *info,
+static void tile_clear_margins(struct vc_data *vc, struct fbcon *confb,
 			       int color, int bottom_only)
 {
+	struct fb_info *info = confb->info;
 	unsigned int cw = vc->vc_font.width;
 	unsigned int ch = vc->vc_font.height;
 	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
@@ -112,9 +116,10 @@ static void tile_clear_margins(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void tile_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
+static void tile_cursor(struct vc_data *vc, struct fbcon *confb, bool enable,
 			int fg, int bg)
 {
+	struct fb_info *info = confb->info;
 	struct fb_tilecursor cursor;
 	int use_sw = vc->vc_cursor_type & CUR_SW;
 
@@ -149,9 +154,9 @@ static void tile_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	info->tileops->fb_tilecursor(info, &cursor);
 }
 
-static int tile_update_start(struct fb_info *info)
+static int tile_update_start(struct fbcon *confb)
 {
-	struct fbcon *confb = info->fbcon_par;
+	struct fb_info *info = confb->info;
 	int err;
 
 	err = fb_pan_display(info, &confb->var);
-- 
2.50.1

