Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0B16BC6B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2D6EA46;
	Tue, 25 Feb 2020 08:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414A16E9B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 31017293602
Received: by earth.universe (Postfix, from userid 1000)
 id 8FDDE3C0CAE; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 43/56] drm/omap: bind components with drm_device argument
Date: Tue, 25 Feb 2020 00:21:13 +0100
Message-Id: <20200224232126.3385250-44-sebastian.reichel@collabora.com>
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

This fixes the omapdrm driver to call component_bind_all()
with drm_device as data argument as recommended in the
DRM component helper usage text.

After this patch DRM functionality can be implemented directly
in the components resulting in a simpler driver stack by removing
one layer of abstraction.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.c     | 27 +++++++++++++++++----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 +++
 drivers/gpu/drm/omapdrm/omap_drv.c    | 15 +++++++++++----
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 4438947326ea..a0b37d9b62ea 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1301,26 +1301,35 @@ static const struct soc_device_attribute dss_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
+int dss_bind_components(struct dss_device *dss, struct drm_device *drm_dev)
+{
+	struct platform_device *pdev = dss->pdev;
+
+	return component_bind_all(&pdev->dev, drm_dev);
+}
+EXPORT_SYMBOL(dss_bind_components);
+
+void dss_unbind_components(struct dss_device *dss, struct drm_device *drm_dev)
+{
+	struct platform_device *pdev = dss->pdev;
+
+	component_unbind_all(&pdev->dev, drm_dev);
+}
+EXPORT_SYMBOL(dss_unbind_components);
+
 static int dss_bind(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
 	struct dss_pdata pdata;
-	int r;
-
-	r = component_bind_all(dev, NULL);
-	if (r)
-		return r;
 
 	pm_set_vt_switch(0);
 
 	pdata.dss = dss;
 	drm_pdev = platform_device_register_data(NULL, "omapdrm", 0,
 						 &pdata, sizeof(pdata));
-	if (IS_ERR(drm_pdev)) {
-		component_unbind_all(dev, NULL);
+	if (IS_ERR(drm_pdev))
 		return PTR_ERR(drm_pdev);
-	}
 
 	dss->drm_pdev = drm_pdev;
 
@@ -1332,8 +1341,6 @@ static void dss_unbind(struct device *dev)
 	struct dss_device *dss = dev_get_drvdata(dev);
 
 	platform_device_unregister(dss->drm_pdev);
-
-	component_unbind_all(dev, NULL);
 }
 
 static const struct component_master_ops dss_component_ops = {
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 9f8aefaadefe..45f5c46712eb 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -526,4 +526,7 @@ const struct dispc_ops *dispc_get_ops(struct dss_device *dss);
 bool omapdss_stack_is_ready(void);
 void omapdss_gather_components(struct device *dev);
 
+int dss_bind_components(struct dss_device *dss, struct drm_device *drm_dev);
+void dss_unbind_components(struct dss_device *dss, struct drm_device *drm_dev);
+
 #endif /* __OMAP_DRM_DSS_H */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 579f9d80fec9..c47e63e94a2e 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -237,8 +237,6 @@ static int omap_modeset_init(struct drm_device *dev)
 	if (!omapdss_stack_is_ready())
 		return -EPROBE_DEFER;
 
-	drm_mode_config_init(dev);
-
 	ret = omap_modeset_init_properties(dev);
 	if (ret < 0)
 		return ret;
@@ -605,10 +603,15 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	ddev = drm_dev_alloc(&omap_drm_driver, dev);
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
-
-	priv->ddev = ddev;
 	ddev->dev_private = priv;
 
+	drm_mode_config_init(ddev);
+
+	ret = dss_bind_components(pdata->dss, ddev);
+	if (ret)
+		goto err_ddev_deinit;
+
+	priv->ddev = ddev;
 	priv->dev = dev;
 	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
@@ -673,6 +676,8 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	destroy_workqueue(priv->wq);
 	omap_disconnect_pipelines(ddev);
 	omap_crtc_pre_uninit(priv);
+	dss_unbind_components(priv->dss, ddev);
+err_ddev_deinit:
 	drm_dev_put(ddev);
 	return ret;
 }
@@ -700,6 +705,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 	omap_disconnect_pipelines(ddev);
 	omap_crtc_pre_uninit(priv);
 
+	dss_unbind_components(priv->dss, ddev);
+
 	drm_dev_put(ddev);
 }
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
