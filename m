Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80417A9D3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 17:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EA36EBE3;
	Thu,  5 Mar 2020 16:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37D6EBE3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 16:00:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5630B15F;
 Thu,  5 Mar 2020 16:00:19 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jingoohan1@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com
Subject: [PATCH 18/22] drm/vc4: Use simple encoder
Date: Thu,  5 Mar 2020 16:59:46 +0100
Message-Id: <20200305155950.2705-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4 driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_dpi.c  |  8 ++------
 drivers/gpu/drm/vc4/vc4_dsi.c  | 15 +++------------
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++-------------
 drivers/gpu/drm/vc4/vc4_vec.c  |  8 ++------
 4 files changed, 11 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 6dfede03396e..a90f2545baee 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -17,6 +17,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_graph.h>
@@ -114,10 +115,6 @@ static const struct debugfs_reg32 dpi_regs[] = {
 	VC4_REG32(DPI_ID),
 };
 
-static const struct drm_encoder_funcs vc4_dpi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 {
 	struct vc4_dpi_encoder *vc4_encoder = to_vc4_dpi_encoder(encoder);
@@ -309,8 +306,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_encoder_init(drm, dpi->encoder, &vc4_dpi_encoder_funcs,
-			 DRM_MODE_ENCODER_DPI, NULL);
+	drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index d99b1d526651..eaf276978ee7 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -37,6 +37,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
@@ -652,15 +653,6 @@ static const struct debugfs_reg32 dsi1_regs[] = {
 	VC4_REG32(DSI1_ID),
 };
 
-static void vc4_dsi_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs vc4_dsi_encoder_funcs = {
-	.destroy = vc4_dsi_encoder_destroy,
-};
-
 static void vc4_dsi_latch_ulps(struct vc4_dsi *dsi, bool latch)
 {
 	u32 afec0 = DSI_PORT_READ(PHY_AFEC0);
@@ -1615,8 +1607,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (dsi->port == 1)
 		vc4->dsi1 = dsi;
 
-	drm_encoder_init(drm, dsi->encoder, &vc4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, NULL);
+	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
@@ -1656,7 +1647,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
-	vc4_dsi_encoder_destroy(dsi->encoder);
+	drm_encoder_cleanup(dsi->encoder);
 
 	if (dsi->port == 1)
 		vc4->dsi1 = NULL;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cea18dc15f77..8f956156eb8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -34,6 +34,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/i2c.h>
@@ -306,15 +307,6 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 	return connector;
 }
 
-static void vc4_hdmi_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs vc4_hdmi_encoder_funcs = {
-	.destroy = vc4_hdmi_encoder_destroy,
-};
-
 static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 				enum hdmi_infoframe_type type)
 {
@@ -1394,8 +1386,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 	pm_runtime_enable(dev);
 
-	drm_encoder_init(drm, hdmi->encoder, &vc4_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, hdmi->encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	hdmi->connector =
@@ -1453,7 +1444,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_connector_destroy(hdmi->connector);
 #endif
 err_destroy_encoder:
-	vc4_hdmi_encoder_destroy(hdmi->encoder);
+	drm_encoder_cleanup(hdmi->encoder);
 err_unprepare_hsm:
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
@@ -1472,7 +1463,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 
 	cec_unregister_adapter(hdmi->cec_adap);
 	vc4_hdmi_connector_destroy(hdmi->connector);
-	vc4_hdmi_encoder_destroy(hdmi->encoder);
+	drm_encoder_cleanup(hdmi->encoder);
 
 	clk_disable_unprepare(hdmi->hsm_clock);
 	pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 7402bc768664..bd5b8eb58b18 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_graph.h>
@@ -374,10 +375,6 @@ static struct drm_connector *vc4_vec_connector_init(struct drm_device *dev,
 	return connector;
 }
 
-static const struct drm_encoder_funcs vc4_vec_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static void vc4_vec_encoder_disable(struct drm_encoder *encoder)
 {
 	struct vc4_vec_encoder *vc4_vec_encoder = to_vc4_vec_encoder(encoder);
@@ -566,8 +563,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_encoder_init(drm, vec->encoder, &vc4_vec_encoder_funcs,
-			 DRM_MODE_ENCODER_TVDAC, NULL);
+	drm_simple_encoder_init(drm, vec->encoder, DRM_MODE_ENCODER_TVDAC);
 	drm_encoder_helper_add(vec->encoder, &vc4_vec_encoder_helper_funcs);
 
 	vec->connector = vc4_vec_connector_init(drm, vec);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
