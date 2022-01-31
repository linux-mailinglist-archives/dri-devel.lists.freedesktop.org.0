Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E314A50D4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED410E49D;
	Mon, 31 Jan 2022 21:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241810E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so199975wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9cn8imFuUzvwepZlKJ58OBUUul6Q5sMSH10T7m8dj8=;
 b=TA4yPVpB6b5IanWkNA17w/YtvzecZn463AtS5N5iweUFl9YOdws7reKOb0rBfewDpP
 Um4mw4eT/j7AvGuu8hcKHynpUAF/ypwISn0CGKj2nhF3s/zzFG6H6+BSPzHwdZ3qS+mp
 3lePVux6FtNZFZpEXHajvD0qtMU1lw3JKRzI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9cn8imFuUzvwepZlKJ58OBUUul6Q5sMSH10T7m8dj8=;
 b=8Dl5ak1bmw7ARhfI9NizoYyIp0IkTUUmGX0OZvKWwKShsdlTwxQ9VtIHXhHTyNdELH
 GXqIBKTMKPMspo3NVlYgq8SaRyn6bpevEElD74qrlrJg7G8yFw+tsEAQqqYcJjrHoq6K
 /vdCII/yVX/IDZ01zXjS+vMYGM1d9uos449EU9iPaY4G5QgbKLVHmGTonW86EjyScJGY
 sRGM4I2DHP3IX7MVM0LA6L8huYVqMlzHuNUxQCXUa64XwvootshZBHIu9lT8U6Izaicp
 UTEzEsp+BsTsB6xuCWZCob9Rk92284zVUI2BJQz1qds11ugnU11aL0ivpJuHdp8uPw6S
 Zxsg==
X-Gm-Message-State: AOAM533zHcQDPd6lLu/wUTt2Ag/769VHHxc3AuMox2XYz1/7NOY+MLVI
 AHdtYfCJQ/ZHtYT4j7FywOMljfBrRIYJuA==
X-Google-Smtp-Source: ABdhPJxCbKEz0wktfxliLLRUrRMsL2X2hfkjdle8Xa4xgE4OB1zLnz+w0aW/cDTzNAAmInfO0kOPNQ==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr28569704wmc.121.1643663199779; 
 Mon, 31 Jan 2022 13:06:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:39 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/21] fbcon: Introduce wrapper for console->fb_info lookup
Date: Mon, 31 Jan 2022 22:05:36 +0100
Message-Id: <20220131210552.482606-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Half of it is protected by console_lock, but the other half is a lot
more awkward: Registration/deregistration of fbdev are serialized, but
we don't really clear out anything in con2fb_map and so there's
potential for use-after free mixups.

First step is to encapsulate the lookup.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 76 ++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2a575620ef59..8f971de35885 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -110,6 +110,18 @@ static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 static signed char con2fb_map[MAX_NR_CONSOLES];
 static signed char con2fb_map_boot[MAX_NR_CONSOLES];
 
+static struct fb_info *fbcon_info_from_console(int console)
+{
+	WARN_CONSOLE_UNLOCKED();
+
+	/*
+	 * Note that only con2fb_map is protected by the console lock,
+	 * registered_fb is protected by a separate mutex. This lookup can
+	 * therefore race.
+	 */
+	return registered_fb[con2fb_map[console]];
+}
+
 static int logo_lines;
 /* logo_shown is an index to vc_cons when >= 0; otherwise follows FBCON_LOGO
    enums.  */
@@ -197,7 +209,7 @@ static void fbcon_rotate(struct fb_info *info, u32 rotate)
 	if (!ops || ops->currcon == -1)
 		return;
 
-	fb_info = registered_fb[con2fb_map[ops->currcon]];
+	fb_info = fbcon_info_from_console(ops->currcon);
 
 	if (info == fb_info) {
 		struct fbcon_display *p = &fb_display[ops->currcon];
@@ -224,7 +236,7 @@ static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		vc = vc_cons[i].d;
 		if (!vc || vc->vc_mode != KD_TEXT ||
-		    registered_fb[con2fb_map[i]] != info)
+		    fbcon_info_from_console(i) != info)
 			continue;
 
 		p = &fb_display[vc->vc_num];
