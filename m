Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDE125FC5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D481B6EB3B;
	Thu, 19 Dec 2019 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5796EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:04 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 905FF11B6;
 Thu, 19 Dec 2019 11:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752361;
 bh=lvm3kV8wzvbRmMiPszcCuinqQcT+OjFxmd1BV7ryoKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rzHfrE/ZAKMCfCYqhpOUEzBr4mR2uiOzPMsmtD0wEUHUG3qoSMzoNru/Atxi92hCS
 jI26pHI43DiG1Tkw25Nms7y5zqbJjjv+HRQpDAI/MPBmUwJkgT95/zAUu01JGrJxTl
 Wus8VSWENbvDxlaXCln8XWEYvKl3iejPPcLQeelM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 29/51] drm/omap: hdmi5: Register a drm_bridge for EDID read
Date: Thu, 19 Dec 2019 12:45:00 +0200
Message-Id: <20191219104522.9379-30-laurent.pinchart@ideasonboard.com>
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

In order to integrate with a chain of drm_bridge, the internal HDMI5
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
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 79 ++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 2b02b0a11696..e7fe2a24a3e1 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -388,8 +388,10 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 
 #define MAX_EDID	512
 
-static struct edid *hdmi_read_edid_data(struct hdmi_core_data *core)
+static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi,
+					struct drm_connector *connector)
 {
+	struct hdmi_core_data *core = &hdmi->core;
 	int max_ext_blocks = 3;
 	int r, n, i;
 	u8 *edid;
@@ -421,9 +423,12 @@ static struct edid *hdmi_read_edid_data(struct hdmi_core_data *core)
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
 	struct edid *edid;
 	bool need_enable;
 	int idlemode;
@@ -447,7 +452,7 @@ static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 
 	hdmi5_core_ddc_init(&hdmi->core);
 
-	edid = hdmi_read_edid_data(&hdmi->core);
+	edid = read(hdmi, connector);
 
 	hdmi5_core_ddc_uninit(&hdmi->core);
 
@@ -462,6 +467,12 @@ static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 	return (struct edid *)edid;
 }
 
+static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+{
+	return hdmi_do_read_edid(dssdev_to_hdmi(dssdev), hdmi_read_edid_data,
+				 NULL);
+}
+
 static int hdmi_set_infoframe(struct omap_dss_device *dssdev,
 		const struct hdmi_avi_infoframe *avi)
 {
@@ -497,6 +508,56 @@ static const struct omap_dss_device_ops hdmi_ops = {
 	},
 };
 
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
+static int hdmi5_bridge_attach(struct drm_bridge *bridge,
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
+static struct edid *hdmi5_bridge_read_edid(struct omap_hdmi *hdmi,
+					   struct drm_connector *connector)
+{
+	return drm_do_get_edid(connector, hdmi5_core_ddc_read, &hdmi->core);
+}
+
+static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	return hdmi_do_read_edid(hdmi, hdmi5_bridge_read_edid, connector);
+}
+
+static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
+	.attach = hdmi5_bridge_attach,
+	.get_edid = hdmi5_bridge_get_edid,
+};
+
+static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
+{
+	hdmi->bridge.funcs = &hdmi5_bridge_funcs;
+	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	drm_bridge_add(&hdmi->bridge);
+}
+
+static void hdmi5_bridge_cleanup(struct omap_hdmi *hdmi)
+{
+	drm_bridge_remove(&hdmi->bridge);
+}
+
 /* -----------------------------------------------------------------------------
  * Audio Callbacks
  */
@@ -679,6 +740,8 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	struct omap_dss_device *out = &hdmi->output;
 	int r;
 
+	hdmi5_bridge_init(hdmi);
+
 	out->dev = &hdmi->pdev->dev;
 	out->id = OMAP_DSS_OUTPUT_HDMI;
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
@@ -689,9 +752,11 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &hdmi->bridge);
+	if (r < 0) {
+		hdmi5_bridge_cleanup(hdmi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -704,6 +769,8 @@ static void hdmi5_uninit_output(struct omap_hdmi *hdmi)
 
 	omapdss_device_unregister(out);
 	omapdss_device_cleanup_output(out);
+
+	hdmi5_bridge_cleanup(hdmi);
 }
 
 static int hdmi5_probe_of(struct omap_hdmi *hdmi)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
