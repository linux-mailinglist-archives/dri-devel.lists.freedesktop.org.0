Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC6377922
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF9289AC3;
	Sun,  9 May 2021 23:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467E899B0
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 23:08:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h4so20671866lfv.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 16:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHzOOhfOgoUHL2x5o1obRb2s5HZRhRoK1MqHS26Nfm0=;
 b=iM3uoTMikFkfV8KA30Nyc/TOp+I2fqtcPREwL/D/mqTjw3BsYlEmdoSUjcuo+gknxH
 n6edv+vJpkOQr/CzfogsOeFTgyA47SLI1zpNETGLMt+Sm0zqQNxNsFrIsNBEMLSJL9qB
 TNcadOh2zA5YusmrrcHQa8uGV66ZlYoqc5L5K2xDbbbbeXmVow7HYyfWaqt127VvLioN
 IzBXel8rbVrltdwLoWRbYIM2GsPoT3esA4CpBBKVI6WUyxIOrT/Vl9KF0J6Zn/DAF3bs
 EM5VVUNqKPCSHY5dUJh1a6aMH7NJRI0g/RT8KafUHarYmQFhSSpm4qnGGEhWWlHRvC5M
 WMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHzOOhfOgoUHL2x5o1obRb2s5HZRhRoK1MqHS26Nfm0=;
 b=Xf81irSafTaJ86osR//awiXWkiaWKJGUYDOvCjEkl/mplAEa0TaJSDDaokSrWI0s3w
 nh+I2krWkR4G99Uht2FFMm8vss0d132hWwEPt96hBX2B2+fcOURz9kIDhhjfkeO5uq7g
 1R/OCaq+C7k/F1YMIqQ3a3LacqSDG7eNgdbE9zCJFBcaU8dYrv2Z1ynt3d03Pib+POt1
 h1WaMMEBZj4Q4o8hQI31RgZE8u9bpUOzik9Vq/HrOm0sKNC7yf9XFAQUqaaMlYHQlFlB
 pPBEqhGMotxV3JXPvmKd67Dh7vROamDXsfKha7bSh6lYG/+Ri+qeTuDz37T5ySx79P9M
 KnSQ==
X-Gm-Message-State: AOAM5332j4kQWhlbGpgYnNtSttO0Dz34EBnYl7QX6rd9Vv2lmrm9U5P8
 Fx+Yo0EvOBVTy3TXcGHwSl4X/w==
X-Google-Smtp-Source: ABdhPJxYaOBp+UC7b0Xx/X0fD9dF/5waDqOMgIV0sH8kjfI4/AwNKMoFcbMMKxSoNOLMfVm2GWerkw==
X-Received: by 2002:a05:6512:130e:: with SMTP id
 x14mr14636390lfu.321.1620601691554; 
 Sun, 09 May 2021 16:08:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id w21sm2057773lfl.230.2021.05.09.16.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 16:08:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] RFC: drm/panel: s6e63m0: Register ESD IRQ handler
Date: Mon, 10 May 2021 01:08:08 +0200
Message-Id: <20210509230808.353422-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The S6E63M0 can emit an "ESD IRQ" which spells out
electrostatic discharge interrupt request. This exist
on other panels as well.

The interrupt will according to some sources occur
as a result of the display being bent or cracked
and generally failing to display the desired content.

I have no idea about how we should handle this
IRQ, but the codebase for the Samsung GT-S7710 handles
it by restarting the display controller pipeline,
and possibly we should also bring the panel, bridge,
and display controller down/up in response.

One idea I have is to broadcast a notifier so that the
core can react to this in process context in response
to this interrupt and restart the display pipeline.
I.e. raw_notifier_call_chain().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 603c5dfe8768..5e4d2e8aa7a7 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -17,6 +17,8 @@
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/media-bus-format.h>
+#include <linux/of_irq.h>
+#include <linux/interrupt.h>
 
 #include <video/mipi_display.h>
 
@@ -713,6 +715,18 @@ static int s6e63m0_backlight_register(struct s6e63m0 *ctx, u32 max_brightness)
 	return ret;
 }
 
+static irqreturn_t s6e63m0_esd_irq(int irq, void *data)
+{
+	struct s6e63m0 *ctx = data;
+
+	dev_info(ctx->dev, "ESD IRQ occurred\n");
+
+	/* Signal to the display controller to restart? */
+	msleep(100);
+
+	return IRQ_HANDLED;
+}
+
 int s6e63m0_probe(struct device *dev,
 		  int (*dcs_read)(struct device *dev, const u8 cmd, u8 *val),
 		  int (*dcs_write)(struct device *dev, const u8 *data, size_t len),
@@ -720,6 +734,7 @@ int s6e63m0_probe(struct device *dev,
 {
 	struct s6e63m0 *ctx;
 	u32 max_brightness;
+	int irq;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(struct s6e63m0), GFP_KERNEL);
@@ -758,6 +773,13 @@ int s6e63m0_probe(struct device *dev,
 		return PTR_ERR(ctx->reset_gpio);
 	}
 
+	irq = of_irq_get(dev->of_node, 0);
+	if (irq) {
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						s6e63m0_esd_irq, IRQF_ONESHOT,
+						"s6e63m0-esd", ctx);
+	}
+
 	drm_panel_init(&ctx->panel, dev, &s6e63m0_drm_funcs,
 		       dsi_mode ? DRM_MODE_CONNECTOR_DSI :
 		       DRM_MODE_CONNECTOR_DPI);
-- 
2.30.2

