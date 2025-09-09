Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB4B4FBAE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C810E6F7;
	Tue,  9 Sep 2025 12:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E7RPGP5t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5OXIV/oz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="apCQyMD/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iURf8Ofq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8BB10E6F7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 12:49:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9C793376B;
 Tue,  9 Sep 2025 12:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757422145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxQHbrTyV81RyPWG/FvFLq/8PTMVadCkyymJBMEKf1s=;
 b=E7RPGP5tUBp3hJXwjQlYBjPZB51ej65wuiRBtKTuniqKzjWdWD6N8Bg/Ntl7yDU99ujWd6
 EnYoVFlehQLHjAHGK9SF1y66yMTVHjsYD+ogSVZ5kRXgu2GIXYU9gQ+YL0iIx+3HEaKvMY
 JKDtYG9RY+UsA7CnKhvyYDnsrPwNfZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757422145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxQHbrTyV81RyPWG/FvFLq/8PTMVadCkyymJBMEKf1s=;
 b=5OXIV/oz7cSVM9MTaaTuSGdPgzJBwe42WNyqk3cjzMwaLttYxizvxTO3xI+hMSjObGyzES
 mHgHfdQdalS05VAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757422144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxQHbrTyV81RyPWG/FvFLq/8PTMVadCkyymJBMEKf1s=;
 b=apCQyMD/AQBbIYn0l7epPkCH5gNwwW79ueYI1JAiiD2NZ/eZor5B6MzFEEQq271Jd6pYwU
 atNl97qTupo4ddx3oH6MD+uDFargqbKaI9AYrYBqLRMKBv/dJ7z+6Q3p2tA0IXDIdcPdkm
 LR7DrNrtCx1mF0mjYFyyOHJC3i9iIIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757422144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxQHbrTyV81RyPWG/FvFLq/8PTMVadCkyymJBMEKf1s=;
 b=iURf8OfqkbnlodLJwTniUJ9im2c+Wi8H3DcaCODB5mWSaqYVskgY/Jyu82XC1+lZLOcUSk
 MA+Ql4tlmqvDBHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B93CB1388C;
 Tue,  9 Sep 2025 12:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mM4DLEAiwGilUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Sep 2025 12:49:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	simona@ffwll.ch,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/5] fbcon: Move fbcon callbacks into struct fbcon_bitops
Date: Tue,  9 Sep 2025 14:44:44 +0200
Message-ID: <20250909124616.143365-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909124616.143365-1-tzimmermann@suse.de>
References: <20250909124616.143365-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ravnborg.org,ffwll.ch,gmx.de];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
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

Depending on rotation settings, fbcon sets different callback
functions in struct fbcon_par from within fbcon_set_bitops(). Declare
the callback functions in the new type struct fbcon_bitops. Then
only replace the single bitops pointer in struct fbcon_par.

Keeping callbacks in constant instances of struct fbcon_bitops
makes it harder to exploit the callbacks. Also makes the code slightly
easier to maintain.

For tile-based consoles, there's a separate instance of the bitops
structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/bitblit.c   | 17 ++++---
 drivers/video/fbdev/core/fbcon.c     | 67 +++++++++++++++-------------
 drivers/video/fbdev/core/fbcon.h     |  7 ++-
 drivers/video/fbdev/core/fbcon_ccw.c | 18 +++++---
 drivers/video/fbdev/core/fbcon_cw.c  | 18 +++++---
 drivers/video/fbdev/core/fbcon_ud.c  | 18 +++++---
 drivers/video/fbdev/core/tileblit.c  | 16 ++++---
 7 files changed, 94 insertions(+), 67 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index ebadc9619699..7a68372f0444 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -384,15 +384,18 @@ static int bit_update_start(struct fb_info *info)
 	return err;
 }
 
