Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00841E18EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B989F3C;
	Tue, 26 May 2020 01:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37F689E5A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:49 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A4421C77;
 Tue, 26 May 2020 03:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455747;
 bh=A3wvAQ1/fmCJ/WxNEpmFu/Z515r4c8m3BRuPMd5cR18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kWOUn7skoGDq5C9dnqJ4p527+8N61Y7Njym/nblesEuwTGiwp8T+2/IJqf3HdOrvO
 JNMur+bL8tUo+zQQ0Yfba673nziwnEPI+vIgSZg1zr0FFQbBcVQxVHRoLXAli9rbsY
 t9lQOPWUbmb8ox3Dy9fkWWxcy/L96/+/klyp9Fd0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if available
Date: Tue, 26 May 2020 04:15:01 +0300
Message-Id: <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
require a video output port connected to an HDMI sink (most likely an
HDMI connector, in rare cases another bridges converting HDMI to another
protocol). For those platforms, retrieve the next bridge and attach it
from the dw-hdmi bridge attach handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
 include/drm/bridge/dw_hdmi.h              |  2 +
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6148a022569a..512e67bb1c32 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
 struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	unsigned int version;
 
@@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return 0;
+		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+					 bridge, flags);
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
 		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 }
 
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
+		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
+		 * binding doesn't make the output port mandatory.
+		 */
+		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
+			hdmi->plat_data->output_port);
+		return 0;
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
 static struct dw_hdmi *
 __dw_hdmi_probe(struct platform_device *pdev,
 		const struct dw_hdmi_plat_data *plat_data)
@@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
index ea34ca146b82..8ebeb65d6371 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
