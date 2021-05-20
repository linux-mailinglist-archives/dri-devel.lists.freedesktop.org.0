Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A151389E47
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 08:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D266EEAE;
	Thu, 20 May 2021 06:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5236EEAD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 06:50:54 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FF3AD41;
 Thu, 20 May 2021 08:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621493453;
 bh=vSRVp1Sw6lrtgoMwUrvLyBrc/uM7bCRjftCbURz8V6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gmGfVziRNmqCPDTFtz0pARJMAW3hKNh0VFYVGomACnQXPw6k3cICMm1NKtTgE41z+
 2gp9zbPGRqy0d1ktn2ZBNgFiJd2USwpz3o/By+/cRaEfk8w1HkSrs5t70WQOPJguCw
 4AvX0DiRZ/Ale7B3Fwkbb7oVUsWz7pyXvdh+YBGA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm: bridge: dw-hdmi: Attach to next bridge if
 available
Date: Thu, 20 May 2021 09:50:43 +0300
Message-Id: <20210520065046.28978-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
require a video output port connected to an HDMI sink (most likely an
HDMI connector, in rare cases another bridges converting HDMI to another
protocol). For those platforms, retrieve the next bridge and attach it
from the dw-hdmi bridge attach handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:

- Make missing endpoint a fatal error
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 54 ++++++++++++++++++++++-
 include/drm/bridge/dw_hdmi.h              |  2 +
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e7c7c9b9c646..f9065ca4cd88 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
 struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	unsigned int version;
 
@@ -2775,7 +2776,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return 0;
+		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+					 bridge, flags);
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3160,6 +3162,52 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
 /* -----------------------------------------------------------------------------
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
+
+static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
+{
+	struct device_node *endpoint;
+	struct device_node *remote;
+
+	if (!hdmi->plat_data->output_port)
+		return 0;
+
+	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
+						 hdmi->plat_data->output_port,
+						 -1);
+	if (!endpoint) {
+		/*
+		 * On platforms whose bindings don't make the output port
+		 * mandatory (such as Rockchip) the plat_data->output_port
+		 * field isn't set, so it's safe to make this a fatal error.
+		 */
+		dev_err(hdmi->dev, "Missing endpoint in port@%u\n",
+			hdmi->plat_data->output_port);
+		return -ENODEV;
+	}
+
+	remote = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	if (!remote) {
+		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
+			hdmi->plat_data->output_port);
+		return -ENODEV;
+	}
+
+	if (!of_device_is_available(remote)) {
+		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
+			hdmi->plat_data->output_port);
+		of_node_put(remote);
+		return -ENODEV;
+	}
+
+	hdmi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
+	if (!hdmi->next_bridge)
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			      const struct dw_hdmi_plat_data *plat_data)
 {
@@ -3196,6 +3244,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
+	ret = dw_hdmi_parse_dt(hdmi);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a5716655619..2a1f85f9a8a3 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
+	unsigned int output_port;
+
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
 	bool ycbcr_420_allowed;
-- 
Regards,

Laurent Pinchart

