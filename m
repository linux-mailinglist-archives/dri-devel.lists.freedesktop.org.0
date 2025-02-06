Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF322A2B017
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019810E904;
	Thu,  6 Feb 2025 18:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SiKEVP/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229BA10E904
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:14:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09201442BE;
 Thu,  6 Feb 2025 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClZenlZkreIR18gU2iJqAyPZKi/vUkaFG3bGFi6CUoA=;
 b=SiKEVP/u1tuzm0LYaI/VilTC4uLEPoAPX+ZddcGMjo2Fti3XBCLUaTln2UY6xtqzPETR85
 EBntDFeyquBpYs/tIIMgH2h27s4bfSpO88m4jJUW7fwgYtCLzusd3DsbWIzFQyukDK+7/0
 KpqcnwNijjNWlwe/9zEPFizVuEWaLLhrCr4o+r/K3ThVS0Mv9ShC0ZkvbDmLlJFsb7poyb
 qFajZodZgC7jtQQTHNCFwNeMFpgPT4w42Mw7DhezmoAxAAJ6a+8m/BVUsoLCW3+dGa4mDo
 QzpBMqRgl/ZOUseK/DaJu8p6SioFJ+FdwusL7b14ttbC8YNk48DgBj6DgmN5mA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:21 +0100
Subject: [PATCH v6 06/26] drm/panel: move all code into bridge/panel.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-6-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleeuudeifeelkefgfeefhedtgfetfefhgfevueeufffffeeulefhieeiheegvdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

In preparation to let panels always create a panel bridge, we need the
drm_panel.c code to call bridge/panel.c code. However this would create a
cyclic dependency between .c files and between modules (drm ->
drm_kms_helper -> drm), indeed now the two components would depend on each
other.

In the short term, resolve this by moving all code to a single file so both
will end up in the drm_kms_helper module. As a beneficial side effect, this
will slightly reduce code size for configurations without bridges and
panels.

This step also requires moving drm_of_find_panel_or_bridge() from drm_of.c
because it is referenced by devm_drm_of_get_bridge() and
drmm_of_get_bridge().

In the long term, a good plan is probably that the panel becomes just "a
bridge", embedding a struct drm_bridge instead of allocating it separately.

In addition to moving around code without changing it, other changes are:

 * update Makefile
 * update #includes as needed
 * update bridge/Kconfig to select DRM_PANEL_BRIDGE instead of DRM_PANEL
 * update MAINTAINERS
 * fix a trivial checkpatch issue

Link: https://lore.kernel.org/all/emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw/
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 Documentation/gpu/drm-kms-helpers.rst   |   5 +-
 MAINTAINERS                             |   1 -
 drivers/gpu/drm/Makefile                |   1 -
 drivers/gpu/drm/atmel-hlcdc/Kconfig     |   2 +-
 drivers/gpu/drm/bridge/Kconfig          |  25 +-
 drivers/gpu/drm/bridge/panel.c          | 610 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_kms_helper_common.c |   1 +
 drivers/gpu/drm/drm_of.c                |  68 ----
 drivers/gpu/drm/drm_panel.c             | 575 ------------------------------
 9 files changed, 626 insertions(+), 662 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b4ee25af1702b0019e0de5f9ee66d2dbdac2c664..79c8d3e63f7e06136440ed38972697b5f057d5d1 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -209,15 +209,12 @@ Panel-Bridge Helper Reference
 Panel Helper Reference
 ======================
 
-.. kernel-doc:: drivers/gpu/drm/drm_panel.c
+.. kernel-doc:: drivers/gpu/drm/bridge/panel.c
    :doc: drm panel
 
 .. kernel-doc:: include/drm/drm_panel.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_panel.c
-   :export:
-
 .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
    :export:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index f789e9e54110914dc266fb7d1937a92277c507bb..090153a4f40aa3ec4982c85c809a97dca0396ab8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7996,7 +7996,6 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/
-F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56772077973c864df71e4b8e0bf99b..98a42805b529ccf307e3a78857be47b544a601d8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -79,7 +79,6 @@ drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client_modeset.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
-drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += \
diff --git a/drivers/gpu/drm/atmel-hlcdc/Kconfig b/drivers/gpu/drm/atmel-hlcdc/Kconfig
index f8b9c91907d8ec697d072269090da8deaa54a6d9..7360991307ceaf7a4a594b1586114b2b7d6c1253 100644
--- a/drivers/gpu/drm/atmel-hlcdc/Kconfig
+++ b/drivers/gpu/drm/atmel-hlcdc/Kconfig
@@ -5,7 +5,7 @@ config DRM_ATMEL_HLCDC
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this option if you have an ATMEL SoC with an HLCDC display
 	  controller (i.e. at91sam9n12, at91sam9x5 family or sama5d3 family).
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa80f096ac6a0548ed342e802ae68b..393214e6ed6656674d2ffbfc36d45541253bc31d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -10,7 +10,7 @@ config DRM_PANEL_BRIDGE
 	depends on DRM_BRIDGE
 	select DRM_PANEL
 	help
