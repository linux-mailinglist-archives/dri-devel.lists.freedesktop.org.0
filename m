Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9DAFD398
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155E210E012;
	Tue,  8 Jul 2025 16:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0wKXVb25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6B810E012
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:58:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2DDD661443;
 Tue,  8 Jul 2025 16:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF7C4CEF0;
 Tue,  8 Jul 2025 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751993886;
 bh=ACnO6Hzvvfhj0NetMEVYD5IlsR+NbIszPuupEPnaaL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0wKXVb25sTK8SbdGujTR6AgcLFoKBHqz9jZI6HCKYWQ0ZBFZbBuODI7XJOJPngEmz
 99M4nP+StVIoE38PH/WQWJTD4kbCW0skHUS85IY/cBSuLs8fPRxD5xp+s2G2qFW4xX
 h2uV+eHUe4LJ8GEynn1iZUssCudtibumEbrHPMYY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 053/160] tty: vt: make init parameter of
 consw::con_init() a bool
Date: Tue,  8 Jul 2025 18:21:30 +0200
Message-ID: <20250708162233.011657193@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708162231.503362020@linuxfoundation.org>
References: <20250708162231.503362020@linuxfoundation.org>
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

[ Upstream commit dae3e6b6180f1a2394b984c596d39ed2c57d25fe ]

The 'init' parameter of consw::con_init() is true for the first call of
the hook on a particular console. So make the parameter a bool.

And document the hook.

Signed-off-by: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
Tested-by: Helge Deller <deller@gmx.de> # parisc STI console
Link: https://lore.kernel.org/r/20240122110401.7289-21-jirislaby@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Stable-dep-of: 03bcbbb3995b ("dummycon: Trigger redraw when switching consoles with deferred takeover")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
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
index bd125ea5c51f4..0e3d7d8f5e75a 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1050,7 +1050,7 @@ int vc_cons_allocated(unsigned int i)
 	return (i < MAX_NR_CONSOLES && vc_cons[i].d);
 }
 
-static void visual_init(struct vc_data *vc, int num, int init)
+static void visual_init(struct vc_data *vc, int num, bool init)
 {
 	/* ++Geert: vc->vc_sw->con_init determines console size */
 	if (vc->vc_sw)
@@ -1134,7 +1134,7 @@ int vc_allocate(unsigned int currcons)	/* return 0 on success */
 	vc->port.ops = &vc_port_ops;
 	INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 
-	visual_init(vc, currcons, 1);
+	visual_init(vc, currcons, true);
 
 	if (!*vc->vc_uni_pagedir_loc)
 		con_set_default_unimap(vc);
@@ -3521,7 +3521,7 @@ static int __init con_init(void)
 		vc_cons[currcons].d = vc = kzalloc(sizeof(struct vc_data), GFP_NOWAIT);
 		INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 		tty_port_init(&vc->port);
-		visual_init(vc, currcons, 1);
+		visual_init(vc, currcons, true);
 		/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
 		vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
 		vc_init(vc, vc->vc_rows, vc->vc_cols,
@@ -3692,7 +3692,7 @@ static int do_bind_con_driver(const struct consw *csw, int first, int last,
 		old_was_color = vc->vc_can_do_color;
 		vc->vc_sw->con_deinit(vc);
 		vc->vc_origin = (unsigned long)vc->vc_screenbuf;
-		visual_init(vc, i, 0);
+		visual_init(vc, i, false);
 		set_origin(vc);
 		update_attr(vc);
 
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index f1711b2f9ff05..9a19eb72a18b9 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -97,7 +97,7 @@ static const char *dummycon_startup(void)
     return "dummy device";
 }
 
-static void dummycon_init(struct vc_data *vc, int init)
+static void dummycon_init(struct vc_data *vc, bool init)
 {
     vc->vc_can_do_color = 1;
     if (init) {
diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index ef29b321967f0..c5b255c968794 100644
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
index d9c682ae03926..4b7161a81b2f6 100644
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
index f304163e87e99..10302df885147 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -272,7 +272,7 @@ static int sticon_font_set(struct vc_data *vc, struct console_font *font,
 	return sticon_set_font(vc, font);
 }
 
-static void sticon_init(struct vc_data *c, int init)
+static void sticon_init(struct vc_data *c, bool init)
 {
     struct sti_struct *sti = sticon_sti;
     int vc_cols, vc_rows;
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 9bfe451050209..a9777fd38ad92 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -353,7 +353,7 @@ static const char *vgacon_startup(void)
 	return display_desc;
 }
 
-static void vgacon_init(struct vc_data *c, int init)
+static void vgacon_init(struct vc_data *c, bool init)
 {
 	struct uni_pagedict *p;
 
@@ -370,7 +370,7 @@ static void vgacon_init(struct vc_data *c, int init)
 	c->vc_scan_lines = vga_scan_lines;
 	c->vc_font.height = c->vc_cell_height = vga_video_font_height;
 
-	/* set dimensions manually if init != 0 since vc_resize() will fail */
+	/* set dimensions manually if init is true since vc_resize() will fail */
 	if (init) {
 		c->vc_cols = vga_video_num_columns;
 		c->vc_rows = vga_video_num_lines;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index a3af7aacfaf11..f47dbba972fbb 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -983,7 +983,7 @@ static const char *fbcon_startup(void)
 	return display_desc;
 }
 
-static void fbcon_init(struct vc_data *vc, int init)
+static void fbcon_init(struct vc_data *vc, bool init)
 {
 	struct fb_info *info;
 	struct fbcon_ops *ops;
diff --git a/include/linux/console.h b/include/linux/console.h
index a97f277cfdfa3..9258cb8e0841e 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -34,6 +34,8 @@ enum vc_intensity;
 /**
  * struct consw - callbacks for consoles
  *
+ * @con_init:   initialize the console on @vc. @init is true for the very first
+ *		call on this @vc.
  * @con_scroll: move lines from @top to @bottom in direction @dir by @lines.
  *		Return true if no generic handling should be done.
  *		Invoked by csi_M and printing to the console.
@@ -44,7 +46,7 @@ enum vc_intensity;
 struct consw {
 	struct module *owner;
 	const char *(*con_startup)(void);
-	void	(*con_init)(struct vc_data *vc, int init);
+	void	(*con_init)(struct vc_data *vc, bool init);
 	void	(*con_deinit)(struct vc_data *vc);
 	void	(*con_clear)(struct vc_data *vc, int sy, int sx, int height,
 			int width);
-- 
2.39.5



