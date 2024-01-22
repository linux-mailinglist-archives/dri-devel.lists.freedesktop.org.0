Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1483606C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DC510ED6F;
	Mon, 22 Jan 2024 11:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243610ED6F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B7255B80D64;
 Mon, 22 Jan 2024 11:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF0EC43394;
 Mon, 22 Jan 2024 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921486;
 bh=2fSZN99XZQUnAa9CnsJObtPdAd0ZIH+IG8ptjKVVkpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IrAAUZf5/cjo+lkybIjA2lDmJqnzyywtkzmOl1arxuNSXnQJ8mQ5yV3UbVYBdzQ9I
 HfBDs7ipLWd2fZB7vWII7J2e8Tulp37UWe5CWJlUx+xidYnBrl3+FreUPHJurJj1jk
 j/zQELLH6ZVH/m++18yORLIZE3KgjFnoEyXoAjvc1ktRxM6yRJvs8a/Cl7gR9crcSX
 PW2HLlEB3PPsLXVYMH6cRsVgM/MEBZZlJ8q0bUY9xy/959jQ7BTlP7IPh8A/BDwntj
 KLQnt9P8BrIOI9a46fi8f2IKmBbSDZ0JnatTypR0VykckemKT3ziCbICrSizKH9QYo
 4H7J4ffyCSafQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 21/47] tty: vt: sanitize arguments of consw::con_clear()
Date: Mon, 22 Jan 2024 12:03:35 +0100
Message-ID: <20240122110401.7289-22-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In consw::con_clear():
* Height is always 1, so drop it.
* Offsets and width are always unsigned values, so re-type them as such.

This needs a new __fbcon_clear() in the fbcon code to still handle
height which might not be 1 when called internally.

Note that tests for negative count/width are left in place -- they are
taken care of in the next patches.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                 |  2 +-
 drivers/video/console/dummycon.c    |  4 ++--
 drivers/video/console/mdacon.c      | 15 +++++---------
 drivers/video/console/newport_con.c |  6 +++---
 drivers/video/console/sticon.c      |  8 ++++----
 drivers/video/console/vgacon.c      |  4 ++--
 drivers/video/fbdev/core/fbcon.c    | 32 +++++++++++++++++------------
 include/linux/console.h             |  5 +++--
 8 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index fcb41c8724f3..b6f1449421bc 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1585,7 +1585,7 @@ static void csi_X(struct vc_data *vc)
 	vc_uniscr_clear_line(vc, vc->state.x, count);
 	scr_memsetw((unsigned short *)vc->vc_pos, vc->vc_video_erase_char, 2 * count);
 	if (con_should_update(vc))
-		vc->vc_sw->con_clear(vc, vc->state.y, vc->state.x, 1, count);
+		vc->vc_sw->con_clear(vc, vc->state.y, vc->state.x, count);
 	vc->vc_need_wrap = 0;
 }
 
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index f2cef9d9a4b5..0a69d5c216ee 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -109,8 +109,8 @@ static void dummycon_init(struct vc_data *vc, bool init)
 }
 
 static void dummycon_deinit(struct vc_data *vc) { }
-static void dummycon_clear(struct vc_data *vc, int sy, int sx, int height,
-			   int width) { }
+static void dummycon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			   unsigned int width) { }
 static void dummycon_cursor(struct vc_data *vc, int mode) { }
 
 static bool dummycon_scroll(struct vc_data *vc, unsigned int top,
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index c5b255c96879..1ddbb6cd5b0c 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -442,23 +442,18 @@ static void mdacon_putcs(struct vc_data *c, const unsigned short *s,
 	}
 }
 
-static void mdacon_clear(struct vc_data *c, int y, int x, 
-			  int height, int width)
+static void mdacon_clear(struct vc_data *c, unsigned int y, unsigned int x,
+			 unsigned int width)
 {
 	u16 *dest = mda_addr(x, y);
 	u16 eattr = mda_convert_attr(c->vc_video_erase_char);
 
-	if (width <= 0 || height <= 0)
+	if (width <= 0)
 		return;
 
-	if (x==0 && width==mda_num_columns) {
-		scr_memsetw(dest, eattr, height*width*2);
-	} else {
-		for (; height > 0; height--, dest+=mda_num_columns)
-			scr_memsetw(dest, eattr, width*2);
-	}
+	scr_memsetw(dest, eattr, width * 2);
 }
-                        
+
 static int mdacon_switch(struct vc_data *c)
 {
 	return 1;	/* redrawing needed */
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 12c64ef47087..55c6106b3507 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -346,12 +346,12 @@ static void newport_deinit(struct vc_data *c)
 	}
 }
 
