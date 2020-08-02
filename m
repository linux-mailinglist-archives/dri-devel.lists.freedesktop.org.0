Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7923235679
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6AC6E108;
	Sun,  2 Aug 2020 11:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EF56E109
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d2so13392052lfj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOpqIuXztzV2VxaUZM3TAemn8wfiJu1vOSF9YDMwzxQ=;
 b=qVFbDFmV4gDLtTgps+jjDfdPTqaTH7lxU8b81DJ/L+i7lvcLae7IOKouR5PQPvAKcR
 t6/I2wjNJMu8K9wX5JG6zary9JswN2z/pgoVSpkOF4OQRFnEg18kl2+EerRh323+d4ch
 vRdDR86aMXNOAhK++DlB8c6A0p8oy53ZG+OGX7OepoWHRgm3JjA3wNMI17JMiKBTzFZ5
 YR6LWwy6gYLtKgQQdVQk5bfxWFl0jxCAcdZFy6RNlpplew4z4E8XnMgjFzptASWuEcA8
 lOiYVp2qyTWJY6EcyFWN5LzvDa/zhm2noOOtQVGdqUo8ctPfzF9sJV7kyRXz1Z/wPAEh
 XX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yOpqIuXztzV2VxaUZM3TAemn8wfiJu1vOSF9YDMwzxQ=;
 b=d5Xg4Jg0HBuUYAxuLqU4zGGxsTlpepENagmrzrhcTFRdBVhV/MbdAhZwW2HXIPas94
 ktYBeUNvzBdo6FTm7FbPD6f1k2ISyOsewfA8kU6yqsxzsgbFfYatyN1HmQZK400Vv590
 l46CwFOKcdfffIABZmwRpYgBuyBPGeOVQePLNkJ/1Vd9VAeiX4g69WiCRDZ4nqGoEcj/
 W7Rsu4um6MeNyPl401MzCUncfMoiCDAjjZ/j792PTGgT8f7vjFQ0dUKdaGSoirxhTRjp
 q+G28r6Ie9XwNAPvWVbxuZQ6f4RSL+x8rk+MKKjr1icGeKiC+lPCHgwMyljmDalzPUvh
 /miA==
X-Gm-Message-State: AOAM530I7vP6seIb+Wh89fib1XXM9TRPUjuuSTtXL5yKby1GXKtK1v1l
 DnU4jeTK89xOtCSHHrrLcrYelgLkdVY=
X-Google-Smtp-Source: ABdhPJwPagmwDczztLp0cdJowNmxZopqtGfRJddZy5nANizDVEXuMs8QyTQpIenj9lt/LVmwfH2qyw==
X-Received: by 2002:a05:6512:3138:: with SMTP id
 p24mr6119282lfd.143.1596366454826; 
 Sun, 02 Aug 2020 04:07:34 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 17/22] drm/tilcdc: Backlight update
Date: Sun,  2 Aug 2020 13:06:31 +0200
Message-Id: <20200802110636.1018743-18-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid using direct access to backlight_properties by introducing
set methods for power.

Dropped extra check as both set methods and backlight_update_status()
both accepts a NULL backlight device.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 12823d60c4e8..54824999720b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -47,11 +47,12 @@ static void panel_encoder_dpms(struct drm_encoder *encoder, int mode)
 	struct backlight_device *backlight = panel_encoder->mod->backlight;
 	struct gpio_desc *gpio = panel_encoder->mod->enable_gpio;
 
-	if (backlight) {
-		backlight->props.power = mode == DRM_MODE_DPMS_ON ?
-					 FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-		backlight_update_status(backlight);
-	}
+	if (pmode == DRM_MODE_DPMS_O)
+		backlight_set_power_on(backlight);
+	else
+		backlight_set_power_off(backlight);
+
+	backlight_update_status(backlight);
 
 	if (gpio)
 		gpiod_set_value_cansleep(gpio,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
