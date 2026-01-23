Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNQnLQuec2lgxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF917833B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9536910EB41;
	Fri, 23 Jan 2026 16:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mp278sk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126A10EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 842241A2A4A;
 Fri, 23 Jan 2026 16:12:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 574656070A;
 Fri, 23 Jan 2026 16:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37508119A87DD; Fri, 23 Jan 2026 17:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6Pq5QRHafsBrEnq05IXIhJ8AFQ4St6BUqNPN1Ni15mg=;
 b=mp278sk/KuNsjV5PLUsC1OoaNpX5ETYkEq2ZNjJCgLvxq5+i32V5eVWXOCqELH/t0lNtr2
 VkIa7WNyvhYSxviiQ5kM0Xb/oQmBNlJXYon1WNlLmefZrWsPPFu/jApfb9RRkSPExtUTej
 Go+d/MSqWceBIn39JkiIJjIWt2Mjp09KLztS39xT6DTu236JlfgaEIIiE0ucZrAX4ecH1M
 n5Z28EK+/ePaOvCAjojH7zZbOupbYhBWvhAyqzEkeOuzw9kYRp7JB6ekAjaO1VbdPa/o0Y
 LsEf3FYdAzKIvgc1UfFfNgwTrdiehGH+2QK5CTzscuMl9tXLHAzTDX9wldq9dA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:23 +0100
Subject: [PATCH v5 05/25] drm/tilcdc: Convert legacy panel binding via DT
 overlay at boot time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-5-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:url]
X-Rspamd-Queue-Id: 3EF917833B
X-Rspamd-Action: no action

To maintain backward compatibility while removing the deprecated
tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
the legacy "ti,tilcdc,panel" devicetree binding to the standard
panel-dpi binding at early boot.

The conversion uses an embedded device tree overlay that is applied and
modified during subsys_initcall. The process:

- Apply embedded overlay to create a tilcdc-panel-dpi node with
  port/endpoint connections to the LCDC
- Copy all properties from the legacy panel node to the new
  tilcdc-panel-dpi node
- Copy display-timings from the legacy panel
- Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
  standard display timing properties (pixelclk-active, syncclk-active)
- Disable the legacy panel by removing its compatible property to
  prevent the deprecated driver from binding

The result is a standard tilcdc-panel-dpi node with proper endpoints and
timing properties, allowing the DRM panel infrastructure to work with
legacy devicetrees without modification.

Other legacy panel-info properties are not migrated as they consistently
use default values across all mainline devicetrees and can be hardcoded
in the tilcdc driver.

This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
only be enabled for systems with legacy devicetrees containing
"ti,tilcdc,panel" nodes.

Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com/
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Using the approach of applying an overlay and then modifying the live
device tree is the solution I found that requires no modification of the
OF core. Dealing entirely with changesets would bring additional
requirements such as phandle resolution management, which is internal to
the OF framework. I intend to avoid OF core change to support this legacy
binding.

Change in v4:
- Use tab instead of space.

Change in v3:
- Use __free() macro instead of manual house cleaning.
- Enable CONFIG_DRM_TILCDC_PANEL_LEGACY config by default.
- Improve config description.
- Rename "panel-dpi" to "tilcdc-panel-dpi" to avoid any future conflict.
- Use OF changeset instead of modifying the live devicetree step by
  step.
- Add kfree to avoid memory leak.

Change in v2:
- New patch.
---
 drivers/gpu/drm/tilcdc/Kconfig                  |  16 ++
 drivers/gpu/drm/tilcdc/Makefile                 |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c    | 185 ++++++++++++++++++++++++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso |  29 ++++
 4 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index 24f9a245ba593..a36e809f984cd 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -14,3 +14,19 @@ config DRM_TILCDC
 	  controller, for example AM33xx in beagle-bone, DA8xx, or
 	  OMAP-L1xx.  This driver replaces the FB_DA8XX fbdev driver.
 
+config DRM_TILCDC_PANEL_LEGACY
+	bool "Support device tree blobs using TI LCDC Panel binding"
+	default y
+	depends on DRM_TILCDC
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
+	select OF_OVERLAY
+	select DRM_PANEL_SIMPLE
+	help
+	  Modifies the live device tree at early boot to convert the legacy
+	  "ti,tilcdc,panel" devicetree node to the standard panel-dpi node.
+	  This allows to maintain backward compatibility for boards which
+	  were using the deprecated tilcdc_panel driver.
+	  If you find "ti,tilcdc,panel"-string from your DTB, you probably
+	  need this. Otherwise you do not.
diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index f5190477de721..6d6a08b5adf40 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -11,3 +11,5 @@ tilcdc-y := \
 	tilcdc_drv.o
 
 obj-$(CONFIG_DRM_TILCDC)	+= tilcdc.o