@@ -354,7 +366,7 @@ static void fb_flashcursor(struct work_struct *work)
 		vc = vc_cons[ops->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
- 	    registered_fb[con2fb_map[vc->vc_num]] != info ||
+	    fbcon_info_from_console(vc->vc_num) != info ||
 	    vc->vc_deccm != 1) {
 		console_unlock();
 		return;
@@ -789,7 +801,7 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 	if (show_logo) {
 		struct vc_data *fg_vc = vc_cons[fg_console].d;
 		struct fb_info *fg_info =
-			registered_fb[con2fb_map[fg_console]];
+			fbcon_info_from_console(fg_console);
 
 		fbcon_prepare_logo(fg_vc, fg_info, fg_vc->vc_cols,
 				   fg_vc->vc_rows, fg_vc->vc_cols,
@@ -1012,7 +1024,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	if (con2fb_map[vc->vc_num] == -1)
 		con2fb_map[vc->vc_num] = info_idx;
 
-	info = registered_fb[con2fb_map[vc->vc_num]];
+	info = fbcon_info_from_console(vc->vc_num);
 
 	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
 		logo_shown = FBCON_LOGO_DONTSHOW;
@@ -1231,7 +1243,7 @@ static void fbcon_deinit(struct vc_data *vc)
 static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
 			int width)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	struct fbcon_display *p = &fb_display[vc->vc_num];
@@ -1269,7 +1281,7 @@ static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
 static void fbcon_putcs(struct vc_data *vc, const unsigned short *s,
 			int count, int ypos, int xpos)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -1289,7 +1301,7 @@ static void fbcon_putc(struct vc_data *vc, int c, int ypos, int xpos)
 
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	if (!fbcon_is_inactive(vc, info))
@@ -1298,7 +1310,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 
 static void fbcon_cursor(struct vc_data *vc, int mode)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
  	int c = scr_readw((u16 *) vc->vc_pos);
 
@@ -1427,7 +1439,7 @@ static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
 
 static __inline__ void ywrap_up(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1446,7 +1458,7 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 
 static __inline__ void ywrap_down(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1465,7 +1477,7 @@ static __inline__ void ywrap_down(struct vc_data *vc, int count)
 
 static __inline__ void ypan_up(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -1489,7 +1501,7 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 
 static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1513,7 +1525,7 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 
 static __inline__ void ypan_down(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -1537,7 +1549,7 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 
 static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1562,7 +1574,7 @@ static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
 			    int dy, int dx, int height, int width, u_int y_break)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	u_int b;
 
@@ -1604,7 +1616,7 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
 			int height, int width)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	if (fbcon_is_inactive(vc, info))
@@ -1733,7 +1745,7 @@ static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
 static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		enum con_scroll dir, unsigned int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
 	int scroll_partial = info->flags & FBINFO_PARTIAL_PAN_OK;
@@ -2013,7 +2025,7 @@ static void updatescrollmode(struct fbcon_display *p,
 static int fbcon_resize(struct vc_data *vc, unsigned int width, 
 			unsigned int height, unsigned int user)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_var_screeninfo var = info->var;
@@ -2082,7 +2094,7 @@ static int fbcon_switch(struct vc_data *vc)
 	struct fb_var_screeninfo var;
 	int i, ret, prev_console;
 
-	info = registered_fb[con2fb_map[vc->vc_num]];
+	info = fbcon_info_from_console(vc->vc_num);
 	ops = info->fbcon_par;
 
 	if (logo_shown >= 0) {
@@ -2096,7 +2108,7 @@ static int fbcon_switch(struct vc_data *vc)
 
 	prev_console = ops->currcon;
 	if (prev_console != -1)
-		old_info = registered_fb[con2fb_map[prev_console]];
+		old_info = fbcon_info_from_console(prev_console);
 	/*
 	 * FIXME: If we have multiple fbdev's loaded, we need to
 	 * update all info->currcon.  Perhaps, we can place this
@@ -2219,7 +2231,7 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 
 static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	if (mode_switch) {
@@ -2261,7 +2273,7 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 
 static int fbcon_debug_enter(struct vc_data *vc)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	ops->save_graphics = ops->graphics;
@@ -2274,7 +2286,7 @@ static int fbcon_debug_enter(struct vc_data *vc)
 
 static int fbcon_debug_leave(struct vc_data *vc)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	ops->graphics = ops->save_graphics;
@@ -2410,7 +2422,7 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 			     const u8 * data, int userfont)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize;
@@ -2464,7 +2476,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 			  unsigned int flags)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	unsigned charcount = font->charcount;
 	int w = font->width;
 	int h = font->height;
@@ -2528,7 +2540,7 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 
 static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, char *name)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	const struct font_desc *f;
 
 	if (!name)
@@ -2552,7 +2564,7 @@ static struct fb_cmap palette_cmap = {
 
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	int i, j, k, depth;
 	u8 val;
 
@@ -2668,7 +2680,7 @@ static void fbcon_modechanged(struct fb_info *info)
 		return;
 	vc = vc_cons[ops->currcon].d;
 	if (vc->vc_mode != KD_TEXT ||
-	    registered_fb[con2fb_map[ops->currcon]] != info)
+	    fbcon_info_from_console(ops->currcon) != info)
 		return;
 
 	p = &fb_display[vc->vc_num];
@@ -2708,7 +2720,7 @@ static void fbcon_set_all_vcs(struct fb_info *info)
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		vc = vc_cons[i].d;
 		if (!vc || vc->vc_mode != KD_TEXT ||
-		    registered_fb[con2fb_map[i]] != info)
+		    fbcon_info_from_console(i) != info)
 			continue;
 
 		if (con_is_visible(vc)) {
@@ -2971,7 +2983,7 @@ void fbcon_fb_blanked(struct fb_info *info, int blank)
 
 	vc = vc_cons[ops->currcon].d;
 	if (vc->vc_mode != KD_TEXT ||
-			registered_fb[con2fb_map[ops->currcon]] != info)
+			fbcon_info_from_console(ops->currcon) != info)
 		return;
 
 	if (con_is_visible(vc)) {
@@ -2991,7 +3003,7 @@ void fbcon_new_modelist(struct fb_info *info)
 	const struct fb_videomode *mode;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		if (registered_fb[con2fb_map[i]] != info)
+		if (fbcon_info_from_console(i) != info)
 			continue;
 		if (!fb_display[i].mode)
 			continue;
-- 
2.33.0

