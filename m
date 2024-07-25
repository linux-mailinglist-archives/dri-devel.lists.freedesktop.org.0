Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA493BE01
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84D10E276;
	Thu, 25 Jul 2024 08:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="pflkIQjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C710E242
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:33:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fb3b7d0d56so4020435ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721896385; x=1722501185; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P1cIyFfiNPgofzsFP+k9uE4hAkyuSgiUQpvXenggHas=;
 b=pflkIQjc+PTYKmNLW2PMvM59FuJmKgjvDLDS8+ctid8fmbGPxPisG/v98+O8Dco5gj
 vD/651NdxSXbTeiEukbv09ZEJdqRSg8YOPfHWMs71DKsls7gwKO9WnQOFFz9H5SQnI+A
 cDi5wRlg9dM3vOTXW4LufKUQIii+e2T3xrn26NthRRuE1efthPs9lTzpoiMtfbwxOguA
 OK9mK3jPIBW9lHkka7veqzcOLh8NPrt2dvmDUTv987Y07nzBTICbNvFJzb1ynrHqn0BG
 6GIu3t82FQuXZZGiFqYdkW1STo9o8oGhfh0PgRY1yNFCgmtpivVhgHuOvS3x0I141irH
 Gl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721896385; x=1722501185;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P1cIyFfiNPgofzsFP+k9uE4hAkyuSgiUQpvXenggHas=;
 b=pAtFJXm/ym1MEUQJmaDY6eU3z9dDTjbJPUV1aNY8SDu1L+z3Cq84gm5OpqROQMGmXr
 7bkpQdU2ynvHZThKuZz1nygi4zyOO5RP5t6/xkPf5FZli01x9Y0KpEGNbpFzqkRBfYsc
 Q25Xhu5/5aLSIaflQuVp7BeWPL/jkCDwy/CmUV88YF5VpcPvuXtSukzGgkw4LZlaJx3i
 xhoqaeOUeUfG25/36qNH1k6V7Ac/pKAmUBWzILDTg15eMEahC9Y32SWGtgLufSHyjS+7
 jRDXC18voBKNyxoo3Z3ADyafsnDAo4SpJIlZLZQ5iOqyc3I7WMigGroiJIzw0Oma/6MP
 XFYg==
X-Gm-Message-State: AOJu0YylCUwcg1s6n6XkWsBm3qQqJbBKe0yejI34kaHFnWeHk7MOpFML
 LogI2hBivHsItYmv5ZDALHH/nKYz30fIsaW6fQxViXhPQDec6zc/NB9vmbf1jy8=
X-Google-Smtp-Source: AGHT+IHTS8RJYTflUeDiBY/hXiRtL6ZK1PFmiCuWqxGoTA8NI92QylQX8WpBgHaNKPCfbFzqtkQgjg==
X-Received: by 2002:a17:902:f68d:b0:1f9:c508:acd5 with SMTP id
 d9443c01a7336-1fed920b957mr14508575ad.5.1721896385467; 
 Thu, 25 Jul 2024 01:33:05 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7ff9086sm8595595ad.302.2024.07.25.01.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:33:04 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of the
 11/29 command
Date: Thu, 25 Jul 2024 16:32:44 +0800
Message-Id: <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Move the 11/29 command from enable() to init() function

As mentioned in the patch:
https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Our DSI host has different modes in prepare() and enable()
functions. prepare() is in LP mode and enable() is in HS mode.
Since the 11/29 command must also be sent in LP mode,
so we also move 11/29 command to the init() function.

After moving the 11/29 command to the init() function,
we no longer need additional delay judgment, so we delete
variables "exit_sleep_to_display_on_delay_ms" and
"display_on_delay_ms".

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 04d315d96bff..ce73e8cb1db5 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -31,8 +31,6 @@ struct jadard_panel_desc {
 	bool reset_before_power_off_vcioo;
 	unsigned int vcioo_to_lp11_delay_ms;
 	unsigned int lp11_to_reset_delay_ms;
-	unsigned int exit_sleep_to_display_on_delay_ms;
-	unsigned int display_on_delay_ms;
 	unsigned int backlight_off_to_display_off_delay_ms;
 	unsigned int display_off_to_enter_sleep_delay_ms;
 	unsigned int enter_sleep_to_reset_down_delay_ms;
@@ -66,26 +64,6 @@ static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
 	return container_of(panel, struct jadard, panel);
 }
 
-static int jadard_enable(struct drm_panel *panel)
-{
-	struct jadard *jadard = panel_to_jadard(panel);
-	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
-
-	msleep(120);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (jadard->desc->exit_sleep_to_display_on_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-
-	if (jadard->desc->display_on_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_ms);
-
-	return dsi_ctx.accum_err;
-}
-
 static int jadard_disable(struct drm_panel *panel)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
@@ -202,7 +180,6 @@ static const struct drm_panel_funcs jadard_funcs = {
 	.disable = jadard_disable,
 	.unprepare = jadard_unprepare,
 	.prepare = jadard_prepare,
-	.enable = jadard_enable,
 	.get_modes = jadard_get_modes,
 	.get_orientation = jadard_panel_get_orientation,
 };
@@ -382,6 +359,12 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 
 	jd9365da_switch_page(&dsi_ctx, 0x00);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -608,6 +591,12 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -831,6 +820,16 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 
 	jd9365da_switch_page(&dsi_ctx, 0x00);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -859,8 +858,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.exit_sleep_to_display_on_delay_ms = 120,
-	.display_on_delay_ms = 20,
 	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
@@ -1074,6 +1071,16 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
 
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
 	return dsi_ctx.accum_err;
 };
 
@@ -1102,8 +1109,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.exit_sleep_to_display_on_delay_ms = 120,
-	.display_on_delay_ms = 20,
 	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
-- 
2.17.1

