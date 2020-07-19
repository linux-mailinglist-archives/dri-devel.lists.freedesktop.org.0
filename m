Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852272250BA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78006E4FE;
	Sun, 19 Jul 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05966E4F1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b25so17025659ljp.6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDwomWBaZyGmgAqcrUivq0LeYUSJfOi4w7mumAORuIo=;
 b=qZbLaespDfNwaOoZYjfwSw6uv2x1yI8DDERHdue+PXEnXZi63Azp8gN/o6R4QC9uOx
 Wa9NRMfnp4AF+nYsndHsy0/Rf0v6v5bcZ+LsJesG+AUfxfAjBwK4UoGNhAdffeDlG4Dd
 zM18q1hxAF4FFLXJNrD0rGFlDztvCd/LczZhAb4HDXSmAyJzC4zqDMaqjn3BLZV+dFlG
 uQRjjiTydR9+lcFtGZXKGBYIGYCJrDPYszDiwe6M4EcQ1+JviCm8AHkpV9za14e4TDhj
 cP/PXZRls6E9RZedtoijUBWUc8qP41t/uqSHMAFcg3H5H3I4Wlms6FKQaesrgyQfLUnZ
 sk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hDwomWBaZyGmgAqcrUivq0LeYUSJfOi4w7mumAORuIo=;
 b=U0y2OW9l+CDbn0j6LqUszqQ1yGh5+QcqfYIB8bEuaILwYJATExmcjZZLuJmS3E6aJt
 1JjV4ugdv94iiQ3/XtveNa1eZ77MerG2Pc2EQcai2uUkpFB2GylTpyqmVY+m37j4cSfv
 U25/e9V10qyv26MOZzwCSno7pjki2YidN6Fgw/D1SZe7hJpNMKKVwZopztbywv6KgiZ9
 U8fhCP30JgjRAVGG85WS11MIfRNpNVKWLzv/ly8EeLalh2nV9AqVzGypIdT2VgW/+ju+
 KBLtLT+H1NoBdcgv9GMeysRkXmzipm8TI2yeFCzmQZ2lVVGpqbWr0oLtiXbJvzCuqDpT
 /rGg==
X-Gm-Message-State: AOAM533CHG2WmKTYtb5dU4GfHNiOS1SH/kACG0Jg1PBbix+5CVpqL8Vr
 R5+djhSGatBmy07gN2u8E8lJGNA0J5E=
X-Google-Smtp-Source: ABdhPJxl8rnN+FIc4hwfdlTsc9yUhDElaMadQ4i8ACenfj10jhR5RM+e3Rdb5asOLrfsrLf1PxnkFw==
X-Received: by 2002:a2e:571c:: with SMTP id l28mr7549009ljb.432.1595146106225; 
 Sun, 19 Jul 2020 01:08:26 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:25 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 16/19] backlight: jornada720_bl: introduce
 backlight_is_blank()
Date: Sun, 19 Jul 2020 10:07:40 +0200
Message-Id: <20200719080743.8560-17-sam@ravnborg.org>
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

Use the backlight_is_blank() helper to simplify the code a bit.

The jornada720_bl driver distingush between backlight off
and brightness set to 0.

Thus this driver turn off backlight only when backlight_is_blank()
returns true.

v2:
  - Updated changelog (Daniel)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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
