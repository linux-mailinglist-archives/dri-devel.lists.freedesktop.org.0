Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717024ECD9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA696E4AB;
	Sun, 23 Aug 2020 10:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A1F6E49B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k10so8595lfm.5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5z9EEWBMFtfs7Md+ywwIsrQgvnrHejoYJr9Mbg3PvTc=;
 b=WCAQKgapZnnQkA/k40lPgjGyohpPlP6wFQys0N2YxdBPrGFP9dHIgX6Fi44md6BhgD
 fzjLo13IiaU9traVwTOKlGGmWAUufirsp8RMy/+OCTiYx6YwWDDRUFly5d6yvvFgtSff
 wEnykuMQq7OKa7t8aCK2yp1/uw+GM3tlw1UpxZD+8ORTMILoenU79Jd5jZxvwOulyR5e
 ou6Z5HCGq7oGmBp89t7BnaDpFb1jHdOVwYtjKCB8xx6Im+6jXer4gSy3yL8MW85FjtTv
 adBpOdY6HPG+goWOnosh5blW7fz4zKgG9gMOM+Lhlnh6qxgZix7KTXKqrGyYc9VrMlnU
 hDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5z9EEWBMFtfs7Md+ywwIsrQgvnrHejoYJr9Mbg3PvTc=;
 b=CIuwPQQwL6v84MoqyLeJYAEQlS8wNxOGAWMk6AOoBJPdgmXb/KFKUo8Sl1TAxPYhKf
 nbJEwGfyLCZyPOmdwlzUc1VtRQn+fuFWbtbtIJ0zXIWVRKjXbZ4ev7m5E1z+rCq0zIMM
 zL9JAy1i4blU4nmj6EoWv8biATH9/rQE2N5w1csYYSHYXf6c2Vd7LLqCptjCfCGVGrGK
 el6Hu5FtbN0QWBSGmyUP9nlEdhDWYOLmmEE2ohPSUQuIi+W7r1w1OlZBIIXL+LytBEJ1
 ++BISIc7tONDgF4dk3aLHrjcvuikTX2sOuEFgxcawZaoimkjYeUEb7xf2wDZm6xDOZin
 nanQ==
X-Gm-Message-State: AOAM53169TEu0ENR7oYVfwTUlHxNbUhFeoWpbbBQK5Futf+BbpMhta6G
 swVw3gY9W+TYKxL3SNi0jjmFvk7tFTY5ng==
X-Google-Smtp-Source: ABdhPJyIFCWFqNvR9uTAE6OpxRDcC4pujWywA7XpGsvCrjncmdzyPOZQeKurGVSESFRzY6zO3QJxVg==
X-Received: by 2002:a05:6512:687:: with SMTP id t7mr419744lfe.13.1598179576978; 
 Sun, 23 Aug 2020 03:46:16 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:16 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 19/24] drm/tilcdc: Backlight update
Date: Sun, 23 Aug 2020 12:45:27 +0200
Message-Id: <20200823104532.1024798-20-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce backlight_{enable,disable} to enable/disable backlight.
Dropped NULL check as backlight_{enable,disable} handles this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 12823d60c4e8..b6dd0a21fd0f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -47,11 +47,10 @@ static void panel_encoder_dpms(struct drm_encoder *encoder, int mode)
 	struct backlight_device *backlight = panel_encoder->mod->backlight;
 	struct gpio_desc *gpio = panel_encoder->mod->enable_gpio;
 
-	if (backlight) {
-		backlight->props.power = mode == DRM_MODE_DPMS_ON ?
-					 FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-		backlight_update_status(backlight);
-	}
+	if (mode == DRM_MODE_DPMS_ON)
+		backlight_enable(backlight);
+	else
+		backlight_disable(backlight);
 
 	if (gpio)
 		gpiod_set_value_cansleep(gpio,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
