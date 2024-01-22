Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495DF836068
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800E910ED67;
	Mon, 22 Jan 2024 11:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7710ED64
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B572F612FB;
 Mon, 22 Jan 2024 11:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC1BC43399;
 Mon, 22 Jan 2024 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921480;
 bh=HjCwKi61NPZ3xwOy4YdkKxzNOQhrc/a42C/U0YTYnBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XoZqtEMjUyfYRuFxJh8hkLFFCJnkb4vX6uVtDaE2jz8V00lGQR27Gp0DIz9/miBCv
 9a7ZMaj0KZykSr4Uis0Y8tZ3VgFCg1TvJm7srpTkc4WFNIZOl89ujMA12QGgbSOWuU
 /cbY7FGJPWBXZS1e8AWxA0nl2WrOOoaYPWdsMSNXoKLGM4GN33u7vYekZActxwqTgW
 K3Jpp97pJ+o/+CKUzc1zg9BXsV8yk+EToZ4pt00yzDx9nEg+5VI6OUzdNzMTxS4C77
 pIXnCyu3OZU4T7m9jJ/oRXwzj1v+VISY5bAUo379he7JgE5lu5U3qIvBN7xKOSwOpy
 NRWqOyTNDcy2w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 19/47] tty: vt: make consw::con_debug_*() return void
Date: Mon, 22 Jan 2024 12:03:33 +0100
Message-ID: <20240122110401.7289-20-jirislaby@kernel.org>
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
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of con_debug_enter() and con_debug_leave() is ignored
on many fronts. So just don't propagate errors (the current
implementations return 0 anyway) and make the return type a void.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/tty/vt/vt.c              | 21 ++++-----------------
 drivers/video/fbdev/core/fbcon.c |  6 ++----
 include/linux/console.h          | 18 ++++++------------
 3 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 51a2787415db..bbfda0d33ca1 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4012,15 +4012,9 @@ EXPORT_SYMBOL(con_is_visible);
  * Called when the console is taken over by the kernel debugger, this
  * function needs to save the current console state, then put the console
  * into a state suitable for the kernel debugger.
- *
- * RETURNS:
- * Zero on success, nonzero if a failure occurred when trying to prepare
- * the console for the debugger.
  */
-int con_debug_enter(struct vc_data *vc)
+void con_debug_enter(struct vc_data *vc)
 {
-	int ret = 0;
-
 	saved_fg_console = fg_console;
 	saved_last_console = last_console;
 	saved_want_console = want_console;
@@ -4029,7 +4023,7 @@ int con_debug_enter(struct vc_data *vc)
 	vc->vc_mode = KD_TEXT;
 	console_blanked = 0;
 	if (vc->vc_sw->con_debug_enter)
-		ret = vc->vc_sw->con_debug_enter(vc);
+		vc->vc_sw->con_debug_enter(vc);
 #ifdef CONFIG_KGDB_KDB
 	/* Set the initial LINES variable if it is not already set */
 	if (vc->vc_rows < 999) {
@@ -4059,7 +4053,6 @@ int con_debug_enter(struct vc_data *vc)
 		}
 	}
 #endif /* CONFIG_KGDB_KDB */
-	return ret;
 }
 EXPORT_SYMBOL_GPL(con_debug_enter);
 
@@ -4068,15 +4061,10 @@ EXPORT_SYMBOL_GPL(con_debug_enter);
  *
  * Restore the console state to what it was before the kernel debugger
  * was invoked.
- *
- * RETURNS:
- * Zero on success, nonzero if a failure occurred when trying to restore
- * the console.
  */
-int con_debug_leave(void)
+void con_debug_leave(void)
 {
 	struct vc_data *vc;
-	int ret = 0;
 
 	fg_console = saved_fg_console;
 	last_console = saved_last_console;
@@ -4086,8 +4074,7 @@ int con_debug_leave(void)
 
 	vc = vc_cons[fg_console].d;
 	if (vc->vc_sw->con_debug_leave)
-		ret = vc->vc_sw->con_debug_leave(vc);
-	return ret;
+		vc->vc_sw->con_debug_leave(vc);
 }
 EXPORT_SYMBOL_GPL(con_debug_leave);
 
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index dd2f4617485c..d3fb98084eda 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2243,7 +2243,7 @@ static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch)
 	return 0;
 }
 
-static int fbcon_debug_enter(struct vc_data *vc)
+static void fbcon_debug_enter(struct vc_data *vc)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -2253,10 +2253,9 @@ static int fbcon_debug_enter(struct vc_data *vc)
 	if (info->fbops->fb_debug_enter)
 		info->fbops->fb_debug_enter(info);
 	fbcon_set_palette(vc, color_table);
-	return 0;
 }
 
-static int fbcon_debug_leave(struct vc_data *vc)
+static void fbcon_debug_leave(struct vc_data *vc)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_ops *ops = info->fbcon_par;
@@ -2264,7 +2263,6 @@ static int fbcon_debug_leave(struct vc_data *vc)
 	ops->graphics = ops->save_graphics;
 	if (info->fbops->fb_debug_leave)
 		info->fbops->fb_debug_leave(info);
-	return 0;
 }
 
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
diff --git a/include/linux/console.h b/include/linux/console.h
index 38b379d6c624..93a1db5bf3b5 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -88,11 +88,11 @@ struct consw {
 	 * limited to, unblanking the console, loading an appropriate
 	 * palette, and allowing debugger generated output.
 	 */
-	int	(*con_debug_enter)(struct vc_data *vc);
+	void	(*con_debug_enter)(struct vc_data *vc);
 	/*
 	 * Restore the console to its pre-debug state as closely as possible.
 	 */
-	int	(*con_debug_leave)(struct vc_data *vc);
+	void	(*con_debug_leave)(struct vc_data *vc);
 };
 
 extern const struct consw *conswitchp;
@@ -113,17 +113,11 @@ int do_unregister_con_driver(const struct consw *csw);
 int do_take_over_console(const struct consw *sw, int first, int last, int deflt);
 void give_up_console(const struct consw *sw);
 #ifdef CONFIG_HW_CONSOLE
-int con_debug_enter(struct vc_data *vc);
-int con_debug_leave(void);
+void con_debug_enter(struct vc_data *vc);
+void con_debug_leave(void);
 #else
-static inline int con_debug_enter(struct vc_data *vc)
-{
-	return 0;
-}
-static inline int con_debug_leave(void)
-{
-	return 0;
-}
+static inline void con_debug_enter(struct vc_data *vc) { }
+static inline void con_debug_leave(void) { }
 #endif
 
 /* cursor */
-- 
2.43.0

