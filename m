Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD8AA9ED6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9223B10E33C;
	Mon,  5 May 2025 22:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X7zoxtBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C46010E124
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:15:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BCA9C629C7;
 Mon,  5 May 2025 22:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354DBC4CEED;
 Mon,  5 May 2025 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483311;
 bh=b4dF8AbLwfo223sL9kr1mdKbryTSTbltdYY+n/Wqcqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7zoxtBFWDlnjcNM+XnZ8TgghprFl7Yfjk4z9PHy6xe47QlsZAqZyeFNpUVyvdurY
 gEbUoDeXCc4v1FxXwtFcbs5ydxcnSp8tPZ3g5eCdRG+oIe4haC0OnLDfwUwXxar7dv
 BkgRwN/pdPFWYmHk1lbHR/CUdcyIzuBYuFlOfNrg+74cmo68Vv5ws2FtjPb/8dBlKf
 5phrMFjGZFnG2xCP4t7OQJfiE+cjoXmtVOMrSogCW+UBhT1byMAGdAPftHMgGYJpUZ
 hsbrYwkw1r+qlIJPHkYuW0yNCCXcDJDMHX5dqiSS50r+jgsCZBMA3wWgbePwy5gcrb
 Z6xB6vFz9a37Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, simona@ffwll.ch, qianqiang.liu@163.com,
 jfalempe@redhat.com, oushixiong@kylinos.cn, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 025/642] fbcon: Use correct erase colour for
 clearing in fbcon
Date: Mon,  5 May 2025 18:04:01 -0400
Message-Id: <20250505221419.2672473-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Zsolt Kajtar <soci@c64.rulez.org>

[ Upstream commit 892c788d73fe4a94337ed092cb998c49fa8ecaf4 ]

The erase colour calculation for fbcon clearing should use get_color instead
of attr_col_ec, like everything else. The latter is similar but is not correct.
For example it's missing the depth dependent remapping and doesn't care about
blanking.

The problem can be reproduced by setting up the background colour to grey
(vt.color=0x70) and having an fbcon console set to 2bpp (4 shades of gray).
Now the background attribute should be 1 (dark gray) on the console.

If the screen is scrolled when pressing enter in a shell prompt at the bottom
line then the new line is cleared using colour 7 instead of 1. That's not
something fillrect likes (at 2bbp it expect 0-3) so the result is interesting.

This patch switches to get_color with vc_video_erase_char to determine the
erase colour from attr_col_ec. That makes the latter function redundant as
no other users were left.

Use correct erase colour for clearing in fbcon

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/bitblit.c   |  5 ++--
 drivers/video/fbdev/core/fbcon.c     | 10 +++++---
 drivers/video/fbdev/core/fbcon.h     | 38 +---------------------------
 drivers/video/fbdev/core/fbcon_ccw.c |  5 ++--
 drivers/video/fbdev/core/fbcon_cw.c  |  5 ++--
 drivers/video/fbdev/core/fbcon_ud.c  |  5 ++--
 drivers/video/fbdev/core/tileblit.c  |  8 +++---
 7 files changed, 18 insertions(+), 58 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 3ff1b2a8659e8..f9475c14f7339 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -59,12 +59,11 @@ static void bit_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 }
 
 static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		      int sx, int height, int width)
+		      int sx, int height, int width, int fg, int bg)
 {
-	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
 	struct fb_fillrect region;
 
-	region.color = attr_bgcol_ec(bgshift, vc, info);
+	region.color = bg;
 	region.dx = sx * vc->vc_font.width;
 	region.dy = sy * vc->vc_font.height;
 	region.width = width * vc->vc_font.width;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index e8b4e8c119b5c..07d127110ca4c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1258,7 +1258,7 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
-
+	int fg, bg;
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	u_int y_break;
 
@@ -1279,16 +1279,18 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 		fbcon_clear_margins(vc, 0);
 	}
 
+	fg = get_color(vc, info, vc->vc_video_erase_char, 1);
+	bg = get_color(vc, info, vc->vc_video_erase_char, 0);
 	/* Split blits that cross physical y_wrap boundary */
 
 	y_break = p->vrows - p->yscroll;
 	if (sy < y_break && sy + height - 1 >= y_break) {
 		u_int b = y_break - sy;
-		ops->clear(vc, info, real_y(p, sy), sx, b, width);
+		ops->clear(vc, info, real_y(p, sy), sx, b, width, fg, bg);
 		ops->clear(vc, info, real_y(p, sy + b), sx, height - b,
-				 width);
+				 width, fg, bg);
 	} else
