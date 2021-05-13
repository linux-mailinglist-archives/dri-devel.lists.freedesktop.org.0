Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5A637F513
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 11:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A66E86B;
	Thu, 13 May 2021 09:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E3BE6E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 09:51:51 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 7088D9200B3; Thu, 13 May 2021 11:51:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 69EA092009E;
 Thu, 13 May 2021 11:51:50 +0200 (CEST)
Date: Thu, 13 May 2021 11:51:50 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 3/3] vt: Fix character height handling with VT_RESIZEX
In-Reply-To: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2105131137520.3032@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore the original intent of the VT_RESIZEX ioctl's `v_clin' parameter
which is the number of pixel rows per character (cell) rather than the 
height of the font used.

For framebuffer devices the two values are always the same, because the 
former is inferred from the latter one.  For VGA used as a true text 
mode device these two parameters are independent from each other: the 
number of pixel rows per character is set in the CRT controller, while 
font height is in fact hardwired to 32 pixel rows and fonts of heights 
below that value are handled by padding their data with blanks when 
loaded to hardware for use by the character generator.  One can change 
the setting in the CRT controller and it will update the screen contents 
accordingly regardless of the font loaded.

The `v_clin' parameter is used by the `vgacon' driver to set the height 
of the character cell and then the cursor position within.  Make the 
parameter explicit then, by defining a new `vc_cell_height' struct 
member of `vc_data', set it instead of `vc_font.height' from `v_clin' in 
the VT_RESIZEX ioctl, and then use it throughout the `vgacon' driver 
except where actual font data is accessed which as noted above is 
independent from the CRTC setting.

This way the framebuffer console driver is free to ignore the `v_clin' 
parameter as irrelevant, as it always should have, avoiding any issues 
attempts to give the parameter a meaning there could have caused, such 
as one that has led to commit 988d0763361b ("vt_ioctl: make VT_RESIZEX 
behave like VT_RESIZE"):

"syzbot is reporting UAF/OOB read at bit_putcs()/soft_cursor() [1][2], for
vt_resizex() from ioctl(VT_RESIZEX) allows setting font height larger than
actual font height calculated by con_font_set() from ioctl(PIO_FONT).
Since fbcon_set_font() from con_font_set() allocates minimal amount of
memory based on actual font height calculated by con_font_set(),
use of vt_resizex() can cause UAF/OOB read for font data."

The problem first appeared around Linux 2.5.66 which predates our repo 
history, but the origin could be identified with the old MIPS/Linux repo 
also at: <git://git.kernel.org/pub/scm/linux/kernel/git/ralf/linux.git> 
as commit 9736a3546de7 ("Merge with Linux 2.5.66."), where VT_RESIZEX 
code in `vt_ioctl' was updated as follows:

 		if (clin)
-			video_font_height = clin;
+			vc->vc_font.height = clin;

