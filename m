Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624282EAA4F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 13:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2916E0E9;
	Tue,  5 Jan 2021 12:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04B6E0E9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 12:02:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B64D0ADD9;
 Tue,  5 Jan 2021 12:02:41 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH 09/12] vgacon: drop BROKEN_GRAPHICS_PROGRAMS
Date: Tue,  5 Jan 2021 13:02:36 +0100
Message-Id: <20210105120239.28031-9-jslaby@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105120239.28031-1-jslaby@suse.cz>
References: <20210105120239.28031-1-jslaby@suse.cz>
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
Cc: dri-devel@lists.freedesktop.org, Jiri Slaby <jslaby@suse.cz>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BROKEN_GRAPHICS_PROGRAMS is defined when CONFIG_VGA_CONSOLE=y. And
vgacon.c is built exclusively in that case too. So the check for
BROKEN_GRAPHICS_PROGRAMS is pointless in vgacon.c as it is always true.
So remove the test and BROKEN_GRAPHICS_PROGRAMS completely.

This also eliminates the need for vga_font_is_default global as it is
only set and never read.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/console/vgacon.c | 19 -------------------
 include/linux/vt_kern.h        | 12 ------------
 2 files changed, 31 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 17876f0179b5..962c12be9774 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -90,7 +90,6 @@ static unsigned int	vga_video_num_lines;			/* Number of text lines */
 static bool		vga_can_do_color;			/* Do we support colors? */
 static unsigned int	vga_default_font_height __read_mostly;	/* Height of default screen font */
 static unsigned char	vga_video_type		__read_mostly;	/* Card type */
-static bool		vga_font_is_default = true;
 static int		vga_vesa_blanked;
 static bool 		vga_palette_blanked;
 static bool 		vga_is_gfx;
@@ -878,7 +877,6 @@ static int vgacon_do_font_op(struct vgastate *state, char *arg, int set,
 		beg = 0x0a;
 	}
 
-#ifdef BROKEN_GRAPHICS_PROGRAMS
 	/*
 	 * All fonts are loaded in slot 0 (0:1 for 512 ch)
 	 */
@@ -886,24 +884,7 @@ static int vgacon_do_font_op(struct vgastate *state, char *arg, int set,
 	if (!arg)
 		return -EINVAL;	/* Return to default font not supported */
 
-	vga_font_is_default = false;
 	font_select = ch512 ? 0x04 : 0x00;
-#else
-	/*
-	 * The default font is kept in slot 0 and is never touched.
-	 * A custom font is loaded in slot 2 (256 ch) or 2:3 (512 ch)
-	 */
-
-	if (set) {
-		vga_font_is_default = !arg;
-		if (!arg)
-			ch512 = false;	/* Default font is always 256 */
-		font_select = arg ? (ch512 ? 0x0e : 0x0a) : 0x00;
-	}
-
-	if (!vga_font_is_default)
-		charmap += 4 * cmapsz;
-#endif
 
 	raw_spin_lock_irq(&vga_lock);
 	/* First, the Sequencer */
diff --git a/include/linux/vt_kern.h b/include/linux/vt_kern.h
index 349e39c3ab60..94e7a315479c 100644
--- a/include/linux/vt_kern.h
+++ b/include/linux/vt_kern.h
@@ -16,18 +16,6 @@
 #include <linux/consolemap.h>
 #include <linux/notifier.h>
 
-/*
- * Presently, a lot of graphics programs do not restore the contents of
- * the higher font pages.  Defining this flag will avoid use of them, but
- * will lose support for PIO_FONTRESET.  Note that many font operations are
- * not likely to work with these programs anyway; they need to be
- * fixed.  The linux/Documentation directory includes a code snippet
- * to save and restore the text font.
- */
-#ifdef CONFIG_VGA_CONSOLE
-#define BROKEN_GRAPHICS_PROGRAMS 1
-#endif
-
 void kd_mksound(unsigned int hz, unsigned int ticks);
 int kbd_rate(struct kbd_repeat *rep);
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
