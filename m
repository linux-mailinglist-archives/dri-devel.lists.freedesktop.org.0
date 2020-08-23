Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD324ECDC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0B76E4C4;
	Sun, 23 Aug 2020 10:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD76E4A5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c8so2975647lfh.9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maHW2e0NnSMYHIlzXCYVNcTAjo21ZJ2pCny7UdG3764=;
 b=qVR+DxwbTbdo7zSxkLnOKKJP3WVmMRtNXzpr2JK25TNbE8mfyyzQv+1qOXFWIDp9U7
 cfGyMAjYd5seTu+DaRuJrd5Haay6LG7WzQyHnzfmS4olfRh9gAdZLy31mxWqjH7fjBr0
 2LFMafMCxUDdKu13KQSCnRFISOe29Vsye0CjDX0MeZyN9LSnjCz+qS7ZyfTE10SLh0At
 fdMU3mejmx5GuE84d/pPUYr8SwFUlibvymk8uxEP5Se4q75BoXt0J3AA3tp7X88zdvZ0
 mpBS8VmceHCcPj+9aJCd9C3gDK5X3qZPkHzuS4m66CIOIHJsnMbojj8uNhX3CYy7pqKv
 k1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=maHW2e0NnSMYHIlzXCYVNcTAjo21ZJ2pCny7UdG3764=;
 b=aIEf8xFhrVt/ff/ijmd61S7TSDCEzlyAkPNFsC5dqqVGAqEFXZSJYMxdXvxIIFU6I0
 j4nVnB5a1+BPJG08T2Ciiww77FAJxrsjKlAmqCHOOdaMz79TykW7eOkytLj035qatXhF
 vlUzMLBZm8k8h0J+7IfDZGkMhj4DbulTIvftRFuko3pndsmvXtC+FIYlCYAd5aaB2Oqo
 360cMOP1wIoV3+08WwHUHns4i9z7VkaHsEssn5eSe0iTOcDTi7UCDPg3xQs1juomFin6
 eLY67COCYK8DkPT89yeeVQXEfPo6TuO32XFsiDBSij2VFqzQVNG6zXNuGY6NFEfuBg9h
 8WUw==
X-Gm-Message-State: AOAM5325yuPSbrearIdrjOir+4JV06WD+bkikkaLraNyVEyVcvnlVG4k
 hTDwuWCOCN76Q6TMqHTlXpxUBwbUHiev7Q==
X-Google-Smtp-Source: ABdhPJySOxJ+7w28VYMGADIsFaVdl8XLmsvAVmzJ1O50Mp4wyyF+k3updmNtH/tVEiHBybHQbJ+kCg==
X-Received: by 2002:a19:4f5d:: with SMTP id a29mr420642lfk.107.1598179567438; 
 Sun, 23 Aug 2020 03:46:07 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:07 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 12/24] drm/panel: raydium-rm67191: Backlight update
Date: Sun, 23 Aug 2020 12:45:20 +0200
Message-Id: <20200823104532.1024798-13-sam@ravnborg.org>
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
Cc: Robert Chiras <robert.chiras@nxp.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Replace direct access to backlight_properties with
  backlight_get_brightness().
- Use macro for initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 313637d53d28..5553db385dd5 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -479,7 +479,7 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
 	if (ret < 0)
 		return ret;
 
-	bl->props.brightness = brightness;
+	backlight_set_brightness(bl, brightness);
 
 	return brightness & 0xff;
 }
@@ -495,7 +495,7 @@ static int rad_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, backlight_get_brightness(bl));
 	if (ret < 0)
 		return ret;
 
@@ -539,10 +539,10 @@ static int rad_init_regulators(struct rad_panel *rad)
 
 static int rad_panel_probe(struct mipi_dsi_device *dsi)
 {
+	DECLARE_BACKLIGHT_INIT_RAW(bl_props, 255, 255);
 	struct device *dev = &dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct rad_panel *panel;
-	struct backlight_properties bl_props;
 	int ret;
 	u32 video_mode;
 
@@ -588,11 +588,6 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(panel->reset))
 		return PTR_ERR(panel->reset);
 
-	memset(&bl_props, 0, sizeof(bl_props));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.brightness = 255;
-	bl_props.max_brightness = 255;
-
 	panel->backlight = devm_backlight_device_register(dev, dev_name(dev),
 							  dev, dsi, &rad_bl_ops,
 							  &bl_props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
