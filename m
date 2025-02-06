Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46853A2B032
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45F10E91A;
	Thu,  6 Feb 2025 18:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YimDnbJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291510E91A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A3D43297;
 Thu,  6 Feb 2025 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBfiLtFh0wan0anUirVMv2KVTez36OIDHAf1JqafqA8=;
 b=YimDnbJSdT8tEJ4UCzUi+Ix87kp0yelbhOF5WHznixV7QMIiIBN0+WOTfKWPJq0foiYiJA
 16j0CKFzJbqzn7/ZwOCvJdjpd7GM71mGcFJiD7fBY5+Jl4RoaMXRDvr38U9XhjHW6jismn
 YF3xfJ97ZOrfbwpKq7bceTpDtxoBy46cwZu4s1dyCb9gQtDgMJelFDf+aKFFo+sDnxnh+6
 kBeMpZgeca7tLKk0fdywYeobPQe2oBhVYxko5BAKpFgJCwF72/D61ZQnZYSobmi3LfSXUa
 bzuO86rk24MoeDlaoSdyyHrex4UPzKFv2Z6N2WsJaTGVSTKHQunclwcPczR6HQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:41 +0100
Subject: [PATCH v6 26/26] drm/bridge: hotplug-bridge: add driver to support
 hot-pluggable DSI bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-26-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdekfeekgfejieeggfdvgfejieekjeeuuedttddugfelgfegtddufeekffeljeeknecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrn
 hgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

This driver implements the physical connector on a video pipeline allowing
to remove of all the following bridges up to the panel.

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

This driver supports such a device, where the final segment of a MIPI DSI
bus, including one or more bridges, can be physically disconnected and
reconnected at runtime, possibly with a different model.

The add-on supported by this driver has a MIPI DSI bus traversing the
hotplug connector and a DSI to LVDS bridge and an LVDS panel on the add-on.
Hovever this driver is designed to be as far as possible generic and
extendable to other busses that have no native hotplug and model ID
discovery.

This driver does not itself add and remove the bridges or panel on the
add-on: this needs to be done by other means, e.g. device tree overlay
runtime insertion and removal. The hotplug-bridge gets notified by the DRM
bridge core after a removable bridge gets added or before it is removed.

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
 * add/remove an LVDS connector on hot(un)plug, similarly to what the
   DisplayPort MST code does

However some aspects make it a bit more complex than that. Most notably:

 * the next bridge can be probed and removed at any moment and all probing
   sequences need to be handled
 * the DSI host/device registration process, which adds to the DRM bridge
   attach process, makes the initial card registration tricky
 * the need to register and deregister the following bridges at runtime
   without tearing down the whole DRM card prevents using some of the
   functions that are normally recommended
 * the automatic mechanism to call the appropriate .get_modes operation
   (typically provided by the panel bridge) cannot work as the panel can
   disappear and reappear as a different model, so an ad-hoc lookup is
   needed

The code handling these and other tricky aspects is accurately documented
by comments in the code.

Additionally this driver is adding a DSI connector representing the video
lines of the hotplug connector; the status is always "disconnected" (no
panel is ever attached directly to it). This is supposed to disappear but
it is still present for now. For this reason the userspace representation
when the add-on is not connected is:

  # modetest -c  | grep -i '^[a-z0-9]'
  Connectors:
  id    encoder status          name        size (mm)     modes   encoders
  38    0       disconnected    DSI-1       0x0           0       37

And when it is connected, when the new connector appears, it becomes:

  # modetest -c  | grep -i '^[a-z0-9]'
  Connectors:
  id    encoder status          name        size (mm)     modes   encoders
  38    0       disconnected    DSI-1       0x0           0       37
  39    0       connected       LVDS-1      344x194       1       37

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

*NOTE* In the grand plan, the "DSI-1" connector is not going to be present
       and this driver might be removed entirely.

Changed in v6:
 - update to use devm_drm_bridge_alloc(), remove .destroy
 - use the devm APIs to get/put the next bridge pointer, remove open-coded
   search code
 - stop managing a panel bridge: the following component is not necessarily
   a panel

Changed in v5:
 - use drm_bridge dynamic lifetime management
 - refcount bridge_modes and next_bridge via drm_bridge_get()/drm_bridge_put()
 - fix dynconn removal by using drm_connector_put() and making the .destroy
   callback work
 - add hotplug_bridge_grab() in hotplug_bridge_attach() to handle the case
   where the encoder driver is probed last
 - migrate platform driver from .remove_new to .remove

Changed in v4:
 - convert from generic notifiers to the new bridge_event_notify bridge
   func
 - improved and updated commit message, adding 'modetest' output
   with/without add-on
 - select DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR, required after
   commit 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER
   module")

