Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C870186008B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D210E9E5;
	Thu, 22 Feb 2024 18:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/phSiAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531410E9B4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:44:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41272d42207so19446255e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708620271; x=1709225071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9SWDIfh91PUFnssD98ZcjvHp+kf1OGg+JV2t9c32to=;
 b=j/phSiABPzrWeufx2+PQTzKng5Tl+I4bswcwq7EMnPs+R4EDK/ErJw0CMAwKox88wH
 uYwjRd8854JnI3N+YCSkFRHOAqnjpMMwkn/poyqfmawrWBCiqZCsYGm2NpU2HQbAQunm
 qmd3jmEAPTf/Azts/Tx47slzBN1Ow+joXJHjwOCFEUYICVCelTriZ5QS6AWLh4zu+lBJ
 54PFTIjdqMJ5WnJazZcJOESz5x8rdgKfOjFcZb3CP0hxqjMCRwTdj5Vtwu4ymRvRDaUC
 ivTb/s1mozsb5OZm43/R+LmHjPbn5ni8+r0NWinJpH5LPvFdEp/fkhoLLBB4z/y4QDes
 Hk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708620271; x=1709225071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9SWDIfh91PUFnssD98ZcjvHp+kf1OGg+JV2t9c32to=;
 b=dYuSkWfijhefTKRLs0WqbDedUzBOJhTPvWq+i/1r4pTRNoOu8u1sopq2FMWPvVsk0V
 0gIgRhyjfYxtwKWN69Ka8nDlqkVdWDk9SBkY/QSA9uQHJ9KtHXIv9mrRzt1lztvVbBGR
 aZV3k6qTYSvOSal+wP0622qznZfIfryncK70ljlrmafrA9my3QN3wh4QXAsGSDAwpd45
 7CmfW91OgY2+IeR8WyHe38FU1z0lnyP3wayZC+QKMAL1A3MznT7FMMzcYS0nbjDGevEA
 PNDoO/BfrVA6bdOLUeLTXByUNKr0RfW6cStp5hw5v155STvKCdgzVb/hpaU2shlKc7Su
 k02g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6mwMXRHLL48/6AluoM+QY6q78x8tMSkdfl2pdp2v0kL0cjOVpvkN00em/nrN9DczrV5FzDWjRvh3Q8uvE9X0/1DVzQYiW4bZivK8JK6eN
X-Gm-Message-State: AOJu0YwCc2nUOLkY7rDLiSOJKR0Y/dresjAGDh5OZCP2mM4O32uduQWp
 ZwBXKvFi2PgCyMtCbhHbpzHWHNIsUjDgiLAB3werAfcGsKMAPOd7
X-Google-Smtp-Source: AGHT+IEul6GqBAA/Msq8v6waetwmRcblzCBJdBfcC5IKA8u9Zx+o6OZlp4pd+n3RPHbXJzH8Zuvcjg==
X-Received: by 2002:a05:600c:4449:b0:412:8fef:7f with SMTP id
 v9-20020a05600c444900b004128fef007fmr233521wmn.1.1708620270748; 
 Thu, 22 Feb 2024 08:44:30 -0800 (PST)
Received: from localhost.localdomain ([90.255.110.157])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm22800420wmq.37.2024.02.22.08.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 08:44:30 -0800 (PST)
From: Adam Green <greena88@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: greena88@gmail.com
Subject: [PATCH v2 1/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
Date: Thu, 22 Feb 2024 16:43:13 +0000
Message-ID: <20240222164332.3864716-2-greena88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222164332.3864716-1-greena88@gmail.com>
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Feb 2024 18:12:56 +0000
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

The Hardkernel ODROID-GO Ultra is a handheld gaming devices, with
a 5 inch 480x854 display. Add support for the display.

Signed-off-by: Adam Green <greena88@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 158 +++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 421eb4592b61..d08e8f4c39dd 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -423,6 +423,62 @@ static void kd50t048a_gip_sequence(struct st7701 *st7701)
 		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
 }
 
