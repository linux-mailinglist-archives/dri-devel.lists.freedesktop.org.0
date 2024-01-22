Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B92836072
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0910ED6D;
	Mon, 22 Jan 2024 11:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32FE10ED67
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB2A2612EE;
 Mon, 22 Jan 2024 11:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145C2C43394;
 Mon, 22 Jan 2024 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921508;
 bh=ab3iO5eB3FsNHgSte6RrqeuJox0Ztd4VE2emwNkTWnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QaT/Jk7BEL78I9U8fb1XmJZ05aC0qCpjcl9MCDeTxrKvPZVasheuUJs5lAKtw+hGj
 u2okeF2UeJJb3Ird5Sb4lroyb40yuT55yBrhW/js2TGCuPUQUMYG/f/wIL5WjwcHjL
 nzhTF8mgaObz/wjPNyMLGGk/r8EhAXWHVAQwhA9yuLLW4qemjPHebG9/mnL5D6z4Da
 0NWpd+w2H06uWf59iPJJ00T9Y8rZ8jaofjKXyIHh/N7mXyYZ1j8qV3Pp+RoX8Jq+pL
 rwqaXEoJIQQ27S9Fg5dSC5lfZAcbL2n8AhSPSbVFds9k2xDfLUMMuTW/aExAzoCT+a
 V1W1O19AYCBcA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 31/47] tty: vt: stop using -1 for blank mode in
 consw::con_blank()
Date: Mon, 22 Jan 2024 12:03:45 +0100
Message-ID: <20240122110401.7289-32-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-1 is the same as VESA_VSYNC_SUSPEND in all con_blank() implementations.
So we can remove this special case from vgacon now too.

Despite con_blank() of fbcon looks complicated, the "if
(!fbcon_is_inactive(vc, info))" branch is not taken as we set
"ops->graphics = 1;" few lines above. So what matters there (as in all
other blank implementations except vgacon) is if 'blank' is zero or not.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/tty/vt/vt.c            | 2 +-
 drivers/video/console/vgacon.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index fd868046f586..13be125a06aa 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4347,7 +4347,7 @@ void do_blank_screen(int entering_gfx)
 	if (entering_gfx) {
 		hide_cursor(vc);
 		save_screen(vc);
-		vc->vc_sw->con_blank(vc, -1, 1);
+		vc->vc_sw->con_blank(vc, 1, 1);
 		console_blanked = fg_console + 1;
 		blank_state = blank_off;
 		set_origin(vc);
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index f89eb53c0b79..804b6a180b60 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -814,7 +814,6 @@ static int vgacon_blank(struct vc_data *c, int blank, int mode_switch)
 		/* Tell console.c that it has to restore the screen itself */
 		return 1;
 	case 1:		/* Normal blanking */
-	case -1:	/* Obsolete */
 		if (!mode_switch && vga_video_type == VIDEO_TYPE_VGAC) {
 			vga_pal_blank(&vgastate);
 			vga_palette_blanked = true;
-- 
2.43.0

