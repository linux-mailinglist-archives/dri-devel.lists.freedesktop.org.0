Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137FC836078
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E34410ED81;
	Mon, 22 Jan 2024 11:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEF210ED81
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E36ECCE2A2E;
 Mon, 22 Jan 2024 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA67C433F1;
 Mon, 22 Jan 2024 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921519;
 bh=jj1hMXsXkxwRc3fMIyRBRr1lyLzgBskNQ+TSGxMFuJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iRDz/HgsVPfI1ETWhxsfURPUYmKjNXadNhHYwVsgzD4TztkSsGEiawk2edo9XX7XD
 n7to30fU8OOAxfPHcF2oGzC+eab4LAZRGExBmPxpjCZK7Fdr39ZCCv6bzmQHsoY3u9
 P0KfSet+B7c0DR8bT+cip5O5XKU9XhoDAo979lJJW3y/mts8ANB5zLP0zyvWW0jGLS
 ehoHVIpVk1DS9r7mNcVEZcIs9Ix77+Hhe3YOig2W1M5KeNEzD3jXOA46rPxOto3gIb
 fajvsfMvX+jfDzCoT4aWKauoG2xHUECjhxoox+Dad2jFYVKoIzi1TNNp6cKa7Oca8q
 wSieK9YOJu6sg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 35/47] tty: vt: make types around consw::con_blank() bool
Date: Mon, 22 Jan 2024 12:03:49 +0100
Message-ID: <20240122110401.7289-36-jirislaby@kernel.org>
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

Both the mode_switch parameter and the return value (a redraw needed)
are true/false. So switch them to bool, so that users won't return
-Eerrors or anything else.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/video/console/dummycon.c    | 12 ++++++------
 drivers/video/console/mdacon.c      |  8 ++++----
 drivers/video/console/newport_con.c |  7 ++++---
 drivers/video/console/sticon.c      |  9 +++++----
 drivers/video/console/vgacon.c      |  4 ++--
 drivers/video/fbdev/core/fbcon.c    |  6 +++---
 include/linux/console.h             |  7 +++++--
 7 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index d86c1d798690..139049368fdc 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -79,21 +79,21 @@ static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	raw_notifier_call_chain(&dummycon_output_nh, 0, NULL);
 }
 
-static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-			  int mode_switch)
+static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			   bool mode_switch)
 {
 	/* Redraw, so that we get putc(s) for output done while blanked */
-	return 1;
+	return true;
 }
 #else
 static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
 			  unsigned int x) { }
 static void dummycon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 			   unsigned int ypos, unsigned int xpos) { }
-static int dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-			  int mode_switch)
+static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			   bool mode_switch)
 {
-	return 0;
+	return false;
 }
 #endif
 
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 63e3ce678aab..c0e1f4554a44 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -451,8 +451,8 @@ static bool mdacon_switch(struct vc_data *c)
 	return true;	/* redrawing needed */
 }
 
-static int mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
 	if (mda_type == TYPE_MDA) {
 		if (blank) 
@@ -460,14 +460,14 @@ static int mdacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
 				mda_convert_attr(c->vc_video_erase_char),
 				c->vc_screenbuf_size);
 		/* Tell console.c that it has to restore the screen itself */
-		return 1;
+		return true;
 	} else {
 		if (blank)
 			outb_p(0x00, mda_mode_port);	/* disable video */
 		else
 			outb_p(MDA_MODE_VIDEO_EN | MDA_MODE_BLINK_EN, 
 				mda_mode_port);
-		return 0;
+		return false;
 	}
 }
 
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 38437a53b7f1..dbb31bf87bf1 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -476,8 +476,8 @@ static bool newport_switch(struct vc_data *vc)
 	return true;
 }
 
-static int newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			 int mode_switch)
+static bool newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			  bool mode_switch)
 {
 	unsigned short treg;
 
@@ -492,7 +492,8 @@ static int newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
 		newport_vc2_set(npregs, VC2_IREG_CONTROL,
 				(treg & ~(VC2_CTRL_EDISP)));
 	}
-	return 1;
+
+	return true;
 }
 
 static int newport_set_font(int unit, struct console_font *op, unsigned int vpitch)
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index e9d5d1f92883..cbb9ef438214 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -298,19 +298,20 @@ static bool sticon_switch(struct vc_data *conp)
     return true;	/* needs refreshing */
 }
 
-static int sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
     if (blank == VESA_NO_BLANKING) {
 	if (mode_switch)
 	    vga_is_gfx = 0;
-	return 1;
+	return true;
     }
     sti_clear(sticon_sti, 0, 0, c->vc_rows, c->vc_cols, BLANK,
 	      font_data[c->vc_num]);
     if (mode_switch)
 	vga_is_gfx = 1;
-    return 1;
+
+    return true;
 }
 
 static u8 sticon_build_attr(struct vc_data *conp, u8 color,
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 84f3682704c7..c9a22118102f 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -797,8 +797,8 @@ static void vga_pal_blank(struct vgastate *state)
 	}
 }
 
-static int vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
-			int mode_switch)
+static bool vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
+			 bool mode_switch)
 {
 	switch (blank) {
 	case VESA_NO_BLANKING:		/* Unblank */
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 69be5f2106bc..eee2adf5c682 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2198,8 +2198,8 @@ static void fbcon_generic_blank(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static int fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
-		       int mode_switch)
+static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
+			bool mode_switch)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -2238,7 +2238,7 @@ static int fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 	else
 		fbcon_add_cursor_work(info);
 
-	return 0;
+	return false;
 }
 
 static void fbcon_debug_enter(struct vc_data *vc)
diff --git a/include/linux/console.h b/include/linux/console.h
index 69040d7c8f97..6392bcd2fe7c 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -49,6 +49,9 @@ enum vc_intensity;
  *		Invoked by csi_M and printing to the console.
  * @con_switch: notifier about the console switch; it is supposed to return
  *		true if a redraw is needed.
+ * @con_blank:  blank/unblank the console. The target mode is passed in @blank.
+ *		@mode_switch is set if changing from/to text/graphics. The hook
+ *		is supposed to return true if a redraw is needed.
  * @con_set_palette: sets the palette of the console to @table (optional)
  * @con_scrolldelta: the contents of the console should be scrolled by @lines.
  *		     Invoked by user. (optional)
@@ -70,8 +73,8 @@ struct consw {
 			unsigned int bottom, enum con_scroll dir,
 			unsigned int lines);
 	bool	(*con_switch)(struct vc_data *vc);
-	int	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
-			     int mode_switch);
+	bool	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
+			     bool mode_switch);
 	int	(*con_font_set)(struct vc_data *vc, struct console_font *font,
 			unsigned int vpitch, unsigned int flags);
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font,
-- 
2.43.0