making the parameter apply to framebuffer devices as well, perhaps due 
to the use of "font" in the name of the original `video_font_height' 
variable.  Use "cell" in the new struct member then to avoid ambiguity.

References:

[1] https://syzkaller.appspot.com/bug?id=32577e96d88447ded2d3b76d71254fb855245837
[2] https://syzkaller.appspot.com/bug?id=6b8355d27b2b94fb5cedf4655e3a59162d9e48e3

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org # v2.6.12+
---
Changes from v1:

- Clarification added as to the previous attempt to fix a problem in 
  framebuffer triggered with the VT_RESIZEX ioctl.
---
 drivers/tty/vt/vt_ioctl.c      |    6 ++---
 drivers/video/console/vgacon.c |   44 ++++++++++++++++++++---------------------
 include/linux/console_struct.h |    1 
 3 files changed, 26 insertions(+), 25 deletions(-)

Index: linux-macro-ide/drivers/tty/vt/vt_ioctl.c
===================================================================
--- linux-macro-ide.orig/drivers/tty/vt/vt_ioctl.c
+++ linux-macro-ide/drivers/tty/vt/vt_ioctl.c
@@ -706,17 +706,17 @@ static int vt_resizex(struct vc_data *vc
 		if (vcp) {
 			int ret;
 			int save_scan_lines = vcp->vc_scan_lines;
-			int save_font_height = vcp->vc_font.height;
+			int save_cell_height = vcp->vc_cell_height;
 
 			if (v.v_vlin)
 				vcp->vc_scan_lines = v.v_vlin;
 			if (v.v_clin)
-				vcp->vc_font.height = v.v_clin;
+				vcp->vc_cell_height = v.v_clin;
 			vcp->vc_resize_user = 1;
 			ret = vc_resize(vcp, v.v_cols, v.v_rows);
 			if (ret) {
 				vcp->vc_scan_lines = save_scan_lines;
-				vcp->vc_font.height = save_font_height;
+				vcp->vc_cell_height = save_cell_height;
 				console_unlock();
 				return ret;
 			}
Index: linux-macro-ide/drivers/video/console/vgacon.c
===================================================================
--- linux-macro-ide.orig/drivers/video/console/vgacon.c
+++ linux-macro-ide/drivers/video/console/vgacon.c
@@ -383,7 +383,7 @@ static void vgacon_init(struct vc_data *
 		vc_resize(c, vga_video_num_columns, vga_video_num_lines);
 
 	c->vc_scan_lines = vga_scan_lines;
-	c->vc_font.height = vga_video_font_height;
+	c->vc_font.height = c->vc_cell_height = vga_video_font_height;
 	c->vc_complement_mask = 0x7700;
 	if (vga_512_chars)
 		c->vc_hi_font_mask = 0x0800;
@@ -518,32 +518,32 @@ static void vgacon_cursor(struct vc_data
 		switch (CUR_SIZE(c->vc_cursor_type)) {
 		case CUR_UNDERLINE:
 			vgacon_set_cursor_size(c->state.x,
-					       c->vc_font.height -
-					       (c->vc_font.height <
+					       c->vc_cell_height -
+					       (c->vc_cell_height <
 						10 ? 2 : 3),
-					       c->vc_font.height -
-					       (c->vc_font.height <
+					       c->vc_cell_height -
+					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_TWO_THIRDS:
 			vgacon_set_cursor_size(c->state.x,
-					       c->vc_font.height / 3,
-					       c->vc_font.height -
-					       (c->vc_font.height <
+					       c->vc_cell_height / 3,
+					       c->vc_cell_height -
+					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_LOWER_THIRD:
 			vgacon_set_cursor_size(c->state.x,
-					       (c->vc_font.height * 2) / 3,
-					       c->vc_font.height -
-					       (c->vc_font.height <
+					       (c->vc_cell_height * 2) / 3,
+					       c->vc_cell_height -
+					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_LOWER_HALF:
 			vgacon_set_cursor_size(c->state.x,
-					       c->vc_font.height / 2,
-					       c->vc_font.height -
-					       (c->vc_font.height <
+					       c->vc_cell_height / 2,
+					       c->vc_cell_height -
+					       (c->vc_cell_height <
 						10 ? 1 : 2));
 			break;
 		case CUR_NONE:
@@ -554,7 +554,7 @@ static void vgacon_cursor(struct vc_data
 			break;
 		default:
 			vgacon_set_cursor_size(c->state.x, 1,
-					       c->vc_font.height);
+					       c->vc_cell_height);
 			break;
 		}
 		break;
@@ -565,13 +565,13 @@ static int vgacon_doresize(struct vc_dat
 		unsigned int width, unsigned int height)
 {
 	unsigned long flags;
-	unsigned int scanlines = height * c->vc_font.height;
+	unsigned int scanlines = height * c->vc_cell_height;
 	u8 scanlines_lo = 0, r7 = 0, vsync_end = 0, mode, max_scan;
 
 	raw_spin_lock_irqsave(&vga_lock, flags);
 
 	vgacon_xres = width * VGA_FONTWIDTH;
-	vgacon_yres = height * c->vc_font.height;
+	vgacon_yres = height * c->vc_cell_height;
 	if (vga_video_type >= VIDEO_TYPE_VGAC) {
 		outb_p(VGA_CRTC_MAX_SCAN, vga_video_port_reg);
 		max_scan = inb_p(vga_video_port_val);
@@ -626,9 +626,9 @@ static int vgacon_doresize(struct vc_dat
 static int vgacon_switch(struct vc_data *c)
 {
 	int x = c->vc_cols * VGA_FONTWIDTH;
-	int y = c->vc_rows * c->vc_font.height;
+	int y = c->vc_rows * c->vc_cell_height;
 	int rows = screen_info.orig_video_lines * vga_default_font_height/
-		c->vc_font.height;
+		c->vc_cell_height;
 	/*
 	 * We need to save screen size here as it's the only way
 	 * we can spot the screen has been resized and we need to
@@ -1041,7 +1041,7 @@ static int vgacon_adjust_height(struct v
 				cursor_size_lastto = 0;
 				c->vc_sw->con_cursor(c, CM_DRAW);
 			}
-			c->vc_font.height = fontheight;
+			c->vc_font.height = c->vc_cell_height = fontheight;
 			vc_resize(c, 0, rows);	/* Adjust console size */
 		}
 	}
@@ -1096,12 +1096,12 @@ static int vgacon_resize(struct vc_data
 		 */
 		screen_info.orig_video_cols = width;
 		screen_info.orig_video_lines = height;
-		vga_default_font_height = c->vc_font.height;
+		vga_default_font_height = c->vc_cell_height;
 		return 0;
 	}
 	if (width % 2 || width > screen_info.orig_video_cols ||
 	    height > (screen_info.orig_video_lines * vga_default_font_height)/
-	    c->vc_font.height)
+	    c->vc_cell_height)
 		return -EINVAL;
 
 	if (con_is_visible(c) && !vga_is_gfx) /* who knows */
Index: linux-macro-ide/include/linux/console_struct.h
===================================================================
--- linux-macro-ide.orig/include/linux/console_struct.h
+++ linux-macro-ide/include/linux/console_struct.h
@@ -101,6 +101,7 @@ struct vc_data {
 	unsigned int	vc_rows;
 	unsigned int	vc_size_row;		/* Bytes per row */
 	unsigned int	vc_scan_lines;		/* # of scan lines */
+	unsigned int	vc_cell_height;		/* CRTC character cell height */
 	unsigned long	vc_origin;		/* [!] Start of real screen */
 	unsigned long	vc_scr_end;		/* [!] End of real screen */
 	unsigned long	vc_visible_origin;	/* [!] Top of visible window */