Changed in v3:
 - dynamically add/remove the LVDS connector on hot(un)plug
 - take the firmware node normally via dev->of_node instead of using
   device_set_node(); this makes code more self-contained and generic
 - minor rewordings and cleanups

Changed in v2:
 - change to be a platform device instantiated from the connector driver
   instead of a self-standing OF driver
 - add missing error handling for devm_drm_bridge_add()
 - various cleanups and style improvements
 - fix typo in comment
---
 MAINTAINERS                             |   5 +
 drivers/gpu/drm/bridge/Kconfig          |  17 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c | 666 ++++++++++++++++++++++++++++++++
 4 files changed, 689 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 090153a4f40aa3ec4982c85c809a97dca0396ab8..992e1421cd2450b81dbc0d436fbddf4d4af97e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7268,6 +7268,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
 
+DRM DRIVER FOR HOTPLUG VIDEO CONNECTOR BRIDGE
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/hotplug-bridge.c
+
 DRM DRIVER FOR HX8357D PANELS
 S:	Orphan
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 393214e6ed6656674d2ffbfc36d45541253bc31d..98436ab7a9da50fb09ded823b19cb0c8f4d4e484 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,23 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_HOTPLUG_BRIDGE
+	tristate "Hotplug DRM bridge support"
+	depends on OF
+	select DRM_PANEL_BRIDGE
+	select DRM_MIPI_DSI
+	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	help
+	  Driver for a DRM bridge representing a physical connector that
+	  splits a DRM pipeline into a fixed part and a physically
+	  removable part. The fixed part includes up to the encoder and
+	  zero or more bridges. The removable part includes any following
+	  bridges up to the connector and panel and can be physically
+	  removed and connected at runtime, possibly with different
+	  components.
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 97304b429a530c108dcbff906965cda091b0a7a2..2f6ae1a97d15045316ee191c04dbc65650162bab 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_HOTPLUG_BRIDGE) += hotplug-bridge.o
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/bridge/hotplug-bridge.c b/drivers/gpu/drm/bridge/hotplug-bridge.c
new file mode 100644
index 0000000000000000000000000000000000000000..0912397dabb90605d219d7aa59251d39c846d0cb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/hotplug-bridge.c
@@ -0,0 +1,666 @@
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
+/*
+ * Internal hotplug-bridge data.
+ *
+ * We have two 'struct drm_connector' here:
+ * - fixconn represents the DSI video lines on the hotplug connector where
+ *   the removable part attaches. It is thus always instantiated.
+ * - dynconn represents the LVDS video lines where the panel is attached.
+ *   It is part of the removable part of the video pipeline and as such is
+ *   added and removed dynamically based on when the downstream devices
+ *   appear and disappear.
+ */
+struct hotplug_bridge {
+	struct device *dev;
+
+	/* Local bridge */
+	struct drm_bridge bridge;
+
+	/* Always-present connector (where the removal part will connect to) */
+	struct drm_connector *fixconn;
+
+	/* Downstream bridge (next in the chain) */
+	struct drm_bridge *next_bridge;
+	/* Protect next_bridge */
+	struct mutex next_bridge_mutex;
+
+	/* Pointer to the last bridge exposing OP_MODES */
+	struct drm_bridge *bridge_modes;
+
+	/* The "tail" connector that gets added/removed at runtime */
+	struct drm_connector dynconn;
+
+	/* Local DSI host, for the downstream DSI device to attach to */
+	struct mipi_dsi_host dsi_host;
+	/* Local DSI device, attached to the upstream DSI host */
+	struct mipi_dsi_device *dsi_dev;
+	/* Upstream DSI host (the actual DSI controller) */
+	struct mipi_dsi_host *prev_dsi_host;
+
+	struct work_struct hpd_work;
+};
+
+static struct hotplug_bridge *hotplug_bridge_from_drm_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct hotplug_bridge, bridge);
+}
+
+/* --------------------------------------------------------------------------
+ * dynconn implementation
+ */
+static struct hotplug_bridge *hotplug_bridge_from_dynconn(struct drm_connector *conn)
+{
+	return container_of(conn, struct hotplug_bridge, dynconn);
+}
+
+static int hotplug_bridge_dynconn_get_modes(struct drm_connector *connector)
+{
+	struct hotplug_bridge *hpb = hotplug_bridge_from_dynconn(connector);
+
+	if (hpb->bridge_modes)
+		return hpb->bridge_modes->funcs->get_modes(hpb->bridge_modes, connector);
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs hotplug_bridge_dynconn_connector_helper_funcs = {
+	.get_modes = hotplug_bridge_dynconn_get_modes,
+};
+
+static void hotplug_bridge_dynconn_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs dynconn_funcs = {
+	.destroy                    = hotplug_bridge_dynconn_destroy,
+	.atomic_duplicate_state     = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state       = drm_atomic_helper_connector_destroy_state,
+	.fill_modes                 = drm_helper_probe_single_connector_modes,
+};
+
+/*
+ * In non-removable pipelines using a "bridge connector",
+ * drm_bridge_connector_init() stores in the bridge_connector a pointer to
+ * the last bridge having OP_MODES (typically the panel bridge), so the
+ * .get_modes op will automatically be called on that bridge (it also takes
+ * pointers to other bridges which we don't care about). The "bridge
+ * connector" is too restrictive for our use case so we cannot use it. But
+ * we need a pointer to the modes-providing bridge, so we need to replicate
+ * that bit of its logic.
+ *
+ * If no modes bridge is found, nothing is done. This is allowed.
+ *
+ * Also get the modes bridge to tie its lifetime to ours.
+ */
+static void hotplug_bridge_dynconn_bridge_modes_get(struct hotplug_bridge *hpb)
+{
+	struct drm_bridge *bridge;
+
+	if (WARN_ON(!hpb->next_bridge || !hpb->bridge.encoder))
+		return;
+
+	drm_for_each_bridge_in_chain(hpb->bridge.encoder, bridge)
+		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
+			drm_bridge_get(bridge);
+			hpb->bridge_modes = bridge;
+		}
+}
+
+static void hotplug_bridge_dynconn_bridge_modes_put(struct hotplug_bridge *hpb)
+{
+	if (hpb->bridge_modes)
+		drm_bridge_put_and_clear(&hpb->bridge_modes);
+}
+
+static int hotplug_bridge_dynconn_add(struct hotplug_bridge *hpb)
+{
+	int err;
+
+	err = drm_connector_init(hpb->bridge.dev, &hpb->dynconn, &dynconn_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (err)
+		return err;
+
+	drm_atomic_helper_connector_reset(&hpb->dynconn);
+
+	drm_connector_helper_add(&hpb->dynconn,
+				 &hotplug_bridge_dynconn_connector_helper_funcs);
+
+	drm_connector_attach_encoder(&hpb->dynconn, hpb->bridge.encoder);
+	if (err)
+		goto err_cleanup;
+
+	hotplug_bridge_dynconn_bridge_modes_get(hpb);
+
+	err = drm_connector_register(&hpb->dynconn);
+	if (err)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	drm_connector_cleanup(&hpb->dynconn);
+	hotplug_bridge_dynconn_bridge_modes_put(hpb);
+	return err;
+}
+
+/* ----------------------------------------------------------------------- */
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
+	int err;
+
+	mutex_lock(&hpb->next_bridge_mutex);
+
+	if (hpb->next_bridge)
+		goto out_unlock;
+
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		goto out_unlock;
+
+	hpb->next_bridge = bridge;
+
+	dev_dbg(dev, "grabbed next bridge (%pOFn)\n", hpb->next_bridge->of_node);
+
+	hpb->bridge.pre_enable_prev_first = hpb->next_bridge->pre_enable_prev_first;
+
+	err = hotplug_bridge_attach_to_encoder_chain(hpb);
+	if (err)
+		goto err_panel_bridge_remove;
+
+	err = hotplug_bridge_dynconn_add(hpb);
+	if (err)
+		goto err_detach_from_encoder_chain;
+
+	queue_work(system_wq, &hpb->hpd_work);
+	goto out_unlock;
+
+err_detach_from_encoder_chain:
+	hotplug_bridge_detach_from_encoder_chain(hpb);
+err_panel_bridge_remove:
+	devm_drm_put_and_clear_bridge(dev, &hpb->next_bridge);
+out_unlock:
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
+	struct device *dev = hpb->dev;
+
+	mutex_lock(&hpb->next_bridge_mutex);
+
+	if (!hpb->next_bridge)
+		goto out;
+
+	if (bridge_being_removed && bridge_being_removed != hpb->next_bridge)
+		goto out;
+
+	if (hpb->bridge_modes)
+		hotplug_bridge_dynconn_bridge_modes_put(hpb);
+
+	dev_dbg(dev, "releasing next bridge (%pOFn)\n", hpb->next_bridge->of_node);
+	hotplug_bridge_detach_from_encoder_chain(hpb);
+
+	dev_dbg(dev, "removing %s connector\n", hpb->dynconn.name);
+	drm_connector_put(&hpb->dynconn);
+
+	devm_drm_put_and_clear_bridge(dev, &hpb->next_bridge);
+
+	queue_work(system_wq, &hpb->hpd_work);
+
+out:
+	mutex_unlock(&hpb->next_bridge_mutex);
+}
+
+static void hotplug_bridge_bridge_event_notify(struct drm_bridge *bridge,
+					       enum drm_bridge_event_type event,
+					       struct drm_bridge *event_bridge)
+{
+	struct hotplug_bridge *hpb = container_of(bridge, struct hotplug_bridge, bridge);
+
+	switch (event) {
+	case DRM_EVENT_BRIDGE_ADD:
+		hotplug_bridge_grab(hpb);
+		break;
+	case DRM_EVENT_BRIDGE_REMOVE:
+		hotplug_bridge_release(hpb, event_bridge);
+		break;
+	}
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
+	if (hpb->fixconn)
+		return dev_err_probe(dev, -EBUSY, "connector already created\n");
+
+	connector = drm_bridge_connector_init(bridge->dev, encoder);
+	if (IS_ERR(connector))
+		return dev_err_probe(dev, PTR_ERR(connector), "failed to initialize connector\n");
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	hpb->fixconn = connector;
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
+	/*
+	 * If the encoder driver is probed last, the
+	 * hotplug_bridge_attach_to_encoder_chain() call in
+	 * hotplug_bridge_grab() fails because hpb->bridge.encoder is still
+	 * NULL, and hotplug_bridge_grab() will not have another chance to
+	 * execute. So call it now, at the end of the encoder attach
+	 * process.
+	 */
+	hotplug_bridge_grab(hpb);
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
+	if (hpb->fixconn) {
+		drm_connector_unregister(hpb->fixconn);
+		drm_connector_cleanup(hpb->fixconn);
+		hpb->fixconn = NULL;
+	}
+}
+
+/*
+ * The fixed connector is never attached to a panel, so it should always be
+ * reported as disconnected.
+ */
+static enum drm_connector_status hotplug_bridge_detect(struct drm_bridge *bridge)
+{
+	return connector_status_disconnected;
+}
+
+static void hotplug_bridge_hpd_work_func(struct work_struct *work)
+{
+	struct hotplug_bridge *hpb = container_of(work, struct hotplug_bridge, hpd_work);
+
+	if (hpb->bridge.dev)
+		drm_helper_hpd_irq_event(hpb->bridge.dev);
+}
+
+static const struct drm_bridge_funcs hotplug_bridge_funcs = {
+	.attach			= hotplug_bridge_attach,
+	.detach			= hotplug_bridge_detach,
+	.detect			= hotplug_bridge_detect,
+	.bridge_event_notify	= hotplug_bridge_bridge_event_notify,
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
+static int hotplug_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hotplug_bridge *hpb;
+	struct drm_bridge *bridge;
+	int err;
+
+	hpb = devm_drm_bridge_alloc(dev, struct hotplug_bridge, bridge, &hotplug_bridge_funcs);
+	if (IS_ERR(hpb))
+		return PTR_ERR(hpb);
+
+	hpb->dev = dev;
+
+	mutex_init(&hpb->next_bridge_mutex);
+	INIT_WORK(&hpb->hpd_work, hotplug_bridge_hpd_work_func);
+
+	err = hotplug_bridge_dsi_setup(hpb);
+	if (err)
+		return dev_err_probe(dev, err, "failed to setup DSI\n");
+
+	bridge = &hpb->bridge;
+	bridge->of_node = dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
+	bridge->ops |= DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD;
+
+	platform_set_drvdata(pdev, hpb);
+
+	err = devm_drm_bridge_add(dev, bridge);
+	if (err) {
+		dev_err_probe(dev, err, "failed adding bridge\n");
+		goto err_dsi_cleanup;
+	}
+
+	err = hotplug_bridge_dsi_attach(&hpb->dsi_host, NULL);
+	if (err) {
+		dev_err_probe(dev, err, "failed first attach to upstream DSI host\n");
+		goto err_dsi_cleanup;
+	}
+
+	/*
+	 * Since devm_drm_bridge_add() we can be notified of any bridges
+	 * appearing, but also check now, in case the next bridge was
+	 * probed earlier
+	 */
+	hotplug_bridge_grab(hpb);
+
+	return 0;
+
+err_dsi_cleanup:
+	hotplug_bridge_dsi_cleanup(hpb);
+	return err;
+}
+
+static void hotplug_bridge_remove(struct platform_device *pdev)
+{
+	struct hotplug_bridge *hpb = platform_get_drvdata(pdev);
+
+	cancel_work_sync(&hpb->hpd_work);
+
+	hotplug_bridge_release(hpb, NULL);
+
+	hotplug_bridge_dsi_cleanup(hpb);
+}
+
+static const struct platform_device_id hotplug_bridge_platform_ids[] = {
+	{ .name = "hotplug-dsi-bridge" },
+	{},
+};
+MODULE_DEVICE_TABLE(platform, hotplug_bridge_platform_ids);
+
+static struct platform_driver hotplug_bridge_driver = {
+	.probe		= hotplug_bridge_probe,
+	.remove		= hotplug_bridge_remove,
+	.id_table	= hotplug_bridge_platform_ids,
+	.driver		= {
+		.name		= "hotplug-drm-bridge",
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

