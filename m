Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3683606D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2EE10ED6B;
	Mon, 22 Jan 2024 11:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0AA10ED6A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:04:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6546FCE2A30;
 Mon, 22 Jan 2024 11:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB2CC43390;
 Mon, 22 Jan 2024 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921483;
 bh=78VMq3JL8t5gBveknAo3r3rRe+fLL5A0Pbc/IeE/Bko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vo+oIk5hcf9XziDdJe4Rm/T/rNPEaG7DGugZy7DDdgBPbLbVuLgwGknpsyuFXDiAa
 IFNujXbRkx/OkOO/BuCRZCr0fwW+y5Xw5DSEjxqJR+hprAyH7zp3+kSKGZHGKapAPW
 BOoWiax/6cwAh0px2MIR6hvqFFa311dKjbbmLWDPMmhu3s8BD3n+iOlxcCnoPp6qbS
 NVynEYLJGOFvOKHraQznn8PUULWCO3jsESmA1vc20C7UI1GcYQ3xrdQ/L9CKwR2p5M
 832M1N7pFwn/1PlqB7K/HnsMeGDLJptW2Ed5JAgq0JeGYmTyWApyQSSFw0nrKntwqh
 Nk7gzMNLPj7QQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 20/47] tty: vt: make init parameter of consw::con_init() a
 bool
Date: Mon, 22 Jan 2024 12:03:34 +0100
Message-ID: <20240122110401.7289-21-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-parisc@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'init' parameter of consw::con_init() is true for the first call of
the hook on a particular console. So make the parameter a bool.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---

Notes:
    [v2] fix up the comment (Geert)

 drivers/tty/vt/vt.c                 | 8 ++++----
 drivers/video/console/dummycon.c    | 2 +-
 drivers/video/console/mdacon.c      | 2 +-
 drivers/video/console/newport_con.c | 2 +-
 drivers/video/console/sticon.c      | 2 +-
 drivers/video/console/vgacon.c      | 4 ++--
 drivers/video/fbdev/core/fbcon.c    | 2 +-
 include/linux/console.h             | 4 +++-
 8 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index bbfda0d33ca1..fcb41c8724f3 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -999,7 +999,7 @@ int vc_cons_allocated(unsigned int i)
 	return (i < MAX_NR_CONSOLES && vc_cons[i].d);
 }
 
-static void visual_init(struct vc_data *vc, int num, int init)
+static void visual_init(struct vc_data *vc, int num, bool init)
 {
 	/* ++Geert: vc->vc_sw->con_init determines console size */
 	if (vc->vc_sw)
@@ -1083,7 +1083,7 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 	vc->port.ops = &vc_port_ops;
 	INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 
-	visual_init(vc, currcons, 1);
+	visual_init(vc, currcons, true);
 
 	if (!*vc->uni_pagedict_loc)
 		con_set_default_unimap(vc);
@@ -3513,7 +3513,7 @@ static int __init con_init(void)
 		vc_cons[currcons].d = vc = kzalloc(sizeof(struct vc_data), GFP_NOWAIT);
 		INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 		tty_port_init(&vc->port);
-		visual_init(vc, currcons, 1);
+		visual_init(vc, currcons, true);
 		/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
 		vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
 		vc_init(vc, currcons || !vc->vc_sw->con_save_screen);
@@ -3682,7 +3682,7 @@ static int do_bind_con_driver(const struct consw *csw, int first, int last,
 		old_was_color = vc->vc_can_do_color;
 		vc->vc_sw->con_deinit(vc);
 		vc->vc_origin = (unsigned long)vc->vc_screenbuf;
-		visual_init(vc, i, 0);
+		visual_init(vc, i, false);
 		set_origin(vc);
 		update_attr(vc);
 
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 14af5d9e13b0..f2cef9d9a4b5 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -98,7 +98,7 @@ static const char *dummycon_startup(void)
     return "dummy device";
 }
 
-static void dummycon_init(struct vc_data *vc, int init)
+static void dummycon_init(struct vc_data *vc, bool init)
 {
     vc->vc_can_do_color = 1;
     if (init) {
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index ef29b321967f..c5b255c96879 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -352,7 +352,7 @@ static const char *mdacon_startup(void)
 	return "MDA-2";
 }
 
-static void mdacon_init(struct vc_data *c, int init)
+static void mdacon_init(struct vc_data *c, bool init)
 {
 	c->vc_complement_mask = 0x0800;	 /* reverse video */
 	c->vc_display_fg = &mda_display_fg;
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index e8e4f82cd4a1..12c64ef47087 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -324,7 +324,7 @@ static const char *newport_startup(void)
 	return NULL;
 }
 
-static void newport_init(struct vc_data *vc, int init)
+static void newport_init(struct vc_data *vc, bool init)
 {
 	int cols, rows;
 
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 992a4fa431aa..0bfeabc3f7c7 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -273,7 +273,7 @@ static int sticon_font_set(struct vc_data *vc, struct console_font *font,
 	return sticon_set_font(vc, font, vpitch);
 }
 
-static void sticon_init(struct vc_data *c, int init)
+static void sticon_init(struct vc_data *c, bool init)
 {
     struct sti_struct *sti = sticon_sti;
     int vc_cols, vc_rows;
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 0c76e2817b49..5d523753def8 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -367,7 +367,7 @@ static const char *vgacon_startup(void)
 	return display_desc;
 }
 
-static void vgacon_init(struct vc_data *c, int init)
+static void vgacon_init(struct vc_data *c, bool init)
 {
 	struct uni_pagedict *p;
 
@@ -384,7 +384,7 @@ static void vgacon_init(struct vc_data *c, int init)
 	c->vc_scan_lines = vga_scan_lines;
 	c->vc_font.height = c->vc_cell_height = vga_video_font_height;
 
-	/* set dimensions manually if init != 0 since vc_resize() will fail */
+	/* set dimensions manually if init is true since vc_resize() will fail */
 	if (init) {
 		c->vc_cols = vga_video_num_columns;
 		c->vc_rows = vga_video_num_lines;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d3fb98084eda..939c5d893dfb 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -988,7 +988,7 @@ static const char *fbcon_startup(void)
 	return display_desc;
 }
 
-static void fbcon_init(struct vc_data *vc, int init)
+static void fbcon_init(struct vc_data *vc, bool init)
 {
 	struct fb_info *info;
 	struct fbcon_ops *ops;
diff --git a/include/linux/console.h b/include/linux/console.h
index 93a1db5bf3b5..fc9450e0c78f 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -36,6 +36,8 @@ enum vc_intensity;
 /**
  * struct consw - callbacks for consoles
  *
+ * @con_init:   initialize the console on @vc. @init is true for the very first
+ *		call on this @vc.
  * @con_scroll: move lines from @top to @bottom in direction @dir by @lines.
  *		Return true if no generic handling should be done.
  *		Invoked by csi_M and printing to the console.
@@ -46,7 +48,7 @@ enum vc_intensity;
 struct consw {
 	struct module *owner;
 	const char *(*con_startup)(void);
-	void	(*con_init)(struct vc_data *vc, int init);
+	void	(*con_init)(struct vc_data *vc, bool init);
 	void	(*con_deinit)(struct vc_data *vc);
 	void	(*con_clear)(struct vc_data *vc, int sy, int sx, int height,
 			int width);
-- 
2.43.0

