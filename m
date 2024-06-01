Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29198D6FFD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC15D10E122;
	Sat,  1 Jun 2024 13:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vxS8ToKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407610E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247583;
 bh=8uRhqLiAdkGIlh3VTlM1cQofy1gF9s+TKt0ENoIYejs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vxS8ToKOD9x3MfJOagpxmnjgKb8QkJVEMjq8Yp1mb9bT9G4vI3KqyMYSI+RgexhR0
 8hcEbfOui1Vw7mVe2TyqPTmaNYv/IIqpz2xojZi43z0JFPqDps+UkVzI1mXyXSSiJH
 mL02UnET/FOs/KM4964Go8HIaFMApo6OHaleu3WZUDS0JGYHdmUwxs91i3rLmmXg7p
 RGyy9gCMJ3n8CeQaaeyiqi1sbSa8DSl4RFcNgb9xxzNx9XxHNuydG4zIFyCwSDcSRY
 Acu1l0Pn839x+gELe/eqLGbnmKRVyxw92PlnfJpT7PluyB+nRO/hGsCjrrhRwOX0DM
 uj2zZB4GVzJIw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3039437821EB;
 Sat,  1 Jun 2024 13:13:03 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:26 +0300
Subject: [PATCH 04/14] drm/bridge: dw-hdmi: Factor out AVI infoframe setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-4-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14-dev-f7c49
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to add support for the HDMI 2.1 Quad-Pixel TX Controller
and minimize code duplication, factor out the AVI infoframe setup from
hdmi_config_AVI() into a common dw_hdmi_prep_avi_infoframe() helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h |  4 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        | 57 ++++++++++++++----------
 2 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
index ffd2ee16466c..0569196bbe3b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
@@ -150,6 +150,10 @@ struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi,
 					const struct i2c_algorithm *algo);
 bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi,
 			  const struct drm_display_info *display);
+void dw_hdmi_prep_avi_infoframe(struct hdmi_avi_infoframe *frame,
+				struct dw_hdmi *hdmi,
+				const struct drm_connector *connector,
+				const struct drm_display_mode *mode);
 
 enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5dd0e2bc080d..81d73fbcb2e6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1638,66 +1638,75 @@ static void hdmi_tx_hdcp_config(struct dw_hdmi *hdmi)
 		  HDMI_A_HDCPCFG1_ENCRYPTIONDISABLE_MASK, HDMI_A_HDCPCFG1);
 }
 
-static void hdmi_config_AVI(struct dw_hdmi *hdmi,
-			    const struct drm_connector *connector,
-			    const struct drm_display_mode *mode)
+void dw_hdmi_prep_avi_infoframe(struct hdmi_avi_infoframe *frame,
+				struct dw_hdmi *hdmi,
+				const struct drm_connector *connector,
+				const struct drm_display_mode *mode)
 {
-	struct hdmi_avi_infoframe frame;
-	u8 val;
-
 	/* Initialise info frame from DRM mode */
-	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
+	drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
 
 	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
-		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
+		drm_hdmi_avi_infoframe_quant_range(frame, connector, mode,
 						   hdmi->hdmi_data.rgb_limited_range ?
 						   HDMI_QUANTIZATION_RANGE_LIMITED :
 						   HDMI_QUANTIZATION_RANGE_FULL);
 	} else {
-		frame.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
-		frame.ycc_quantization_range =
+		frame->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+		frame->ycc_quantization_range =
 			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
 	}
 
 	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
-		frame.colorspace = HDMI_COLORSPACE_YUV444;
+		frame->colorspace = HDMI_COLORSPACE_YUV444;
 	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
-		frame.colorspace = HDMI_COLORSPACE_YUV422;
+		frame->colorspace = HDMI_COLORSPACE_YUV422;
 	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
-		frame.colorspace = HDMI_COLORSPACE_YUV420;
+		frame->colorspace = HDMI_COLORSPACE_YUV420;
 	else
-		frame.colorspace = HDMI_COLORSPACE_RGB;
+		frame->colorspace = HDMI_COLORSPACE_RGB;
 
 	/* Set up colorimetry */
 	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
 		switch (hdmi->hdmi_data.enc_out_encoding) {
 		case V4L2_YCBCR_ENC_601:
 			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV601)
-				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
+				frame->colorimetry = HDMI_COLORIMETRY_EXTENDED;
 			else
-				frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
-			frame.extended_colorimetry =
+				frame->colorimetry = HDMI_COLORIMETRY_ITU_601;
+			frame->extended_colorimetry =
 					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
 			break;
 		case V4L2_YCBCR_ENC_709:
 			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV709)
-				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
+				frame->colorimetry = HDMI_COLORIMETRY_EXTENDED;
 			else
-				frame.colorimetry = HDMI_COLORIMETRY_ITU_709;
-			frame.extended_colorimetry =
+				frame->colorimetry = HDMI_COLORIMETRY_ITU_709;
+			frame->extended_colorimetry =
 					HDMI_EXTENDED_COLORIMETRY_XV_YCC_709;
 			break;
 		default: /* Carries no data */
-			frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
-			frame.extended_colorimetry =
+			frame->colorimetry = HDMI_COLORIMETRY_ITU_601;
+			frame->extended_colorimetry =
 					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
 			break;
 		}
 	} else {
-		frame.colorimetry = HDMI_COLORIMETRY_NONE;
-		frame.extended_colorimetry =
+		frame->colorimetry = HDMI_COLORIMETRY_NONE;
+		frame->extended_colorimetry =
 			HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
 	}
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_prep_avi_infoframe);
+
+static void hdmi_config_AVI(struct dw_hdmi *hdmi,
+			    const struct drm_connector *connector,
+			    const struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	u8 val;
+
+	dw_hdmi_prep_avi_infoframe(&frame, hdmi, connector, mode);
 
 	/*
 	 * The Designware IP uses a different byte format from standard

-- 
2.45.0

