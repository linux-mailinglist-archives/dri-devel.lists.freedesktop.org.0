Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70B2250BC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4BE6E500;
	Sun, 19 Jul 2020 08:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE666E4F1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f5so17026459ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcuwxUbNQ02ezWkTsCzZiUS7wW0ksGl96SStmrqrSfs=;
 b=fi3Bs4uqa9jVLVXLEM0m7dgPj6ibdld6VHgAfosz+EQUhP81hsD2D0IbWFKl0fkIMu
 oUMHCLR7FQptKSyQYl9FYPnjcFzr4WFocEw0LStcfh4EYZEZeOM/ef9dTBn/ZArY5k7s
 TNFlFmjVuDN5oORWxos8GhIV+e2LKsHLVMEK/V/i+48/pl2oxLQXfvxk9eAcOSEF+hFD
 phFmh5BRH7UFxHmchzRiAb+7MnPpppip950Tob6OnfXPKE/NKIUXTMgOjCt4ezmtPXZB
 37+B+frmLwYj5V44HSeI7DtJ+O4X7ibFvuCn+aKp+KKJM5/eHmxVCacmhsjFbNjbnW6a
 8c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pcuwxUbNQ02ezWkTsCzZiUS7wW0ksGl96SStmrqrSfs=;
 b=IVnscRHCuMsp28JNEkGzzqLKRXysWN1StVsIn2Z9o6f1A5bafufykhpIis3ZyS+rXz
 7LyQndK/1+VishCdg9YipnaYng/xydE9sx6MiL1Kx55jzDwnoQgQyxpSIQFSaVIm8RCW
 8NNk6/TqjhMlk9iope91GBGEE+96Cbor4/SFKjpvXGe4V6Wy2UG6f8b8VVu0zsns0pUJ
 O+fZm19uQe7rc0IXu3Cqy/lVqPlsAXo7mgwAWDxLhT2uLuxmah+/fMUrc+cYUDoqNtCi
 WoTFWveXGsxYNwl/9TZUWIj4ln/8XHKRWcoCkJuOKWfH58XusOLWZ4oJN/23knzKPim9
 UxOw==
X-Gm-Message-State: AOAM5314o4uY4ok8mBHFlShC9cpGFnLlzL7HdHYCpvDPU0hduff0zyjJ
 6f1NCXqVyFFc50YM+kuK+i2CJqAfCVk=
X-Google-Smtp-Source: ABdhPJw1ENiBQ0uLk0l74mX8NuTfduet72T4huNn0yGXdgzGp3lYKsspmCqsOIqOthPY0/A7OUkyKw==
X-Received: by 2002:a2e:8505:: with SMTP id j5mr590968lji.65.1595146103398;
 Sun, 19 Jul 2020 01:08:23 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 14/19] backlight: cr_bllcd: introduce gpio-backlight
 semantics
Date: Sun, 19 Jul 2020 10:07:38 +0200
Message-Id: <20200719080743.8560-15-sam@ravnborg.org>
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

cr_bllcd can turn backlight ON or OFF.
Fix semantitics so they equals what we know from gpio-backlight.
brightness == 0   => backlight off
brightness == 1   => backlight on

Use the backlight_get_brightness() helper to simplify the code.

v2:
  - reworked to introduce gpio-backlight semantics (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/cr_bllcd.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/cr_bllcd.c b/drivers/video/backlight/cr_bllcd.c
index 4624b7b7c6a6..a24d42e1ea3c 100644
--- a/drivers/video/backlight/cr_bllcd.c
+++ b/drivers/video/backlight/cr_bllcd.c
@@ -63,22 +63,15 @@ static int cr_backlight_set_intensity(struct backlight_device *bd)
 	u32 addr = gpio_bar + CRVML_PANEL_PORT;
 	u32 cur = inl(addr);
 
-	if (bd->props.power == FB_BLANK_UNBLANK)
-		intensity = FB_BLANK_UNBLANK;
-	if (bd->props.fb_blank == FB_BLANK_UNBLANK)
-		intensity = FB_BLANK_UNBLANK;
-	if (bd->props.power == FB_BLANK_POWERDOWN)
-		intensity = FB_BLANK_POWERDOWN;
-	if (bd->props.fb_blank == FB_BLANK_POWERDOWN)
-		intensity = FB_BLANK_POWERDOWN;
-
-	if (intensity == FB_BLANK_UNBLANK) { /* FULL ON */
-		cur &= ~CRVML_BACKLIGHT_OFF;
-		outl(cur, addr);
-	} else if (intensity == FB_BLANK_POWERDOWN) { /* OFF */
+	if (backlight_get_brightness(bd) == 0) {
+		/* OFF */
 		cur |= CRVML_BACKLIGHT_OFF;
 		outl(cur, addr);
-	} /* anything else, don't bother */
+	} else {
+		/* FULL ON */
+		cur &= ~CRVML_BACKLIGHT_OFF;
+		outl(cur, addr);
+	}
 
 	return 0;
 }
@@ -90,9 +83,9 @@ static int cr_backlight_get_intensity(struct backlight_device *bd)
 	u8 intensity;
 
 	if (cur & CRVML_BACKLIGHT_OFF)
-		intensity = FB_BLANK_POWERDOWN;
+		intensity = 0;
 	else
-		intensity = FB_BLANK_UNBLANK;
+		intensity = 1;
 
 	return intensity;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
