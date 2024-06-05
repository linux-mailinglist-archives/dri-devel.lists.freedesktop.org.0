Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0D8FC06E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481ED10E62F;
	Wed,  5 Jun 2024 00:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z7AIf8h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47610E625
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:18 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f62fae8c3cso46588775ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547058; x=1718151858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWtosQoN9Pg9d9xBQ0Jlap54LBTP0iCSFOQ0mCtxtm8=;
 b=Z7AIf8h8Bg2luLVd5dPaEV6OEHDKrCsldQbkLQaIlwROt1+HvS83Enfkya76fyV38g
 09JsUYI2WHYTqBWenJp0QryLQXfKNVjp1A4bg8DMwzS2gTS+YIvKlb0drl7xfh2P3MET
 +dIEeKxCitmjoiklIgZoYspfE8LJOt1pVDrnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547058; x=1718151858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWtosQoN9Pg9d9xBQ0Jlap54LBTP0iCSFOQ0mCtxtm8=;
 b=M9TZ2CCdg0b6G3g/hzeX7VsSIORDnUhXrDrrXyCdb3DsB3p3ZX1E7Xkvlc2hl1LxaS
 +0KM6XdRybuoAWE+XOIel8wM7lpAznldRUoExjDyME1yI/TPGUjffPagqoGBkvR6Tr9/
 i25FT2Yp8UUqa1IRV2+vLYgaLzonCQaPjWraFSz0Pmh/OaiekJtrAOaIlxi5JXOnDR35
 iypCzWDQhiIDb1h6WahO3NCWAFVm+NtKrwvyKatGZWGASqdmVMyI8W4UrOyvuaJ2+1da
 DnWEDzHODhJSN8lyrxDilximbYqQh5/nwVxjou+7nmkV+Uk7+7+Q5Y6OgazzEaTuG3ID
 PAeQ==
X-Gm-Message-State: AOJu0Yz3M2huPPvKwXPkKNANk0C7g6GiQi4SIbxB3slJMrDznaFv9/kR
 ylHZfYrwPYyTRzcuVlrihmFOHJlr5x4KwRn6QEN/UYOSFfn2vdYkR45Dc99DeI4pW0YKzwJWKAk
 =
X-Google-Smtp-Source: AGHT+IHtuzDG9J3AvSsXPl+LDhBqir5tDRLdDFJ6NPngQ8hMl8P6Nu+AEhJKyneAQQgkyOjDeML77g==
X-Received: by 2002:a17:902:f20a:b0:1f6:278b:4524 with SMTP id
 d9443c01a7336-1f6a5a6bd0emr9313335ad.54.1717547057593; 
 Tue, 04 Jun 2024 17:24:17 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jacobe Zang <jacobe.zang@wesion.com>, Nicolas Belin <nbelin@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/24] drm/panel: khadas-ts050: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:49 -0700
Message-ID: <20240604172305.v3.3.Ibed1026f20cab08c90fa376e68c2f23a343e826b@changeid>
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

Cc: Jacobe Zang <jacobe.zang@wesion.com>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

