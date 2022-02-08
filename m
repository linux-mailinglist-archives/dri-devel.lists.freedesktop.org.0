Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF64AE2D7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B3210E4A2;
	Tue,  8 Feb 2022 21:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737110E32B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d27so579608wrc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIPhliOnck3yOxw+Dv+3394kB7U1re82IdjUQLdsD7g=;
 b=Z8I9ZWk9KMGjtYjkOSq4opEZfrkrnm27stq7L+c8hIZk05qksyUdm4+sUlt0rBndyT
 DQX+SOTc8GS9LeEBc6pi7uSkAVol2kWAn54PJoRSgOd/ccDFsbs79VlWsrIJgy+5UY4z
 adq/p7y0DkEQ++cwOVxs6Wiyy9rvfDf9eMg00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIPhliOnck3yOxw+Dv+3394kB7U1re82IdjUQLdsD7g=;
 b=gu9ry5e3qSf8FqcWtrP84OT4CYTLETQvAjat7UzX+hIwf/GMlHadQ8Uu7oxe2I8xy4
 PkrOijjipj4//8fZ66OH1IHeWS/hrzyzdyjEzNbRLDAWwlqtbLulClouozi+su3Hxn2r
 i+TQd+tbQTwoEleJXjMUoZvtNGbluP+GoxuGdSWx6GQK9oV57oN4QRW9kISPrqWqbTtO
 p4ocKKx4vR4cj77ZObOaocQp6kpDGeS2Sgcvk8N04hCVSIYMtMpMgTyvydWEsr6uX6oQ
 XeXg96wKOR0TYvlKelCK722HW1m2t3H1CaIXj5W0xYps6GGDe+7sx9O9brQA/WulT4sZ
 mLRQ==
X-Gm-Message-State: AOAM531l1n5nDC1UDUBDyCXAQNGenoAeDAkXve9AJMpyyRUhZadujttg
 8pDmWDUbFNJ+B1KOEO1C10VAZY34+rvGEg==
X-Google-Smtp-Source: ABdhPJyfRPn4N3kWII/WebNvQR+2lSObKOj91UPPo9uSAdMr7ixXbhsF1UhRz3GGz4BQn3bFDSUu7A==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr4878344wri.5.1644354511285;
 Tue, 08 Feb 2022 13:08:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 02/19] fbcon: Move fbcon_bmove(_rec) functions
Date: Tue,  8 Feb 2022 22:08:07 +0100
Message-Id: <20220208210824.2238981-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoids two forward declarations, and more importantly, matches what
I've done in my fbcon scrolling restore patches - so I need this to
avoid a bunch of conflicts in rebasing since we ended up merging
Helge's series instead.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c | 134 +++++++++++++++----------------
 1 file changed, 65 insertions(+), 69 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 235eaab37d84..e925bb608e25 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -164,15 +164,11 @@ static int fbcon_cursor_noblink;
  */
 
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only);
-static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
-			int height, int width);
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table);
 
 /*
  *  Internal routines
  */
-static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
-			    int dy, int dx, int height, int width, u_int y_break);
 static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 			   int unit);
 static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
@@ -1667,6 +1663,71 @@ static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
 	}
 }
 
+static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
+			    int dy, int dx, int height, int width, u_int y_break)
+{
+	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops = info->fbcon_par;
+	u_int b;
+
+	if (sy < y_break && sy + height > y_break) {
+		b = y_break - sy;
+		if (dy < sy) {	/* Avoid trashing self */
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+		} else {
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+		}
+		return;
+	}
+
+	if (dy < y_break && dy + height > y_break) {
+		b = y_break - dy;
+		if (dy < sy) {	/* Avoid trashing self */
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+		} else {
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+		}
+		return;
+	}
+	ops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
+		   height, width);
+}
+
+static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
+			int height, int width)
+{
+	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_display *p = &fb_display[vc->vc_num];
+
+	if (fbcon_is_inactive(vc, info))
+		return;
+
+	if (!width || !height)
+		return;
+
+	/*  Split blits that cross physical y_wrap case.
+	 *  Pathological case involves 4 blits, better to use recursive
+	 *  code rather than unrolled case
+	 *
+	 *  Recursive invocations don't need to erase the cursor over and
+	 *  over again, so we use fbcon_bmove_rec()
+	 */
+	fbcon_bmove_rec(vc, p, sy, sx, dy, dx, height, width,
+			p->vrows - p->yscroll);
+}
+
 static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 		enum con_scroll dir, unsigned int count)
 {
@@ -1867,71 +1928,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 }
 
 
-static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
-			int height, int width)
-{
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
-	struct fbcon_display *p = &fb_display[vc->vc_num];
-
-	if (fbcon_is_inactive(vc, info))
-		return;
-
-	if (!width || !height)
-		return;
-
-	/*  Split blits that cross physical y_wrap case.
-	 *  Pathological case involves 4 blits, better to use recursive
-	 *  code rather than unrolled case
-	 *
-	 *  Recursive invocations don't need to erase the cursor over and
-	 *  over again, so we use fbcon_bmove_rec()
-	 */
-	fbcon_bmove_rec(vc, p, sy, sx, dy, dx, height, width,
-			p->vrows - p->yscroll);
-}
-
-static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
-			    int dy, int dx, int height, int width, u_int y_break)
-{
-	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
-	struct fbcon_ops *ops = info->fbcon_par;
-	u_int b;
-
-	if (sy < y_break && sy + height > y_break) {
-		b = y_break - sy;
-		if (dy < sy) {	/* Avoid trashing self */
-			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
-					y_break);
-			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
-					height - b, width, y_break);
-		} else {
-			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
-					height - b, width, y_break);
-			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
-					y_break);
-		}
-		return;
-	}
-
-	if (dy < y_break && dy + height > y_break) {
-		b = y_break - dy;
-		if (dy < sy) {	/* Avoid trashing self */
-			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
-					y_break);
-			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
-					height - b, width, y_break);
-		} else {
-			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
-					height - b, width, y_break);
-			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
-					y_break);
-		}
-		return;
-	}
-	ops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
-		   height, width);
-}
-
 static void updatescrollmode_accel(struct fbcon_display *p,
 					struct fb_info *info,
 					struct vc_data *vc)
-- 
2.34.1

