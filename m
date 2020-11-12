Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF92B04D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E206E218;
	Thu, 12 Nov 2020 12:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19876E218
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:16:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id m13so4016208pgl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPQ4TOsr/Zn4JKDK9zKQyfsUBs8Lur4NckSKEQ2T9Us=;
 b=AIARY+rFNzoLDqv93OqHzkS3m5skWiZGsLcPDoeOhAIrk2Kl22iYeHrl/Oa09tIDtR
 24/iQTLmYLUIPorErg3lQSWvU+rC4SzoT+eXsE8ojD5iYm+T7JL7qArjgOdv5GHv4Q/K
 bCLMuo2dZWtlzwqWSMh57mRq0Ducxtws73JzRsmBqJr8lASHkbe4TQy5XEXxk6yyNGpL
 asqBmp18Z4VhKwOSK6N+p2fHn/EirjPMLV8yhtQajS/ehA584kkbFNVPdfOC8DJumzUV
 VectLo7bvWuaNMxNCyKv7sG0VunXSsNTiL7BoK13xjtz7Z9n+qq+IhJyRhF9lzplom1y
 Qczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPQ4TOsr/Zn4JKDK9zKQyfsUBs8Lur4NckSKEQ2T9Us=;
 b=YZddrcR5m2EASFSuGb0jla6qiqEf7CZSNpnsWsPzzcwIEVQqS8qyTJo+wan6Jmbe0V
 SKNPCRtgRrhdxdFs+xBPcDBIjutDulmFdklcIklId6pjrC/XMhCzdN7ukc0VGNL1oYbp
 fIMii++aNItF/R7x4LNNICJK7dMW4oawU8A7a8iiaA0rgP1ontT7AADqaHT42mQzy70r
 zxL4xQOy9H4Y2O3phsNVAa0HQgjpJJq7WhsLt6AVKEsFaUCFMfqs6toNVx5wphDFLpD2
 zxRXIKJ7PB6l3px/eDFetninZO/T34mEim2yH0ttKUwkzD597AteHp/BBim9GnxrCNd6
 d/Vg==
X-Gm-Message-State: AOAM530I6DPMl3DPSe3KEa1rar0quK01Bj3s8wWanWwVSeqymYh9qFTu
 UG6mf9YtSfqqAfMGzLRv9A==
X-Google-Smtp-Source: ABdhPJxCOvSZJjgV8dmpjz1absHf9rtM/YAUdxiPjEAYsj3UD951nAJSsafqEKqv/yrVgqyHrCCCDg==
X-Received: by 2002:a17:90a:8b0e:: with SMTP id
 y14mr3967234pjn.57.1605183373347; 
 Thu, 12 Nov 2020 04:16:13 -0800 (PST)
Received: from localhost.localdomain ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id d11sm6907485pjm.18.2020.11.12.04.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 04:16:12 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 RFC 5/5] fbcon: Avoid using FNTCHARCNT() and hard-coded
 built-in font charcount
Date: Thu, 12 Nov 2020 07:15:22 -0500
Message-Id: <e460a5780e54e3022661d5f09555144583b4cc59.1605169912.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1605169912.git.yepeilin.cs@gmail.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For user-provided fonts, the framebuffer layer is using a magic
negative-indexing macro, FNTCHARCNT(), to keep track of their number of
characters:

	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])

For built-in fonts, it is using hard-coded values (256). This results in
something like the following:

		map.length = (ops->p->userfont) ?
			FNTCHARCNT(ops->p->fontdata) : 256;

This is unsatisfactory. In fact, there is already a `charcount` field in
our virtual console descriptor (see `struct console_font` inside `struct
vc_data`), let us use it:

		map.length = vc->vc_font.charcount;

Recently we added a `charcount` field to `struct font_desc`. Use it to set
`vc->vc_font.charcount` properly. The idea is:

  - We only use FNTCHARCNT() on `vc->vc_font.data` and `p->fontdata`.
    Assume FNTCHARCNT() is working as intended;
  - Whenever `vc->vc_font.data` is set, also set `vc->vc_font.charcount`
    properly;
  - We can now replace `FNTCHARCNT(vc->vc_font.data)` with
    `vc->vc_font.charcount`;
  - Since `p->fontdata` always point to the same font data buffer with
    `vc->vc_font.data`, we can also replace `FNTCHARCNT(p->fontdata)` with
    `vc->vc_font.charcount`.

In conclusion, set `vc->vc_font.charcount` properly in fbcon_startup(),
fbcon_init(), fbcon_set_disp() and fbcon_do_set_font(), then replace
FNTCHARCNT() with `vc->vc_font.charcount`. No more if-else between
negative-indexing macros and hard-coded values.

Do not include <linux/font.h> in fbcon_rotate.c and tileblit.c, since they
no longer need it.

Depends on patch "Fonts: Add charcount field to font_desc".

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
v2: https://lore.kernel.org/lkml/20201028155139.1220549-1-yepeilin.cs@gmail.com/

Boot-tested only, thus the "RFC". Looking forward to suggestions about how
to test this properly. Thank you!

