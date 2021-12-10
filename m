Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D885946FFA7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E13E10E2ED;
	Fri, 10 Dec 2021 11:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFF610E2D1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id p13so8207987pfw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wv27UtE1e1W7hQoof9oQU8Yg5PSkgE+pRTTj9nNNXMw=;
 b=DGYyqvxViMyJ57F2MEaNKWduCTDgDcQ24jeBymdCWZj8fC6PBTKs1qk5xRQYi/+PQ9
 TjwNF/szUkRREvTA0JjR3xUQklpCmzXeCEnxQhYd+icg2XukZMblNvf/DhvS1UbbQ38V
 nyMxkPra2jVgC1vVDOhMp63ST1WIYYt8ohwIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wv27UtE1e1W7hQoof9oQU8Yg5PSkgE+pRTTj9nNNXMw=;
 b=YgHyqh1hMdLrLQrsPjB7de1jYFJaS3MWuRcMqCjqfo8NctYo2KUoAEuPwVA29H6Ata
 2BNHo2ctyCMLAC50E5gShiTwEP69rWVxhXuN5zavGgvVwfamF5Frslzttni4eCz2qUDk
 GKAeLhULFO2BM0VHxJYo5LdIMDeXDF3tClxiiu5Lqzz4Dw+Z0lSOYRl3Hw6646j/VC4p
 B94lENMlRhto+jPXTLT5xP3AsoetU+CYDz6/rVaDqUBDzJVVpYq2lEtfE8a6l9//Y0wU
 drdMyxfPVJpreaP4F2tZeihNHHk76J8ZMQkAEdRxGDiNDLTKL74azv0BNa3dSLssLIkF
 p6Hw==
X-Gm-Message-State: AOAM530DXaT+SEGnTY4UwawhjxfUyNTzxbUwdXu8WHh7Oo6QI05BY04f
 xdwHH/779ig80kHfH8FjKhg9Yg==
X-Google-Smtp-Source: ABdhPJyYb/+GuVLQfRhxx8RPWx20aoxhK99fRYN3KRqEq3MOSkKa1sF0FOttaXa+kAYHk+y2n4HNjw==
X-Received: by 2002:a63:1413:: with SMTP id u19mr39058934pgl.109.1639135047001; 
 Fri, 10 Dec 2021 03:17:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:26 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 1/6] drm: sun4i: dsi: Drop DRM bind race with bridge attach
Date: Fri, 10 Dec 2021 16:47:06 +0530
Message-Id: <20211210111711.2072660-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing host driver will keep looking for DRM pointer in
sun6i_dsi_attach and defers even if the particular DSI device
is found for the first time. Meanwhile it triggers the bind
callback and gets the DRM pointer and then continues the
sun6i_dsi_attach.

This makes a deadlock situation if sun6i_dsi_attach is trying
to find the bridge.

If interface bridge is trying to call host attach, then host
sun6i_dsi_attach is trying to find bridge and defers the
interface bridge even if it found the bridge as bind callback
does not complete at the movement. So, this sun6i_dsi_attach
defers interface bridge and triggers the bind callback and
tries to attach the bridge with a bridge pointer which is not
available at the moment.

Eventually these callbacks are triggered recursively, as
sun6i_dsi_attach defers interface bridge and bind callback
defers sun6i_dsi_attach due to invalid bridge ponter.

This patch prevents this situation by probing all DSI devices
on the pipeline first and then triggers the bind callback by
dropping exing DRM binding logic.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- none
Changes for v5:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +---------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 527c7b2474da..4bdcce8f1d84 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -967,14 +967,10 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
-	if (!dsi->drm || !dsi->drm->registered)
-		return -EPROBE_DEFER;
 
 	dsi->panel = panel;
 	dsi->device = device;
 
-	drm_kms_helper_hotplug_event(dsi->drm);
-
 	dev_info(host->dev, "Attached device %s\n", device->name);
 
 	return 0;
@@ -988,8 +984,6 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 	dsi->panel = NULL;
 	dsi->device = NULL;
 
-	drm_kms_helper_hotplug_event(dsi->drm);
-
 	return 0;
 }
 
@@ -1077,8 +1071,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
-	dsi->drm = drm;
-
 	return 0;
 
 err_cleanup_connector:
@@ -1091,7 +1083,7 @@ static void sun6i_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 
-	dsi->drm = NULL;
+	drm_encoder_cleanup(&dsi->encoder);
 }
 
 static const struct component_ops sun6i_dsi_ops = {
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index c863900ae3b4..61e88ea6044d 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -29,7 +29,6 @@ struct sun6i_dsi {
 
 	struct device		*dev;
 	struct mipi_dsi_device	*device;
-	struct drm_device	*drm;
 	struct drm_panel	*panel;
 };
 
-- 
2.25.1

