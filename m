Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBBB29F82
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85DD10E436;
	Mon, 18 Aug 2025 10:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jXQCZ1MD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g0sMBTFZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jXQCZ1MD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g0sMBTFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEC110E428
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B0EE21246;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l815S2gnfxyTkc9NvW8g/7a9hCkeDKpDD4GMLIWs5X4=;
 b=jXQCZ1MDPD9CFoymDurA7Lg/XZGLnxeRcv08YfXHnKOJCMdI5jWHSVownayQ35Aub9lqtG
 GKFobgK2ule7IhDnNEBY0IPpyggz6nLbjG45guRfpx4PgOecbPuvp6tOntRJVSFtzTiAV/
 SS5CIKdsFUHIKYqJlihJ01txTpxEwsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l815S2gnfxyTkc9NvW8g/7a9hCkeDKpDD4GMLIWs5X4=;
 b=g0sMBTFZWdt6MtAfhVP87HkRquWdUr13mP32UTg1uAppb5wrPIjMN0ChFSy6LnaUVC33iR
 w0mdOl6rd7i3IhBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l815S2gnfxyTkc9NvW8g/7a9hCkeDKpDD4GMLIWs5X4=;
 b=jXQCZ1MDPD9CFoymDurA7Lg/XZGLnxeRcv08YfXHnKOJCMdI5jWHSVownayQ35Aub9lqtG
 GKFobgK2ule7IhDnNEBY0IPpyggz6nLbjG45guRfpx4PgOecbPuvp6tOntRJVSFtzTiAV/
 SS5CIKdsFUHIKYqJlihJ01txTpxEwsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l815S2gnfxyTkc9NvW8g/7a9hCkeDKpDD4GMLIWs5X4=;
 b=g0sMBTFZWdt6MtAfhVP87HkRquWdUr13mP32UTg1uAppb5wrPIjMN0ChFSy6LnaUVC33iR
 w0mdOl6rd7i3IhBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49D6913A97;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KCmZEEkFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] fbcon: Rename struct fbcon_ops to struct fbcon
Date: Mon, 18 Aug 2025 12:36:37 +0200
Message-ID: <20250818104655.235001-3-tzimmermann@suse.de>
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

The type struct fbcon_ops contains fbcon state and callbacks. As the
callbacks will be removed from struct fbcon_ops, rename the data type
to struct fbcon. Also rename the variables from ops to confb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c      | 122 +++----
 drivers/video/fbdev/core/fbcon.c        | 435 ++++++++++++------------
 drivers/video/fbdev/core/fbcon.h        |   6 +-
 drivers/video/fbdev/core/fbcon_ccw.c    | 146 ++++----
 drivers/video/fbdev/core/fbcon_cw.c     | 146 ++++----
 drivers/video/fbdev/core/fbcon_rotate.c |  40 +--
 drivers/video/fbdev/core/fbcon_rotate.h |   6 +-
 drivers/video/fbdev/core/fbcon_ud.c     | 162 ++++-----
 drivers/video/fbdev/core/softcursor.c   |  18 +-
 drivers/video/fbdev/core/tileblit.c     |  28 +-
 10 files changed, 549 insertions(+), 560 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index f9475c14f733..a2202cae0691 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -236,10 +236,10 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		       int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = DIV_ROUND_UP(vc->vc_font.width, 8), c;
-	int y = real_y(ops->p, vc->state.y);
+	int y = real_y(confb->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1;
 	char *src;
@@ -253,10 +253,10 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	attribute = get_attribute(info, c);
 	src = vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height));
 