-		ops->clear(vc, info, real_y(p, sy), sx, height, width);
+		ops->clear(vc, info, real_y(p, sy), sx, height, width, fg, bg);
 }
 
 static void fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index df70ea5ec5b37..4d97e6d8a16a2 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -55,7 +55,7 @@ struct fbcon_ops {
 	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int dy, int dx, int height, int width);
 	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
-		      int sx, int height, int width);
+		      int sx, int height, int width, int fb, int bg);
 	void (*putcs)(struct vc_data *vc, struct fb_info *info,
 		      const unsigned short *s, int count, int yy, int xx,
 		      int fg, int bg);
@@ -116,42 +116,6 @@ static inline int mono_col(const struct fb_info *info)
 	return (~(0xfff << max_len)) & 0xff;
 }
 
-static inline int attr_col_ec(int shift, struct vc_data *vc,
-			      struct fb_info *info, int is_fg)
-{
-	int is_mono01;
-	int col;
-	int fg;
-	int bg;
-
-	if (!vc)
-		return 0;
-
-	if (vc->vc_can_do_color)
-		return is_fg ? attr_fgcol(shift,vc->vc_video_erase_char)
-			: attr_bgcol(shift,vc->vc_video_erase_char);
-
-	if (!info)
-		return 0;
-
-	col = mono_col(info);
-	is_mono01 = info->fix.visual == FB_VISUAL_MONO01;
-
-	if (attr_reverse(vc->vc_video_erase_char)) {
-		fg = is_mono01 ? col : 0;
-		bg = is_mono01 ? 0 : col;
-	}
-	else {
-		fg = is_mono01 ? 0 : col;
-		bg = is_mono01 ? col : 0;
-	}
-
-	return is_fg ? fg : bg;
-}
-
-#define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info, 0)
-#define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info, 1)
-
     /*
      *  Scroll Method
      */
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index f9b794ff7d396..89ef4ba7e8672 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -78,14 +78,13 @@ static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 }
 
 static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		     int sx, int height, int width)
+		     int sx, int height, int width, int fg, int bg)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fb_fillrect region;
-	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
 	u32 vyres = GETVYRES(ops->p, info);
 
-	region.color = attr_bgcol_ec(bgshift,vc,info);
+	region.color = bg;
 	region.dx = sy * vc->vc_font.height;
 	region.dy = vyres - ((sx + width) * vc->vc_font.width);
 	region.height = width * vc->vc_font.width;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 903f6fc174e14..b9dac7940fb77 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -63,14 +63,13 @@ static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 }
 
 static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		     int sx, int height, int width)
+		     int sx, int height, int width, int fg, int bg)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fb_fillrect region;
-	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
 	u32 vxres = GETVXRES(ops->p, info);
 
-	region.color = attr_bgcol_ec(bgshift,vc,info);
+	region.color = bg;
 	region.dx = vxres - ((sy + height) * vc->vc_font.height);
 	region.dy = sx *  vc->vc_font.width;
 	region.height = width * vc->vc_font.width;
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 594331936fd3c..0af7913a2abdc 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -64,15 +64,14 @@ static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 }
 
 static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		     int sx, int height, int width)
+		     int sx, int height, int width, int fg, int bg)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	struct fb_fillrect region;
-	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
 	u32 vyres = GETVYRES(ops->p, info);
 	u32 vxres = GETVXRES(ops->p, info);
 
-	region.color = attr_bgcol_ec(bgshift,vc,info);
+	region.color = bg;
 	region.dy = vyres - ((sy + height) * vc->vc_font.height);
 	region.dx = vxres - ((sx + width) *  vc->vc_font.width);
 	region.width = width * vc->vc_font.width;
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index eff7ec4da1671..45b0828fad1cf 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -32,16 +32,14 @@ static void tile_bmove(struct vc_data *vc, struct fb_info *info, int sy,
 }
 
 static void tile_clear(struct vc_data *vc, struct fb_info *info, int sy,
-		       int sx, int height, int width)
+		       int sx, int height, int width, int fg, int bg)
 {
 	struct fb_tilerect rect;
-	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
-	int fgshift = (vc->vc_hi_font_mask) ? 9 : 8;
 
 	rect.index = vc->vc_video_erase_char &
 		((vc->vc_hi_font_mask) ? 0x1ff : 0xff);
-	rect.fg = attr_fgcol_ec(fgshift, vc, info);
-	rect.bg = attr_bgcol_ec(bgshift, vc, info);
+	rect.fg = fg;
+	rect.bg = bg;
 	rect.sx = sx;
 	rect.sy = sy;
 	rect.width = width;
-- 
2.39.5

