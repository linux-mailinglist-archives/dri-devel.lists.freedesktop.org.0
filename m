Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D158032C5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E68110E360;
	Mon,  4 Dec 2023 12:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49EC010E1C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:33:22 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 061067FEF;
 Mon,  4 Dec 2023 20:33:19 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:18 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:18 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: [v3 6/6] drm/vs: simple encoder
Date: Mon, 4 Dec 2023 20:33:15 +0800
Message-ID: <20231204123315.28456-7-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de,
 paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com,
 jack.zhu@starfivetech.com, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add simple encoder for dsi bridge

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile        |   4 +-
 drivers/gpu/drm/verisilicon/vs_drv.c        |   2 +
 drivers/gpu/drm/verisilicon/vs_simple_enc.c | 195 ++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_simple_enc.h |  23 +++
 4 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
index 71fadafcee13..cd5d0a90bcfe 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -5,6 +5,8 @@ vs_drm-objs :=3D vs_dc_hw.o \
 		vs_crtc.o \
 		vs_drv.o \
 		vs_modeset.o \
-		vs_plane.o
+		vs_plane.o \
+		vs_simple_enc.o
+
 vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) +=3D starfive_hdmi.o
 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/veris=
ilicon/vs_drv.c
index d7e5199fe293..946f137ab124 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -23,6 +23,7 @@
 #include "vs_drv.h"
 #include "vs_modeset.h"
 #include "vs_dc.h"
+#include "vs_simple_enc.h"
=20
 #define DRV_NAME	"verisilicon"
 #define DRV_DESC	"Verisilicon DRM driver"
@@ -217,6 +218,7 @@ static struct platform_driver *drm_sub_drivers[] =3D =
{
 #ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
 	&starfive_hdmi_driver,
 #endif
+	&simple_encoder_driver,
 };
=20
 static struct component_match *vs_drm_match_add(struct device *dev)
diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.c b/drivers/gpu/dr=
m/verisilicon/vs_simple_enc.c
new file mode 100644
index 000000000000..c5a8d82bc469
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ */
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
+#include <linux/regmap.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+
+#include "vs_crtc.h"
+#include "vs_simple_enc.h"
+
+static const struct simple_encoder_priv dsi_priv =3D {
+	.encoder_type =3D DRM_MODE_ENCODER_DSI
+};
+
+static inline struct simple_encoder *to_simple_encoder(struct drm_encode=
r *enc)
+{
+	return container_of(enc, struct simple_encoder, encoder);
+}
+
+static int encoder_parse_dt(struct device *dev)
+{
+	struct simple_encoder *simple =3D dev_get_drvdata(dev);
+	unsigned int args[2];
+
+	simple->dss_regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_nod=
e,
+								  "starfive,syscon",
+								  2, args);
+
+	if (IS_ERR(simple->dss_regmap)) {
+		return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
+				     "getting the regmap failed\n");
+	}
+
+	simple->offset =3D args[0];
+	simple->mask =3D args[1];
+
+	return 0;
+}
+
+void encoder_atomic_enable(struct drm_encoder *encoder,
+			   struct drm_atomic_state *state)
+{
+	struct simple_encoder *simple =3D to_simple_encoder(encoder);
+
+	regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask,
+			   simple->mask);
+}
+
+int encoder_atomic_check(struct drm_encoder *encoder,
+			 struct drm_crtc_state *crtc_state,
+			 struct drm_connector_state *conn_state)
+{
+	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc_state);
+	struct drm_connector *connector =3D conn_state->connector;
+	int ret =3D 0;
+
+	struct drm_bridge *first_bridge =3D drm_bridge_chain_get_first_bridge(e=
ncoder);
+	struct drm_bridge_state *bridge_state =3D ERR_PTR(-EINVAL);
+
+	vs_crtc_state->encoder_type =3D encoder->encoder_type;
+
+	if (first_bridge && first_bridge->funcs->atomic_duplicate_state)
+		bridge_state =3D drm_atomic_get_bridge_state(crtc_state->state, first_=
bridge);
+
+	if (IS_ERR(bridge_state)) {
+		if (connector->display_info.num_bus_formats)
+			vs_crtc_state->output_fmt =3D connector->display_info.bus_formats[0];
+		else
+			vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_FIXED;
+	} else {
+		vs_crtc_state->output_fmt =3D bridge_state->input_bus_cfg.format;
+	}
+
+	switch (vs_crtc_state->output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		ret =3D 0;
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	/* If MEDIA_BUS_FMT_FIXED, set it to default value */
+	if (vs_crtc_state->output_fmt =3D=3D MEDIA_BUS_FMT_FIXED)
+		vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;
+
+	return ret;
+}
+
+static const struct drm_encoder_helper_funcs encoder_helper_funcs =3D {
+	.atomic_check =3D encoder_atomic_check,
+	.atomic_enable =3D encoder_atomic_enable,
+};
+
+static int encoder_bind(struct device *dev, struct device *master, void =
*data)
+{
+	struct drm_device *drm_dev =3D data;
+	struct simple_encoder *simple =3D dev_get_drvdata(dev);
+	struct drm_encoder *encoder;
+	struct drm_bridge *bridge;
+	int ret;
+
+	encoder =3D &simple->encoder;
+
+	ret =3D drmm_encoder_init(drm_dev, encoder, NULL, simple->priv->encoder=
_type, NULL);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+
+	encoder->possible_crtcs =3D
+			drm_of_find_possible_crtcs(drm_dev, dev->of_node);
+
+	/* output port is port1*/
+	bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return 0;
+
+	return drm_bridge_attach(encoder, bridge, NULL, 0);
+}
+
+static const struct component_ops encoder_component_ops =3D {
+	.bind =3D encoder_bind,
+};
+
+static const struct of_device_id simple_encoder_dt_match[] =3D {
+	{ .compatible =3D "starfive,dsi-encoder", .data =3D &dsi_priv},
+	{},
+};
+MODULE_DEVICE_TABLE(of, simple_encoder_dt_match);
+
+static int encoder_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct simple_encoder *simple;
+	int ret;
+
+	simple =3D devm_kzalloc(dev, sizeof(*simple), GFP_KERNEL);
+	if (!simple)
+		return -ENOMEM;
+
+	simple->priv =3D of_device_get_match_data(dev);
+
+	simple->dev =3D dev;
+
+	dev_set_drvdata(dev, simple);
+
+	ret =3D encoder_parse_dt(dev);
+	if (ret)
+		return ret;
+
+	return component_add(dev, &encoder_component_ops);
+}
+
+static int encoder_remove(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+
+	component_del(dev, &encoder_component_ops);
+	dev_set_drvdata(dev, NULL);
+
+	return 0;
+}
+
+struct platform_driver simple_encoder_driver =3D {
+	.probe =3D encoder_probe,
+	.remove =3D encoder_remove,
+	.driver =3D {
+		.name =3D "vs-simple-encoder",
+		.of_match_table =3D of_match_ptr(simple_encoder_dt_match),
+	},
+};
+
+MODULE_DESCRIPTION("Simple Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.h b/drivers/gpu/dr=
m/verisilicon/vs_simple_enc.h
new file mode 100644
index 000000000000..fb33ca9e18d6
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_SIMPLE_ENC_H_
+#define __VS_SIMPLE_ENC_H_
+
+struct simple_encoder_priv {
+	unsigned char encoder_type;
+};
+
+struct simple_encoder {
+	struct drm_encoder encoder;
+	struct device *dev;
+	const struct simple_encoder_priv *priv;
+	struct regmap *dss_regmap;
+	unsigned int offset;
+	unsigned int mask;
+};
+
+extern struct platform_driver simple_encoder_driver;
+#endif /* __VS_SIMPLE_ENC_H_ */
--=20
2.34.1

