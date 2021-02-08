Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA131320B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 13:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C616E8CA;
	Mon,  8 Feb 2021 12:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs41.siol.net [185.57.226.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE016E8B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 12:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id BF59D522360;
 Mon,  8 Feb 2021 13:18:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id grR9qWus0oty; Mon,  8 Feb 2021 13:18:07 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 7E6D552226D;
 Mon,  8 Feb 2021 13:18:07 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 2DED0522360;
 Mon,  8 Feb 2021 13:18:05 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v2 3/5] drm/sun4i: dw-hdmi: always set clock rate
Date: Mon,  8 Feb 2021 13:17:50 +0100
Message-Id: <20210208121752.2255465-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208121752.2255465-1-jernej.skrabec@siol.net>
References: <20210208121752.2255465-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
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
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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
