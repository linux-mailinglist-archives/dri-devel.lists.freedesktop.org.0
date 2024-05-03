Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BC8BB5EB
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347B4112ABA;
	Fri,  3 May 2024 21:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OSb9ZXin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311AC112A08
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ecddf96313so1022935ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772209; x=1715377009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGK5xSZNNlb2uRbxmyeRSuB7caWdrwYvtVpURnzxX80=;
 b=OSb9ZXinj8bZnvxHNLg2C6Kcg7Z6cYGKKYYUBka7RcJquOc8i6LJAcCfrRZchFxqda
 5zmO+ER+BNOoMvF/RcojCEg6J5ZGe4a5+/8WbI8CDf5FHEBCJjqN4JcHJ3y1TddBFymR
 Y7mlvti++23kDSOZ8STBcTyxC3b+oIPuhhutY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772209; x=1715377009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGK5xSZNNlb2uRbxmyeRSuB7caWdrwYvtVpURnzxX80=;
 b=vC5fD/VxxVbC8Ga+PzNT6Ts+UVq70fDmhYjMlvXgeP0Gzts8m3vGtrwMyq4LcfpSrY
 N7/kmArms1KsrZoqydR+3/dn0SHh/YYv9FXueAklYpnQ/2Epnw5ju9D6UyrFNP4cs1O9
 +v37nkhirAVSLidCCDfHNBBsqaL0DkedUz06eISqY+ME//QFM3dvCFCbcUDNLaylIXx/
 ftpc9iNRMAW8+/c7fM8D9JgOmPunnbua72m4wjyd5Zr4rhtWzi2aysnHugaFVUvMHxC/
 kyRZ7P+HcCnxwOdZrXBcfD8CKi5pAB3MCA7x4U9J97PKRFPhJT/nh1HPS/KYFw3f/PBO
 e6cg==
X-Gm-Message-State: AOJu0YxmkOKS1nA5AjFN72xNLk4sDBcS3oY2Lvfh8BOV6n7ZkR/DxcD2
 D4QneXVUjXjBvKSNYrgxpxBvpeXopI3M3HTNfMsX+LEIUA/3gBKiNxur4MMJpmEAq50pAe0obKc
 7Hw==
X-Google-Smtp-Source: AGHT+IEempTTTQ3d9Vy5vnr244sB3FyliFh1+HIKi7tUNUcNLkibMfoJWgsA8T7pfYRVD6IrR06Bvw==
X-Received: by 2002:a17:902:b617:b0:1dd:e114:121c with SMTP id
 b23-20020a170902b61700b001dde114121cmr3627968pls.56.1714772208843; 
 Fri, 03 May 2024 14:36:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jacobe Zang <jacobe.zang@wesion.com>, Nicolas Belin <nbelin@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 10/48] drm/panel: khadas-ts050: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:32:51 -0700
Message-ID: <20240503143327.RFT.v2.10.Ibed1026f20cab08c90fa376e68c2f23a343e826b@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

Cc: Jacobe Zang <jacobe.zang@wesion.com>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-khadas-ts050.c | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index c54be0cc3f08..e35762ebdbd1 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -26,9 +26,6 @@ struct khadas_ts050_panel {
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
 	struct khadas_ts050_panel_data *panel_data;
-
-	bool prepared;
-	bool enabled;
 };
 
 struct khadas_ts050_panel_cmd {
@@ -642,9 +639,6 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 	unsigned int i;
 	int err;
 
-	if (khadas_ts050->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(khadas_ts050->enable_gpio, 0);
 
 	err = regulator_enable(khadas_ts050->supply);
@@ -708,8 +702,6 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 
 	usleep_range(10000, 11000);
 
-	khadas_ts050->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -726,11 +718,6 @@ static int khadas_ts050_panel_unprepare(struct drm_panel *panel)
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;
 
-	if (!khadas_ts050->prepared)
-		return 0;
-
-	khadas_ts050->prepared = false;
-
 	err = mipi_dsi_dcs_enter_sleep_mode(khadas_ts050->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
@@ -747,31 +734,17 @@ static int khadas_ts050_panel_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int khadas_ts050_panel_enable(struct drm_panel *panel)
-{
-	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
-
-	khadas_ts050->enabled = true;
-
-	return 0;
-}
-
 static int khadas_ts050_panel_disable(struct drm_panel *panel)
 {
 	struct khadas_ts050_panel *khadas_ts050 = to_khadas_ts050_panel(panel);
 	int err;
 
-	if (!khadas_ts050->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(khadas_ts050->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 
 	usleep_range(10000, 11000);
 
-	khadas_ts050->enabled = false;
-
 	return 0;
 }
 
@@ -815,7 +788,6 @@ static int khadas_ts050_panel_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs khadas_ts050_panel_funcs = {
 	.prepare = khadas_ts050_panel_prepare,
 	.unprepare = khadas_ts050_panel_unprepare,
-	.enable = khadas_ts050_panel_enable,
 	.disable = khadas_ts050_panel_disable,
 	.get_modes = khadas_ts050_panel_get_modes,
 };
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

