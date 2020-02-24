Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0516BC3F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7746EA1B;
	Tue, 25 Feb 2020 08:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FE66E9C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 95495293E9B
Received: by earth.universe (Postfix, from userid 1000)
 id A62F93C0CB2; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 47/56] drm/omap: remove unused omap_connector
Date: Tue, 25 Feb 2020 00:21:17 +0100
Message-Id: <20200224232126.3385250-48-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused code. Connectors are now created via drm_bridge_connector_init()
and no longer OMAP specific.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/Makefile         |   1 -
 drivers/gpu/drm/omapdrm/omap_connector.c | 128 -----------------------
 drivers/gpu/drm/omapdrm/omap_connector.h |  28 -----
 drivers/gpu/drm/omapdrm/omap_drv.c       |  19 ++--
 drivers/gpu/drm/omapdrm/omap_drv.h       |   1 -
 drivers/gpu/drm/omapdrm/omap_encoder.c   |  11 --
 6 files changed, 6 insertions(+), 182 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h

diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 66a73eae6f7c..2a404e045b78 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -12,7 +12,6 @@ omapdrm-y := omap_drv.o \
 	omap_crtc.o \
 	omap_plane.o \
 	omap_encoder.o \
-	omap_connector.o \
 	omap_fb.o \
 	omap_gem.o \
 	omap_gem_dmabuf.o \
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
deleted file mode 100644
index db6becd345a0..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Rob Clark <rob@ti.com>
- */
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_probe_helper.h>
-
-#include "omap_drv.h"
-
-/*
- * connector funcs
- */
-
-#define to_omap_connector(x) container_of(x, struct omap_connector, base)
-
-struct omap_connector {
-	struct drm_connector base;
-	struct omap_dss_device *output;
-};
-
-static enum drm_connector_status omap_connector_detect(
-		struct drm_connector *connector, bool force)
-{
-	return connector_status_connected;
-}
-
-static void omap_connector_destroy(struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-
-	DBG("%s", connector->name);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	omapdss_device_put(omap_connector->output);
-
-	kfree(omap_connector);
-}
-
-static int omap_connector_get_modes(struct drm_connector *connector)
-{
-	DBG("%s", connector->name);
-
-	/* We can't retrieve modes. The KMS core will add the default modes. */
-	return 0;
-}
-
-enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
-					const struct drm_display_mode *mode,
-					struct drm_display_mode *adjusted_mode)
-{
-	return MODE_OK;
-}
-
-static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct drm_display_mode new_mode = { { 0 } };
-	enum drm_mode_status status;
-
-	status = omap_connector_mode_fixup(omap_connector->output, mode,
-					   &new_mode);
-	if (status != MODE_OK)
-		goto done;
-
-	/* Check if vrefresh is still valid. */
-	if (drm_mode_vrefresh(mode) != drm_mode_vrefresh(&new_mode))
-		status = MODE_NOCLOCK;
-
-done:
-	DBG("connector: mode %s: " DRM_MODE_FMT,
-			(status == MODE_OK) ? "valid" : "invalid",
-			DRM_MODE_ARG(mode));
-
-	return status;
-}
-
-static const struct drm_connector_funcs omap_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = omap_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = omap_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs omap_connector_helper_funcs = {
-	.get_modes = omap_connector_get_modes,
-	.mode_valid = omap_connector_mode_valid,
-};
-
-/* initialize connector */
-struct drm_connector *omap_connector_init(struct drm_device *dev,
-					  struct omap_dss_device *output,
-					  struct drm_encoder *encoder)
-{
-	struct drm_connector *connector = NULL;
-	struct omap_connector *omap_connector;
-
-	DBG("%s", output->name);
-
-	omap_connector = kzalloc(sizeof(*omap_connector), GFP_KERNEL);
-	if (!omap_connector)
-		goto fail;
-
-	omap_connector->output = omapdss_device_get(output);
-
-	connector = &omap_connector->base;
-	connector->interlace_allowed = 1;
-	connector->doublescan_allowed = 0;
-
-	drm_connector_init(dev, connector, &omap_connector_funcs,
-			   DRM_MODE_CONNECTOR_DSI);
-	drm_connector_helper_add(connector, &omap_connector_helper_funcs);
-
-	return connector;
-
-fail:
-	if (connector)
-		omap_connector_destroy(connector);
-
-	return NULL;
-}
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.h b/drivers/gpu/drm/omapdrm/omap_connector.h
deleted file mode 100644
index 0ecd4f1655b7..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_connector.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * omap_connector.h -- OMAP DRM Connector
- *
- * Copyright (C) 2011 Texas Instruments
- * Author: Rob Clark <rob@ti.com>
- */
-
-#ifndef __OMAPDRM_CONNECTOR_H__
-#define __OMAPDRM_CONNECTOR_H__
-
-#include <linux/types.h>
-
-enum drm_mode_status;
-
-struct drm_connector;
-struct drm_device;
-struct drm_encoder;
-struct omap_dss_device;
-
-struct drm_connector *omap_connector_init(struct drm_device *dev,
-					  struct omap_dss_device *output,
-					  struct drm_encoder *encoder);
-enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
-					const struct drm_display_mode *mode,
-					struct drm_display_mode *adjusted_mode);
-
-#endif /* __OMAPDRM_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index c47e63e94a2e..4c2095067544 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -330,19 +330,12 @@ static int omap_modeset_init(struct drm_device *dev)
 		struct drm_encoder *encoder = pipe->encoder;
 		struct drm_crtc *crtc;
 
-		if (pipe->output->next) {
-			pipe->connector = omap_connector_init(dev, pipe->output,
-							      encoder);
-			if (!pipe->connector)
-				return -ENOMEM;
-		} else {
-			pipe->connector = drm_bridge_connector_init(dev, encoder);
-			if (IS_ERR(pipe->connector)) {
-				dev_err(priv->dev,
-					"unable to create bridge connector for %s\n",
-					pipe->output->name);
-				return PTR_ERR(pipe->connector);
-			}
+		pipe->connector = drm_bridge_connector_init(dev, encoder);
+		if (IS_ERR(pipe->connector)) {
+			dev_err(priv->dev,
+				"unable to create bridge connector for %s\n",
+				pipe->output->name);
+			return PTR_ERR(pipe->connector);
 		}
 
 		drm_connector_attach_encoder(pipe->connector, encoder);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 7c4b66efcaa7..80acd872ac38 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -16,7 +16,6 @@
 #include <drm/drm_gem.h>
 #include <drm/omap_drm.h>
 
-#include "omap_connector.h"
 #include "omap_crtc.h"
 #include "omap_encoder.h"
 #include "omap_fb.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index abb3821de8b8..610c5a2f2771 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -139,17 +139,6 @@ static int omap_encoder_atomic_check(struct drm_encoder *encoder,
 				     struct drm_crtc_state *crtc_state,
 				     struct drm_connector_state *conn_state)
 {
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	enum drm_mode_status status;
-
-	status = omap_connector_mode_fixup(omap_encoder->output,
-					   &crtc_state->mode,
-					   &crtc_state->adjusted_mode);
-	if (status != MODE_OK) {
-		dev_err(encoder->dev->dev, "invalid timings: %d\n", status);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
