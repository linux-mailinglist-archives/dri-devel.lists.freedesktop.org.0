Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPFNEpiGrWkY4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55F230A79
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE610E443;
	Sun,  8 Mar 2026 14:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="Wj4w2Ebb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDE310E062
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 06:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1772949819; x=1773209019;
 bh=+qUQ1t3DtqtA2Zf/97h87l9wY8KdSwv+cLyDWVmX3FI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Wj4w2EbbDVlR1ai/DL2M1rvHGXydQiMd3douPaa6SWUSEPP7PW9fK1pYJIug04jAI
 LPTHb+rqdf6aXUAFL3zka4ViRPlFx2f5LLKITfr8Z7lXMH+zMP2Hwx/8RJm1KOvRJG
 R46TR0aDFgzoUcdB0jxacG9YRri5YQGfCoSYIjpZ3ydbGIceKC6CkiJKIWvZnbZlAb
 SXV9lBqAiApNnA8uNS6Rt7u9Z0gQcTiSwtksqVa7C80p0R5cPiY7OEo/nWBycCc0pY
 bshXbeMlnvCcfweKmtDUUzlCtROFa9c0azcAQyQx9FXAT9c5dgGx95c0KCEABAaeNT
 WKBBlhDTgVABw==
Date: Sun, 08 Mar 2026 06:03:33 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
Message-ID: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>
In-Reply-To: <20260308-tianma-ta066vvhm03-v1-0-869fac443b20@pm.me>
References: <20260308-tianma-ta066vvhm03-v1-0-869fac443b20@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e83f9bb694c25aa7d64a6059815fec195314e122
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: BC55F230A79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,pm.me:dkim,pm.me:email,pm.me:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add driver for the Tianma TA066VVHM03 6.59" 1080x2340 AMOLED DSI
panel with DSC compression, found in the ASUS ROG Phone 3.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 MAINTAINERS                                      |   6 +
 drivers/gpu/drm/panel/Kconfig                    |  11 +
 drivers/gpu/drm/panel/Makefile                   |   1 +
 drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c | 387 +++++++++++++++++++=
++++
 4 files changed, 405 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..6b729300daf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8385,6 +8385,12 @@ F:=09Documentation/devicetree/bindings/display/rockc=
hip/rockchip,dw-dp.yaml
 F:=09drivers/gpu/drm/bridge/synopsys/dw-dp.c
 F:=09include/drm/bridge/dw_dp.h
=20
+DRM DRIVER FOR TIANMA TA066VVHM03 PANELS
+M:=09Alexander Koskovich <akoskovich@pm.me>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/tianma,ta066vvhm03.ya=
ml
+F:=09drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c
+
 DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
 M:=09Jagan Teki <jagan@amarulasolutions.com>
 S:=09Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 307152ad7759..c818c701bdf6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1122,6 +1122,17 @@ config DRM_PANEL_TDO_TL070WSH30
 =09  24 bit RGB per pixel. It provides a MIPI DSI interface to
 =09  the host, a built-in LED backlight and touch controller.
=20
+config DRM_PANEL_TIANMA_TA066VVHM03
+=09tristate "Tianma TA066VVHM03 panel driver"
+=09depends on OF
+=09depends on DRM_MIPI_DSI
+=09depends on BACKLIGHT_CLASS_DEVICE
+=09help
+=09  Say Y if you want to enable support for the Tianma TA066VVHM03 panel
+=09  driver. The panel has a 1080x2340 resolution and uses 24 bit RGB per
+=09  pixel. It provides a MIPI DSI interface to the host and has a
+=09  built-in touch controller.
+
 config DRM_PANEL_TPO_TD028TTEC1
 =09tristate "Toppoly (TPO) TD028TTEC1 panel driver"
 =09depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefil=
