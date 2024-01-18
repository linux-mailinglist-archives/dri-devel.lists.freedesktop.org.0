Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6583138B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796B10E170;
	Thu, 18 Jan 2024 07:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1C710E719
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C0DE3B8162A;
 Thu, 18 Jan 2024 07:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC3DC43394;
 Thu, 18 Jan 2024 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564719;
 bh=ruW08xm7jMrBAHGzRNp+myzItXRS+fMN96GkzDA9WZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wq1Z+n03j2pUG1JBctlxmejhwSWs4TfkeSc/TZ57gZceKFO/oWaQJW8RsVDEZhNDi
 re+232FEDgiFodZJyK7zAD8T66gFRApisATAVKpcQIdrLQimmORiXzI6FEcdLZEYqw
 90QwXXPhjnIIqGb8p3NTfCHL78YRqamMtWTtCRTUxvEgRsITjIZBT/HA6gfmdg4Lma
 Ef6qm/lpOq/SPDbGrXhWieU0F/QbwU3JCvSv1oboFuw8yRrAU+m+RoYlLxHAY166Xw
 fQ4XDwgwjbosf0ITi5fbxESvteJfm+NUzoaSY4So4FYrOun5MUq7lCuuDaUGztO3v0
 otES0uAZJ5IZg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 19/45] tty: vt: make init parameter of consw::con_init() a bool
Date: Thu, 18 Jan 2024 08:57:30 +0100
Message-ID: <20240118075756.10541-20-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
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

The 'init' parameter of consw::con_init() is true for the first call of
the hook on a particular console. So make the parameter a bool.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                 | 8 ++++----
 drivers/video/console/dummycon.c    | 2 +-
 drivers/video/console/mdacon.c      | 2 +-
 drivers/video/console/newport_con.c | 2 +-
 drivers/video/console/sticon.c      | 2 +-
 drivers/video/console/vgacon.c      | 2 +-
 drivers/video/fbdev/core/fbcon.c    | 2 +-
 include/linux/console.h             | 4 +++-
 8 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index a953c3f262a5..eada45683594 100644
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
@@ -3527,7 +3527,7 @@ static int __init con_init(void)
 		vc_cons[currcons].d = vc = kzalloc(sizeof(struct vc_data), GFP_NOWAIT);
 		INIT_WORK(&vc_cons[currcons].SAK_work, vc_SAK);
 		tty_port_init(&vc->port);
-		visual_init(vc, currcons, 1);
+		visual_init(vc, currcons, true);
 		/* Assuming vc->vc_{cols,rows,screenbuf_size} are sane here. */
 		vc->vc_screenbuf = kzalloc(vc->vc_screenbuf_size, GFP_NOWAIT);
 		vc_init(vc, currcons || !vc->vc_sw->con_save_screen);
@@ -3696,7 +3696,7 @@ static int do_bind_con_driver(const struct consw *csw, int first, int last,
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
index 0c76e2817b49..2c0a952ee51a 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -367,7 +367,7 @@ static const char *vgacon_startup(void)
 	return display_desc;
 }
 
-static void vgacon_init(struct vc_data *c, int init)
+static void vgacon_init(struct vc_data *c, bool init)
 {
 	struct uni_pagedict *p;
 
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