-	if (ops->cursor_state.image.data != src ||
-	    ops->cursor_reset) {
-	    ops->cursor_state.image.data = src;
-	    cursor.set |= FB_CUR_SETIMAGE;
+	if (confb->cursor_state.image.data != src ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.data = src;
+		cursor.set |= FB_CUR_SETIMAGE;
 	}
 
 	if (attribute) {
@@ -265,46 +265,46 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		dst = kmalloc_array(w, vc->vc_font.height, GFP_ATOMIC);
 		if (!dst)
 			return;
-		kfree(ops->cursor_data);
-		ops->cursor_data = dst;
+		kfree(confb->cursor_data);
+		confb->cursor_data = dst;
 		update_attr(dst, src, attribute, vc);
 		src = dst;
 	}
 
-	if (ops->cursor_state.image.fg_color != fg ||
-	    ops->cursor_state.image.bg_color != bg ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.fg_color = fg;
-		ops->cursor_state.image.bg_color = bg;
+	if (confb->cursor_state.image.fg_color != fg ||
+	    confb->cursor_state.image.bg_color != bg ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.fg_color = fg;
+		confb->cursor_state.image.bg_color = bg;
 		cursor.set |= FB_CUR_SETCMAP;
 	}
 
-	if ((ops->cursor_state.image.dx != (vc->vc_font.width * vc->state.x)) ||
-	    (ops->cursor_state.image.dy != (vc->vc_font.height * y)) ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.dx = vc->vc_font.width * vc->state.x;
-		ops->cursor_state.image.dy = vc->vc_font.height * y;
+	if ((confb->cursor_state.image.dx != (vc->vc_font.width * vc->state.x)) ||
+	    (confb->cursor_state.image.dy != (vc->vc_font.height * y)) ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.dx = vc->vc_font.width * vc->state.x;
+		confb->cursor_state.image.dy = vc->vc_font.height * y;
 		cursor.set |= FB_CUR_SETPOS;
 	}
 
-	if (ops->cursor_state.image.height != vc->vc_font.height ||
-	    ops->cursor_state.image.width != vc->vc_font.width ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.height = vc->vc_font.height;
-		ops->cursor_state.image.width = vc->vc_font.width;
+	if (confb->cursor_state.image.height != vc->vc_font.height ||
+	    confb->cursor_state.image.width != vc->vc_font.width ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.height = vc->vc_font.height;
+		confb->cursor_state.image.width = vc->vc_font.width;
 		cursor.set |= FB_CUR_SETSIZE;
 	}
 
-	if (ops->cursor_state.hot.x || ops->cursor_state.hot.y ||
-	    ops->cursor_reset) {
-		ops->cursor_state.hot.x = cursor.hot.y = 0;
+	if (confb->cursor_state.hot.x || confb->cursor_state.hot.y ||
+	    confb->cursor_reset) {
+		confb->cursor_state.hot.x = cursor.hot.y = 0;
 		cursor.set |= FB_CUR_SETHOT;
 	}
 
 	if (cursor.set & FB_CUR_SETSIZE ||
-	    vc->vc_cursor_type != ops->p->cursor_shape ||
-	    ops->cursor_state.mask == NULL ||
-	    ops->cursor_reset) {
+	    vc->vc_cursor_type != confb->p->cursor_shape ||
+	    confb->cursor_state.mask == NULL ||
+	    confb->cursor_reset) {
 		char *mask = kmalloc_array(w, vc->vc_font.height, GFP_ATOMIC);
 		int cur_height, size, i = 0;
 		u8 msk = 0xff;
@@ -312,13 +312,13 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		if (!mask)
 			return;
 
-		kfree(ops->cursor_state.mask);
-		ops->cursor_state.mask = mask;
+		kfree(confb->cursor_state.mask);
+		confb->cursor_state.mask = mask;
 
-		ops->p->cursor_shape = vc->vc_cursor_type;
+		confb->p->cursor_shape = vc->vc_cursor_type;
 		cursor.set |= FB_CUR_SETSHAPE;
 
-		switch (CUR_SIZE(ops->p->cursor_shape)) {
+		switch (CUR_SIZE(confb->p->cursor_shape)) {
 		case CUR_NONE:
 			cur_height = 0;
 			break;
@@ -347,19 +347,19 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 			mask[i++] = msk;
 	}
 
-	ops->cursor_state.enable = enable && !use_sw;
+	confb->cursor_state.enable = enable && !use_sw;
 
 	cursor.image.data = src;
-	cursor.image.fg_color = ops->cursor_state.image.fg_color;
-	cursor.image.bg_color = ops->cursor_state.image.bg_color;
-	cursor.image.dx = ops->cursor_state.image.dx;
-	cursor.image.dy = ops->cursor_state.image.dy;
-	cursor.image.height = ops->cursor_state.image.height;
-	cursor.image.width = ops->cursor_state.image.width;
-	cursor.hot.x = ops->cursor_state.hot.x;
-	cursor.hot.y = ops->cursor_state.hot.y;
-	cursor.mask = ops->cursor_state.mask;
-	cursor.enable = ops->cursor_state.enable;
+	cursor.image.fg_color = confb->cursor_state.image.fg_color;
+	cursor.image.bg_color = confb->cursor_state.image.bg_color;
+	cursor.image.dx = confb->cursor_state.image.dx;
+	cursor.image.dy = confb->cursor_state.image.dy;
+	cursor.image.height = confb->cursor_state.image.height;
+	cursor.image.width = confb->cursor_state.image.width;
+	cursor.hot.x = confb->cursor_state.hot.x;
+	cursor.hot.y = confb->cursor_state.hot.y;
+	cursor.mask = confb->cursor_state.mask;
+	cursor.enable = confb->cursor_state.enable;
 	cursor.image.depth = 1;
 	cursor.rop = ROP_XOR;
 
@@ -369,31 +369,31 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	if (err)
 		soft_cursor(info, &cursor);
 
-	ops->cursor_reset = 0;
+	confb->cursor_reset = 0;
 }
 
 static int bit_update_start(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int err;
 
-	err = fb_pan_display(info, &ops->var);
-	ops->var.xoffset = info->var.xoffset;
-	ops->var.yoffset = info->var.yoffset;
-	ops->var.vmode = info->var.vmode;
+	err = fb_pan_display(info, &confb->var);
+	confb->var.xoffset = info->var.xoffset;
+	confb->var.yoffset = info->var.yoffset;
+	confb->var.vmode = info->var.vmode;
 	return err;
 }
 
-void fbcon_set_bitops(struct fbcon_ops *ops)
+void fbcon_set_bitops(struct fbcon *confb)
 {
-	ops->bmove = bit_bmove;
-	ops->clear = bit_clear;
-	ops->putcs = bit_putcs;
-	ops->clear_margins = bit_clear_margins;
-	ops->cursor = bit_cursor;
-	ops->update_start = bit_update_start;
-	ops->rotate_font = NULL;
-
-	if (ops->rotate)
-		fbcon_set_rotate(ops);
+	confb->bmove = bit_bmove;
+	confb->clear = bit_clear;
+	confb->putcs = bit_putcs;
+	confb->clear_margins = bit_clear_margins;
+	confb->cursor = bit_cursor;
+	confb->update_start = bit_update_start;
+	confb->rotate_font = NULL;
+
+	if (confb->rotate)
+		fbcon_set_rotate(confb);
 }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 55f5731e94c3..ac8e897be5cb 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -198,27 +198,27 @@ static struct device *fbcon_device;
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
 static inline void fbcon_set_rotation(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	if (!(info->flags & FBINFO_MISC_TILEBLITTING) &&
-	    ops->p->con_rotate < 4)
-		ops->rotate = ops->p->con_rotate;
+	    confb->p->con_rotate < 4)
+		confb->rotate = confb->p->con_rotate;
 	else
-		ops->rotate = 0;
+		confb->rotate = 0;
 }
 
 static void fbcon_rotate(struct fb_info *info, u32 rotate)
 {
-	struct fbcon_ops *ops= info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_info *fb_info;
 
-	if (!ops || ops->currcon == -1)
+	if (!confb || confb->currcon == -1)
 		return;
 
-	fb_info = fbcon_info_from_console(ops->currcon);
+	fb_info = fbcon_info_from_console(confb->currcon);
 
 	if (info == fb_info) {
-		struct fbcon_display *p = &fb_display[ops->currcon];
+		struct fbcon_display *p = &fb_display[confb->currcon];
 
 		if (rotate < 4)
 			p->con_rotate = rotate;
@@ -231,12 +231,12 @@ static void fbcon_rotate(struct fb_info *info, u32 rotate)
 
 static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct vc_data *vc;
 	struct fbcon_display *p;
 	int i;
 
-	if (!ops || ops->currcon < 0 || rotate > 3)
+	if (!confb || confb->currcon < 0 || rotate > 3)
 		return;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
@@ -254,9 +254,9 @@ static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 #else
 static inline void fbcon_set_rotation(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	ops->rotate = FB_ROTATE_UR;
+	confb->rotate = FB_ROTATE_UR;
 }
 
 static void fbcon_rotate(struct fb_info *info, u32 rotate)
@@ -272,9 +272,9 @@ static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 
 static int fbcon_get_rotate(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	return (ops) ? ops->rotate : 0;
+	return (confb) ? confb->rotate : 0;
 }
 
 static bool fbcon_skip_panic(struct fb_info *info)
@@ -291,10 +291,10 @@ static bool fbcon_skip_panic(struct fb_info *info)
 
 static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	return info->state == FBINFO_STATE_RUNNING &&
-		vc->vc_mode == KD_TEXT && !ops->graphics && !fbcon_skip_panic(info);
+		vc->vc_mode == KD_TEXT && !confb->graphics && !fbcon_skip_panic(info);
 }
 
 static int get_color(struct vc_data *vc, struct fb_info *info,
@@ -376,7 +376,7 @@ static int get_bg_color(struct vc_data *vc, struct fb_info *info, u16 c)
 
 static void fb_flashcursor(struct work_struct *work)
 {
-	struct fbcon_ops *ops = container_of(work, struct fbcon_ops, cursor_work.work);
+	struct fbcon *confb = container_of(work, struct fbcon, cursor_work.work);
 	struct fb_info *info;
 	struct vc_data *vc = NULL;
 	int c;
@@ -391,10 +391,10 @@ static void fb_flashcursor(struct work_struct *work)
 		return;
 
 	/* protected by console_lock */
-	info = ops->info;
+	info = confb->info;
 
-	if (ops->currcon != -1)
-		vc = vc_cons[ops->currcon].d;
+	if (confb->currcon != -1)
+		vc = vc_cons[confb->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
 	    fbcon_info_from_console(vc->vc_num) != info ||
@@ -404,30 +404,30 @@ static void fb_flashcursor(struct work_struct *work)
 	}
 
 	c = scr_readw((u16 *) vc->vc_pos);
-	enable = ops->cursor_flash && !ops->cursor_state.enable;
-	ops->cursor(vc, info, enable,
-		    get_fg_color(vc, info, c),
-		    get_bg_color(vc, info, c));
+	enable = confb->cursor_flash && !confb->cursor_state.enable;
+	confb->cursor(vc, info, enable,
+		      get_fg_color(vc, info, c),
+		      get_bg_color(vc, info, c));
 	console_unlock();
 
-	queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
-			   ops->cur_blink_jiffies);
+	queue_delayed_work(system_power_efficient_wq, &confb->cursor_work,
+			   confb->cur_blink_jiffies);
 }
 
 static void fbcon_add_cursor_work(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_cursor_blink)
-		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
-				   ops->cur_blink_jiffies);
+		queue_delayed_work(system_power_efficient_wq, &confb->cursor_work,
+				   confb->cur_blink_jiffies);
 }
 
 static void fbcon_del_cursor_work(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	cancel_delayed_work_sync(&ops->cursor_work);
+	cancel_delayed_work_sync(&confb->cursor_work);
 }
 
 #ifndef MODULE
@@ -587,7 +587,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 			       int cols, int rows, int new_cols, int new_rows)
 {
 	/* Need to make room for the logo */
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int cnt, erase = vc->vc_video_erase_char, step;
 	unsigned short *save = NULL, *r, *q;
 	int logo_height;
@@ -603,7 +603,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 	 */
 	if (fb_get_color_depth(&info->var, &info->fix) == 1)
 		erase &= ~0x400;
-	logo_height = fb_prepare_logo(info, ops->rotate);
+	logo_height = fb_prepare_logo(info, confb->rotate);
 	logo_lines = DIV_ROUND_UP(logo_height, vc->vc_font.height);
 	q = (unsigned short *) (vc->vc_origin +
 				vc->vc_size_row * rows);
@@ -675,15 +675,15 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 #ifdef CONFIG_FB_TILEBLITTING
 static void set_blitting_type(struct vc_data *vc, struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	ops->p = &fb_display[vc->vc_num];
+	confb->p = &fb_display[vc->vc_num];
 
 	if ((info->flags & FBINFO_MISC_TILEBLITTING))
 		fbcon_set_tileops(vc, info);
 	else {
 		fbcon_set_rotation(info);
-		fbcon_set_bitops(ops);
+		fbcon_set_bitops(confb);
 	}
 }
 
@@ -700,12 +700,12 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 #else
 static void set_blitting_type(struct vc_data *vc, struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	info->flags &= ~FBINFO_MISC_TILEBLITTING;
-	ops->p = &fb_display[vc->vc_num];
+	confb->p = &fb_display[vc->vc_num];
 	fbcon_set_rotation(info);
-	fbcon_set_bitops(ops);
+	fbcon_set_bitops(con);
 }
 
 static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
@@ -725,13 +725,13 @@ static void fbcon_release(struct fb_info *info)
 	module_put(info->fbops->owner);
 
 	if (info->fbcon_par) {
-		struct fbcon_ops *ops = info->fbcon_par;
+		struct fbcon *confb = info->fbcon_par;
 
 		fbcon_del_cursor_work(info);
-		kfree(ops->cursor_state.mask);
-		kfree(ops->cursor_data);
-		kfree(ops->cursor_src);
-		kfree(ops->fontbuffer);
+		kfree(confb->cursor_state.mask);
+		kfree(confb->cursor_data);
+		kfree(confb->cursor_src);
+		kfree(confb->fontbuffer);
 		kfree(info->fbcon_par);
 		info->fbcon_par = NULL;
 	}
@@ -739,7 +739,7 @@ static void fbcon_release(struct fb_info *info)
 
 static int fbcon_open(struct fb_info *info)
 {
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 
 	if (!try_module_get(info->fbops->owner))
 		return -ENODEV;
@@ -753,16 +753,16 @@ static int fbcon_open(struct fb_info *info)
 	}
 	unlock_fb_info(info);
 
-	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
-	if (!ops) {
+	confb = kzalloc(sizeof(*confb), GFP_KERNEL);
+	if (!confb) {
 		fbcon_release(info);
 		return -ENOMEM;
 	}
 
-	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
-	ops->info = info;
-	info->fbcon_par = ops;
-	ops->cur_blink_jiffies = HZ / 5;
+	INIT_DELAYED_WORK(&confb->cursor_work, fb_flashcursor);
+	confb->info = info;
+	info->fbcon_par = confb;
+	confb->cur_blink_jiffies = HZ / 5;
 
 	return 0;
 }
@@ -809,12 +809,12 @@ static void con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 				int unit, int show_logo)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int ret;
 
-	ops->currcon = fg_console;
+	confb->currcon = fg_console;
 
-	if (info->fbops->fb_set_par && !ops->initialized) {
+	if (info->fbops->fb_set_par && !confb->initialized) {
 		ret = info->fbops->fb_set_par(info);
 
 		if (ret)
@@ -823,8 +823,8 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 				"error code %d\n", ret);
 	}
 
-	ops->initialized = true;
-	ops->graphics = 0;
+	confb->initialized = true;
+	confb->graphics = 0;
 	fbcon_set_disp(info, &info->var, unit);
 
 	if (show_logo) {
@@ -961,7 +961,7 @@ static const char *fbcon_startup(void)
 	struct vc_data *vc = vc_cons[fg_console].d;
 	const struct font_desc *font = NULL;
 	struct fb_info *info = NULL;
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 	int rows, cols;
 
 	/*
@@ -981,10 +981,10 @@ static const char *fbcon_startup(void)
 	if (fbcon_open(info))
 		return NULL;
 
-	ops = info->fbcon_par;
-	ops->currcon = -1;
-	ops->graphics = 1;
-	ops->cur_rotate = -1;
+	confb = info->fbcon_par;
+	confb->currcon = -1;
+	confb->graphics = 1;
+	confb->cur_rotate = -1;
 
 	p->con_rotate = initial_rotation;
 	if (p->con_rotate == -1)
@@ -1007,8 +1007,8 @@ static const char *fbcon_startup(void)
 		vc->vc_font.charcount = font->charcount;
 	}
 
-	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+	cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+	rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 	cols /= vc->vc_font.width;
 	rows /= vc->vc_font.height;
 	vc_resize(vc, cols, rows);
@@ -1026,7 +1026,7 @@ static const char *fbcon_startup(void)
 static void fbcon_init(struct vc_data *vc, bool init)
 {
 	struct fb_info *info;
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 	struct vc_data **default_mode = vc->vc_display_fg;
 	struct vc_data *svc = *default_mode;
 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
@@ -1100,8 +1100,8 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	if (!*vc->uni_pagedict_loc)
 		con_copy_unimap(vc, svc);
 
-	ops = info->fbcon_par;
-	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
+	confb = info->fbcon_par;
+	confb->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
 
 	p->con_rotate = initial_rotation;
 	if (p->con_rotate == -1)
@@ -1113,8 +1113,8 @@ static void fbcon_init(struct vc_data *vc, bool init)
 
 	cols = vc->vc_cols;
 	rows = vc->vc_rows;
-	new_cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-	new_rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+	new_cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+	new_rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 	new_cols /= vc->vc_font.width;
 	new_rows /= vc->vc_font.height;
 
@@ -1126,7 +1126,7 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	 * We need to do it in fbcon_init() to prevent screen corruption.
 	 */
 	if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
-		if (info->fbops->fb_set_par && !ops->initialized) {
+		if (info->fbops->fb_set_par && !confb->initialized) {
 			ret = info->fbops->fb_set_par(info);
 
 			if (ret)
@@ -1135,10 +1135,10 @@ static void fbcon_init(struct vc_data *vc, bool init)
 					"error code %d\n", ret);
 		}
 
-		ops->initialized = true;
+		confb->initialized = true;
 	}
 
-	ops->graphics = 0;
+	confb->graphics = 0;
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
 	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
@@ -1162,12 +1162,12 @@ static void fbcon_init(struct vc_data *vc, bool init)
 	if (logo)
 		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_rows);
 
-	if (ops->rotate_font && ops->rotate_font(info, vc)) {
-		ops->rotate = FB_ROTATE_UR;
+	if (confb->rotate_font && confb->rotate_font(info, vc)) {
+		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
 
-	ops->p = &fb_display[fg_console];
+	confb->p = &fb_display[fg_console];
 }
 
 static void fbcon_free_font(struct fbcon_display *p)
@@ -1205,7 +1205,7 @@ static void fbcon_deinit(struct vc_data *vc)
 {
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_info *info;
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 	int idx;
 
 	fbcon_free_font(p);
@@ -1219,15 +1219,15 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (!info)
 		goto finished;
 
-	ops = info->fbcon_par;
+	confb = info->fbcon_par;
 
-	if (!ops)
+	if (!confb)
 		goto finished;
 
 	if (con_is_visible(vc))
 		fbcon_del_cursor_work(info);
 
-	ops->initialized = false;
+	confb->initialized = false;
 finished:
 
 	fbcon_free_font(p);
@@ -1274,7 +1274,7 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 			  unsigned int height, unsigned int width)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int fg, bg;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	u_int y_break;
@@ -1289,7 +1289,7 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 		vc->vc_top = 0;
 		/*
 		 * If the font dimensions are not an integral of the display
-		 * dimensions then the ops->clear below won't end up clearing
+		 * dimensions then the confb->clear below won't end up clearing
 		 * the margins.  Call clear_margins here in case the logo
 		 * bitmap stretched into the margin area.
 		 */
@@ -1303,11 +1303,10 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	y_break = p->vrows - p->yscroll;
 	if (sy < y_break && sy + height - 1 >= y_break) {
 		u_int b = y_break - sy;
-		ops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
-		ops->clear(vc, info, real_y(p, sy + b), sx, height - b,
-				 width, fg, bg);
+		confb->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
+		confb->clear(vc, info, real_y(p, sy + b), sx, height - b, width, fg, bg);
 	} else
-		ops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
+		confb->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
 }
 
 static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
@@ -1321,30 +1320,30 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
-			   get_fg_color(vc, info, scr_readw(s)),
-			   get_bg_color(vc, info, scr_readw(s)));
+		confb->putcs(vc, info, s, count, real_y(p, ypos), xpos,
+			     get_fg_color(vc, info, scr_readw(s)),
+			     get_bg_color(vc, info, scr_readw(s)));
 }
 
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	if (fbcon_is_active(vc, info))
-		ops->clear_margins(vc, info, margin_color, bottom_only);
+		confb->clear_margins(vc, info, margin_color, bottom_only);
 }
 
 static void fbcon_cursor(struct vc_data *vc, bool enable)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
  	int c = scr_readw((u16 *) vc->vc_pos);
 
