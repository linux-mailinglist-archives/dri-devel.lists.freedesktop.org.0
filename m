Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A488FDD5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35810F9BF;
	Thu, 28 Mar 2024 11:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xNNMpkyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A6010ED16
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:12:27 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6ea9a605ca7so638010b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711624347; x=1712229147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+TeuuSkQj7XTS45LutYmiDgAgbcEY5Odyx7kr6Nww4=;
 b=xNNMpkyHVRZabqu5QAkRon2OWpoHkBX9/L08RpHPsvN30iVcf2Ts8Zy5rbyrqtSf1N
 ERNud5D+IOw1LaDy9/Ebef1ZUBSlVZuq7rqG30ZC2jDoxyvIOE8rwPi0mId0gIo5Vh0T
 hrMSP48qZGaMLjBM5dvTB3iW3fjDHj/m6NUG9atX6viPsU5tqkYKqoieWaYreQBXxQ9J
 HedtC2NKr0A/Z8greShSMStp0yr4+kkzgY+D2J5Tn/I0ZsQwyR6QwuUyX7IqXO9akdXB
 TEAvwfx/Kn0Z4i8i8MRzcePHr40+biUSICHE3bsA/AhNC9w8Rw5N7xdrftkDcG6ygeeZ
 eONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711624347; x=1712229147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+TeuuSkQj7XTS45LutYmiDgAgbcEY5Odyx7kr6Nww4=;
 b=FhiTks3w+V13Um3n76WzI7Bf3C7a7uKI0bSgppEjb26v/HzAwI/ZpWO6tEPm9oL1T7
 leo/2g/chx2Fiw6o7MYQhLz9+hvjPfMedTNRlbb69ywwbjkge703qL+SBix0MqBF9YMp
 aJ9E+orHVibDkFvy0NHu67KjnpUmlIZ9LIoTzHey+IZkiyjZ6RA1RNdWamu+wACxu2Op
 ZrQykcPWFZV4LVk3xi7GTuSRG5X8NF6FH/Ygo/liuCsyi4AJv5GWqH3FqWyAagphQesS
 HpqV9mSpT+RZ4FwFCRKGfSxXoD+eiIkFQYvFfUI695XHmRL63wcaQIIOqboTdIzEOX1T
 hbXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNOEtA/j2ZMcVXzwH2eGelYDl7R+uIGY/3OW8s4rPCoaQWFeO7KjKbFGXGraCLbHEqFGqKewrWhnGPHntmmgu5OYUP4mOOh9l119ynFu0X
X-Gm-Message-State: AOJu0YyO8uUlu6/V5Sqtwl7i5qWYO+uHtplFWCPPkBwX83ARNhv67pMQ
 pmDI0WEAfD83zFxysdJDZ+8EMg/ZM7RiOqrEXlVbo8siH66/5UAuNg1Q0WoJiVM=
X-Google-Smtp-Source: AGHT+IFtZtWGN0gpIdln/salcEy9PVgCOB6uagldfXRPfnddW1BVC0WLkiU9IKKaikRLoMnyPVkDoA==
X-Received: by 2002:a05:6a00:4f86:b0:6ea:74d4:a00d with SMTP id
 ld6-20020a056a004f8600b006ea74d4a00dmr3250046pfb.5.1711624346654; 
 Thu, 28 Mar 2024 04:12:26 -0700 (PDT)
Received: from niej-think.bbrouter ([112.65.12.82])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa792c7000000b006eab9ef5d4esm1114607pfa.50.2024.03.28.04.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 04:12:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch,
 quic_parellan@quicinc.com, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 marijn.suijten@somainline.org, sean@poorly.run,
 Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 3/3] drm/panel: Enable DSC for Visionox VTDR6130 panel
Date: Thu, 28 Mar 2024 19:11:58 +0800
Message-Id: <20240328111158.2074351-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
References: <20240328111158.2074351-1-jun.nie@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable display compression (DSC v1.2) for 1080x2400 Visionox
VTDR6130 AMOLED DSI panel. DTS property is needed to enable DSC.
Default configuration is video mode + non-DSC for any back
compatibility.

Below modes works on SM8650. While cmd mode does not work yet.
- video mode + DSC
- video mode
- cmd mode + DSC

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 540099253e1b..d6c44816cdd0 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
@@ -17,9 +18,12 @@
 
 struct visionox_vtdr6130 {
 	struct drm_panel panel;
+	struct drm_dsc_config dsc;
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[3];
+	bool cmd_mode;
+	bool dsc_enable;
 };
 
 static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
@@ -49,12 +53,20 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 	if (ret)
 		return ret;
 
+	if (ctx->dsc_enable)
+		mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
+
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
 	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+
+	if (ctx->cmd_mode)
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
+	else
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+
 	mipi_dsi_dcs_write_seq(dsi, 0x70,
 			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
 			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
@@ -205,6 +217,26 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
 	.height_mm = 157,
 };
 
+static int visionox_vtdr6130_enable(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	if (!dsi->dsc)
+		return 0;
+
+	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
+	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
+	if (ret) {
+		dev_err(&dsi->dev, "Failed to set PPS\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
 				       struct drm_connector *connector)
 {
@@ -228,6 +260,7 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
 	.prepare = visionox_vtdr6130_prepare,
 	.unprepare = visionox_vtdr6130_unprepare,
 	.get_modes = visionox_vtdr6130_get_modes,
+	.enable = visionox_vtdr6130_enable,
 };
 
 static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
@@ -260,12 +293,32 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
 	struct visionox_vtdr6130 *ctx;
+	struct drm_dsc_config *dsc;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->cmd_mode = of_property_read_bool(dev->of_node, "enforce-cmd-mode");
+	ctx->dsc_enable = of_property_read_bool(dev->of_node, "enable-dsc");
+
+	/* Set DSC params */
+	if (ctx->dsc_enable) {
+		dsc = &ctx->dsc;
+		dsc->dsc_version_major = 0x1;
+		dsc->dsc_version_minor = 0x2;
+		dsc->slice_height = 40;
+		dsc->slice_width = 540;
+		dsc->slice_count = 2;
+		dsc->slice_per_pkt = 1;
+		dsc->bits_per_component = 8;
+		dsc->bits_per_pixel = 8 << 4;
+		dsc->block_pred_enable = true;
+
+		dsi->dsc = dsc;
+	}
+
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "vci";
 	ctx->supplies[2].supply = "vdd";
@@ -306,6 +359,9 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	dev_err(&dsi->dev, "discovered with %s mode %s\n",
+		ctx->cmd_mode ? "cmd" : "video",
+		ctx->dsc_enable ? "and DSC enabled" : "");
 	return 0;
 }
 
-- 
2.34.1

