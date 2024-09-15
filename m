Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A5979577
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 10:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5548310E157;
	Sun, 15 Sep 2024 08:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="OWOOrb30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F210E157
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 08:10:55 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2da516e6940so678552a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1726387855; x=1726992655; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jI8AGx19JOnD3u1rifDJzZrI0uRZEbX+cl7EZ8hebKs=;
 b=OWOOrb30WokAggeHHsEpcIfKoJnCYXe91hVARQE4kr4tels5B2d8fKa+RJlYWcpdfc
 Ft9cx3vQDzY9DTDUiUDTY3wKG7kh2ki99mmOGeEzHK3efUQKjqgsOwJreqWcKz9A29ts
 6pmfgnQW3GB1mVBWZCtdB4n6hMonCZQNVeTFp9PbgEoKBvAbS3ocfTRbhASEGzD1LPgC
 bUKfzBtGur5BRMhmJoru/WpK2ObF80cgJs+Uoz3MHyHxljMx20HMGuMgGYJlSv8RvQM5
 N9iie4H6oHVR0bdwuA1B+CdNRo0K25U9BSl32rB0Dv/gUvcCGY2SWBEyoFF4rpeaYpHQ
 HPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387855; x=1726992655;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jI8AGx19JOnD3u1rifDJzZrI0uRZEbX+cl7EZ8hebKs=;
 b=vvhVRwU8oO1a5p0XVM7t2WzwieIIpjlIs5ShrLW7WdIxykTULRODrETX2zWy2Mhy91
 dBBvpeug/H39IoE+b/hx9aRD1hUElg+2GR5Ltt1PDXp2XIxGlNv1DDzRKF/cDQT/1wWy
 BkUavlvnCZAvfkevM2NdD0rQ1mQf3yhzySDOgZkUn7Iccs38wsWFVWUePqKjQoUULOch
 GUw1sZZiPekqKCwspsljit1hUA6KxvFUUuK96Qoe1pItEtZJ0Bc5RcEO0OO1TVPCTocV
 EzVsDUDA19qGZjRGFVh6nU48Kdng5JokpUMlZStertopgWshM72yCiCsLIIokvyC8Y2i
 MICg==
X-Gm-Message-State: AOJu0Yw9O6xQF8aEQ+zGHNhVmwWkxDOadNaYoIvOwekHgrU4/Gp9TUub
 m1PK+uypTAWmtm4mYYam1TMB5anXx6sExRVd2r7ZQ4odnNpm9GYWulSdJnpytJg=
X-Google-Smtp-Source: AGHT+IGKpkbPPStSQ4FEXaJuOSVr/bbexGHTzSisD9VQpGZVl5JVohrbEEYGg+wKhdUkgnQi3bogTg==
X-Received: by 2002:a17:90a:d791:b0:2da:71f8:7ff with SMTP id
 98e67ed59e1d1-2dba005b46amr5313010a91.5.1726387854747; 
 Sun, 15 Sep 2024 01:10:54 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dbcfd26f2csm2662672a91.31.2024.09.15.01.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:10:54 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
Date: Sun, 15 Sep 2024 16:08:29 +0800
Message-Id: <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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
and "display off"

Removing variables: display_off_to_enter_sleep_delay_ms

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 44897e5218a6..2f8af86bc2a0 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -31,7 +31,6 @@ struct jadard_panel_desc {
 	bool reset_before_power_off_vcioo;
 	unsigned int vcioo_to_lp11_delay_ms;
 	unsigned int lp11_to_reset_delay_ms;
-	unsigned int backlight_off_to_display_off_delay_ms;
 	unsigned int display_off_to_enter_sleep_delay_ms;
 	unsigned int enter_sleep_to_reset_down_delay_ms;
 };
@@ -69,9 +68,6 @@ static int jadard_disable(struct drm_panel *panel)
 	struct jadard *jadard = panel_to_jadard(panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	if (jadard->desc->backlight_off_to_display_off_delay_ms)
-		mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_off_to_display_off_delay_ms);
-
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	if (jadard->desc->display_off_to_enter_sleep_delay_ms)
@@ -858,7 +854,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
@@ -1109,7 +1104,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
-- 
2.17.1

