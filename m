Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5D2416BA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE006E4B6;
	Tue, 11 Aug 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062DD6E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105373; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GktzCBVn5TL5skxl6f39MlCJqX9Y1dfzq1NIw7kCWEM=;
 b=eQqJ7WpMqyRcqSiOsp1qOfPwvIpBwnxypyTpdM7IrUu+Rb5HqnhXiQGu0RQyIjk8lR/Uqd
 w6XiTbUzQCzo0jJzHzIclAOViJxazw8Wj8KWvBdcK3JB+RieClX+xXueM0bNgN9iHe2qg1
 QqzLRjc/8xvnx+aWijegYWVFmCsj8Ns=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/5] drm/panel: simple: Convert sharp,
 ls020b1dd01d from timings to videomode
Date: Tue, 11 Aug 2020 02:22:38 +0200
Message-Id: <20200811002240.55194-4-paul@crapouillou.net>
In-Reply-To: <20200811002240.55194-1-paul@crapouillou.net>
References: <20200811002240.55194-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Sharp LS020B1DD01D panel entry from using a struct
display_timing to using a struct drm_display_mode, as display_timing
seems to be the old and legacy format.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3787748b5bd0..60052976e616 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3382,22 +3382,24 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
-static const struct display_timing sharp_ls020b1dd01d_timing = {
-	.pixelclock = { 2000000, 4200000, 5000000 },
-	.hactive = { 240, 240, 240 },
-	.hfront_porch = { 66, 66, 66 },
-	.hback_porch = { 1, 1, 1 },
-	.hsync_len = { 1, 1, 1 },
-	.vactive = { 160, 160, 160 },
-	.vfront_porch = { 52, 52, 52 },
-	.vback_porch = { 6, 6, 6 },
-	.vsync_len = { 10, 10, 10 },
-	.flags = DISPLAY_FLAGS_HSYNC_HIGH | DISPLAY_FLAGS_VSYNC_LOW,
+static const struct drm_display_mode sharp_ls020b1dd01d_modes[] = {
+	{ /* 60 Hz */
+		.clock = 4200,
+		.hdisplay = 240,
+		.hsync_start = 240 + 66,
+		.hsync_end = 240 + 66 + 1,
+		.htotal = 240 + 66 + 1 + 1,
+		.vdisplay = 160,
+		.vsync_start = 160 + 52,
+		.vsync_end = 160 + 52 + 10,
+		.vtotal = 160 + 52 + 10 + 6,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
 };
 
 static const struct panel_desc sharp_ls020b1dd01d = {
-	.timings = &sharp_ls020b1dd01d_timing,
-	.num_timings = 1,
+	.modes = sharp_ls020b1dd01d_modes,
+	.num_modes = ARRAY_SIZE(sharp_ls020b1dd01d_modes),
 	.bpc = 6,
 	.size = {
 		.width = 42,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
