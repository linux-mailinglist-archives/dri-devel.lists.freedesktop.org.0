Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70D125FCD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9B86EB4D;
	Thu, 19 Dec 2019 10:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1CB6EB15
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66527FE8;
 Thu, 19 Dec 2019 11:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752356;
 bh=ZmtSRTvbMld4UrEmYdb2w/rzXEWOjgjFMmz0C+h289Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N0urx64rk08YuCna0n0RcjJtoTFHVW5Lv9bTQwmIMUeQsj4d5DFfVubkbp4QYt74r
 kL9pjfust3YrSLwYZwaU3oF6cFAR0AfcJZXj0ORFpPL7oBqTIxS2dD922LGieTE+0K
 Y79h0tyb0/0wBTJUEJq7nuP9bYtC+PG/OUtXtBus=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 23/51] drm/omap: Add infrastructure to support drm_bridge
 local to DSS outputs
Date: Thu, 19 Dec 2019 12:44:54 +0200
Message-Id: <20191219104522.9379-24-laurent.pinchart@ideasonboard.com>
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

In order to support drm_bridge-based pipeline, the internal HDMI
encoders will need to expose the EDID read operation through the
drm_bridge API, and thus to expose a drm_bridge instance corresponding
to the encoder. The HDMI encoders are however handled as omap_dss_device
instances, which conflicts with this requirement.

In order to move forward with the drm_bridge transition, add support for
creating drm_bridge instances local to DSS outputs. If a local bridge is
passed to the omapdss_device_init_output() function, it is used as the
first bridge in the chain, and the omap_dss_device.next_bridge field is
set to the next bridge for the use of the internal encoders' bridges.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c   |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c   |  2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  4 +++-
 drivers/gpu/drm/omapdrm/dss/output.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/omapdrm/dss/sdi.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c    |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c    |  2 +-
 9 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 462ed6f3118a..2d0eb5fcbb5b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -629,7 +629,7 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	out->ops = &dpi_ops;
 	out->owner = THIS_MODULE;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 6379eea124d1..79ddfbfd1b58 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5121,7 +5121,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 		       | DRM_BUS_FLAG_DE_HIGH
 		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 44075718407b..dd4a14fe7e59 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -676,7 +676,7 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 1b5bd44ee09d..8e3790dd8b98 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -660,7 +660,7 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_EDID;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index b48a51d11310..82e9bfa5530a 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -400,6 +400,7 @@ struct omap_dss_device {
 	struct dss_device *dss;
 	struct omap_dss_device *next;
 	struct drm_bridge *bridge;
+	struct drm_bridge *next_bridge;
 	struct drm_panel *panel;
 
 	struct list_head list;
@@ -488,7 +489,8 @@ int omap_dss_get_num_overlays(void);
 #define for_each_dss_output(d) \
 	while ((d = omapdss_device_next_output(d)) != NULL)
 struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from);
-int omapdss_device_init_output(struct omap_dss_device *out);
+int omapdss_device_init_output(struct omap_dss_device *out,
+			       struct drm_bridge *local_bridge);
 void omapdss_device_cleanup_output(struct omap_dss_device *out);
 
 typedef void (*omap_dispc_isr_t) (void *arg, u32 mask);
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index c1ec9d343e53..9ba7cc8539a1 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -17,7 +17,8 @@
 #include "dss.h"
 #include "omapdss.h"
 
-int omapdss_device_init_output(struct omap_dss_device *out)
+int omapdss_device_init_output(struct omap_dss_device *out,
+			       struct drm_bridge *local_bridge)
 {
 	struct device_node *remote_node;
 	int ret;
@@ -58,10 +59,20 @@ int omapdss_device_init_output(struct omap_dss_device *out)
 		out->bridge = bridge;
 	}
 
-	return out->next || out->bridge ? 0 : -EPROBE_DEFER;
+	if (local_bridge) {
+		out->next_bridge = out->bridge;
+		out->bridge = local_bridge;
+	}
+
+	if (!out->next && !out->bridge) {
+		ret = -EPROBE_DEFER;
+		goto error;
+	}
+
+	return 0;
 
 error:
-	omapdss_device_put(out->next);
+	omapdss_device_cleanup_output(out);
 	out->next = NULL;
 	return ret;
 }
@@ -70,7 +81,8 @@ EXPORT_SYMBOL(omapdss_device_init_output);
 void omapdss_device_cleanup_output(struct omap_dss_device *out)
 {
 	if (out->bridge && out->panel)
-		drm_panel_bridge_remove(out->bridge);
+		drm_panel_bridge_remove(out->next_bridge ?
+					out->next_bridge : out->bridge);
 
 	if (out->next)
 		omapdss_device_put(out->next);
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 9092ed3d0ef1..11aa2f712ff4 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -271,7 +271,7 @@ static int sdi_init_output(struct sdi_device *sdi)
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
 		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e2f480f689b8..977d8d525b43 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -757,7 +757,7 @@ static int venc_init_output(struct venc_device *venc)
 	out->of_port = 0;
 	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
-	r = omapdss_device_init_output(out);
+	r = omapdss_device_init_output(out, NULL);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index aefcf86d4045..1df509342b5d 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -324,7 +324,7 @@ static int omap_modeset_init(struct drm_device *dev)
 		struct drm_encoder *encoder = pipe->encoder;
 		struct drm_crtc *crtc;
 
-		if (!pipe->output->bridge) {
+		if (pipe->output->next) {
 			pipe->connector = omap_connector_init(dev, pipe->output,
 							      encoder);
 			if (!pipe->connector)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
