Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A41836074
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A56210ED76;
	Mon, 22 Jan 2024 11:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634AD10ED64
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF475612D2;
 Mon, 22 Jan 2024 11:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F606C433C7;
 Mon, 22 Jan 2024 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921513;
 bh=DwWv6x3M86fYyUgpn5zQFX4R3m7tZMS8FcG3yrjv1Ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lUXVTr/M+WAcLTwATBJi6yXN7gzivXUNH+x2E5UeczoFkJcszbBBdE8aJGUWWEftL
 HAt7qfJJICeCOFgV5JtMrmfqZ/u27eU7sOnWTp47tDrYBXpaqw3QGOJpo/woj27zkr
 b+xXPSmvdIX+BubFjGoMYH/O/V4fpyYlrJ4ma7G5C1Lyn8fl6UpITTyeIbxSvZ2bMy
 HnFROFutbKqPFZzBbvAcrEwJG3Dgf0m8BdWv/x56ICr3xIzUXoL5AOgFRUlSLdi9Io
 4o5sVYXikT4/2Q8By34xeUIgf/LLHgcNy+uti/NEePNxDXJFAlqzsedw0vsjgu/yBP
 ECsXlTRQCvjDA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 33/47] tty: vt: use VESA blanking constants
Date: Mon, 22 Jan 2024 12:03:47 +0100
Message-ID: <20240122110401.7289-34-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are VESA blanking constants defined in vesa.h. So use them in the
console code instead of constant values.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---

Notes:
    [v2] reword the commit log after vesa.h introduction

 drivers/tty/vt/vt.c                 | 9 +++++----
 drivers/video/console/newport_con.c | 2 +-
 drivers/video/console/sticon.c      | 2 +-
 drivers/video/console/vgacon.c      | 6 +++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 13be125a06aa..0d5d7b5074a4 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4320,7 +4320,7 @@ static int set_vesa_blanking(u8 __user *mode_user)
 		return -EFAULT;
 
 	console_lock();
-	vesa_blank_mode = (mode < 4) ? mode : 0;
+	vesa_blank_mode = (mode < 4) ? mode : VESA_NO_BLANKING;
 	console_unlock();
 
 	return 0;
@@ -4347,7 +4347,7 @@ void do_blank_screen(int entering_gfx)
 	if (entering_gfx) {
 		hide_cursor(vc);
 		save_screen(vc);
-		vc->vc_sw->con_blank(vc, 1, 1);
+		vc->vc_sw->con_blank(vc, VESA_VSYNC_SUSPEND, 1);
 		console_blanked = fg_console + 1;
 		blank_state = blank_off;
 		set_origin(vc);
@@ -4368,7 +4368,8 @@ void do_blank_screen(int entering_gfx)
 
 	save_screen(vc);
 	/* In case we need to reset origin, blanking hook returns 1 */
-	i = vc->vc_sw->con_blank(vc, vesa_off_interval ? 1 : (vesa_blank_mode + 1), 0);
+	i = vc->vc_sw->con_blank(vc, vesa_off_interval ? VESA_VSYNC_SUSPEND :
+				 (vesa_blank_mode + 1), 0);
 	console_blanked = fg_console + 1;
 	if (i)
 		set_origin(vc);
@@ -4419,7 +4420,7 @@ void do_unblank_screen(int leaving_gfx)
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
index 804b6a180b60..02eccd9b3542 100644
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

