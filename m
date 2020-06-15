Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A651F9051
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0809889AEE;
	Mon, 15 Jun 2020 07:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9A3898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:49:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C09C9AB76;
 Mon, 15 Jun 2020 07:49:20 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH 26/38] vt: use newly defined CUR_* macros
Date: Mon, 15 Jun 2020 09:48:58 +0200
Message-Id: <20200615074910.19267-26-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615074910.19267-1-jslaby@suse.cz>
References: <20200615074910.19267-1-jslaby@suse.cz>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Helge Deller <deller@gmx.de>, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We defined macros for all the magic constants in the previous patch. So
let us use the macro in the code now.

No functional change intended.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                     | 22 +++++++++++++---------
 drivers/usb/misc/sisusbvga/sisusb_con.c |  2 +-
 drivers/video/console/mdacon.c          |  2 +-
 drivers/video/console/sticon.c          |  2 +-
 drivers/video/console/vgacon.c          |  2 +-
 drivers/video/fbdev/core/bitblit.c      |  2 +-
 drivers/video/fbdev/core/fbcon.c        |  2 +-
 drivers/video/fbdev/core/fbcon_ccw.c    |  2 +-
 drivers/video/fbdev/core/fbcon_cw.c     |  2 +-
 drivers/video/fbdev/core/fbcon_ud.c     |  2 +-
 drivers/video/fbdev/core/tileblit.c     |  2 +-
 11 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index af1ef717f416..2b9fc628f05b 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -866,17 +866,18 @@ static void add_softcursor(struct vc_data *vc)
 	int i = scr_readw((u16 *) vc->vc_pos);
 	u32 type = vc->vc_cursor_type;
 
-	if (!(type & 0x10))
+	if (!(type & CUR_SW))
 		return;
 	if (softcursor_original != -1)
 		return;
 	softcursor_original = i;
-	i |= (type >> 8) & 0xff00;
-	i ^= type & 0xff00;
-	if ((type & 0x20) && (softcursor_original & 0x7000) == (i & 0x7000))
-		i ^= 0x7000;
-	if ((type & 0x40) && (i & 0x700) == ((i & 0x7000) >> 4))
-		i ^= 0x0700;
+	i |= CUR_SET(type);
+	i ^= CUR_CHANGE(type);
+	if ((type & CUR_ALWAYS_BG) &&
+			(softcursor_original & CUR_BG) == (i & CUR_BG))
+		i ^= CUR_BG;
+	if ((type & CUR_INVERT_FG_BG) && (i & CUR_FG) == ((i & CUR_BG) >> 4))
+		i ^= CUR_FG;
 	scr_writew(i, (u16 *)vc->vc_pos);
 	if (con_should_update(vc))
 		vc->vc_sw->con_putc(vc, i, vc->state.y, vc->state.x);
@@ -910,7 +911,7 @@ static void set_cursor(struct vc_data *vc)
 		if (vc_is_sel(vc))
 			clear_selection();
 		add_softcursor(vc);
-		if ((vc->vc_cursor_type & 0x0f) != 1)
+		if (CUR_SIZE(vc->vc_cursor_type) != CUR_NONE)
 			vc->vc_sw->con_cursor(vc, CM_DRAW);
 	} else
 		hide_cursor(vc);
