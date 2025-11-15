Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374BC606DB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C57E10E2A7;
	Sat, 15 Nov 2025 14:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mbXvwYPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4BD10E041
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:21 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-641977dc00fso4330437a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216060; x=1763820860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
 b=mbXvwYPaPKzFcaE0mmLytnqUyHYXvFHEhtEYMAQnOMoW4WPDdk9K725jRQOPUw2xbD
 wyGS0R3N0Z84g7G4WuO6UEka6LXVP2A50IUC26ZD/wUTbVYmWQvD2NMG6yoLF/qx8I37
 sieo/lyJMSYi+RhA0QuwagB7ZUgy2S9kjFJ6vI5KS3IeWNbR4/JDtv6Ga1+BUMtvSYVt
 /iIfMC5fmNidp10m7UhKy2kKzWd24NAkzfReLId+Ab8QsKw4x80SEQllpI2C7DE9qw+k
 0rp+bLnEKOi4BD69VRYDAjM3JPDm07TwBwmmSRwJIu/GkcynGiPHT8vAZobSZrtO8ViZ
 /XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216060; x=1763820860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pVbw8sqfmsGsfsXTGzKu/do/A1FF7lGaLVG/hAhMlcM=;
 b=iQyQocRPKokXYzP+KNNg3U7rxGn6YAIK1mDdfsRJcn28RZIufpqS99j6uuG0rLuK6R
 QpNzCZffcQWNActMPW88wyJSJqLf3eyK40QHHGtKwEJhTKk9H9BTqA1hxLS3svM78nGj
 ooABzm9KJIpXbCgEJC5W1WFhfvusRHkWNcJVDJJwRSNSgz5f8td4HIQoCDkwFHh4KFPc
 KZ6ljAXzRz0B1bGV4cSAmMy/Hs6Fkkyn2KZkOUy8DdoRs/8fP/Sey3+qegSXRu53dmcn
 4H7n6w+ZGCLRKQfnTHtGMhvgjWStPnK82tHz5tUH9rZHLlLsdKkwcmPtgIF/ZiKnWw0U
 ZXVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhutrV57hvRNqgJJkBb/J46vNUEEcqNsvIRewJsv//co8boDHo6HTBsIiYgiVkUtzm+++AxalRbyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+XiM3Ka85G5iFNdESMcJOeK1+8M1WIWEZ69W6bdYtNf5gdZ1X
 qkQn0ooNvGUdnw9/zLmoaxdBcnfn24TAX6rxR8qa5arQoSsISTGvUI9g
X-Gm-Gg: ASbGncvpivZdivbvAOct8ZwhRLe+bbTwNhgtGmXU7Jj5SWd8rkjymIKQK1Evt3ck6ol
 2WVZaHDgWf6M9uae2P0DLZ+ksbHiuNnzpDFy36bEW1oRS2woikq5VQXW3A6JzyV/bb+fgQd43m/
 W6mZ4YRNyRQAEqfPpLoiT/2la+mhquEYH7A5pumwym8K+9PUFWMTS/2frflKCp76O0/BBXEEnSZ
 yFefRrGBmGO4MkOF9inp0QI3zNGOthnb3ZNHYOM48X34inFfQ3/ww/zGMgCjtsliC/KMGJK8y/B
 vYTn6WDCvA1J3q1DnaSCNg9ilRoPah65iBv8w+xWWtNzL5JOkBrz0IMmbNvQ10Ecf21hpIOw4QM
 7wRVQGw4mx4P56kI1TVNyeCyw5totfD9Z88G46eb65nfYWlebos7G7UBmXKO4Cxpfvlrhj7Nuw9
 a/Lo+xgaeYcGIUujp0k+jv9jBD0VxW/7n9UYVDX+qqFPCB+w==
X-Google-Smtp-Source: AGHT+IGbU8DEm/CCSleW/Yu4/6wA0uutVsxsCUAngp8FeQ9xWSzPAIlK7ahdDPBbaS4CEF2iCochtA==
X-Received: by 2002:a17:906:d9b:b0:b73:68b3:bd2f with SMTP id
 a640c23a62f3a-b7368b3c0fdmr502509366b.40.1763216060152; 
 Sat, 15 Nov 2025 06:14:20 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:19 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Sat, 15 Nov 2025 15:13:45 +0100
Message-ID: <20251115141347.13087-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This driver serves just as planes sharing manager, needed for Display
Engine 3.3 and newer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig         |   8 +
 drivers/gpu/drm/sun4i/Makefile        |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 4 files changed, 257 insertions(+)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index b56ba00aabca..946dd7606094 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
 	  TCON TOP is responsible for configuring display pipeline for
 	  HDMI, TVE and LCD.
 
+config DRM_SUN50I_PLANES
+	tristate
+	default DRM_SUN4I if DRM_SUN8I_MIXER!=n
+	help
+	  Chose this option if you have an Allwinner Soc with the
+	  Display Engine 3.3 or newer. Planes are shared resource
+	  between multiple mixers.
+
 endif
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..03f002abef15 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)	+= sun6i_mipi_dsi.o
 obj-$(CONFIG_DRM_SUN8I_DW_HDMI)	+= sun8i-drm-hdmi.o
 obj-$(CONFIG_DRM_SUN8I_MIXER)	+= sun8i-mixer.o
 obj-$(CONFIG_DRM_SUN8I_TCON_TOP) += sun8i_tcon_top.o
+obj-$(CONFIG_DRM_SUN50I_PLANES)	+= sun50i_planes.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..a99c01122990
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static bool sun50i_planes_node_is_planes(struct device_node *node)
+{
+	return !!of_match_node(sun50i_planes_of_table, node);
+}
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!sun50i_planes_node_is_planes(dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return NULL;
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return NULL;
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return NULL;
+	}
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer)) {
+			dev_err(drm->dev,
+				"Couldn't initialize DRM plane\n");
+			return ERR_CAST(layer);
+		}
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+EXPORT_SYMBOL(sun50i_planes_setup);
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(&pdev->dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	planes->mapping = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "allwinner,plane-mapping");
+	if (IS_ERR(planes->mapping))
+		return dev_err_probe(dev, PTR_ERR(planes->mapping),
+				     "Unable to get mapping\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	dev_set_drvdata(dev, planes);
+
+	sun50i_planes_init_mapping(planes);
+
+	return 0;
+}
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+/* sun4i_drv uses this list to check if a device node is a plane */
+const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+EXPORT_SYMBOL(sun50i_planes_of_table);
+
+static struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
+module_platform_driver(sun50i_planes_platform_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_DESCRIPTION("Allwinner DE33 planes driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..446feaeb03fc
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include <drm/drm_device.h>
+#include <linux/regmap.h>
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+extern const struct of_device_id sun50i_planes_of_table[];
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.51.2

