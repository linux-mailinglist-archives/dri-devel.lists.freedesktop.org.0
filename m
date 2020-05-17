Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44321D6BEA
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6CB6E0E9;
	Sun, 17 May 2020 19:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E37E6E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:01:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x22so3190994lfd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnGgD3EY2jc/ddlIc7dBV262lNj4TMCpBFkInlI9rBA=;
 b=YLg+lhCgBEEBqKJatWX0oNegoMaaysitawJfeATyjsFJhoPf0zO1armnUFjYOPMN+y
 VQhgIyxhgETI5Uz7YiuT3YCPZZL9ojyppZB1A+FgiEiRme4ii9ZessuxKf8rMIiX4KYt
 uXqMH/qs8dhlAjTQ6kMXcPl0lSH81KfU8EUKceF6y8noYXdEaGzt7xGYqlsO2Pnbetih
 UW08sv+ggB5rJ5n3vxZqJrUXeSdESogjvx3K0VtyQ1tjcU/wALa0GmLdD/dDtq1zP2os
 /yJtfx2wQh7BDdlar9vZgyMuuoNF067strqLO1U7HLFMV74q1vORX3vdKxJsLggcURHv
 7kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nnGgD3EY2jc/ddlIc7dBV262lNj4TMCpBFkInlI9rBA=;
 b=AKLgq5dPPiksmAM7keqzzIJdv4KGIjNSnebCNsSxWrftY6qU9ySMgZnQndhjouQ78L
 bUMvXEZ3/baJML9ZBegskrXVYL/EPJjMHRoTGmUqCZ5BqTvCvHZHE6+hXXwvnlANaQS3
 woNwdE6JLunDyPDOTBNYDrpje0WUrjooYyvMzkmaDlEKPnyKvxp+tZhzNZYnYX6gUoZ4
 zz59FH8TWLxSMsQe2TOWwa5V12A2jHppQPr9trb0zwswqyO5lyiEVH3wW6FWSxNN4jy4
 2H4bOgXQ9Xm+zlAOblfNYvykBsdvOmG+MMgsRpu2Rnxr33cO4mwhXUMAVt3tuMOjqp8G
 ESuw==
X-Gm-Message-State: AOAM533LOtLG6DeiWpZxEzMDte2p06sOeSf0lwd2/eemR78rI2Sd2tQC
 iogSU51CcGifhY6vGt9kIe8VHkJ0NDU=
X-Google-Smtp-Source: ABdhPJy1vsYcgSkrn+HiZuSyph//uXWOOAOWkZC/5Xq9lJB0T2P/RlMecE5wtR8SB6YidOCu9FB1vg==
X-Received: by 2002:a19:c6c2:: with SMTP id w185mr7499670lff.69.1589742109709; 
 Sun, 17 May 2020 12:01:49 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:01:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 01/16] video: amba-clcd: use devm_of_find_backlight
Date: Sun, 17 May 2020 21:01:24 +0200
Message-Id: <20200517190139.740249-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517190139.740249-1-sam@ravnborg.org>
References: <20200517190139.740249-1-sam@ravnborg.org>
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
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look up backlight device using devm_of_find_backlight().
This simplifies the code and prevents us from hardcoding
the node name in the driver.

v2:
  - Added Cc: Peter Ujfalusi

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Douglas Anderson <dianders@chromium.org>
---
 drivers/video/fbdev/amba-clcd.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index c3d55fc6c4e0..b7682de412d8 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -602,20 +602,17 @@ static int clcdfb_snprintf_mode(char *buf, int size, struct fb_videomode *mode)
 			mode->refresh);
 }
 
-static int clcdfb_of_get_backlight(struct device_node *panel,
+static int clcdfb_of_get_backlight(struct device *dev,
 				   struct clcd_panel *clcd_panel)
 {
-	struct device_node *backlight;
+	struct backlight_device *backlight;
 
-	/* Look up the optional backlight phandle */
-	backlight = of_parse_phandle(panel, "backlight", 0);
-	if (backlight) {
-		clcd_panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
+	/* Look up the optional backlight device */
+	backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
 
-		if (!clcd_panel->backlight)
-			return -EPROBE_DEFER;
-	}
+	clcd_panel->backlight = backlight;
 	return 0;
 }
 
@@ -717,7 +714,7 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
 	if (!panel)
 		return -ENODEV;
 
-	err = clcdfb_of_get_backlight(panel, fb->panel);
+	err = clcdfb_of_get_backlight(&fb->dev->dev, fb->panel);
 	if (err)
 		return err;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
