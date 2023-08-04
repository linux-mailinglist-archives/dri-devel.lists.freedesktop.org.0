Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B30770A72
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6FA10E133;
	Fri,  4 Aug 2023 21:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF88110E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:19 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so1744051b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183239; x=1691788039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zs0Gv4Fg+9bXbPDS+x5MeuiOn4j7KTC6rQDcvADWb+8=;
 b=TFhIf+Y92Yutq1q3r5QXOVtSDF6+EmNeMvB5c54nDo5/RLID3p2uAWC+vf3ZkgRLgr
 5lVq8JsIHNr5sA1uIXxUjC0RY8/VDxXP02vT4SK9+Cx6ej0mEB22eYcCWFY8MFDlmbTm
 vgGaUnrtDEb268mi/DcLufyaS3DzHeChCP1/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183239; x=1691788039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zs0Gv4Fg+9bXbPDS+x5MeuiOn4j7KTC6rQDcvADWb+8=;
 b=ZQYPYuXIihaUMFUkJUSj/XrCSaBqo/+vf26Pgecyu+nAD/p9d12Q3AUFoq8/zo+avg
 8LFXhWqU94W2aAL2zR7STWeUwLczq05a45xSr7w0fP970neCXYAZYWyDfo/Qrnc1MSjq
 XEhWKa1fBtODCii/jR3y/8sbZyrq/yrvqwj+oXGjIPyz6M4m9YXOeXDNX29VfCut26er
 ZMU0HxYHdcZCzm6Ukp9FOYLtW/Zz+Aimtp93i2fK1Lzpcs8S3mI9Vek1esvus/dBFo5n
 f4pRXNKRLxkYcL5EcqggvTavvO4otk8s3jtA1KYBC3C3GMLNWIaGbsCqGMqtu5p6eC0K
 HVBA==
X-Gm-Message-State: AOJu0YyoeQIKrITABr5ACZciw5ll7SWJLuwUgZzNSy3wwBPiSIikPMd1
 lma6+kY9d7RMj/QoKbiU8CRKdKz9iEwVn+ulPpciwXd6
X-Google-Smtp-Source: AGHT+IH+1u2vz/+hPiEdDmFCaY5UcWnHhuoQ/4+7m/iN7gksQgGInNJt1xM7GfEqn1Jrxnt9mXGsqw==
X-Received: by 2002:a05:6a20:2587:b0:137:c971:6a0c with SMTP id
 k7-20020a056a20258700b00137c9716a0cmr852950pzd.31.1691183238826; 
 Fri, 04 Aug 2023 14:07:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 03/10] drm/panel: otm8009a: Don't double check
 prepared/enabled
Date: Fri,  4 Aug 2023 14:06:06 -0700
Message-ID: <20230804140605.RFC.3.I6a4a3c81c78acf5acdc2e5b5d936e19bf57ec07a@changeid>
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

For the "otm8009a" driver we fully remove the storing of the "enabled"
state and we remove the double-checking, but we still keep the storing
of the "prepared" state since the backlight code in the driver checks
it. This backlight code may not be perfectly safe since there doesn't
appear to be sufficient synchronization between the backlight driver
(which userspace can call into directly) and the code that's
unpreparing the panel. However, this lack of safety is not new and can
be addressed in a future patch.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
From quick inspection, I think the right way to handle the backlight
properly is:
1. Start calling backlight_get_brightness() instead of directly
   getting "bd->props.brightness" and bd->props.power. This should
   return 0 for a disabled (or blanked or powered off) backlight.
2. Cache the backlight level in "struct otm8009a"
3. If the backlight isn't changing compared to the cached value, make
   otm8009a_backlight_update_status() a no-op.
4. Remove the caching of the "prepared" value.

That should work and always be safe because we always enable/disable
the backlight in the panel's enable() and disable() functions. The
backlight core has proper locking in this case. A disabled backlight
will always return a level of 0 which will always make the backlight's
update_status a no-op when the panel is disabled and keep us from
trying to talk to the panel when it's off. Userspace can't directly
cause a backlight to be enabled/disabled, it can only affect the other
blanking modes.

 .../gpu/drm/panel/panel-orisetech-otm8009a.c    | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 898b892f1143..93183f30d7d6 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -70,7 +70,6 @@ struct otm8009a {
 	struct gpio_desc *reset_gpio;
 	struct regulator *supply;
 	bool prepared;
-	bool enabled;
 };
 
 static const struct drm_display_mode modes[] = {
@@ -267,9 +266,6 @@ static int otm8009a_disable(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->enabled)
-		return 0; /* This is not an issue so we return 0 here */
-
 	backlight_disable(ctx->bl_dev);
 
 	ret = mipi_dsi_dcs_set_display_off(dsi);
@@ -282,8 +278,6 @@ static int otm8009a_disable(struct drm_panel *panel)
 
 	msleep(120);
 
-	ctx->enabled = false;
-
 	return 0;
 }
 
@@ -291,9 +285,6 @@ static int otm8009a_unprepare(struct drm_panel *panel)
 {
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	if (ctx->reset_gpio) {
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		msleep(20);
@@ -311,9 +302,6 @@ static int otm8009a_prepare(struct drm_panel *panel)
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = regulator_enable(ctx->supply);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to enable supply: %d\n", ret);
@@ -341,13 +329,8 @@ static int otm8009a_enable(struct drm_panel *panel)
 {
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 
-	if (ctx->enabled)
-		return 0;
-
 	backlight_enable(ctx->bl_dev);
 
-	ctx->enabled = true;
-
 	return 0;
 }
 
-- 
2.41.0.585.gd2178a4bd4-goog

