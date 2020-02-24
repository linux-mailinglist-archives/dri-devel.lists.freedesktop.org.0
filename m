Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910C16BC57
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E997889F47;
	Tue, 25 Feb 2020 08:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C516E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6063F293A39
Received: by earth.universe (Postfix, from userid 1000)
 id 0A2523C0C96; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 19/56] drm/omap: dsi: drop unused memory_read()
Date: Tue, 25 Feb 2020 00:20:49 +0100
Message-Id: <20200224232126.3385250-20-sebastian.reichel@collabora.com>
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 93 -------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 -
 2 files changed, 97 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 92c9dc211aeb..59b8fc71c974 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -931,97 +931,6 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
-static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
-                                        u16 size)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-
-	return mipi_dsi_set_maximum_return_packet_size(dsi, size);
-}
-
-static int dsicm_memory_read(struct omap_dss_device *dssdev,
-		void *buf, size_t size,
-		u16 x, u16 y, u16 w, u16 h)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	struct omap_dss_device *src = ddata->src;
-	int r;
-	int first = 1;
-	int plen;
-	unsigned int buf_used = 0;
-
-	if (size < w * h * 3)
-		return -ENOMEM;
-
-	mutex_lock(&ddata->lock);
-
-	if (!ddata->enabled) {
-		r = -ENODEV;
-		goto err1;
-	}
-
-	size = min((u32)w * h * 3,
-		   ddata->vm.hactive * ddata->vm.vactive * 3);
-
-	src->ops->dsi.bus_lock(src);
-
-	r = dsicm_wake_up(ddata);
-	if (r)
-		goto err2;
-
-	/* plen 1 or 2 goes into short packet. until checksum error is fixed,
-	 * use short packets. plen 32 works, but bigger packets seem to cause
-	 * an error. */
-	if (size % 2)
-		plen = 1;
-	else
-		plen = 2;
-
-	dsicm_set_update_window(ddata, x, y, w, h);
-
-	r = dsicm_set_max_rx_packet_size(dssdev, plen);
-	if (r)
-		goto err2;
-
-	while (buf_used < size) {
-		u8 dcs_cmd = first ? 0x2e : 0x3e;
-		first = 0;
-
-		r = mipi_dsi_dcs_read(dsi, dcs_cmd,
-				      buf + buf_used, size - buf_used);
-		if (r < 0) {
-			dev_err(dssdev->dev, "read error\n");
-			goto err3;
-		}
-
-		buf_used += r;
-
-		if (r < plen) {
-			dev_err(&ddata->dsi->dev, "short read\n");
-			break;
-		}
-
-		if (signal_pending(current)) {
-			dev_err(&ddata->dsi->dev, "signal pending, "
-					"aborting memory read\n");
-			r = -ERESTARTSYS;
-			goto err3;
-		}
-	}
-
-	r = buf_used;
-
-err3:
-	dsicm_set_max_rx_packet_size(dssdev, 1);
-err2:
-	src->ops->dsi.bus_unlock(src);
-err1:
-	mutex_unlock(&ddata->lock);
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -1094,8 +1003,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 
 	.enable_te	= dsicm_enable_te,
 	.get_te		= dsicm_get_te,
-
-	.memory_read	= dsicm_memory_read,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index b946b90ce01b..54f362cc5223 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -388,10 +388,6 @@ struct omap_dss_driver {
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 	int (*get_te)(struct omap_dss_device *dssdev);
-
-	int (*memory_read)(struct omap_dss_device *dssdev,
-			void *buf, size_t size,
-			u16 x, u16 y, u16 w, u16 h);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