+static const struct fbcon_bitops bit_fbcon_bitops = {
+	.bmove = bit_bmove,
+	.clear = bit_clear,
+	.putcs = bit_putcs,
+	.clear_margins = bit_clear_margins,
+	.cursor = bit_cursor,
+	.update_start = bit_update_start,
+};
+
 void fbcon_set_bitops(struct fbcon_par *par)
 {
-	par->bmove = bit_bmove;
-	par->clear = bit_clear;
-	par->putcs = bit_putcs;
-	par->clear_margins = bit_clear_margins;
-	par->cursor = bit_cursor;
-	par->update_start = bit_update_start;
-	par->rotate_font = NULL;
+	par->bitops = &bit_fbcon_bitops;
 
 	if (par->rotate)
 		fbcon_set_rotate(par);
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 7f871ef3e624..1074dc90ed92 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -405,9 +405,9 @@ static void fb_flashcursor(struct work_struct *work)
 
 	c = scr_readw((u16 *) vc->vc_pos);
 	enable = par->cursor_flash && !par->cursor_state.enable;
-	par->cursor(vc, info, enable,
-		    get_fg_color(vc, info, c),
-		    get_bg_color(vc, info, c));
+	par->bitops->cursor(vc, info, enable,
+			    get_fg_color(vc, info, c),
+			    get_bg_color(vc, info, c));
 	console_unlock();
 
 	queue_delayed_work(system_power_efficient_wq, &par->cursor_work,
@@ -1162,7 +1162,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	if (logo)
 		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_rows);
 
-	if (par->rotate_font && par->rotate_font(info, vc)) {
+	if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
 		par->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -1303,10 +1303,11 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	y_break = p->vrows - p->yscroll;
 	if (sy < y_break && sy + height - 1 >= y_break) {
 		u_int b = y_break - sy;
-		par->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
-		par->clear(vc, info, real_y(p, sy + b), sx, height - b, width, fg, bg);
+		par->bitops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
+		par->bitops->clear(vc, info, real_y(p, sy + b), sx, height - b,
+				     width, fg, bg);
 	} else
-		par->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
+		par->bitops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
 }
 
 static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
@@ -1323,9 +1324,9 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	struct fbcon_par *par = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		par->putcs(vc, info, s, count, real_y(p, ypos), xpos,
-			   get_fg_color(vc, info, scr_readw(s)),
-			   get_bg_color(vc, info, scr_readw(s)));
+		par->bitops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
+				   get_fg_color(vc, info, scr_readw(s)),
+				   get_bg_color(vc, info, scr_readw(s)));
 }
 
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
@@ -1334,7 +1335,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 	struct fbcon_par *par = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		par->clear_margins(vc, info, margin_color, bottom_only);
+		par->bitops->clear_margins(vc, info, margin_color, bottom_only);
 }
 
 static void fbcon_cursor(struct vc_data *vc, bool enable)
@@ -1355,12 +1356,12 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
 
 	par->cursor_flash = enable;
 
-	if (!par->cursor)
+	if (!par->bitops->cursor)
 		return;
 
-	par->cursor(vc, info, enable,
-		    get_fg_color(vc, info, c),
-		    get_bg_color(vc, info, c));
+	par->bitops->cursor(vc, info, enable,
+			    get_fg_color(vc, info, c),
+			    get_bg_color(vc, info, c));
 }
 
 static int scrollback_phys_max = 0;
@@ -1444,7 +1445,7 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode |= FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
 		scrollback_max = scrollback_phys_max;
@@ -1463,7 +1464,7 @@ static __inline__ void ywrap_down(struct vc_data *vc, int count)
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode |= FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
 		scrollback_max = 0;
@@ -1478,15 +1479,15 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 
 	p->yscroll += count;
 	if (p->yscroll > p->vrows - vc->vc_rows) {
-		par->bmove(vc, info, p->vrows - vc->vc_rows,
-			    0, 0, 0, vc->vc_rows, vc->vc_cols);
+		par->bitops->bmove(vc, info, p->vrows - vc->vc_rows,
+				   0, 0, 0, vc->vc_rows, vc->vc_cols);
 		p->yscroll -= p->vrows - vc->vc_rows;
 	}
 
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode &= ~FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1510,7 +1511,7 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode &= ~FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1526,15 +1527,15 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 
 	p->yscroll -= count;
 	if (p->yscroll < 0) {
-		par->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
-			    0, vc->vc_rows, vc->vc_cols);
+		par->bitops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
+				   0, vc->vc_rows, vc->vc_cols);
 		p->yscroll += p->vrows - vc->vc_rows;
 	}
 
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode &= ~FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1558,7 +1559,7 @@ static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 	par->var.xoffset = 0;
 	par->var.yoffset = p->yscroll * vc->vc_font.height;
 	par->var.vmode &= ~FB_VMODE_YWRAP;
-	par->update_start(info);
+	par->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1620,8 +1621,8 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 
 			if (c == scr_readw(d)) {
 				if (s > start) {
-					par->bmove(vc, info, line + ycount, x,
-						   line, x, 1, s - start);
+					par->bitops->bmove(vc, info, line + ycount, x,
+							   line, x, 1, s - start);
 					x += s - start + 1;
 					start = s + 1;
 				} else {
@@ -1636,7 +1637,8 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 			d++;
 		} while (s < le);
 		if (s > start)
-			par->bmove(vc, info, line + ycount, x, line, x, 1, s - start);
+			par->bitops->bmove(vc, info, line + ycount, x, line, x, 1,
+					     s - start);
 		console_conditional_schedule();
 		if (ycount > 0)
 			line++;
@@ -1741,7 +1743,8 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 		}
 		return;
 	}
-	par->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx, height, width);
+	par->bitops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
+			     height, width);
 }
 
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
@@ -2161,7 +2164,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	set_blitting_type(vc, info);
 	par->cursor_reset = 1;
 