-	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
+	confb->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
 
 	if (!fbcon_is_active(vc, info) || vc->vc_deccm != 1)
 		return;
@@ -1354,14 +1353,14 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
 	else
 		fbcon_add_cursor_work(info);
 
-	ops->cursor_flash = enable;
+	confb->cursor_flash = enable;
 
-	if (!ops->cursor)
+	if (!confb->cursor)
 		return;
 
-	ops->cursor(vc, info, enable,
-		    get_fg_color(vc, info, c),
-		    get_bg_color(vc, info, c));
+	confb->cursor(vc, info, enable,
+		      get_fg_color(vc, info, c),
+		      get_bg_color(vc, info, c));
 }
 
 static int scrollback_phys_max = 0;
@@ -1374,7 +1373,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	struct fbcon_display *p, *t;
 	struct vc_data **default_mode, *vc;
 	struct vc_data *svc;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int rows, cols;
 	unsigned long ret = 0;
 
@@ -1407,7 +1406,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	var->yoffset = info->var.yoffset;
 	var->xoffset = info->var.xoffset;
 	fb_set_var(info, var);
-	ops->var = info->var;
+	confb->var = info->var;
 	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
 	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
 	if (vc->vc_font.charcount == 256) {
@@ -1423,8 +1422,8 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	if (!*vc->uni_pagedict_loc)
 		con_copy_unimap(vc, svc);
 
-	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+	cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+	rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 	cols /= vc->vc_font.width;
 	rows /= vc->vc_font.height;
 	ret = vc_resize(vc, cols, rows);
@@ -1436,16 +1435,16 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 static __inline__ void ywrap_up(struct vc_data *vc, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	p->yscroll += count;
 	if (p->yscroll >= p->vrows)	/* Deal with wrap */
 		p->yscroll -= p->vrows;
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode |= FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode |= FB_VMODE_YWRAP;
+	confb->update_start(info);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
 		scrollback_max = scrollback_phys_max;
@@ -1455,16 +1454,16 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 static __inline__ void ywrap_down(struct vc_data *vc, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	p->yscroll -= count;
 	if (p->yscroll < 0)	/* Deal with wrap */
 		p->yscroll += p->vrows;
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode |= FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode |= FB_VMODE_YWRAP;
+	confb->update_start(info);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
 		scrollback_max = 0;
@@ -1475,19 +1474,19 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	p->yscroll += count;
 	if (p->yscroll > p->vrows - vc->vc_rows) {
-		ops->bmove(vc, info, p->vrows - vc->vc_rows,
-			    0, 0, 0, vc->vc_rows, vc->vc_cols);
+		confb->bmove(vc, info, p->vrows - vc->vc_rows,
+				  0, 0, 0, vc->vc_rows, vc->vc_cols);
 		p->yscroll -= p->vrows - vc->vc_rows;
 	}
 
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode &= ~FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode &= ~FB_VMODE_YWRAP;
+	confb->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1498,7 +1497,7 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	p->yscroll += count;
@@ -1508,10 +1507,10 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 		fbcon_redraw_move(vc, p, t + count, vc->vc_rows - count, t);
 	}
 
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode &= ~FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode &= ~FB_VMODE_YWRAP;
+	confb->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max += count;
 	if (scrollback_max > scrollback_phys_max)
@@ -1523,19 +1522,19 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	p->yscroll -= count;
 	if (p->yscroll < 0) {
-		ops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
-			    0, vc->vc_rows, vc->vc_cols);
+		confb->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
+				  0, vc->vc_rows, vc->vc_cols);
 		p->yscroll += p->vrows - vc->vc_rows;
 	}
 
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode &= ~FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode &= ~FB_VMODE_YWRAP;
+	confb->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1546,7 +1545,7 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	p->yscroll -= count;
@@ -1556,10 +1555,10 @@ static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 		fbcon_redraw_move(vc, p, t, vc->vc_rows - count, t + count);
 	}
 
-	ops->var.xoffset = 0;
-	ops->var.yoffset = p->yscroll * vc->vc_font.height;
-	ops->var.vmode &= ~FB_VMODE_YWRAP;
-	ops->update_start(info);
+	confb->var.xoffset = 0;
+	confb->var.yoffset = p->yscroll * vc->vc_font.height;
+	confb->var.vmode &= ~FB_VMODE_YWRAP;
+	confb->update_start(info);
 	fbcon_clear_margins(vc, 1);
 	scrollback_max -= count;
 	if (scrollback_max < 0)
@@ -1608,7 +1607,7 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 	unsigned short *d = (unsigned short *)
 	    (vc->vc_origin + vc->vc_size_row * line);
 	unsigned short *s = d + offset;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	while (count--) {
 		unsigned short *start = s;
@@ -1621,8 +1620,8 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 
 			if (c == scr_readw(d)) {
 				if (s > start) {
-					ops->bmove(vc, info, line + ycount, x,
-						   line, x, 1, s-start);
+					confb->bmove(vc, info, line + ycount, x,
+						     line, x, 1, s - start);
 					x += s - start + 1;
 					start = s + 1;
 				} else {
@@ -1637,8 +1636,7 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 			d++;
 		} while (s < le);
 		if (s > start)
-			ops->bmove(vc, info, line + ycount, x, line, x, 1,
-				   s-start);
+			confb->bmove(vc, info, line + ycount, x, line, x, 1, s - start);
 		console_conditional_schedule();
 		if (ycount > 0)
 			line++;
@@ -1709,7 +1707,7 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 			    int dy, int dx, int height, int width, u_int y_break)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u_int b;
 
 	if (sy < y_break && sy + height > y_break) {
@@ -1743,8 +1741,7 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 		}
 		return;
 	}
