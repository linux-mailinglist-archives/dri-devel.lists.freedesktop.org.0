Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA94F3F77
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169D410EE7B;
	Tue,  5 Apr 2022 21:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A610E45C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso411914wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OS2lajXUA0KG0+izVe6d6aMsv88+OgOENkHaPVcoRDk=;
 b=bIxTPIKjtRB43qDMQCvC4uWgOTAFtpBnR6m/eENHDpS92xvrUpAKWNT/TlasdgVypc
 F1beZAuuxZJ+ZdlJkOyAj0aBG7Rmqkw4ATMzX4aZy+rprTULFJt3Ek3hI4bBMOgO0G4n
 5k/F/3/XRY+d0IOj9FsRc5Ouh+W+snrBfCdls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS2lajXUA0KG0+izVe6d6aMsv88+OgOENkHaPVcoRDk=;
 b=6/Q/r7ETktmKmPDkjq8P15Mg7dWxQ2kGyGZfnfDYk/P3zpSPUKm0ljsz08TmyDvSUK
 2dCeCSdf9h7ltDzLLr+j5c4XxfCq1HOLnR6QgiSLHkBwT/45su5vHDzUcwpeo5DxbzOn
 mEGLhAJnGONEuviPgo6NeU1LG0lOH7QxHv54Ypkg7QstWFj1fpcDzlqZK5stzE86MgIo
 0iIFruNStRKAnNArT7IZ2oxd33aSuJxMGj9H5yqAU6nPAc1jXyF6PxEJnyA9iM6XSEJN
 uob06B0GymC9iVq9QG5YRDDzFb2PvMMlV2tWVIU0tnyIJZM1qY78HML7rhYbnFldj4Zc
 LY0Q==
X-Gm-Message-State: AOAM533pixdBErtLCf3QR03pkh3pYT9hSmB4hFBdg3/t5HG/ZKVuG/ck
 iN6/L1d3iKzPSOs5r9CjvyuCMfrXYayJ4cBLG0k=
X-Google-Smtp-Source: ABdhPJzMkdR8YYCbnATEgbV6+5ShrWFFtX9S39FWSZYzIjaysJwHNbbZrdetAxkNxN1dlXbm0Fq2BQ==
X-Received: by 2002:a05:600c:3d0e:b0:38c:9b5e:52c0 with SMTP id
 bh14-20020a05600c3d0e00b0038c9b5e52c0mr4508462wmb.3.1649192624611; 
 Tue, 05 Apr 2022 14:03:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 03/17] fbcon: Introduce wrapper for console->fb_info lookup
Date: Tue,  5 Apr 2022 23:03:21 +0200
Message-Id: <20220405210335.3434130-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Half of it is protected by console_lock, but the other half is a lot
more awkward: Registration/deregistration of fbdev are serialized, but
we don't really clear out anything in con2fb_map and so there's
potential for use-after free mixups.

First step is to encapsulate the lookup.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
index e925bb608e25..b75e638cb83d 100644
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
@@ -199,7 +211,7 @@ static void fbcon_rotate(struct fb_info *info, u32 rotate)
 	if (!ops || ops->currcon == -1)
 		return;
 
-	fb_info = registered_fb[con2fb_map[ops->currcon]];
+	fb_info = fbcon_info_from_console(ops->currcon);
 
 	if (info == fb_info) {
 		struct fbcon_display *p = &fb_display[ops->currcon];
@@ -226,7 +238,7 @@ static void fbcon_rotate_all(struct fb_info *info, u32 rotate)
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		vc = vc_cons[i].d;
 		if (!vc || vc->vc_mode != KD_TEXT ||
-		    registered_fb[con2fb_map[i]] != info)
+		    fbcon_info_from_console(i) != info)
 			continue;
 
 		p = &fb_display[vc->vc_num];