-static void newport_clear(struct vc_data *vc, int sy, int sx, int height,
-			  int width)
+static void newport_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			  unsigned int width)
 {
 	int xend = ((sx + width) << 3) - 1;
 	int ystart = ((sy << 4) + topscan) & 0x3ff;
-	int yend = (((sy + height) << 4) + topscan - 1) & 0x3ff;
+	int yend = (((sy + 1) << 4) + topscan - 1) & 0x3ff;
 
 	if (logo_active)
 		return;
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 0bfeabc3f7c7..d99c2a659bfd 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -300,13 +300,13 @@ static void sticon_deinit(struct vc_data *c)
 	sticon_set_def_font(i);
 }
 
-static void sticon_clear(struct vc_data *conp, int sy, int sx, int height,
-			 int width)
+static void sticon_clear(struct vc_data *conp, unsigned int sy, unsigned int sx,
+			 unsigned int width)
 {
-    if (!height || !width)
+    if (!width)
 	return;
 
-    sti_clear(sticon_sti, sy, sx, height, width,
+    sti_clear(sticon_sti, sy, sx, 1, width,
 	      conp->vc_video_erase_char, font_data[conp->vc_num]);
 }
 
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 5d523753def8..85f29dec2c3d 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1191,8 +1191,8 @@ static bool vgacon_scroll(struct vc_data *c, unsigned int t, unsigned int b,
  *  The console `switch' structure for the VGA based console
  */
 
-static void vgacon_clear(struct vc_data *vc, int sy, int sx, int height,
-			 int width) { }
+static void vgacon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			 unsigned int width) { }
 static void vgacon_putc(struct vc_data *vc, int c, int ypos, int xpos) { }
 static void vgacon_putcs(struct vc_data *vc, const unsigned short *s,
 			 int count, int ypos, int xpos) { }
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 939c5d893dfb..8a31a36483ea 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1235,8 +1235,8 @@ static void fbcon_deinit(struct vc_data *vc)
  *  restriction is simplicity & efficiency at the moment.
  */
 
-static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
-			int width)
+static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			  unsigned int height, unsigned int width)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -1273,6 +1273,12 @@ static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
 		ops->clear(vc, info, real_y(p, sy), sx, height, width);
 }
 
+static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			unsigned int width)
+{
+	__fbcon_clear(vc, sy, sx, 1, width);
+}
+
 static void fbcon_putcs(struct vc_data *vc, const unsigned short *s,
 			int count, int ypos, int xpos)
 {
@@ -1760,7 +1766,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, t, b - t - count,
 				     count);
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							(b - count)),
@@ -1783,7 +1789,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_up;
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_REDRAW:
@@ -1801,7 +1807,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 							  vc->vc_rows - b, b);
 			} else
 				fbcon_redraw_move(vc, p, t + count, b - t - count, t);
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_MOVE:
@@ -1824,14 +1830,14 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_up;
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_REDRAW:
 		      redraw_up:
 			fbcon_redraw(vc, t, b - t - count,
 				     count * vc->vc_cols);
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							(b - count)),
@@ -1848,7 +1854,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
 				     -count);
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							t),
@@ -1871,7 +1877,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_down;
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_MOVE:
@@ -1893,7 +1899,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_down;
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_REDRAW:
@@ -1910,14 +1916,14 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					fbcon_redraw_move(vc, p, count, t, 0);
 			} else
 				fbcon_redraw_move(vc, p, t, b - t - count, t + count);
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_REDRAW:
 		      redraw_down:
 			fbcon_redraw(vc, b - 1, b - t - count,
 				     -count * vc->vc_cols);
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							t),
@@ -2196,7 +2202,7 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 
 		oldc = vc->vc_video_erase_char;
 		vc->vc_video_erase_char &= charmask;
-		fbcon_clear(vc, 0, 0, vc->vc_rows, vc->vc_cols);
+		__fbcon_clear(vc, 0, 0, vc->vc_rows, vc->vc_cols);
 		vc->vc_video_erase_char = oldc;
 	}
 }
diff --git a/include/linux/console.h b/include/linux/console.h
index fc9450e0c78f..8fd96a5fca5f 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -38,6 +38,7 @@ enum vc_intensity;
  *
  * @con_init:   initialize the console on @vc. @init is true for the very first
  *		call on this @vc.
+ * @con_clear:  erase @count characters at [@x, @y] on @vc. @count >= 1.
  * @con_scroll: move lines from @top to @bottom in direction @dir by @lines.
  *		Return true if no generic handling should be done.
  *		Invoked by csi_M and printing to the console.
@@ -50,8 +51,8 @@ struct consw {
 	const char *(*con_startup)(void);
 	void	(*con_init)(struct vc_data *vc, bool init);
 	void	(*con_deinit)(struct vc_data *vc);
-	void	(*con_clear)(struct vc_data *vc, int sy, int sx, int height,
-			int width);
+	void	(*con_clear)(struct vc_data *vc, unsigned int y,
+			     unsigned int x, unsigned int count);
 	void	(*con_putc)(struct vc_data *vc, int c, int ypos, int xpos);
 	void	(*con_putcs)(struct vc_data *vc, const unsigned short *s,
 			int count, int ypos, int xpos);
-- 
2.43.0

