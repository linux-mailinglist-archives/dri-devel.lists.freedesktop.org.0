Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7267429D0E2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21076E49C;
	Wed, 28 Oct 2020 15:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4836E49C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:55:30 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id t24so17828pji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yKx0INo9eFW/IC3DVHie0KFpjS6/2uNoBFxnnJe8nMs=;
 b=ogP5IRiXwDEE94NW0k7l4k3E4vInnyCRSxzMprrmeyf2QRvuTVDJdZM0e+uJ8PfaXb
 QYz+7yJBo4C92YVkNMWQhQg9iXVTRd7pj4ZqK4UaFOaxfobE6MTfyx6XVHaIvStYzO0r
 h1qk2+8salmDV6CLRnzZhAkZWWjAgumAea8Q7IkoWK+xJ7Qh8idAmxvr96ODx1I9KUwT
 xKcWYvdRKEqVb2JdmvelDtFLTspZRRZphQMhtyCIIeWsaZSoTwG9X0YInUeOOnGWgvM6
 yojq67JYx7/OY+x7MEEzuTNxc5YAKr++/nblHnDFzVaA548/AwVFpOrbpPmxULDHCWPY
 fu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yKx0INo9eFW/IC3DVHie0KFpjS6/2uNoBFxnnJe8nMs=;
 b=SG9ad32sxOgkhmqOuf/ik7/pJGYVSeL3TRIl57T6cM523b/+76h4nhs2F2gPZpq2OK
 N/HQj0jyuVCmBCmiGDWnVA3JMteX/n/j0oUZo44KmLEjjBrRzLxm6lHe6EhyY1X1X5cL
 8wKu3gkeii7DEEoA/snJtWI/abQj6ISq/bhocGUuHn09VSqosaWclfF0G6cazRUd4WCc
 GoGvWpMSSGurZFgosvCpU2waVSKRI6DXIzLVYhcyXI5RKlpyTgkOH09MDTEgpq/N0Nzg
 VMOISgYj2a8Ul8rR9mYEfalV864u/R7L68183Uk9PNSLmcUrWS+Y7aKVfvyne4jMZ2V3
 RMjg==
X-Gm-Message-State: AOAM533lHYNDXuqH5k2ExO47ORrJoQag1F2n692R7IT/zbLtWGJ5F1nV
 WSenltgJo6m6D+q3hcTRgg==
X-Google-Smtp-Source: ABdhPJxacFtEfby4PIEPkQeo4aUBLQnXY9UlFuVa2mfO5ot0DOmPjf+6pfcS3yUY1K7NhG/Zffuo1g==
X-Received: by 2002:a17:90a:d489:: with SMTP id s9mr46478pju.50.1603900530445; 
 Wed, 28 Oct 2020 08:55:30 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id b7sm9952pfr.171.2020.10.28.08.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:55:29 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RFC v2 4/5] fbdev: Avoid using FNTCHARCNT() and hard-coded
 font charcount
Date: Wed, 28 Oct 2020 11:51:39 -0400
Message-Id: <20201028155139.1220549-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
References: <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For user-provided fonts, the framebuffer layer is using a
negative-indexing macro, FNTCHARCNT(), to keep track of their number of
characters. For built-in fonts, it is using hard-coded values (256). This
results in something like the following:

		map.length = (ops->p->userfont) ?
			FNTCHARCNT(ops->p->fontdata) : 256;

Recently we added a `charcount` field to `struct font_desc`. Use it, and
set `vc->vc_font.charcount` properly whenever `vc->vc_font.data` is set,
so that we can use `vc->vc_font.charcount` instead of an if-else between
FNTCHARCNT() and 256.

This patch depends on patch "Fonts: Add charcount field to font_desc".

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
FNTCHARCNT() now disappeared from drivers/video/fbdev/core/. There is one
more in drivers/video/console/newport_con.c, but I think that file needs
to be handled separately.

Changes in v2:
  - Try avoid using FNTCHARCNT() altogether, instead of only changing a
    little bit (Suggested by Daniel Vetter <daniel.vetter@ffwll.ch>)
  - Change the title, since we are now removing FNTCHARCNT()
  - Set `vc->vc_font.charcount` properly, in fbcon_startup(),
    fbcon_init(), fbcon_set_disp() and fbcon_do_set_font()
  - Replace hard-coded 256 whenever possible

 drivers/video/fbdev/core/fbcon.c        | 58 ++++++++++---------------
 drivers/video/fbdev/core/fbcon_rotate.c |  2 +-
 drivers/video/fbdev/core/tileblit.c     |  3 +-
 3 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..253eb9bcff25 100644
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
@@ -2289,7 +2282,7 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font)
 
 	font->width = vc->vc_font.width;
 	font->height = vc->vc_font.height;
-	font->charcount = vc->vc_hi_font_mask ? 512 : 256;
+	font->charcount = vc->vc_font.charcount;
 	if (!font->data)
 		return 0;
 
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
@@ -2458,7 +2447,7 @@ static int fbcon_copy_font(struct vc_data *vc, int con)
 
 	if (od->fontdata == f->data)
 		return 0;	/* already the same font... */
-	return fbcon_do_set_font(vc, f->width, f->height, od->fontdata, od->userfont);
+	return fbcon_do_set_font(vc, f->width, f->height, f->charcount, od->fontdata, od->userfont);
 }
 
 /*
@@ -2506,9 +2495,10 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
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
@@ -2534,7 +2524,7 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 			break;
 		}
 	}
-	return fbcon_do_set_font(vc, font->width, font->height, new_data, 1);
+	return fbcon_do_set_font(vc, font->width, font->height, charcount, new_data, 1);
 }
 
 static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, char *name)
@@ -2550,7 +2540,7 @@ static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, cha
 
 	font->width = f->width;
 	font->height = f->height;
-	return fbcon_do_set_font(vc, f->width, f->height, f->data, 0);
+	return fbcon_do_set_font(vc, f->width, f->height, f->charcount, f->data, 0);
 }
 
 static u16 palette_red[16];
@@ -3031,8 +3021,7 @@ void fbcon_get_requirement(struct fb_info *info,
 				p = &fb_display[i];
 				caps->x |= 1 << (vc->vc_font.width - 1);
 				caps->y |= 1 << (vc->vc_font.height - 1);
-				charcnt = (p->userfont) ?
-					FNTCHARCNT(p->fontdata) : 256;
+				charcnt = vc->vc_font.charcount;
 				if (caps->len < charcnt)
 					caps->len = charcnt;
 			}
@@ -3045,8 +3034,7 @@ void fbcon_get_requirement(struct fb_info *info,
 			p = &fb_display[fg_console];
 			caps->x = 1 << (vc->vc_font.width - 1);
 			caps->y = 1 << (vc->vc_font.height - 1);
-			caps->len = (p->userfont) ?
-				FNTCHARCNT(p->fontdata) : 256;
+			caps->len = vc->vc_font.charcount;
 		}
 	}
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index ac72d4f85f7d..9072d5947d16 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -33,7 +33,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 
 	src = ops->fontdata = vc->vc_font.data;
 	ops->cur_rotate = ops->p->con_rotate;
-	len = (!ops->p->userfont) ? 256 : FNTCHARCNT(src);
+	len = vc->vc_font.charcount;
 	s_cellsize = ((vc->vc_font.width + 7)/8) *
 		vc->vc_font.height;
 	d_cellsize = s_cellsize;
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 628fe5e010c0..e9ab90d1b67c 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -145,8 +145,7 @@ void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)
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
