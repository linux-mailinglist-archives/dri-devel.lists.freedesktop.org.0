Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCE8313A6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708910E732;
	Thu, 18 Jan 2024 07:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17910E732
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4EE0CB8162A;
 Thu, 18 Jan 2024 07:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC7BC43394;
 Thu, 18 Jan 2024 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564735;
 bh=9KIJ7uIX/Te/xBlz0NrBY1Kbgsi0p9OXSqQTf+AUMRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gWdMkNEosEIzFt3TlKGSERCw7ekEAHgvdERRn98vGLL8K8cC+zOFAAP35i///H94w
 jYK/cIgBi8mQjWVf9Fl9/G2smPaTnarlwBj10+Gc4XZgWck0NfzdqwZjaI8zH6nI5S
 qJlEQUbGwb7dkVLGRhor2Jl2jifja7m64uB4vcDsAnf5AXJcEPyRilDecUp7bu5YvX
 dTZO1ZNPQpszojVWoV3GCVPANPImZRUjcAeCN+zW0yKT6ROo52ZB/dcIU6xYMsPXM/
 YGNybHNgZNPxQ7pkgJCsyMsZRL+zTLYLmEzDsyHt2Dm9Xg2VNl7ggo1rsOpeg1F9Yd
 2RyBY3pxepqIg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 26/45] consoles: use if instead of switch-case in
 consw::con_cursor()
Date: Thu, 18 Jan 2024 08:57:37 +0100
Message-ID: <20240118075756.10541-27-jirislaby@kernel.org>
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

This is only a preparation for the following cleanup patch to make it
easier. Provided CM_ERASE is the only different, use 'if' instead of
'switch+case' in all those.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/newport_con.c | 26 +++++-------
 drivers/video/console/sticon.c      | 27 ++++++------
 drivers/video/console/vgacon.c      | 66 +++++++++++++----------------
 3 files changed, 53 insertions(+), 66 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 5e65ee0b7c07..f852717b88f0 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -443,24 +443,20 @@ static void newport_cursor(struct vc_data *vc, int mode)
 	unsigned short treg;
 	int xcurs, ycurs;
 
-	switch (mode) {
-	case CM_ERASE:
-		treg = newport_vc2_get(npregs, VC2_IREG_CONTROL);
-		newport_vc2_set(npregs, VC2_IREG_CONTROL,
-				(treg & ~(VC2_CTRL_ECDISP)));
-		break;
+	treg = newport_vc2_get(npregs, VC2_IREG_CONTROL);
 
-	case CM_MOVE:
-	case CM_DRAW:
-		treg = newport_vc2_get(npregs, VC2_IREG_CONTROL);
+	if (mode == CM_ERASE) {
 		newport_vc2_set(npregs, VC2_IREG_CONTROL,
-				(treg | VC2_CTRL_ECDISP));
-		xcurs = (vc->vc_pos - vc->vc_visible_origin) / 2;
-		ycurs = ((xcurs / vc->vc_cols) << 4) + 31;
-		xcurs = ((xcurs % vc->vc_cols) << 3) + xcurs_correction;
-		newport_vc2_set(npregs, VC2_IREG_CURSX, xcurs);
-		newport_vc2_set(npregs, VC2_IREG_CURSY, ycurs);
+				(treg & ~(VC2_CTRL_ECDISP)));
+		return;
 	}
+
+	newport_vc2_set(npregs, VC2_IREG_CONTROL, (treg | VC2_CTRL_ECDISP));
+	xcurs = (vc->vc_pos - vc->vc_visible_origin) / 2;
+	ycurs = ((xcurs / vc->vc_cols) << 4) + 31;
+	xcurs = ((xcurs % vc->vc_cols) << 3) + xcurs_correction;
+	newport_vc2_set(npregs, VC2_IREG_CURSX, xcurs);
+	newport_vc2_set(npregs, VC2_IREG_CURSY, ycurs);
 }
 
 static int newport_switch(struct vc_data *vc)
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 906da1fde7c8..42480874db00 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -95,23 +95,20 @@ static void sticon_cursor(struct vc_data *conp, int mode)
 	return;
 
     car1 = conp->vc_screenbuf[conp->state.x + conp->state.y * conp->vc_cols];
