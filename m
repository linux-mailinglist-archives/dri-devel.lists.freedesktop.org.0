Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66EA8FC069
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CDC10E409;
	Wed,  5 Jun 2024 00:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LXs3VCG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0510E409
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f6342c5fa8so36923475ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547052; x=1718151852;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZEZey5x5luD0xWg/8KZQe7BPyHWAO218kvdlS1elh8=;
 b=LXs3VCG3/+YDNYmkVuKGJg2fLhgCSUAZIC++GQrccRRvGG8grUXW0rO+qwiC+NRMtf
 lAAEWsmx/uCEmgKg1ePqstW8ykbpeb48DqQAlnikswP7Xc8r8n3WHnRM1KD9d1BuiwBb
 uo23fDBPNu5a8cuWLJ/ObeRTWEIqSVBXQcDDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547052; x=1718151852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZEZey5x5luD0xWg/8KZQe7BPyHWAO218kvdlS1elh8=;
 b=abyLT6tUpwlApkTVA8f6e76fbbyXnUqZcIDXv0aLPoiFbkNJoQyixtVzmlwpMjGvCD
 aCx1/qmNzlih6OY4M3NJ3DPhcdkyQ3ajesILihKzXAAK/Mppi9ilVYBp9N2uZVGQ5DMH
 9teO8SBMf1d1sFJmICI87qDKMECLku6NEQmM1+EgtDtmlvXUbX7WJrhaUoXG0Y69hnLt
 lriEKN66hXF+dg7Bd/RgRTLa2YtXzXUkVcVD+wHuxQlczRB+38+KD9BB2l2sh93hvYpt
 tjaQcxaRR/N1l0RkdWWpSG9HEboknRNPmpteIU/tRuUOZ+iDhOBB1pUUdZVbgDXq+6nK
 OocQ==
X-Gm-Message-State: AOJu0Yxc2H6t+9uRVJm5CJqHpiY7cm0MBa/LNie2SuordvU7HmArU887
 T2eqmXFZ0/CpGSyW1ffkLlZSoIPZaq1gaywRgmJK/YQb9kUziA/VcgjfEYPFrCIW3JsySPivljk
 =
X-Google-Smtp-Source: AGHT+IEfsqqgmgYWM0BC/bbTU6AS9BdhPGPSHuCKwVJwHIAn7JXDeAeaFpMbK/YJKuIU6Ne3nlYqaw==
X-Received: by 2002:a17:902:a515:b0:1f6:4cff:6ffd with SMTP id
 d9443c01a7336-1f6a5a83e7emr9332115ad.57.1717547052198; 
 Tue, 04 Jun 2024 17:24:12 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock Wang <rock_wang@himax.com.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 01/24] drm/panel: boe-himax8279d: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:47 -0700
Message-ID: <20240604172305.v3.1.Ia3f254ab6e04e4f7afba6c066454498c8fb01324@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

NOTE: as part of this, transition the panel's direct calls to its
disable/unprepare functions in shutdown/remove to call through DRM
panel.

Cc: Jerry Han <jerry.han.hq@gmail.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rock Wang <rock_wang@himax.com.cn>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 31 +++-----------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index e225840b0d67..12e14615298b 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -47,9 +47,6 @@ struct panel_info {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *pp33_gpio;
 	struct gpio_desc *pp18_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 static inline struct panel_info *to_panel_info(struct drm_panel *panel)
@@ -86,17 +83,12 @@ static int boe_panel_disable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 		return err;
 	}
 
-	pinfo->enabled = false;
-
 	return 0;
 }
 
@@ -105,9 +97,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -121,8 +110,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 
 	disable_gpios(pinfo);
 
-	pinfo->prepared = false;
-
 	return 0;
 }
 
@@ -131,9 +118,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (pinfo->prepared)
-		return 0;
-
 	gpiod_set_value(pinfo->pp18_gpio, 1);
 	/* T1: 5ms - 6ms */
 	usleep_range(5000, 6000);
@@ -180,8 +164,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	/* T7: 20ms - 21ms */
 	usleep_range(20000, 21000);
 
-	pinfo->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -194,9 +176,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int ret;
 
-	if (pinfo->enabled)
-		return 0;
-
 	usleep_range(120000, 121000);
 
 	ret = mipi_dsi_dcs_set_display_on(pinfo->link);
@@ -205,8 +184,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	pinfo->enabled = true;
-
 	return 0;
 }
 
@@ -917,11 +894,11 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = boe_panel_disable(&pinfo->base);
+	err = drm_panel_disable(&pinfo->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
-	err = boe_panel_unprepare(&pinfo->base);
+	err = drm_panel_unprepare(&pinfo->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
 
@@ -936,8 +913,8 @@ static void panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 
-	boe_panel_disable(&pinfo->base);
-	boe_panel_unprepare(&pinfo->base);
+	drm_panel_disable(&pinfo->base);
+	drm_panel_unprepare(&pinfo->base);
 }
 
 static struct mipi_dsi_driver panel_driver = {
-- 
2.45.1.288.g0e0cd299f1-goog

