Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF463158E8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53A589CC9;
	Tue,  9 Feb 2021 21:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 09 Feb 2021 21:20:21 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079FC6E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:20:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,166,1610406000"; d="scan'208";a="492125955"
Received: from palace.lip6.fr ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA;
 09 Feb 2021 22:13:10 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: use getter/setter functions
Date: Tue,  9 Feb 2021 22:13:04 +0100
Message-Id: <20210209211304.1261740-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 21:47:21 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jonas Karlman <jonas@kwiboo.se>, kernel-janitors@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use getter and setter functions, for platform_device structures and a
mipi_dsi_device structure.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             |    2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |    2 +-
 drivers/gpu/drm/panel/panel-lvds.c                  |    2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         |    4 ++--
 drivers/gpu/drm/panel/panel-simple.c                |    2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c            |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..9858079f9e14 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4800,7 +4800,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 
 	err = mipi_dsi_attach(dsi);
 	if (err) {
-		struct panel_simple *panel = dev_get_drvdata(&dsi->dev);
+		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
 
 		drm_panel_remove(&panel->base);
 	}
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 0ee508576231..3939b25e6666 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -267,7 +267,7 @@ static int seiko_panel_probe(struct device *dev,
 
 static int seiko_panel_remove(struct platform_device *pdev)
 {
-	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
+	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
 	drm_panel_disable(&panel->base);
@@ -277,7 +277,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
 
 static void seiko_panel_shutdown(struct platform_device *pdev)
 {
-	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
+	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_disable(&panel->base);
 }
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 654bc52d9ff3..bd5ba10822c2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -725,7 +725,7 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 
 static int rockchip_lvds_remove(struct platform_device *pdev)
 {
-	struct rockchip_lvds *lvds = dev_get_drvdata(&pdev->dev);
+	struct rockchip_lvds *lvds = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &rockchip_lvds_component_ops);
 	clk_unprepare(lvds->pclk);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 457ec04950f7..c7707338bfdb 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -284,7 +284,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_set_drvdata(&pdev->dev, priv);
+	platform_set_drvdata(pdev, priv);
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d0c65610ebb5..989a05bc8197 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2457,7 +2457,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 static int cdns_mhdp_remove(struct platform_device *pdev)
 {
-	struct cdns_mhdp_device *mhdp = dev_get_drvdata(&pdev->dev);
+	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
 	unsigned long timeout = msecs_to_jiffies(100);
 	bool stop_fw = false;
 	int ret;
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 66c7d765b8f7..59a8d99e777d 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -244,7 +244,7 @@ static int panel_lvds_probe(struct platform_device *pdev)
 
 static int panel_lvds_remove(struct platform_device *pdev)
 {
-	struct panel_lvds *lvds = dev_get_drvdata(&pdev->dev);
+	struct panel_lvds *lvds = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&lvds->panel);
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
