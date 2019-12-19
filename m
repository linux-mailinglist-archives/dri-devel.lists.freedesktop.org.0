Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C1125FBE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348FB6EB2F;
	Thu, 19 Dec 2019 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A506EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:55 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49955134B;
 Thu, 19 Dec 2019 11:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752353;
 bh=09X1p2b4wFlWTcwqnjMacDVw3nkWBvrNdXQY5w5jIFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=skRzc8jXGBeR0ksaSBYuXcq9xwL418RWN5XWS669YzbWDZtKsSEuB+Yf9NNyJHhxF
 uUYDF4/pCmedH3Nxj45VNNFgXbnjvE8mg6BDkEYXoFD5KBBYDMl/jKy5pl5pcVrl2l
 jNngQPyYITuQ/ROuasYQyEx6orhOU4Cfmns0Lw1Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/51] drm/omap: dss: Cleanup DSS ports on initialisation
 failure
Date: Thu, 19 Dec 2019 12:44:49 +0200
Message-Id: <20191219104522.9379-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the DSS initialises its output DPI and SDI ports, failures don't
clean up previous successfully initialised ports. This can lead to
resource leak or memory corruption. Fix it.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 43 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 225ec808b01a..67b92b5d8dd7 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1151,46 +1151,38 @@ static const struct dss_features dra7xx_dss_feats = {
 	.has_lcd_clk_src	=	true,
 };
 
-static int dss_init_ports(struct dss_device *dss)
+static void __dss_uninit_ports(struct dss_device *dss, unsigned int num_ports)
 {
 	struct platform_device *pdev = dss->pdev;
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
 	unsigned int i;
-	int r;
 
-	for (i = 0; i < dss->feat->num_ports; i++) {
+	for (i = 0; i < num_ports; i++) {
 		port = of_graph_get_port_by_id(parent, i);
 		if (!port)
 			continue;
 
 		switch (dss->feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
-			r = dpi_init_port(dss, pdev, port, dss->feat->model);
-			if (r)
-				return r;
+			dpi_uninit_port(port);
 			break;
-
 		case OMAP_DISPLAY_TYPE_SDI:
-			r = sdi_init_port(dss, pdev, port);
-			if (r)
-				return r;
+			sdi_uninit_port(port);
 			break;
-
 		default:
 			break;
 		}
 	}
-
-	return 0;
 }
 
-static void dss_uninit_ports(struct dss_device *dss)
+static int dss_init_ports(struct dss_device *dss)
 {
 	struct platform_device *pdev = dss->pdev;
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
-	int i;
+	unsigned int i;
+	int r;
 
 	for (i = 0; i < dss->feat->num_ports; i++) {
 		port = of_graph_get_port_by_id(parent, i);
@@ -1199,15 +1191,32 @@ static void dss_uninit_ports(struct dss_device *dss)
 
 		switch (dss->feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
-			dpi_uninit_port(port);
+			r = dpi_init_port(dss, pdev, port, dss->feat->model);
+			if (r)
+				goto error;
 			break;
+
 		case OMAP_DISPLAY_TYPE_SDI:
-			sdi_uninit_port(port);
+			r = sdi_init_port(dss, pdev, port);
+			if (r)
+				goto error;
 			break;
+
 		default:
 			break;
 		}
 	}
+
+	return 0;
+
+error:
+	__dss_uninit_ports(dss, i);
+	return r;
+}
+
+static void dss_uninit_ports(struct dss_device *dss)
+{
+	__dss_uninit_ports(dss, dss->feat->num_ports);
 }
 
 static int dss_video_pll_probe(struct dss_device *dss)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
