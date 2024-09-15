Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15197957A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 10:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B58710E2E4;
	Sun, 15 Sep 2024 08:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="BmkSZJn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285C10E2E0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 08:11:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2d883286bd2so289878a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726387860; x=1726992660; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sRDTLwONqQd982ElhveII1b1cUAuGyre5X0fuHS6yLY=;
 b=BmkSZJn0SYAz1/QlPZcsvR9O4cajsYooNzZ4Kt7krrgZwoRc2ppz2uNpDZkk8amf2+
 +/OFtzQVqkhsLLGY4VqG3LzjJmmD+XVRhCeOxrIiWt3fXmFRBYGE0Cd/BIqz5ScykcgO
 tveBtcLkAJhFFKP0xwyVpVLa3wiayxRgqh+ooMzZrKtXz4FnExAgEZEIi/39uHe4ffrJ
 4fQCyzvboXYhHXrIVMfwmAmuWhV5PxFDCuaaq7iqw2MzvCp4OyNhq7u4CZdk3IERB/5d
 wOLlAmBXTO6SAee89MYYYEk2ISHQdnXK8UZCs8P+r6mclia4W3IfBTs9VMDd5Nn7Gn6W
 G8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387860; x=1726992660;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRDTLwONqQd982ElhveII1b1cUAuGyre5X0fuHS6yLY=;
 b=qPovXN0tizlej4C0uzVMlFBxVdcpgE7KzV4L3NPOZuU4VMi2Eup6GmPykyBQqLNz/f
 b2B/Iz//wtrKpAXwgMeUoh0vwuyaDYBUVojuaZo0A5TqhtKY4o8IHo9AJxFcr3gjeqwx
 CSJiuJ1k130II0ng/mU+BCtY8c/AGq/jL65WYY2nrKlNBZXFcrHBIahlbINdFKNVv6a7
 5t+3cFdWxZUnGSsknI7ZAjyaUGI4RYF6ljDH6TZtmAoe8W9wLmlPJGziVBiMF6+JrdCm
 xGP7nMAhv9t+ZRj76U+M6WEgmtsFARAO94zQh+fzKT0KjFPJp1SzVPXWKivEqcMn29i/
 p1eA==
X-Gm-Message-State: AOJu0YzTvHRatbWioCmcHUDpDARia28OaifsTfwNu+t3QWhpuIUvdl/X
 UPI8UP7DAlgv95ZApvnNWRzbEcCy7bnMZSMnub64CO9YkgPqOAOQ7t0y9luRv10=
X-Google-Smtp-Source: AGHT+IGklY3LMqjEheyFTix+dZ97vdFbx9qbo4QLsOK0vJc+LXtmYTKaliThR6RCom4pnnRpY/hUkQ==
X-Received: by 2002:a17:90b:104a:b0:2db:60b:3669 with SMTP id
 98e67ed59e1d1-2dba007c325mr5338573a91.8.1726387859978; 
 Sun, 15 Sep 2024 01:10:59 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dbcfd26f2csm2662672a91.31.2024.09.15.01.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:10:59 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
Date: Sun, 15 Sep 2024 16:08:30 +0800
Message-Id: <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In order to meet the timing, remove the delay between "backlight off"
and "display off", and reduce the delay between "display_off" and
"enter_sleep"

Removing variables: display_off_to_enter_sleep_delay_ms

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 0b87f1e6ecae..c2d0ec199829 100644
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
@@ -302,7 +301,7 @@ static const struct panel_desc starry_er88577_desc = {
 	.lp11_before_reset = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 50,
-	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 	.power_off_delay_ms = 1000,
 };
-- 
2.17.1