I am not very sure about the statement "`p->fontdata` always point to the
same font data buffer with `vc->vc_font.data`". It is concluded from code
reading.

Change in v3:
  - Do not touch fbcon_copy_font() since we removed it in patch "console:
    Delete unused con_font_copy() callback implementations"

Changes in v2:
  - Try avoid using FNTCHARCNT() altogether, instead of only changing a
    little bit (Daniel)
  - Set `vc->vc_font.charcount` properly, in fbcon_startup(),
    fbcon_init(), fbcon_set_disp() and fbcon_do_set_font()
  - Replace hard-coded 256 whenever possible

 drivers/video/fbdev/core/fbcon.c        | 57 +++++++++----------------
 drivers/video/fbdev/core/fbcon_rotate.c |  3 +-
 drivers/video/fbdev/core/tileblit.c     |  4 +-
 3 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 26d1b0916692..06520667fc07 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1004,7 +1004,7 @@ static const char *fbcon_startup(void)
 		vc->vc_font.width = font->width;
 		vc->vc_font.height = font->height;
 		vc->vc_font.data = (void *)(p->fontdata = font->data);
-		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
+		vc->vc_font.charcount = font->charcount;
 	} else {
 		p->fontdata = vc->vc_font.data;
 	}
@@ -1032,7 +1032,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	struct vc_data **default_mode = vc->vc_display_fg;
 	struct vc_data *svc = *default_mode;
 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
-	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
+	int logo = 1, new_rows, new_cols, rows, cols;
 	int cap, ret;
 
 	if (WARN_ON(info_idx == -1))
@@ -1068,6 +1068,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 						    fvc->vc_font.data);
 			vc->vc_font.width = fvc->vc_font.width;
 			vc->vc_font.height = fvc->vc_font.height;
+			vc->vc_font.charcount = fvc->vc_font.charcount;
 			p->userfont = t->userfont;
 
 			if (p->userfont)
@@ -1083,17 +1084,13 @@ static void fbcon_init(struct vc_data *vc, int init)
 			vc->vc_font.width = font->width;
 			vc->vc_font.height = font->height;
 			vc->vc_font.data = (void *)(p->fontdata = font->data);
-			vc->vc_font.charcount = 256; /* FIXME  Need to
-							support more fonts */
+			vc->vc_font.charcount = font->charcount;
 		}
 	}
 
-	if (p->userfont)
-		charcnt = FNTCHARCNT(p->fontdata);
-
 	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
 	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
-	if (charcnt == 256) {
+	if (vc->vc_font.charcount == 256) {
 		vc->vc_hi_font_mask = 0;
 	} else {
 		vc->vc_hi_font_mask = 0x100;
@@ -1358,7 +1355,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	struct vc_data **default_mode, *vc;
 	struct vc_data *svc;
 	struct fbcon_ops *ops = info->fbcon_par;
-	int rows, cols, charcnt = 256;
+	int rows, cols;
 
 	p = &fb_display[unit];
 
@@ -1378,12 +1375,11 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 		vc->vc_font.data = (void *)(p->fontdata = t->fontdata);
 		vc->vc_font.width = (*default_mode)->vc_font.width;
 		vc->vc_font.height = (*default_mode)->vc_font.height;
+		vc->vc_font.charcount = (*default_mode)->vc_font.charcount;
 		p->userfont = t->userfont;
 		if (p->userfont)
 			REFCOUNT(p->fontdata)++;
 	}
-	if (p->userfont)
-		charcnt = FNTCHARCNT(p->fontdata);
 
 	var->activate = FB_ACTIVATE_NOW;
 	info->var.activate = var->activate;
@@ -1393,7 +1389,7 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 	ops->var = info->var;
 	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
 	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
-	if (charcnt == 256) {
+	if (vc->vc_font.charcount == 256) {
 		vc->vc_hi_font_mask = 0;
 	} else {
 		vc->vc_hi_font_mask = 0x100;
@@ -2027,7 +2023,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		 */
 		if (pitch <= 0)
 			return -EINVAL;
-		size = CALC_FONTSZ(vc->vc_font.height, pitch, FNTCHARCNT(vc->vc_font.data));
+		size = CALC_FONTSZ(vc->vc_font.height, pitch, vc->vc_font.charcount);
 		if (size > FNTSIZE(vc->vc_font.data))
 			return -EINVAL;
 	}
@@ -2075,7 +2071,7 @@ static int fbcon_switch(struct vc_data *vc)
 	struct fbcon_ops *ops;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fb_var_screeninfo var;
-	int i, ret, prev_console, charcnt = 256;
+	int i, ret, prev_console;
 
 	info = registered_fb[con2fb_map[vc->vc_num]];
 	ops = info->fbcon_par;
@@ -2152,10 +2148,7 @@ static int fbcon_switch(struct vc_data *vc)
 	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
 	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
 
-	if (p->userfont)
-		charcnt = FNTCHARCNT(vc->vc_font.data);
-
-	if (charcnt > 256)
+	if (vc->vc_font.charcount > 256)
 		vc->vc_complement_mask <<= 1;
 
 	updatescrollmode(p, info, vc);
@@ -2405,31 +2398,27 @@ static void set_vc_hi_font(struct vc_data *vc, bool set)
 	}
 }
 
