Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900A92BBB2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD9B10E556;
	Tue,  9 Jul 2024 13:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="L+x1PK/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6FD10E553
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fb3cf78fbdso26296815ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532893; x=1721137693; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CYdWEsy6O+5XGf0fUOZ1in9Gq/j66NH1BeYWcQlMcy8=;
 b=L+x1PK/HOy0/7Fk3HHH/sUEIIT7pA0bf4g84ka9SOLVOZCBiuGzi5w77aPcJTpnNoS
 Q910qjB3YQ5HHMy1mu7Csw76TM88e3J80Fr5TrRmLYcGHohzRRZNmKQiidpKbaUHE5Pq
 WEcM0mcZ7Wd1tNe1NphaXErDpj/J1Eyim7e43zukNep/IOrg1JvErliV6GnS/Hu0SRb2
 mtGCxdy478EsYsjtwZXlpc6DI+bPBQTEQ8mgCe3I3uP4CTzInAnWU1KFgk6y0qEZiJOi
 RDd5c1fq9RzSy9EduZqblawbnYYA+bsQrZnBRESfO/BjjFGL44LGclcnhbKDKSt6rXJ2
 aj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532893; x=1721137693;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYdWEsy6O+5XGf0fUOZ1in9Gq/j66NH1BeYWcQlMcy8=;
 b=wLZDz0pOgPsFrMDLt1HO3Cye2STb913RccuHVnhguzmDFWBfl73RcYlG6KJ3LPw8Vm
 LNYjim1lMNtAxssFXamPf+OjrVvmJDLdPRVYyQArH/RHP9VxGVtZDbBafywjijs3qaix
 9XnJV+MmsNYBL0hBrtc93aiyVjRUzRI00g+v+SHQJPVHDHb511ArfN/79qmUCDLAj89k
 8KpVM2SjHYLgcGbUlXIbIgp8e9oVe+kvoOSrqzDDFphJIC/CZVOAhDY8mm6IAinjWaTX
 kcCJV7mUON/H2t1ueoJp3SOc2LVS5yB5sLpb3TgFC94hs0QgdrXtaTvUk7W4kasTnN1L
 F2uQ==
X-Gm-Message-State: AOJu0YzY0SyuUqCK1luEvUF8AvSLkij7BS6F90wSPteBaVFzB5E4guug
 +U/FuyIxStgKruixHf0DjjCnySxlXRp6KIY3AeoVBp2X7zYQJuqQM8ua4WldmLA=
X-Google-Smtp-Source: AGHT+IHf3jGkzIV/7x6CYbaGZ5oidggGkve7x/0gRMjUtvEvEhpQPLV5dlBWQeOqvyZ4ARjS8WK1Aw==
X-Received: by 2002:a17:903:283:b0:1fb:9a83:4496 with SMTP id
 d9443c01a7336-1fbb6cd18dfmr23414525ad.2.1720532893234; 
 Tue, 09 Jul 2024 06:48:13 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:12 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 1/5] drm/panel: boe-th101mb31ig002 : Make it compatible
 with other panel.
Date: Tue,  9 Jul 2024 21:47:50 +0800
Message-Id: <20240709134754.28013-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This driver currently only applies to one panel. Modify it to be
compatible with other panels.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V6 and V5:
-  1. Corrected the use of "->init" in struct panel_desc, 
-  2. Modify indentation in "boe_th101mb31ig002_of_match[]"
v5: https://lore.kernel.org/all/20240704072958.27876-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 763e9f8342d3..8f03920e3503 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -17,11 +17,21 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct panel_desc {
+	const struct drm_display_mode *modes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+	int (*init)(struct drm_panel *panel);
+	unsigned int lanes;
+};
+
 struct boe_th101mb31ig002 {
 	struct drm_panel panel;
 
 	struct mipi_dsi_device *dsi;
 
+	const struct panel_desc *desc;
+
 	struct regulator *power;
 	struct gpio_desc *enable;
 	struct gpio_desc *reset;
@@ -161,7 +171,10 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->enable, 1);
 	msleep(50);
 	boe_th101mb31ig002_reset(ctx);
-	boe_th101mb31ig002_enable(panel);
+
+	ret = ctx->desc->init(panel);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -181,6 +194,16 @@ static const struct drm_display_mode boe_th101mb31ig002_default_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static const struct panel_desc boe_th101mb31ig002_desc = {
+	.modes = &boe_th101mb31ig002_default_mode,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_MODE_LPM,
+	.init = boe_th101mb31ig002_enable,
+};
+
 static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 					struct drm_connector *connector)
 {
@@ -237,6 +260,7 @@ static const struct drm_panel_funcs boe_th101mb31ig002_funcs = {
 static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct boe_th101mb31ig002 *ctx;
+	const struct panel_desc *desc;
 	int ret;
 
 	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
@@ -246,11 +270,11 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
-	dsi->lanes = 4;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_NO_EOT_PACKET |
-			  MIPI_DSI_MODE_LPM;
+	desc = of_device_get_match_data(&dsi->dev);
+	dsi->lanes = desc->lanes;
+	dsi->format = desc->format;
+	dsi->mode_flags = desc->mode_flags;
+	ctx->desc = desc;
 
 	ctx->power = devm_regulator_get(&dsi->dev, "power");
 	if (IS_ERR(ctx->power))
@@ -302,7 +326,10 @@ static void boe_th101mb31ig002_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id boe_th101mb31ig002_of_match[] = {
-	{ .compatible = "boe,th101mb31ig002-28a", },
+	{
+		.compatible = "boe,th101mb31ig002-28a",
+		.data = &boe_th101mb31ig002_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_th101mb31ig002_of_match);
-- 
2.17.1

