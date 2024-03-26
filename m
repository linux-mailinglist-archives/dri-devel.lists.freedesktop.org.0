Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BB88C92B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABCA10EC64;
	Tue, 26 Mar 2024 16:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CRL4N3eW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562610EC62
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 16:28:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7100F20009;
 Tue, 26 Mar 2024 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711470520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FeS8d4XmBSSF2aeeEjzAkcwtGT7LFY/aeeFQLN7fpuk=;
 b=CRL4N3eW2vc9zWgva4OLGdq3TXhOKGZKXnxkyUS8jxS+8lD94Ct33mA61vs9dEQP889MJN
 iIYS7msjX+migXkXy/cJyyEA88+9Y2DqBbUlDTlmpG1JFm13YLxBMyPELJ9SvZcjBIOL6u
 y1dJM8PFdIvX5v44itq3jdtFlTfzB/O6VupaOwNT5klQf3+Bs4Q76qr6ZnHrOFN0ftZ+L4
 xIMSwXNhSIcoQAAuPoBcZZgQvTIydOSEcozI5AGVUL95UP/htO02yhNAQYGqnVQW2aKoAN
 qWrxAjO1VDDb0WdTIEl8rOv2BYwhiAsbGAEbKkYaCqMnQ5k+1ScjYT5JPRy9yQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 26 Mar 2024 17:28:14 +0100
Subject: [PATCH 4/4] drm/bridge: hotplug-bridge: add driver to support
 hot-pluggable DSI bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-hotplug-drm-bridge-v1-4-4b51b5eb75d5@bootlin.com>
References: <20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com>
In-Reply-To: <20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This driver implements the point of a DRM pipeline where a connector allows
removal of all the following bridges up to the panel.

The DRM subsystem currently allows hotplug of the monitor but not preceding
components. However there are embedded devices where the "tail" of the DRM
pipeline, including one or more bridges, can be physically removed:

 .------------------------.
 |   DISPLAY CONTROLLER   |
 | .---------.   .------. |
 | | ENCODER |<--| CRTC | |
 | '---------'   '------' |
 '------|-----------------'
        |
        |               HOTPLUG
        V              CONNECTOR
   .---------.        .--.    .-.        .---------.         .-------.
   | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
   | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
   |         |        |  |    | |        |         |         |       |
   '---------'        '--'    '-'        '---------'         '-------'

 [--- fixed components --]  [----------- removable add-on -----------]

This driver supports such devices, where the final segment of a MIPI DSI
bus, including one or more bridges, can be physically disconnected and
reconnected at runtime, possibly with a different model.

This implementation supports a MIPI DSI bus only, but it is designed to be
as far as possible generic and extendable to other busses that have no
native hotplug and model ID discovery.

This driver does not provide facilities to add and remove the hot-pluggable
components from the kernel: this needs to be done by other means
(e.g. device tree overlay runtime insertion and removal). The
hotplug-bridge gets notified of hot-plugging by the DRM bridge notifier
callbacks after they get added or before they get removed.

The hotplug-bridge role is to implement the "hot-pluggable connector" in
the bridge chain. In this position, what the hotplug-bridge should ideally
do is:

 * communicate with the previous component (bridge or encoder) so that it
   believes it always has a connected bridge following it and the DRM card
   is always present
 * be notified of the addition and removal of the following bridge and
   attach/detach to/from it
 * communicate with the following bridge so that it will attach and detach
   using the normal procedure (as if the entire pipeline were being created
   or destroyed, not only the tail)
 * expose the "add-on connected/disconnected" status via the DRM connector
   connected/disconnected status, so that users of the DRM pipeline know
   when they can render output on the display

However some aspects make it a bit more complex than that. Most notably:

 * the next bridge can be probed and removed at any moment and all probing
   sequences need to be handled
 * the DSI host/device registration process, which adds to the DRM bridge
   attach process, makes the initial card registration tricky
 * the need to register and deregister the following bridges at runtime
   without tearing down the whole DRM card prevents using the functions
   that are normally recommended
 * the automatic mechanism to call the appropriate .get_modes operation
   (typically provided by the panel bridge) cannot work as the panel can
   disappear and reappear as a different model, so an ad-hoc lookup is
   needed