-	  DRM bridge wrapper of DRM panels
+	  DRM panels (including DRM bridge wrapper of such panels)
 
 config DRM_AUX_BRIDGE
 	tristate
@@ -195,7 +195,7 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  This is a driver for the display bridges of
 	  GE B850v3 that convert dual channel LVDS
@@ -230,14 +230,14 @@ config DRM_NXP_PTN3460
 	tristate "NXP PTN3460 DP/LVDS bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  NXP PTN3460 eDP-LVDS bridge chip driver.
 
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -251,7 +251,7 @@ config DRM_PARADE_PS8640
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this option if you have PS8640 for display
 	  The PS8640 is a high-performance and low-power
@@ -326,7 +326,7 @@ config DRM_TOSHIBA_TC358764
 	depends on OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 
@@ -338,7 +338,7 @@ config DRM_TOSHIBA_TC358767
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358767 eDP bridge chip driver.
 
@@ -347,7 +347,7 @@ config DRM_TOSHIBA_TC358768
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
@@ -360,15 +360,16 @@ config DRM_TOSHIBA_TC358775
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Toshiba TC358775 DSI/LVDS bridge chip driver.
 
 config DRM_TI_DLPC3433
 	tristate "TI DLPC3433 Display controller"
-	depends on DRM && DRM_PANEL
+	depends on DRM
 	depends on OF
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  TI DLPC3433 is a MIPI DSI based display controller bridge
@@ -400,7 +401,7 @@ config DRM_TI_SN65DSI83
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
@@ -413,7 +414,7 @@ config DRM_TI_SN65DSI86
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
 	select DRM_DISPLAY_DP_AUX_BUS
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c57036b06493a6922e2cae38bcd1733930ff0073..bd61e57e1a2dd3d1eb034da4f9213a6bcb3e6dc5 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -2,9 +2,12 @@
 /*
  * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  * Copyright (C) 2017 Broadcom
+ * Copyright (C) 2013 NVIDIA Corporation
  */
 
+#include <linux/backlight.h>
 #include <linux/debugfs.h>
