Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08F8313B7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205F10E72F;
	Thu, 18 Jan 2024 07:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99610E73F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:59:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 62941B816EC;
 Thu, 18 Jan 2024 07:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89967C43601;
 Thu, 18 Jan 2024 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564746;
 bh=1JA5AooyZLXGqVCAGbSDSuK+q4Ohn8Zc6gZRRlzf9bA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BXfXfYoSYpvTCIeWRHpilD2rVpaS8JT+XmLttQvYBF0iQLK2W4NJbrdXyAjLkiTyI
 94OswkcWBFi2tCRhwgda1dfssgJ4B6prz1UWT44wB+bRKQSLpQNansdc+sxKatxcnD
 2/h6mnDRiA3gkqcElSRnBLvCGceeH1VuShDp2gcwENBfBZjG0ekzdVWXR+jfcei/BM
 kH9KJr3y9m3zN1HmFO5wqML5y/KtdOdHjsBejxY1JLSe6VXlTeA+5HRBH+zX8eBVY1
 9qugeiDF/Uxezsim4HQom06kGaN85b4gJ4SPM2uKC2WabkFW/VZQXozWOlsmTR9upz
 Z24rUj6n1kQww==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 30/45] tty: vt: stop using -1 for blank mode in
 consw::con_blank()
Date: Thu, 18 Jan 2024 08:57:41 +0100
Message-ID: <20240118075756.10541-31-jirislaby@kernel.org>
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
index 88d7b48871fb..279f802aa222 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4361,7 +4361,7 @@ void do_blank_screen(int entering_gfx)
 	if (entering_gfx) {
 		hide_cursor(vc);
 		save_screen(vc);
-		vc->vc_sw->con_blank(vc, -1, 1);
+		vc->vc_sw->con_blank(vc, 1, 1);
 		console_blanked = fg_console + 1;
 		blank_state = blank_off;
 		set_origin(vc);
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index e303098aabab..5025ab501f02 100644
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