-	if (par->rotate_font && par->rotate_font(info, vc)) {
+	if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
 		par->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -2194,7 +2197,7 @@ static bool fbcon_switch(struct vc_data *vc)
 
 	if (fbcon_is_active(vc, info)) {
 		par->var.xoffset = par->var.yoffset = p->yscroll = 0;
-		par->update_start(info);
+		par->bitops->update_start(info);
 	}
 
 	fbcon_set_palette(vc, color_table);
@@ -2693,7 +2696,7 @@ static void fbcon_modechanged(struct fb_info *info)
 
 		if (fbcon_is_active(vc, info)) {
 			par->var.xoffset = par->var.yoffset = p->yscroll = 0;
-			par->update_start(info);
+			par->bitops->update_start(info);
 		}
 
 		fbcon_set_palette(vc, color_table);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 94991a1ba11f..4bff4f5b3ec1 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -51,7 +51,7 @@ struct fbcon_display {
     const struct fb_videomode *mode;
 };
 
-struct fbcon_par {
+struct fbcon_bitops {
 	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int dy, int dx, int height, int width);
 	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
@@ -65,6 +65,9 @@ struct fbcon_par {
 		       bool enable, int fg, int bg);
 	int  (*update_start)(struct fb_info *info);
 	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
+};
+
+struct fbcon_par {
 	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
 	struct delayed_work cursor_work; /* Cursor timer */
 	struct fb_cursor cursor_state;
@@ -86,6 +89,8 @@ struct fbcon_par {
 	u8    *cursor_src;
 	u32    cursor_size;
 	u32    fd_size;
+
+	const struct fbcon_bitops *bitops;
 };
 
     /*
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index ba744b67a4fd..4721f4b5e29a 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -390,13 +390,17 @@ static int ccw_update_start(struct fb_info *info)
 	return err;
 }
 
+static const struct fbcon_bitops ccw_fbcon_bitops = {
+	.bmove = ccw_bmove,
+	.clear = ccw_clear,
+	.putcs = ccw_putcs,
+	.clear_margins = ccw_clear_margins,
+	.cursor = ccw_cursor,
+	.update_start = ccw_update_start,
+	.rotate_font = fbcon_rotate_font,
+};
+
 void fbcon_rotate_ccw(struct fbcon_par *par)
 {
-	par->bmove = ccw_bmove;
-	par->clear = ccw_clear;
-	par->putcs = ccw_putcs;
-	par->clear_margins = ccw_clear_margins;
-	par->cursor = ccw_cursor;
-	par->update_start = ccw_update_start;
-	par->rotate_font = fbcon_rotate_font;
+	par->bitops = &ccw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 974bd9d9b770..2771924d0fb7 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -373,13 +373,17 @@ static int cw_update_start(struct fb_info *info)
 	return err;
 }
 
+static const struct fbcon_bitops cw_fbcon_bitops = {
+	.bmove = cw_bmove,
+	.clear = cw_clear,
+	.putcs = cw_putcs,
+	.clear_margins = cw_clear_margins,
+	.cursor = cw_cursor,
+	.update_start = cw_update_start,
+	.rotate_font = fbcon_rotate_font,
+};
+
 void fbcon_rotate_cw(struct fbcon_par *par)
 {
-	par->bmove = cw_bmove;
-	par->clear = cw_clear;
-	par->putcs = cw_putcs;
-	par->clear_margins = cw_clear_margins;
-	par->cursor = cw_cursor;
-	par->update_start = cw_update_start;
-	par->rotate_font = fbcon_rotate_font;
+	par->bitops = &cw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 1a214a4d538f..148ca9b539d1 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -417,13 +417,17 @@ static int ud_update_start(struct fb_info *info)
 	return err;
 }
 
+static const struct fbcon_bitops ud_fbcon_bitops = {
+	.bmove = ud_bmove,
+	.clear = ud_clear,
+	.putcs = ud_putcs,
+	.clear_margins = ud_clear_margins,
+	.cursor = ud_cursor,
+	.update_start = ud_update_start,
+	.rotate_font = fbcon_rotate_font,
+};
+
 void fbcon_rotate_ud(struct fbcon_par *par)
 {
-	par->bmove = ud_bmove;
-	par->clear = ud_clear;
-	par->putcs = ud_putcs;
-	par->clear_margins = ud_clear_margins;
-	par->cursor = ud_cursor;
-	par->update_start = ud_update_start;
-	par->rotate_font = fbcon_rotate_font;
+	par->bitops = &ud_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 4428f2bcd3f8..a9db668caf72 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -161,17 +161,21 @@ static int tile_update_start(struct fb_info *info)
 	return err;
 }
 
+static const struct fbcon_bitops tile_fbcon_bitops = {
+	.bmove = tile_bmove,
+	.clear = tile_clear,
+	.putcs = tile_putcs,
+	.clear_margins = tile_clear_margins,
+	.cursor = tile_cursor,
+	.update_start = tile_update_start,
+};
+
 void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)
 {
 	struct fb_tilemap map;
 	struct fbcon_par *par = info->fbcon_par;
 
-	par->bmove = tile_bmove;
-	par->clear = tile_clear;
-	par->putcs = tile_putcs;
-	par->clear_margins = tile_clear_margins;
-	par->cursor = tile_cursor;
-	par->update_start = tile_update_start;
+	par->bitops = &tile_fbcon_bitops;
 
 	if (par->p) {
 		map.width = vc->vc_font.width;
-- 
2.51.0

