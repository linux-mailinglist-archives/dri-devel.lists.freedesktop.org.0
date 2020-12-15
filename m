Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA562DAB0E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AE06E19C;
	Tue, 15 Dec 2020 10:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B676E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl1RE123791
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029221;
 bh=t7NS18AffohBug21eGRuVMqidVcKhEMu64FyLG/RIVo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=H4ocMaKdzouo+GCF86PEgJasGiMNfuZv2cRkzxfhzZeWEgrM3dKdt3IaRpGb6pi+x
 cFoUz93PIkUWX95v7+4buiVpm0/7+jqioyps0s9N44ybHm6PLplrY+vdDKxU3BKX36
 P8w/wz1nZV/TAbKioX3KucYNvxvE90+g6vRNpF5w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl1CT022444
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:01 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:01 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZm046467;
 Tue, 15 Dec 2020 04:47:00 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 02/84] drm/omap: drop unused dsi.configure_pins
Date: Tue, 15 Dec 2020 12:45:35 +0200
Message-ID: <20201215104657.802264-3-tomi.valkeinen@ti.com>
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

The panel-dsi-cm's ddata->pin_config is always NULL, so this
callback is never called. Instead the DSI encoder gets the pin
configuration directly from DT.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
 3 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e39ce0c0c9a9..458cadb07d15 100644
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
index 735a4e9027d0..2ba1287dda36 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4890,7 +4890,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 
 		.enable_hs = dsi_vc_enable_hs,
 
-		.configure_pins = dsi_configure_pins,
 		.set_config = dsi_set_config,
 
 		.enable_video_output = dsi_enable_video_output,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 28c2cffc362e..6f068f881cb3 100644
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
