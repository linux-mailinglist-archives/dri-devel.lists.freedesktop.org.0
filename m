Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F964168FA3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D6B6E92D;
	Sat, 22 Feb 2020 15:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096C6E921
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:02:11 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5933640D6;
 Sat, 22 Feb 2020 16:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383727;
 bh=Bq85AOwHw1q9R1Gvpj0CuNP2nUFfSe5jzlzImhNDhgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m4J7WC499lNo/EEEFftffAXLpyLAoUzJsYG4tSiIdKyLRaIEA8nZ0BXFeakYjTbdK
 ah/UEqIc8gs/FUt97RxF79Exeu+DkmfqifBw4LBlVT+vV2nIhmX4ZRqbgwy95XMrIc
 iaE5SJVkc/2+DpaVzIeb6wurepeYL6HmXwiukgdo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 40/54] drm/omap: Remove HPD,
 detect and EDID omapdss operations
Date: Sat, 22 Feb 2020 17:00:52 +0200
Message-Id: <20200222150106.22919-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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

Due to the removal of several omapdrm display drivers, the omapdss HPD,
detected and EDID operations are not used anymore. Remove them and all
related code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c      |  61 --------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  46 ------
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |  25 +--
 drivers/gpu/drm/omapdrm/omap_connector.c | 190 +++--------------------
 drivers/gpu/drm/omapdrm/omap_connector.h |   2 -
 drivers/gpu/drm/omapdrm/omap_drv.c       |   8 +-
 6 files changed, 22 insertions(+), 310 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 52daae36935a..b9bcd6e681e8 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -321,47 +321,6 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 	omapdss_device_disconnect(dst, dst->next);
 }
 
