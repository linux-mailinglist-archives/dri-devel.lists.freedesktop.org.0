Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EF8313A8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46AA10E72E;
	Thu, 18 Jan 2024 07:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD23810E72E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:59:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ED3B4CE1EC6;
 Thu, 18 Jan 2024 07:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36171C433B1;
 Thu, 18 Jan 2024 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564738;
 bh=6xvbnww7JlLBYTWi11QyGdS/O6ZiCkP8ssfXGVVStMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a2R25vDoJz4BOPRUHRYWkdxEDZ2+Es96N38Dy7n38C4ar8g33k/Mi0D5yL7iM5q8w
 iriWoeFhnXrml8yUHpNoGoGn6rCs9XKHcH3UlWgrOQoMF1NnoU3wOA+1UWuP4ST17j
 ptUm3pJ6Lk7oHfQMKfRaSx2y4ALD4Vsp4QGyfQ42ZfkIFecZGIV5H851L0gYv93C2C
 iIdiPt+2zvEoKXNLocvSUY2N164LaEbfdykz1UrZxOyzqZ0f4lKPyyv1n/djv1EAcQ
 M8QtpBUrLbZKmYX3vJWYUVExgEifFqz2nPP0NcRQbHXG70/hNZSPza0tk1f0F6fG2c
 Yy3izNATVYncw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 27/45] fbdev/core: simplify cursor_state setting in
 fbcon_ops::cursor()
Date: Thu, 18 Jan 2024 08:57:38 +0100
Message-ID: <20240118075756.10541-28-jirislaby@kernel.org>
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

