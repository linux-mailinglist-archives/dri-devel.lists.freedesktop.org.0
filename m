Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BF16BC7F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D4A6EA5A;
	Tue, 25 Feb 2020 08:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973A56E9B4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4EF1F2935C9
Received: by earth.universe (Postfix, from userid 1000)
 id A62CB3C0C87; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
Date: Tue, 25 Feb 2020 00:20:34 +0100
Message-Id: <20200224232126.3385250-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel-dsi-cm's ddata->pin_config is always NULL, so this
callback is never called. Instead the DSI encoder gets the pin
configuration directly from DT.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
 3 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 3484b5d4a91c..e7fe5d702337 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -68,8 +68,6 @@ struct panel_drv_data {
 	int width_mm;
 	int height_mm;
 
-	struct omap_dsi_pin_config pin_config;
-
 	/* runtime variables */
 	bool enabled;
 
@@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		}
 	}
 
-	if (ddata->pin_config.num_pins > 0) {
-		r = src->ops->dsi.configure_pins(src, &ddata->pin_config);
-		if (r) {
-			dev_err(&ddata->pdev->dev,
-				"failed to configure DSI pins\n");
-			goto err_vddi;
-		}
-	}
-
 	r = src->ops->dsi.set_config(src, &dsi_config);
 	if (r) {
 		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 79ddfbfd1b58..8c39823a8295 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 
 		.enable_hs = dsi_vc_enable_hs,
 
-		.configure_pins = dsi_configure_pins,
 		.set_config = dsi_set_config,
 
 		.enable_video_output = dsi_enable_video_output,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index cbbe10b2b60d..b0424daaceed 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -292,8 +292,6 @@ struct omapdss_dsi_ops {
 	/* bus configuration */
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
-	int (*configure_pins)(struct omap_dss_device *dssdev,
-			const struct omap_dsi_pin_config *pin_cfg);
 
 	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
 			bool enable);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
