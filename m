Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105F3E3DAC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3989A0F;
	Mon,  9 Aug 2021 01:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F5D89954
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:18 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4846538D7;
 Mon,  9 Aug 2021 03:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472917;
 bh=MllS4pyyXzSQ22bSB/VPVtT/E5Q8s6niXrrVCsNG6vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LgiluoDWH8YcktMUcYWEXYKsTCbhD4zuLQK5ZS6PaRFlX/1w/Vea/zEvoiqY909I6
 /XVE11J/0UwGCdwghnH/gZqPiEuKcHIMC0HfrhKbNfqDib1H1sNOSva4rbQ8jGXwq3
 xEX9hlwU9RsVdQeIs6yoDqHA4t6P5GsmXH63+/as=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 31/36] drm: xlnx: zynqmp_dpsub: Parse DT to find connected
 ports
Date: Mon,  9 Aug 2021 04:34:52 +0300
Message-Id: <20210809013457.11266-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for live video input support, parse the device tree to find
the connected ports. Warn about unsupported configurations, and error
out when invalid.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 54 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 13 +++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index e6532a13fb78..bc2b3ab3001d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -141,6 +142,55 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 	return 0;
 }
 
+static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
+{
+	struct device_node *np;
+	unsigned int i;
+
+	/*
+	 * For backward compatibility with old device trees that don't contain
+	 * ports, consider that only the DP output port is connected if no
+	 * ports child no exists.
+	 */
+	np = of_get_child_by_name(dpsub->dev->of_node, "ports");
+	of_node_put(np);
+	if (!np) {
+		dev_warn(dpsub->dev, "missing ports, update DT bindings\n");
+		dpsub->connected_ports = BIT(ZYNQMP_DPSUB_PORT_OUT_DP);
+		return 0;
+	}
+
+	/* Check which ports are connected. */
+	for (i = 0; i < ZYNQMP_DPSUB_NUM_PORTS; ++i) {
+		struct device_node *np;
+
+		np = of_graph_get_remote_node(dpsub->dev->of_node, i, -1);
+		if (np) {
+			dpsub->connected_ports |= BIT(i);
+			of_node_put(np);
+		}
+	}
+
+	/* Sanity checks. */
+	if ((dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO)) ||
+	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX)))
+		dev_warn(dpsub->dev, "live video unsupported, ignoring\n");
+
+	if (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_AUDIO))
+		dev_warn(dpsub->dev, "live audio unsupported, ignoring\n");
+
+	if ((dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_OUT_VIDEO)) ||
+	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_OUT_AUDIO)))
+		dev_warn(dpsub->dev, "output to PL unsupported, ignoring\n");
+
+	if (!(dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_OUT_DP))) {
+		dev_err(dpsub->dev, "DP output port not connected\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub)
 {
 	kfree(dpsub->disp);
@@ -170,6 +220,10 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_mem;
 
+	ret = zynqmp_dpsub_parse_dt(dpsub);
+	if (ret < 0)
+		goto err_mem;
+
 	pm_runtime_enable(&pdev->dev);
 
 	/*
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 6c6029ad9bc5..6ded6e45ac0a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -22,6 +22,16 @@ struct zynqmp_dpsub_drm;
 
 #define ZYNQMP_DPSUB_NUM_LAYERS				2
 
+enum zynqmp_dpsub_port {
+	ZYNQMP_DPSUB_PORT_LIVE_VIDEO,
+	ZYNQMP_DPSUB_PORT_LIVE_GFX,
+	ZYNQMP_DPSUB_PORT_LIVE_AUDIO,
+	ZYNQMP_DPSUB_PORT_OUT_VIDEO,
+	ZYNQMP_DPSUB_PORT_OUT_AUDIO,
+	ZYNQMP_DPSUB_PORT_OUT_DP,
+	ZYNQMP_DPSUB_NUM_PORTS,
+};
+
 enum zynqmp_dpsub_format {
 	ZYNQMP_DPSUB_FORMAT_RGB,
 	ZYNQMP_DPSUB_FORMAT_YCRCB444,
@@ -37,6 +47,7 @@ enum zynqmp_dpsub_format {
  * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
  * @aud_clk: Audio clock
  * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
+ * @connected_ports: Bitmask of connected ports in the device tree
  * @drm: The DRM/KMS device data
  * @bridge: The DP encoder bridge
  * @disp: The display controller
@@ -52,6 +63,8 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
+	unsigned int connected_ports;
+
 	struct zynqmp_dpsub_drm *drm;
 	struct drm_bridge *bridge;
 
-- 
Regards,

Laurent Pinchart

