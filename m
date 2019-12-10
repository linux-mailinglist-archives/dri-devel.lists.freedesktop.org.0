Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2670119ECC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7BA6E9FA;
	Tue, 10 Dec 2019 22:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7096E9F3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:37 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F020E128C;
 Tue, 10 Dec 2019 23:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018715;
 bh=rblHhXQyQDRFfXpfFUVHXnTmqEFJ0kbwnWL9Lnup1/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eU52lrZzafKj+cWP2wAUFuLxUvdMtmAQ8VjLPa7lEO2bO+vAELcAjXrfIg1HXu+Wk
 wCC/pD1Dr3a8MLggS/No2ATPDMdQbr+9lFtgyotPWbq2KuPsAu1ZaJmYXq7vCLcVmN
 1oivlFRCZI4g638YmxD4bHIn9pL3Bx/rFRt0SU0o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 34/50] drm/omap: venc: Register a drm_bridge
Date: Wed, 11 Dec 2019 00:57:34 +0200
Message-Id: <20191210225750.15709-35-laurent.pinchart@ideasonboard.com>
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

In order to integrate with a chain of drm_bridge, the internal VENC
encoder has to expose the mode valid, fixup and set, the enable and
disable and the get modes operations through the drm_bridge API.
Register a bridge at initialisation time to do so.

Most of those operations are removed from the omap_dss_device as they
are now called through the drm_bridge API by the DRM atomic helpers. The
only exception is the .get_modes() operation that is still invoked
through the omap_dss_device-based pipeline.

For the time being make the next bridge in the chain optional as the
VENC output is still based on omap_dss_device. The create_connector
argument to the bridge attach function is also ignored for the same
reason. This will be changed later when removing the related
omapdrm-specific display drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Unregister bridge if output initialisation fails
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 247 +++++++++++++++++++----------
 1 file changed, 163 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 977d8d525b43..c2e2141c8375 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -26,6 +26,8 @@
 #include <linux/component.h>
 #include <linux/sys_soc.h>
 
+#include <drm/drm_bridge.h>
+
 #include "omapdss.h"
 #include "dss.h"
 
@@ -303,9 +305,11 @@ struct venc_device {
 	bool requires_tv_dac_clk;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 };
 
 #define dssdev_to_venc(dssdev) container_of(dssdev, struct venc_device, output)
+#define drm_bridge_to_venc(b) container_of(b, struct venc_device, bridge)
 
 static inline void venc_write_reg(struct venc_device *venc, int idx, u32 val)
 {
@@ -477,32 +481,6 @@ static void venc_power_off(struct venc_device *venc)
 	venc_runtime_put(venc);
 }
 
