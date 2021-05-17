Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20B3865E4
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6E26EA7A;
	Mon, 17 May 2021 20:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09D26E34B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:54 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id j12so5407244pgh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1nKDGF6pGJe0IpKS5C/RodzguTsVg0ZIzYR3jS4u4k=;
 b=fWtS/TP40LqAlfZ78nEJ1PtGoPOzEu9gxI8cBuKOzb3ckduQ8M34kJrg774jQAOf/y
 JIQLcpDk8HU/9Fu1vgLxJk+O0CxqxE8UNHL0YKIpuErycVwSIn+InsXfScFEg6ztd0Ru
 tAuBqLmQGLn3HJF6PdAncObwhOeO1jWcf5rMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1nKDGF6pGJe0IpKS5C/RodzguTsVg0ZIzYR3jS4u4k=;
 b=SqJFBabkUk9ODpPWGRTwIITTQgRqNc3x/ArubHkM+wSMF0foor2vRFhfmMAYPsUwlm
 z0kpsh7nIShKR5fPpoIQQcaceeDEY8wYm2EsrBkCjBWgXvJgMoeqtBuTKy/LmbmtuHLo
 GqNLZp+k2VwXRYDmwZLtvQFHDeUz0D9S5+8scR6dwSZmg0eXgc7Wu5avQ8vZXYA7M7Ao
 B4ur4cBfMl1p/9woFIetAdxzujv4fki9EuCdfwCYjtdm2HChkgccHN4EYvmELBUUVLpE
 tbZ7+FYvue2rRBh1lYRK1Hhxb0tNhp5M7t+kCAzjShiSyUr/RfLT3F/Z7ewA9Ec55/vi
 C4kg==
X-Gm-Message-State: AOAM530Bm3VFPE1eu/Xl1n4XJFrOljSy5TuxPJ6iBoRaeHu6KzZ4XS+Q
 bq1KI0/JHUaJUVrgNhF9gDcY/Q==
X-Google-Smtp-Source: ABdhPJwufsQmvr4lrG28XiJcm5hpjG/jAsvaoyX7ibGY6ATt/3lk8A+H8Ck46X0LCGgEvfbtITbFBg==
X-Received: by 2002:a63:8f15:: with SMTP id n21mr1212991pgd.366.1621282194627; 
 Mon, 17 May 2021 13:09:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 06/10] drm/panel: panel-simple: Stash DP AUX bus;
 allow using it for DDC
Date: Mon, 17 May 2021 13:09:03 -0700
Message-Id: <20210517130450.v7.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If panel-simple is instantiated as a DP AUX bus endpoint then we have
access to the DP AUX bus. Let's stash it in the panel-simple
structure, leaving it NULL for the cases where the panel is
instantiated in other ways.

If we happen to have access to the DP AUX bus and we weren't provided
the ddc-i2c-bus in some other manner, let's use the DP AUX bus for it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v7:
- Patch using the DP AUX for DDC new for v7.

 drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3b5ae22d939..b09be6e5e147 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_aux_bus.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -186,6 +187,7 @@ struct panel_simple {
 
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
+	struct drm_dp_aux *aux;
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
@@ -658,7 +660,8 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
-static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
+static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
+			      struct drm_dp_aux *aux)
 {
 	struct panel_simple *panel;
 	struct display_timing dt;
@@ -674,6 +677,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	panel->enabled = false;
 	panel->prepared_time = 0;
 	panel->desc = desc;
+	panel->aux = aux;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
 	if (!panel->no_hpd) {
@@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 		if (!panel->ddc)
 			return -EPROBE_DEFER;
+	} else if (aux) {
+		panel->ddc = &aux->ddc;
 	}
 
 	if (desc == &panel_dpi) {
@@ -4633,7 +4639,7 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, id->data);
+	return panel_simple_probe(&pdev->dev, id->data, NULL);
 }
 
 static int panel_simple_platform_remove(struct platform_device *pdev)
@@ -4913,7 +4919,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 
 	desc = id->data;
 
-	err = panel_simple_probe(&dsi->dev, &desc->desc);
+	err = panel_simple_probe(&dsi->dev, &desc->desc, NULL);
 	if (err < 0)
 		return err;
 
@@ -4966,7 +4972,7 @@ static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
 	if (!id)
 		return -ENODEV;
 
-	return panel_simple_probe(&aux_ep->dev, id->data);
+	return panel_simple_probe(&aux_ep->dev, id->data, aux_ep->aux);
 }
 
 static void panel_simple_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
-- 
2.31.1.751.gd2f1c929bd-goog

