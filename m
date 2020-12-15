Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE82DAB2F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EE86E20B;
	Tue, 15 Dec 2020 10:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A866E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlduG124030
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029259;
 bh=sSwZxjoJkUtvphfUiKv7hnnmgb7PDsjciR/YPxzTLlE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vTYkWqByc8IDzDwtvMxwiriBxZyq8zKqP/zXJmdujLDRv910JIu/VWJOQZfkTocxU
 2QK4w74c574IrU7TmlEoyu4bUWgA/0Ie6StY36ujOUjKn0xOY/UIvF/0Vh3m+rk/AC
 QUCUmdHIOD8gtiMUi9OfaeepTEmDSuubpG1KSkbk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAldbl101611
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:38 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaO046467;
 Tue, 15 Dec 2020 04:47:38 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 38/84] drm/omap: remove global dss_device variable
Date: Tue, 15 Dec 2020 12:46:11 +0200
Message-ID: <20201215104657.802264-39-tomi.valkeinen@ti.com>
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

We can simply provide the device to the omapdrm driver
via pdata. omapdss_is_initialized() is no longer required
(even before this patch), since omapdrm device is only
registered after the pointer is initialized.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 14 --------------
 drivers/gpu/drm/omapdrm/dss/dss.c     |  9 ++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  9 +++------
 drivers/gpu/drm/omapdrm/omap_drv.c    |  6 ++----
 4 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 3d2aa9d4ab6b..68c5d058b2e9 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -16,20 +16,6 @@
 #include "dss.h"
 #include "omapdss.h"
 
-static struct dss_device *dss_device;
-
-struct dss_device *omapdss_get_dss(void)
-{
-	return dss_device;
-}
-EXPORT_SYMBOL(omapdss_get_dss);
-
-void omapdss_set_dss(struct dss_device *dss)
-{
-	dss_device = dss;
-}
-EXPORT_SYMBOL(omapdss_set_dss);
-
 struct dispc_device *dispc_get_dispc(struct dss_device *dss)
 {
 	return dss->dispc;
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d7b2f5bcac16..0556711f57cd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1308,6 +1308,7 @@ static int dss_bind(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
+	struct dss_pdata pdata;
 	int r;
 
 	r = component_bind_all(dev, NULL);
@@ -1316,9 +1317,9 @@ static int dss_bind(struct device *dev)
 
 	pm_set_vt_switch(0);
 
-	omapdss_set_dss(dss);
-
-	drm_pdev = platform_device_register_simple("omapdrm", 0, NULL, 0);
+	pdata.dss = dss;
+	drm_pdev = platform_device_register_data(NULL, "omapdrm", 0,
+						 &pdata, sizeof(pdata));
 	if (IS_ERR(drm_pdev)) {
 		component_unbind_all(dev, NULL);
 		return PTR_ERR(drm_pdev);
@@ -1335,8 +1336,6 @@ static void dss_unbind(struct device *dev)
 
 	platform_device_unregister(dss->drm_pdev);
 
-	omapdss_set_dss(NULL);
-
 	component_unbind_all(dev, NULL);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index dd2e25548677..2345caf7721c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -356,12 +356,9 @@ struct omap_dss_device {
 	unsigned int of_port;
 };
 
-struct dss_device *omapdss_get_dss(void);
-void omapdss_set_dss(struct dss_device *dss);
-static inline bool omapdss_is_initialized(void)
-{
-	return !!omapdss_get_dss();
-}
+struct dss_pdata {
+	struct dss_device *dss;
+};
 
 void omapdss_display_init(struct omap_dss_device *dssdev);
 int omapdss_display_get_modes(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 42c2ed752095..825478c01968 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -568,6 +568,7 @@ static const struct soc_device_attribute omapdrm_soc_devices[] = {
 static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 {
 	const struct soc_device_attribute *soc;
+	struct dss_pdata *pdata = dev->platform_data;
 	struct drm_device *ddev;
 	int ret;
 
@@ -582,7 +583,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	ddev->dev_private = priv;
 
 	priv->dev = dev;
-	priv->dss = omapdss_get_dss();
+	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
 	priv->dispc_ops = dispc_get_ops(priv->dss);
 
@@ -677,9 +678,6 @@ static int pdev_probe(struct platform_device *pdev)
 	struct omap_drm_private *priv;
 	int ret;
 
-	if (omapdss_is_initialized() == false)
-		return -EPROBE_DEFER;
-
 	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the DMA mask\n");
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
