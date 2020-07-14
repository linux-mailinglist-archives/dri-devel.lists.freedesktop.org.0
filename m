Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2F21FF3A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA9D6E9BF;
	Tue, 14 Jul 2020 20:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59286E9B8;
 Tue, 14 Jul 2020 20:58:35 +0000 (UTC)
IronPort-SDR: GibKlfmZa4MlAtlk7iuiVNKBj9MlccBCMYOWoegpKXwMo1Wpjd5piVDuUqhPsibqw2pKc1/5dg
 czLPzqkKC+aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444582"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:35 -0700
IronPort-SDR: wVadLG5etW36pFkk5VUTjqBHF1jTeLdxz9LPn4KfH6hbvnKrCm1JPs4tQ/5G3TGpGyJ+f+UkWR
 ocMUrW24k44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504194"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:34 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 32/59] drm/kmb: Revert dsi_host back to a static variable
Date: Tue, 14 Jul 2020 13:57:18 -0700
Message-Id: <1594760265-11618-33-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Edmund Dea <edmund.j.dea@intel.com>

revert dsi_host to static and instead add dsi_host_unregister.

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 6 +++---
 drivers/gpu/drm/kmb/kmb_drv.h | 1 -
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 drivers/gpu/drm/kmb/kmb_dsi.h | 1 +
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 25daba7..1368770 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -379,7 +379,7 @@ static void kmb_drm_unload(struct device *dev)
 	dev_set_drvdata(dev, NULL);
 
 	/* Unregister DSI host */
-	mipi_dsi_host_unregister(dsi_host);
+	dsi_host_unregister();
 }
 
 static int kmb_probe(struct platform_device *pdev)
@@ -420,7 +420,7 @@ static int kmb_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, drm);
 
 	kmb_setup_mode_config(drm);
-	dev_set_drvdata(dev, drm);
+		dev_set_drvdata(dev, drm);
 
 	/* Load driver */
 	ret = kmb_load(drm, 0);
@@ -461,7 +461,7 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
-	mipi_dsi_host_unregister(dsi_host);
+	dsi_host_unregister();
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 54780ec..1150505 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -11,7 +11,6 @@
 #define KMB_MAX_WIDTH			16384	/*max width in pixels */
 #define KMB_MAX_HEIGHT			16384	/*max height in pixels */
 
-extern struct mipi_dsi_host *dsi_host;
 struct kmb_drm_private {
 	struct drm_device		drm;
 	void __iomem			*lcd_mmio;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 70bb231..4ec1753 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -59,7 +59,7 @@
 #define PLL_M_MAX	623
 #define PLL_FVCO_MAX	1250
 
-struct mipi_dsi_host *dsi_host;
+static struct mipi_dsi_host *dsi_host;
 static struct mipi_dsi_device *dsi_device;
 
 /*
@@ -337,8 +337,13 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 	return bridge;
 }
 
+void dsi_host_unregister(void)
+{
+	mipi_dsi_host_unregister(dsi_host);
+}
+
 u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
-			     struct mipi_data_type_params *params)
+		struct mipi_data_type_params *params)
 {
 	struct mipi_data_type_params data_type_parameters;
 
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index e9bcc7e..811f3b8 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -313,6 +313,7 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
 int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
+void dsi_host_unregister(void);
 
 #define to_kmb_connector(x) container_of(x, struct kmb_connector, base)
 #define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
