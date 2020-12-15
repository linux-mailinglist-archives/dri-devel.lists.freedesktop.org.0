Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AB2DAB5B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8416E2A3;
	Tue, 15 Dec 2020 10:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141A6E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlmL8124104
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029268;
 bh=7dxoKll0voblYeid8nsvAcIj1oBXuK3QnJYBOMmw51w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jGG3veVwTpJWmas+bYlgKFRcJc5emrgzs3k8MrT/HMwxkK1SoZuoae4VtNAUwGlIa
 +V8UE1d3OixYnVAZNLOCWtmn/orE6wqUr9uT9Ck/Zd69MDaiPc+aijDqa4u8J215Df
 XNcGqlO1bj4H7+uSbVPqnHCk3q1v6O96zAOb+5QA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlmX4023420
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:48 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:47 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaX046467;
 Tue, 15 Dec 2020 04:47:47 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 47/84] drm/omap: simplify DSI manual update code
Date: Tue, 15 Dec 2020 12:46:20 +0200
Message-ID: <20201215104657.802264-48-tomi.valkeinen@ti.com>
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

Move dsi_ops into the main structure, since all other ops
are gone. Instead of checking the device type we can simply
check if dsi_ops are set.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 10 ++++------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  6 +-----
 drivers/gpu/drm/omapdrm/omap_crtc.c   | 16 ++++------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 9eae61ddbda9..efa261e4a18a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5011,11 +5011,9 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static const struct omap_dss_device_ops dsi_ops = {
-	.dsi = {
-		.update = dsi_update_all,
-		.is_video_mode = dsi_is_video_mode,
-	},
+static const struct omapdss_dsi_ops dsi_ops = {
+	.update = dsi_update_all,
+	.is_video_mode = dsi_is_video_mode,
 };
 
 static irqreturn_t omap_dsi_te_irq_handler(int irq, void *dev_id)
@@ -5446,7 +5444,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 	out->type = OMAP_DISPLAY_TYPE_DSI;
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
 	out->dispc_channel = dsi_get_channel(dsi);
-	out->ops = &dsi_ops;
+	out->dsi_ops = &dsi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index cc4b7d2629bd..76586934df37 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -275,10 +275,6 @@ struct omapdss_dsi_ops {
 	bool (*is_video_mode)(struct omap_dss_device *dssdev);
 };
 
-struct omap_dss_device_ops {
-	const struct omapdss_dsi_ops dsi;
-};
-
 struct omap_dss_device {
 	struct device *dev;
 
@@ -300,7 +296,7 @@ struct omap_dss_device {
 
 	const char *name;
 
-	const struct omap_dss_device_ops *ops;
+	const struct omapdss_dsi_ops *dsi_ops;
 	u32 bus_flags;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 0d1543537b92..09a255c942c1 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -366,17 +366,10 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 	struct drm_device *dev = omap_crtc->base.dev;
 	int ret;
 
-	if (!dssdev) {
-		dev_err_once(dev->dev, "missing display dssdev!");
+	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->update)
 		return;
-	}
-
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI || !dssdev->ops->dsi.update) {
-		dev_err_once(dev->dev, "no DSI update callback found!");
-		return;
-	}
 
-	ret = dssdev->ops->dsi.update(dssdev);
+	ret = dssdev->dsi_ops->update(dssdev);
 	if (ret < 0) {
 		spin_lock_irq(&dev->event_lock);
 		omap_crtc->pending = false;
@@ -550,11 +543,10 @@ static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
 
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
-	    !dssdev->ops->dsi.is_video_mode)
+	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->is_video_mode)
 		return false;
 
-	if (dssdev->ops->dsi.is_video_mode(dssdev))
+	if (dssdev->dsi_ops->is_video_mode(dssdev))
 		return false;
 
 	DBG("detected manually updated display!");
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
