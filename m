Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B148BB5E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1289D112603;
	Fri,  3 May 2024 21:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="g3iLaffZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20726112603
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1e4f341330fso1078735ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772204; x=1715377004;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=paGqFOJ2nhC87MmLby9MgxTeHu7XKJBlCB1L6uiDNwg=;
 b=g3iLaffZ1sPpzK3l+rV2uP0PyTZUVvDFmXrzRdpuSzevMSvk84+vGwkcstSWO+JEw1
 9rkNoJ0X0pb1Ql1TX8bFH6ZZP6qKHJB9uuLth4+M7D59YmIJ2bqPTFtR+Y/nVGQZUtil
 /JdcRVwl9FJpGiiyk9//gq1fAy6HNUZUiyqYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772204; x=1715377004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=paGqFOJ2nhC87MmLby9MgxTeHu7XKJBlCB1L6uiDNwg=;
 b=ON6gtYYt8F4ittHIzhGLyTn4spDbNrsZ/vfZrdff26dj0J7nzWFkGHFZWoQqhFBT7P
 Dj/reKrBpXAaBfD8ddCG7d2RyeglHiU1Bj6ar9np0TPJFeE7ee3VDfhSU6a9c7PTo2as
 5ODPBD33VkALMc0hpGJjoyvncU7gSLbOGuz/YB2o/boo7z3X4xnuLRD9c+FuXGuCQOaP
 Tda+j8K58G806c6gLasWAbINDcd+Uh92FZZVqhngWZOKCNONE+nR87hqboWkHy92mce2
 V5LW9fxcs8qHxAkjNsA13+wINuCr2GEYrVRYGut7xua1ldA05VVM7jHtZZQLFbcB5prU
 uIgQ==
X-Gm-Message-State: AOJu0Yxmkyhl+1Hv1KLXXZWYyUHL0Ye7Ooz+no2fGHoDebbWH7MZnIg/
 CvTEAjJ1U1j8x+HClySLXGbSEXfvsniSPdGSbHG2idYqvXRWM2SwIrvKAQ8iTF4qiYa7/QmfP9s
 MZA==
X-Google-Smtp-Source: AGHT+IEx3Ot96pqT0JZWFoeg3B/jPEk44kYlrdOtlaungPQljCh2vyyJ0lZPjiPjtxRQep5DNsRVJQ==
X-Received: by 2002:a17:902:c40c:b0:1e4:df0c:a570 with SMTP id
 k12-20020a170902c40c00b001e4df0ca570mr4139211plk.8.1714772204518; 
 Fri, 03 May 2024 14:36:44 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Chris Zhong <zyw@rock-chips.com>,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 08/48] drm/panel: innolux-p079zca: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:32:49 -0700
Message-ID: <20240503143327.RFT.v2.8.I99c73621fe3fba067a5e7ee6a1f6293c23371e1e@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Lin Huang <hl@rock-chips.com>
Cc: Brian Norris <briannorris@chromium.org>
Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 39 -------------------
 1 file changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 485178a99910..5833d3a0fc79 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -51,9 +51,6 @@ struct innolux_panel {
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 static inline struct innolux_panel *to_innolux_panel(struct drm_panel *panel)
@@ -61,26 +58,11 @@ static inline struct innolux_panel *to_innolux_panel(struct drm_panel *panel)
 	return container_of(panel, struct innolux_panel, base);
 }
 
-static int innolux_panel_disable(struct drm_panel *panel)
-{
-	struct innolux_panel *innolux = to_innolux_panel(panel);
-
-	if (!innolux->enabled)
-		return 0;
-
-	innolux->enabled = false;
-
-	return 0;
-}
-
 static int innolux_panel_unprepare(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;
 
-	if (!innolux->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(innolux->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -104,8 +86,6 @@ static int innolux_panel_unprepare(struct drm_panel *panel)
 	if (err < 0)
 		return err;
 
-	innolux->prepared = false;
-
 	return 0;
 }
 
@@ -114,9 +94,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	struct innolux_panel *innolux = to_innolux_panel(panel);
 	int err;
 
-	if (innolux->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(innolux->enable_gpio, 0);
 
 	err = regulator_bulk_enable(innolux->desc->num_supplies,
@@ -178,8 +155,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	/* T7: 5ms */
 	usleep_range(5000, 6000);
 
-	innolux->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -189,18 +164,6 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int innolux_panel_enable(struct drm_panel *panel)
-{
-	struct innolux_panel *innolux = to_innolux_panel(panel);
-
-	if (innolux->enabled)
-		return 0;
-
-	innolux->enabled = true;
-
-	return 0;
-}
-
 static const char * const innolux_p079zca_supply_names[] = {
 	"power",
 };
@@ -407,10 +370,8 @@ static int innolux_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs innolux_panel_funcs = {
-	.disable = innolux_panel_disable,
 	.unprepare = innolux_panel_unprepare,
 	.prepare = innolux_panel_prepare,
-	.enable = innolux_panel_enable,
 	.get_modes = innolux_panel_get_modes,
 };
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