+#include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -17,6 +20,613 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+static DEFINE_MUTEX(panel_lock);
+static LIST_HEAD(panel_list);
+
+/**
+ * DOC: drm panel
+ *
+ * The DRM panel helpers allow drivers to register panel objects with a
+ * central registry and provide functions to retrieve those panels in display
+ * drivers.
+ *
+ * For easy integration into drivers using the &drm_bridge infrastructure please
+ * take look at drm_panel_bridge_add() and devm_drm_panel_bridge_add().
+ */
+
+/**
+ * drm_panel_init - initialize a panel
+ * @panel: DRM panel
+ * @dev: parent device of the panel
+ * @funcs: panel operations
+ * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
+ *	the panel interface
+ *
+ * Initialize the panel structure for subsequent registration with
+ * drm_panel_add().
+ */
+void drm_panel_init(struct drm_panel *panel, struct device *dev,
+		    const struct drm_panel_funcs *funcs, int connector_type)
+{
+	INIT_LIST_HEAD(&panel->list);
+	INIT_LIST_HEAD(&panel->followers);
+	mutex_init(&panel->follower_lock);
+	panel->dev = dev;
+	panel->funcs = funcs;
+	panel->connector_type = connector_type;
+}
+EXPORT_SYMBOL(drm_panel_init);
+
+/**
+ * drm_panel_add - add a panel to the global registry
+ * @panel: panel to add
+ *
+ * Add a panel to the global registry so that it can be looked up by display
+ * drivers.
+ */
+void drm_panel_add(struct drm_panel *panel)
+{
+	mutex_lock(&panel_lock);
+	list_add_tail(&panel->list, &panel_list);
+	mutex_unlock(&panel_lock);
+}
+EXPORT_SYMBOL(drm_panel_add);
+
+/**
+ * drm_panel_remove - remove a panel from the global registry
+ * @panel: DRM panel
+ *
+ * Removes a panel from the global registry.
+ */
+void drm_panel_remove(struct drm_panel *panel)
+{
+	mutex_lock(&panel_lock);
+	list_del_init(&panel->list);
+	mutex_unlock(&panel_lock);
+}
+EXPORT_SYMBOL(drm_panel_remove);
+
+/**
+ * drm_panel_prepare - power on a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will enable power and deassert any reset signals to
+ * the panel. After this has completed it is possible to communicate with any
+ * integrated circuitry via a command bus.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_prepare(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->prepared) {
+		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
+		return 0;
+	}
+
+	mutex_lock(&panel->follower_lock);
+
+	if (panel->funcs && panel->funcs->prepare) {
+		ret = panel->funcs->prepare(panel);
+		if (ret < 0)
+			goto exit;
+	}
+	panel->prepared = true;
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_panel_prepare);
+
+/**
+ * drm_panel_unprepare - power off a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will completely power off a panel (assert the panel's
+ * reset, turn off power supplies, ...). After this function has completed, it
+ * is usually no longer possible to communicate with the panel until another
+ * call to drm_panel_prepare().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_unprepare(struct drm_panel *panel)
+{
+	struct drm_panel_follower *follower;
+	int ret;
+
+	if (!panel)
+		return -EINVAL;
+
+	/*
+	 * If you are seeing the warning below it likely means one of two things:
+	 * - Your panel driver incorrectly calls drm_panel_unprepare() in its
+	 *   shutdown routine. You should delete this.
+	 * - You are using panel-edp or panel-simple and your DRM modeset
+	 *   driver's shutdown() callback happened after the panel's shutdown().
+	 *   In this case the warning is harmless though ideally you should
+	 *   figure out how to reverse the order of the shutdown() callbacks.
+	 */
+	if (!panel->prepared) {
+		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
+		return 0;
+	}
+
+	mutex_lock(&panel->follower_lock);
+
+	list_for_each_entry(follower, &panel->followers, list) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+
+	if (panel->funcs && panel->funcs->unprepare) {
+		ret = panel->funcs->unprepare(panel);
+		if (ret < 0)
+			goto exit;
+	}
+	panel->prepared = false;
+
+	ret = 0;
+exit:
+	mutex_unlock(&panel->follower_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_panel_unprepare);
+
+/**
+ * drm_panel_enable - enable a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will cause the panel display drivers to be turned on
+ * and the backlight to be enabled. Content will be visible on screen after
+ * this call completes.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_enable(struct drm_panel *panel)
+{
+	int ret;
+
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->enabled) {
+		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
+		return 0;
+	}
+
+	if (panel->funcs && panel->funcs->enable) {
+		ret = panel->funcs->enable(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->enabled = true;
+
+	ret = backlight_enable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
+			     ret);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_enable);
+
+/**
+ * drm_panel_disable - disable a panel
+ * @panel: DRM panel
+ *
+ * This will typically turn off the panel's backlight or disable the display
+ * drivers. For smart panels it should still be possible to communicate with
+ * the integrated circuitry via any command bus after this call.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_disable(struct drm_panel *panel)
+{
+	int ret;
+
+	if (!panel)
+		return -EINVAL;
+
+	/*
+	 * If you are seeing the warning below it likely means one of two things:
+	 * - Your panel driver incorrectly calls drm_panel_disable() in its
+	 *   shutdown routine. You should delete this.
+	 * - You are using panel-edp or panel-simple and your DRM modeset
+	 *   driver's shutdown() callback happened after the panel's shutdown().
+	 *   In this case the warning is harmless though ideally you should
+	 *   figure out how to reverse the order of the shutdown() callbacks.
+	 */
+	if (!panel->enabled) {
+		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
+		return 0;
+	}
+
+	ret = backlight_disable(panel->backlight);
+	if (ret < 0)
+		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
+			     ret);
+
+	if (panel->funcs && panel->funcs->disable) {
+		ret = panel->funcs->disable(panel);
+		if (ret < 0)
+			return ret;
+	}
+	panel->enabled = false;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_disable);
+
+/**
+ * drm_panel_get_modes - probe the available display modes of a panel
+ * @panel: DRM panel
+ * @connector: DRM connector
+ *
+ * The modes probed from the panel are automatically added to the connector
+ * that the panel is attached to.
+ *
+ * Return: The number of modes available from the panel on success, or 0 on
+ * failure (no modes).
+ */
+int drm_panel_get_modes(struct drm_panel *panel,
+			struct drm_connector *connector)
+{
+	if (!panel)
+		return 0;
+
+	if (panel->funcs && panel->funcs->get_modes) {
+		int num;
+
+		num = panel->funcs->get_modes(panel, connector);
+		if (num > 0)
+			return num;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_get_modes);
+
+#ifdef CONFIG_OF
+/**
+ * of_drm_find_panel - look up a panel using a device tree node
+ * @np: device tree node of the panel
+ *
+ * Searches the set of registered panels for one that matches the given device
+ * tree node. If a matching panel is found, return a pointer to it.
+ *
+ * Return: A pointer to the panel registered for the specified device tree
+ * node or an ERR_PTR() if no panel matching the device tree node can be found.
+ *
+ * Possible error codes returned by this function:
+ *
+ * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
+ *   should retry later
+ * - ENODEV: the device is not available (status != "okay" or "ok")
+ */
+struct drm_panel *of_drm_find_panel(const struct device_node *np)
+{
+	struct drm_panel *panel;
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&panel_lock);
+
+	list_for_each_entry(panel, &panel_list, list) {
+		if (panel->dev->of_node == np) {
+			mutex_unlock(&panel_lock);
+			return panel;
+		}
+	}
+
+	mutex_unlock(&panel_lock);
+	return ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(of_drm_find_panel);
+
+/**
+ * drm_of_find_panel_or_bridge - return connected panel or bridge device
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ * @panel: pointer to hold returned drm_panel
+ * @bridge: pointer to hold returned drm_bridge
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return either the associated struct drm_panel or drm_bridge device. Either
+ * @panel or @bridge must not be NULL.
+ *
+ * This function is deprecated and should not be used in new drivers. Use
+ * devm_drm_of_get_bridge() instead.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_find_panel_or_bridge(const struct device_node *np,
+				int port, int endpoint,
+				struct drm_panel **panel,
+				struct drm_bridge **bridge)
+{
+	int ret = -EPROBE_DEFER;
+	struct device_node *remote;
+
+	if (!panel && !bridge)
+		return -EINVAL;
+	if (panel)
+		*panel = NULL;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return -ENODEV;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (!IS_ERR(*panel))
+			ret = 0;
+		else
+			*panel = NULL;
+	}
+
+	if (bridge) {
+		if (ret) {
+			/* No panel found yet, check for a bridge next. */
+			*bridge = of_drm_find_bridge(remote);
+			if (*bridge)
+				ret = 0;
+		} else {
+			*bridge = NULL;
+		}
+	}
+
+	of_node_put(remote);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
+
+/**
+ * of_drm_get_panel_orientation - look up the orientation of the panel through
+ * the "rotation" binding from a device tree node
+ * @np: device tree node of the panel
+ * @orientation: orientation enum to be filled in
+ *
+ * Looks up the rotation of a panel in the device tree. The orientation of the
+ * panel is expressed as a property name "rotation" in the device tree. The
+ * rotation in the device tree is counter clockwise.
+ *
+ * Return: 0 when a valid rotation value (0, 90, 180, or 270) is read or the
+ * rotation property doesn't exist. Return a negative error code on failure.
+ */
+int of_drm_get_panel_orientation(const struct device_node *np,
+				 enum drm_panel_orientation *orientation)
+{
+	int rotation, ret;
+
+	ret = of_property_read_u32(np, "rotation", &rotation);
+	if (ret == -EINVAL) {
+		/* Don't return an error if there's no rotation property. */
+		*orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+		return 0;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (rotation == 0)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	else if (rotation == 90)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	else if (rotation == 180)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	else if (rotation == 270)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(of_drm_get_panel_orientation);
+#endif
+
+/**
+ * drm_is_panel_follower() - Check if the device is a panel follower
+ * @dev: The 'struct device' to check
+ *
+ * This checks to see if a device needs to be power sequenced together with
+ * a panel using the panel follower API.
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: true if we should be power sequenced with a panel; false otherwise.
+ */
+bool drm_is_panel_follower(struct device *dev)
+{
+	/*
+	 * The "panel" property is actually a phandle, but for simplicity we
+	 * don't bother trying to parse it here. We just need to know if the
+	 * property is there.
+	 */
+	return of_property_present(dev->of_node, "panel");
+}
+EXPORT_SYMBOL(drm_is_panel_follower);
+
+/**
+ * drm_panel_add_follower() - Register something to follow panel state.
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * A panel follower is called right after preparing the panel and right before
+ * unpreparing the panel. It's primary intention is to power on an associated
+ * touchscreen, though it could be used for any similar devices. Multiple
+ * devices are allowed the follow the same panel.
+ *
+ * If a follower is added to a panel that's already been turned on, the
+ * follower's prepare callback is called right away.
+ *
+ * At the moment panels can only be followed on device tree enabled systems.
+ * The "panel" property of the follower points to the panel to be followed.
+ *
+ * Return: 0 or an error code. Note that -ENODEV means that we detected that
+ *         follower_dev is not actually following a panel. The caller may
+ *         choose to ignore this return value if following a panel is optional.
+ */
+int drm_panel_add_follower(struct device *follower_dev,
+			   struct drm_panel_follower *follower)
+{
+	struct device_node *panel_np;
+	struct drm_panel *panel;
+	int ret;
+
+	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
+	if (!panel_np)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(panel_np);
+	of_node_put(panel_np);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
+	get_device(panel->dev);
+	follower->panel = panel;
+
+	mutex_lock(&panel->follower_lock);
+
+	list_add_tail(&follower->list, &panel->followers);
+	if (panel->prepared) {
+		ret = follower->funcs->panel_prepared(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_prepared, ret);
+	}
+
+	mutex_unlock(&panel->follower_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_add_follower);
+
+/**
+ * drm_panel_remove_follower() - Reverse drm_panel_add_follower().
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Undo drm_panel_add_follower(). This includes calling the follower's
+ * unprepare function if we're removed from a panel that's currently prepared.
+ *
+ * Return: 0 or an error code.
+ */
+void drm_panel_remove_follower(struct drm_panel_follower *follower)
+{
+	struct drm_panel *panel = follower->panel;
+	int ret;
+
+	mutex_lock(&panel->follower_lock);
+
+	if (panel->prepared) {
+		ret = follower->funcs->panel_unpreparing(follower);
+		if (ret < 0)
+			dev_info(panel->dev, "%ps failed: %d\n",
+				 follower->funcs->panel_unpreparing, ret);
+	}
+	list_del_init(&follower->list);
+
+	mutex_unlock(&panel->follower_lock);
+
+	put_device(panel->dev);
+}
+EXPORT_SYMBOL(drm_panel_remove_follower);
+
+static void drm_panel_remove_follower_void(void *follower)
+{
+	drm_panel_remove_follower(follower);
+}
+
+/**
+ * devm_drm_panel_add_follower() - devm version of drm_panel_add_follower()
+ * @follower_dev: The 'struct device' for the follower.
+ * @follower:     The panel follower descriptor for the follower.
+ *
+ * Handles calling drm_panel_remove_follower() using devm on the follower_dev.
+ *
+ * Return: 0 or an error code.
+ */
+int devm_drm_panel_add_follower(struct device *follower_dev,
+				struct drm_panel_follower *follower)
+{
+	int ret;
+
+	ret = drm_panel_add_follower(follower_dev, follower);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(follower_dev,
+					drm_panel_remove_follower_void, follower);
+}
+EXPORT_SYMBOL(devm_drm_panel_add_follower);
+
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
+/**
+ * drm_panel_of_backlight - use backlight device node for backlight
+ * @panel: DRM panel
+ *
+ * Use this function to enable backlight handling if your panel
+ * uses device tree and has a backlight phandle.
+ *
+ * When the panel is enabled backlight will be enabled after a
+ * successful call to &drm_panel_funcs.enable()
+ *
+ * When the panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting device tree
+ * will call this function at probe time. Backlight will then be handled
+ * transparently without requiring any intervention from the driver.
+ * drm_panel_of_backlight() must be called after the call to drm_panel_init().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	struct backlight_device *backlight;
+
+	if (!panel || !panel->dev)
+		return -EINVAL;
+
+	backlight = devm_of_find_backlight(panel->dev);
+
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
+
+	panel->backlight = backlight;
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_of_backlight);
+#endif
+
 struct panel_bridge {
 	struct drm_bridge bridge;
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index 0c7550c0462b5f2ae7084ae70633f501e02dac78..47660db72958a2937ac3344180b59c52110bebe7 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -28,5 +28,6 @@
 #include <linux/module.h>
 
 MODULE_AUTHOR("David Airlie, Jesse Barnes");
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("DRM KMS helper");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d0183dea770308e77f05da364ffe087d53f3be36..9ba36ad0bac0e74af139d703c305f5814eb64ca8 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -217,74 +217,6 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
-/**
- * drm_of_find_panel_or_bridge - return connected panel or bridge device
- * @np: device tree node containing encoder output ports
- * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
- * @panel: pointer to hold returned drm_panel
- * @bridge: pointer to hold returned drm_bridge
- *
- * Given a DT node's port and endpoint number, find the connected node and
- * return either the associated struct drm_panel or drm_bridge device. Either
- * @panel or @bridge must not be NULL.
- *
- * This function is deprecated and should not be used in new drivers. Use
- * devm_drm_of_get_bridge() instead.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_find_panel_or_bridge(const struct device_node *np,
-				int port, int endpoint,
-				struct drm_panel **panel,
-				struct drm_bridge **bridge)
-{
-	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
-
-	if (!panel && !bridge)
-		return -EINVAL;
-	if (panel)
-		*panel = NULL;
-
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
-	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (!remote)
-		return -ENODEV;
-
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
-
-	if (bridge) {
-		if (ret) {
-			/* No panel found yet, check for a bridge next. */
-			*bridge = of_drm_find_bridge(remote);
-			if (*bridge)
-				ret = 0;
-		} else {
-			*bridge = NULL;
-		}
-
-	}
-
-	of_node_put(remote);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
-
 enum drm_of_lvds_pixels {
 	DRM_OF_LVDS_EVEN = BIT(0),
 	DRM_OF_LVDS_ODD = BIT(1),
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
deleted file mode 100644
index 9940e96d35e302080c32b49154bbf19a51c0665e..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/drm_panel.c
+++ /dev/null
@@ -1,575 +0,0 @@
-/*
- * Copyright (C) 2013, NVIDIA Corporation.  All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-
-#include <linux/backlight.h>
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/of.h>
-
-#include <drm/drm_crtc.h>
-#include <drm/drm_panel.h>
-#include <drm/drm_print.h>
-
-static DEFINE_MUTEX(panel_lock);
-static LIST_HEAD(panel_list);
-
-/**
- * DOC: drm panel
- *
- * The DRM panel helpers allow drivers to register panel objects with a
- * central registry and provide functions to retrieve those panels in display
- * drivers.
- *
- * For easy integration into drivers using the &drm_bridge infrastructure please
- * take look at drm_panel_bridge_add() and devm_drm_panel_bridge_add().
- */
-
-/**
- * drm_panel_init - initialize a panel
- * @panel: DRM panel
- * @dev: parent device of the panel
- * @funcs: panel operations
- * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
- *	the panel interface
- *
- * Initialize the panel structure for subsequent registration with
- * drm_panel_add().
- */
-void drm_panel_init(struct drm_panel *panel, struct device *dev,
-		    const struct drm_panel_funcs *funcs, int connector_type)
-{
-	INIT_LIST_HEAD(&panel->list);
-	INIT_LIST_HEAD(&panel->followers);
-	mutex_init(&panel->follower_lock);
-	panel->dev = dev;
-	panel->funcs = funcs;
-	panel->connector_type = connector_type;
-}
-EXPORT_SYMBOL(drm_panel_init);
-
-/**
- * drm_panel_add - add a panel to the global registry
- * @panel: panel to add
- *
- * Add a panel to the global registry so that it can be looked up by display
- * drivers.
- */
-void drm_panel_add(struct drm_panel *panel)
-{
-	mutex_lock(&panel_lock);
-	list_add_tail(&panel->list, &panel_list);
-	mutex_unlock(&panel_lock);
-}
-EXPORT_SYMBOL(drm_panel_add);
-
-/**
- * drm_panel_remove - remove a panel from the global registry
- * @panel: DRM panel
- *
- * Removes a panel from the global registry.
- */
-void drm_panel_remove(struct drm_panel *panel)
-{
-	mutex_lock(&panel_lock);
-	list_del_init(&panel->list);
-	mutex_unlock(&panel_lock);
-}
-EXPORT_SYMBOL(drm_panel_remove);
-
-/**
- * drm_panel_prepare - power on a panel
- * @panel: DRM panel
- *
- * Calling this function will enable power and deassert any reset signals to
- * the panel. After this has completed it is possible to communicate with any
- * integrated circuitry via a command bus.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_prepare(struct drm_panel *panel)
-{
-	struct drm_panel_follower *follower;
-	int ret;
-
-	if (!panel)
-		return -EINVAL;
-
-	if (panel->prepared) {
-		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
-		return 0;
-	}
-
-	mutex_lock(&panel->follower_lock);
-
-	if (panel->funcs && panel->funcs->prepare) {
-		ret = panel->funcs->prepare(panel);
-		if (ret < 0)
-			goto exit;
-	}
-	panel->prepared = true;
-
-	list_for_each_entry(follower, &panel->followers, list) {
-		ret = follower->funcs->panel_prepared(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_prepared, ret);
-	}
-
-	ret = 0;
-exit:
-	mutex_unlock(&panel->follower_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_panel_prepare);
-
-/**
- * drm_panel_unprepare - power off a panel
- * @panel: DRM panel
- *
- * Calling this function will completely power off a panel (assert the panel's
- * reset, turn off power supplies, ...). After this function has completed, it
- * is usually no longer possible to communicate with the panel until another
- * call to drm_panel_prepare().
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_unprepare(struct drm_panel *panel)
-{
-	struct drm_panel_follower *follower;
-	int ret;
-
-	if (!panel)
-		return -EINVAL;
-
-	/*
-	 * If you are seeing the warning below it likely means one of two things:
-	 * - Your panel driver incorrectly calls drm_panel_unprepare() in its
-	 *   shutdown routine. You should delete this.
-	 * - You are using panel-edp or panel-simple and your DRM modeset
-	 *   driver's shutdown() callback happened after the panel's shutdown().
-	 *   In this case the warning is harmless though ideally you should
-	 *   figure out how to reverse the order of the shutdown() callbacks.
-	 */
-	if (!panel->prepared) {
-		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
-		return 0;
-	}
-
-	mutex_lock(&panel->follower_lock);
-
-	list_for_each_entry(follower, &panel->followers, list) {
-		ret = follower->funcs->panel_unpreparing(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_unpreparing, ret);
-	}
-
-	if (panel->funcs && panel->funcs->unprepare) {
-		ret = panel->funcs->unprepare(panel);
-		if (ret < 0)
-			goto exit;
-	}
-	panel->prepared = false;
-
-	ret = 0;
-exit:
-	mutex_unlock(&panel->follower_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_panel_unprepare);
-
-/**
- * drm_panel_enable - enable a panel
- * @panel: DRM panel
- *
- * Calling this function will cause the panel display drivers to be turned on
- * and the backlight to be enabled. Content will be visible on screen after
- * this call completes.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_enable(struct drm_panel *panel)
-{
-	int ret;
-
-	if (!panel)
-		return -EINVAL;
-
-	if (panel->enabled) {
-		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
-		return 0;
-	}
-
-	if (panel->funcs && panel->funcs->enable) {
-		ret = panel->funcs->enable(panel);
-		if (ret < 0)
-			return ret;
-	}
-	panel->enabled = true;
-
-	ret = backlight_enable(panel->backlight);
-	if (ret < 0)
-		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
-			     ret);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_enable);
-
-/**
- * drm_panel_disable - disable a panel
- * @panel: DRM panel
- *
- * This will typically turn off the panel's backlight or disable the display
- * drivers. For smart panels it should still be possible to communicate with
- * the integrated circuitry via any command bus after this call.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_disable(struct drm_panel *panel)
-{
-	int ret;
-
-	if (!panel)
-		return -EINVAL;
-
-	/*
-	 * If you are seeing the warning below it likely means one of two things:
-	 * - Your panel driver incorrectly calls drm_panel_disable() in its
-	 *   shutdown routine. You should delete this.
-	 * - You are using panel-edp or panel-simple and your DRM modeset
-	 *   driver's shutdown() callback happened after the panel's shutdown().
-	 *   In this case the warning is harmless though ideally you should
-	 *   figure out how to reverse the order of the shutdown() callbacks.
-	 */
-	if (!panel->enabled) {
-		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
-		return 0;
-	}
-
-	ret = backlight_disable(panel->backlight);
-	if (ret < 0)
-		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
-			     ret);
-
-	if (panel->funcs && panel->funcs->disable) {
-		ret = panel->funcs->disable(panel);
-		if (ret < 0)
-			return ret;
-	}
-	panel->enabled = false;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_disable);
-
-/**
- * drm_panel_get_modes - probe the available display modes of a panel
- * @panel: DRM panel
- * @connector: DRM connector
- *
- * The modes probed from the panel are automatically added to the connector
- * that the panel is attached to.
- *
- * Return: The number of modes available from the panel on success, or 0 on
- * failure (no modes).
- */
-int drm_panel_get_modes(struct drm_panel *panel,
-			struct drm_connector *connector)
-{
-	if (!panel)
-		return 0;
-
-	if (panel->funcs && panel->funcs->get_modes) {
-		int num;
-
-		num = panel->funcs->get_modes(panel, connector);
-		if (num > 0)
-			return num;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_get_modes);
-
-#ifdef CONFIG_OF
-/**
- * of_drm_find_panel - look up a panel using a device tree node
- * @np: device tree node of the panel
- *
- * Searches the set of registered panels for one that matches the given device
- * tree node. If a matching panel is found, return a pointer to it.
- *
- * Return: A pointer to the panel registered for the specified device tree
- * node or an ERR_PTR() if no panel matching the device tree node can be found.
- *
- * Possible error codes returned by this function:
- *
- * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
- *   should retry later
- * - ENODEV: the device is not available (status != "okay" or "ok")
- */
-struct drm_panel *of_drm_find_panel(const struct device_node *np)
-{
-	struct drm_panel *panel;
-
-	if (!of_device_is_available(np))
-		return ERR_PTR(-ENODEV);
-
-	mutex_lock(&panel_lock);
-
-	list_for_each_entry(panel, &panel_list, list) {
-		if (panel->dev->of_node == np) {
-			mutex_unlock(&panel_lock);
-			return panel;
-		}
-	}
-
-	mutex_unlock(&panel_lock);
-	return ERR_PTR(-EPROBE_DEFER);
-}
-EXPORT_SYMBOL(of_drm_find_panel);
-
-/**
- * of_drm_get_panel_orientation - look up the orientation of the panel through
- * the "rotation" binding from a device tree node
- * @np: device tree node of the panel
- * @orientation: orientation enum to be filled in
- *
- * Looks up the rotation of a panel in the device tree. The orientation of the
- * panel is expressed as a property name "rotation" in the device tree. The
- * rotation in the device tree is counter clockwise.
- *
- * Return: 0 when a valid rotation value (0, 90, 180, or 270) is read or the
- * rotation property doesn't exist. Return a negative error code on failure.
- */
-int of_drm_get_panel_orientation(const struct device_node *np,
-				 enum drm_panel_orientation *orientation)
-{
-	int rotation, ret;
-
-	ret = of_property_read_u32(np, "rotation", &rotation);
-	if (ret == -EINVAL) {
-		/* Don't return an error if there's no rotation property. */
-		*orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
-		return 0;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	if (rotation == 0)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
-	else if (rotation == 90)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
-	else if (rotation == 180)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
-	else if (rotation == 270)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-EXPORT_SYMBOL(of_drm_get_panel_orientation);
-#endif
-
-/**
- * drm_is_panel_follower() - Check if the device is a panel follower
- * @dev: The 'struct device' to check
- *
- * This checks to see if a device needs to be power sequenced together with
- * a panel using the panel follower API.
- * At the moment panels can only be followed on device tree enabled systems.
- * The "panel" property of the follower points to the panel to be followed.
- *
- * Return: true if we should be power sequenced with a panel; false otherwise.
- */
-bool drm_is_panel_follower(struct device *dev)
-{
-	/*
-	 * The "panel" property is actually a phandle, but for simplicity we
-	 * don't bother trying to parse it here. We just need to know if the
-	 * property is there.
-	 */
-	return of_property_present(dev->of_node, "panel");
-}
-EXPORT_SYMBOL(drm_is_panel_follower);
-
-/**
- * drm_panel_add_follower() - Register something to follow panel state.
- * @follower_dev: The 'struct device' for the follower.
- * @follower:     The panel follower descriptor for the follower.
- *
- * A panel follower is called right after preparing the panel and right before
- * unpreparing the panel. It's primary intention is to power on an associated
- * touchscreen, though it could be used for any similar devices. Multiple
- * devices are allowed the follow the same panel.
- *
- * If a follower is added to a panel that's already been turned on, the
- * follower's prepare callback is called right away.
- *
- * At the moment panels can only be followed on device tree enabled systems.
- * The "panel" property of the follower points to the panel to be followed.
- *
- * Return: 0 or an error code. Note that -ENODEV means that we detected that
- *         follower_dev is not actually following a panel. The caller may
- *         choose to ignore this return value if following a panel is optional.
- */
-int drm_panel_add_follower(struct device *follower_dev,
-			   struct drm_panel_follower *follower)
-{
-	struct device_node *panel_np;
-	struct drm_panel *panel;
-	int ret;
-
-	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
-	if (!panel_np)
-		return -ENODEV;
-
-	panel = of_drm_find_panel(panel_np);
-	of_node_put(panel_np);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	get_device(panel->dev);
-	follower->panel = panel;
-
-	mutex_lock(&panel->follower_lock);
-
-	list_add_tail(&follower->list, &panel->followers);
-	if (panel->prepared) {
-		ret = follower->funcs->panel_prepared(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_prepared, ret);
-	}
-
-	mutex_unlock(&panel->follower_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_add_follower);
-
-/**
- * drm_panel_remove_follower() - Reverse drm_panel_add_follower().
- * @follower:     The panel follower descriptor for the follower.
- *
- * Undo drm_panel_add_follower(). This includes calling the follower's
- * unprepare function if we're removed from a panel that's currently prepared.
- *
- * Return: 0 or an error code.
- */
-void drm_panel_remove_follower(struct drm_panel_follower *follower)
-{
-	struct drm_panel *panel = follower->panel;
-	int ret;
-
-	mutex_lock(&panel->follower_lock);
-
-	if (panel->prepared) {
-		ret = follower->funcs->panel_unpreparing(follower);
-		if (ret < 0)
-			dev_info(panel->dev, "%ps failed: %d\n",
-				 follower->funcs->panel_unpreparing, ret);
-	}
-	list_del_init(&follower->list);
-
-	mutex_unlock(&panel->follower_lock);
-
-	put_device(panel->dev);
-}
-EXPORT_SYMBOL(drm_panel_remove_follower);
-
-static void drm_panel_remove_follower_void(void *follower)
-{
-	drm_panel_remove_follower(follower);
-}
-
-/**
- * devm_drm_panel_add_follower() - devm version of drm_panel_add_follower()
- * @follower_dev: The 'struct device' for the follower.
- * @follower:     The panel follower descriptor for the follower.
- *
- * Handles calling drm_panel_remove_follower() using devm on the follower_dev.
- *
- * Return: 0 or an error code.
- */
-int devm_drm_panel_add_follower(struct device *follower_dev,
-				struct drm_panel_follower *follower)
-{
-	int ret;
-
-	ret = drm_panel_add_follower(follower_dev, follower);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(follower_dev,
-					drm_panel_remove_follower_void, follower);
-}
-EXPORT_SYMBOL(devm_drm_panel_add_follower);
-
-#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
-/**
- * drm_panel_of_backlight - use backlight device node for backlight
- * @panel: DRM panel
- *
- * Use this function to enable backlight handling if your panel
- * uses device tree and has a backlight phandle.
- *
- * When the panel is enabled backlight will be enabled after a
- * successful call to &drm_panel_funcs.enable()
- *
- * When the panel is disabled backlight will be disabled before the
- * call to &drm_panel_funcs.disable().
- *
- * A typical implementation for a panel driver supporting device tree
- * will call this function at probe time. Backlight will then be handled
- * transparently without requiring any intervention from the driver.
- * drm_panel_of_backlight() must be called after the call to drm_panel_init().
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_of_backlight(struct drm_panel *panel)
-{
-	struct backlight_device *backlight;
-
-	if (!panel || !panel->dev)
-		return -EINVAL;
-
-	backlight = devm_of_find_backlight(panel->dev);
-
-	if (IS_ERR(backlight))
-		return PTR_ERR(backlight);
-
-	panel->backlight = backlight;
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_of_backlight);
-#endif
-
-MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
-MODULE_DESCRIPTION("DRM panel infrastructure");
-MODULE_LICENSE("GPL and additional rights");

-- 
2.34.1

