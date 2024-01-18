Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16DC8313B9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFEB10E16D;
	Thu, 18 Jan 2024 07:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3C10E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:59:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C9D3DB816F0;
 Thu, 18 Jan 2024 07:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4524C433F1;
 Thu, 18 Jan 2024 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564749;
 bh=3+fT7y4vRss9smAO0NdBzkZKlN2+aEu/ZpMHzkjUSRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dZuUz3QQy7z4YnVtOpAZWlvuuNO8+VJFV+d1OrC2KG9SmTWRPzZoyww1Nrzm25dgG
 1hCs3IG555y/b+v8eYzlMKQZ3FcV4uCmUQJVrgvRL/63w0XFzWFWNKl1+iErUopqTd
 woIZSZQIiCdKayF1AAjlAdlpiDwYoE6tSkMas8FuT25MWYSz+ZthdlNulvknLFvLQg
 XkBSJEOYIdNDakmud3yLFkEvf6/25pb5j6xJEIyfarcM4yztrAKtebP0IbdDcxgPqc
 FssbfWajDfp3CoJmWZygp6MS59lhXp8d9ClglygKzLeCKQ3QByYezTzWfj1/RAsyGq
 8WdXKeHwn8Izg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 31/45] tty: vt: use VESA blanking constants
Date: Thu, 18 Jan 2024 08:57:42 +0100
Message-ID: <20240118075756.10541-32-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are VESA blanking constants defined in console.h already. So use
them in the console code instead of constant values.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                 | 9 +++++----
 drivers/video/console/newport_con.c | 2 +-
 drivers/video/console/sticon.c      | 2 +-
 drivers/video/console/vgacon.c      | 6 +++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 279f802aa222..6f46fefedcfb 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4334,7 +4334,7 @@ static int set_vesa_blanking(u8 __user *mode_user)
 		return -EFAULT;
 
 	console_lock();
-	vesa_blank_mode = (mode < 4) ? mode : 0;
+	vesa_blank_mode = (mode < 4) ? mode : VESA_NO_BLANKING;
 	console_unlock();
 
 	return 0;
@@ -4361,7 +4361,7 @@ void do_blank_screen(int entering_gfx)
 	if (entering_gfx) {
 		hide_cursor(vc);
 		save_screen(vc);
-		vc->vc_sw->con_blank(vc, 1, 1);
+		vc->vc_sw->con_blank(vc, VESA_VSYNC_SUSPEND, 1);
 		console_blanked = fg_console + 1;
 		blank_state = blank_off;
 		set_origin(vc);
@@ -4382,7 +4382,8 @@ void do_blank_screen(int entering_gfx)
 
 	save_screen(vc);
 	/* In case we need to reset origin, blanking hook returns 1 */
-	i = vc->vc_sw->con_blank(vc, vesa_off_interval ? 1 : (vesa_blank_mode + 1), 0);
+	i = vc->vc_sw->con_blank(vc, vesa_off_interval ? VESA_VSYNC_SUSPEND :
+				 (vesa_blank_mode + 1), 0);
 	console_blanked = fg_console + 1;
 	if (i)
 		set_origin(vc);
@@ -4433,7 +4434,7 @@ void do_unblank_screen(int leaving_gfx)
 	}
 
 	console_blanked = 0;
-	if (vc->vc_sw->con_blank(vc, 0, leaving_gfx))
+	if (vc->vc_sw->con_blank(vc, VESA_NO_BLANKING, leaving_gfx))
 		/* Low-level driver cannot restore -> do it ourselves */
 		update_screen(vc);
 	if (console_blank_hook)
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 039d1c9937d2..ad3a09142770 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -480,7 +480,7 @@ static int newport_blank(struct vc_data *c, int blank, int mode_switch)
 {
 	unsigned short treg;
 
-	if (blank == 0) {
+	if (blank == VESA_NO_BLANKING) {
 		/* unblank console */
 		treg = newport_vc2_get(npregs, VC2_IREG_CONTROL);
 		newport_vc2_set(npregs, VC2_IREG_CONTROL,
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index f3bb48a0e980..817b89c45e81 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -300,7 +300,7 @@ static bool sticon_switch(struct vc_data *conp)
 
 static int sticon_blank(struct vc_data *c, int blank, int mode_switch)
 {
-    if (blank == 0) {
+    if (blank == VESA_NO_BLANKING) {
 	if (mode_switch)
 	    vga_is_gfx = 0;
 	return 1;
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 5025ab501f02..910dc73874b7 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -800,10 +800,10 @@ static void vga_pal_blank(struct vgastate *state)
 static int vgacon_blank(struct vc_data *c, int blank, int mode_switch)
 {
 	switch (blank) {
-	case 0:		/* Unblank */
+	case VESA_NO_BLANKING:		/* Unblank */
 		if (vga_vesa_blanked) {
 			vga_vesa_unblank(&vgastate);
-			vga_vesa_blanked = 0;
+			vga_vesa_blanked = VESA_NO_BLANKING;
 		}
 		if (vga_palette_blanked) {
 			vga_set_palette(c, color_table);
@@ -813,7 +813,7 @@ static int vgacon_blank(struct vc_data *c, int blank, int mode_switch)
 		vga_is_gfx = false;
 		/* Tell console.c that it has to restore the screen itself */
 		return 1;
-	case 1:		/* Normal blanking */
+	case VESA_VSYNC_SUSPEND:	/* Normal blanking */
 		if (!mode_switch && vga_video_type == VIDEO_TYPE_VGAC) {
 			vga_pal_blank(&vgastate);
 			vga_palette_blanked = true;
-- 
2.43.0

