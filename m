Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD4AAA247
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1933110E59C;
	Mon,  5 May 2025 22:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fd/DQLl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431F810E59C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:57:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 524F14A164;
 Mon,  5 May 2025 22:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F0AC4CEF2;
 Mon,  5 May 2025 22:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485835;
 bh=qGBraCnsV9M9vOL/SuUmu81wvyQ3isDl/GqO2uTQAXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fd/DQLl4XmIY1MBsPbxZ05WjmGfq+lw7qaJBpKffEGMhRunp2RgLYAJnrPUQkeUJU
 6oAPJKfXM+dhEN3INwZ7+0p12AKqIn/mC6fy3NllQ0AcBmWCUl3K7Jjq3pFPDxOG+e
 cAFMRZzykXncsZCLk9emCU9Elcb2pq04DSgHNUgcmdRee5ziAPNI6Xv4V4P0aDfLxM
 EhFhYkpeSBP+3wedkmddNp0K3dYd2O+Q/1SDBsFy+Be4d3PxWROma48mazPTD6ASqU
 1VLMo50i3Xo8+GIEEfsbxSJpxYp413HB1ga8HJc/NCTJcW2kTi2yc6TWyiZKhw+Wie
 VIv7TVqQE1y4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, simona@ffwll.ch,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 019/294] fbdev: core: tileblit: Implement missing
 margin clearing for tileblit
Date: Mon,  5 May 2025 18:51:59 -0400
Message-Id: <20250505225634.2688578-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

[ Upstream commit 76d3ca89981354e1f85a3e0ad9ac4217d351cc72 ]

I was wondering why there's garbage at the bottom of the screen when
tile blitting is used with an odd mode like 1080, 600 or 200. Sure there's
only space for half a tile but the same area is clean when the buffer
is bitmap.

Then later I found that it's supposed to be cleaned but that's not
implemented. So I took what's in bitblit and adapted it for tileblit.

This implementation was tested for both the horizontal and vertical case,
and now does the same as what's done for bitmap buffers.

If anyone is interested to reproduce the problem then I could bet that'd
be on a S3 or Ark. Just set up a mode with an odd line count and make
sure that the virtual size covers the complete tile at the bottom. E.g.
for 600 lines that's 608 virtual lines for a 16 tall tile. Then the
bottom area should be cleaned.

For the right side it's more difficult as there the drivers won't let an
odd size happen, unless the code is modified. But once it reports back a
few pixel columns short then fbcon won't use the last column. With the
patch that column is now clean.

Btw. the virtual size should be rounded up by the driver for both axes
(not only the horizontal) so that it's dividable by the tile size.
That's a driver bug but correcting it is not in scope for this patch.

Implement missing margin clearing for tileblit

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/tileblit.c | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 674ca6a410ec8..b3aa0c6620c7d 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -74,7 +74,42 @@ static void tile_putcs(struct vc_data *vc, struct fb_info *info,
 static void tile_clear_margins(struct vc_data *vc, struct fb_info *info,
 			       int color, int bottom_only)
 {
-	return;
+	unsigned int cw = vc->vc_font.width;
+	unsigned int ch = vc->vc_font.height;
+	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
+	unsigned int bh = info->var.yres - (vc->vc_rows*ch);
+	unsigned int rs = info->var.xres - rw;
+	unsigned int bs = info->var.yres - bh;
+	unsigned int vwt = info->var.xres_virtual / cw;
+	unsigned int vht = info->var.yres_virtual / ch;
+	struct fb_tilerect rect;
+
+	rect.index = vc->vc_video_erase_char &
+		((vc->vc_hi_font_mask) ? 0x1ff : 0xff);
+	rect.fg = color;
+	rect.bg = color;
+
+	if ((int) rw > 0 && !bottom_only) {
+		rect.sx = (info->var.xoffset + rs + cw - 1) / cw;
+		rect.sy = 0;
+		rect.width = (rw + cw - 1) / cw;
+		rect.height = vht;
+		if (rect.width + rect.sx > vwt)
+			rect.width = vwt - rect.sx;
+		if (rect.sx < vwt)
+			info->tileops->fb_tilefill(info, &rect);
+	}
+
+	if ((int) bh > 0) {
+		rect.sx = info->var.xoffset / cw;
+		rect.sy = (info->var.yoffset + bs) / ch;
+		rect.width = rs / cw;
+		rect.height = (bh + ch - 1) / ch;
+		if (rect.height + rect.sy > vht)
+			rect.height = vht - rect.sy;
+		if (rect.sy < vht)
+			info->tileops->fb_tilefill(info, &rect);
+	}
 }
 
 static void tile_cursor(struct vc_data *vc, struct fb_info *info, int mode,
-- 
2.39.5

