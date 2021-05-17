Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13393865DD
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97F36E342;
	Mon, 17 May 2021 20:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1266E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:53 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id z4so1603260plg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOZl2a0Xn+Y+oYoBUp55w9Z29a1A4HjFAvDLzhVhkqE=;
 b=eU6UxXe8TD0o/QUCV0Yy+MMbIQLPLTHNNbNuBTC7DkWQuRoGhqVm3tGDTzB4qDOYxD
 yETi1jd/D3yEQbqMMpM1nEQ/RTTc80vMdtggULBTBM76/Ei21a5xS7ByOrfe3aPvJAcN
 Dqaz34kIW4/3TYsbnViDkSpc2yP55yNrbq1s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOZl2a0Xn+Y+oYoBUp55w9Z29a1A4HjFAvDLzhVhkqE=;
 b=k94ZSLjw3xNA/extN4/HjP+En1lDdeOrg+Mc8sEAAafwGFFVyg8/b7LvVvWdipodHi
 r/CziuAZuzXSzCWYTxG3fjWD+NExjTqVeL/3LiyNmH42GB2wkhdB2fr885AZIE79sNP/
 RN5tuw+srdlIykuNcKOpUq7HGvJpct+dD3wDwENRDF+kOgP0htKu0tXTl8/sGqugse2B
 dqURSqCpjia9GjLMjr/UENmryAFtKIlofO5Ui1e157jPsBUoscg9G3eVt8qZq62GMnJ1
 wd4qBAQ2l8aF8Ukd7MTantj6ifSzTKharKBdxCZCPp7qMUsCgWZ2JKZmPF+a0MgoNL+N
 P3FQ==
X-Gm-Message-State: AOAM533p/P4EkQurEcZdqhzWm7Zg59opLQGOqTqhj9gGHlMNM+1j0Mm/
 mZWTr7psLnG7gMc0hCezpr10yg==
X-Google-Smtp-Source: ABdhPJyTrQXjfhuuJoM4Ts7rTF2Cm+pFj01Va4cSrUA6KTyHc0dawC5/JzLBe/tqlu792cBM94O5kA==
X-Received: by 2002:a17:90b:1949:: with SMTP id
 nk9mr838329pjb.220.1621282193248; 
 Mon, 17 May 2021 13:09:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 05/10] drm/panel: panel-simple: Allow panel-simple be a DP
 AUX endpoint device
Date: Mon, 17 May 2021 13:09:02 -0700
Message-Id: <20210517130450.v7.5.Iada41f76a7342354bae929d0bb3ceba40f27f0ea@changeid>
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

The panel-simple driver can already have devices instantiated as
platform devices or MIPI DSI devices. Let's add a 3rd way to
instantiate it: as DP AUX endpoint devices.

At the moment there is no benefit to instantiating it in this way,
but:
- In the next patch we'll give it access to the DDC channel via the DP
  AUX bus.
- Possibly in the future we may use this channel to configure the
  backlight.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v7:
- Patch to allow panel-simple to be DP AUX EP new for v7.

 drivers/gpu/drm/panel/Kconfig        |  1 +
 drivers/gpu/drm/panel/panel-simple.c | 52 +++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ef87d92cdf49..b1ea86d9fdaf 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -82,6 +82,7 @@ config DRM_PANEL_SIMPLE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
+	select DRM_DP_AUX_BUS
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 21939d4352cf..d3b5ae22d939 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -36,6 +36,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -4957,6 +4958,38 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
 	.shutdown = panel_simple_dsi_shutdown,
 };
 
+static int panel_simple_dp_aux_ep_probe(struct dp_aux_ep_device *aux_ep)
+{
+	const struct of_device_id *id;
+
+	id = of_match_node(platform_of_match, aux_ep->dev.of_node);
+	if (!id)
+		return -ENODEV;
+
+	return panel_simple_probe(&aux_ep->dev, id->data);
+}
+
+static void panel_simple_dp_aux_ep_remove(struct dp_aux_ep_device *aux_ep)
+{
+	panel_simple_remove(&aux_ep->dev);
+}
+
+static void panel_simple_dp_aux_ep_shutdown(struct dp_aux_ep_device *aux_ep)
+{
+	panel_simple_shutdown(&aux_ep->dev);
+}
+
+static struct dp_aux_ep_driver panel_simple_dp_aux_ep_driver = {
+	.driver = {
+		.name = "panel-simple-dp-aux",
+		.of_match_table = platform_of_match,	/* Same as platform one! */
+		.pm = &panel_simple_pm_ops,
+	},
+	.probe = panel_simple_dp_aux_ep_probe,
+	.remove = panel_simple_dp_aux_ep_remove,
+	.shutdown = panel_simple_dp_aux_ep_shutdown,
+};
+
 static int __init panel_simple_init(void)
 {
 	int err;
@@ -4965,15 +4998,25 @@ static int __init panel_simple_init(void)
 	if (err < 0)
 		return err;
 
+	err = dp_aux_dp_driver_register(&panel_simple_dp_aux_ep_driver);
+	if (err < 0)
+		goto err_did_platform_register;
+
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
 		err = mipi_dsi_driver_register(&panel_simple_dsi_driver);
-		if (err < 0) {
-			platform_driver_unregister(&panel_simple_platform_driver);
-			return err;
-		}
+		if (err < 0)
+			goto err_did_aux_ep_register;
 	}
 
 	return 0;
+
+err_did_aux_ep_register:
+	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
+
+err_did_platform_register:
+	platform_driver_unregister(&panel_simple_platform_driver);
+
+	return err;
 }
 module_init(panel_simple_init);
 
@@ -4982,6 +5025,7 @@ static void __exit panel_simple_exit(void)
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
 		mipi_dsi_driver_unregister(&panel_simple_dsi_driver);
 
+	dp_aux_dp_driver_unregister(&panel_simple_dp_aux_ep_driver);
 	platform_driver_unregister(&panel_simple_platform_driver);
 }
 module_exit(panel_simple_exit);
-- 
2.31.1.751.gd2f1c929bd-goog

