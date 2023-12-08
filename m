Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07280A7D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8063710EAA0;
	Fri,  8 Dec 2023 15:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5610E29B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:48:54 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5906048e9e3so892117eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702050533; x=1702655333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irwlGKZ3Ivo94UJ6LKl+yTmlgkjtfS15iquU/V0K1B0=;
 b=LwFiB5IhIa6KaVcdyLf9UxVt05+8LHSPJV6DubPH6tNLfdUXsaZmxB/JUNC+LS2/wV
 UP+XVcvT9SYmbz0u8OHTpLtjm/dZwrMOWmVduTOOXJHoAB2Ht64IDdRBf2e3C6PIuD5C
 vdS8m/yMM6y/vsvZcXdJqMgrxResS/zHDhh5J4SJ9plcTX7UxZ62YHP+T0S4l7ZwybCr
 uW1MynEE4kRfbps38Vx2KEIu0T41pUWK9wMIwGX2yjNSYIxFBkAnYZr5bBhCJvcVgYtw
 ikTpF7bL0Pi23M0/3SAtxi/+PcchA/UnuSfwkAAPKOEEGy5VXP+xFEeDHWDsBkHGpwPe
 K5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702050533; x=1702655333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irwlGKZ3Ivo94UJ6LKl+yTmlgkjtfS15iquU/V0K1B0=;
 b=Pmq7jZMrnfo/e8Hfs9tWoByiC0Cf6O74dIXPCEjtVmjl8zi9D5PZp/EijmI9s/3S/r
 fYzIHzJv4N6v0J0B/VgLITG8aq7MEAiEXLRn49WLYc2P6+89Jb6ULO4Z5P1YmTaFBjwP
 9KTOteU2v8AMDN4fW2blEakNCx+t92Ml+dTrEuSafq1ZIpteS4QBvrDsZNAQr2fjxNaW
 24SZG84hLCUi82BXN0lMRC1sRlcZoKg5nGFhLY8Zjw/NQHPi2S0joBQzwGRckj8YNk/2
 f6eJZt87bmMPO8sAxSz7W4lC6cQ8vRjbKtXzGlaAgfzoQs7YMfLA0S/743I0Vav1aqKY
 74Og==
X-Gm-Message-State: AOJu0Yz9M5zJx8gKHau9DMPcwcQ6x1KPk8dzpUmcu/OQiJHgyDIQ8DCu
 i2l35A6MwbX6irsVKddRabw=
X-Google-Smtp-Source: AGHT+IFin/Yi5SeQj3Hzl9UbgH3czKI4N3wsbZddWUS82YWGr+pe/PBgW49eSU1WszYtgdbvSCtAxA==
X-Received: by 2002:a05:6870:9d94:b0:1fb:788:e8bd with SMTP id
 pv20-20020a0568709d9400b001fb0788e8bdmr476698oab.56.1702050533620; 
 Fri, 08 Dec 2023 07:48:53 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 os25-20020a0568707d1900b001fb28cd0e9asm444624oab.3.2023.12.08.07.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:48:53 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: st7701: Add Anbernic RG-ARC Panel Support
Date: Fri,  8 Dec 2023 09:48:47 -0600
Message-Id: <20231208154847.130615-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208154847.130615-1-macroalpha82@gmail.com>
References: <20231208154847.130615-1-macroalpha82@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RG-ARC is a series of 2 handheld devices, each with a 4
inch 480x640 display. Add support for the display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 036ac403ed21..421eb4592b61 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -423,6 +423,42 @@ static void kd50t048a_gip_sequence(struct st7701 *st7701)
 		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
 }
 
+static void rg_arc_gip_sequence(struct st7701 *st7701)
+{
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_DSI(st7701, 0xEF, 0x08);
+	st7701_switch_cmd_bkx(st7701, true, 0);
+	ST7701_DSI(st7701, 0xC7, 0x04);
+	ST7701_DSI(st7701, 0xCC, 0x38);
+	st7701_switch_cmd_bkx(st7701, true, 1);
+	ST7701_DSI(st7701, 0xB9, 0x10);
+	ST7701_DSI(st7701, 0xBC, 0x03);
+	ST7701_DSI(st7701, 0xC0, 0x89);
+	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
+	ST7701_DSI(st7701, 0xE1, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,
+		   0x00, 0x00, 0x20, 0x20);
+	ST7701_DSI(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xE3, 0x00, 0x00, 0x33, 0x00);
+	ST7701_DSI(st7701, 0xE4, 0x22, 0x00);
+	ST7701_DSI(st7701, 0xE5, 0x04, 0x5C, 0xA0, 0xA0, 0x06, 0x5C, 0xA0,
+		   0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xE6, 0x00, 0x00, 0x33, 0x00);
+	ST7701_DSI(st7701, 0xE7, 0x22, 0x00);
+	ST7701_DSI(st7701, 0xE8, 0x05, 0x5C, 0xA0, 0xA0, 0x07, 0x5C, 0xA0,
+		   0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xEB, 0x02, 0x00, 0x40, 0x40, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xEC, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xED, 0xFA, 0x45, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF,
+		   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xB0, 0x54, 0xAF);
+	ST7701_DSI(st7701, 0xEF, 0x08, 0x08, 0x08, 0x45, 0x3F, 0x54);
+	st7701_switch_cmd_bkx(st7701, false, 0);
+	ST7701_DSI(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0x17);
+	ST7701_DSI(st7701, MIPI_DCS_SET_PIXEL_FORMAT, 0x77);
+	ST7701_DSI(st7701, MIPI_DCS_EXIT_SLEEP_MODE, 0x00);
+	msleep(120);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -839,6 +875,105 @@ static const struct st7701_panel_desc kd50t048a_desc = {
 	.gip_sequence = kd50t048a_gip_sequence,
 };
 
+static const struct drm_display_mode rg_arc_mode = {
+	.clock          = 25600,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 60,
+	.hsync_end	= 480 + 60 + 42,
+	.htotal         = 480 + 60 + 42 + 60,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 10,
+	.vsync_end	= 640 + 10 + 4,
+	.vtotal         = 640 + 10 + 4 + 16,
+
+	.width_mm	= 63,
+	.height_mm	= 84,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc rg_arc_desc = {
+	.mode = &rg_arc_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 80,
+
+	.pv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0x01) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0x16),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1d),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0e),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x12),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x06),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x0c),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x0a),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x09),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x25),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x00),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x03),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x00),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x3f),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3f),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1c)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0x01) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0x16),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1e),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0e),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x06),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x0c),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x08),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x09),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x26),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x00),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x15),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x00),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x3f),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3f),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1c)
+	},
+	.nlinv = 0,
+	.vop_uv = 4500000,
+	.vcom_uv = 762500,
+	.vgh_mv = 15000,
+	.vgl_mv = -9510,
+	.avdd_mv = 6600,
+	.avcl_mv = -4400,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIN,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = rg_arc_gip_sequence,
+};
+
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct st7701_panel_desc *desc;
@@ -917,6 +1052,7 @@ static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id st7701_of_match[] = {
+	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
-- 
2.34.1

