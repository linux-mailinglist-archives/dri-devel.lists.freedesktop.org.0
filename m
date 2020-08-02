Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216C235680
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E016E11C;
	Sun,  2 Aug 2020 11:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663136E11C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c15so1710501lfi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLa8A78sb6TROKVgEP7FrftnrkZYsSBxAptywr3djFw=;
 b=gcpQNypZ1825ZP6yhZ/RYe6I8LcknsRrhPHEtktf746mhylmvfCBxAgXdiij1tXcwb
 8dvxgoXTcjasDmjd3IZWHhKWJhqM4VMl61+fgPQte+LrOLr6wbQGNrauRHwCptz0+dJT
 Pa62LpHi9j1UYPkubdjAqg3fyJJ9OkwkuuNDro5Zure4ByUGqXAwerXnz9/S99+MfmbZ
 W+jI5c/u+I4M1XdgP5OYR/GZzLES0SNblt7JjmbnXwL41Evvpu2QYKIac6IQmlHz8DDg
 hG6VrhwH7sSL1F0D4RsawBBJ59bxuG7OEhnPz+Nfh8UBvDvuNltYNULUBdgK2DTIu89o
 Qq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tLa8A78sb6TROKVgEP7FrftnrkZYsSBxAptywr3djFw=;
 b=SA3zQo/saBQZ0ZrEzo6iReK1PAnHjBGOXeXLPu2ToqXizHvXgQNCJVYljPT/H2Vdmg
 5MS/qym71F/zCBTP8pz0N8BL5eUb43xGmrBeBme/4shLoGo7cpiNadbJtvpLBz7Bm2Rm
 fY6UFcXswd1FNHsWnzp+eAOvu5fVoovmLhVMtcqjso9lIhG3DLVDAYGHuLS9kzMFbqiB
 mtWP+ROghVFHNpqSXAgUILanNM47BEv4FWywPYp4XctpK5JhuQcintkxFYvX7QHjrgvU
 fCOpaI8vi/K9PdHMe1gejPwz6on/sTem+a1VIoiIx7VYRLjryr+NkPUwlmsA9rzU1qJY
 Ad1Q==
X-Gm-Message-State: AOAM533sgZH6a2Ri+WlyShZhI8091pu4NSs2W8bSyWpWm4DsCxxeM+7l
 S6c1Gw1Fx7FFl0djmUeEK8USWUWWD/Q=
X-Google-Smtp-Source: ABdhPJwGioEG6bL91YZcovl6jWcWaj9jtQrKEVF1xLx0xDlWMacpwfVj4dkCbrb2NfRAOkd9JmYQjA==
X-Received: by 2002:ac2:5ec8:: with SMTP id d8mr5977588lfq.169.1596366460674; 
 Sun, 02 Aug 2020 04:07:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 21/22] drm/omap: display: Backlight update
Date: Sun,  2 Aug 2020 13:06:35 +0200
Message-Id: <20200802110636.1018743-22-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Zheng Bin <zhengbin13@huawei.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 35 ++++---------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 3484b5d4a91c..433e240896b3 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -110,15 +110,10 @@ static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
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
+	if (enable)
+		backlight_enable(backlight);
+	else
+		backlight_disable(backlight);
 
 	backlight_update_status(backlight);
 }
@@ -363,13 +358,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
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
 
@@ -390,17 +379,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
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
 
@@ -1305,9 +1284,7 @@ static int dsicm_probe(struct platform_device *pdev)
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