-#define MAX_EDID	512
-
-static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi,
-					struct drm_connector *connector)
-{
-	u8 *edid;
-	int r;
-
-	edid = kzalloc(MAX_EDID, GFP_KERNEL);
-	if (!edid)
-		return NULL;
-
-	r = hdmi4_core_ddc_read(&hdmi->core, edid, 0, EDID_LENGTH);
-	if (r)
-		goto error;
-
-	if (edid[0x7e] > 0) {
-		char checksum = 0;
-		unsigned int i;
-
-		r = hdmi4_core_ddc_read(&hdmi->core, edid + EDID_LENGTH, 1,
-					EDID_LENGTH);
-		if (r)
-			goto error;
-
-		for (i = 0; i < EDID_LENGTH; ++i)
-			checksum += edid[EDID_LENGTH + i];
-
-		if (checksum != 0) {
-			DSSERR("E-EDID checksum failed!!\n");
-			goto error;
-		}
-	}
-
-	return (struct edid *)edid;
-
-error:
-	kfree(edid);
-	return NULL;
-}
-
 static struct edid *
 hdmi_do_read_edid(struct omap_hdmi *hdmi,
 		  struct edid *(*read)(struct omap_hdmi *hdmi,
@@ -411,28 +370,9 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
 	return edid;
 }
 
-static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
-{
-	return hdmi_do_read_edid(dssdev_to_hdmi(dssdev), hdmi_read_edid_data,
-				 NULL);
-}
-
-static void hdmi_lost_hotplug(struct omap_dss_device *dssdev)
-{
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-
-	hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
-}
-
 static const struct omap_dss_device_ops hdmi_ops = {
 	.connect		= hdmi_connect,
 	.disconnect		= hdmi_disconnect,
-
-	.read_edid		= hdmi_read_edid,
-
-	.hdmi = {
-		.lost_hotplug		= hdmi_lost_hotplug,
-	},
 };
 
 /* -----------------------------------------------------------------------------
@@ -804,7 +744,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
-	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
 	if (r < 0) {
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index f07fd5c6dc39..effe4a9401ff 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -319,43 +319,6 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 	omapdss_device_disconnect(dst, dst->next);
 }
 
-#define MAX_EDID	512
-
-static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi,
-					struct drm_connector *connector)
-{
-	struct hdmi_core_data *core = &hdmi->core;
-	int max_ext_blocks = 3;
-	int r, n, i;
-	u8 *edid;
-
-	edid = kzalloc(MAX_EDID, GFP_KERNEL);
-	if (!edid)
-		return NULL;
-
-	r = hdmi5_core_ddc_read(core, edid, 0, EDID_LENGTH);
-	if (r)
-		goto error;
-
-	n = edid[0x7e];
-
-	if (n > max_ext_blocks)
-		n = max_ext_blocks;
-
-	for (i = 1; i <= n; i++) {
-		r = hdmi5_core_ddc_read(core, edid + i * EDID_LENGTH, i,
-					EDID_LENGTH);
-		if (r)
-			goto error;
-	}
-
-	return (struct edid *)edid;
-
-error:
-	kfree(edid);
-	return NULL;
-}
-
 static struct edid *
 hdmi_do_read_edid(struct omap_hdmi *hdmi,
 		  struct edid *(*read)(struct omap_hdmi *hdmi,
@@ -400,17 +363,9 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
 	return (struct edid *)edid;
 }
 
-static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
-{
-	return hdmi_do_read_edid(dssdev_to_hdmi(dssdev), hdmi_read_edid_data,
-				 NULL);
-}
-
 static const struct omap_dss_device_ops hdmi_ops = {
 	.connect		= hdmi_connect,
 	.disconnect		= hdmi_disconnect,
-
-	.read_edid		= hdmi_read_edid,
 };
 
 /* -----------------------------------------------------------------------------
@@ -763,7 +718,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
-	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
 	if (r < 0) {
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 30a12cf91cbb..cb79e05c902d 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -285,10 +285,6 @@ struct omap_dss_writeback_info {
 	u8 pre_mult_alpha;
 };
 
-struct omapdss_hdmi_ops {
-	void (*lost_hotplug)(struct omap_dss_device *dssdev);
-};
-
 struct omapdss_dsi_ops {
 	void (*disable)(struct omap_dss_device *dssdev, bool disconnect_lanes,
 			bool enter_ulps);
@@ -356,36 +352,17 @@ struct omap_dss_device_ops {
 	void (*set_timings)(struct omap_dss_device *dssdev,
 			    const struct drm_display_mode *mode);
 
-	bool (*detect)(struct omap_dss_device *dssdev);
-
-	void (*register_hpd_cb)(struct omap_dss_device *dssdev,
-				void (*cb)(void *cb_data,
-					  enum drm_connector_status status),
-				void *cb_data);
-	void (*unregister_hpd_cb)(struct omap_dss_device *dssdev);
-
-	struct edid *(*read_edid)(struct omap_dss_device *dssdev);
-
 	int (*get_modes)(struct omap_dss_device *dssdev,
 			 struct drm_connector *connector);
 
-	union {
-		const struct omapdss_hdmi_ops hdmi;
-		const struct omapdss_dsi_ops dsi;
-	};
+	const struct omapdss_dsi_ops dsi;
 };
 
 /**
  * enum omap_dss_device_ops_flag - Indicates which device ops are supported
- * @OMAP_DSS_DEVICE_OP_DETECT: The device supports output connection detection
- * @OMAP_DSS_DEVICE_OP_HPD: The device supports all hot-plug-related operations
- * @OMAP_DSS_DEVICE_OP_EDID: The device supports reading EDID
  * @OMAP_DSS_DEVICE_OP_MODES: The device supports reading modes
  */
 enum omap_dss_device_ops_flag {
-	OMAP_DSS_DEVICE_OP_DETECT = BIT(0),
-	OMAP_DSS_DEVICE_OP_HPD = BIT(1),
-	OMAP_DSS_DEVICE_OP_EDID = BIT(2),
 	OMAP_DSS_DEVICE_OP_MODES = BIT(3),
 };
 
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index c636ae228130..baa31ed1f993 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -19,111 +19,22 @@
 struct omap_connector {
 	struct drm_connector base;
 	struct omap_dss_device *output;
-	struct omap_dss_device *hpd;
 };
 
-static void omap_connector_hpd_notify(struct drm_connector *connector,
-				      enum drm_connector_status status)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct omap_dss_device *dssdev;
-
-	if (status != connector_status_disconnected)
-		return;
-
-	/*
-	 * Notify all devics in the pipeline of disconnection. This is required
-	 * to let the HDMI encoders reset their internal state related to
-	 * connection status, such as the CEC address.
-	 */
-	for (dssdev = omap_connector->output; dssdev; dssdev = dssdev->next) {
-		if (dssdev->ops && dssdev->ops->hdmi.lost_hotplug)
-			dssdev->ops->hdmi.lost_hotplug(dssdev);
-	}
-}
-
-static void omap_connector_hpd_cb(void *cb_data,
-				  enum drm_connector_status status)
-{
-	struct omap_connector *omap_connector = cb_data;
-	struct drm_connector *connector = &omap_connector->base;
-	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
-
-	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
-	connector->status = status;
-	mutex_unlock(&dev->mode_config.mutex);
-
-	if (old_status == status)
-		return;
-
-	omap_connector_hpd_notify(connector, status);
-
-	drm_kms_helper_hotplug_event(dev);
-}
-
-void omap_connector_enable_hpd(struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct omap_dss_device *hpd = omap_connector->hpd;
-
-	if (hpd)
-		hpd->ops->register_hpd_cb(hpd, omap_connector_hpd_cb,
-					  omap_connector);
-}
-
-void omap_connector_disable_hpd(struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct omap_dss_device *hpd = omap_connector->hpd;
-
-	if (hpd)
-		hpd->ops->unregister_hpd_cb(hpd);
-}
-
-static struct omap_dss_device *
-omap_connector_find_device(struct drm_connector *connector,
-			   enum omap_dss_device_ops_flag op)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct omap_dss_device *dssdev = NULL;
-	struct omap_dss_device *d;
-
-	for (d = omap_connector->output; d; d = d->next) {
-		if (d->ops_flags & op)
-			dssdev = d;
-	}
-
-	return dssdev;
-}
-
 static enum drm_connector_status omap_connector_detect(
 		struct drm_connector *connector, bool force)
 {
-	struct omap_dss_device *dssdev;
 	enum drm_connector_status status;
 
-	dssdev = omap_connector_find_device(connector,
-					    OMAP_DSS_DEVICE_OP_DETECT);
-
-	if (dssdev) {
-		status = dssdev->ops->detect(dssdev)
-		       ? connector_status_connected
-		       : connector_status_disconnected;
-
-		omap_connector_hpd_notify(connector, status);
-	} else {
-		switch (connector->connector_type) {
-		case DRM_MODE_CONNECTOR_DPI:
-		case DRM_MODE_CONNECTOR_LVDS:
-		case DRM_MODE_CONNECTOR_DSI:
-			status = connector_status_connected;
-			break;
-		default:
-			status = connector_status_unknown;
-			break;
-		}
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_DSI:
+		status = connector_status_connected;
+		break;
+	default:
+		status = connector_status_unknown;
+		break;
 	}
 
 	VERB("%s: %d (force=%d)", connector->name, status, force);
@@ -137,14 +48,6 @@ static void omap_connector_destroy(struct drm_connector *connector)
 
 	DBG("%s", connector->name);
 
-	if (omap_connector->hpd) {
-		struct omap_dss_device *hpd = omap_connector->hpd;
-
-		hpd->ops->unregister_hpd_cb(hpd);
-		omapdss_device_put(hpd);
-		omap_connector->hpd = NULL;
-	}
-
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 
@@ -153,63 +56,27 @@ static void omap_connector_destroy(struct drm_connector *connector)
 	kfree(omap_connector);
 }
 
