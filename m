Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD13213F8D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCB26EBA4;
	Fri,  3 Jul 2020 18:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CCA6EBA5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e4so38110946ljn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuNmp2Y8twclxYeBZp9lqPlgdVdohaDn7/kP95qzQpY=;
 b=kK9IT2VP55hji7w3/BPDLgv5S1BIM2VNWRPFZIgGj+pAQViasT2BzK72Q2m6YUvVH8
 t/I6KFLwVacqpCFWKF+aCBrTNuHmcgP0/vAbplT6/Ggvkuf91DEHeaH64Pw1pV13ZeK1
 ZLPwGz4UG31u9GgK5ghjIGp8j3pBywRL9FKk1Xqu4zsvpIUf819HT3xjV/667+MQ752t
 JhaleG7ou2hlANhNQmSJmNrAHwNNkBhuREnz1Oc9OdKIqMffLZjCG3sA00bmd6JRQtyq
 z/wJG9+GIV3Zt7hWIui9V6yowJKpARl7old5SfFOeUZ3or/5MBU/6Imc2W6DIvvxwvxE
 fdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cuNmp2Y8twclxYeBZp9lqPlgdVdohaDn7/kP95qzQpY=;
 b=nT7uSK2bUxWXUT3rva3zdtnk+Yu5IRnrHmD7pPbpXGr6wau4nfkcg2J4cFLBRqIdZW
 21iskXC3enmrxiLJ9c8w7mVa5u2hgpdJG36P40PS6ZCl/kECDyOmMdvTF8vNgKigKPHN
 mVWDcKJZfOJ9Lob3ZMiC52HVqUAhxBD2Q8c7FK/GQ32kZvTEUKcuJer9L24qt9JIlYkp
 g9ZJ5aAHh8SNEhqFk/FP0WIWgtB56qZodZxfsdUayiAS5sO+qp9AxyLer+orz0Vrsjkx
 xFxcuEt8turHWJ+KOUQaXtr9dD3pKVnxejjdAsSEcMxcmdIFNNhs+MNDiwEAlBjWvQaD
 oM2A==
X-Gm-Message-State: AOAM533Wtt8IXEAF3JSt03RtgQe84vDa54hqgLSQg0dMlUngU2IXxwrN
 wyyqXzZeveW4guh7o7xkCoTo841OaoA=
X-Google-Smtp-Source: ABdhPJyBGH29SvxYyw0NjjWdvgwbdFGb97e14xVHDWd3nm3sy4Dj+wDXJFZR2VJ9zNEY+qr7qlaf+g==
X-Received: by 2002:a2e:8092:: with SMTP id i18mr13181844ljg.265.1593801989670; 
 Fri, 03 Jul 2020 11:46:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 13/20] backlight: as3711_bl: simplify update_status
Date: Fri,  3 Jul 2020 20:45:39 +0200
Message-Id: <20200703184546.144664-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
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
