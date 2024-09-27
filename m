Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F998818F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B210ECA4;
	Fri, 27 Sep 2024 09:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="p6hG01Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4910ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:44:12 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e0ad414718so233897a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727430252; x=1728035052; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6vXo/QBqbRSPcyQ8x6xHYpiZBOONjq8OugZwsB+apMA=;
 b=p6hG01Cn/1r0TpGzN40vLKENPHxLO31X13hbnTnKByFHshQSBnQ6YYIcbXS1jlDbha
 +C7Iq3zq5c+E1JYSmA86cg+1o9uXYctM2Inmkqbzd9UxP3hXOvql4xSdvPFGCb/7Iu5s
 Vqu8WrUZAlLmhtKaG4GMlU0OYSJQiNsVm7s3XktaRDXR3ORA7fpfcNXvHhk+AH8/1/KP
 jHa8Q/KDHhrEuCMMLDiApakWQlKxHXghSFZ0mPh3IjJxuZR24PfKPXKkdJWUcwsuJgL/
 IpHsEVQgLAdhcD+3w/Yk3DvN3drOMc244e5mBctfbtGWU3GYeeRg5XvpAq8Ivxl5nzYk
 5sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727430252; x=1728035052;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6vXo/QBqbRSPcyQ8x6xHYpiZBOONjq8OugZwsB+apMA=;
 b=eAYyvklgNClhKOSWxJmCSlPULkiMT2ivg8D8kJ6KX9fjlQd4VaK1YHc7K/s2WII5zm
 iLSlCBYVuxHXqqGlwYJd5PugsPO6yuJJaZ0K60rtXD0Vc/TQFyPSH2DHOxE+v7DTl/mc
 kkdj5ZpaO6y/Lm2uA9jrXprBbNmTG8U4hrOf2GFxCSywSLlnqwcOz9wEReOefJpdG5Ji
 WBNLibuePxyyGIIBqawfm/jft8Gs0hfLNVgP0r0yn6V4OmVMLKXimtSleyqVKyJYyCb4
 ao1GiNk5Sr25L8ZpwXhIR9eAmkAbljtC3lfhnAp3b8gN7JwNXTImTcizUTysxiqAKyFj
 QBHA==
X-Gm-Message-State: AOJu0YzU64xYmwJd5ZxAq0U0/DUeINwVjES4tsyIxvcknltsMilREsfp
 SJqK7SylFj7TeNYcdzbRaiYmUpjcPzc3NwlFjXQz0rlYkG1VkoKEqgYvrl+G/KM=
X-Google-Smtp-Source: AGHT+IE7RZB9BJpIiNesgL3dY0bxd4GYrJD5iq+grbfZ17f5PpYAXUaASOupLwHC3H3KxQnpst0sMw==
X-Received: by 2002:a17:90a:d802:b0:2da:71f8:7ff with SMTP id
 98e67ed59e1d1-2e0b8e841bfmr1312757a91.5.1727430251873; 
 Fri, 27 Sep 2024 02:44:11 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e06e1bae46sm5105895a91.22.2024.09.27.02.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:44:11 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
Date: Fri, 27 Sep 2024 17:43:40 +0800
Message-Id: <20240927094340.18544-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In MTK chips, if the DRM runtime resume has not yet completed and the
system enters sleep mode at the same time, there is a possibility of
a black screen after waking the machine. Reduce the disable delay
resolves this issue,

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
Changes between V3 and V2:
-  1. Modify the commit message 
v2: https://lore.kernel.org/all/20240923134227.11383-3-lvzhaoxiong@huaqin.corp-partner.google.com/

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