e
index aeffaa95666d..db257778b9f1 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) +=3D panel-sony=
-td4353-jdi.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) +=3D panel-sony-tulip-tru=
ly-nt35521.o
 obj-$(CONFIG_DRM_PANEL_STARTEK_KD070FHFID015) +=3D panel-startek-kd070fhfi=
d015.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) +=3D panel-tdo-tl070wsh30.o
+obj-$(CONFIG_DRM_PANEL_TIANMA_TA066VVHM03) +=3D panel-tianma-ta066vvhm03.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) +=3D panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) +=3D panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) +=3D panel-tpo-tpg110.o
diff --git a/drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c b/drivers/gpu=
/drm/panel/panel-tianma-ta066vvhm03.c
new file mode 100644
index 000000000000..9bf0f4ab6792
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device=
 tree.
+ * Copyright (c) 2026 Alexander Koskovich <akoskovich@pm.me>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct tianma_ta066vvhm03 {
+=09struct regulator_bulk_data *supplies;
+=09struct gpio_desc *enable_gpio;
+=09struct gpio_desc *reset_gpio;
+=09struct mipi_dsi_device *dsi;
+=09struct drm_dsc_config dsc;
+=09struct drm_panel panel;
+};
+
+static const struct regulator_bulk_data tianma_ta066vvhm03_supplies[] =3D =
{
+=09{ .supply =3D "vddio" },
+=09{ .supply =3D "vci" },
+=09{ .supply =3D "vdd" },
+};
+
+static inline
+struct tianma_ta066vvhm03 *to_tianma_ta066vvhm03(struct drm_panel *panel)
+{
+=09return container_of(panel, struct tianma_ta066vvhm03, panel);
+}
+
+static void tianma_ta066vvhm03_reset(struct tianma_ta066vvhm03 *ctx)
+{
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09usleep_range(1000, 2000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09usleep_range(5000, 6000);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+=09usleep_range(10000, 11000);
+}
+
+static int tianma_ta066vvhm03_on(struct tianma_ta066vvhm03 *ctx)
+{
+=09struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
+
+=09ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x00);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x2a);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x0c);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+=09=09=09=09     0x94, 0x42, 0x00, 0x16, 0x05, 0x00, 0x00,
+=09=09=09=09     0x00, 0x10, 0x00, 0x10, 0x00, 0xaa, 0x8a,
+=09=09=09=09     0x02, 0x10, 0x00, 0x10, 0x00, 0x00, 0x3f,
+=09=09=09=09     0x3f, 0x03, 0xff, 0x03, 0xff, 0x23, 0xff,
+=09=09=09=09     0x03, 0xff, 0x23, 0xff, 0x03, 0xff, 0x00,
+=09=09=09=09     0x40, 0x40, 0x00, 0x00, 0x10, 0x01, 0x00,
+=09=09=09=09     0x0c);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+=09=09=09=09     0x09, 0x24, 0x0e, 0x00, 0x00, 0x0e);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+=09=09=09=09     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00,
+=09=09=09=09     0x00, 0x2f, 0x00, 0x01);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf,
+=09=09=09=09     0x64, 0x0b, 0x00, 0xc0, 0x02, 0xa6, 0x04,
+=09=09=09=09     0x7f, 0x0b, 0x77, 0x0b, 0x8b, 0x04, 0x04,
+=09=09=09=09     0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
+=09=09=09=09     0x05, 0x05, 0x05, 0x00, 0x10, 0x01, 0x68,
+=09=09=09=09     0x01, 0x68, 0x01, 0x68, 0x01, 0x68, 0x01,
+=09=09=09=09     0x68, 0x01, 0x69, 0x03, 0x98, 0x03, 0x70,
+=09=09=09=09     0x03, 0x70, 0x03, 0x70, 0x03, 0x70, 0x00,
+=09=09=09=09     0x10, 0x01, 0x68, 0x01, 0x68, 0x01, 0x68,
+=09=09=09=09     0x01, 0x68, 0x01, 0x68, 0x01, 0x68, 0x03,
+=09=09=09=09     0x98, 0x03, 0x70, 0x03, 0x70, 0x03, 0x70,
+=09=09=09=09     0x03, 0x70, 0x01, 0x42, 0x01, 0x42, 0x01,
+=09=09=09=09     0x42, 0x01, 0x42, 0x01, 0x42, 0x01, 0x42,
+=09=09=09=09     0x01, 0x42, 0x01, 0x42, 0x01, 0x42, 0x01,
+=09=09=09=09     0x42, 0x01, 0x42, 0x01, 0x42, 0x1c, 0x1c,
+=09=09=09=09     0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c, 0x1c,
+=09=09=09=09     0x1c, 0x1c, 0x00, 0x01, 0x9a, 0x01, 0x9a,
+=09=09=09=09     0x01, 0x9a, 0x05, 0xae, 0x05, 0xae, 0x09,
+=09=09=09=09     0xa4, 0x09, 0xa4, 0x09, 0xa4, 0x09, 0xa4,
+=09=09=09=09     0x09, 0xa4, 0x09, 0xa4, 0x0f, 0xc3, 0x19);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7,
+=09=09=09=09     0x00, 0xa9, 0x34, 0x00, 0x20, 0x02, 0x00,
+=09=09=09=09     0x00, 0x30, 0x00, 0x40, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x00, 0x10, 0x02, 0x00, 0x40,
+=09=09=09=09     0x09, 0x00, 0x00, 0x30);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8,
+=09=09=09=09     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x30, 0x00, 0x30, 0x00, 0x30,
+=09=09=09=09     0x00, 0x30, 0x00, 0x30, 0x05, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x0f, 0x00, 0x2f, 0x00, 0x00,
+=09=09=09=09     0x00, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00,
+=09=09=09=09     0x00, 0x00, 0x00);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
+=09=09=09=09     0x59, 0xc8, 0xc8, 0xc8, 0xc8, 0xc8, 0xc8,
+=09=09=09=09     0xc8, 0xc8, 0xc8, 0x4a, 0x48, 0x46, 0x44,
+=09=09=09=09     0x42, 0x40, 0x3e, 0x3c, 0x3a, 0x00, 0xff,
+=09=09=09=09     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+=09=09=09=09     0xff, 0x04, 0x00, 0x04, 0x04, 0x42, 0x04,
+=09=09=09=09     0x69, 0x5a, 0x00, 0x0a, 0xb0, 0x0f, 0xff,
+=09=09=09=09     0x0f, 0xff, 0x0f, 0xff, 0x14, 0x81, 0xf4);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x0a);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x93);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x30);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3,
+=09=09=09=09     0x50, 0x00, 0x00, 0x00, 0x00);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
+=09mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3,
+=09=09=09=09     0x01, 0x00, 0x00, 0x00, 0x01);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
+=09mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+=09=09=09=09     0x24);
+=09mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK)=
;
+=09mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+=09mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+=09mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x01);
+=09mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+=09mipi_dsi_msleep(&dsi_ctx, 100);
+=09mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+=09return dsi_ctx.accum_err;
+}
+
+static int tianma_ta066vvhm03_off(struct tianma_ta066vvhm03 *ctx)
+{
+=09struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
+
+=09ctx->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+=09mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+=09mipi_dsi_msleep(&dsi_ctx, 120);
+
+=09return dsi_ctx.accum_err;
+}
+
+static int tianma_ta066vvhm03_prepare(struct drm_panel *panel)
+{
+=09struct tianma_ta066vvhm03 *ctx =3D to_tianma_ta066vvhm03(panel);
+=09struct drm_dsc_picture_parameter_set pps;
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09ret =3D regulator_bulk_enable(ARRAY_SIZE(tianma_ta066vvhm03_supplies), =
ctx->supplies);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to enable regulators: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09gpiod_set_value_cansleep(ctx->enable_gpio, 1);
+
+=09tianma_ta066vvhm03_reset(ctx);
+
+=09ret =3D tianma_ta066vvhm03_on(ctx);
+=09if (ret < 0) {
+=09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
+=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09=09gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+=09=09regulator_bulk_disable(ARRAY_SIZE(tianma_ta066vvhm03_supplies), ctx-=
>supplies);
+=09=09return ret;
+=09}
+
+=09drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+=09ret =3D mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+=09if (ret < 0) {
+=09=09dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09ret =3D mipi_dsi_compression_mode(ctx->dsi, true);
+=09if (ret < 0) {
+=09=09dev_err(dev, "failed to enable compression mode: %d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+static int tianma_ta066vvhm03_unprepare(struct drm_panel *panel)
+{
+=09struct tianma_ta066vvhm03 *ctx =3D to_tianma_ta066vvhm03(panel);
+=09struct device *dev =3D &ctx->dsi->dev;
+=09int ret;
+
+=09ret =3D tianma_ta066vvhm03_off(ctx);
+=09if (ret < 0)
+=09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+=09gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09regulator_bulk_disable(ARRAY_SIZE(tianma_ta066vvhm03_supplies), ctx->su=
pplies);
+
+=09return 0;
+}
+
+static const struct drm_display_mode tianma_ta066vvhm03_mode =3D {
+=09.clock =3D (1080 + 24 + 4 + 10) * (2340 + 12 + 1 + 4) * 160 / 1000,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 24,
+=09.hsync_end =3D 1080 + 24 + 4,
+=09.htotal =3D 1080 + 24 + 4 + 10,
+=09.vdisplay =3D 2340,
+=09.vsync_start =3D 2340 + 12,
+=09.vsync_end =3D 2340 + 12 + 1,
+=09.vtotal =3D 2340 + 12 + 1 + 4,
+=09.width_mm =3D 70,
+=09.height_mm =3D 152,
+=09.type =3D DRM_MODE_TYPE_DRIVER,
+};
+
+static int tianma_ta066vvhm03_get_modes(struct drm_panel *panel,
+=09=09=09=09=09struct drm_connector *connector)
+{
+=09return drm_connector_helper_get_modes_fixed(connector, &tianma_ta066vvh=
m03_mode);
+}
+
+static const struct drm_panel_funcs tianma_ta066vvhm03_panel_funcs =3D {
+=09.prepare =3D tianma_ta066vvhm03_prepare,
+=09.unprepare =3D tianma_ta066vvhm03_unprepare,
+=09.get_modes =3D tianma_ta066vvhm03_get_modes,
+};
+
+static int tianma_ta066vvhm03_bl_update_status(struct backlight_device *bl=
)
+{
+=09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
+=09u16 brightness =3D backlight_get_brightness(bl);
+=09int ret;
+
+=09dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+=09ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+=09if (ret < 0)
+=09=09return ret;
+
+=09dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+=09return 0;
+}
+
+static const struct backlight_ops tianma_ta066vvhm03_bl_ops =3D {
+=09.update_status =3D tianma_ta066vvhm03_bl_update_status,
+};
+
+static struct backlight_device *
+tianma_ta066vvhm03_create_backlight(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09const struct backlight_properties props =3D {
+=09=09.type =3D BACKLIGHT_RAW,
+=09=09.brightness =3D 4095,
+=09=09.max_brightness =3D 4095,
+=09};
+
+=09return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+=09=09=09=09=09      &tianma_ta066vvhm03_bl_ops, &props);
+}
+
+static int tianma_ta066vvhm03_probe(struct mipi_dsi_device *dsi)
+{
+=09struct device *dev =3D &dsi->dev;
+=09struct tianma_ta066vvhm03 *ctx;
+=09int ret;
+
+=09ctx =3D devm_drm_panel_alloc(dev, struct tianma_ta066vvhm03, panel,
+=09=09=09=09   &tianma_ta066vvhm03_panel_funcs,
+=09=09=09=09   DRM_MODE_CONNECTOR_DSI);
+=09if (IS_ERR(ctx))
+=09=09return PTR_ERR(ctx);
+
+=09ret =3D devm_regulator_bulk_get_const(dev,
+=09=09=09=09=09    ARRAY_SIZE(tianma_ta066vvhm03_supplies),
+=09=09=09=09=09    tianma_ta066vvhm03_supplies,
+=09=09=09=09=09    &ctx->supplies);
+=09if (ret < 0)
+=09=09return ret;
+
+=09ctx->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+=09if (IS_ERR(ctx->enable_gpio))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
+=09=09=09=09     "Failed to get enable-gpios\n");
+
+=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+=09if (IS_ERR(ctx->reset_gpio))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+=09=09=09=09     "Failed to get reset-gpios\n");
+
+=09ctx->dsi =3D dsi;
+=09mipi_dsi_set_drvdata(dsi, ctx);
+
+=09dsi->lanes =3D 4;
+=09dsi->format =3D MIPI_DSI_FMT_RGB888;
+=09dsi->mode_flags =3D MIPI_DSI_MODE_NO_EOT_PACKET |
+=09=09=09  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+=09ctx->panel.prepare_prev_first =3D true;
+
+=09ctx->panel.backlight =3D tianma_ta066vvhm03_create_backlight(dsi);
+=09if (IS_ERR(ctx->panel.backlight))
+=09=09return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+=09=09=09=09     "Failed to create backlight\n");
+
+=09drm_panel_add(&ctx->panel);
+
+=09/* This panel only supports DSC; unconditionally enable it */
+=09dsi->dsc =3D &ctx->dsc;
+=09dsi->dsc_slice_per_pkt =3D 2;
+
+=09ctx->dsc.dsc_version_major =3D 1;
+=09ctx->dsc.dsc_version_minor =3D 1;
+
+=09ctx->dsc.slice_height =3D 20;
+=09ctx->dsc.slice_width =3D 540;
+=09WARN_ON(1080 % ctx->dsc.slice_width);
+=09ctx->dsc.slice_count =3D 1080 / ctx->dsc.slice_width;
+=09ctx->dsc.bits_per_component =3D 10;
+=09ctx->dsc.bits_per_pixel =3D 8 << 4; /* 4 fractional bits */
+=09ctx->dsc.block_pred_enable =3D true;
+
+=09ret =3D mipi_dsi_attach(dsi);
+=09if (ret < 0) {
+=09=09drm_panel_remove(&ctx->panel);
+=09=09return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+=09}
+
+=09return 0;
+}
+
+static void tianma_ta066vvhm03_remove(struct mipi_dsi_device *dsi)
+{
+=09struct tianma_ta066vvhm03 *ctx =3D mipi_dsi_get_drvdata(dsi);
+=09int ret;
+
+=09ret =3D mipi_dsi_detach(dsi);
+=09if (ret < 0)
+=09=09dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+=09drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id tianma_ta066vvhm03_of_match[] =3D {
+=09{ .compatible =3D "tianma,ta066vvhm03" },
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tianma_ta066vvhm03_of_match);
+
+static struct mipi_dsi_driver tianma_ta066vvhm03_driver =3D {
+=09.probe =3D tianma_ta066vvhm03_probe,
+=09.remove =3D tianma_ta066vvhm03_remove,
+=09.driver =3D {
+=09=09.name =3D "panel-tianma-ta066vvhm03",
+=09=09.of_match_table =3D tianma_ta066vvhm03_of_match,
+=09},
+};
+module_mipi_dsi_driver(tianma_ta066vvhm03_driver);
+
+MODULE_AUTHOR("Alexander Koskovich <akoskovich@pm.me>");
+MODULE_DESCRIPTION("DRM driver for Tianma TA066VVHM03-00");
+MODULE_LICENSE("GPL");

--=20
2.53.0


