Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26D213F90
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE836EBA5;
	Fri,  3 Jul 2020 18:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2156EBA6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so38027421ljm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVpNCLVbYK3myT9m7EMLcaTGTbPNg14V6/aAMmsTZXg=;
 b=i+dGOr4EWUC5qQNHs62J7il3yC06m2A2KuvuM3yYcl8cBQLVGR/s0evNAyTgE2gcL6
 dWM2JmoB1nEH4m+EYd1sCOmt3eIF/qSD7cZpMCla1tgSHcPn3R1KzFxnVTBbu9kTJT2y
 aafHd4s88I8gQloKgllw6AvfV24E3rSHtJlq8RijQRAL1lodcrvg1nnftOj8st6usR+0
 PsXVhep4vXi2W4d/pWgkuUwF0/Te/s3OVe3iGYVC8UcWYURMgEPbhgdk9J1LKcar7g3d
 0o/cx9EmYbM7MdzAHLxShbbqr/ReRkLyGSIA8Vpz2tb6VpphFmQ9P43mLiEKCAk0krZz
 qfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yVpNCLVbYK3myT9m7EMLcaTGTbPNg14V6/aAMmsTZXg=;
 b=Qlau41cgaJy59PjTDftE0xiVqAcm9LfyzSoEq4XsXlDa6JkcMis6YIn5wLhdmicgSj
 FxB098aTw6aRnyCK43ZWSOKXKxD81X4uwT6nB60+eeTvTS4fGgLSp7leP8mhk10ITDW5
 MQTIL5XnOnqHIyNoWOz8Gh0EwlzGeElG+bOgEUz4GVJt08/5kGKZ3XF7VgXqQVaUf84n
 X4+uTHqbImrU3fz/KWLLljnBssSy5dY+SbWBAaQ4kWzAn3+FfkBwwh47T8TrWvuZ9V/V
 pnWMmANo3Uxo307JorXEe0bYFu2iCRXZY935wnFjnzu4fV4ShTLpKktS1HjzGQsIUz6A
 +cOg==
X-Gm-Message-State: AOAM53174tUEHR4ZbZSBlCWEd3UiHfc3IdmTF5kbsjRDP++j+ofGYbr6
 KrB9vNwlhaqm+pER8LNsfnVE/52aNhU=
X-Google-Smtp-Source: ABdhPJz6ywgEAki17QCT6lxB5XBqQ6/MR1UrT5bX2iXgmUlYUHpArI48qZ8zUwJ276Dr8lVs/vVFZA==
X-Received: by 2002:a05:651c:1a7:: with SMTP id
 c7mr20688976ljn.345.1593801991763; 
 Fri, 03 Jul 2020 11:46:31 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 14/20] backlight: cr_bllcd: introduce backlight_is_blank()
Date: Fri,  3 Jul 2020 20:45:40 +0200
Message-Id: <20200703184546.144664-15-sam@ravnborg.org>
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

The cr_bllcd uses the FB_BLANK states as brightness.
This results in brightness value equals 0 that turn on
the display and 4 that turn off the display.
Simplify the logic but keep current behaviour
as userspace may expect brightness set to 0 to turn on the display.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/cr_bllcd.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
index 4624b7b7c6a6..edca5fee9689 100644
--- a/drivers/video/backlight/cr_bllcd.c
+++ b/drivers/video/backlight/cr_bllcd.c
@@ -63,22 +63,16 @@ static int cr_backlight_set_intensity(struct backlight_device *bd)
 	u32 addr = gpio_bar + CRVML_PANEL_PORT;
 	u32 cur = inl(addr);
 
-	if (bd->props.power == FB_BLANK_UNBLANK)
-		intensity = FB_BLANK_UNBLANK;
-	if (bd->props.fb_blank == FB_BLANK_UNBLANK)
-		intensity = FB_BLANK_UNBLANK;
-	if (bd->props.power == FB_BLANK_POWERDOWN)
-		intensity = FB_BLANK_POWERDOWN;
-	if (bd->props.fb_blank == FB_BLANK_POWERDOWN)
+	if (backlight_is_blank(bd))
 		intensity = FB_BLANK_POWERDOWN;
 
-	if (intensity == FB_BLANK_UNBLANK) { /* FULL ON */
+	if (intensity != FB_BLANK_POWERDOWN) { /* FULL ON */
 		cur &= ~CRVML_BACKLIGHT_OFF;
 		outl(cur, addr);
-	} else if (intensity == FB_BLANK_POWERDOWN) { /* OFF */
+	} else { /* OFF */
 		cur |= CRVML_BACKLIGHT_OFF;
 		outl(cur, addr);
-	} /* anything else, don't bother */
+	}
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
