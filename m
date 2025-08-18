Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984AB29F89
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E834110E42A;
	Mon, 18 Aug 2025 10:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sB/Ymmpj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jUym5QfW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sB/Ymmpj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jUym5QfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7497F10E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 040902124B;
 Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZLQJS+OehV/tPsUk7tZuvsYNDt4A5xvoKVb035VWoQ=;
 b=sB/Ymmpj9Ji7WTJRJzoiH7/Rth59zjZn15lf6l4R0qXfU7XstPwW3bPw+OFzXFb/CsKRyV
 H4phjRGP7VVdlxg0SI5kxHVi6JOZDxgL+dBAv4gmda5p7hI/H+6dc2vQ3bTOE8Qo4Tf0Ix
 m0yNrdMuTGSdPiVhV4UmPKVkAdOaVSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZLQJS+OehV/tPsUk7tZuvsYNDt4A5xvoKVb035VWoQ=;
 b=jUym5QfWuAvFr0GYe01RTcbZ6sk+A8tqNN8OWOXIp5+zV4lrN9rjrzWou6uycUZCw1FKa1
 WqPSXapI1yhOp6Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZLQJS+OehV/tPsUk7tZuvsYNDt4A5xvoKVb035VWoQ=;
 b=sB/Ymmpj9Ji7WTJRJzoiH7/Rth59zjZn15lf6l4R0qXfU7XstPwW3bPw+OFzXFb/CsKRyV
 H4phjRGP7VVdlxg0SI5kxHVi6JOZDxgL+dBAv4gmda5p7hI/H+6dc2vQ3bTOE8Qo4Tf0Ix
 m0yNrdMuTGSdPiVhV4UmPKVkAdOaVSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZLQJS+OehV/tPsUk7tZuvsYNDt4A5xvoKVb035VWoQ=;
 b=jUym5QfWuAvFr0GYe01RTcbZ6sk+A8tqNN8OWOXIp5+zV4lrN9rjrzWou6uycUZCw1FKa1
 WqPSXapI1yhOp6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8F4413A73;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qMi0L0kFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/6] fbcon: Move fbcon callbacks into struct fbcon_bitops
Date: Mon, 18 Aug 2025 12:36:39 +0200
Message-ID: <20250818104655.235001-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
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
functions in struct fbcon from within fbcon_set_bitops(). Declare
the callback functions in the new type struct fbcon_bitops. Then
only replace the single bitops pointer in struct fbcon.

Keeping callbacks in constant instances of struct fbcon_bitops
makes it harder to exploit the callbacks. Also makes the code slightly
easier to maintain.

For tile-based consoles, there's a separate instance of the bitops
structure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index a2202cae0691..267bd1635a41 100644
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
 void fbcon_set_bitops(struct fbcon *confb)
 {
-	confb->bmove = bit_bmove;
-	confb->clear = bit_clear;
-	confb->putcs = bit_putcs;
-	confb->clear_margins = bit_clear_margins;
-	confb->cursor = bit_cursor;
-	confb->update_start = bit_update_start;
-	confb->rotate_font = NULL;
+	confb->bitops = &bit_fbcon_bitops;
 
 	if (confb->rotate)
 		fbcon_set_rotate(confb);
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ac8e897be5cb..baaed48dbb4f 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -405,9 +405,9 @@ static void fb_flashcursor(struct work_struct *work)
 
 	c = scr_readw((u16 *) vc->vc_pos);
 	enable = confb->cursor_flash && !confb->cursor_state.enable;
-	confb->cursor(vc, info, enable,
-		      get_fg_color(vc, info, c),
-		      get_bg_color(vc, info, c));
+	confb->bitops->cursor(vc, info, enable,
+			      get_fg_color(vc, info, c),
+			      get_bg_color(vc, info, c));
 	console_unlock();
 
 	queue_delayed_work(system_power_efficient_wq, &confb->cursor_work,
@@ -1162,7 +1162,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	if (logo)
 		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_rows);
 
-	if (confb->rotate_font && confb->rotate_font(info, vc)) {
+	if (confb->bitops->rotate_font && confb->bitops->rotate_font(info, vc)) {
 		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -1303,10 +1303,11 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	y_break = p->vrows - p->yscroll;
 	if (sy < y_break && sy + height - 1 >= y_break) {
 		u_int b = y_break - sy;
-		confb->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
-		confb->clear(vc, info, real_y(p, sy + b), sx, height - b, width, fg, bg);
+		confb->bitops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
+		confb->bitops->clear(vc, info, real_y(p, sy + b), sx, height - b,
+				     width, fg, bg);
 	} else
-		confb->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
+		confb->bitops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
 }
 
 static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
@@ -1323,9 +1324,9 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		confb->putcs(vc, info, s, count, real_y(p, ypos), xpos,
-			     get_fg_color(vc, info, scr_readw(s)),
-			     get_bg_color(vc, info, scr_readw(s)));
+		confb->bitops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
+				     get_fg_color(vc, info, scr_readw(s)),
+				     get_bg_color(vc, info, scr_readw(s)));
 }
 
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
@@ -1334,7 +1335,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		confb->clear_margins(vc, info, margin_color, bottom_only);
+		confb->bitops->clear_margins(vc, info, margin_color, bottom_only);
 }
 
 static void fbcon_cursor(struct vc_data *vc, bool enable)
