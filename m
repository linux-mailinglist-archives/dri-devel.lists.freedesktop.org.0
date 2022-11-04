Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3D618EC5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22BA10E6DF;
	Fri,  4 Nov 2022 03:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98310E6D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:07 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id k7so3741399pll.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BM/ZgUkpWv+s7vwzn/eT6S3wXaI2KYDcFcJls+ba05w=;
 b=HsxPuUdQwSnFQ64iRXaUt75qhUeJUOAmxgZvyMl3cSVcnxcHQPOh4HffyPqWb8e5n9
 7xil5xom0quAf5cGKdYEDu1NxOHsppOF4OtKd9AkfJKAI+XTs3vAt9mEooP1dZJiz1EF
 QwNspeCRYO4R86HE44lD4ny/BGwZD2Yim4jffZ1JIQe0L33LaV4b/a4F5lqcPkqN82AH
 3WQvRgiNhXMmaasIawBbU2JmGhhGh26ct44UwZHlVAT2YGn/nCBYVz/tjKzMEj7K+T0e
 AKFsPIG7jB7vT2gBjhmEyu/xOhePc/jJmprnoRbsoiRoBNBrHCKunpkkKAg5BVMq3/hE
 mbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BM/ZgUkpWv+s7vwzn/eT6S3wXaI2KYDcFcJls+ba05w=;
 b=1Uqj/yMNPJ7dOzmJEeBAhB2IaHEEPxJ2rQ4RnKhVTkErWdl6h/R69PgQ4PapKb0q74
 V2C2Yjf7jjTyqnWXn05yChQo6B4tYjOUTFTzcnPVHAPufeu4j8cOZSk6lxY/9D58SFF9
 BS/AxlATbExkR1Q6sDdbytQlFKceWrWl9YQOuwHi9LS0WquYnTebZKQa8hOzp2sHLmUQ
 w9q9hehg7VE4hsys/7iPvowjmPxDwXzLchVAVyNd4OmuE4fFcWRZrAl00sA71J8dnYHQ
 +ZAtawh+7cYK0+TR/qPRoimn3ra7CDCG6i0SN1GdkM8rq67oEPGuAOaiMn4J7Qetqe45
 mVwA==
X-Gm-Message-State: ACrzQf2HxcM+8YlfY/lBOnWv+jbb0hOfsjbxiCoT4YCmKfdbS2dU9o9H
 pv6QWshZnJaqVER/9c7WaFk=
X-Google-Smtp-Source: AMsMyM6VLQ54CW2tu0iKULrkzQCWmsEnj5G7SB7ozCUYWTrPKrSsyNNhp3eu/M0HRnEgAa85rKqfCg==
X-Received: by 2002:a17:902:c14d:b0:187:337b:ad9c with SMTP id
 13-20020a170902c14d00b00187337bad9cmr18884743plj.35.1667531826511; 
 Thu, 03 Nov 2022 20:17:06 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 11/13] omapfb: panel-lgphilips-lb035q02: remove
 backlight GPIO handling
Date: Thu,  3 Nov 2022 20:16:40 -0700
Message-Id: <20221103-omapfb-gpiod-v1-11-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With f048e8c1d169 ("omapfb: panel-lgphilips-lb035q02: Remove legacy boot
support") it is no longer possible to specify GPIO to control the
backlight. Remove code trying to request and toggle it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../omapfb/displays/panel-lgphilips-lb035q02.c      | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
index 3ce1f9d2e7c4..e69856cb62d5 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
 #include <linux/mutex.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <video/omapfb_dss.h>
 
@@ -46,9 +46,6 @@ struct panel_drv_data {
 
 	struct omap_video_timings videomode;
 
-	/* used for non-DT boot, to be removed */
-	int backlight_gpio;
-
 	struct gpio_desc *enable_gpio;
 };
 
@@ -166,9 +163,6 @@ static int lb035q02_enable(struct omap_dss_device *dssdev)
 	if (ddata->enable_gpio)
 		gpiod_set_value_cansleep(ddata->enable_gpio, 1);
 
-	if (gpio_is_valid(ddata->backlight_gpio))
-		gpio_set_value_cansleep(ddata->backlight_gpio, 1);
-
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	return 0;
@@ -185,9 +179,6 @@ static void lb035q02_disable(struct omap_dss_device *dssdev)
 	if (ddata->enable_gpio)
 		gpiod_set_value_cansleep(ddata->enable_gpio, 0);
 
-	if (gpio_is_valid(ddata->backlight_gpio))
-		gpio_set_value_cansleep(ddata->backlight_gpio, 0);
-
 	in->ops.dpi->disable(in);
 
 	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
@@ -250,8 +241,6 @@ static int lb035q02_probe_of(struct spi_device *spi)
 
 	ddata->enable_gpio = gpio;
 
-	ddata->backlight_gpio = -ENOENT;
-
 	in = omapdss_of_find_source_for_first_ep(node);
 	if (IS_ERR(in)) {
 		dev_err(&spi->dev, "failed to find video source\n");
@@ -284,13 +273,6 @@ static int lb035q02_panel_spi_probe(struct spi_device *spi)
 	if (r)
 		return r;
 
-	if (gpio_is_valid(ddata->backlight_gpio)) {
-		r = devm_gpio_request_one(&spi->dev, ddata->backlight_gpio,
-				GPIOF_OUT_INIT_LOW, "panel backlight");
-		if (r)
-			goto err_gpio;
-	}
-
 	ddata->videomode = lb035q02_timings;
 
 	dssdev = &ddata->dssdev;
@@ -310,7 +292,6 @@ static int lb035q02_panel_spi_probe(struct spi_device *spi)
 	return 0;
 
 err_reg:
-err_gpio:
 	omap_dss_put_device(ddata->in);
 	return r;
 }

-- 
b4 0.11.0-dev-28747
