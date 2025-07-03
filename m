Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC37AF7A69
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25AB10E875;
	Thu,  3 Jul 2025 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cXhePA0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F4010E87B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B089EA538D5;
 Thu,  3 Jul 2025 15:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D60C4CEE3;
 Thu,  3 Jul 2025 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751555585;
 bh=qiaugwuutCVmZxO8UUuTTUDZMfKt2TQPnJYW1C8GMIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cXhePA0LMqBaFQbf/98+PJxPh/TDcBXDEttpWCrMPDRGSnlARUMtPBSUrZg4Cpqdc
 OR/xvgRNSCnUnxVs7Athe6xp7Wnqiva9O8HJdqU01P+sY7lyMgL0edTa8r0e2B4D+b
 hJ2onwhdTwSBO0RVRLvJXP3j8fclVqqVN0kJlYx8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 059/139] tty: vt: sanitize arguments of consw::con_clear()
Date: Thu,  3 Jul 2025 16:42:02 +0200
Message-ID: <20250703143943.476664289@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703143941.182414597@linuxfoundation.org>
References: <20250703143941.182414597@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

[ Upstream commit 559f01a0ee6d924c6fec3eaf6a5b078b15e71070 ]

In consw::con_clear():
* Height is always 1, so drop it.
* Offsets and width are always unsigned values, so re-type them as such.

This needs a new __fbcon_clear() in the fbcon code to still handle
height which might not be 1 when called internally.

Note that tests for negative count/width are left in place -- they are
taken care of in the next patches.

And document the hook.

Signed-off-by: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
Tested-by: Helge Deller <deller@gmx.de> # parisc STI console
Link: https://lore.kernel.org/r/20240122110401.7289-22-jirislaby@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Stable-dep-of: 03bcbbb3995b ("dummycon: Trigger redraw when switching consoles with deferred takeover")
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index 83028ccf6e529..a368c98c92be3 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1582,7 +1582,7 @@ static void csi_X(struct vc_data *vc, unsigned int vpar)
 	vc_uniscr_clear_line(vc, vc->state.x, count);
 	scr_memsetw((unsigned short *)vc->vc_pos, vc->vc_video_erase_char, 2 * count);
 	if (con_should_update(vc))
-		vc->vc_sw->con_clear(vc, vc->state.y, vc->state.x, 1, count);
+		vc->vc_sw->con_clear(vc, vc->state.y, vc->state.x, count);
 	vc->vc_need_wrap = 0;
 }
 
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 9a19eb72a18b9..6918014b02408 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -108,8 +108,8 @@ static void dummycon_init(struct vc_data *vc, bool init)
 }
 
 static void dummycon_deinit(struct vc_data *vc) { }
-static void dummycon_clear(struct vc_data *vc, int sy, int sx, int height,
-			   int width) { }
+static void dummycon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			   unsigned int width) { }
 static void dummycon_cursor(struct vc_data *vc, int mode) { }
 
 static bool dummycon_scroll(struct vc_data *vc, unsigned int top,
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index c5b255c968794..1ddbb6cd5b0ca 100644
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
index 12c64ef470877..55c6106b3507b 100644
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
index 0bfeabc3f7c72..d99c2a659bfd4 100644
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
index 490e157aebdd4..5b5d1c9ef488c 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1156,8 +1156,8 @@ static bool vgacon_scroll(struct vc_data *c, unsigned int t, unsigned int b,
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
index 9f10a6e92e509..c14dbb09341fc 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1240,8 +1240,8 @@ static void fbcon_deinit(struct vc_data *vc)
  *  restriction is simplicity & efficiency at the moment.
  */
 
-static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
-			int width)
+static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
+			  unsigned int height, unsigned int width)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -1280,6 +1280,12 @@ static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
 		ops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
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
@@ -1767,7 +1773,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, t, b - t - count,
 				     count);
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							(b - count)),
@@ -1790,7 +1796,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_up;
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_REDRAW:
@@ -1808,7 +1814,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 							  vc->vc_rows - b, b);
 			} else
 				fbcon_redraw_move(vc, p, t + count, b - t - count, t);
-			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_MOVE:
@@ -1831,14 +1837,14 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
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
@@ -1855,7 +1861,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
 				     -count);
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
 							vc->vc_size_row *
 							t),
@@ -1878,7 +1884,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_down;
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_MOVE:
@@ -1900,7 +1906,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 					    b - t - count, vc->vc_cols);
 			else
 				goto redraw_down;
-			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			__fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			break;
 
 		case SCROLL_PAN_REDRAW:
@@ -1917,14 +1923,14 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
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
@@ -2203,7 +2209,7 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 
 		oldc = vc->vc_video_erase_char;
 		vc->vc_video_erase_char &= charmask;
-		fbcon_clear(vc, 0, 0, vc->vc_rows, vc->vc_cols);
+		__fbcon_clear(vc, 0, 0, vc->vc_rows, vc->vc_cols);
 		vc->vc_video_erase_char = oldc;
 	}
 }
diff --git a/include/linux/console.h b/include/linux/console.h
index 4efe76ac56d74..e06cee4923fef 100644
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
2.39.5



