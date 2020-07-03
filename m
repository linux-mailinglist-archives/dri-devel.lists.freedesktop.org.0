Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194A213F95
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373546EBA7;
	Fri,  3 Jul 2020 18:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0DA6EBA7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id k17so6252086lfg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZNZ91Ufx6ojfiiT+ZYBRZsahy67A4bJ2OQndrGkqvw=;
 b=IN60GzkumPnjdCCjAXLga3TkI9r+tMRO4r414D3XwPqkkmoMM8IG73aedwq6jOFFJ+
 i7v/VdzLHRcaZ7LPh1243jMCJi+2OJVLjsA274K/ukCLJCkpUZcxMo2guoC2vFIScnvO
 DlugE49fFCUtw8ZSysGlX8UGz07m+FEoCmLKEUmba1IDOzTymnRiUNAhph69R5P+yR5Y
 shmKTkktHAcpdRBmICeMMF+e/roC/9Zygvi762Zu68xJCJLIIOQdMhsv3EZPerg9E/El
 +f/nH0T6d9m9idHYJXLNi1qNL1tSacKpX/gOpuPzvkZUu2+/U916r+cl5wcl1dnATqpV
 4Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VZNZ91Ufx6ojfiiT+ZYBRZsahy67A4bJ2OQndrGkqvw=;
 b=Ld0v21A50RoyD/PAqRsl/oHGynssj1PUWYislsuzkPA6Ev3XjVck90cCUsNqarzhLL
 uWTSXthRUpgS4+qyf5pFC6NA5uGQH2nk8o6MMTOsm4EIH51AGBiGwD6sfEmuDoLf5axg
 2kDwr+46qSXT5NopJyp73K2ImAskLlQ3VUugKwhurTnDx4gz2/4fLAOXFmvSEYu4Axvt
 mshru48AugutrmBQXNf5FmGYF6Y0/QEz8CxBAoBmHVBvwfdfRy0NlulTKANn7heh87si
 kr7N1Islhstp6axAhdc72wO1h7CtaSjsGQqIm32k/Ev7RM585AjvfiQE7MzIQ1QY4vB9
 cq2g==
X-Gm-Message-State: AOAM530rZxnQ3g0db9weiqSwf1PLHHN3HI6XkG7uKOkYjG98EehkWnUa
 PGwO00UzJfuLBcN5iKAvQ/UdYtvWveU=
X-Google-Smtp-Source: ABdhPJyNvWX5NnnpSSlpfSVj4ZmLvfiZUcS46+w0anQr3yWLoRT6w2fGIF+x7Bzmy6J8QO/7sRO4Aw==
X-Received: by 2002:ac2:43dc:: with SMTP id u28mr22896333lfl.17.1593801995826; 
 Fri, 03 Jul 2020 11:46:35 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 16/20] backlight: jornada720_bl: introduce
 backlight_is_blank()
Date: Fri,  3 Jul 2020 20:45:42 +0200
Message-Id: <20200703184546.144664-17-sam@ravnborg.org>
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

Use the backlight_is_blank() helper to simplify the code a bit.
This add support for fb_blank as a side-effect.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/jornada720_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/jornada720_bl.c b/drivers/video/backlight/jornada720_bl.c
index f0385f9cf9da..996f7ba3b373 100644
--- a/drivers/video/backlight/jornada720_bl.c
+++ b/drivers/video/backlight/jornada720_bl.c
@@ -54,7 +54,7 @@ static int jornada_bl_update_status(struct backlight_device *bd)
 	jornada_ssp_start();
 
 	/* If backlight is off then really turn it off */
-	if ((bd->props.power != FB_BLANK_UNBLANK) || (bd->props.fb_blank != FB_BLANK_UNBLANK)) {
+	if (backlight_is_blank(bd)) {
 		ret = jornada_ssp_byte(BRIGHTNESSOFF);
 		if (ret != TXDUMMY) {
 			dev_info(&bd->dev, "brightness off timeout\n");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
