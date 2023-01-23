Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998D677AC2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C753810E35D;
	Mon, 23 Jan 2023 12:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E4110E354
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:24:05 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 5so5895069plo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
 b=Bs0TV7ERk+1qlxrrL7Iq5xhDKr5wiGvfIOEQTt6IEY71jGdKwszKG4hIaiQyH4B9jK
 MwmxoJPwcb9LQqVnuhdd2t8InREwkVC0UlbadxWthtOhwJIYUpmyHdcc/u0Zh8F29ZnO
 D5p/egAtj8nfw/RGK72SWkaPkEyVTCoegod7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
 b=Eq4y6r0i8GCwgaFQirw3K4xTx3Zldgnfeov4Nco/sHQ15PGIKvJ54zd7ovzWDv5tP3
 j3h2ZonghVuq5EM82YZi0HpWSMsgpjnqJ9lq7YG1TVJVMrY7KKV6U65FJzLnxJrQ3yqW
 nOhOKaxo3DIopsrD9ywHsbWPYD9alq4fjE2kBFaQLyDsi2AVCFgvk7U0dqkEDOeyxOQV
 qsQdJ7VNBni+pCsENIzhEr0LeCeKkM2U4xAZaQSDR5gU4fyZBv720X6fmoABBov+Hhsa
 zoAdm+tkgqVWB7sVaUmIFIeanhuIeZgqFcvK2OXse+P12cT5hpB9MBl13f7Wm8otCWaX
 YL8w==
X-Gm-Message-State: AFqh2kp2bLX/B9a/1+ViUiijpMShINimz0me2pNLGAY8mp/1NyjlWzzn
 l7D1zrL+N7n6LkUbgxPoVcAYAg==
X-Google-Smtp-Source: AMrXdXvsTRgXZ7RQIq+gYIX9+q5YLVd4v+79GSby+iqOUZw8lOw/ZbfaFOb/iKF6P9GVg+/bbqjmZg==
X-Received: by 2002:a05:6a20:a00d:b0:9d:efbf:6623 with SMTP id
 p13-20020a056a20a00d00b0009defbf6623mr28597401pzj.49.1674476645425; 
 Mon, 23 Jan 2023 04:24:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:24:04 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v11 04/18] drm: exynos: dsi: Switch to
 devm_drm_of_dsi_get_bridge
Date: Mon, 23 Jan 2023 17:53:05 +0530
Message-Id: <20230123122319.261341-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_dsi_get_bridge is capable of looking up the downstream
DSI bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_dsi_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..4a165764121d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1470,18 +1470,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
+	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
@@ -1531,8 +1522,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	dsi->out_bridge = NULL;
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-- 
2.25.1