-    switch (mode) {
-    case CM_ERASE:
+    if (mode == CM_ERASE) {
 	sti_putc(sticon_sti, car1, conp->state.y, conp->state.x,
 		 font_data[conp->vc_num]);
-	break;
-    case CM_MOVE:
-    case CM_DRAW:
-	switch (CUR_SIZE(conp->vc_cursor_type)) {
-	case CUR_UNDERLINE:
-	case CUR_LOWER_THIRD:
-	case CUR_LOWER_HALF:
-	case CUR_TWO_THIRDS:
-	case CUR_BLOCK:
-	    sti_putc(sticon_sti, (car1 & 255) + (0 << 8) + (7 << 11),
-		     conp->state.y, conp->state.x, font_data[conp->vc_num]);
-	    break;
-	}
+	return;
+    }
+
+    switch (CUR_SIZE(conp->vc_cursor_type)) {
+    case CUR_UNDERLINE:
+    case CUR_LOWER_THIRD:
+    case CUR_LOWER_HALF:
+    case CUR_TWO_THIRDS:
+    case CUR_BLOCK:
+	sti_putc(sticon_sti, (car1 & 255) + (0 << 8) + (7 << 11),
+		 conp->state.y, conp->state.x, font_data[conp->vc_num]);
 	break;
     }
 }
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 558076462b0d..3bf7f46a8998 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -514,47 +514,41 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 
 	c_height = c->vc_cell_height;
 
-	switch (mode) {
-	case CM_ERASE:
-		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
+	write_vga(14, (c->vc_pos - vga_vram_base) / 2);
+
+	if (mode == CM_ERASE) {
 	        if (vga_video_type >= VIDEO_TYPE_VGAC)
 			vgacon_set_cursor_size(31, 30);
 		else
 			vgacon_set_cursor_size(31, 31);
-		break;
+		return;
+	}
 
-	case CM_MOVE:
-	case CM_DRAW:
-		write_vga(14, (c->vc_pos - vga_vram_base) / 2);
-		switch (CUR_SIZE(c->vc_cursor_type)) {
-		case CUR_UNDERLINE:
-			vgacon_set_cursor_size(c_height -
-					       (c_height < 10 ? 2 : 3),
-					       c_height -
-					       (c_height < 10 ? 1 : 2));
-			break;
-		case CUR_TWO_THIRDS:
-			vgacon_set_cursor_size(c_height / 3, c_height -
-					       (c_height < 10 ? 1 : 2));
-			break;
-		case CUR_LOWER_THIRD:
-			vgacon_set_cursor_size(c_height * 2 / 3, c_height -
-					       (c_height < 10 ? 1 : 2));
-			break;
-		case CUR_LOWER_HALF:
-			vgacon_set_cursor_size(c_height / 2, c_height -
-					       (c_height < 10 ? 1 : 2));
-			break;
-		case CUR_NONE:
-			if (vga_video_type >= VIDEO_TYPE_VGAC)
-				vgacon_set_cursor_size(31, 30);
-			else
-				vgacon_set_cursor_size(31, 31);
-			break;
-		default:
-			vgacon_set_cursor_size(1, c_height);
-			break;
-		}
+	switch (CUR_SIZE(c->vc_cursor_type)) {
+	case CUR_UNDERLINE:
+		vgacon_set_cursor_size(c_height - (c_height < 10 ? 2 : 3),
+				       c_height - (c_height < 10 ? 1 : 2));
+		break;
+	case CUR_TWO_THIRDS:
+		vgacon_set_cursor_size(c_height / 3,
+				       c_height - (c_height < 10 ? 1 : 2));
+		break;
+	case CUR_LOWER_THIRD:
+		vgacon_set_cursor_size(c_height * 2 / 3,
+				       c_height - (c_height < 10 ? 1 : 2));
+		break;
+	case CUR_LOWER_HALF:
+		vgacon_set_cursor_size(c_height / 2,
+				       c_height - (c_height < 10 ? 1 : 2));
+		break;
+	case CUR_NONE:
+		if (vga_video_type >= VIDEO_TYPE_VGAC)
+			vgacon_set_cursor_size(31, 30);
+		else
+			vgacon_set_cursor_size(31, 31);
+		break;
+	default:
+		vgacon_set_cursor_size(1, c_height);
 		break;
 	}
 }
-- 
2.43.0

