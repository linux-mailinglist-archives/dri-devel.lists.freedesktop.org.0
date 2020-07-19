Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0032250B7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2826E4F8;
	Sun, 19 Jul 2020 08:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FF76E4F1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h19so16992731ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuNmp2Y8twclxYeBZp9lqPlgdVdohaDn7/kP95qzQpY=;
 b=dt0gJHZiY7ngqE3Aru5QIDfzR/4WGSTSyw/onfx1owTURKpd8/LZItKX/EmdKaKww6
 hEY+0zYkVbTNplOGw96iVnVRNjbZWHPDFljhBoUh92L+g8R3zKPSCXN/FlSrE0ZrMQjL
 flVgCJgIHMHSllEEwnLlNoj5rphgeaU/JtmSmf30aDPkRG1UsPQDIXC5AHtRe/ec4dgi
 6j8DGlmB4suQ+Zb6MIlniulvpsxURfSw431sQ8R77cVRxVq/hvOa/CPcLxEbVGpJSnNN
 Ig5KaCsrzH4eiJ7xwYAcyxRQC0geH0KiJ9u8rcjpokzamfO3VgZqFfy0nuIwC3Ivi/aK
 KGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cuNmp2Y8twclxYeBZp9lqPlgdVdohaDn7/kP95qzQpY=;
 b=JU4T/gvuUMG+dJL7wBZkviUqV2iNbGMdlUnUaCLpC5mJLMHiPSEVNWNCGsPREtS9tQ
 ITzNYPBWn5k9Ew1GLTrXL5cxHr7e8zpl0nnTSqLjl/TcKRxPJ5VRlFepRjyUdF9ak64e
 qWRlEYWAmytUSF79rhr5pYUZkgHek83dXvWvVXc/FRuxm1niaQoHaKur2aiwIu8NDvU9
 AZ1Dbn5IOMbQ8yC9nq7ETFGwnY52RpqB8pOpQcqciyNc+OwlhYhZ6Bhn4ip49hN9e7kn
 o2dSGXhBpxMVA/5Amgp597KtJ45bNY6VZPYqxa8en9cQS8mQnOlGoK27TZOmohFy1PBS
 gNRQ==
X-Gm-Message-State: AOAM530g4b4sgCieyVZX8CMVS3vU+T88F65ZlxzVhCvmqguoecw7vPhL
 6OUhejm/H7B8W+Mrcj0X9GVl9Bw4eXY=
X-Google-Smtp-Source: ABdhPJxZxOr0snHuWFqr6G4SGAfzIJ3mgEFuX4BaVmV7mFdW770Cwt5XaQ0uxyD0rDUWC5CdQtyriA==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr7692089ljg.105.1595146101920; 
 Sun, 19 Jul 2020 01:08:21 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:21 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 13/19] backlight: as3711_bl: simplify update_status
Date: Sun, 19 Jul 2020 10:07:37 +0200
Message-Id: <20200719080743.8560-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replaces the open-coded checks of the state, with the
backlight_get_brightness() helper. This increases readability
of the code and align the functionality across the drivers.

Futhermore drop the debug prints in update_status().
If we need debug printing then we can add it to the backlight core.

v2:
  - Use backlight_get_brightness()

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/video/backlight/as3711_bl.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 33f0f0f2e8b3..3b60019cdc2b 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -104,17 +104,10 @@ static int as3711_bl_update_status(struct backlight_device *bl)
 	struct as3711_bl_data *data = bl_get_data(bl);
 	struct as3711_bl_supply *supply = to_supply(data);
 	struct as3711 *as3711 = supply->as3711;
-	int brightness = bl->props.brightness;
+	int brightness;
 	int ret = 0;
 
-	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
-		__func__, bl->props.brightness, bl->props.power,
-		bl->props.fb_blank, bl->props.state);
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
+	brightness = backlight_get_brightness(bl);
 
 	if (data->type == AS3711_BL_SU1) {
 		ret = as3711_set_brightness_v(as3711, brightness,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
