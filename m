Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927C17A0F5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3895A6EB8B;
	Thu,  5 Mar 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs14.siol.net [185.57.226.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0571E6EB72
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 23:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 8EAAC523EAA;
 Thu,  5 Mar 2020 00:25:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 4GlHJmcXyjtl; Thu,  5 Mar 2020 00:25:42 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 34B7152273A;
 Thu,  5 Mar 2020 00:25:42 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id AECC4523FC2;
 Thu,  5 Mar 2020 00:25:39 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH v2 4/4] drm/bridge: dw-hdmi: rework csc related functions
Date: Thu,  5 Mar 2020 00:25:12 +0100
Message-Id: <20200304232512.51616-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304232512.51616-1-jernej.skrabec@siol.net>
References: <20200304232512.51616-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

is_color_space_conversion() is a misnomer. It checks not only if color
space conversion is needed, but also if format conversion is needed.
This is actually desired behaviour because result of this function
determines if CSC block should be enabled or not (CSC block can also do
format conversion).

In order to clear misunderstandings, let's rework
is_color_space_conversion() to do exactly what is supposed to do and add
another function which will determine if CSC block must be enabled or
not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 31 +++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c8a02e5b5e1b..7724191e0a8b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -963,11 +963,14 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
 
 static int is_color_space_conversion(struct dw_hdmi *hdmi)
 {
-	return (hdmi->hdmi_data.enc_in_bus_format !=
-			hdmi->hdmi_data.enc_out_bus_format) ||
-	       (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) &&
-		hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) &&
-		hdmi->hdmi_data.rgb_limited_range);
+	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
+	bool is_input_rgb, is_output_rgb;
+
+	is_input_rgb = hdmi_bus_fmt_is_rgb(hdmi_data->enc_in_bus_format);
+	is_output_rgb = hdmi_bus_fmt_is_rgb(hdmi_data->enc_out_bus_format);
+
+	return (is_input_rgb != is_output_rgb) ||
+	       (is_input_rgb && is_output_rgb && hdmi_data->rgb_limited_range);
 }
 
 static int is_color_space_decimation(struct dw_hdmi *hdmi)
@@ -994,6 +997,13 @@ static int is_color_space_interpolation(struct dw_hdmi *hdmi)
 	return 0;
 }
 
+static bool is_conversion_needed(struct dw_hdmi *hdmi)
+{
+	return is_color_space_conversion(hdmi) ||
+	       is_color_space_decimation(hdmi) ||
+	       is_color_space_interpolation(hdmi);
+}
+
 static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
 {
 	const u16 (*csc_coeff)[3][4] = &csc_coeff_default;
@@ -2014,18 +2024,19 @@ static void dw_hdmi_enable_video_path(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
 
 	/* Enable csc path */
-	if (is_color_space_conversion(hdmi)) {
+	if (is_conversion_needed(hdmi)) {
 		hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CSCCLK_DISABLE;
 		hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
-	}
 
-	/* Enable color space conversion if needed */
-	if (is_color_space_conversion(hdmi))
 		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
 			    HDMI_MC_FLOWCTRL);
-	else
+	} else {
+		hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CSCCLK_DISABLE;
+		hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
+
 		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS,
 			    HDMI_MC_FLOWCTRL);
+	}
 }
 
 /* Workaround to clear the overflow condition */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
