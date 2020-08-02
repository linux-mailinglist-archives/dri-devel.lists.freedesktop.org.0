Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E67235675
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECAE6E0FC;
	Sun,  2 Aug 2020 11:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FBD6E0F5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t23so13223459ljc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLGfPCSGFzX1pfjLnt4+4gCxp0y0iHIPZ/xyetvHNEI=;
 b=fkFQcpqsUIJWzziJajDk7wSX4nUaaSj0bqXqtc9LeULjE01vqHFaTiLBCQ/FLouThR
 nkype2yYBuPCpl/YCImE2SWGJwi5+xV20q12S4rD+GcqPXwdFzkqKtzHFLnP8UqGn5yR
 6MG32nAHwsnxDSO3fdskOMPjO/+4WDPWqvsFxobti7DGwhli3Itd+vtdDVkNODvO3Kwx
 1nXJHK2NFTyFQwqx78PQD7/L2nJiGDXg+YVUI0+tU4kES2HW//bZeDgUuxM9KOdKs2Z6
 RGUhjWAHNYKI3/5V38wQtf5KQ+tXRJCnFH72l3icFPE3k9C+64egZmTZQoztM38MUK2Y
 BPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yLGfPCSGFzX1pfjLnt4+4gCxp0y0iHIPZ/xyetvHNEI=;
 b=a4eJoI3ZBul5K6Mv/+REJz264Q+sQIu8hATBhnaDXdvWVEJYj+y3LZfZCHKwpqxNEA
 UQU5rUSJHyg5Vex3Ts4ZE8SxgTurfsl2SrYZ4wIj+0EmlbPPPQs7McPRb13Zs9hPDOdF
 RVex4fhaXpbBVHAJC66qMtsz5xBarGo75FAN5cUYJCHCtGesM4oxIGzJ1AUaTn34Fm8/
 hRL+iUN2iLGmKYfeQJh+EDcvSfQF1zxqIKaCiw8KWVe15nZz0dVZv+SxFtXimy7u8zKJ
 xT9l2Gjzf4USwOAF31or7t07dZ/YerpBGkkJ5Z1ErXp5UC5T86a25t30XWtXQ/Vd3uaz
 H2ZQ==
X-Gm-Message-State: AOAM532SfILeN8AQN5rK3EzYnzo/Z+Hq7RGOceVOP+mgvLJgzI5xvaPv
 dknsCk8ai26aTt78by6GOk4SLVOOpDw=
X-Google-Smtp-Source: ABdhPJzxi7fz52DERq/CMav6EPIMsEQsGo8HcVr2O12zysf4L554P54JOjLZOM9aaLealJ1lYQkXgw==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr5696050ljr.443.1596366450595; 
 Sun, 02 Aug 2020 04:07:30 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 14/22] drm/panel: sony-acx424akp: Backlight update
Date: Sun,  2 Aug 2020 13:06:28 +0200
Message-Id: <20200802110636.1018743-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use get method to read brightness
- Use drm_panel support for backlight
  - This drops enable/disable operations as they are no longer needed.
    The enable/disable operations had some backlight related comments
    that are no longer valid. The only correct way to enable/disable
    backlight is using the backlight enable/disable helpers.
- Use macro for backlight initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sony-acx424akp.c | 49 ++++----------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
index c91e55b2d7a3..ce9ae8f1f5d7 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
@@ -99,7 +99,7 @@ static int acx424akp_set_brightness(struct backlight_device *bl)
 	struct acx424akp *acx = bl_get_data(bl);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
 	int period_ns = 1023;
-	int duty_ns = bl->props.brightness;
+	int duty_ns = backlight_get_brightness(bl);
 	u8 pwm_ratio;
 	u8 pwm_div;
 	u8 par;
@@ -332,8 +332,6 @@ static int acx424akp_prepare(struct drm_panel *panel)
 		}
 	}
 
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err_power_off:
@@ -376,34 +374,6 @@ static int acx424akp_unprepare(struct drm_panel *panel)
 	msleep(85);
 
 	acx424akp_power_off(acx);
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
-
-	return 0;
-}
-
-static int acx424akp_enable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_enable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_UNBLANK;
-
-	return 0;
-}
-
-static int acx424akp_disable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_disable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 }
 
@@ -435,18 +405,18 @@ static int acx424akp_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs acx424akp_drm_funcs = {
-	.disable = acx424akp_disable,
 	.unprepare = acx424akp_unprepare,
 	.prepare = acx424akp_prepare,
-	.enable = acx424akp_enable,
 	.get_modes = acx424akp_get_modes,
 };
 
 static int acx424akp_probe(struct mipi_dsi_device *dsi)
 {
+	struct backlight_device *bd;
 	struct device *dev = &dsi->dev;
 	struct acx424akp *acx;
 	int ret;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 512, 1023);
 
 	acx = devm_kzalloc(dev, sizeof(struct acx424akp), GFP_KERNEL);
 	if (!acx)
@@ -496,15 +466,14 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&acx->panel, dev, &acx424akp_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-	acx->bl = devm_backlight_device_register(dev, "acx424akp", dev, acx,
-						 &acx424akp_bl_ops, NULL);
-	if (IS_ERR(acx->bl)) {
+	bd = devm_backlight_device_register(dev, "acx424akp", dev, acx,
+					    &acx424akp_bl_ops, &props);
+	if (IS_ERR(bd)) {
 		DRM_DEV_ERROR(dev, "failed to register backlight device\n");
-		return PTR_ERR(acx->bl);
+		return PTR_ERR(bd);
 	}
-	acx->bl->props.max_brightness = 1023;
-	acx->bl->props.brightness = 512;
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
+
+	acx->panel.backlight = bd;
 
 	ret = drm_panel_add(&acx->panel);
 	if (ret < 0)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
