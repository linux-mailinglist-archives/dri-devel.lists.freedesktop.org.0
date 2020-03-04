Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A617A0F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094EE6EB9B;
	Thu,  5 Mar 2020 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A796EB72
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 23:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 21E205235DD;
 Thu,  5 Mar 2020 00:25:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ms9EoxqeVMCd; Thu,  5 Mar 2020 00:25:39 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id A8D4952273A;
 Thu,  5 Mar 2020 00:25:39 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 2FB6A5235DD;
 Thu,  5 Mar 2020 00:25:37 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH v2 3/4] drm/bridge: dw-hdmi: Add support for RGB limited range
Date: Thu,  5 Mar 2020 00:25:11 +0100
Message-Id: <20200304232512.51616-4-jernej.skrabec@siol.net>
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

CEA 861 standard requestis that RGB quantization range is "limited" for
CEA modes. Support that by adding CSC matrix which downscales values.

This allows proper color reproduction on TV and PC monitor at the same
time. In future, override property can be added, like "Broadcast RGB"
in i915 driver.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 63 +++++++++++++++++------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index de2c7ec887c8..c8a02e5b5e1b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -92,6 +92,12 @@ static const u16 csc_coeff_rgb_in_eitu709[3][4] = {
 	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
 };
 
+static const u16 csc_coeff_rgb_full_to_rgb_limited[3][4] = {
+	{ 0x1b7c, 0x0000, 0x0000, 0x0020 },
+	{ 0x0000, 0x1b7c, 0x0000, 0x0020 },
+	{ 0x0000, 0x0000, 0x1b7c, 0x0020 }
+};
+
 struct hdmi_vmode {
 	bool mdataenablepolarity;
 
@@ -109,6 +115,7 @@ struct hdmi_data_info {
 	unsigned int pix_repet_factor;
 	unsigned int hdcp_enable;
 	struct hdmi_vmode video_mode;
+	bool rgb_limited_range;
 };
 
 struct dw_hdmi_i2c {
@@ -956,7 +963,11 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
 
 static int is_color_space_conversion(struct dw_hdmi *hdmi)
 {
-	return hdmi->hdmi_data.enc_in_bus_format != hdmi->hdmi_data.enc_out_bus_format;
+	return (hdmi->hdmi_data.enc_in_bus_format !=
+			hdmi->hdmi_data.enc_out_bus_format) ||
+	       (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) &&
+		hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) &&
+		hdmi->hdmi_data.rgb_limited_range);
 }
 
 static int is_color_space_decimation(struct dw_hdmi *hdmi)
@@ -986,25 +997,27 @@ static int is_color_space_interpolation(struct dw_hdmi *hdmi)
 static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
 {
 	const u16 (*csc_coeff)[3][4] = &csc_coeff_default;
+	bool is_input_rgb, is_output_rgb;
 	unsigned i;
 	u32 csc_scale = 1;
 
-	if (is_color_space_conversion(hdmi)) {
-		if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
-			if (hdmi->hdmi_data.enc_out_encoding ==
-						V4L2_YCBCR_ENC_601)
-				csc_coeff = &csc_coeff_rgb_out_eitu601;
-			else
-				csc_coeff = &csc_coeff_rgb_out_eitu709;
-		} else if (hdmi_bus_fmt_is_rgb(
-					hdmi->hdmi_data.enc_in_bus_format)) {
-			if (hdmi->hdmi_data.enc_out_encoding ==
-						V4L2_YCBCR_ENC_601)
-				csc_coeff = &csc_coeff_rgb_in_eitu601;
-			else
-				csc_coeff = &csc_coeff_rgb_in_eitu709;
-			csc_scale = 0;
-		}
+	is_input_rgb = hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format);
+	is_output_rgb = hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format);
+
+	if (!is_input_rgb && is_output_rgb) {
+		if (hdmi->hdmi_data.enc_out_encoding == V4L2_YCBCR_ENC_601)
+			csc_coeff = &csc_coeff_rgb_out_eitu601;
+		else
+			csc_coeff = &csc_coeff_rgb_out_eitu709;
+	} else if (is_input_rgb && !is_output_rgb) {
+		if (hdmi->hdmi_data.enc_out_encoding == V4L2_YCBCR_ENC_601)
+			csc_coeff = &csc_coeff_rgb_in_eitu601;
+		else
+			csc_coeff = &csc_coeff_rgb_in_eitu709;
+		csc_scale = 0;
+	} else if (is_input_rgb && is_output_rgb &&
+		   hdmi->hdmi_data.rgb_limited_range) {
+		csc_coeff = &csc_coeff_rgb_full_to_rgb_limited;
 	}
 
 	/* The CSC registers are sequential, alternating MSB then LSB */
@@ -1614,6 +1627,18 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	drm_hdmi_avi_infoframe_from_display_mode(&frame,
 						 &hdmi->connector, mode);
 
+	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
+		drm_hdmi_avi_infoframe_quant_range(&frame, &hdmi->connector,
+						   mode,
+						   hdmi->hdmi_data.rgb_limited_range ?
+						   HDMI_QUANTIZATION_RANGE_LIMITED :
+						   HDMI_QUANTIZATION_RANGE_FULL);
+	} else {
+		frame.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+		frame.ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+	}
+
 	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
 		frame.colorspace = HDMI_COLORSPACE_YUV444;
 	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
@@ -2099,6 +2124,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	/* TOFIX: Default to RGB888 output format */
 	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
+	hdmi->hdmi_data.rgb_limited_range = hdmi->sink_is_hdmi &&
+		drm_default_rgb_quant_range(mode) ==
+		HDMI_QUANTIZATION_RANGE_LIMITED;
+
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
 	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