@@ -1355,12 +1356,12 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
 
 	confb->cursor_flash = enable;
 
-	if (!confb->cursor)
+	if (!confb->bitops->cursor)
 		return;
 
-	confb->cursor(vc, info, enable,
-		      get_fg_color(vc, info, c),
-		      get_bg_color(vc, info, c));
+	confb->bitops->cursor(vc, info, enable,
+			      get_fg_color(vc, info, c),
+			      get_bg_color(vc, info, c));
 }
 
 static int scrollback_phys_max = 0;
@@ -1444,7 +1445,7 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode |= FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
 		scrollback_max = scrollback_phys_max;
@@ -1463,7 +1464,7 @@ static __inline__ void ywrap_down(struct vc_data *vc, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode |= FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
 		scrollback_max = 0;
@@ -1478,15 +1479,15 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 
 	p->yscroll += count;
 	if (p->yscroll > p->vrows - vc->vc_rows) {
-		confb->bmove(vc, info, p->vrows - vc->vc_rows,
-				  0, 0, 0, vc->vc_rows, vc->vc_cols);
+		confb->bitops->bmove(vc, info, p->vrows - vc->vc_rows,
+				     0, 0, 0, vc->vc_rows, vc->vc_cols);
 		p->yscroll -= p->vrows - vc->vc_rows;
 	}
 
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1510,7 +1511,7 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1526,15 +1527,15 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 
 	p->yscroll -= count;
 	if (p->yscroll < 0) {
-		confb->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
-				  0, vc->vc_rows, vc->vc_cols);
+		confb->bitops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
+				     0, vc->vc_rows, vc->vc_cols);
 		p->yscroll += p->vrows - vc->vc_rows;
 	}
 
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1558,7 +1559,7 @@ static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 	confb->var.xoffset = 0;
 	confb->var.yoffset = p->yscroll * vc->vc_font.height;
 	confb->var.vmode &= ~FB_VMODE_YWRAP;
-	confb->update_start(info);
+	confb->bitops->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1620,8 +1621,8 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 
 			if (c == scr_readw(d)) {
 				if (s > start) {
-					confb->bmove(vc, info, line + ycount, x,
-						     line, x, 1, s - start);
+					confb->bitops->bmove(vc, info, line + ycount, x,
+							     line, x, 1, s - start);
 					x += s - start + 1;
 					start = s + 1;
 				} else {
@@ -1636,7 +1637,8 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 			d++;
 		} while (s < le);
 		if (s > start)
-			confb->bmove(vc, info, line + ycount, x, line, x, 1, s - start);
+			confb->bitops->bmove(vc, info, line + ycount, x, line, x, 1,
+					     s - start);
 		console_conditional_schedule();
 		if (ycount > 0)
 			line++;
@@ -1741,7 +1743,8 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 		}
 		return;
 	}
