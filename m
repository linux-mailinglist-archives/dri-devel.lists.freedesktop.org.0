Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D83125FBD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7D6EB29;
	Thu, 19 Dec 2019 10:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEE6EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:03 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E4021529;
 Thu, 19 Dec 2019 11:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752359;
 bh=AOT/LPtn8mmlLVe8bzdy9tnswNORoAxTFtBZ8tyczck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMyxPM/oB7WwZo2RP9c34grrr+yR6uSPjEP/rrC7OBsg/OiA6HjAibKKxdZpExRK6
 2W8FOQcuZJnvNFTEimq1pbTbXjgPxd1CUd/TzSo8TS5Ar64WIb+xaWupelXI3UYh8I
 efZgk3K1qRZgy7rXHi1os6SjdOHrLBKYpXpwAzyM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 28/51] drm/omap: hdmi4: Register a drm_bridge for EDID read
Date: Thu, 19 Dec 2019 12:44:59 +0200
Message-Id: <20191219104522.9379-29-laurent.pinchart@ideasonboard.com>
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

In order to integrate with a chain of drm_bridge, the internal HDMI4
encoder has to expose the EDID read operation through the drm_bridge
API. Register a bridge at initialisation time to do so.

For the time being make the next bridge in the chain optional as the
HDMI output is still based on omap_dss_device. The create_connector
argument to the bridge attach function is also ignored for the same
reason. This will be changed later when removing the related
omapdrm-specific display drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v2:

- Unregister bridge if output initialisation fails
---
 drivers/gpu/drm/omapdrm/dss/hdmi.h  |  3 ++
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 78 ++++++++++++++++++++++++++---
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi.h b/drivers/gpu/drm/omapdrm/dss/hdmi.h
index c867552c925c..bd43f6abf27b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi.h
@@ -14,6 +14,7 @@
 #include <linux/hdmi.h>
 #include <sound/omap-hdmi-audio.h>
 #include <media/cec.h>
+#include <drm/drm_bridge.h>
 
 #include "omapdss.h"
 #include "dss.h"
@@ -364,6 +365,7 @@ struct omap_hdmi {
 	bool core_enabled;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 
 	struct platform_device *audio_pdev;
 	void (*audio_abort_cb)(struct device *dev);
@@ -379,5 +381,6 @@ struct omap_hdmi {
 };
 
 #define dssdev_to_hdmi(dssdev) container_of(dssdev, struct omap_hdmi, output)
+#define drm_bridge_to_hdmi(b) container_of(b, struct omap_hdmi, bridge)
 
 #endif
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 37536b9f3114..67994287447b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -390,7 +390,8 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 
 #define MAX_EDID	512
 
-static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi)
+static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi,
+					struct drm_connector *connector)
 {
 	u8 *edid;
 	int r;
@@ -428,9 +429,12 @@ static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi)
 	return NULL;
 }
 
-static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+static struct edid *
+hdmi_do_read_edid(struct omap_hdmi *hdmi,
+		  struct edid *(*read)(struct omap_hdmi *hdmi,
+				       struct drm_connector *connector),
+		  struct drm_connector *connector)
 {
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
 	struct edid *edid = NULL;
 	unsigned int cec_addr;
 	bool need_enable;
@@ -452,7 +456,7 @@ static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 	if (r)
 		goto done;
 
-	edid = hdmi_read_edid_data(hdmi);
+	edid = read(hdmi, connector);
 
 done:
 	hdmi_runtime_put(hdmi);
@@ -474,6 +478,12 @@ static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 	return edid;
 }
 
+static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+{
+	return hdmi_do_read_edid(dssdev_to_hdmi(dssdev), hdmi_read_edid_data,
+				 NULL);
+}
+
 static void hdmi_lost_hotplug(struct omap_dss_device *dssdev)
 {
 	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
@@ -517,6 +527,56 @@ static const struct omap_dss_device_ops hdmi_ops = {
 	},
 };
 
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
+static int hdmi4_bridge_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	if (!hdmi->output.next_bridge)
+		return 0;
+
+	return drm_bridge_attach(bridge->encoder, hdmi->output.next_bridge,
+				 bridge, flags);
+}
+
+static struct edid *hdmi4_bridge_read_edid(struct omap_hdmi *hdmi,
+					   struct drm_connector *connector)
+{
+	return drm_do_get_edid(connector, hdmi4_core_ddc_read, &hdmi->core);
+}
+
+static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	return hdmi_do_read_edid(hdmi, hdmi4_bridge_read_edid, connector);
+}
+
+static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
+	.attach = hdmi4_bridge_attach,
+	.get_edid = hdmi4_bridge_get_edid,
+};
+
+static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
+{
+	hdmi->bridge.funcs = &hdmi4_bridge_funcs;
+	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	drm_bridge_add(&hdmi->bridge);
+}
+
+static void hdmi4_bridge_cleanup(struct omap_hdmi *hdmi)
+{
+	drm_bridge_remove(&hdmi->bridge);
+}
+
 /* -----------------------------------------------------------------------------
  * Audio Callbacks
  */
@@ -708,6 +768,8 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	struct omap_dss_device *out = &hdmi->output;
 	int r;
 
+	hdmi4_bridge_init(hdmi);
+
 	out->dev = &hdmi->pdev->dev;
 	out->id = OMAP_DSS_OUTPUT_HDMI;
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
@@ -718,9 +780,11 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &hdmi->bridge);
+	if (r < 0) {
+		hdmi4_bridge_cleanup(hdmi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -733,6 +797,8 @@ static void hdmi4_uninit_output(struct omap_hdmi *hdmi)
 
 	omapdss_device_unregister(out);
 	omapdss_device_cleanup_output(out);
+
+	hdmi4_bridge_cleanup(hdmi);
 }
 
 static int hdmi4_probe_of(struct omap_hdmi *hdmi)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
