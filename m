Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D979160697
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01CB6E4D7;
	Sun, 16 Feb 2020 21:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871F86E4BB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:11 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62163126B;
 Sun, 16 Feb 2020 22:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887047;
 bh=1xJ2A/SX3GXMgBPIGfK/uvgqiPa4qkC8lGCKhikZZTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F3Of/+QLUCkSIqN0Zm+ILP9U+kR5jJq3b+AAntKhyHCMfnYxleMgJPGoi8i9NCcUd
 L1XTucXo+VqKyOZ0pUtGBofRLO6PLK83lY4ZyQGdaflGWU8uPj5hx2ctsiGSRiqmbF
 pqj9tTIlEgk4GQaIWTe8/0DtI4w7iD4uaWMQrU5E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 43/51] drm/omap: dpi: Reorder functions in sections
Date: Sun, 16 Feb 2020 23:03:00 +0200
Message-Id: <20200216210308.17312-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Group functions based on their purpose and split them in sections to
make the source code easier to navigate.

No functional change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 146 ++++++++++++++++--------------
 1 file changed, 79 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index f8354271ce6f..dccf81e4ce64 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -48,6 +48,10 @@ static struct dpi_data *dpi_get_data_from_dssdev(struct omap_dss_device *dssdev)
 	return container_of(dssdev, struct dpi_data, output);
 }
 
+/* -----------------------------------------------------------------------------
+ * Clock Handling and PLL
+ */
+
 static enum dss_clk_source dpi_get_clk_src_dra7xx(struct dpi_data *dpi,
 						  enum omap_channel channel)
 {
@@ -366,6 +370,62 @@ static void dpi_config_lcd_manager(struct dpi_data *dpi)
 	dss_mgr_set_lcd_config(&dpi->output, &dpi->mgr_config);
 }
 
+static int dpi_verify_pll(struct dss_pll *pll)
+{
+	int r;
+
+	/* do initial setup with the PLL to see if it is operational */
+
+	r = dss_pll_enable(pll);
+	if (r)
+		return r;
+
+	dss_pll_disable(pll);
+
+	return 0;
+}
+
+static void dpi_init_pll(struct dpi_data *dpi)
+{
+	struct dss_pll *pll;
+
+	if (dpi->pll)
+		return;
+
+	dpi->clk_src = dpi_get_clk_src(dpi);
+
+	pll = dss_pll_find_by_src(dpi->dss, dpi->clk_src);
+	if (!pll)
+		return;
+
+	if (dpi_verify_pll(pll)) {
+		DSSWARN("PLL not operational\n");
+		return;
+	}
+
+	dpi->pll = pll;
+}
+
+/* -----------------------------------------------------------------------------
+ * omap_dss_device Operations
+ */
+
+static int dpi_connect(struct omap_dss_device *src,
+		       struct omap_dss_device *dst)
+{
+	struct dpi_data *dpi = dpi_get_data_from_dssdev(dst);
+
+	dpi_init_pll(dpi);
+
+	return omapdss_device_connect(dst->dss, dst, dst->next);
+}
+
+static void dpi_disconnect(struct omap_dss_device *src,
+			   struct omap_dss_device *dst)
+{
+	omapdss_device_disconnect(dst, dst->next);
+}
+
 static void dpi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
@@ -446,20 +506,6 @@ static void dpi_display_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&dpi->lock);
 }
 
-static void dpi_set_timings(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode)
-{
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
-
-	DSSDBG("dpi_set_timings\n");
-
-	mutex_lock(&dpi->lock);
-
-	dpi->pixelclock = mode->clock * 1000;
-
-	mutex_unlock(&dpi->lock);
-}
-
 static int dpi_check_timings(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode)
 {
@@ -500,41 +546,30 @@ static int dpi_check_timings(struct omap_dss_device *dssdev,
 	return 0;
 }
 
-static int dpi_verify_pll(struct dss_pll *pll)
+static void dpi_set_timings(struct omap_dss_device *dssdev,
+			    const struct drm_display_mode *mode)
 {
-	int r;
+	struct dpi_data *dpi = dpi_get_data_from_dssdev(dssdev);
 
-	/* do initial setup with the PLL to see if it is operational */
+	DSSDBG("dpi_set_timings\n");
 
-	r = dss_pll_enable(pll);
-	if (r)
-		return r;
+	mutex_lock(&dpi->lock);
 
-	dss_pll_disable(pll);
+	dpi->pixelclock = mode->clock * 1000;
 
-	return 0;
+	mutex_unlock(&dpi->lock);
 }
 
-static void dpi_init_pll(struct dpi_data *dpi)
-{
-	struct dss_pll *pll;
-
-	if (dpi->pll)
-		return;
-
-	dpi->clk_src = dpi_get_clk_src(dpi);
-
-	pll = dss_pll_find_by_src(dpi->dss, dpi->clk_src);
-	if (!pll)
-		return;
+static const struct omap_dss_device_ops dpi_ops = {
+	.connect = dpi_connect,
+	.disconnect = dpi_disconnect,
 
-	if (dpi_verify_pll(pll)) {
-		DSSWARN("PLL not operational\n");
-		return;
-	}
+	.enable = dpi_display_enable,
+	.disable = dpi_display_disable,
 
-	dpi->pll = pll;
-}
+	.check_timings = dpi_check_timings,
+	.set_timings = dpi_set_timings,
+};
 
 /*
  * Return a hardcoded channel for the DPI output. This should work for
@@ -572,33 +607,6 @@ static enum omap_channel dpi_get_channel(struct dpi_data *dpi)
 	}
 }
 
-static int dpi_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
-{
-	struct dpi_data *dpi = dpi_get_data_from_dssdev(dst);
-
-	dpi_init_pll(dpi);
-
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void dpi_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
-static const struct omap_dss_device_ops dpi_ops = {
-	.connect = dpi_connect,
-	.disconnect = dpi_disconnect,
-
-	.enable = dpi_display_enable,
-	.disable = dpi_display_disable,
-
-	.check_timings = dpi_check_timings,
-	.set_timings = dpi_set_timings,
-};
-
 static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 {
 	struct omap_dss_device *out = &dpi->output;
@@ -647,6 +655,10 @@ static void dpi_uninit_output_port(struct device_node *port)
 	omapdss_device_cleanup_output(out);
 }
 
+/* -----------------------------------------------------------------------------
+ * Initialisation and Cleanup
+ */
+
 static const struct soc_device_attribute dpi_soc_devices[] = {
 	{ .machine = "OMAP3[456]*" },
 	{ .machine = "[AD]M37*" },
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
