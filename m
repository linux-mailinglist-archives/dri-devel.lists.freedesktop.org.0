Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D5836064
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEB710ED6E;
	Mon, 22 Jan 2024 11:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A5710ED6E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01764CE2A33;
 Mon, 22 Jan 2024 11:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441FCC433C7;
 Mon, 22 Jan 2024 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921501;
 bh=6xvbnww7JlLBYTWi11QyGdS/O6ZiCkP8ssfXGVVStMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Iw3O6aWPvhy9GIEKKDrzmNgcJj/uA8/+BQWIb9xQ9NDjnOUO2iEgpgfNt+JbbBWAL
 7fgFxiB/NCes1NiW5GNZJwdy8wCXTcvuWfuRLJ28EF8D/uBeoJOv8jlfEFeLb70AtZ
 MTBet8I4ji4zv01H/aRKE8BMyJMzLOW/r+ObiklW4+N+VdTmB+DWdjPwiAzpF9Ep3G
 HgYeA4RbVsdKMz4o3op6pEDyxJhkU+dayQ4ZTheeb138j9D5Y1Es+eF4R2/K8crdzN
 1VZIeanuz28tEuUGtMkLDj0Xna2EaTpUgZmyN7IpWQU3I19sF+p6tjffa+y+tGJREm
 fP0WH2ZIpHYZQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 28/47] fbdev/core: simplify cursor_state setting in
 fbcon_ops::cursor()
Date: Mon, 22 Jan 2024 12:03:42 +0100
Message-ID: <20240122110401.7289-29-jirislaby@kernel.org>
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

There is a switch decicing if cursor should be drawn or not. The whole
switch can be simplified to one line. Do this cleanup as a preparatory
work for the next patch. There, all the CM_* constants are removed.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/core/bitblit.c   | 11 +----------
 drivers/video/fbdev/core/fbcon_ccw.c | 11 +----------
 drivers/video/fbdev/core/fbcon_cw.c  | 11 +----------
 drivers/video/fbdev/core/fbcon_ud.c  | 11 +----------
 4 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 8587c9da0670..daff152f4c22 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -348,16 +348,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 			mask[i++] = msk;
 	}
 
-	switch (mode) {
-	case CM_ERASE:
-		ops->cursor_state.enable = 0;
-		break;
-	case CM_DRAW:
-	case CM_MOVE:
-	default:
-		ops->cursor_state.enable = (use_sw) ? 0 : 1;
-		break;
-	}
+	ops->cursor_state.enable = (mode != CM_ERASE) && !use_sw;
 
 	cursor.image.data = src;
 	cursor.image.fg_color = ops->cursor_state.image.fg_color;
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 2789ace79634..889423d580bc 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -349,16 +349,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 		kfree(tmp);
 	}
 
-	switch (mode) {
-	case CM_ERASE:
-		ops->cursor_state.enable = 0;
-		break;
-	case CM_DRAW:
-	case CM_MOVE:
-	default:
-		ops->cursor_state.enable = (use_sw) ? 0 : 1;
-		break;
-	}
+	ops->cursor_state.enable = (mode != CM_ERASE) && !use_sw;
 
 	cursor.image.data = src;
 	cursor.image.fg_color = ops->cursor_state.image.fg_color;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 86a254c1b2b7..a306ca5802e8 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -332,16 +332,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 		kfree(tmp);
 	}
 
-	switch (mode) {
-	case CM_ERASE:
-		ops->cursor_state.enable = 0;
-		break;
-	case CM_DRAW:
-	case CM_MOVE:
-	default:
-		ops->cursor_state.enable = (use_sw) ? 0 : 1;
-		break;
-	}
+	ops->cursor_state.enable = (mode != CM_ERASE) && !use_sw;
 
 	cursor.image.data = src;
 	cursor.image.fg_color = ops->cursor_state.image.fg_color;
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 23bc045769d0..f6fc458b46c7 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -372,16 +372,7 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, int mode,
 			mask[i++] = ~msk;
 	}
 
-	switch (mode) {
-	case CM_ERASE:
-		ops->cursor_state.enable = 0;
-		break;
-	case CM_DRAW:
-	case CM_MOVE:
-	default:
-		ops->cursor_state.enable = (use_sw) ? 0 : 1;
-		break;
-	}
+	ops->cursor_state.enable = (mode != CM_ERASE) && !use_sw;
 
 	cursor.image.data = src;
 	cursor.image.fg_color = ops->cursor_state.image.fg_color;
-- 
2.43.0

