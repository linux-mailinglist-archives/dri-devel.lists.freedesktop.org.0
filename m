Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6423A47AC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7936F39F;
	Fri, 11 Jun 2021 17:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CE96F39B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:18:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id x19so3167274pln.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLUswd1dSQ0hPRNhs52IrDtd9ENhPFtFix4wQei6vxU=;
 b=NAETJtO4D7MVafOLBIqeEz1+Qv+4DGD89aACIYgtCY431W7AT9ZC8J6IaxHJ+xwlt0
 YaWIHpEE+YITkMTdxBikYyXL9S+ZfZ3CLS9c/+C1NS4Px+psyj+1LZFAre0YXYKQd9Tu
 HyW/B6+0La9ZTSPyPMlyVL0FTgS9h0y7QZQnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLUswd1dSQ0hPRNhs52IrDtd9ENhPFtFix4wQei6vxU=;
 b=av5i1Q90IWIq5qt55w1WUIKpWe4DByPiTvwqVsvM0SQSJmY7wpSH7WJomOBiEy/r91
 7cx98hLDmm/IW7MzkAOwO7E8L+odkB8rpKmZ0DOvNNkKiohPPYdhlgwyR78Dk1TLmtee
 LKebiQR/b0jWAR+vezy5ZDGwKvfhz0S3phEgk+v6kIIhlv0IVQBlGB76cXMTHe95Y7Ny
 xjyPt2EMwjoqm98pwXeCpVnslOp4V9/flsNuw0f2xjxHNgTxPyk5W2jGouVm7FKIarPB
 QyiGCujZ6ezMxgIm2L77u2wg/yYXAwu7ury04ic49OuNVRA/XU0UlECBlhVnwaA8Aclq
 uDnA==
X-Gm-Message-State: AOAM532BtbovluP80/ajU2fZnlT9ahz4L8cAADVcNB0t6RoAeWs0s6kA
 vhgRU0+sITFDuKMcbYZV1Z0Qgg==
X-Google-Smtp-Source: ABdhPJxV8cRIoU+LeovEJWmgTUI4w536XmUkBS8ZKX2GuJimd6Sjl+crXzNRFCak+h5mVLWuOODLxQ==
X-Received: by 2002:a17:90b:941:: with SMTP id
 dw1mr9778868pjb.115.1623431892186; 
 Fri, 11 Jun 2021 10:18:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4128:5428:5cd0:cfa5])
 by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:18:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 05/11] drm/panel: panel-simple: Allow panel-simple be a DP
 AUX endpoint device
Date: Fri, 11 Jun 2021 10:17:41 -0700
Message-Id: <20210611101711.v10.5.Iada41f76a7342354bae929d0bb3ceba40f27f0ea@changeid>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

(no changes since v7)

Changes in v7:
- Patch to allow panel-simple to be DP AUX EP new for v7.

 drivers/gpu/drm/panel/Kconfig        |  1 +
 drivers/gpu/drm/panel/panel-simple.c | 52 +++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1352dffda705..7c32b040aa72 100644
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
2.32.0.272.g935e593368-goog

