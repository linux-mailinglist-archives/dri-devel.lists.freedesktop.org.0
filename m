Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0E24ECD3
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5856E4BA;
	Sun, 23 Aug 2020 10:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711696E4A2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f26so6430842ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lWhA0BYbPCSLHXU1/4K+CyGmerfjzXfaP8MVDvqeBE=;
 b=lVmKX6xInmUbmU2AWmtGLOMZW0ujNTCEYxhdlWCaobw/U8i7o6AxjleoDkaGd95J90
 I+BYeVEySTUAuGEwTPmCaSJgjzWoA8f6QPTNi3QqfFr+Ts561guyTqr2k/OEZC6dA8Xe
 MF63v66UmCMDmGYrB8M9nIhj1js/CRPksJ62yuDeG4rPA7/jp5FshEz6ni+VTLQ+dhla
 +03M+raqQG/NIlKFmoT45SqDW5XckoMGx9eVEUopslEsE+7ZCK1gxUuX9Mnu8bLwoVwI
 Bv9+SEwTnzD6/UuoYTTCha7iKSO/J5BXW9DsIOJPH0BGcc1xB5CkewxOpC0/un4n+JUm
 g5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7lWhA0BYbPCSLHXU1/4K+CyGmerfjzXfaP8MVDvqeBE=;
 b=bu7lbyXsD7Mj7U6vCPOKhymN8VYFStF8ZKp7JunimBaBp0wFrIpgGYAoaXwRBwUu9Y
 cD4UMvsE2KvEhkDjZ6pTUf1GRAQPJmwNQkudYiqlH/R/sg80DoGTxWbfsHMZd3MEjTT+
 Evg/ak4QFD/ZJCyK9n+GwCp69L7Kuz6WgYV+mt6Racv182at3CSdOevGW/JBD2onxeKX
 nLYidZ06byQBYIE6TajyA9PNzGOvTcu3qssWCqzMHRF0ElRjrJu46v0gF75MA2TDqU7r
 sBiGjd7ABtxXXsNi4d0lSflw5aED5Es0ELmyno9/RGQdheK76o0cT83R2Gm3AwfklZHx
 psFw==
X-Gm-Message-State: AOAM5313FvlmLRDZpcurbgSxbQm9DH1nIj+VU3lKmqVoTvIqxrTv4Sge
 y60zVGztRSuCx0SyszlmzGfslYVPZOLLug==
X-Google-Smtp-Source: ABdhPJwg1brrxjpNESG1fQGbFoD+LVBGn8t93D1s5RCtW1PPt9ivoEAQtEaBcUJpKpCxqxiHjWiI3g==
X-Received: by 2002:a05:651c:294:: with SMTP id b20mr421482ljo.4.1598179564700; 
 Sun, 23 Aug 2020 03:46:04 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 10/24] drm/panel: novatek-nt35510: Backlight update
Date: Sun, 23 Aug 2020 12:45:18 +0200
Message-Id: <20200823104532.1024798-11-sam@ravnborg.org>
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
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Replace direct access to backlight_properties with
  backlight_get_brightness().
- Drop debug printout
- Use macro for initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 4a8fa908a2cf..ee4919a27480 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -654,10 +654,9 @@ static int nt35510_set_brightness(struct backlight_device *bl)
 {
 	struct nt35510 *nt = bl_get_data(bl);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	u8 brightness = bl->props.brightness;
+	u8 brightness = backlight_get_brightness(bl);
 	int ret;
 
-	DRM_DEV_DEBUG(nt->dev, "set brightness %d\n", brightness);
 	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
 				 &brightness,
 				 sizeof(brightness));
@@ -943,16 +942,14 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	}
 	if (!nt->panel.backlight) {
 		struct backlight_device *bl;
+		DECLARE_BACKLIGHT_INIT_RAW(props, 255, 255);
 
 		bl = devm_backlight_device_register(dev, "nt35510", dev, nt,
-						    &nt35510_bl_ops, NULL);
+						    &nt35510_bl_ops, &props);
 		if (IS_ERR(bl)) {
 			DRM_DEV_ERROR(dev, "failed to register backlight device\n");
 			return PTR_ERR(bl);
 		}
-		bl->props.max_brightness = 255;
-		bl->props.brightness = 255;
-		bl->props.power = FB_BLANK_POWERDOWN;
 		nt->panel.backlight = bl;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
