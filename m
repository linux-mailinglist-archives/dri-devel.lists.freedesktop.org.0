Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B668E119ECB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0E6E9FB;
	Tue, 10 Dec 2019 22:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9646E9EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:25 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84BE1197E;
 Tue, 10 Dec 2019 23:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018703;
 bh=kVjlhhOUpXAkQci0mTd1JsLu7BAzYxcK+cKFP+9KC6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDGqeYF24AOpLBADVfm+/v7x12Vjzo2nU8zd5DbDzip4mUehz90yP65Res6bgpisN
 NHOIOlo9jEC3z31fWz46K0jwQUgMAXTnya0ro5EwHNtDFFT+dJzvjfXmbeuEguE3J6
 +t6lFJYGu9zhW7Nahokd8+z3r+mct3ZtimmQNyVY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 22/50] drm/omap: dss: Fix output next device lookup in DT
Date: Wed, 11 Dec 2019 00:57:22 +0200
Message-Id: <20191210225750.15709-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSS core looks up the next device connected to an output by
traversing the OF graph. It currently hardcodes the local port number to
0, which breaks any output with a different port number (SDI on OMAP3
and any DPI output but the first one). Fix this by repurposing the
currently unused of_ports bitmask in omap_dss_device with an of_port
output port number, and use it to traverse the OF graph.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c | 2 +-
 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c      | 2 +-
 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c      | 2 +-
 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c   | 2 +-
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c        | 2 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                      | 2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                      | 2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                    | 2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                    | 2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h                  | 4 ++--
 drivers/gpu/drm/omapdrm/dss/output.c                   | 3 +--
 drivers/gpu/drm/omapdrm/dss/sdi.c                      | 2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                     | 2 +-
 13 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c b/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
index 0d20fab605d7..f36aa1885d39 100644
--- a/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
+++ b/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
@@ -55,7 +55,7 @@ static int tvc_probe(struct platform_device *pdev)
 	dssdev->type = OMAP_DISPLAY_TYPE_VENC;
 	dssdev->display = true;
 	dssdev->owner = THIS_MODULE;
-	dssdev->of_ports = BIT(0);
+	dssdev->of_port = 0;
 
 	omapdss_display_init(dssdev);
 	omapdss_device_register(dssdev);
diff --git a/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c b/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
index f5d69d810bb8..37c212491cd3 100644
--- a/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
+++ b/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
@@ -139,7 +139,7 @@ static int hdmic_probe(struct platform_device *pdev)
 	dssdev->type = OMAP_DISPLAY_TYPE_HDMI;
 	dssdev->display = true;
 	dssdev->owner = THIS_MODULE;
-	dssdev->of_ports = BIT(0);
+	dssdev->of_port = 0;
 	dssdev->ops_flags = ddata->hpd_gpio
 			  ? OMAP_DSS_DEVICE_OP_DETECT | OMAP_DSS_DEVICE_OP_HPD
 			  : 0;
diff --git a/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c b/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
index b992387ed674..252705222ef1 100644
--- a/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
+++ b/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
@@ -86,7 +86,7 @@ static int opa362_probe(struct platform_device *pdev)
 	dssdev->dev = &pdev->dev;
 	dssdev->type = OMAP_DISPLAY_TYPE_VENC;
 	dssdev->owner = THIS_MODULE;
-	dssdev->of_ports = BIT(1) | BIT(0);
+	dssdev->of_port = 1;
 
 	dssdev->next = omapdss_of_find_connected_device(pdev->dev.of_node, 1);
 	if (IS_ERR(dssdev->next)) {
diff --git a/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c b/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
index 089105c5aa0a..857ae84cd7d1 100644
--- a/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
+++ b/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
@@ -165,7 +165,7 @@ static int tpd_probe(struct platform_device *pdev)
 	dssdev->dev = &pdev->dev;
 	dssdev->type = OMAP_DISPLAY_TYPE_HDMI;
 	dssdev->owner = THIS_MODULE;
-	dssdev->of_ports = BIT(1) | BIT(0);
+	dssdev->of_port = 1;
 	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_DETECT
 			  | OMAP_DSS_DEVICE_OP_HPD;
 
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 564e3e1a1891..939ea0578f6a 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -1265,7 +1265,7 @@ static int dsicm_probe(struct platform_device *pdev)
 	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
 	dssdev->display = true;
 	dssdev->owner = THIS_MODULE;
-	dssdev->of_ports = BIT(0);
+	dssdev->of_port = 0;
 	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
 	dssdev->caps = OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 95147437b990..462ed6f3118a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -625,7 +625,7 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	out->id = OMAP_DSS_OUTPUT_DPI;
 	out->type = OMAP_DISPLAY_TYPE_DPI;
 	out->dispc_channel = dpi_get_channel(dpi);
-	out->of_ports = BIT(port_num);
+	out->of_port = port_num;
 	out->ops = &dpi_ops;
 	out->owner = THIS_MODULE;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index da16ea095f13..6379eea124d1 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5116,7 +5116,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 	out->dispc_channel = dsi_get_channel(dsi);
 	out->ops = &dsi_ops;
 	out->owner = THIS_MODULE;
-	out->of_ports = BIT(0);
+	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
 		       | DRM_BUS_FLAG_DE_HIGH
 		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 0f557fad4513..44075718407b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -673,7 +673,7 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
 	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
-	out->of_ports = BIT(0);
+	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
 	r = omapdss_device_init_output(out);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index d9463b332554..1b5bd44ee09d 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -657,7 +657,7 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
 	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
-	out->of_ports = BIT(0);
+	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
 	r = omapdss_device_init_output(out);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index c5672e5174c5..b48a51d11310 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -436,8 +436,8 @@ struct omap_dss_device {
 	/* output instance */
 	enum omap_dss_output_id id;
 
-	/* bitmask of port numbers in DT */
-	unsigned int of_ports;
+	/* port number in DT */
+	unsigned int of_port;
 };
 
 struct omap_dss_driver {
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 99a253a424c1..c1ec9d343e53 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -4,7 +4,6 @@
  * Author: Archit Taneja <archit@ti.com>
  */
 
-#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -24,7 +23,7 @@ int omapdss_device_init_output(struct omap_dss_device *out)
 	int ret;
 
 	remote_node = of_graph_get_remote_node(out->dev->of_node,
-					       ffs(out->of_ports) - 1, 0);
+					       out->of_port, 0);
 	if (!remote_node) {
 		dev_dbg(out->dev, "failed to find video sink\n");
 		return 0;
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 3b447c01fa2a..9092ed3d0ef1 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -265,7 +265,7 @@ static int sdi_init_output(struct sdi_device *sdi)
 	out->name = "sdi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
 	/* We have SDI only on OMAP3, where it's on port 1 */
-	out->of_ports = BIT(1);
+	out->of_port = 1;
 	out->ops = &sdi_ops;
 	out->owner = THIS_MODULE;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 596a297d5813..e2f480f689b8 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -754,7 +754,7 @@ static int venc_init_output(struct venc_device *venc)
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
 	out->ops = &venc_ops;
 	out->owner = THIS_MODULE;
-	out->of_ports = BIT(0);
+	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
 	r = omapdss_device_init_output(out);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
