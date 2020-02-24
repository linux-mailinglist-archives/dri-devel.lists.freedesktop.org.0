Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5A16BC95
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C166EA69;
	Tue, 25 Feb 2020 08:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FBE6E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id A8BB0293A90
Received: by earth.universe (Postfix, from userid 1000)
 id 19D623C0C99; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 22/56] drm/omap: dsi: drop useless sync()
Date: Tue, 25 Feb 2020 00:20:52 +0100
Message-Id: <20200224232126.3385250-23-sebastian.reichel@collabora.com>
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

The DSI sync() function only locks the bus and then releases
it again. Currently the only invocation is directly before
update(), which locks the bus anyways.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h          |  1 -
 drivers/gpu/drm/omapdrm/omap_crtc.c            |  3 ---
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 64f493c722c0..a45df247aad1 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -845,23 +845,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	return r;
 }
 
-static int dsicm_sync(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
-
-	dev_dbg(&ddata->dsi->dev, "sync\n");
-
-	mutex_lock(&ddata->lock);
-	src->ops->dsi.bus_lock(src);
-	src->ops->dsi.bus_unlock(src);
-	mutex_unlock(&ddata->lock);
-
-	dev_dbg(&ddata->dsi->dev, "sync done\n");
-
-	return 0;
-}
-
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct omap_dss_device *src = ddata->src;
@@ -950,7 +933,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 
 static const struct omap_dss_driver dsicm_dss_driver = {
 	.update		= dsicm_update,
-	.sync		= dsicm_sync,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index e6832bf22ed0..2c6c32240e20 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -384,7 +384,6 @@ struct omap_dss_device {
 struct omap_dss_driver {
 	int (*update)(struct omap_dss_device *dssdev,
 			       u16 x, u16 y, u16 w, u16 h);
-	int (*sync)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index fce7e944a280..3f78ce2f85a1 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -379,9 +379,6 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 		return;
 	}
 
-	if (dssdrv->sync)
-		dssdrv->sync(dssdev);
-
 	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
 	if (ret < 0) {
 		spin_lock_irq(&dev->event_lock);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