-	ops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
-		   height, width);
+	confb->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx, height, width);
 }
 
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
@@ -1971,15 +1968,13 @@ static void updatescrollmode_accel(struct fbcon_display *p,
 					struct vc_data *vc)
 {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int cap = info->flags;
 	u16 t = 0;
-	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
-				  info->fix.xpanstep);
-	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
-	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
-	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
-				   info->var.xres_virtual);
+	int ypan = FBCON_SWAP(confb->rotate, info->fix.ypanstep, info->fix.xpanstep);
+	int ywrap = FBCON_SWAP(confb->rotate, info->fix.ywrapstep, t);
+	int yres = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
+	int vyres = FBCON_SWAP(confb->rotate, info->var.yres_virtual, info->var.xres_virtual);
 	int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
 		divides(ypan, vc->vc_font.height) && vyres > yres;
 	int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
@@ -2012,11 +2007,10 @@ static void updatescrollmode(struct fbcon_display *p,
 					struct fb_info *info,
 					struct vc_data *vc)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
-	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
-				   info->var.xres_virtual);
+	int yres = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
+	int vyres = FBCON_SWAP(confb->rotate, info->var.yres_virtual, info->var.xres_virtual);
 
 	p->vrows = vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
@@ -2035,7 +2029,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			unsigned int height, bool from_user)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_var_screeninfo var = info->var;
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
@@ -2058,12 +2052,10 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			return -EINVAL;
 	}
 
-	virt_w = FBCON_SWAP(ops->rotate, width, height);
-	virt_h = FBCON_SWAP(ops->rotate, height, width);
-	virt_fw = FBCON_SWAP(ops->rotate, vc->vc_font.width,
-				 vc->vc_font.height);
-	virt_fh = FBCON_SWAP(ops->rotate, vc->vc_font.height,
-				 vc->vc_font.width);
+	virt_w = FBCON_SWAP(confb->rotate, width, height);
+	virt_h = FBCON_SWAP(confb->rotate, height, width);
+	virt_fw = FBCON_SWAP(confb->rotate, vc->vc_font.width, vc->vc_font.height);
+	virt_fh = FBCON_SWAP(confb->rotate, vc->vc_font.height, vc->vc_font.width);
 	var.xres = virt_w * virt_fw;
 	var.yres = virt_h * virt_fh;
 	x_diff = info->var.xres - var.xres;
@@ -2089,7 +2081,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			fb_set_var(info, &var);
 		}
 		var_to_display(p, &info->var, info);
-		ops->var = info->var;
+		confb->var = info->var;
 	}
 	updatescrollmode(p, info, vc);
 	return 0;
