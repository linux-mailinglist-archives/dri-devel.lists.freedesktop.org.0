Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56ED618EB3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5478510E058;
	Fri,  4 Nov 2022 03:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25C710E048
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:16:49 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y203so3403155pfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVkDO2KOif2frQeCzecIa3Ot4mR/23B4wTbE/ilmNLI=;
 b=ISodEXugjsGq/3voQK8yKgdkqR315OB/AgxmhqVqPbmkoX6tYVJxq4Qe1LyWQeOTCL
 pOXwJlIJrbTSTw52Tmg+tM6gVo9rCHjHV4bniO/FsZX1yHZo68/hRy8G3GP51UZ54w3p
 YbgidRg7v11OIVoiBVF2BNhAbCSbrPqrSvxocMRm8usjN8IeI27KLtJKKTtcFCtKgrL7
 cv8eVSOH+881aWk7/zvyHPjeR6tPC3Rf9YaUFcFEs25De4bia3On/TvBgtGWmvVYAecN
 U/hJqDZ6J7Ql0/YllMRZczid+nCLjwuJkxJhWyAQP9cEXxaop0I1zTMAiDAxy8EB0iWd
 ekoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVkDO2KOif2frQeCzecIa3Ot4mR/23B4wTbE/ilmNLI=;
 b=pORZfrj1a6LYIeqULEJ86YnLTC9b2NZ1Cl6GGDj/TXuc/6FhQoi0R++UQ07yomE//z
 +jWdVBMvBpMizuYIL00+wcC7VitZ/abhOBIaTZteY5EcYp+rKtYaCN+AdgNEuZ01nkvn
 C+DZgzL9Il9g3YnyCdLnfILhoCRpl+TqLBMoEbW61fG1a0Kp7qCnNjpVxHvmMsrVaXpr
 ZmyuLiR3QE45rPfTAZSaWDcCMLaFNeogqDAkTc4FOsAqIYXpGJeiuYGn//TFMespRp/Y
 Us3NxVw+PKgcpNaaXbvr0dWWezvSvbIpdR+PqzIR83cM2cOnosPns/Xg51VddWUimA2n
 eybQ==
X-Gm-Message-State: ACrzQf0ESaXMNzAidcUFPUzCC09H/xRNt44/MM8hE+XicsmPQ02I/b4C
 t/OtJrQg1rNBzYwmU6lT5nM=
X-Google-Smtp-Source: AMsMyM4gv9FFTkU3yc/kdYQAO0x9NhjY7M4+LxVPeUm9AG5lgYFwiLS9RSw36HZtBQOwFasZ85l0LQ==
X-Received: by 2002:a63:2215:0:b0:43b:e00f:7c7b with SMTP id
 i21-20020a632215000000b0043be00f7c7bmr28818221pgi.511.1667531808949; 
 Thu, 03 Nov 2022 20:16:48 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:16:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 01/13] omapfb: connector-hdmi: switch to using gpiod API
Date: Thu,  3 Nov 2022 20:16:30 -0700
Message-Id: <20221103-omapfb-gpiod-v1-1-cba1fae5a77c@gmail.com>
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
b4 0.11.0-dev-28747