-static int omap_connector_get_modes_edid(struct drm_connector *connector,
-					 struct omap_dss_device *dssdev)
-{
-	enum drm_connector_status status;
-	struct edid *edid;
-	int n;
-
-	status = omap_connector_detect(connector, false);
-	if (status != connector_status_connected)
-		goto no_edid;
-
-	edid = dssdev->ops->read_edid(dssdev);
-	if (!edid || !drm_edid_is_valid(edid)) {
-		kfree(edid);
-		goto no_edid;
-	}
-
-	drm_connector_update_edid_property(connector, edid);
-	n = drm_add_edid_modes(connector, edid);
-
-	kfree(edid);
-	return n;
-
-no_edid:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static int omap_connector_get_modes(struct drm_connector *connector)
 {
-	struct omap_dss_device *dssdev;
+	struct omap_connector *omap_connector = to_omap_connector(connector);
+	struct omap_dss_device *dssdev = NULL;
+	struct omap_dss_device *d;
 
 	DBG("%s", connector->name);
 
 	/*
-	 * If display exposes EDID, then we parse that in the normal way to
-	 * build table of supported modes.
+	 * If the display pipeline reports modes (e.g. with a fixed resolution
+	 * panel or an analog TV output), query it.
 	 */
-	dssdev = omap_connector_find_device(connector,
-					    OMAP_DSS_DEVICE_OP_EDID);
-	if (dssdev)
-		return omap_connector_get_modes_edid(connector, dssdev);
+	for (d = omap_connector->output; d; d = d->next) {
+		if (d->ops_flags & OMAP_DSS_DEVICE_OP_MODES)
+			dssdev = d;
+	}
 
-	/*
-	 * Otherwise if the display pipeline reports modes (e.g. with a fixed
-	 * resolution panel or an analog TV output), query it.
-	 */
-	dssdev = omap_connector_find_device(connector,
-					    OMAP_DSS_DEVICE_OP_MODES);
 	if (dssdev)
 		return dssdev->ops->get_modes(dssdev, connector);
 
-	/*
-	 * We can't retrieve modes, which can happen for instance for a DVI or
-	 * VGA output with the DDC bus unconnected. The KMS core will add the
-	 * default modes.
-	 */
+	/* We can't retrieve modes. The KMS core will add the default modes. */
 	return 0;
 }
 
@@ -290,7 +157,6 @@ struct drm_connector *omap_connector_init(struct drm_device *dev,
 {
 	struct drm_connector *connector = NULL;
 	struct omap_connector *omap_connector;
-	struct omap_dss_device *dssdev;
 
 	DBG("%s", output->name);
 
@@ -308,24 +174,6 @@ struct drm_connector *omap_connector_init(struct drm_device *dev,
 			   omap_connector_get_type(output));
 	drm_connector_helper_add(connector, &omap_connector_helper_funcs);
 
-	/*
-	 * Initialize connector status handling. First try to find a device that
-	 * supports hot-plug reporting. If it fails, fall back to a device that
-	 * support polling. If that fails too, we don't support hot-plug
-	 * detection at all.
-	 */
-	dssdev = omap_connector_find_device(connector, OMAP_DSS_DEVICE_OP_HPD);
-	if (dssdev) {
-		omap_connector->hpd = omapdss_device_get(dssdev);
-		connector->polled = DRM_CONNECTOR_POLL_HPD;
-	} else {
-		dssdev = omap_connector_find_device(connector,
-						    OMAP_DSS_DEVICE_OP_DETECT);
-		if (dssdev)
-			connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-					    DRM_CONNECTOR_POLL_DISCONNECT;
-	}
-
 	return connector;
 
 fail:
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.h b/drivers/gpu/drm/omapdrm/omap_connector.h
index 4aa5608f4bbe..0ecd4f1655b7 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.h
+++ b/drivers/gpu/drm/omapdrm/omap_connector.h
@@ -21,8 +21,6 @@ struct omap_dss_device;
 struct drm_connector *omap_connector_init(struct drm_device *dev,
 					  struct omap_dss_device *output,
 					  struct drm_encoder *encoder);
-void omap_connector_enable_hpd(struct drm_connector *connector);
-void omap_connector_disable_hpd(struct drm_connector *connector);
 enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
 					const struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 47afa37055b3..e6a065030523 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -422,9 +422,7 @@ static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
 		if (!connector)
 			continue;
 
-		if (priv->pipes[i].output->next)
-			omap_connector_enable_hpd(connector);
-		else
+		if (priv->pipes[i].output->bridge)
 			drm_bridge_connector_enable_hpd(connector);
 	}
 }
@@ -443,9 +441,7 @@ static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
 		if (!connector)
 			continue;
 
-		if (priv->pipes[i].output->next)
-			omap_connector_disable_hpd(connector);
-		else
+		if (priv->pipes[i].output->bridge)
 			drm_bridge_connector_disable_hpd(connector);
 	}
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
