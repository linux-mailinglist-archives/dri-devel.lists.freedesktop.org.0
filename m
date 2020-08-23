Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A409C24ECD5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7E589E5A;
	Sun, 23 Aug 2020 10:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4789E5A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v9so6452746ljk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMwPo9+hRO7oQL+93/x+I1LlDVHjud/UjckxUZ0BGv4=;
 b=Xae7aSPx0pl6ZRpM7cpzpmzC5ZtR3hgHEiGzAtqSyIWS1VYH7XuMp/nMpQqJnCiDrD
 BJjCXLlzXYm2NO4PEarNp5sCtemqFIX3z2s5DFQ16HM3sycON3vKBgNdzVJVVlwunuFR
 xZwTqdlkpyfKaY8gT4cUMXmNzcNNKD7qT7ExFDPpwi2HXyDrSq7gUmeBpba0Sj8fRTZS
 8hZMkM2zq8iK8dGNIkJ/5c/+VptPh2ATtliZJ6Em8rUkQFhf3Oab61REEoUrpY0Li/xB
 n1QmY18edm/pDzNosGl0n3MJWxoGRw7FZdjKVv2mkZi4EeQrZ685+OWYG7DVDGeCTjIu
 VnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZMwPo9+hRO7oQL+93/x+I1LlDVHjud/UjckxUZ0BGv4=;
 b=H1L+tJIa/DFygOCos7Yyqhu/rWZg128MATyLiHTrMiOITklrOmWUU0sFcdMXxazku/
 tw5fSLtgwLMR3nANvxq5PmslVamrkqrqhTURegci69Mz19Op7F3c7IFCMkRAv/GhMKom
 BUsyO8HvipX2UdTwvMjwtg6GR/GYtGDZebi6+HN8qnH4JDCCjhpWW59VnyimZIlbMKlp
 WIW2hCDRcRT/OkxAeVelc/s2n68TtMOTVNRyd8AL7YpDWLuqDPODxDV6DnraPUq1NHJE
 KpxdL6B3cXR6W5lYHucqTEE5E7HHU86612jDR/So8nZjSB8hyXWaQkfsxi91g3nn8ypk
 Ie4Q==
X-Gm-Message-State: AOAM532y728+6b5/S9dvKEVDZEqt6CbLTWXR2bZaQP2O+D9OAl9Iz9IB
 oLtgW/myjPRSOkQqDXEkWkhDMM7/SE5T4A==
X-Google-Smtp-Source: ABdhPJw1LKNEImPCVBOA82i4UqJGro+ciuWODHdT0OvtGuUxbP/oFooR+7QmF3xEnFcZKwASePDbiw==
X-Received: by 2002:a2e:b6c3:: with SMTP id m3mr455738ljo.450.1598179582921;
 Sun, 23 Aug 2020 03:46:22 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 23/24] drm/omap: display: Backlight update
Date: Sun, 23 Aug 2020 12:45:31 +0200
Message-Id: <20200823104532.1024798-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Zheng Bin <zhengbin13@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Introduce backlight_{enable/disable)
- Use get/set methods for backlight_properties
- Drop redundant get_brightness() implementation
  The default implementation return the current brightness value
- Use macro for backlight initialization

v2:
  - Drop backlight_update() call as it is redundant (Sebastian)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Zheng Bin <zhengbin13@huawei.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 37 +++----------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 3484b5d4a91c..39b3a7affbc8 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -110,17 +110,10 @@ static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
 	else
 		return;
 
-	if (enable) {
-		backlight->props.fb_blank = FB_BLANK_UNBLANK;
-		backlight->props.state = ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
-		backlight->props.power = FB_BLANK_UNBLANK;
-	} else {
-		backlight->props.fb_blank = FB_BLANK_NORMAL;
-		backlight->props.power = FB_BLANK_POWERDOWN;
-		backlight->props.state |= BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
-	}
-
-	backlight_update_status(backlight);
+	if (enable)
+		backlight_enable(backlight);
+	else
+		backlight_disable(backlight);
 }
 
 static void hw_guard_start(struct panel_drv_data *ddata, int guard_msec)
@@ -363,13 +356,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
 	struct omap_dss_device *src = ddata->src;
 	int r = 0;
-	int level;
-
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
+	int level = backlight_get_brightness(dev);
 
 	dev_dbg(&ddata->pdev->dev, "update brightness to %d\n", level);
 
@@ -390,17 +377,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	return r;
 }
 
-static int dsicm_bl_get_intensity(struct backlight_device *dev)
-{
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		return dev->props.brightness;
-
-	return 0;
-}
-
 static const struct backlight_ops dsicm_bl_ops = {
-	.get_brightness = dsicm_bl_get_intensity,
 	.update_status  = dsicm_bl_update_status,
 };
 
@@ -1305,9 +1282,7 @@ static int dsicm_probe(struct platform_device *pdev)
 	dsicm_hw_reset(ddata);
 
 	if (ddata->use_dsi_backlight) {
-		struct backlight_properties props = { 0 };
-		props.max_brightness = 255;
-		props.type = BACKLIGHT_RAW;
+		DECLARE_BACKLIGHT_INIT_RAW(props, 0, 255);
 
 		bldev = devm_backlight_device_register(dev, dev_name(dev),
 			dev, ddata, &dsicm_bl_ops, &props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