@@ -2322,7 +2323,10 @@ static void do_con_trol(struct tty_struct *tty, struct vc_data *vc, int c)
 		case 'c':
 			if (vc->vc_priv == EPdec) {
 				if (vc->vc_par[0])
-					vc->vc_cursor_type = vc->vc_par[0] | (vc->vc_par[1] << 8) | (vc->vc_par[2] << 16);
+					vc->vc_cursor_type =
+						CUR_MAKE(vc->vc_par[0],
+							 vc->vc_par[1],
+							 vc->vc_par[2]);
 				else
 					vc->vc_cursor_type = cur_default;
 				return;
diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index 80657c49310a..1058eaba3084 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -727,7 +727,7 @@ sisusbcon_cursor(struct vc_data *c, int mode)
 
 	baseline = c->vc_font.height - (c->vc_font.height < 10 ? 1 : 2);
 
-	switch (c->vc_cursor_type & 0x0f) {
+	switch (CUR_SIZE(c->vc_cursor_type)) {
 		case CUR_BLOCK:		from = 1;
 					to   = c->vc_font.height;
 					break;
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 00cb6245fbef..ef29b321967f 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -492,7 +492,7 @@ static void mdacon_cursor(struct vc_data *c, int mode)
 
 	mda_set_cursor(c->state.y * mda_num_columns * 2 + c->state.x * 2);
 
-	switch (c->vc_cursor_type & 0x0f) {
+	switch (CUR_SIZE(c->vc_cursor_type)) {
 
 		case CUR_LOWER_THIRD:	mda_set_cursor_size(10, 13); break;
 		case CUR_LOWER_HALF:	mda_set_cursor_size(7,  13); break;
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index bbcdfd312c36..21a5c280c8c9 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -139,7 +139,7 @@ static void sticon_cursor(struct vc_data *conp, int mode)
 	break;
     case CM_MOVE:
     case CM_DRAW:
-	switch (conp->vc_cursor_type & 0x0f) {
+	switch (CUR_SIZE(conp->vc_cursor_type)) {
 	case CUR_UNDERLINE:
 	case CUR_LOWER_THIRD:
 	case CUR_LOWER_HALF:
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index c1c4ce28ac5e..f0f3d573f848 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -728,7 +728,7 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 	case CM_MOVE:
 	case CM_DRAW:
 		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
-		switch (c->vc_cursor_type & 0x0f) {
+		switch (CUR_SIZE(c->vc_cursor_type)) {
 		case CUR_UNDERLINE:
 			vgacon_set_cursor_size(c->state.x,
 					       c->vc_font.height -
diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 3b002b365a5a..dde8004d8610 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -241,7 +241,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = DIV_ROUND_UP(vc->vc_font.width, 8), c;
 	int y = real_y(ops->p, vc->state.y);
-	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
+	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1;
 	char *src;
 
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 38d2a00b0ccf..86fe41b1deb8 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1393,7 +1393,7 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
 	if (fbcon_is_inactive(vc, info) || vc->vc_deccm != 1)
 		return;
 
-	if (vc->vc_cursor_type & 0x10)
+	if (vc->vc_cursor_type & CUR_SW)
 		fbcon_del_cursor_timer(info);
 	else
 		fbcon_add_cursor_timer(info);
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 5b67bcebe34c..b5dd8317086d 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -226,7 +226,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
 	int y = real_y(ops->p, vc->state.y);
-	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
+	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
 	u32 vyres = GETVYRES(ops->p->scrollmode, info);
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index f1aab3ae3bc9..dbb5dbf3dd01 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -209,7 +209,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.height + 7) >> 3, c;
 	int y = real_y(ops->p, vc->state.y);
-	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
+	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
 	u32 vxres = GETVXRES(ops->p->scrollmode, info);
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 81ed6f6bed67..b2c9cdbcc9e4 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -256,7 +256,7 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 	unsigned short charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	int w = (vc->vc_font.width + 7) >> 3, c;
 	int y = real_y(ops->p, vc->state.y);
-	int attribute, use_sw = (vc->vc_cursor_type & 0x10);
+	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
 	int err = 1, dx, dy;
 	char *src;
 	u32 vyres = GETVYRES(ops->p->scrollmode, info);
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index ac51425687e4..1dfaff0881fb 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -83,7 +83,7 @@ static void tile_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 			int softback_lines, int fg, int bg)
 {
 	struct fb_tilecursor cursor;
-	int use_sw = (vc->vc_cursor_type & 0x10);
+	int use_sw = vc->vc_cursor_type & CUR_SW;
 
 	cursor.sx = vc->state.x;
 	cursor.sy = vc->state.y;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
