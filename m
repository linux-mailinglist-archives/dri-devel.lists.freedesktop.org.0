Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6E8C1978
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4617710F569;
	Thu,  9 May 2024 22:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TMrNCDbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2DD10E6B3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51ff65b1e14so1516992e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294257; x=1715899057; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a2fkQEr6eD7CRzENX13yKAuKTWqMq+M/tO0KGCERLKE=;
 b=TMrNCDbCHczAF/P+/InUw+VTGi76GO/nSB2ttOtbCa9Q7gD5wt+B8oaER49mKPLum5
 peG+ysN46UAQVCJHrQuDBi9xQcelXHcJmIRfd78H7puGOXQoqlLxR/SPpwqFz5kd2A8G
 qT2ME1vVIl61eL/C2CR89oCQalzheg1/gVOa0mQVRU7kUGufaXvksYmb201F7jK1MVlQ
 8iBisXpQjAsqrQpbK2g0UquUOyTsUJqCsNHJFYzrMRfGakg04rFL8cwKjpgp6MchKUUm
 VeilyjnHJSABm1jP+SPjeYBvDnYmxBtTRyLGv/c4dsV1GCWw5VSSctdhbArWsUuAeNlJ
 j1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294257; x=1715899057;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2fkQEr6eD7CRzENX13yKAuKTWqMq+M/tO0KGCERLKE=;
 b=wLBMLApJmPuvMyjwscUYKcFsqPNIMt3IyR2zlk8Sz3Ga4T97lONLa5vHuACyRAcIJS
 S778mZELwNoIsu7cMjurOrZuBnUZFF8DjfXweKXpUZ8sbuamrW9OfO27UZi7J9YtWu/p
 GfKZ7Wx7Wz+qgvfRkmAodkzux/IxbUNReaoqr0pPHcF6JkVoawctksv8YJo2JYkMFZra
 Y8+dwPcExSH2pXfdL1SK/FIL0eU3LlDJuWebjm/ZjO66cwYxP61JuvPFMEpo0hAmt/93
 AhfZQx4njxsvSS8SLdofeRQea21lpXhRhTV7KyEMrbzantFtmXg7gAlB4O9nLerhuWo0
 tB3Q==
X-Gm-Message-State: AOJu0YxBgc1P9q7nLmen3t9XT4CdkFvZ/PMoHHJHpwfg671dhtkIG/N0
 x+U3CMQ0CJT05b8gZ74GU77qjPvH8vBLxmwnYcYoupcT+kF0VXfrd5ZsurjV5Yo=
X-Google-Smtp-Source: AGHT+IHIGDQk1/cR1Ijjw8/YhWlQDoNEI2P8frX0ryotsgebdB4Pvl9HL4FG6+YRX/QVkOW+BTjnxg==
X-Received: by 2002:ac2:4c55:0:b0:51f:4165:9305 with SMTP id
 2adb3069b0e04-5221007016dmr553026e87.55.1715294257577; 
 Thu, 09 May 2024 15:37:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:35 +0300
Subject: [PATCH RFC 2/7] drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-2-317c78a0dcc8@linaro.org>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u3yXba0jhIsz5BJfPsDI7HZ3897wJIDUeZTmdvqZ37g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ptgN5k7t8f7LdnPmr5YqjeduNPwsvnmuKdC9e+zb3NZ
 5WcIyjUyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJfO9n/18tNMH4xx+D7hW2
 jnYVSfl+flaKuZ7/mkJvXLzTJ5aX3BuTfnxzUtYqud67+p/f74st7Tliku+zMWACT7fQ1vtL564
 zn33Wuz3SR/TY56Tqre7xZxr+LJ4SlnXO4izLxSU3M9g2Zcdy2D/VnTpTjMl1Pvc9donUcps1tt
 1izVNyNDIr+TdsuhYQmNV5qLVRc5qi5hGPGM/39po5nBZs5y8LrKo8VrinwizteQlH8RZRtUjXX
 3NSOezuaxhe9WbT36N5dHX4ZqEdc6a7rGxcInu0QKFMYuaTT4Fsp24dXiBqwc/4Y+KW3JUrI2Q+
 detb6Mvc+bruaYmCqYuP8bxIKas5P++bNHPsT6gPvvEYAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/exit code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 73 ++++++++------------------
 1 file changed, 21 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index aab60cec0603..456c1a5a2110 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -448,22 +448,16 @@ static int boe_tv110c9m_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x13);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x03, 0x96, 0x1a, 0x04, 0x04);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(200);
+	mipi_dsi_msleep(&ctx, 200);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	return 0;
 };
@@ -893,22 +887,16 @@ static int inx_hj110iz_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x03, 0xae, 0x1a, 0x04, 0x04);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(200);
+	mipi_dsi_msleep(&ctx, 200);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	return 0;
 };
@@ -1207,10 +1195,8 @@ static int boe_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x08);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x68);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(150);
+	mipi_dsi_msleep(&ctx, 150);
 
 	return 0;
 };
@@ -1222,16 +1208,12 @@ static int auo_kd101n80_45na_init(struct boe_panel *boe)
 	msleep(24);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	return 0;
 };
@@ -1283,10 +1265,8 @@ static int auo_b101uan08_3_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x4f);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0x41);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe7, 0x41);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(150);
+	mipi_dsi_msleep(&ctx, 150);
 
 	return 0;
 };
@@ -1385,16 +1365,12 @@ static int starry_qfh032011_53g_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe1, 0x23);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe2, 0x07);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0X11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(80);
+	mipi_dsi_msleep(&ctx, 80);
 
 	return 0;
 };
@@ -1490,13 +1466,12 @@ static int starry_himax83102_j02_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x4f);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe9, 0x3f);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbd, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
 
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+	mipi_dsi_msleep(&ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
 	return ctx.accum_err;
 };
@@ -1508,20 +1483,14 @@ static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 
 static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
 {
-	struct mipi_dsi_device *dsi = boe->dsi;
-	int ret;
-
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	struct mipi_dsi_multi_context ctx = { .dsi = boe->dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
+	boe->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int boe_panel_disable(struct drm_panel *panel)

-- 
2.39.2