+obj-$(CONFIG_DRM_TILCDC_PANEL_LEGACY)	+= tilcdc_panel_legacy.o \
+					   tilcdc_panel_legacy.dtbo.o
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
new file mode 100644
index 0000000000000..37a69b3cf04b2
--- /dev/null
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Kory Maincent <kory.maincent@bootlin.com>
+ *
+ * To support the legacy "ti,tilcdc,panel" binding, the devicetree has to
+ * be transformed to the new panel-dpi binding with the endpoint associated.
+ */
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/slab.h>
+
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_tilcdc_panel_legacy_begin[];
+extern char __dtbo_tilcdc_panel_legacy_end[];
+
+static int __init
+tilcdc_panel_update_prop(struct of_changeset *ocs, struct device_node *node,
+			 char *name, void *val, int length)
+{
+	struct property *prop;
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return -ENOMEM;
+
+	prop->name = kstrdup(name, GFP_KERNEL);
+	prop->length = length;
+	prop->value = kmemdup(val, length, GFP_KERNEL);
+	if (!prop->name || !prop->value) {
+		kfree(prop->name);
+		kfree(prop->value);
+		kfree(prop);
+		return -ENOMEM;
+	}
+
+	return of_changeset_update_property(ocs, node, prop);
+}
+
+static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
+					  struct device_node *new_panel)
+{
+	struct device_node *old_timing __free(device_node) = NULL;
+	struct device_node *new_timing __free(device_node) = NULL;
+	struct device_node *panel_info __free(device_node) = NULL;
+	struct device_node *child __free(device_node) = NULL;
+	u32 invert_pxl_clk = 0, sync_edge = 0;
+	struct of_changeset ocs;
+	struct property *prop;
+	int ret;
+
+	child = of_get_child_by_name(old_panel, "display-timings");
+	if (!child)
+		return -EINVAL;
+
+	/* The default display timing is the one specified as native-mode.
+	 * If no native-mode is specified then the first node is assumed
+	 * to be the native mode.
+	 */
+	old_timing = of_parse_phandle(child, "native-mode", 0);
+	if (!old_timing) {
+		old_timing = of_get_next_child(child, NULL);
+		if (!old_timing)
+			return -EINVAL;
+	}
+
+	panel_info = of_get_child_by_name(old_panel, "panel-info");
+	if (!panel_info)
+		return -EINVAL;
+
+	of_changeset_init(&ocs);
+
+	/* Copy all panel properties to the new panel node */
+	for_each_property_of_node(old_panel, prop) {
+		if (!strncmp(prop->name, "compatible", sizeof("compatible")))
+			continue;
+
+		ret = tilcdc_panel_update_prop(&ocs, new_panel, prop->name,
+					       prop->value, prop->length);
+		if (ret)
+			goto destroy_ocs;
+	}
+
+	new_timing = of_changeset_create_node(&ocs, new_panel, "panel-timing");
+	if (!new_timing) {
+		ret = -ENODEV;
+		goto destroy_ocs;
+	}
+
+	/* Copy all panel timing properties to the new panel node */
+	for_each_property_of_node(old_timing, prop) {
+		ret = tilcdc_panel_update_prop(&ocs, new_timing, prop->name,
+					       prop->value, prop->length);
+		if (ret)
+			goto destroy_ocs;
+	}
+
+	/* Looked only for these two parameter as all the other are always
+	 * set to default and not related to common DRM properties.
+	 */
+	of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
+	of_property_read_u32(panel_info, "sync-edge", &sync_edge);
+
+	if (!invert_pxl_clk) {
+		ret = tilcdc_panel_update_prop(&ocs, new_timing, "pixelclk-active",
+					       &(u32){cpu_to_be32(1)}, sizeof(u32));
+		if (ret)
+			goto destroy_ocs;
+	}
+
+	if (!sync_edge) {
+		ret = tilcdc_panel_update_prop(&ocs, new_timing, "syncclk-active",
+					       &(u32){cpu_to_be32(1)}, sizeof(u32));
+		if (ret)
+			goto destroy_ocs;
+	}
+
+	/* Remove compatible property to avoid any driver compatible match */
+	of_changeset_remove_property(&ocs, old_panel,
+				     of_find_property(old_panel, "compatible", NULL));
+
+	of_changeset_apply(&ocs);
+	return 0;
+
+destroy_ocs:
+	of_changeset_destroy(&ocs);
+	return ret;
+}
+
+static const struct of_device_id tilcdc_panel_of_match[] __initconst = {
+	{ .compatible = "ti,tilcdc,panel", },
+	{},
+};
+
+static const struct of_device_id tilcdc_of_match[] __initconst = {
+	{ .compatible = "ti,am33xx-tilcdc", },
+	{ .compatible = "ti,da850-tilcdc", },
+	{},
+};
+
+static int __init tilcdc_panel_legacy_init(void)
+{
+	struct device_node *new_panel __free(device_node) = NULL;
+	struct device_node *panel __free(device_node) = NULL;
+	struct device_node *lcdc __free(device_node) = NULL;
+	void *dtbo_start;
+	u32 dtbo_size;
+	int ovcs_id;
+	int ret;
+
+	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
+	panel = of_find_matching_node(NULL, tilcdc_panel_of_match);
+
+	if (!of_device_is_available(panel) ||
+	    !of_device_is_available(lcdc))
+		return 0;
+
+	dtbo_start = __dtbo_tilcdc_panel_legacy_begin;
+	dtbo_size = __dtbo_tilcdc_panel_legacy_end -
+		    __dtbo_tilcdc_panel_legacy_begin;
+
+	ret = of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
+	if (ret)
+		return ret;
+
+	new_panel = of_find_node_by_name(NULL, "tilcdc-panel-dpi");
+	if (!new_panel) {
+		ret = -ENODEV;
+		goto overlay_remove;
+	}
+
+	ret = tilcdc_panel_copy_props(panel, new_panel);
+	if (ret)
+		goto overlay_remove;
+
+	return 0;
+
+overlay_remove:
+	of_overlay_remove(&ovcs_id);
+	return ret;
+}
+
+subsys_initcall(tilcdc_panel_legacy_init);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
new file mode 100644
index 0000000000000..ae71d10f5ec13
--- /dev/null
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DTS overlay for converting ti,tilcdc,panel binding to new binding.
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Kory Maincent <kory.maincent@bootlin.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	tilcdc-panel-dpi {
+		compatible = "panel-dpi";
+		port {
+			panel_in: endpoint@0 {
+				remote-endpoint = <&lcd_0>;
+			};
+		};
+	};
+};
+
+&lcdc {
+	port {
+		lcd_0: endpoint@0 {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};

-- 
2.43.0

