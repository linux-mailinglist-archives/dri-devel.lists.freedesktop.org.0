Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EF78E79F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8268510E5AF;
	Thu, 31 Aug 2023 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id C993210E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:10:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,216,1688396400"; d="scan'208";a="174580076"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2023 17:10:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id F07CA4010DFB;
 Thu, 31 Aug 2023 17:09:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 3/4] drm/bridge: Drop CONFIG_OF conditionals around of_node
 pointers
Date: Thu, 31 Aug 2023 09:09:37 +0100
Message-Id: <20230831080938.47454-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
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
Cc: Guillaume BRUN <the.cheaterman@gmail.com>, Zhu Wang <wangzhu9@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sandor Yu <Sandor.yu@nxp.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having conditional around the of_node pointers turns out to make driver
code use ugly #ifdef and #if blocks. So drop the conditionals.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v5->v6:
 * Added Rb tag from Douglas Anderson.
 * Dropped conditionals from remaining drm/bridge drivers.
v5:
 * Split from patch#2
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
 drivers/gpu/drm/bridge/panel.c                     | 2 --
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 2 --
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 6169db73d2fe..ad8241758896 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&anx78xx->lock);
 
-#if IS_ENABLED(CONFIG_OF)
 	anx78xx->bridge.of_node = client->dev.of_node;
-#endif
 
 	anx78xx->client = client;
 	i2c_set_clientdata(client, anx78xx);
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..7f41525f7a6e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -302,9 +302,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->panel = panel;
 
 	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
-#ifdef CONFIG_OF
 	panel_bridge->bridge.of_node = panel->dev->of_node;
-#endif
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6c1d79474505..52d91a0df85e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3541,9 +3541,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.interlace_allowed = true;
 	hdmi->bridge.ddc = hdmi->ddc;
-#ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
-#endif
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 04d4a1a10698..a8dd2a2e7c7b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1182,9 +1182,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 
 	dsi->bridge.driver_private = dsi;
 	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
-#ifdef CONFIG_OF
 	dsi->bridge.of_node = pdev->dev.of_node;
-#endif
 
 	return dsi;
 }
-- 
2.25.1

