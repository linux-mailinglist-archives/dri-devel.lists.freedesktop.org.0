Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92030FCE0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033C6EE38;
	Thu,  4 Feb 2021 19:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs18.siol.net [185.57.226.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED206EE38
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 81385523FC4;
 Thu,  4 Feb 2021 19:48:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 9YUWL1tonfcD; Thu,  4 Feb 2021 19:48:19 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 33FB1523FC6;
 Thu,  4 Feb 2021 19:48:19 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id D76B8523FC4;
 Thu,  4 Feb 2021 19:48:16 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 3/5] drm/sun4i: dw-hdmi: always set clock rate
Date: Thu,  4 Feb 2021 19:47:08 +0100
Message-Id: <20210204184710.1880895-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204184710.1880895-1-jernej.skrabec@siol.net>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As expected, HDMI controller clock should always match pixel clock. In
the past, changing HDMI controller rate would seemingly worsen
situation. However, that was the result of other bugs which are now
fixed.

Fix that by removing set_rate quirk and always set clock rate.

Fixes: 40bb9d3147b2 ("drm/sun4i: Add support for H6 DW HDMI controller")
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 4 +---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 92add2cef2e7..23773a5e0650 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -21,8 +21,7 @@ static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct sun8i_dw_hdmi *hdmi = encoder_to_sun8i_dw_hdmi(encoder);
 
-	if (hdmi->quirks->set_rate)
-		clk_set_rate(hdmi->clk_tmds, mode->crtc_clock * 1000);
+	clk_set_rate(hdmi->clk_tmds, mode->crtc_clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs
@@ -295,7 +294,6 @@ static int sun8i_dw_hdmi_remove(struct platform_device *pdev)
 
 static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks = {
 	.mode_valid = sun8i_dw_hdmi_mode_valid_a83t,
-	.set_rate = true,
 };
 
 static const struct sun8i_dw_hdmi_quirks sun50i_h6_quirks = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index d983746fa194..d4b55af0592f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -179,7 +179,6 @@ struct sun8i_dw_hdmi_quirks {
 	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
-	unsigned int set_rate : 1;
 	unsigned int use_drm_infoframe : 1;
 };
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
