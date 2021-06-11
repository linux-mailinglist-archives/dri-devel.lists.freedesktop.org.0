Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D33A47AD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306D6F390;
	Fri, 11 Jun 2021 17:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B026F39B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:18:14 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id 11so3150508plk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1AdllfUeFYcG22hQtR0CggshBPO4Bwf8Sf1fag38lI=;
 b=N6T5BynuflwZy9XSNh31MU0ysCj9hBPfHjACoH3VI3AzLcXV1JJLLDpBc/CYr65vTY
 jjHNVOx5TaFjdeEdqPnrb0tYIk5S4dVhAOt/wo9kk06A6iB4G5MIXWixvKdiTjUtQsiS
 lmE0kU3PpFefnE7FtKLytCfybg7U+nvFfeSt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1AdllfUeFYcG22hQtR0CggshBPO4Bwf8Sf1fag38lI=;
 b=ZogrQibMnCNzM6VSr/GBVQG7enUKKDFK9lPo8RuOVDCzS/apzw0UVq/lPW3yIxXlAK
 FfaBPLbeYWIdbSCsIoDbi+Rsg7DfzhPOL5+3ezRmehkYKnX6syv+7uF/BGBJG5WtvW/h
 iiUmWYa85acdt5sZE8jJajKT0TX2cJ7QBtuMPkrn8yXlyqHgHmlnl80wtt5p5XAP4smY
 9neyBzAp8vXDob/GlhETkrjdnla0/q5MShW0z/hAx7f0lPmgCGIPBfs0JIBCkZWB/Kug
 G7HTE9S7RdqFzP0uKqMsNT0NnWzJuW/2nPC8HWC239iFtIChZlLeNTqEbkPBgcGKX3Pc
 AhIw==
X-Gm-Message-State: AOAM533klNNbiCkgWUuKJOpc4MkAmTQIU4Slv3fmWFsFw+XUaSHaVUqK
 aHRM/Jn/2cJTWAnl/muFdwesqw==
X-Google-Smtp-Source: ABdhPJzwCzRzmWYz4JgbwGDn73HZfVLcK3Xv8TD71lYkOtgvEj9Ci3ZFbHTrA2UDKjgZ/7G88tYUOw==
X-Received: by 2002:a17:90a:4282:: with SMTP id
 p2mr5453505pjg.21.1623431893954; 
 Fri, 11 Jun 2021 10:18:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4128:5428:5cd0:cfa5])
 by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:18:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 06/11] drm/panel: panel-simple: Stash DP AUX bus;
 allow using it for DDC
Date: Fri, 11 Jun 2021 10:17:42 -0700
Message-Id: <20210611101711.v10.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- Fix error handling / remove case when using AUX bus for DDC.

Changes in v7:
- Patch using the DP AUX for DDC new for v7.

 drivers/gpu/drm/panel/panel-simple.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3b5ae22d939..df6fbd19e6fc 100644
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
@@ -802,7 +808,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
-	if (panel->ddc)
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
 	return err;
@@ -818,7 +824,7 @@ static int panel_simple_remove(struct device *dev)
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-	if (panel->ddc)
+	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
 	return 0;
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
2.32.0.272.g935e593368-goog

