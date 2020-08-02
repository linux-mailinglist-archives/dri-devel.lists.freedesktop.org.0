Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C31235670
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179F6E0E9;
	Sun,  2 Aug 2020 11:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730276E0ED
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c15so1710328lfi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lWhA0BYbPCSLHXU1/4K+CyGmerfjzXfaP8MVDvqeBE=;
 b=YdA1+aWHd7oo893uzF+6y5DZOipGeuuS1N4ZGlYPIa7I2zhASGfY8JrZTrTmlKaJ0P
 qHkR/5Mjt8ZXAD3jLAbbNQSTCWryEXG1F2w04BO2NQ7wTl4lHOzWRQi2L0E+20xWmugI
 iPamWd53++zc5JNFfkKjJcEjXt+EqhsAzZm31u8Gnp/Ynj+GZ29Eyupb0/g7uJKQ2sUi
 CdT92WSaoVlatEPV3XEkhxDS1LOieLBoDjs8g9yjDqPysYNpqb1tSZnRoekXQI40tMaH
 riTX5Q3fhJVwZ1V1r9TNpatV5K+CF7KcCQbJkyTE/gdNHoxFtdDCePa8QWYbB0Q6NkMw
 tiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7lWhA0BYbPCSLHXU1/4K+CyGmerfjzXfaP8MVDvqeBE=;
 b=sH5Nu6qpNtVGfWc6Puz1z7bQ8Cf/KOtXeRlHIg5FB9iyFu35wJQoc+lTQLOQCRJnmk
 Sgse1EiXJs76HvRABnJlIfkNI0lD3qCZzbG2fLiheC1wW4IvpqXUEoa6mF8DICFTJAna
 YVibtcAfn1axCKo4HtychmQCstkvMJHVe3HJeVFK0Hs7Php/Jc6UCFX5WdtxZgW84cSn
 3fdS2l5CV+rpazzmJv9fNhhWNwIZB1+baCJUd9Yb0cmGwgyK8i7ugBYQjH29VZ4Ge/NA
 Z98eFqaAYRzCnX/FxoG79X9U8jT2UB4IsuNUL7Tw5WusmZJROB6ymAqeJFzJZYwn7Yji
 6FcQ==
X-Gm-Message-State: AOAM531wVfdQ2wkuhG9Ffd8csTA8oqI4pz5P0nwIEth264xS2CVVEmAf
 sG4v0xLomfEdi9cRWJXkS0O2u1Mq7hM=
X-Google-Smtp-Source: ABdhPJxOlInI8cX6+yRDnqsTTHicJthQoyUDaj8eXMrR806AnvC4sr/eTM0bWCJANqQXKr+DJskfqA==
X-Received: by 2002:a05:6512:3317:: with SMTP id
 k23mr6011184lfe.111.1596366442728; 
 Sun, 02 Aug 2020 04:07:22 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 08/22] drm/panel: novatek-nt35510: Backlight update
Date: Sun,  2 Aug 2020 13:06:22 +0200
Message-Id: <20200802110636.1018743-9-sam@ravnborg.org>
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
