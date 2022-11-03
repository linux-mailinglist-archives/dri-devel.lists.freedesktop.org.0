Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD586618BD5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E428B10E662;
	Thu,  3 Nov 2022 22:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F53410E64E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:06 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so3177732pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GzyVxrhxEbz+OkOBW/vELHwjREnaJbPjpbkyciCOuGU=;
 b=CBNO6vMlSLpNtQN82BjV4VPELjbrs2snmwzEcl47oYPc2n+hYfAIcKkdB0l6nBgtjh
 Go9XzIiBLTs2l0HOdHuKZaOfToC4MFF1m0PSw0c6j3hSwtmo1zOvBRX0PfxGpBjOyr8L
 rU3KKM5dj9bX8AKtdL20Oi9dB5slGk+dGny8ei0kc1/sXKr576pYpU2Dpp4BIqcDktVJ
 x+suUidssIdLmv+Qb4nndRE8SEGarjfdJ3lup7ZAiTwsQ30tq+aQEaVHba8nH2rmYVlE
 YKon1yYBdSu9l3j0AZ1LOUlluqpZotOksbyhNOEooRtb1CklASwPyrHTV9bGo5hqcHp9
 4ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GzyVxrhxEbz+OkOBW/vELHwjREnaJbPjpbkyciCOuGU=;
 b=wvoxZCQ4sW4OQ6isrsreDzlVZerdNhXTwOSBGLReiK0reAEyAKLKB9G7cvMUcSiipE
 qaem9ucKYmLAsd/+9n7P42zr3V4eQWEZsDE5DlZRlmkZq/iSHGpzEFQ99YpIl599PJzp
 edzfhktPjK1bpJXnNK3m1oprsXdsiuNOA1lLuCvRW+rCHNmZbCzXWFmkhrFZ6DGLUIb0
 ZWtuXa50RWtDxdxl4QAERue+1wEpJQWHQuSdH1U9cZPB+AmZ4dg6/yr8JIxkeT1vLcUv
 ol+8y39FxxM7/euH25W3vD0WnIp01lnJW6r1erYyPxF5f5qMcBucZaooC4DQh3056LQa
 TfXg==
X-Gm-Message-State: ACrzQf2X8h1e2zA+MfoQ0uX+/g/Yv94fFsypSPv5gkY7QJwf08spdRBS
 AUL4w5npU8W90asmdjdo49A=
X-Google-Smtp-Source: AMsMyM6PUokmz2Qi/MEYK1qf/09vcpEWhd8ty8i8xUH+DMkr/eV8/XQjqtWgtesX6MEiaYM3XrbMZQ==
X-Received: by 2002:a17:90a:4d08:b0:20b:25f6:3e30 with SMTP id
 c8-20020a17090a4d0800b0020b25f63e30mr206608pjg.227.1667515625646; 
 Thu, 03 Nov 2022 15:47:05 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 01/13] omapfb: connector-hdmi: switch to using gpiod API
Date: Thu,  3 Nov 2022 15:46:37 -0700
Message-Id: <20221103-omapfb-gpiod-v1-1-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
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

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   | 49 +++++++---------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
index 670b9c6eb5a9..8f9ff9fb4ca4 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
@@ -6,11 +6,12 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 
 #include <drm/drm_edid.h>
 
@@ -41,7 +42,7 @@ struct panel_drv_data {
 
 	struct omap_video_timings timings;
 
-	int hpd_gpio;
+	struct gpio_desc *hpd_gpio;
 };
 
 #define to_panel_data(x) container_of(x, struct panel_drv_data, dssdev)
@@ -155,8 +156,8 @@ static bool hdmic_detect(struct omap_dss_device *dssdev)
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *in = ddata->in;
 
-	if (gpio_is_valid(ddata->hpd_gpio))
-		return gpio_get_value_cansleep(ddata->hpd_gpio);
+	if (ddata->hpd_gpio)
+		return gpiod_get_value_cansleep(ddata->hpd_gpio);
 	else
 		return in->ops.hdmi->detect(in);
 }
@@ -197,31 +198,6 @@ static struct omap_dss_driver hdmic_driver = {
 	.set_hdmi_infoframe	= hdmic_set_infoframe,
 };
 
-static int hdmic_probe_of(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-	struct omap_dss_device *in;
-	int gpio;
-
-	/* HPD GPIO */
-	gpio = of_get_named_gpio(node, "hpd-gpios", 0);
-	if (gpio_is_valid(gpio))
-		ddata->hpd_gpio = gpio;
-	else
-		ddata->hpd_gpio = -ENODEV;
-
-	in = omapdss_of_find_source_for_first_ep(node);
-	if (IS_ERR(in)) {
-		dev_err(&pdev->dev, "failed to find video source\n");
-		return PTR_ERR(in);
-	}
-
-	ddata->in = in;
-
-	return 0;
-}
-
 static int hdmic_probe(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata;
@@ -238,15 +214,18 @@ static int hdmic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ddata);
 	ddata->dev = &pdev->dev;
 
-	r = hdmic_probe_of(pdev);
+	ddata->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
+	r = PTR_ERR_OR_ZERO(ddata->hpd_gpio);
 	if (r)
 		return r;
 
-	if (gpio_is_valid(ddata->hpd_gpio)) {
-		r = devm_gpio_request_one(&pdev->dev, ddata->hpd_gpio,
-				GPIOF_DIR_IN, "hdmi_hpd");
-		if (r)
-			goto err_reg;
+	gpiod_set_consumer_name(ddata->hpd_gpio, "hdmi_hpd");
+
+	ddata->in = omapdss_of_find_source_for_first_ep(pdev->dev.of_node);
+	r = PTR_ERR_OR_ZERO(ddata->in);
+	if (r) {
+		dev_err(&pdev->dev, "failed to find video source\n");
+		return r;
 	}
 
 	ddata->timings = hdmic_default_timings;

-- 
b4 0.11.0-dev-5166b
