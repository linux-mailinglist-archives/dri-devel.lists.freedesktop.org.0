Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4624E20FF08
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16396E46B;
	Tue, 30 Jun 2020 21:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E756E353;
 Tue, 30 Jun 2020 21:28:49 +0000 (UTC)
IronPort-SDR: 5vkz+fVHtM5peyshBUKfI2g+lLYTud1SKhwAFd7uARcKNEW1Q4j4azp5CYDmINQTYIodIn//Ii
 cvbVstOp773g==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846892"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:48 -0700
IronPort-SDR: QtZvHY7J8u8k8KnaLHAzt1uvIQ8h9cyL5UwM68JEzJG9xlqDEvUBSGog88M0za+QnMisy82Js3
 kM+UJggdoeIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066745"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:47 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 32/59] drm/kmb: Revert dsi_host back to a static variable
Date: Tue, 30 Jun 2020 14:27:44 -0700
Message-Id: <1593552491-23698-33-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
index f520ca9..0588bd0 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -398,7 +398,7 @@ static void kmb_drm_unload(struct device *dev)
 	dev_set_drvdata(dev, NULL);
 
 	/* Unregister DSI host */
-	mipi_dsi_host_unregister(dsi_host);
+	dsi_host_unregister();
 }
 
 static int kmb_probe(struct platform_device *pdev)
@@ -434,7 +434,7 @@ static int kmb_probe(struct platform_device *pdev)
 
 	drm->dev_private = lcd;
 	kmb_setup_mode_config(drm);
-	dev_set_drvdata(dev, drm);
+		dev_set_drvdata(dev, drm);
 
 	/* Load driver */
 	ret = kmb_load(drm, 0);
@@ -475,7 +475,7 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
-	mipi_dsi_host_unregister(dsi_host);
+	dsi_host_unregister();
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index c87e608..6c1d687 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -31,7 +31,6 @@
 #define KMB_MAX_WIDTH			16384	/*max width in pixels */
 #define KMB_MAX_HEIGHT			16384	/*max height in pixels */
 
-extern struct mipi_dsi_host *dsi_host;
 struct kmb_drm_private {
 	struct drm_device		drm;
 	void __iomem			*lcd_mmio;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5adc7c..af04eb9 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -79,7 +79,7 @@
 #define PLL_M_MAX	623
 #define PLL_FVCO_MAX	1250
 
-struct mipi_dsi_host *dsi_host;
+static struct mipi_dsi_host *dsi_host;
 static struct mipi_dsi_device *dsi_device;
 
 /*
@@ -357,8 +357,13 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
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
index cf234db..e85625b 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -333,6 +333,7 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
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