-static int fbcon_do_set_font(struct vc_data *vc, int w, int h,
+static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 			     const u8 * data, int userfont)
 {
 	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	int resize;
-	int cnt;
 	char *old_data = NULL;
 
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	if (p->userfont)
 		old_data = vc->vc_font.data;
-	if (userfont)
-		cnt = FNTCHARCNT(data);
-	else
-		cnt = 256;
 	vc->vc_font.data = (void *)(p->fontdata = data);
 	if ((p->userfont = userfont))
 		REFCOUNT(data)++;
 	vc->vc_font.width = w;
 	vc->vc_font.height = h;
-	if (vc->vc_hi_font_mask && cnt == 256)
+	vc->vc_font.charcount = charcount;
+	if (vc->vc_hi_font_mask && charcount == 256)
 		set_vc_hi_font(vc, false);
-	else if (!vc->vc_hi_font_mask && cnt == 512)
+	else if (!vc->vc_hi_font_mask && charcount == 512)
 		set_vc_hi_font(vc, true);
 
 	if (resize) {
@@ -2496,9 +2485,10 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 	if (!new_data)
 		return -ENOMEM;
 
+	memset(new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
+
 	new_data += FONT_EXTRA_WORDS * sizeof(int);
 	FNTSIZE(new_data) = size;
-	FNTCHARCNT(new_data) = charcount;
 	REFCOUNT(new_data) = 0;	/* usage counter */
 	for (i=0; i< charcount; i++) {
 		memcpy(new_data + i*h*pitch, data +  i*32*pitch, h*pitch);
@@ -2524,7 +2514,7 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 			break;
 		}
 	}
-	return fbcon_do_set_font(vc, font->width, font->height, new_data, 1);
+	return fbcon_do_set_font(vc, font->width, font->height, charcount, new_data, 1);
 }
 
 static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, char *name)
@@ -2540,7 +2530,7 @@ static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, cha
 
 	font->width = f->width;
 	font->height = f->height;
-	return fbcon_do_set_font(vc, f->width, f->height, f->data, 0);
+	return fbcon_do_set_font(vc, f->width, f->height, f->charcount, f->data, 0);
 }
 
 static u16 palette_red[16];
@@ -3009,7 +2999,6 @@ void fbcon_get_requirement(struct fb_info *info,
 			   struct fb_blit_caps *caps)
 {
 	struct vc_data *vc;
-	struct fbcon_display *p;
 
 	if (caps->flags) {
 		int i, charcnt;
@@ -3018,11 +3007,9 @@ void fbcon_get_requirement(struct fb_info *info,
 			vc = vc_cons[i].d;
 			if (vc && vc->vc_mode == KD_TEXT &&
 			    info->node == con2fb_map[i]) {
-				p = &fb_display[i];
 				caps->x |= 1 << (vc->vc_font.width - 1);
 				caps->y |= 1 << (vc->vc_font.height - 1);
-				charcnt = (p->userfont) ?
-					FNTCHARCNT(p->fontdata) : 256;
+				charcnt = vc->vc_font.charcount;
 				if (caps->len < charcnt)
 					caps->len = charcnt;
 			}
@@ -3032,11 +3019,9 @@ void fbcon_get_requirement(struct fb_info *info,
 
 		if (vc && vc->vc_mode == KD_TEXT &&
 		    info->node == con2fb_map[fg_console]) {
-			p = &fb_display[fg_console];
 			caps->x = 1 << (vc->vc_font.width - 1);
 			caps->y = 1 << (vc->vc_font.height - 1);
-			caps->len = (p->userfont) ?
-				FNTCHARCNT(p->fontdata) : 256;
+			caps->len = vc->vc_font.charcount;
 		}
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index ac72d4f85f7d..ef1d421c261a 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -14,7 +14,6 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
-#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 #include "fbcon_rotate.h"
@@ -33,7 +32,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 
 	src = ops->fontdata = vc->vc_font.data;
 	ops->cur_rotate = ops->p->con_rotate;
-	len = (!ops->p->userfont) ? 256 : FNTCHARCNT(src);
+	len = vc->vc_font.charcount;
 	s_cellsize = ((vc->vc_font.width + 7)/8) *
 		vc->vc_font.height;
 	d_cellsize = s_cellsize;
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 628fe5e010c0..e2cc0cb6d50e 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -13,7 +13,6 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
-#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 
@@ -145,8 +144,7 @@ void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)
 		map.width = vc->vc_font.width;
 		map.height = vc->vc_font.height;
 		map.depth = 1;
-		map.length = (ops->p->userfont) ?
-			FNTCHARCNT(ops->p->fontdata) : 256;
+		map.length = vc->vc_font.charcount;
 		map.data = ops->p->fontdata;
 		info->tileops->fb_settile(info, &map);
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
