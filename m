Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4297EC82
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 15:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5680310E3FA;
	Mon, 23 Sep 2024 13:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="0t1ObGwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B958910E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 13:42:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-71797e61d43so381057b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727098976; x=1727703776; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lmi4LwsQVWVuhv2u7M387Utb1/3g/g58JnDuv7KUrV8=;
 b=0t1ObGwR4eEU/trjAxPPPhuciklt5x6Cq24M06inu01uLLctl4U7EoaG6To4sm/quX
 qISWNA2HBwYd8in4yEVWdXILAohwdgjO5/DNFrN6Cc+fj32kNProTolWXOfip1zQxvah
 Fqxu5dc2w4gqI7RePOP3bk4lzTX93ORchQVon4ZwYVqdn2vovtfJO3hWENj5qvTB2emD
 ynfKD1PuAk6QlcwjSfFoKKU/tB1OIfbgAdzsOALx/dQACsaCakvDA1meqcU2+AYQVxkV
 IdDQzJimZUbP2A6yvXqQ6x2QTrJ6JVgvaMSkqR2udV4bi4iuKdw0JFN3mySnw4yRt8dd
 JBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727098976; x=1727703776;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lmi4LwsQVWVuhv2u7M387Utb1/3g/g58JnDuv7KUrV8=;
 b=B77cTxD6g1R/DQX8trAanBBVjbwua6MdD7jPfnBDUxUsUEdmolUYrpDtLJHsvK2D0c
 2IPF/gAirsSPirIrrRVFQLQui+JVvcLBjCDxIX4DT8A776HsINXq3j5X6uCkl7LCIMB6
 z1CyMNhGQR28qhKH1fEAH3wSPMi/7fTUYA3JK8J0nphYJHGd6VAsC7ihIpoRgkze4Ug6
 Wr5aXuAzrCnaR5KpJMqk2UuOGYc8VxBP1cspnVwRHb+eEo01pCmOqbvuHZpumx2qXvJC
 YRHGcxsRl3wUwJuDIffn8tL2ajmLmPg7wkbSQGZE4JeVdbEMcVfgNPFEPfeeRr3pkp46
 2YsA==
X-Gm-Message-State: AOJu0YyXpZgcxNukDFYG3RPkax9qDLUaxq87gy9+sTF6YUVQ0FBLVtWN
 iwDBY4EX5MFNia9dDp/tGlOyiJyXPeDfGOwfEzfSfkhMclu+1342SRzYMfr8Z6CBYI88YF3e4NE
 fgZw=
X-Google-Smtp-Source: AGHT+IFxg+CNVtD2TyiKjmB4Qulk1SqyU3c8EKJ4MqIDUQPspZnRPVur5vPqy0ENvEqgWxT5svosnA==
X-Received: by 2002:a05:6a00:3e17:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-7199c8456d1mr6829062b3a.0.1727098976235; 
 Mon, 23 Sep 2024 06:42:56 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944b97302sm14376009b3a.147.2024.09.23.06.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:42:55 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
Date: Mon, 23 Sep 2024 21:42:27 +0800
Message-Id: <20240923134227.11383-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In MTK chips, if the system starts suspending before the DRM runtime 
resume has not completed, there is a possibility of a black screen 
after waking the machine. Reduce the disable delay resolves this issue, 

The "backlight_off_to_display_off_delay_ms" was added between
"backlight off" and "display off"  to prevent "display off" from being
executed when the backlight is not fully powered off, which may cause
a white screen. However, we removed this
"backlight_off_to_display_off_delay_ms" and found that this situation
did not occur. Therefore, in order to solve the problem mentioned
above, we removed this delay, and the delay between "display off" and
"enter sleep" is not defined in the spec, so we reduce it from 120ms 
to 50ms.

In addition, T14 >= 120ms, so we change
"enter_sleep_to_reset_down_delay_ms" from 100ms to 120ms.

The panel spec:
1. https://github.com/Vme5o/power-on-off-sequential

Fixes: e4bd1db1c1f7 ("drm/panel: boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel")

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V2 and V1:
-  1. Modify the commit message.
-  2. Delete the value of backlight_off_to_display_off_delay_ms.
-  3. Modify the value of enter_sleep_to_reset_down_delay_ms from 100ms to 120ms.
v1: https://lore.kernel.org/all/20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 0b87f1e6ecae..9e4d91c7c394 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -29,7 +29,7 @@ struct panel_desc {
 	bool lp11_before_reset;
 	unsigned int vcioo_to_lp11_delay_ms;
 	unsigned int lp11_to_reset_delay_ms;
-	unsigned int backlight_off_to_display_off_delay_ms;
+	unsigned int display_off_to_enter_sleep_delay_ms;
 	unsigned int enter_sleep_to_reset_down_delay_ms;
 	unsigned int power_off_delay_ms;
 };
@@ -184,12 +184,10 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
 						      panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	if (ctx->desc->backlight_off_to_display_off_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_display_off_delay_ms);
-
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	mipi_dsi_msleep(&dsi_ctx, 120);
+	if (ctx->desc->display_off_to_enter_sleep_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, ctx->desc->display_off_to_enter_sleep_delay_ms);
 
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
@@ -275,6 +273,7 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
 			  MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_MODE_LPM,
 	.init = boe_th101mb31ig002_enable,
+	.display_off_to_enter_sleep_delay_ms = 120,
 };
 
 static const struct drm_display_mode starry_er88577_default_mode = {
@@ -302,8 +301,8 @@ static const struct panel_desc starry_er88577_desc = {
 	.lp11_before_reset = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 50,
-	.backlight_off_to_display_off_delay_ms = 100,
-	.enter_sleep_to_reset_down_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 120,
 	.power_off_delay_ms = 1000,
 };
 
-- 
2.17.1

