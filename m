Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354842DAB24
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E226E1EE;
	Tue, 15 Dec 2020 10:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFCF6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlKEg010501
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029240;
 bh=ajwCt6izPHphFLCUv1Y3/2TJvnTgbI78sniWle0E1uc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=AFZpsC73YgVCRPKuVuGJPFE3aItRIxqEEyEFgjIiicxE9ts12iD2Hif2Xvq02MFgL
 F52PFH4duIgJfBC3q0lvBOmuiiQwrHQge+kXCmRg5cGH3BVI7KYhtexGxxqYHqJEzD
 zF+hYgR/LJRffNy8t8j5ZI9YRqgFWbVXrmyTehSU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlKOC101249
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:20 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:19 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwa6046467;
 Tue, 15 Dec 2020 04:47:19 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 20/84] drm/omap: dsi: drop useless sync()
Date: Tue, 15 Dec 2020 12:45:53 +0200
Message-ID: <20201215104657.802264-21-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The DSI sync() function only locks the bus and then releases
it again. Currently the only invocation is directly before
update(), which locks the bus anyways.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h          |  1 -
 drivers/gpu/drm/omapdrm/omap_crtc.c            |  3 ---
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index c1afb71af01c..f1e917afcbe4 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -844,23 +844,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
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
@@ -949,7 +932,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 
 static const struct omap_dss_driver dsicm_dss_driver = {
 	.update		= dsicm_update,
-	.sync		= dsicm_sync,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 68b3ec4d2553..b02a75d55133 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -385,7 +385,6 @@ struct omap_dss_device {
 struct omap_dss_driver {
 	int (*update)(struct omap_dss_device *dssdev,
 			       u16 x, u16 y, u16 w, u16 h);
-	int (*sync)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 7d66269ad998..b6700f2043be 100644
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