@@ -356,7 +368,7 @@ static void fb_flashcursor(struct work_struct *work)
 		vc = vc_cons[ops->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
- 	    registered_fb[con2fb_map[vc->vc_num]] != info ||
+	    fbcon_info_from_console(vc->vc_num) != info ||
 	    vc->vc_deccm != 1) {
 		console_unlock();
 		return;
@@ -791,7 +803,7 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 	if (show_logo) {
 		struct vc_data *fg_vc = vc_cons[fg_console].d;
 		struct fb_info *fg_info =
-			registered_fb[con2fb_map[fg_console]];
+			fbcon_info_from_console(fg_console);
 
 		fbcon_prepare_logo(fg_vc, fg_info, fg_vc->vc_cols,
 				   fg_vc->vc_rows, fg_vc->vc_cols,
@@ -1014,7 +1026,7 @@ static void fbcon_init(struct vc_data *vc, int init)
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
 
@@ -1392,7 +1404,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 
 static __inline__ void ywrap_up(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1411,7 +1423,7 @@ static __inline__ void ywrap_up(struct vc_data *vc, int count)
 
 static __inline__ void ywrap_down(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1430,7 +1442,7 @@ static __inline__ void ywrap_down(struct vc_data *vc, int count)
 
 static __inline__ void ypan_up(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -1454,7 +1466,7 @@ static __inline__ void ypan_up(struct vc_data *vc, int count)
 
 static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1478,7 +1490,7 @@ static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
 
 static __inline__ void ypan_down(struct vc_data *vc, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
@@ -1502,7 +1514,7 @@ static __inline__ void ypan_down(struct vc_data *vc, int count)
 
 static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
@@ -1666,7 +1678,7 @@ static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
 static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
 			    int dy, int dx, int height, int width, u_int y_break)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	u_int b;
 
@@ -1708,7 +1720,7 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
 			int height, int width)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	if (fbcon_is_inactive(vc, info))
@@ -1731,7 +1743,7 @@ static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
 static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		enum con_scroll dir, unsigned int count)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int scroll_partial = info->flags & FBINFO_PARTIAL_PAN_OK;
 
@@ -1996,7 +2008,7 @@ static void updatescrollmode(struct fbcon_display *p,
 static int fbcon_resize(struct vc_data *vc, unsigned int width, 
 			unsigned int height, unsigned int user)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_var_screeninfo var = info->var;
@@ -2065,7 +2077,7 @@ static int fbcon_switch(struct vc_data *vc)
 	struct fb_var_screeninfo var;
 	int i, ret, prev_console;
 
-	info = registered_fb[con2fb_map[vc->vc_num]];
+	info = fbcon_info_from_console(vc->vc_num);
 	ops = info->fbcon_par;
 
 	if (logo_shown >= 0) {
@@ -2079,7 +2091,7 @@ static int fbcon_switch(struct vc_data *vc)
 
 	prev_console = ops->currcon;
 	if (prev_console != -1)
-		old_info = registered_fb[con2fb_map[prev_console]];
+		old_info = fbcon_info_from_console(prev_console);
 	/*
 	 * FIXME: If we have multiple fbdev's loaded, we need to
 	 * update all info->currcon.  Perhaps, we can place this
@@ -2202,7 +2214,7 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 
 static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	if (mode_switch) {
@@ -2244,7 +2256,7 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 
 static int fbcon_debug_enter(struct vc_data *vc)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	ops->save_graphics = ops->graphics;
@@ -2257,7 +2269,7 @@ static int fbcon_debug_enter(struct vc_data *vc)
 
 static int fbcon_debug_leave(struct vc_data *vc)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	ops->graphics = ops->save_graphics;
@@ -2393,7 +2405,7 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 			     const u8 * data, int userfont)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize;
@@ -2447,7 +2459,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 			  unsigned int flags)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	unsigned charcount = font->charcount;
 	int w = font->width;
 	int h = font->height;
@@ -2511,7 +2523,7 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 
 static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, char *name)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	const struct font_desc *f;
 
 	if (!name)
@@ -2535,7 +2547,7 @@ static struct fb_cmap palette_cmap = {
 
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
 {
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	int i, j, k, depth;
 	u8 val;
 
@@ -2651,7 +2663,7 @@ static void fbcon_modechanged(struct fb_info *info)
 		return;
 	vc = vc_cons[ops->currcon].d;
 	if (vc->vc_mode != KD_TEXT ||
-	    registered_fb[con2fb_map[ops->currcon]] != info)
+	    fbcon_info_from_console(ops->currcon) != info)
 		return;
 
 	p = &fb_display[vc->vc_num];
@@ -2691,7 +2703,7 @@ static void fbcon_set_all_vcs(struct fb_info *info)
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		vc = vc_cons[i].d;
 		if (!vc || vc->vc_mode != KD_TEXT ||
-		    registered_fb[con2fb_map[i]] != info)
+		    fbcon_info_from_console(i) != info)
 			continue;
 
 		if (con_is_visible(vc)) {
@@ -2954,7 +2966,7 @@ void fbcon_fb_blanked(struct fb_info *info, int blank)
 
 	vc = vc_cons[ops->currcon].d;
 	if (vc->vc_mode != KD_TEXT ||
-			registered_fb[con2fb_map[ops->currcon]] != info)
+			fbcon_info_from_console(ops->currcon) != info)
 		return;
 
 	if (con_is_visible(vc)) {
@@ -2974,7 +2986,7 @@ void fbcon_new_modelist(struct fb_info *info)
 	const struct fb_videomode *mode;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		if (registered_fb[con2fb_map[i]] != info)
+		if (fbcon_info_from_console(i) != info)
 			continue;
 		if (!fb_display[i].mode)
 			continue;
-- 
2.34.1

