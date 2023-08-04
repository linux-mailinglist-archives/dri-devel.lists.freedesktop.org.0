Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB041770A70
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083410E135;
	Fri,  4 Aug 2023 21:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F2710E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:17 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686f38692b3so2418395b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183237; x=1691788037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+K4pAadzRZN083YWndwfDzadQIgjy+stzVGii5iIJGU=;
 b=T1UYVJsN721ozkISMV86q9Yazgfhma0y3bUeJgLTkokFM2FXoQfsXSElONE+8QorfW
 6KJCMyYa6HwgGob86Pamhm3mAAKLOuEG/C24hVShpaprAQaj9ga275WVxyVBsuNTp4Xq
 4YsIw1eOx9vVerNFIlXmAaIu6WLUGVO5/Ovsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183237; x=1691788037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+K4pAadzRZN083YWndwfDzadQIgjy+stzVGii5iIJGU=;
 b=XOgz9Xdffhx7hoisX7Jx88rLOXru2lg66QvORvw+3BLiTc/B1UPJcY8HsQouPW4Osk
 4lw4dCavgoVicuaiOAcIDf/OjNaX7E3MhC4UujuTBfQdFoR0xJ2AfefpPaxu0ly1VMfc
 ZEEbFDc8+H+wVPzsqc2DmFXxL33zrNPqqrKZnYE5wMyQhr7k2Dt302glbSFKq2x0M/mK
 gQGdMQ6CMB/KT1uO3broVrIzvMh24NvIuTNSSWNgFYL/4rnYymc01t1Hd/pUab2Nwyjv
 ok1dGXlJyHPIRCwF5vyYzX48nbxU/E7hKu/41NYaIW6MfLoPcNNjmNsWkiB2UBEHB74k
 68nQ==
X-Gm-Message-State: AOJu0YwSd3/XZUVe3I1tpU0Pz/KnOb4F7iGrFs5PFraWJDkWYGJt13F6
 9Kb7w6cSfmQSjD+ZcQVOZAmEbC6DKPGAvtMiRrxaTAuq
X-Google-Smtp-Source: AGHT+IGmH6I8v9mGTkjyzHcFPAzmzyunDSLA0TNtyofGKN5WngoOgQ9qT4q8whBF8qocjpEoAnGaUA==
X-Received: by 2002:a05:6a21:7189:b0:133:f860:ac42 with SMTP id
 wq9-20020a056a21718900b00133f860ac42mr3100626pzb.34.1691183236984; 
 Fri, 04 Aug 2023 14:07:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 02/10] drm/panel: s6e63m0: Don't store+check
 prepared/enabled
Date: Fri,  4 Aug 2023 14:06:05 -0700
Message-ID: <20230804140605.RFC.2.Iabafd062e70f6b6b554cf23eeb75f57a80f7e985@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
References: <20230804210644.1862287-1-dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

For the s6e63m0 panel driver, this actually fixes a subtle/minor error
handling bug in s6e63m0_prepare(). In one error case s6e63m0_prepare()
called s6e63m0_unprepare() directly if there was an error. This call
to s6e63m0_unprepare() would have been a no-op since ctx->prepared
wasn't set yet.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index b34fa4d5de07..a0e5698275a5 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -270,9 +270,6 @@ struct s6e63m0 {
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
 
-	bool prepared;
-	bool enabled;
-
 	/*
 	 * This field is tested by functions directly accessing bus before
 	 * transfer, transfer is skipped if it is set. In case of transfer
@@ -502,9 +499,6 @@ static int s6e63m0_disable(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 
-	if (!ctx->enabled)
-		return 0;
-
 	backlight_disable(ctx->bl_dev);
 
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_OFF);
@@ -512,8 +506,6 @@ static int s6e63m0_disable(struct drm_panel *panel)
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(120);
 
-	ctx->enabled = false;
-
 	return 0;
 }
 
@@ -522,17 +514,12 @@ static int s6e63m0_unprepare(struct drm_panel *panel)
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	s6e63m0_clear_error(ctx);
 
 	ret = s6e63m0_power_off(ctx);
 	if (ret < 0)
 		return ret;
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -541,9 +528,6 @@ static int s6e63m0_prepare(struct drm_panel *panel)
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = s6e63m0_power_on(ctx);
 	if (ret < 0)
 		return ret;
@@ -564,8 +548,6 @@ static int s6e63m0_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		s6e63m0_unprepare(panel);
 
-	ctx->prepared = true;
-
 	return ret;
 }
 
@@ -573,9 +555,6 @@ static int s6e63m0_enable(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 
-	if (ctx->enabled)
-		return 0;
-
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(120);
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);
@@ -588,8 +567,6 @@ static int s6e63m0_enable(struct drm_panel *panel)
 
 	backlight_enable(ctx->bl_dev);
 
-	ctx->enabled = true;
-
 	return 0;
 }
 
@@ -709,8 +686,6 @@ int s6e63m0_probe(struct device *dev, void *trsp,
 	dev_set_drvdata(dev, ctx);
 
 	ctx->dev = dev;
-	ctx->enabled = false;
-	ctx->prepared = false;
 
 	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
 	if (ret)
-- 
2.41.0.585.gd2178a4bd4-goog