-	confb->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx, height, width);
+	confb->bitops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
+			     height, width);
 }
 
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
@@ -2161,7 +2164,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	set_blitting_type(vc, info);
 	confb->cursor_reset = 1;
 
-	if (confb->rotate_font && confb->rotate_font(info, vc)) {
+	if (confb->bitops->rotate_font && confb->bitops->rotate_font(info, vc)) {
 		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
@@ -2194,7 +2197,7 @@ static bool fbcon_switch(struct vc_data *vc)
 
 	if (fbcon_is_active(vc, info)) {
 	    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
-	    confb->update_start(info);
+	    confb->bitops->update_start(info);
 	}
 
 	fbcon_set_palette(vc, color_table);
@@ -2693,7 +2696,7 @@ static void fbcon_modechanged(struct fb_info *info)
 
 		if (fbcon_is_active(vc, info)) {
 		    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
-		    confb->update_start(info);
+		    confb->bitops->update_start(info);
 		}
 
 		fbcon_set_palette(vc, color_table);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 666ed89526da..6a4dac3fd12e 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -51,7 +51,7 @@ struct fbcon_display {
     const struct fb_videomode *mode;
 };
 
-struct fbcon {
+struct fbcon_bitops {
 	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int dy, int dx, int height, int width);
 	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
@@ -65,6 +65,9 @@ struct fbcon {
 		       bool enable, int fg, int bg);
 	int  (*update_start)(struct fb_info *info);
 	int  (*rotate_font)(struct fb_info *info, struct vc_data *vc);
+};
+
+struct fbcon {
 	struct fb_var_screeninfo var;  /* copy of the current fb_var_screeninfo */
 	struct delayed_work cursor_work; /* Cursor timer */
 	struct fb_cursor cursor_state;
@@ -86,6 +89,8 @@ struct fbcon {
 	u8    *cursor_src;
 	u32    cursor_size;
 	u32    fd_size;
+
+	const struct fbcon_bitops *bitops;
 };
 
     /*
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 4c1a40864e84..4902541305dd 100644
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
 void fbcon_rotate_ccw(struct fbcon *confb)
 {
-	confb->bmove = ccw_bmove;
-	confb->clear = ccw_clear;
-	confb->putcs = ccw_putcs;
-	confb->clear_margins = ccw_clear_margins;
-	confb->cursor = ccw_cursor;
-	confb->update_start = ccw_update_start;
-	confb->rotate_font = fbcon_rotate_font;
+	confb->bitops = &ccw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index ac3af039fe4a..0c924581e65d 100644
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
 void fbcon_rotate_cw(struct fbcon *confb)
 {
-	confb->bmove = cw_bmove;
-	confb->clear = cw_clear;
-	confb->putcs = cw_putcs;
-	confb->clear_margins = cw_clear_margins;
-	confb->cursor = cw_cursor;
-	confb->update_start = cw_update_start;
-	confb->rotate_font = fbcon_rotate_font;
+	confb->bitops = &cw_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 74e1331fae33..6bc73966e1ff 100644
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
 void fbcon_rotate_ud(struct fbcon *confb)
 {
-	confb->bmove = ud_bmove;
-	confb->clear = ud_clear;
-	confb->putcs = ud_putcs;
-	confb->clear_margins = ud_clear_margins;
-	confb->cursor = ud_cursor;
-	confb->update_start = ud_update_start;
-	confb->rotate_font = fbcon_rotate_font;
+	confb->bitops = &ud_fbcon_bitops;
 }
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 1ba8987302e6..f84219b403ff 100644
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
 	struct fbcon *confb = info->fbcon_par;
 
-	confb->bmove = tile_bmove;
-	confb->clear = tile_clear;
-	confb->putcs = tile_putcs;
-	confb->clear_margins = tile_clear_margins;
-	confb->cursor = tile_cursor;
-	confb->update_start = tile_update_start;
+	confb->bitops = &tile_fbcon_bitops;
 
 	if (confb->p) {
 		map.width = vc->vc_font.width;
-- 
2.50.1