@@ -2098,13 +2090,13 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 static bool fbcon_switch(struct vc_data *vc)
 {
 	struct fb_info *info, *old_info = NULL;
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_var_screeninfo var;
 	int i, ret, prev_console;
 
 	info = fbcon_info_from_console(vc->vc_num);
-	ops = info->fbcon_par;
+	confb = info->fbcon_par;
 
 	if (logo_shown >= 0) {
 		struct vc_data *conp2 = vc_cons[logo_shown].d;
@@ -2115,7 +2107,7 @@ static bool fbcon_switch(struct vc_data *vc)
 		logo_shown = FBCON_LOGO_CANSHOW;
 	}
 
-	prev_console = ops->currcon;
+	prev_console = confb->currcon;
 	if (prev_console != -1)
 		old_info = fbcon_info_from_console(prev_console);
 	/*
@@ -2128,9 +2120,9 @@ static bool fbcon_switch(struct vc_data *vc)
 	 */
 	fbcon_for_each_registered_fb(i) {
 		if (fbcon_registered_fb[i]->fbcon_par) {
-			struct fbcon_ops *o = fbcon_registered_fb[i]->fbcon_par;
+			struct fbcon *confb = fbcon_registered_fb[i]->fbcon_par;
 
-			o->currcon = vc->vc_num;
+			confb->currcon = vc->vc_num;
 		}
 	}
 	memset(&var, 0, sizeof(struct fb_var_screeninfo));
@@ -2144,7 +2136,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	info->var.activate = var.activate;
 	var.vmode |= info->var.vmode & ~FB_VMODE_MASK;
 	fb_set_var(info, &var);
-	ops->var = info->var;
+	confb->var = info->var;
 
 	if (old_info != NULL && (old_info != info ||
 				 info->flags & FBINFO_MISC_ALWAYS_SETPAR)) {
@@ -2161,17 +2153,16 @@ static bool fbcon_switch(struct vc_data *vc)
 			fbcon_del_cursor_work(old_info);
 	}
 
-	if (!fbcon_is_active(vc, info) ||
-	    ops->blank_state != FB_BLANK_UNBLANK)
+	if (!fbcon_is_active(vc, info) || confb->blank_state != FB_BLANK_UNBLANK)
 		fbcon_del_cursor_work(info);
 	else
 		fbcon_add_cursor_work(info);
 
 	set_blitting_type(vc, info);
-	ops->cursor_reset = 1;
+	confb->cursor_reset = 1;
 
-	if (ops->rotate_font && ops->rotate_font(info, vc)) {
-		ops->rotate = FB_ROTATE_UR;
+	if (confb->rotate_font && confb->rotate_font(info, vc)) {
+		confb->rotate = FB_ROTATE_UR;
 		set_blitting_type(vc, info);
 	}
 
@@ -2202,8 +2193,8 @@ static bool fbcon_switch(struct vc_data *vc)
 	scrollback_current = 0;
 
 	if (fbcon_is_active(vc, info)) {
-	    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
-	    ops->update_start(info);
+	    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
+	    confb->update_start(info);
 	}
 
 	fbcon_set_palette(vc, color_table);
@@ -2212,7 +2203,7 @@ static bool fbcon_switch(struct vc_data *vc)
 	if (logo_shown == FBCON_LOGO_DRAW) {
 
 		logo_shown = fg_console;
-		fb_show_logo(info, ops->rotate);
+		fb_show_logo(info, confb->rotate);
 		update_region(vc,
 			      vc->vc_origin + vc->vc_size_row * vc->vc_top,
 			      vc->vc_size_row * (vc->vc_bottom -
@@ -2241,27 +2232,27 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 			bool mode_switch)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
 	if (mode_switch) {
 		struct fb_var_screeninfo var = info->var;
 
-		ops->graphics = 1;
+		confb->graphics = 1;
 
 		if (!blank) {
 			var.activate = FB_ACTIVATE_NOW | FB_ACTIVATE_FORCE |
 				FB_ACTIVATE_KD_TEXT;
 			fb_set_var(info, &var);
-			ops->graphics = 0;
-			ops->var = info->var;
+			confb->graphics = 0;
+			confb->var = info->var;
 		}
 	}
 
 	if (fbcon_is_active(vc, info)) {
-		if (ops->blank_state != blank) {
-			ops->blank_state = blank;
+		if (confb->blank_state != blank) {
+			confb->blank_state = blank;
 			fbcon_cursor(vc, !blank);
-			ops->cursor_flash = (!blank);
+			confb->cursor_flash = (!blank);
 
 			if (fb_blank(info, blank))
 				fbcon_generic_blank(vc, info, blank);
@@ -2271,8 +2262,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 			update_screen(vc);
 	}
 
-	if (mode_switch || !fbcon_is_active(vc, info) ||
-	    ops->blank_state != FB_BLANK_UNBLANK)
+	if (mode_switch || !fbcon_is_active(vc, info) || confb->blank_state != FB_BLANK_UNBLANK)
 		fbcon_del_cursor_work(info);
 	else
 		fbcon_add_cursor_work(info);
@@ -2283,10 +2273,10 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 static void fbcon_debug_enter(struct vc_data *vc)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	ops->save_graphics = ops->graphics;
-	ops->graphics = 0;
+	confb->save_graphics = confb->graphics;
+	confb->graphics = 0;
 	if (info->fbops->fb_debug_enter)
 		info->fbops->fb_debug_enter(info);
 	fbcon_set_palette(vc, color_table);
@@ -2295,9 +2285,9 @@ static void fbcon_debug_enter(struct vc_data *vc)
 static void fbcon_debug_leave(struct vc_data *vc)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	ops->graphics = ops->save_graphics;
+	confb->graphics = confb->save_graphics;
 	if (info->fbops->fb_debug_leave)
 		info->fbops->fb_debug_leave(info);
 }
@@ -2432,7 +2422,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 			     const u8 * data, int userfont)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize, ret, old_userfont, old_width, old_height, old_charcount;
 	u8 *old_data = vc->vc_font.data;
@@ -2458,8 +2448,8 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	if (resize) {
 		int cols, rows;
 
-		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+		cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+		rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 		cols /= w;
 		rows /= h;
 		ret = vc_resize(vc, cols, rows);
@@ -2651,11 +2641,11 @@ static void fbcon_invert_region(struct vc_data *vc, u16 * p, int cnt)
 void fbcon_suspended(struct fb_info *info)
 {
 	struct vc_data *vc = NULL;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	if (!ops || ops->currcon < 0)
+	if (!confb || confb->currcon < 0)
 		return;
-	vc = vc_cons[ops->currcon].d;
+	vc = vc_cons[confb->currcon].d;
 
 	/* Clear cursor, restore saved data */
 	fbcon_cursor(vc, false);
@@ -2664,27 +2654,27 @@ void fbcon_suspended(struct fb_info *info)
 void fbcon_resumed(struct fb_info *info)
 {
 	struct vc_data *vc;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	if (!ops || ops->currcon < 0)
+	if (!confb || confb->currcon < 0)
 		return;
-	vc = vc_cons[ops->currcon].d;
+	vc = vc_cons[confb->currcon].d;
 
 	update_screen(vc);
 }
 
 static void fbcon_modechanged(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct vc_data *vc;
 	struct fbcon_display *p;
 	int rows, cols;
 
-	if (!ops || ops->currcon < 0)
+	if (!confb || confb->currcon < 0)
 		return;
-	vc = vc_cons[ops->currcon].d;
+	vc = vc_cons[confb->currcon].d;
 	if (vc->vc_mode != KD_TEXT ||
-	    fbcon_info_from_console(ops->currcon) != info)
+	    fbcon_info_from_console(confb->currcon) != info)
 		return;
 
 	p = &fb_display[vc->vc_num];
@@ -2692,8 +2682,8 @@ static void fbcon_modechanged(struct fb_info *info)
 
 	if (con_is_visible(vc)) {
 		var_to_display(p, &info->var, info);
-		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+		cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+		rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 		cols /= vc->vc_font.width;
 		rows /= vc->vc_font.height;
 		vc_resize(vc, cols, rows);
@@ -2702,8 +2692,8 @@ static void fbcon_modechanged(struct fb_info *info)
 		scrollback_current = 0;
 
 		if (fbcon_is_active(vc, info)) {
-		    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
-		    ops->update_start(info);
+		    confb->var.xoffset = confb->var.yoffset = p->yscroll = 0;
+		    confb->update_start(info);
 		}
 
 		fbcon_set_palette(vc, color_table);
@@ -2713,12 +2703,12 @@ static void fbcon_modechanged(struct fb_info *info)
 
 static void fbcon_set_all_vcs(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct vc_data *vc;
 	struct fbcon_display *p;
 	int i, rows, cols, fg = -1;
 
-	if (!ops || ops->currcon < 0)
+	if (!confb || confb->currcon < 0)
 		return;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
@@ -2735,8 +2725,8 @@ static void fbcon_set_all_vcs(struct fb_info *info)
 		p = &fb_display[vc->vc_num];
 		set_blitting_type(vc, info);
 		var_to_display(p, &info->var, info);
-		cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
-		rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+		cols = FBCON_SWAP(confb->rotate, info->var.xres, info->var.yres);
+		rows = FBCON_SWAP(confb->rotate, info->var.yres, info->var.xres);
 		cols /= vc->vc_font.width;
 		rows /= vc->vc_font.height;
 		vc_resize(vc, cols, rows);
@@ -2759,13 +2749,13 @@ EXPORT_SYMBOL(fbcon_update_vcs);
 /* let fbcon check if it supports a new screen resolution */
 int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct vc_data *vc;
 	unsigned int i;
 
 	WARN_CONSOLE_UNLOCKED();
 
-	if (!ops)
+	if (!confb)
 		return 0;
 
 	/* prevent setting a screen size which is smaller than font size */
@@ -3037,15 +3027,14 @@ int fbcon_fb_registered(struct fb_info *info)
 
 void fbcon_fb_blanked(struct fb_info *info, int blank)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct vc_data *vc;
 
-	if (!ops || ops->currcon < 0)
+	if (!confb || confb->currcon < 0)
 		return;
 
-	vc = vc_cons[ops->currcon].d;
-	if (vc->vc_mode != KD_TEXT ||
-			fbcon_info_from_console(ops->currcon) != info)
+	vc = vc_cons[confb->currcon].d;
+	if (vc->vc_mode != KD_TEXT || fbcon_info_from_console(confb->currcon) != info)
 		return;
 
 	if (con_is_visible(vc)) {
@@ -3054,7 +3043,7 @@ void fbcon_fb_blanked(struct fb_info *info, int blank)
 		else
 			do_unblank_screen(0);
 	}
-	ops->blank_state = blank;
+	confb->blank_state = blank;
 }
 
 void fbcon_new_modelist(struct fb_info *info)
@@ -3244,7 +3233,7 @@ static ssize_t cursor_blink_show(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
 	struct fb_info *info;
-	struct fbcon_ops *ops;
+	struct fbcon *confb;
 	int idx, blink = -1;
 
 	console_lock();
@@ -3254,12 +3243,12 @@ static ssize_t cursor_blink_show(struct device *device,
 		goto err;
 
 	info = fbcon_registered_fb[idx];
-	ops = info->fbcon_par;
+	confb = info->fbcon_par;
 
-	if (!ops)
+	if (!confb)
 		goto err;
 
-	blink = delayed_work_pending(&ops->cursor_work);
+	blink = delayed_work_pending(&confb->cursor_work);
 err:
 	console_unlock();
 	return sysfs_emit(buf, "%d\n", blink);
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index c535d8f84356..666ed89526da 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -51,7 +51,7 @@ struct fbcon_display {
     const struct fb_videomode *mode;
 };
 
-struct fbcon_ops {
+struct fbcon {
 	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int dy, int dx, int height, int width);
 	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
@@ -186,7 +186,7 @@ static inline u_short fb_scrollmode(struct fbcon_display *fb)
 #ifdef CONFIG_FB_TILEBLITTING
 extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
 #endif
-extern void fbcon_set_bitops(struct fbcon_ops *ops);
+extern void fbcon_set_bitops(struct fbcon *confb);
 extern int  soft_cursor(struct fb_info *info, struct fb_cursor *cursor);
 
 #define FBCON_ATTRIBUTE_UNDERLINE 1
@@ -225,7 +225,7 @@ static inline int get_attribute(struct fb_info *info, u16 c)
         (i == FB_ROTATE_UR || i == FB_ROTATE_UD) ? _r : _v; })
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-extern void fbcon_set_rotate(struct fbcon_ops *ops);
+extern void fbcon_set_rotate(struct fbcon *confb);
 #else
 #define fbcon_set_rotate(x) do {} while(0)
 #endif /* CONFIG_FRAMEBUFFER_CONSOLE_ROTATION */
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 89ef4ba7e867..0f47eb4a792d 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -63,9 +63,9 @@ static void ccw_update_attr(u8 *dst, u8 *src, int attribute,
 static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vyres = GETVYRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
 
 	area.sx = sy * vc->vc_font.height;
 	area.sy = vyres - ((sx + width) * vc->vc_font.width);
@@ -80,9 +80,9 @@ static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_fillrect region;
-	u32 vyres = GETVYRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
 
 	region.color = bg;
 	region.dx = sy * vc->vc_font.height;
@@ -99,13 +99,13 @@ static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    u32 d_pitch, u32 s_pitch, u32 cellsize,
 				    struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = (vc->vc_font.height + 7) >> 3;
 	u8 *src;
 
 	while (cnt--) {
-		src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize;
+		src = confb->fontbuffer + (scr_readw(s--) & charmask) * cellsize;
 
 		if (attr) {
 			ccw_update_attr(buf, src, attr, vc);
@@ -130,7 +130,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 		      int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u32 width = (vc->vc_font.height + 7)/8;
 	u32 cellsize = width * vc->vc_font.width;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -139,9 +139,9 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 	u32 cnt, pitch, size;
 	u32 attribute = get_attribute(info, scr_readw(s));
 	u8 *dst, *buf = NULL;
-	u32 vyres = GETVYRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	image.fg_color = fg;
@@ -221,28 +221,28 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		       int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
-	int y = real_y(ops->p, vc->state.y);
+	int y = real_y(confb->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
-	u32 vyres = GETVYRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	cursor.set = 0;
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = ops->fontbuffer + ((c & charmask) * (w * vc->vc_font.width));
+	src = confb->fontbuffer + ((c & charmask) * (w * vc->vc_font.width));
 
-	if (ops->cursor_state.image.data != src ||
-	    ops->cursor_reset) {
-	    ops->cursor_state.image.data = src;
-	    cursor.set |= FB_CUR_SETIMAGE;
+	if (confb->cursor_state.image.data != src ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.data = src;
+		cursor.set |= FB_CUR_SETIMAGE;
 	}
 
 	if (attribute) {
@@ -251,49 +251,49 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		dst = kmalloc_array(w, vc->vc_font.width, GFP_ATOMIC);
 		if (!dst)
 			return;
-		kfree(ops->cursor_data);
-		ops->cursor_data = dst;
+		kfree(confb->cursor_data);
+		confb->cursor_data = dst;
 		ccw_update_attr(dst, src, attribute, vc);
 		src = dst;
 	}
 
-	if (ops->cursor_state.image.fg_color != fg ||
-	    ops->cursor_state.image.bg_color != bg ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.fg_color = fg;
-		ops->cursor_state.image.bg_color = bg;
+	if (confb->cursor_state.image.fg_color != fg ||
+	    confb->cursor_state.image.bg_color != bg ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.fg_color = fg;
+		confb->cursor_state.image.bg_color = bg;
 		cursor.set |= FB_CUR_SETCMAP;
 	}
 
-	if (ops->cursor_state.image.height != vc->vc_font.width ||
-	    ops->cursor_state.image.width != vc->vc_font.height ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.height = vc->vc_font.width;
-		ops->cursor_state.image.width = vc->vc_font.height;
+	if (confb->cursor_state.image.height != vc->vc_font.width ||
+	    confb->cursor_state.image.width != vc->vc_font.height ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.height = vc->vc_font.width;
+		confb->cursor_state.image.width = vc->vc_font.height;
 		cursor.set |= FB_CUR_SETSIZE;
 	}
 
 	dx = y * vc->vc_font.height;
 	dy = vyres - ((vc->state.x + 1) * vc->vc_font.width);
 
-	if (ops->cursor_state.image.dx != dx ||
-	    ops->cursor_state.image.dy != dy ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.dx = dx;
-		ops->cursor_state.image.dy = dy;
+	if (confb->cursor_state.image.dx != dx ||
+	    confb->cursor_state.image.dy != dy ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.dx = dx;
+		confb->cursor_state.image.dy = dy;
 		cursor.set |= FB_CUR_SETPOS;
 	}
 
-	if (ops->cursor_state.hot.x || ops->cursor_state.hot.y ||
-	    ops->cursor_reset) {
-		ops->cursor_state.hot.x = cursor.hot.y = 0;
+	if (confb->cursor_state.hot.x || confb->cursor_state.hot.y ||
+	    confb->cursor_reset) {
+		confb->cursor_state.hot.x = cursor.hot.y = 0;
 		cursor.set |= FB_CUR_SETHOT;
 	}
 
 	if (cursor.set & FB_CUR_SETSIZE ||
-	    vc->vc_cursor_type != ops->p->cursor_shape ||
-	    ops->cursor_state.mask == NULL ||
-	    ops->cursor_reset) {
+	    vc->vc_cursor_type != confb->p->cursor_shape ||
+	    confb->cursor_state.mask == NULL ||
+	    confb->cursor_reset) {
 		char *tmp, *mask = kmalloc_array(w, vc->vc_font.width,
 						 GFP_ATOMIC);
 		int cur_height, size, i = 0;
@@ -309,13 +309,13 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 			return;
 		}
 
-		kfree(ops->cursor_state.mask);
-		ops->cursor_state.mask = mask;
+		kfree(confb->cursor_state.mask);
+		confb->cursor_state.mask = mask;
 
-		ops->p->cursor_shape = vc->vc_cursor_type;
+		confb->p->cursor_shape = vc->vc_cursor_type;
 		cursor.set |= FB_CUR_SETSHAPE;
 
-		switch (CUR_SIZE(ops->p->cursor_shape)) {
+		switch (CUR_SIZE(confb->p->cursor_shape)) {
 		case CUR_NONE:
 			cur_height = 0;
 			break;
@@ -348,19 +348,19 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		kfree(tmp);
 	}
 
-	ops->cursor_state.enable = enable && !use_sw;
+	confb->cursor_state.enable = enable && !use_sw;
 
 	cursor.image.data = src;
-	cursor.image.fg_color = ops->cursor_state.image.fg_color;
-	cursor.image.bg_color = ops->cursor_state.image.bg_color;
-	cursor.image.dx = ops->cursor_state.image.dx;
-	cursor.image.dy = ops->cursor_state.image.dy;
-	cursor.image.height = ops->cursor_state.image.height;
-	cursor.image.width = ops->cursor_state.image.width;
-	cursor.hot.x = ops->cursor_state.hot.x;
-	cursor.hot.y = ops->cursor_state.hot.y;
-	cursor.mask = ops->cursor_state.mask;
-	cursor.enable = ops->cursor_state.enable;
+	cursor.image.fg_color = confb->cursor_state.image.fg_color;
+	cursor.image.bg_color = confb->cursor_state.image.bg_color;
+	cursor.image.dx = confb->cursor_state.image.dx;
+	cursor.image.dy = confb->cursor_state.image.dy;
+	cursor.image.height = confb->cursor_state.image.height;
+	cursor.image.width = confb->cursor_state.image.width;
+	cursor.hot.x = confb->cursor_state.hot.x;
+	cursor.hot.y = confb->cursor_state.hot.y;
+	cursor.mask = confb->cursor_state.mask;
+	cursor.enable = confb->cursor_state.enable;
 	cursor.image.depth = 1;
 	cursor.rop = ROP_XOR;
 
@@ -370,32 +370,32 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	if (err)
 		soft_cursor(info, &cursor);
 
-	ops->cursor_reset = 0;
+	confb->cursor_reset = 0;
 }
 
 static int ccw_update_start(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u32 yoffset;
-	u32 vyres = GETVYRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
 	int err;
 
-	yoffset = (vyres - info->var.yres) - ops->var.xoffset;
-	ops->var.xoffset = ops->var.yoffset;
-	ops->var.yoffset = yoffset;
-	err = fb_pan_display(info, &ops->var);
-	ops->var.xoffset = info->var.xoffset;
-	ops->var.yoffset = info->var.yoffset;
-	ops->var.vmode = info->var.vmode;
+	yoffset = (vyres - info->var.yres) - confb->var.xoffset;
+	confb->var.xoffset = confb->var.yoffset;
+	confb->var.yoffset = yoffset;
+	err = fb_pan_display(info, &confb->var);
+	confb->var.xoffset = info->var.xoffset;
+	confb->var.yoffset = info->var.yoffset;
+	confb->var.vmode = info->var.vmode;
 	return err;
 }
 
-void fbcon_rotate_ccw(struct fbcon_ops *ops)
+void fbcon_rotate_ccw(struct fbcon *confb)
 {
-	ops->bmove = ccw_bmove;
-	ops->clear = ccw_clear;
-	ops->putcs = ccw_putcs;
-	ops->clear_margins = ccw_clear_margins;
-	ops->cursor = ccw_cursor;
-	ops->update_start = ccw_update_start;
+	confb->bmove = ccw_bmove;
+	confb->clear = ccw_clear;
+	confb->putcs = ccw_putcs;
+	confb->clear_margins = ccw_clear_margins;
+	confb->cursor = ccw_cursor;
+	confb->update_start = ccw_update_start;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index b9dac7940fb7..9d9cd316b74f 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -48,9 +48,9 @@ static void cw_update_attr(u8 *dst, u8 *src, int attribute,
 static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
 	area.sx = vxres - ((sy + height) * vc->vc_font.height);
 	area.sy = sx * vc->vc_font.width;
@@ -65,9 +65,9 @@ static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_fillrect region;
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
 	region.color = bg;
 	region.dx = vxres - ((sy + height) * vc->vc_font.height);
@@ -84,13 +84,13 @@ static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    u32 d_pitch, u32 s_pitch, u32 cellsize,
 				    struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = (vc->vc_font.height + 7) >> 3;
 	u8 *src;
 
 	while (cnt--) {
-		src = ops->fontbuffer + (scr_readw(s++) & charmask)*cellsize;
+		src = confb->fontbuffer + (scr_readw(s++) & charmask) * cellsize;
 
 		if (attr) {
 			cw_update_attr(buf, src, attr, vc);
@@ -115,7 +115,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 		      int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u32 width = (vc->vc_font.height + 7)/8;
 	u32 cellsize = width * vc->vc_font.width;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -124,9 +124,9 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 	u32 cnt, pitch, size;
 	u32 attribute = get_attribute(info, scr_readw(s));
 	u8 *dst, *buf = NULL;
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	image.fg_color = fg;
@@ -204,28 +204,28 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		      int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
-	int y = real_y(ops->p, vc->state.y);
+	int y = real_y(confb->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	cursor.set = 0;
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = ops->fontbuffer + ((c & charmask) * (w * vc->vc_font.width));
+	src = confb->fontbuffer + ((c & charmask) * (w * vc->vc_font.width));
 
-	if (ops->cursor_state.image.data != src ||
-	    ops->cursor_reset) {
-	    ops->cursor_state.image.data = src;
-	    cursor.set |= FB_CUR_SETIMAGE;
+	if (confb->cursor_state.image.data != src ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.data = src;
+		cursor.set |= FB_CUR_SETIMAGE;
 	}
 
 	if (attribute) {
@@ -234,49 +234,49 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		dst = kmalloc_array(w, vc->vc_font.width, GFP_ATOMIC);
 		if (!dst)
 			return;
-		kfree(ops->cursor_data);
-		ops->cursor_data = dst;
+		kfree(confb->cursor_data);
+		confb->cursor_data = dst;
 		cw_update_attr(dst, src, attribute, vc);
 		src = dst;
 	}
 
-	if (ops->cursor_state.image.fg_color != fg ||
-	    ops->cursor_state.image.bg_color != bg ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.fg_color = fg;
-		ops->cursor_state.image.bg_color = bg;
+	if (confb->cursor_state.image.fg_color != fg ||
+	    confb->cursor_state.image.bg_color != bg ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.fg_color = fg;
+		confb->cursor_state.image.bg_color = bg;
 		cursor.set |= FB_CUR_SETCMAP;
 	}
 
-	if (ops->cursor_state.image.height != vc->vc_font.width ||
-	    ops->cursor_state.image.width != vc->vc_font.height ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.height = vc->vc_font.width;
-		ops->cursor_state.image.width = vc->vc_font.height;
+	if (confb->cursor_state.image.height != vc->vc_font.width ||
+	    confb->cursor_state.image.width != vc->vc_font.height ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.height = vc->vc_font.width;
+		confb->cursor_state.image.width = vc->vc_font.height;
 		cursor.set |= FB_CUR_SETSIZE;
 	}
 
 	dx = vxres - ((y * vc->vc_font.height) + vc->vc_font.height);
 	dy = vc->state.x * vc->vc_font.width;
 
-	if (ops->cursor_state.image.dx != dx ||
-	    ops->cursor_state.image.dy != dy ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.dx = dx;
-		ops->cursor_state.image.dy = dy;
+	if (confb->cursor_state.image.dx != dx ||
+	    confb->cursor_state.image.dy != dy ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.dx = dx;
+		confb->cursor_state.image.dy = dy;
 		cursor.set |= FB_CUR_SETPOS;
 	}
 
-	if (ops->cursor_state.hot.x || ops->cursor_state.hot.y ||
-	    ops->cursor_reset) {
-		ops->cursor_state.hot.x = cursor.hot.y = 0;
+	if (confb->cursor_state.hot.x || confb->cursor_state.hot.y ||
+	    confb->cursor_reset) {
+		confb->cursor_state.hot.x = cursor.hot.y = 0;
 		cursor.set |= FB_CUR_SETHOT;
 	}
 
 	if (cursor.set & FB_CUR_SETSIZE ||
-	    vc->vc_cursor_type != ops->p->cursor_shape ||
-	    ops->cursor_state.mask == NULL ||
-	    ops->cursor_reset) {
+	    vc->vc_cursor_type != confb->p->cursor_shape ||
+	    confb->cursor_state.mask == NULL ||
+	    confb->cursor_reset) {
 		char *tmp, *mask = kmalloc_array(w, vc->vc_font.width,
 						 GFP_ATOMIC);
 		int cur_height, size, i = 0;
@@ -292,13 +292,13 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 			return;
 		}
 
-		kfree(ops->cursor_state.mask);
-		ops->cursor_state.mask = mask;
+		kfree(confb->cursor_state.mask);
+		confb->cursor_state.mask = mask;
 
-		ops->p->cursor_shape = vc->vc_cursor_type;
+		confb->p->cursor_shape = vc->vc_cursor_type;
 		cursor.set |= FB_CUR_SETSHAPE;
 
-		switch (CUR_SIZE(ops->p->cursor_shape)) {
+		switch (CUR_SIZE(confb->p->cursor_shape)) {
 		case CUR_NONE:
 			cur_height = 0;
 			break;
@@ -331,19 +331,19 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		kfree(tmp);
 	}
 
-	ops->cursor_state.enable = enable && !use_sw;
+	confb->cursor_state.enable = enable && !use_sw;
 
 	cursor.image.data = src;
-	cursor.image.fg_color = ops->cursor_state.image.fg_color;
-	cursor.image.bg_color = ops->cursor_state.image.bg_color;
-	cursor.image.dx = ops->cursor_state.image.dx;
-	cursor.image.dy = ops->cursor_state.image.dy;
-	cursor.image.height = ops->cursor_state.image.height;
-	cursor.image.width = ops->cursor_state.image.width;
-	cursor.hot.x = ops->cursor_state.hot.x;
-	cursor.hot.y = ops->cursor_state.hot.y;
-	cursor.mask = ops->cursor_state.mask;
-	cursor.enable = ops->cursor_state.enable;
+	cursor.image.fg_color = confb->cursor_state.image.fg_color;
+	cursor.image.bg_color = confb->cursor_state.image.bg_color;
+	cursor.image.dx = confb->cursor_state.image.dx;
+	cursor.image.dy = confb->cursor_state.image.dy;
+	cursor.image.height = confb->cursor_state.image.height;
+	cursor.image.width = confb->cursor_state.image.width;
+	cursor.hot.x = confb->cursor_state.hot.x;
+	cursor.hot.y = confb->cursor_state.hot.y;
+	cursor.mask = confb->cursor_state.mask;
+	cursor.enable = confb->cursor_state.enable;
 	cursor.image.depth = 1;
 	cursor.rop = ROP_XOR;
 
@@ -353,32 +353,32 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	if (err)
 		soft_cursor(info, &cursor);
 
-	ops->cursor_reset = 0;
+	confb->cursor_reset = 0;
 }
 
 static int cw_update_start(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
-	u32 vxres = GETVXRES(ops->p, info);
+	struct fbcon *confb = info->fbcon_par;
+	u32 vxres = GETVXRES(confb->p, info);
 	u32 xoffset;
 	int err;
 
-	xoffset = vxres - (info->var.xres + ops->var.yoffset);
-	ops->var.yoffset = ops->var.xoffset;
-	ops->var.xoffset = xoffset;
-	err = fb_pan_display(info, &ops->var);
-	ops->var.xoffset = info->var.xoffset;
-	ops->var.yoffset = info->var.yoffset;
-	ops->var.vmode = info->var.vmode;
+	xoffset = vxres - (info->var.xres + confb->var.yoffset);
+	confb->var.yoffset = confb->var.xoffset;
+	confb->var.xoffset = xoffset;
+	err = fb_pan_display(info, &confb->var);
+	confb->var.xoffset = info->var.xoffset;
+	confb->var.yoffset = info->var.yoffset;
+	confb->var.vmode = info->var.vmode;
 	return err;
 }
 
-void fbcon_rotate_cw(struct fbcon_ops *ops)
+void fbcon_rotate_cw(struct fbcon *confb)
 {
-	ops->bmove = cw_bmove;
-	ops->clear = cw_clear;
-	ops->putcs = cw_putcs;
-	ops->clear_margins = cw_clear_margins;
-	ops->cursor = cw_cursor;
-	ops->update_start = cw_update_start;
+	confb->bmove = cw_bmove;
+	confb->clear = cw_clear;
+	confb->putcs = cw_putcs;
+	confb->clear_margins = cw_clear_margins;
+	confb->cursor = cw_cursor;
+	confb->update_start = cw_update_start;
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index ec3c883400f7..acf8e72ae00b 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -20,32 +20,32 @@
 
 static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int len, err = 0;
 	int s_cellsize, d_cellsize, i;
 	const u8 *src;
 	u8 *dst;
 
-	if (vc->vc_font.data == ops->fontdata &&
-	    ops->p->con_rotate == ops->cur_rotate)
+	if (vc->vc_font.data == confb->fontdata &&
+	    confb->p->con_rotate == confb->cur_rotate)
 		goto finished;
 
-	src = ops->fontdata = vc->vc_font.data;
-	ops->cur_rotate = ops->p->con_rotate;
+	src = confb->fontdata = vc->vc_font.data;
+	confb->cur_rotate = confb->p->con_rotate;
 	len = vc->vc_font.charcount;
 	s_cellsize = ((vc->vc_font.width + 7)/8) *
 		vc->vc_font.height;
 	d_cellsize = s_cellsize;
 
-	if (ops->rotate == FB_ROTATE_CW ||
-	    ops->rotate == FB_ROTATE_CCW)
+	if (confb->rotate == FB_ROTATE_CW ||
+	    confb->rotate == FB_ROTATE_CCW)
 		d_cellsize = ((vc->vc_font.height + 7)/8) *
 			vc->vc_font.width;
 
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
 
-	if (ops->fd_size < d_cellsize * len) {
+	if (confb->fd_size < d_cellsize * len) {
 		dst = kmalloc_array(len, d_cellsize, GFP_KERNEL);
 
 		if (dst == NULL) {
@@ -53,15 +53,15 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 			goto finished;
 		}
 
-		ops->fd_size = d_cellsize * len;
-		kfree(ops->fontbuffer);
-		ops->fontbuffer = dst;
+		confb->fd_size = d_cellsize * len;
+		kfree(confb->fontbuffer);
+		confb->fontbuffer = dst;
 	}
 
-	dst = ops->fontbuffer;
-	memset(dst, 0, ops->fd_size);
+	dst = confb->fontbuffer;
+	memset(dst, 0, confb->fd_size);
 
-	switch (ops->rotate) {
+	switch (confb->rotate) {
 	case FB_ROTATE_UD:
 		for (i = len; i--; ) {
 			rotate_ud(src, dst, vc->vc_font.width,
@@ -93,19 +93,19 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 	return err;
 }
 
-void fbcon_set_rotate(struct fbcon_ops *ops)
+void fbcon_set_rotate(struct fbcon *confb)
 {
-	ops->rotate_font = fbcon_rotate_font;
+	confb->rotate_font = fbcon_rotate_font;
 
-	switch(ops->rotate) {
+	switch (confb->rotate) {
 	case FB_ROTATE_CW:
-		fbcon_rotate_cw(ops);
+		fbcon_rotate_cw(confb);
 		break;
 	case FB_ROTATE_UD:
-		fbcon_rotate_ud(ops);
+		fbcon_rotate_ud(confb);
 		break;
 	case FB_ROTATE_CCW:
-		fbcon_rotate_ccw(ops);
+		fbcon_rotate_ccw(confb);
 		break;
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
index 01cbe303b8a2..5909513bd7b4 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -90,7 +90,7 @@ static inline void rotate_ccw(const char *in, char *out, u32 width, u32 height)
 	}
 }
 
-extern void fbcon_rotate_cw(struct fbcon_ops *ops);
-extern void fbcon_rotate_ud(struct fbcon_ops *ops);
-extern void fbcon_rotate_ccw(struct fbcon_ops *ops);
+extern void fbcon_rotate_cw(struct fbcon *confb);
+extern void fbcon_rotate_ud(struct fbcon *confb);
+extern void fbcon_rotate_ccw(struct fbcon *confb);
 #endif
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 0af7913a2abd..b0ab9babf639 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -48,10 +48,10 @@ static void ud_update_attr(u8 *dst, u8 *src, int attribute,
 static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int dy, int dx, int height, int width)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vyres = GETVYRES(ops->p, info);
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
 	area.sy = vyres - ((sy + height) * vc->vc_font.height);
 	area.sx = vxres - ((sx + width) * vc->vc_font.width);
@@ -66,10 +66,10 @@ static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width, int fg, int bg)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	struct fb_fillrect region;
-	u32 vyres = GETVYRES(ops->p, info);
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
 	region.color = bg;
 	region.dy = vyres - ((sy + height) * vc->vc_font.height);
@@ -86,13 +86,13 @@ static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    u32 d_pitch, u32 s_pitch, u32 cellsize,
 				    struct fb_image *image, u8 *buf, u8 *dst)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = vc->vc_font.width >> 3;
 	u8 *src;
 
 	while (cnt--) {
-		src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize;
+		src = confb->fontbuffer + (scr_readw(s--) & charmask) * cellsize;
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -119,7 +119,7 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 				      struct fb_image *image, u8 *buf,
 				      u8 *dst)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
@@ -127,7 +127,7 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 	u8 *src;
 
 	while (cnt--) {
-		src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize;
+		src = confb->fontbuffer + (scr_readw(s--) & charmask) * cellsize;
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -152,7 +152,7 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 		      int fg, int bg)
 {
 	struct fb_image image;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	u32 width = (vc->vc_font.width + 7)/8;
 	u32 cellsize = width * vc->vc_font.height;
 	u32 maxcnt = info->pixmap.size/cellsize;
@@ -161,10 +161,10 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 	u32 mod = vc->vc_font.width % 8, cnt, pitch, size;
 	u32 attribute = get_attribute(info, scr_readw(s));
 	u8 *dst, *buf = NULL;
-	u32 vyres = GETVYRES(ops->p, info);
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	image.fg_color = fg;
@@ -251,29 +251,29 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		      int fg, int bg)
 {
 	struct fb_cursor cursor;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.width + 7) >> 3, c;
-	int y = real_y(ops->p, vc->state.y);
+	int y = real_y(confb->p, vc->state.y);
 	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
-	u32 vyres = GETVYRES(ops->p, info);
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 
-	if (!ops->fontbuffer)
+	if (!confb->fontbuffer)
 		return;
 
 	cursor.set = 0;
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = ops->fontbuffer + ((c & charmask) * (w * vc->vc_font.height));
+	src = confb->fontbuffer + ((c & charmask) * (w * vc->vc_font.height));
 
-	if (ops->cursor_state.image.data != src ||
-	    ops->cursor_reset) {
-	    ops->cursor_state.image.data = src;
-	    cursor.set |= FB_CUR_SETIMAGE;
+	if (confb->cursor_state.image.data != src ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.data = src;
+		cursor.set |= FB_CUR_SETIMAGE;
 	}
 
 	if (attribute) {
@@ -282,49 +282,49 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		dst = kmalloc_array(w, vc->vc_font.height, GFP_ATOMIC);
 		if (!dst)
 			return;
-		kfree(ops->cursor_data);
-		ops->cursor_data = dst;
+		kfree(confb->cursor_data);
+		confb->cursor_data = dst;
 		ud_update_attr(dst, src, attribute, vc);
 		src = dst;
 	}
 
-	if (ops->cursor_state.image.fg_color != fg ||
-	    ops->cursor_state.image.bg_color != bg ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.fg_color = fg;
-		ops->cursor_state.image.bg_color = bg;
+	if (confb->cursor_state.image.fg_color != fg ||
+	    confb->cursor_state.image.bg_color != bg ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.fg_color = fg;
+		confb->cursor_state.image.bg_color = bg;
 		cursor.set |= FB_CUR_SETCMAP;
 	}
 
-	if (ops->cursor_state.image.height != vc->vc_font.height ||
-	    ops->cursor_state.image.width != vc->vc_font.width ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.height = vc->vc_font.height;
-		ops->cursor_state.image.width = vc->vc_font.width;
+	if (confb->cursor_state.image.height != vc->vc_font.height ||
+	    confb->cursor_state.image.width != vc->vc_font.width ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.height = vc->vc_font.height;
+		confb->cursor_state.image.width = vc->vc_font.width;
 		cursor.set |= FB_CUR_SETSIZE;
 	}
 
 	dy = vyres - ((y * vc->vc_font.height) + vc->vc_font.height);
 	dx = vxres - ((vc->state.x * vc->vc_font.width) + vc->vc_font.width);
 
-	if (ops->cursor_state.image.dx != dx ||
-	    ops->cursor_state.image.dy != dy ||
-	    ops->cursor_reset) {
-		ops->cursor_state.image.dx = dx;
-		ops->cursor_state.image.dy = dy;
+	if (confb->cursor_state.image.dx != dx ||
+	    confb->cursor_state.image.dy != dy ||
+	    confb->cursor_reset) {
+		confb->cursor_state.image.dx = dx;
+		confb->cursor_state.image.dy = dy;
 		cursor.set |= FB_CUR_SETPOS;
 	}
 
-	if (ops->cursor_state.hot.x || ops->cursor_state.hot.y ||
-	    ops->cursor_reset) {
-		ops->cursor_state.hot.x = cursor.hot.y = 0;
+	if (confb->cursor_state.hot.x || confb->cursor_state.hot.y ||
+	    confb->cursor_reset) {
+		confb->cursor_state.hot.x = cursor.hot.y = 0;
 		cursor.set |= FB_CUR_SETHOT;
 	}
 
 	if (cursor.set & FB_CUR_SETSIZE ||
-	    vc->vc_cursor_type != ops->p->cursor_shape ||
-	    ops->cursor_state.mask == NULL ||
-	    ops->cursor_reset) {
+	    vc->vc_cursor_type != confb->p->cursor_shape ||
+	    confb->cursor_state.mask == NULL ||
+	    confb->cursor_reset) {
 		char *mask = kmalloc_array(w, vc->vc_font.height, GFP_ATOMIC);
 		int cur_height, size, i = 0;
 		u8 msk = 0xff;
@@ -332,13 +332,13 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 		if (!mask)
 			return;
 
-		kfree(ops->cursor_state.mask);
-		ops->cursor_state.mask = mask;
+		kfree(confb->cursor_state.mask);
+		confb->cursor_state.mask = mask;
 
-		ops->p->cursor_shape = vc->vc_cursor_type;
+		confb->p->cursor_shape = vc->vc_cursor_type;
 		cursor.set |= FB_CUR_SETSHAPE;
 
-		switch (CUR_SIZE(ops->p->cursor_shape)) {
+		switch (CUR_SIZE(confb->p->cursor_shape)) {
 		case CUR_NONE:
 			cur_height = 0;
 			break;
@@ -371,19 +371,19 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 			mask[i++] = ~msk;
 	}
 
-	ops->cursor_state.enable = enable && !use_sw;
+	confb->cursor_state.enable = enable && !use_sw;
 
 	cursor.image.data = src;
-	cursor.image.fg_color = ops->cursor_state.image.fg_color;
-	cursor.image.bg_color = ops->cursor_state.image.bg_color;
-	cursor.image.dx = ops->cursor_state.image.dx;
-	cursor.image.dy = ops->cursor_state.image.dy;
-	cursor.image.height = ops->cursor_state.image.height;
-	cursor.image.width = ops->cursor_state.image.width;
-	cursor.hot.x = ops->cursor_state.hot.x;
-	cursor.hot.y = ops->cursor_state.hot.y;
-	cursor.mask = ops->cursor_state.mask;
-	cursor.enable = ops->cursor_state.enable;
+	cursor.image.fg_color = confb->cursor_state.image.fg_color;
+	cursor.image.bg_color = confb->cursor_state.image.bg_color;
+	cursor.image.dx = confb->cursor_state.image.dx;
+	cursor.image.dy = confb->cursor_state.image.dy;
+	cursor.image.height = confb->cursor_state.image.height;
+	cursor.image.width = confb->cursor_state.image.width;
+	cursor.hot.x = confb->cursor_state.hot.x;
+	cursor.hot.y = confb->cursor_state.hot.y;
+	cursor.mask = confb->cursor_state.mask;
+	cursor.enable = confb->cursor_state.enable;
 	cursor.image.depth = 1;
 	cursor.rop = ROP_XOR;
 
@@ -393,36 +393,36 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	if (err)
 		soft_cursor(info, &cursor);
 
-	ops->cursor_reset = 0;
+	confb->cursor_reset = 0;
 }
 
 static int ud_update_start(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int xoffset, yoffset;
-	u32 vyres = GETVYRES(ops->p, info);
-	u32 vxres = GETVXRES(ops->p, info);
+	u32 vyres = GETVYRES(confb->p, info);
+	u32 vxres = GETVXRES(confb->p, info);
 	int err;
 
-	xoffset = vxres - info->var.xres - ops->var.xoffset;
-	yoffset = vyres - info->var.yres - ops->var.yoffset;
+	xoffset = vxres - info->var.xres - confb->var.xoffset;
+	yoffset = vyres - info->var.yres - confb->var.yoffset;
 	if (yoffset < 0)
 		yoffset += vyres;
-	ops->var.xoffset = xoffset;
-	ops->var.yoffset = yoffset;
-	err = fb_pan_display(info, &ops->var);
-	ops->var.xoffset = info->var.xoffset;
-	ops->var.yoffset = info->var.yoffset;
-	ops->var.vmode = info->var.vmode;
+	confb->var.xoffset = xoffset;
+	confb->var.yoffset = yoffset;
+	err = fb_pan_display(info, &confb->var);
+	confb->var.xoffset = info->var.xoffset;
+	confb->var.yoffset = info->var.yoffset;
+	confb->var.vmode = info->var.vmode;
 	return err;
 }
 
-void fbcon_rotate_ud(struct fbcon_ops *ops)
+void fbcon_rotate_ud(struct fbcon *confb)
 {
-	ops->bmove = ud_bmove;
-	ops->clear = ud_clear;
-	ops->putcs = ud_putcs;
-	ops->clear_margins = ud_clear_margins;
-	ops->cursor = ud_cursor;
-	ops->update_start = ud_update_start;
+	confb->bmove = ud_bmove;
+	confb->clear = ud_clear;
+	confb->putcs = ud_putcs;
+	confb->clear_margins = ud_clear_margins;
+	confb->cursor = ud_cursor;
+	confb->update_start = ud_update_start;
 }
diff --git a/drivers/video/fbdev/core/softcursor.c b/drivers/video/fbdev/core/softcursor.c
index 29e5b21cf373..52f34276d53b 100644
--- a/drivers/video/fbdev/core/softcursor.c
+++ b/drivers/video/fbdev/core/softcursor.c
@@ -21,7 +21,7 @@
 
 int soft_cursor(struct fb_info *info, struct fb_cursor *cursor)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	unsigned int scan_align = info->pixmap.scan_align - 1;
 	unsigned int buf_align = info->pixmap.buf_align - 1;
 	unsigned int i, size, dsize, s_pitch, d_pitch;
@@ -34,19 +34,19 @@ int soft_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	s_pitch = (cursor->image.width + 7) >> 3;
 	dsize = s_pitch * cursor->image.height;
 
-	if (dsize + sizeof(struct fb_image) != ops->cursor_size) {
-		kfree(ops->cursor_src);
-		ops->cursor_size = dsize + sizeof(struct fb_image);
+	if (dsize + sizeof(struct fb_image) != confb->cursor_size) {
+		kfree(confb->cursor_src);
+		confb->cursor_size = dsize + sizeof(struct fb_image);
 
-		ops->cursor_src = kmalloc(ops->cursor_size, GFP_ATOMIC);
-		if (!ops->cursor_src) {
-			ops->cursor_size = 0;
+		confb->cursor_src = kmalloc(confb->cursor_size, GFP_ATOMIC);
+		if (!confb->cursor_src) {
+			confb->cursor_size = 0;
 			return -ENOMEM;
 		}
 	}
 
-	src = ops->cursor_src + sizeof(struct fb_image);
-	image = (struct fb_image *)ops->cursor_src;
+	src = confb->cursor_src + sizeof(struct fb_image);
+	image = (struct fb_image *)confb->cursor_src;
 	*image = cursor->image;
 	d_pitch = (s_pitch + scan_align) & ~scan_align;
 
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index d342b90c42b7..1ba8987302e6 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -151,34 +151,34 @@ static void tile_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 
 static int tile_update_start(struct fb_info *info)
 {
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 	int err;
 
-	err = fb_pan_display(info, &ops->var);
-	ops->var.xoffset = info->var.xoffset;
-	ops->var.yoffset = info->var.yoffset;
-	ops->var.vmode = info->var.vmode;
+	err = fb_pan_display(info, &confb->var);
+	confb->var.xoffset = info->var.xoffset;
+	confb->var.yoffset = info->var.yoffset;
+	confb->var.vmode = info->var.vmode;
 	return err;
 }
 
 void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)
 {
 	struct fb_tilemap map;
-	struct fbcon_ops *ops = info->fbcon_par;
+	struct fbcon *confb = info->fbcon_par;
 
-	ops->bmove = tile_bmove;
-	ops->clear = tile_clear;
-	ops->putcs = tile_putcs;
-	ops->clear_margins = tile_clear_margins;
-	ops->cursor = tile_cursor;
-	ops->update_start = tile_update_start;
+	confb->bmove = tile_bmove;
+	confb->clear = tile_clear;
+	confb->putcs = tile_putcs;
+	confb->clear_margins = tile_clear_margins;
+	confb->cursor = tile_cursor;
+	confb->update_start = tile_update_start;
 
-	if (ops->p) {
+	if (confb->p) {
 		map.width = vc->vc_font.width;
 		map.height = vc->vc_font.height;
 		map.depth = 1;
 		map.length = vc->vc_font.charcount;
-		map.data = ops->p->fontdata;
+		map.data = confb->p->fontdata;
 		info->tileops->fb_settile(info, &map);
 	}
 }
-- 
2.50.1