The code handling these and other tricky aspects is accurately documented
by comments in the code.

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 MAINTAINERS                             |   1 +
 drivers/gpu/drm/bridge/Kconfig          |  15 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c | 561 ++++++++++++++++++++++++++++++++
 4 files changed, 578 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1affd13e30b..b3fe36ed35a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6720,6 +6720,7 @@ DRM DRIVER FOR HOTPLUG VIDEO CONNECTOR BRIDGE
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/hotplug-video-connector-dsi.yaml
+F:	drivers/gpu/drm/bridge/hotplug-bridge.c
 
 DRM DRIVER FOR HX8357D PANELS
 S:	Orphan
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index efd996f6c138..409d090ee94d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,21 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_HOTPLUG_BRIDGE
+	tristate "Hotplug DRM bridge support"
+	depends on OF
+	select DRM_PANEL_BRIDGE
+	select DRM_MIPI_DSI
+	select DRM_KMS_HELPER
+	help
+	  Driver for a DRM bridge representing a physical connector that
+	  splits a DRM pipeline into a fixed part and a physically
+	  removable part. The fixed part includes up to the encoder and
+	  zero or more bridges. The removable part includes any following
+	  bridges up to the connector and panel and can be physically
+	  removed and connected at runtime, possibly with different
+	  components.
+
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 017b5832733b..278f20729c6c 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_HOTPLUG_BRIDGE) += hotplug-bridge.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/hotplug-bridge.c b/drivers/gpu/drm/bridge/hotplug-bridge.c
new file mode 100644
index 000000000000..8af01be80191
--- /dev/null
+++ b/drivers/gpu/drm/bridge/hotplug-bridge.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A DRM bridge representing the split point between a fixed part of the
+ * DRM pipeline and a physically removable part. The fixed part includes up
+ * to the encoder and zero or more bridges. Insertion and removal of the
+ * "downstream" components happens via device driver probe/removal.
+ *
+ * Copyright (C) 2024, GE HealthCare
+ *
+ * Authors:
+ * Luca Ceresoli <luca.ceresoli@bootlin.com>
+ * Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+struct hotplug_bridge {
+	struct device *dev;
+
+	/* Local bridge */
+	struct drm_bridge bridge;
+	/* Local connector for the bridge chain */
+	struct drm_connector *connector;
+	/* Downstream bridge (next in the chain) */
+	struct drm_bridge *next_bridge;
+	struct mutex next_bridge_mutex;
+
+	struct work_struct hpd_work;
+	struct notifier_block notifier_block;
+
+	/* Local DSI host, for the downstream DSI device to attach to */
+	struct mipi_dsi_host dsi_host;
+	/* Local DSI device, attached to the upstream DSI host */
+	struct mipi_dsi_device *dsi_dev;
+	/* Upstream DSI host (the actual DSI controller) */
+	struct mipi_dsi_host *prev_dsi_host;
+};
+
+static struct hotplug_bridge *hotplug_bridge_from_drm_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct hotplug_bridge, bridge);
+}
+
+/*
+ * Attach the remote bridge to the encoder and to the next bridge in the
+ * chain, if possible. For this to succeed, we need to know:
+ *
+ * - the encoder, which is set at the first drm_bridge_attach() time
+ * - the next bridge, which is obtained via a notifier whenever the next
+ *   bridge is (re)probed, or at probe time in case it was probed before us
+ *
+ * In order to handle different execution sequences, this function can be
+ * called from multiple places and needs to check all the prerequisites
+ * every time, and it will act only if both are met.
+ *
+ * Must be called with hpb->next_bridge_mutex held.
+ *
+ * Returns 0 if the encoder was attached successfully, -ENODEV if any of
+ * the two prerequisites above is not met (no encoder or no next bridge),
+ * the error returned by drm_bridge_attach() otherwise.
+ */
+static int hotplug_bridge_attach_to_encoder_chain(struct hotplug_bridge *hpb)
+{
+	int ret;
+
+	if (!hpb->next_bridge || !hpb->bridge.encoder)
+		return -ENODEV;
+
+	ret = drm_bridge_attach(hpb->bridge.encoder, hpb->next_bridge, &hpb->bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return dev_err_probe(hpb->dev, ret, "drm_bridge_attach failed\n");
+
+	dev_dbg(hpb->dev, "attached to encoder chain\n");
+
+	return 0;
+}
+
+/*
+ * Stop the video pipeline and detach next_bridge.
+ *
+ * Must be called with hpb->next_bridge_mutex held.
+ */
+static void hotplug_bridge_detach_from_encoder_chain(struct hotplug_bridge *hpb)
+{
+	WARN_ON_ONCE(!hpb->next_bridge);
+
+	dev_dbg(hpb->dev, "detaching from encoder chain\n");
+
+	drm_atomic_helper_shutdown(hpb->bridge.dev);
+
+	drm_encoder_cleanup_from(hpb->bridge.encoder, hpb->next_bridge);
+}
+
+static void hotplug_bridge_grab(struct hotplug_bridge *hpb)
+{
+	struct device *dev = hpb->dev;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int err;
+
+	mutex_lock(&hpb->next_bridge_mutex);
+
+	if (hpb->next_bridge)
+		goto out;
+
+	/*
+	 * This is supposed to be replaced by devm_drm_of_get_bridge(), but
+	 * that is a devm_, and we need to remove the panel bridge also on
+	 * next_bridge disconnect.
+	 */
+	err = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
+	if (err)
+		goto out;
+
+	/* Convert the remote panel to a bridge */
+	if (panel)
+		bridge = drm_panel_bridge_add(panel);
+
+	hpb->next_bridge = bridge;
+
+	dev_dbg(dev, "grabbed next bridge (%pOFn)\n", hpb->next_bridge->of_node);
+
+	hpb->bridge.pre_enable_prev_first = hpb->next_bridge->pre_enable_prev_first;
+
+	hotplug_bridge_attach_to_encoder_chain(hpb);
+
+	queue_work(system_wq, &hpb->hpd_work);
+
+out:
+	mutex_unlock(&hpb->next_bridge_mutex);
+}
+
+/*
+ * Detach from the next bridge and remove the panel bridge, either on
+ * release or when the downstream bridge is being removed.
+ *
+ * Can be called in these ways:
+ *
+ * - bridge_being_removed is NULL: detach unconditionally
+ *   (this is useful on .remove() to teardown everything)
+ * - bridge_being_removed == hpb->next_bridge: detach
+ *   (the downstream bridge is being removed)
+ * - bridge_being_removed != hpb->next_bridge: do nothing
+ *   (the bridge being removed is not the downstream bridge)
+ *
+ * In all cases, does nothing when there is no downstream bridge.
+ */
+static void hotplug_bridge_release(struct hotplug_bridge *hpb,
+				   struct drm_bridge *bridge_being_removed)
+{
+	mutex_lock(&hpb->next_bridge_mutex);
+
+	if (!hpb->next_bridge)
+		goto out;
+
+	if (bridge_being_removed && bridge_being_removed != hpb->next_bridge)
+		goto out;
+
+	dev_dbg(hpb->dev, "releasing next bridge (%pOFn)\n", hpb->next_bridge->of_node);
+
+	hotplug_bridge_detach_from_encoder_chain(hpb);
+
+	/*
+	 * This will check that the bridge actually belongs to panel-bridge
+	 * before doing anything with it, so we can safely always call it.
+	 */
+	drm_panel_bridge_remove(hpb->next_bridge);
+	hpb->next_bridge = NULL;
+
+	queue_work(system_wq, &hpb->hpd_work);
+
+out:
+	mutex_unlock(&hpb->next_bridge_mutex);
+}
+
+static int hotplug_bridge_notifier_call(struct notifier_block *block,
+					unsigned long event, void *private)
+{
+	struct hotplug_bridge *hpb = container_of(block, struct hotplug_bridge, notifier_block);
+	struct drm_bridge *bridge = private;
+
+	switch (event) {
+	case DRM_BRIDGE_NOTIFY_ADD:
+		hotplug_bridge_grab(hpb);
+		break;
+	case DRM_BRIDGE_NOTIFY_REMOVE:
+		hotplug_bridge_release(hpb, bridge);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int hotplug_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct hotplug_bridge *hpb = hotplug_bridge_from_drm_bridge(bridge);
+	struct device *dev = hpb->dev;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder = hpb->bridge.encoder;
+	int err;
+
+	/* Encoder was not yet provided to our bridge */
+	if (!encoder)
+		return -ENODEV;
+
+	/* Connector was already created */
+	if (hpb->connector)
+		return dev_err_probe(dev, -EBUSY, "connector already created\n");
+
+	connector = drm_bridge_connector_init(bridge->dev, encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(dev, PTR_ERR(connector), "failed to initialize connector\n");
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	hpb->connector = connector;
+
+	drm_connector_register(connector);
+
+	mutex_lock(&hpb->next_bridge_mutex);
+	err = hotplug_bridge_attach_to_encoder_chain(hpb);
+	mutex_unlock(&hpb->next_bridge_mutex);
+
+	/* -ENODEV is acceptable, in case next_bridge is not yet known */
+	if (err == -ENODEV)
+		err = 0;
+
+	return err;
+}
+
+static void hotplug_bridge_detach(struct drm_bridge *bridge)
+{
+	struct hotplug_bridge *hpb = hotplug_bridge_from_drm_bridge(bridge);
+
+	mutex_lock(&hpb->next_bridge_mutex);
+	hotplug_bridge_detach_from_encoder_chain(hpb);
+	mutex_unlock(&hpb->next_bridge_mutex);
+
+	if (hpb->connector) {
+		drm_connector_unregister(hpb->connector);
+		drm_connector_cleanup(hpb->connector);
+		hpb->connector = NULL;
+	}
+}
+
+static enum drm_connector_status hotplug_bridge_detect(struct drm_bridge *bridge)
+{
+	struct hotplug_bridge *hpb = hotplug_bridge_from_drm_bridge(bridge);
+
+	return hpb->next_bridge ? connector_status_connected : connector_status_disconnected;
+}
+
+static void hotplug_bridge_hpd_work_func(struct work_struct *work)
+{
+	struct hotplug_bridge *hpd = container_of(work, struct hotplug_bridge, hpd_work);
+
+	if (hpd->bridge.dev)
+		drm_helper_hpd_irq_event(hpd->bridge.dev);
+}
+
+static int hotplug_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
+{
+	struct hotplug_bridge *hpb = hotplug_bridge_from_drm_bridge(bridge);
+	struct drm_bridge *br;
+	int nmodes = 0;
+
+	mutex_lock(&hpb->next_bridge_mutex);
+
+	if (!hpb->next_bridge || !hpb->bridge.encoder)
+		goto out;
+
+	/*
+	 * In non-removable pipelines, drm_bridge_connector_init() stores
+	 * in the bridge_connector a pointer to the first bridge having
+	 * OP_MODES (typically the panel bridge), so the .get_modes op will
+	 * be automatically be called on that bridge. In our case the
+	 * connector is created once when attaching to the encoder, but the
+	 * panel bridge will appear later and can disappear and change at
+	 * runtime, so we need to look for it every time dynamically.
+	 */
+	br = hpb->next_bridge;
+	list_for_each_entry_from(br, &hpb->bridge.encoder->bridge_chain, chain_node) {
+		if (br->ops & DRM_BRIDGE_OP_MODES) {
+			nmodes = br->funcs->get_modes(br, connector);
+			break;
+		}
+	}
+
+out:
+	mutex_unlock(&hpb->next_bridge_mutex);
+
+	return nmodes;
+}
+
+static const struct drm_bridge_funcs hotplug_bridge_funcs = {
+	.attach		= hotplug_bridge_attach,
+	.detach		= hotplug_bridge_detach,
+	.detect		= hotplug_bridge_detect,
+	.get_modes	= hotplug_bridge_get_modes,
+};
+
+static int hotplug_bridge_dsi_detach(struct mipi_dsi_host *host,
+				     struct mipi_dsi_device *device_remote)
+{
+	struct hotplug_bridge *hpb = dev_get_drvdata(host->dev);
+
+	if (!hpb->dsi_dev)
+		return -ENODEV;
+
+	mipi_dsi_detach(hpb->dsi_dev);
+	mipi_dsi_device_unregister(hpb->dsi_dev);
+	hpb->dsi_dev = NULL;
+
+	return 0;
+}
+
+/*
+ * Attach the local DSI device to the upstream DSI host, possibly with a
+ * "null" format.
+ *
+ * In "normal" bridges this function should be _only_ used as the .attach
+ * callback of hotplug_bridge_dsi_ops. But "normal" bridges have their
+ * downstream DSI device always connected, which we don't. When booting
+ * without anything connected downstream, our upstream bridge could be not
+ * even calling drm_bridge_add() until we do attach ourselves as a DSI
+ * device, preventing the whole DRM card from being instantiated.
+ *
+ * In order to always have a DRM card after boot, we do call this same
+ * function while probing in order to attach as a DSI device to the DSI
+ * master. However during probe we don't know the bus format yet. It would
+ * be nice to be able to update the format afterwards when a downstream DSI
+ * device is attaching to our local host, but there is no callback for
+ * that. To overcome this limitation, this function can be called in two
+ * ways:
+ *
+ * - during probe, to make the upstream bridge happy, when there is no
+ *   next_dsi_dev yet and thus the lanes/format/etc are unknown
+ * - as the mipi_dsi_host_ops.attach callback proper, as soon as the
+ *   next_dsi_dev is known
+ *
+ * The resulting call sequence is:
+ *
+ * 1. hotplug_bridge_dsi_attach() called by hotplug_bridge_probe() with
+ *    next_dsi_dev == NULL: we attach to the host but with a fake format
+ *    so the DRM card can be populated. hpb->dsi_dev becomes non-NULL.
+ * 2. hotplug_bridge_dsi_attach() called as .attach callback from a
+ *    downstream device when it becomes available: we need to detach in
+ *    order to re-attach with the format of the device. hpb->dsi_dev
+ *    is found non-NULL, then reused so it will be non-NULL again.
+ * 3. hotplug_bridge_dsi_detach() called as the .detach callback by a
+ *    downstream device: cleans up everything normally. hpb->dsi_dev goes
+ *    from non-NULL to NULL.
+ * 4. hotplug_bridge_dsi_attach() called by a downstream device: attaches
+ *    normally to the upstream DSI host. hpb->dsi_dev goes from NULL to
+ *    non-NULL.
+ *
+ * Steps 3 and 4 are the "normal" attach/detach steps as on "normal"
+ * bridges.
+ *
+ * Steps 1 and 2 happen only the first time, steps 3 and 4 will happen
+ * every time the downstream bridge disconnects and reconnects.
+ */
+static int hotplug_bridge_dsi_attach(struct mipi_dsi_host *host,
+				     struct mipi_dsi_device *next_dsi_dev)
+{
+	struct device *dev = host->dev;
+	struct hotplug_bridge *hpb = dev_get_drvdata(dev);
+	struct mipi_dsi_device *dsi_dev;
+	const struct mipi_dsi_device_info dsi_info = {
+		.type = "hotplug-bridge",
+		.channel = 0,
+		.node = NULL,
+	};
+	int err;
+
+	/*
+	 * Step 2 only (first time we are called for an actual device
+	 * attaching): clean up the fake attach done at step 1
+	 */
+	if (hpb->dsi_dev)
+		hotplug_bridge_dsi_detach(&hpb->dsi_host, NULL);
+
+	/* Register a local DSI device with the remote DSI host */
+	dsi_dev = mipi_dsi_device_register_full(hpb->prev_dsi_host,
+						&dsi_info);
+	if (IS_ERR(dsi_dev))
+		return PTR_ERR(dsi_dev);
+
+	/* At step 1 we have no downstream device to get the format from */
+	if (next_dsi_dev) {
+		dsi_dev->channel    = next_dsi_dev->channel;
+		dsi_dev->lanes      = next_dsi_dev->lanes;
+		dsi_dev->format     = next_dsi_dev->format;
+		dsi_dev->mode_flags = next_dsi_dev->mode_flags;
+	}
+
+	/* Attach our local DSI device to the remote DSI host */
+	err = mipi_dsi_attach(dsi_dev);
+	if (err) {
+		mipi_dsi_device_unregister(dsi_dev);
+		return dev_err_probe(dev, err, "failed to attach hotplug dsi device to host\n");
+	}
+
+	hpb->dsi_dev = dsi_dev;
+
+	return 0;
+}
+
+/*
+ * Propagate mipi_dsi_device_transfer() to the upstream DSI host.
+ *
+ * Reimplements identically the minimal needed part of
+ * mipi_dsi_device_transfer(), including the -ENOSYS return value.
+ */
+static ssize_t hotplug_bridge_dsi_transfer(struct mipi_dsi_host *host,
+					   const struct mipi_dsi_msg *msg)
+{
+	struct hotplug_bridge *hpb = dev_get_drvdata(host->dev);
+	const struct mipi_dsi_host_ops *ops;
+
+	if (!hpb->dsi_dev)
+		return -ENODEV;
+
+	ops = hpb->dsi_dev->host->ops;
+
+	if (!ops || !ops->transfer)
+		return -ENOSYS;
+
+	return ops->transfer(hpb->dsi_dev->host, msg);
+}
+
+static const struct mipi_dsi_host_ops hotplug_bridge_dsi_ops = {
+	.attach		= hotplug_bridge_dsi_attach,
+	.detach		= hotplug_bridge_dsi_detach,
+	.transfer	= hotplug_bridge_dsi_transfer,
+};
+
+/*
+ * Find the upstream DSI host and register our downstream-facing DSI host.
+ */
+static int hotplug_bridge_dsi_setup(struct hotplug_bridge *hpb)
+{
+	struct device *dev = hpb->dev;
+	struct device_node *endpoint;
+	struct device_node *node;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	node = of_graph_get_remote_port_parent(endpoint);
+
+	hpb->prev_dsi_host = of_find_mipi_dsi_host_by_node(node);
+
+	of_node_put(node);
+	of_node_put(endpoint);
+
+	if (!hpb->prev_dsi_host)
+		return -EPROBE_DEFER;
+
+	hpb->dsi_host.dev = dev;
+	hpb->dsi_host.ops = &hotplug_bridge_dsi_ops;
+
+	return mipi_dsi_host_register(&hpb->dsi_host);
+}
+
+static void hotplug_bridge_dsi_cleanup(struct hotplug_bridge *hpb)
+{
+	mipi_dsi_host_unregister(&hpb->dsi_host);
+}
+
+static int hotplug_bridge_probe(struct platform_device *platform_dev)
+{
+	struct device *dev = &platform_dev->dev;
+	struct notifier_block *notifier_block;
+	struct hotplug_bridge *hpb;
+	struct drm_bridge *bridge;
+	int ret;
+
+	hpb = devm_kzalloc(dev, sizeof(*hpb), GFP_KERNEL);
+	if (!hpb)
+		return -ENOMEM;
+
+	hpb->dev = dev;
+
+	mutex_init(&hpb->next_bridge_mutex);
+	INIT_WORK(&hpb->hpd_work, hotplug_bridge_hpd_work_func);
+
+	notifier_block = &hpb->notifier_block;
+	notifier_block->notifier_call = hotplug_bridge_notifier_call;
+
+	ret = hotplug_bridge_dsi_setup(hpb);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to setup DSI\n");
+
+	bridge = &hpb->bridge;
+	bridge->of_node = dev->of_node;
+	bridge->funcs = &hotplug_bridge_funcs;
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
+	bridge->ops |= DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES;
+
+	platform_set_drvdata(platform_dev, hpb);
+
+	devm_drm_bridge_add(dev, bridge);
+
+	ret = hotplug_bridge_dsi_attach(&hpb->dsi_host, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed first attach to upstream DSI host\n");
+
+	/* To be notified when the next bridge appears... */
+	drm_bridge_notifier_register(notifier_block);
+
+	/* ...but also check now, in case the next bridge was probed earlier */
+	hotplug_bridge_grab(hpb);
+
+	return 0;
+}
+
+static void hotplug_bridge_remove(struct platform_device *platform_dev)
+{
+	struct hotplug_bridge *hpb = platform_get_drvdata(platform_dev);
+
+	cancel_work_sync(&hpb->hpd_work);
+
+	drm_bridge_notifier_unregister(&hpb->notifier_block);
+
+	hotplug_bridge_release(hpb, NULL);
+
+	hotplug_bridge_dsi_cleanup(hpb);
+}
+
+static const struct of_device_id hotplug_bridge_of_match[] = {
+	{ .compatible	= "hotplug-video-connector-dsi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, hotplug_bridge_of_match);
+
+static struct platform_driver hotplug_bridge_driver = {
+	.probe		= hotplug_bridge_probe,
+	.remove_new	= hotplug_bridge_remove,
+	.driver		= {
+		.name		= "hotplug-drm-bridge",
+		.of_match_table	= hotplug_bridge_of_match,
+	},
+};
+
+module_platform_driver(hotplug_bridge_driver);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_DESCRIPTION("Hotplug DRM Bridge");
+MODULE_LICENSE("GPL");

-- 
2.34.1

