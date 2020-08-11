Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5424169D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B156E11E;
	Tue, 11 Aug 2020 06:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303B6E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105374; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaKv81WQbkYK27ko6vcwQCQZgJ0sxMpHG+hYhPbwT7U=;
 b=xsvpiWDblQ9dyB62tybIa/UxD+yAnd9rVZoM1NyT9g+USATMdDyShZ33QlYICi+xgRd8ly
 uzH7hdUDbGuRBsG3kcvCZi4Yn50uIe06hRA0hnIR+flyYnN1LgwrUqYbye3WSLXgxhbuKy
 YzkDR4hM+tFEJ2ss7ZvSQ13PM+qhNa4=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 4/5] drm/panel: simple: Tweak timings of sharp,
 ls020b1dd01d for perfect 60Hz
Date: Tue, 11 Aug 2020 02:22:39 +0200
Message-Id: <20200811002240.55194-5-paul@crapouillou.net>
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

Modify the video mode in order to obtain a perfect 60.00 Hz frame rate
using a 3 MHz pixel clock.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 60052976e616..4aee7eca6ded 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3384,15 +3384,15 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 
 static const struct drm_display_mode sharp_ls020b1dd01d_modes[] = {
 	{ /* 60 Hz */
-		.clock = 4200,
+		.clock = 3000,
 		.hdisplay = 240,
-		.hsync_start = 240 + 66,
-		.hsync_end = 240 + 66 + 1,
-		.htotal = 240 + 66 + 1 + 1,
+		.hsync_start = 240 + 8,
+		.hsync_end = 240 + 8 + 1,
+		.htotal = 240 + 8 + 1 + 1,
 		.vdisplay = 160,
-		.vsync_start = 160 + 52,
-		.vsync_end = 160 + 52 + 10,
-		.vtotal = 160 + 52 + 10 + 6,
+		.vsync_start = 160 + 24,
+		.vsync_end = 160 + 24 + 10,
+		.vtotal = 160 + 24 + 10 + 6,
 		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