-static void venc_display_enable(struct omap_dss_device *dssdev)
-{
-	struct venc_device *venc = dssdev_to_venc(dssdev);
-
-	DSSDBG("venc_display_enable\n");
-
-	mutex_lock(&venc->venc_lock);
-
-	venc_power_on(venc);
-
-	mutex_unlock(&venc->venc_lock);
-}
-
-static void venc_display_disable(struct omap_dss_device *dssdev)
-{
-	struct venc_device *venc = dssdev_to_venc(dssdev);
-
-	DSSDBG("venc_display_disable\n");
-
-	mutex_lock(&venc->venc_lock);
-
-	venc_power_off(venc);
-
-	mutex_unlock(&venc->venc_lock);
-}
-
 static int venc_get_modes(struct omap_dss_device *dssdev,
 			  struct drm_connector *connector)
 {
@@ -545,57 +523,6 @@ static enum venc_videomode venc_get_videomode(const struct drm_display_mode *mod
 	return VENC_MODE_UNKNOWN;
 }
 
-static void venc_set_timings(struct omap_dss_device *dssdev,
-			     const struct drm_display_mode *mode)
-{
-	struct venc_device *venc = dssdev_to_venc(dssdev);
-	enum venc_videomode venc_mode = venc_get_videomode(mode);
-
-	DSSDBG("venc_set_timings\n");
-
-	mutex_lock(&venc->venc_lock);
-
-	switch (venc_mode) {
-	default:
-		WARN_ON_ONCE(1);
-		/* Fall-through */
-	case VENC_MODE_PAL:
-		venc->config = &venc_config_pal_trm;
-		break;
-
-	case VENC_MODE_NTSC:
-		venc->config = &venc_config_ntsc_trm;
-		break;
-	}
-
-	dispc_set_tv_pclk(venc->dss->dispc, 13500000);
-
-	mutex_unlock(&venc->venc_lock);
-}
-
-static int venc_check_timings(struct omap_dss_device *dssdev,
-			      struct drm_display_mode *mode)
-{
-	DSSDBG("venc_check_timings\n");
-
-	switch (venc_get_videomode(mode)) {
-	case VENC_MODE_PAL:
-		drm_mode_copy(mode, &omap_dss_pal_mode);
-		break;
-
-	case VENC_MODE_NTSC:
-		drm_mode_copy(mode, &omap_dss_ntsc_mode);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
-	drm_mode_set_name(mode);
-	return 0;
-}
-
 static int venc_dump_regs(struct seq_file *s, void *p)
 {
 	struct venc_device *venc = s->private;
@@ -689,15 +616,161 @@ static const struct omap_dss_device_ops venc_ops = {
 	.connect = venc_connect,
 	.disconnect = venc_disconnect,
 
-	.enable = venc_display_enable,
-	.disable = venc_display_disable,
+	.get_modes = venc_get_modes,
+};
+
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
 
-	.check_timings = venc_check_timings,
-	.set_timings = venc_set_timings,
+static int venc_bridge_attach(struct drm_bridge *bridge,
+			      enum drm_bridge_attach_flags flags)
+{
+	struct venc_device *venc = drm_bridge_to_venc(bridge);
 
-	.get_modes = venc_get_modes,
+	if (venc->output.next_bridge)
+		return 0;
+
+	return drm_bridge_attach(bridge->encoder, venc->output.next_bridge,
+				 bridge, flags);
+}
+
+static enum drm_mode_status
+venc_bridge_mode_valid(struct drm_bridge *bridge,
+		       const struct drm_display_mode *mode)
+{
+	switch (venc_get_videomode(mode)) {
+	case VENC_MODE_PAL:
+	case VENC_MODE_NTSC:
+		return MODE_OK;
+
+	default:
+		return MODE_BAD;
+	}
+}
+
+static bool venc_bridge_mode_fixup(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   struct drm_display_mode *adjusted_mode)
+{
+	const struct drm_display_mode *venc_mode;
+
+	switch (venc_get_videomode(adjusted_mode)) {
+	case VENC_MODE_PAL:
+		venc_mode = &omap_dss_pal_mode;
+		break;
+
+	case VENC_MODE_NTSC:
+		venc_mode = &omap_dss_ntsc_mode;
+		break;
+
+	default:
+		return false;
+	}
+
+	drm_mode_copy(adjusted_mode, venc_mode);
+	drm_mode_set_crtcinfo(adjusted_mode, CRTC_INTERLACE_HALVE_V);
+	drm_mode_set_name(adjusted_mode);
+
+	return true;
+}
+
+static void venc_bridge_mode_set(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 const struct drm_display_mode *adjusted_mode)
+{
+	struct venc_device *venc = drm_bridge_to_venc(bridge);
+	enum venc_videomode venc_mode = venc_get_videomode(adjusted_mode);
+
+	mutex_lock(&venc->venc_lock);
+
+	switch (venc_mode) {
+	default:
+		WARN_ON_ONCE(1);
+		/* Fall-through */
+	case VENC_MODE_PAL:
+		venc->config = &venc_config_pal_trm;
+		break;
+
+	case VENC_MODE_NTSC:
+		venc->config = &venc_config_ntsc_trm;
+		break;
+	}
+
+	dispc_set_tv_pclk(venc->dss->dispc, 13500000);
+
+	mutex_unlock(&venc->venc_lock);
+}
+
+static void venc_bridge_enable(struct drm_bridge *bridge,
+			       struct drm_atomic_state *state)
+{
+	struct venc_device *venc = drm_bridge_to_venc(bridge);
+
+	mutex_lock(&venc->venc_lock);
+	venc_power_on(venc);
+	mutex_unlock(&venc->venc_lock);
+}
+
+static void venc_bridge_disable(struct drm_bridge *bridge,
+				struct drm_atomic_state *state)
+{
+	struct venc_device *venc = drm_bridge_to_venc(bridge);
+
+	mutex_lock(&venc->venc_lock);
+	venc_power_off(venc);
+	mutex_unlock(&venc->venc_lock);
+}
+
+static int venc_bridge_get_modes(struct drm_bridge *bridge,
+				 struct drm_connector *connector)
+{
+	static const struct drm_display_mode *modes[] = {
+		&omap_dss_pal_mode,
+		&omap_dss_ntsc_mode,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(modes); ++i) {
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_duplicate(connector->dev, modes[i]);
+		if (!mode)
+			return i;
+
+		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+		drm_mode_set_name(mode);
+		drm_mode_probed_add(connector, mode);
+	}
+
+	return ARRAY_SIZE(modes);
+}
+
+static const struct drm_bridge_funcs venc_bridge_funcs = {
+	.attach = venc_bridge_attach,
+	.mode_valid = venc_bridge_mode_valid,
+	.mode_fixup = venc_bridge_mode_fixup,
+	.mode_set = venc_bridge_mode_set,
+	.atomic_enable = venc_bridge_enable,
+	.atomic_disable = venc_bridge_disable,
+	.get_modes = venc_bridge_get_modes,
 };
 
+static void venc_bridge_init(struct venc_device *venc)
+{
+	venc->bridge.funcs = &venc_bridge_funcs;
+	venc->bridge.of_node = venc->pdev->dev.of_node;
+	venc->bridge.ops = DRM_BRIDGE_OP_MODES;
+	venc->bridge.type = DRM_MODE_CONNECTOR_SVIDEO;
+
+	drm_bridge_add(&venc->bridge);
+}
+
+static void venc_bridge_cleanup(struct venc_device *venc)
+{
+	drm_bridge_remove(&venc->bridge);
+}
+
 /* -----------------------------------------------------------------------------
  * Component Bind & Unbind
  */
@@ -747,6 +820,8 @@ static int venc_init_output(struct venc_device *venc)
 	struct omap_dss_device *out = &venc->output;
 	int r;
 
+	venc_bridge_init(venc);
+
 	out->dev = &venc->pdev->dev;
 	out->id = OMAP_DSS_OUTPUT_VENC;
 	out->type = OMAP_DISPLAY_TYPE_VENC;
@@ -757,9 +832,11 @@ static int venc_init_output(struct venc_device *venc)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &venc->bridge);
+	if (r < 0) {
+		venc_bridge_cleanup(venc);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -770,6 +847,8 @@ static void venc_uninit_output(struct venc_device *venc)
 {
 	omapdss_device_unregister(&venc->output);
 	omapdss_device_cleanup_output(&venc->output);
+
+	venc_bridge_cleanup(venc);
 }
 
 static int venc_probe_of(struct venc_device *venc)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