+static void odroid_go_ultra_gip_sequence(struct st7701 *st7701)
+{
+	ST7701_DSI(st7701, 0x01);
+	msleep(20);
+	ST7701_DSI(st7701, 0x11);
+	msleep(120);
+
+	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x10);
+	ST7701_DSI(st7701, 0xC0, 0xE9, 0x03);
+	ST7701_DSI(st7701, 0xC1, 0x11, 0x02);
+	ST7701_DSI(st7701, 0xC2, 0x31, 0x08);
+	ST7701_DSI(st7701, 0xCC, 0x10);
+	ST7701_DSI(st7701, 0xB0, 0x00, 0x0D, 0x14, 0x0D, 0x10, 0x05, 0x02, 0x08,
+		   0x08, 0x1E, 0x05, 0x13, 0x11, 0xA3, 0x29, 0x18);
+	ST7701_DSI(st7701, 0xB1, 0x00, 0x0C, 0x14, 0x0C, 0x10, 0x05, 0x03, 0x08,
+		   0x07, 0x20, 0x05, 0x13, 0x11, 0xA4, 0x29, 0x18);
+	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x11);
+	ST7701_DSI(st7701, 0xB0, 0x6C);
+	ST7701_DSI(st7701, 0xB1, 0x43);
+	ST7701_DSI(st7701, 0xB2, 0x07);
+	ST7701_DSI(st7701, 0xB3, 0x80);
+	ST7701_DSI(st7701, 0xB5, 0x47);
+	ST7701_DSI(st7701, 0xB7, 0x85);
+	ST7701_DSI(st7701, 0xB8, 0x20);
+	ST7701_DSI(st7701, 0xB9, 0x10);
+	ST7701_DSI(st7701, 0xC1, 0x78);
+	ST7701_DSI(st7701, 0xC3, 0x78);
+	ST7701_DSI(st7701, 0xD0, 0x88);
+	msleep(120);
+
+	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
+	ST7701_DSI(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x09,
+		   0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE4, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0,
+		   0xA0, 0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
+	ST7701_DSI(st7701, 0xE7, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0,
+		   0xA0, 0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
+	ST7701_DSI(st7701, 0xEC, 0x02, 0x01);
+	ST7701_DSI(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF,
+		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
+	ST7701_DSI(st7701, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0x3A, 0x70);
+	ST7701_DSI(st7701, 0x53, 0xEC);
+	ST7701_DSI(st7701, 0x55, 0xB3);
+	ST7701_DSI(st7701, 0x5E, 0xFF);
+	ST7701_DSI(st7701, 0x29);
+	msleep(50);
+}
+
 static void rg_arc_gip_sequence(struct st7701 *st7701)
 {
 	st7701_switch_cmd_bkx(st7701, true, 3);
@@ -470,7 +526,7 @@ static int st7701_prepare(struct drm_panel *panel)
 				    st7701->supplies);
 	if (ret < 0)
 		return ret;
-	msleep(20);
+	msleep(120);
 
 	gpiod_set_value(st7701->reset, 1);
 	msleep(150);
@@ -875,6 +931,105 @@ static const struct st7701_panel_desc kd50t048a_desc = {
 	.gip_sequence = kd50t048a_gip_sequence,
 };
 
+static const struct drm_display_mode odroid_go_ultra_mode = {
+	.clock		= 29170,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 12,
+	.hsync_end	= 480 + 12 + 12,
+	.htotal		= 480 + 12 + 12 + 38,
+
+	.vdisplay	= 854,
+	.vsync_start	= 854 + 2,
+	.vsync_end	= 854 + 2 + 19,
+	.vtotal		= 854 + 2 + 19 + 22,
+
+	.width_mm	= 70,
+	.height_mm	= 140,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc odroid_go_ultra_desc = {
+	.mode = &odroid_go_ultra_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 120,
+
+	.pv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x2),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1e),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x23),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xc),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xc),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x3),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 2) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x24),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x18)
+	},
+	.nlinv = 1,
+	.vop_uv = 4887500,
+	.vcom_uv = 937500,
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
+	.gip_sequence = odroid_go_ultra_gip_sequence,
+};
+
 static const struct drm_display_mode rg_arc_mode = {
 	.clock          = 25600,
 
@@ -1055,6 +1210,7 @@ static const struct of_device_id st7701_of_match[] = {
 	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
+	{ .compatible = "hardkernel,odroid-go-ultra-panel", .data = &odroid_go_ultra_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
 	{ }
 };
-- 
2.43.0

