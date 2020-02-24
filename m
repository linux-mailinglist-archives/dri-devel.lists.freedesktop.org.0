Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E437816BCA8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E116EA70;
	Tue, 25 Feb 2020 08:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B326E9B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id F00172935F8
Received: by earth.universe (Postfix, from userid 1000)
 id 156793C0C98; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 21/56] drm/omap: dsi: drop unused enable_te()
Date: Tue, 25 Feb 2020 00:20:51 +0100
Message-Id: <20200224232126.3385250-22-sebastian.reichel@collabora.com>
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

enable_te() is not used, so the custom API can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 39 -------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 -
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e4b24c67c45d..64f493c722c0 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -882,43 +882,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	return r;
 }
 
-static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
-	int r;
-
-	mutex_lock(&ddata->lock);
-
-	if (ddata->te_enabled == enable)
-		goto end;
-
-	src->ops->dsi.bus_lock(src);
-
-	if (ddata->enabled) {
-		r = dsicm_wake_up(ddata);
-		if (r)
-			goto err;
-
-		r = _dsicm_enable_te(ddata, enable);
-		if (r)
-			goto err;
-	}
-
-	ddata->te_enabled = enable;
-
-	src->ops->dsi.bus_unlock(src);
-end:
-	mutex_unlock(&ddata->lock);
-
-	return 0;
-err:
-	src->ops->dsi.bus_unlock(src);
-	mutex_unlock(&ddata->lock);
-
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -988,8 +951,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 static const struct omap_dss_driver dsicm_dss_driver = {
 	.update		= dsicm_update,
 	.sync		= dsicm_sync,
-
-	.enable_te	= dsicm_enable_te,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index a1e78ba665d8..e6832bf22ed0 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -385,8 +385,6 @@ struct omap_dss_driver {
 	int (*update)(struct omap_dss_device *dssdev,
 			       u16 x, u16 y, u16 w, u16 h);
 	int (*sync)(struct omap_dss_device *dssdev);
-
-	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
