Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4031D3C14
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976666EBAB;
	Thu, 14 May 2020 19:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2E16EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j3so4742258ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvAqoIVnlBgyd68hnn1WiT3rXHhwfxcl0UeJKweLhko=;
 b=OaZrLbTWdUNdE4LXccXwIoqLV+2ksJ4Yz7Tv7vBdYId/RUkl1J0RJkHGPtLE+qYQGD
 A3lwKWbkJx/maHhmD8hyeQvedIL+YgJAm5IIMnc/f7FcnwTB+mkaVDOussWdSjd3TC95
 S4SVAwpqeGMuoL4PsU0pdB46yS0P/3VYKCz04GBoWP+uMYBLflp74lTTunGciS/ZNmI2
 AEWlRbgNES13Gr1h6jAp6FjKHLxqsvKiEeYOrZJwoKwadRo0GU8h5epYANQi32oo8O7i
 QAF7LXsTMpCAxVGAamcGOH1pWHqo7ppeP4H5AKbRB2xrYCxVnfxd14kZBurnDchUwezT
 QTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uvAqoIVnlBgyd68hnn1WiT3rXHhwfxcl0UeJKweLhko=;
 b=d+cjdF6GF5QR/5y/IjFAtL+Kmn0plwQvbLjuphIVU4MXrvBhzfG5LUtb/pQArL0KPC
 5PD/8eArL1DtrErpZtCQ81Np1yXjVax3DweogNhC8AiXTgdWTbv/gTE6iEty0RA2eqr6
 zt+nl+Lc+79OJlyFyi5k5Xdqj0tZ6bkys8eQPDg7nIV04s3B8tbTru2CoiP/l1s4NpbT
 HVuJhP/P7cCvNCf0XLWWKYmW93htoffKIsD4fgW3+cZC/uvYpAXdLDuDKmpBYa0Z9Tl8
 ZtoWCeaOaBKa1Qlc0bZ9NnbHmDTDpzaH28ML+y8qEGunx3kat3U3ZzBpJLV8DNFm8ksL
 FD3w==
X-Gm-Message-State: AOAM532CdRY2UEV3sew1NuW7eBjveDD0KAsWfUKeBx87+2RgItqKZrU+
 0rDReyTaMtkLoLP2lKnXqmn1c+Hvwe5zQA==
X-Google-Smtp-Source: ABdhPJz1wwUxhhbKyXbGPZbBiIEsG4KEM76cKxu9cIh2796pYawzu/mXE3iTzXyvDvGKAApNYB578A==
X-Received: by 2002:a2e:8805:: with SMTP id x5mr3852963ljh.223.1589483420269; 
 Thu, 14 May 2020 12:10:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 03/18] video: amba-clcd: use devm_of_find_backlight
Date: Thu, 14 May 2020 21:09:46 +0200
Message-Id: <20200514191001.457441-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514191001.457441-1-sam@ravnborg.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look up backlight device using devm_of_find_backlight().
This simplifies the code and prevents us from hardcoding
the node name in the driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
