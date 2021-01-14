Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C902F74A4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10E89A61;
	Fri, 15 Jan 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22916E151
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYcEIZ1JKKlevkzdXb/MacmR6ysDAgElSqIVuC5+0Gd5PGP6ZJyBWZbJ/h6UNEv/bY68JBFvrmJm5/efqcjL9B0p21o7JlK4MVFiZ7reNUxmsCz4uFiyfj/Nos8TYbz1gQnpqdzWGTUD/fXR8SfPuE2zoMVLdS8Q7mCqggRXKa7u4Pz4xotPdWG+0eiZy5cR3r6YqB9VcrNQQOyAsQAgbi0fRWI4oswIhc5mI61gdReZ/u1hD8zQftS4OILxcJAhy0gGyOw+Riqp73lhxlhP79yGFswO6dpv9KhyXPgKxwV8jALrQwTJdo2UmvWKHxk6CKWXaryWfsDGOlB30sAcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7cKt+Q20cXsfdAWnpzsxX3VBYO2Zsx90oVnqv2eJy4=;
 b=eJSwTt65IQkGv9kEQATfbzaTocS8MA/nxdR8SV+HBeFVDQuM/yA8cd7heUImgTo3ZRG3xNpVCMZMl+F/0VGU31lmem2ALC7pe+TEDMWTUPAYVB68ewGm6hfLDkDRROfUk/lwWjbcBgU6BUGdt9gSMRy5vgc8n+miEIcYe4AK0zaNb9fVNZfpH6LjNYUR6/rWnV2dBMoN7ifrVmFC0bvKRwjMCt9lUxgMFh2nLiSR1XjrJBrSBD/kVxw77GbRKuQ2o471J1YYM0wu/fUp2QGcdEl03L5gj4qFDE+uRkKABDRYvA9eoVHKhdiOkeKiL60SaWgAnM/Ol0kD/LlzBz/MCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7cKt+Q20cXsfdAWnpzsxX3VBYO2Zsx90oVnqv2eJy4=;
 b=DBZ2cvPdEv32mciKZOeG4OgCreo7sgsf8tOZxP6AKYUHN3VSr5mXow624C4ybyjpljvplY9rwIZFArRR9nyxgYUNnCETE2AXi5HqvHBsOhu3uKruSd9Lm2yXc9GUtHbhhFiCWv4vIKjyh8BZ9XFl8rm9vgFotmFeVkkWOMny4qk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:51 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 13/14] drm/bridge: imx: Add LDB support for i.MX8qm
Date: Thu, 14 Jan 2021 17:22:11 +0800
Message-Id: <1610616132-8220-14-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a54e764-e238-4709-a5c4-08d8b86f80c1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5710D3AC7EED794E3100C67698A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blHcRW5NbCW2DLqHQciUr0eXrSqPlOCWqQqpuHD/Oe4KFZWOMWcvnDuqEdpF1rbL5Yz75d6TA4OKAIgvK+fPZxeQhQ94lWjph5goXtQguG0wFijo/HXsZSZ/Fhr5Vk1vctbhtFa8Ad79HXcJOTKGN6z03VhPC9FmFfx88M+/E8DXcruM7qjoVEm/SlMJbztRl19fcWxc76EQm6EwnVKBUpRkAoLNoqxgF4qqsrhm3w00uhwYOUOsciZcyyYik42i4mIskaSqAxH1mOQyNSK15nlNydmz0J5+usANr8tC9yc/tm3S1a49Cm20QcClxTS2eZsCgtQh/GNaSUjynIG759ebiwcTKz4Uf/6ipKpfYbWE2vsZYyAyc3oephtdk7YD+Zay3zVoQXkFKcdraG8wpD92+vIzHjLiZtAeDWOQ1OdeQF4jqIjezX1hPUfF5rUgTs13nEoIRB1V58gwdoLNZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(30864003)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(83380400001)(2616005)(7416002)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MkXN7UtkwEhGNMPaVFM88Ke7m1Hx/4lKGSgv6WwkDHpjoOCYgGxJLAl/2VZS?=
 =?us-ascii?Q?PXPI8UOafN2smG/+ISC8G/P6weOSxj+oQIxrS2tHOD3SxuLOxND5oG/eoGOq?=
 =?us-ascii?Q?tPj4kU7JasL6l3huIqbWZeMAO47kN3yb0WY71VzM2TzT6iE7fEKGmT9gsLmB?=
 =?us-ascii?Q?OGpE8zICaKuO47naLtqVoOHCWDNd+iPyQn6YHQNClC4vLbkG2h4BZbdsldL/?=
 =?us-ascii?Q?SLUffxZmmYrbDhPBWJ6d9gmjsy6IItpW/xpqJERBR92FH4A4venNiVYrVnID?=
 =?us-ascii?Q?JbKvcV1XKM5P7TeTLyoWYxFszr7wAUf5+ZFNNtg+HJKBENwBK08LOQbYXmDM?=
 =?us-ascii?Q?Ed5QvV11g5t3JW+Dn63WHbxj1/ebDsYp5R78n2k8/gs8/55D00QpXp/s6dO6?=
 =?us-ascii?Q?p2F+cJY6ynSGWNA2TmVNw1T//za7xCEi9t0dsGBd52QrSz9Or7gmxL2A9KgO?=
 =?us-ascii?Q?yUT2s2qzbjC7ekq9qDEvFeadAJj8HGRpLRDCNYbiEo0R623qST05zjNsBZUE?=
 =?us-ascii?Q?zMyZsI3mgDaBa8ZjIOb1CvKJvR0+ZZ06qTt2Shpn/yleFZqpKeWoWj3mNxV5?=
 =?us-ascii?Q?qauXQSG8xxRfF27B4HX/yN9Ohc3oFkJF63Mn/Br3KNuOL1o+sTFvcjz+oxwf?=
 =?us-ascii?Q?nZaHJ9wlxurGNnLMyYHXdRsZQghyyCK18QZR4YpxC7BCyxK4Z/USAG9rOD5e?=
 =?us-ascii?Q?skODTmw6NF8+5X+ABMoWgFt7smIqaIFaTBklirZJ8i0jlX3i8mrmHRAvp+Na?=
 =?us-ascii?Q?I0WFGxlnAsL86mYEqz6/TuVwK52UjgvZkP2P3wgxABAyzLzmD9+j7mi4N9+3?=
 =?us-ascii?Q?W67XWVeNcXxERPCPNlOMgBjO6C0Ra8A43fMBLJnbQgAWl+e+Ic8E+kmOgV0J?=
 =?us-ascii?Q?lLpx17d65gOgdmikiql7ccURdWTDW8P7at7clqx0jLySBMQbakwNn4iGILk9?=
 =?us-ascii?Q?LOEgUc77sS6CC+Z2e8PlZOKParArOW+LCv6aUIKhn1kZkdVMm35rSFZEsVUz?=
 =?us-ascii?Q?rjir?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:51.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a54e764-e238-4709-a5c4-08d8b86f80c1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZB/t/P8NKHZypHz+oghk9swHlPbzppUYReEhwr6nFQaf+TJvVVrL2uDx3IaoQ0hniuOk3seasCU5I0joSYwOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qm LVDS display bridge(LDB)
which is officially named as pixel mapper.  The LDB has two channels.
Each of them supports up to 30bpp parallel input color format and can
map the input to VESA or JEIDA standards.  The two channels can be used
simultaneously, either in dual mode or split mode.  In dual mode, the
two channels output identical data.  In split mode, channel0 outputs
odd pixels and channel1 outputs even pixels.  This patch supports the
LDB single mode and split mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Drop unnecessary check for maximum available LDB channels.
* Mention i.MX8qm LDB official name 'pixel mapper' in the bridge driver
  and Kconfig help message.

 drivers/gpu/drm/bridge/imx/Kconfig      |  10 +
 drivers/gpu/drm/bridge/imx/Makefile     |   1 +
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 585 ++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 07ad230..290509c 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -6,6 +6,16 @@ config DRM_IMX_LVDS_BRIDGE_HELPER
 	  Helper to support Freescale i.MX LVDS Display Bridge(LDB).
 	  This bridge is embedded in a SoC.
 
+config DRM_IMX8QM_LDB
+	tristate "Freescale i.MX8QM LVDS display bridge"
+	depends on DRM_IMX_LVDS_BRIDGE_HELPER
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
+	  Freescale i.MX8qm processor.  Official name of LDB is pixel mapper.
+
 config DRM_IMX8QXP_LDB
 	tristate "Freescale i.MX8QXP LVDS display bridge"
 	depends on DRM_IMX_LVDS_BRIDGE_HELPER
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 13160f0..a964efc 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
new file mode 100644
index 00000000..bf0b5ce
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/imx_ldb_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#define  LDB_CH0_10BIT_EN		(1 << 22)
+#define  LDB_CH1_10BIT_EN		(1 << 23)
+#define  LDB_CH0_DATA_WIDTH_24BIT	(1 << 24)
+#define  LDB_CH1_DATA_WIDTH_24BIT	(1 << 26)
+#define  LDB_CH0_DATA_WIDTH_30BIT	(2 << 24)
+#define  LDB_CH1_DATA_WIDTH_30BIT	(2 << 26)
+
+#define SS_CTRL				0x20
+#define  CH_HSYNC_M(id)			BIT(0 + ((id) * 2))
+#define  CH_VSYNC_M(id)			BIT(1 + ((id) * 2))
+#define  CH_PHSYNC(id)			BIT(0 + ((id) * 2))
+#define  CH_PVSYNC(id)			BIT(1 + ((id) * 2))
+
+#define DRIVER_NAME			"imx8qm-ldb"
+
+struct imx8qm_ldb_channel {
+	struct ldb_channel base;
+	struct phy *phy;
+};
+
+struct imx8qm_ldb {
+	struct ldb base;
+	struct device *dev;
+	struct imx8qm_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct clk *clk_pixel;
+	struct clk *clk_bypass;
+	int active_chno;
+};
+
+static inline struct imx8qm_ldb_channel *
+base_to_imx8qm_ldb_channel(struct ldb_channel *base)
+{
+	return container_of(base, struct imx8qm_ldb_channel, base);
+}
+
+static inline struct imx8qm_ldb *base_to_imx8qm_ldb(struct ldb *base)
+{
+	return container_of(base, struct imx8qm_ldb, base);
+}
+
+static void imx8qm_ldb_set_phy_cfg(struct imx8qm_ldb *imx8qm_ldb,
+				   unsigned long di_clk,
+				   bool is_split, bool is_slave,
+				   struct phy_configure_opts_lvds *phy_cfg)
+{
+	phy_cfg->bits_per_lane_and_dclk_cycle = 7;
+	phy_cfg->lanes = 4;
+	phy_cfg->differential_clk_rate = is_split ? di_clk / 2 : di_clk;
+	phy_cfg->is_slave = is_slave;
+}
+
+static int imx8qm_ldb_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
+	unsigned long di_clk = adj->clock * 1000;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	union phy_configure_opts opts = { };
+	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
+	int ret;
+
+	ret = ldb_bridge_atomic_check_helper(bridge, bridge_state,
+						crtc_state, conn_state);
+	if (ret)
+		return ret;
+
+	imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
+	ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
+				     "failed to validate PHY: %d\n", ret);
+		return ret;
+	}
+
+	if (is_split) {
+		imx8qm_ldb_ch =
+			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
+									phy_cfg);
+		ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+		if (ret < 0) {
+			DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
+				"failed to validate slave PHY: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void
+imx8qm_ldb_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
+	unsigned long di_clk = adjusted_mode->clock * 1000;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	union phy_configure_opts opts = { };
+	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
+	u32 chno = ldb_ch->chno;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to get runtime PM sync: %d\n", ret);
+
+	ret = phy_init(imx8qm_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
+
+	clk_set_rate(imx8qm_ldb->clk_bypass, di_clk);
+	clk_set_rate(imx8qm_ldb->clk_pixel, di_clk);
+
+	imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
+	ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
+
+	if (is_split) {
+		imx8qm_ldb_ch =
+			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
+									phy_cfg);
+		ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
+		if (ret < 0)
+			DRM_DEV_ERROR(dev, "failed to configure slave PHY: %d\n",
+									ret);
+	}
+
+	/* input VSYNC signal from pixel link is active low */
+	if (ldb_ch->chno == 0 || is_split)
+		ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
+	if (ldb_ch->chno == 1 || is_split)
+		ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
+
+	switch (ldb_ch->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_CH0_DATA_WIDTH_24BIT;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_CH1_DATA_WIDTH_24BIT;
+		break;
+	}
+
+	ldb_bridge_mode_set_helper(bridge, mode, adjusted_mode);
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL, CH_VSYNC_M(chno), 0);
+	else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL,
+				   CH_VSYNC_M(chno), CH_PVSYNC(chno));
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL, CH_HSYNC_M(chno), 0);
+	else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
+		regmap_update_bits(ldb->regmap, SS_CTRL,
+				   CH_HSYNC_M(chno), CH_PHSYNC(chno));
+}
+
+static void
+imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	clk_prepare_enable(imx8qm_ldb->clk_pixel);
+	clk_prepare_enable(imx8qm_ldb->clk_bypass);
+
+	/* both DI0 and DI1 connect with pixel link, so ok to use DI0 only */
+	if (ldb_ch->chno == 0 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+		ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI0;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+		ldb->ldb_ctrl |= LDB_CH1_MODE_EN_TO_DI0;
+	}
+
+	if (is_split) {
+		ret = phy_power_on(imx8qm_ldb->channel[0].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power on channel0 PHY: %d\n",
+				      ret);
+
+		ret = phy_power_on(imx8qm_ldb->channel[1].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power on channel1 PHY: %d\n",
+				      ret);
+	} else {
+		ret = phy_power_on(imx8qm_ldb_ch->phy);
+		if (ret)
+			DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
+	}
+
+	ldb_bridge_enable_helper(bridge);
+}
+
+static void
+imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch =
+					base_to_imx8qm_ldb_channel(ldb_ch);
+	struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
+	struct device *dev = imx8qm_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ldb_bridge_disable_helper(bridge);
+
+	if (is_split) {
+		ret = phy_power_off(imx8qm_ldb->channel[0].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power off channel0 PHY: %d\n",
+				      ret);
+		ret = phy_power_off(imx8qm_ldb->channel[1].phy);
+		if (ret)
+			DRM_DEV_ERROR(dev,
+				      "failed to power off channel1 PHY: %d\n",
+				      ret);
+	} else {
+		ret = phy_power_off(imx8qm_ldb_ch->phy);
+		if (ret)
+			DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
+	}
+
+	clk_disable_unprepare(imx8qm_ldb->clk_bypass);
+	clk_disable_unprepare(imx8qm_ldb->clk_pixel);
+
+	ret = pm_runtime_put(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qm_ldb_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool imx8qm_ldb_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qm_ldb_bus_output_fmts); i++) {
+		if (imx8qm_ldb_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qm_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct drm_display_info *di;
+	const struct drm_format_info *finfo;
+	u32 *input_fmts;
+
+	if (!imx8qm_ldb_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		di = &conn_state->connector->display_info;
+
+		/*
+		 * Look at the first bus format to determine input format.
+		 * Default to MEDIA_BUS_FMT_RGB888_1X36_CPADLO, if no match.
+		 */
+		if (di->num_bus_formats) {
+			finfo = drm_format_info(di->bus_formats[0]);
+
+			input_fmts[0] = finfo->depth == 18 ?
+					MEDIA_BUS_FMT_RGB666_1X36_CPADLO :
+					MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		} else {
+			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qm_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qm_ldb_bus_output_fmts);
+	return kmemdup(imx8qm_ldb_bus_output_fmts,
+			sizeof(imx8qm_ldb_bus_output_fmts), GFP_KERNEL);
+}
+
+static enum drm_mode_status
+imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	bool is_single = ldb_channel_is_single_link(ldb_ch);
+
+	if (mode->clock > 300000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 150000 && is_single)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
+	.attach			= ldb_bridge_attach_helper,
+	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
+	.mode_set		= imx8qm_ldb_bridge_mode_set,
+	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,
+	.atomic_disable		= imx8qm_ldb_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qm_ldb_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qm_ldb_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qm_ldb_get_phy(struct imx8qm_ldb *imx8qm_ldb)
+{
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch;
+	struct ldb_channel *ldb_ch;
+	struct device *dev = imx8qm_ldb->dev;
+	int i, ret;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+		ldb_ch = &imx8qm_ldb_ch->base;
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		imx8qm_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np,
+								"lvds_phy");
+		if (IS_ERR(imx8qm_ldb_ch->phy)) {
+			ret = PTR_ERR(imx8qm_ldb_ch->phy);
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					"failed to get channel%d PHY: %d\n",
+								i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int imx8qm_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8qm_ldb *imx8qm_ldb;
+	struct imx8qm_ldb_channel *imx8qm_ldb_ch;
+	struct ldb *ldb;
+	struct ldb_channel *ldb_ch;
+	struct device_node *port1, *port2;
+	int pixel_order;
+	int ret, i;
+
+	imx8qm_ldb = devm_kzalloc(dev, sizeof(*imx8qm_ldb), GFP_KERNEL);
+	if (!imx8qm_ldb)
+		return -ENOMEM;
+
+	imx8qm_ldb->clk_pixel = devm_clk_get(dev, "pixel");
+	if (IS_ERR(imx8qm_ldb->clk_pixel)) {
+		ret = PTR_ERR(imx8qm_ldb->clk_pixel);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get pixel clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qm_ldb->clk_bypass = devm_clk_get(dev, "bypass");
+	if (IS_ERR(imx8qm_ldb->clk_bypass)) {
+		ret = PTR_ERR(imx8qm_ldb->clk_bypass);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get bypass clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qm_ldb->dev = dev;
+
+	ldb = &imx8qm_ldb->base;
+	ldb->dev = dev;
+	ldb->ctrl_reg = 0xe0;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
+		ldb->channel[i] = &imx8qm_ldb->channel[i].base;
+
+	ret = ldb_init_helper(ldb);
+	if (ret)
+		return ret;
+
+	if (ldb->available_ch_cnt == 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
+		return 0;
+	}
+
+	if (ldb->available_ch_cnt == 2) {
+		port1 = of_graph_get_port_by_id(ldb->channel[0]->np, 1);
+		port2 = of_graph_get_port_by_id(ldb->channel[1]->np, 1);
+		pixel_order =
+			drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+		of_node_put(port1);
+		of_node_put(port2);
+
+		if (pixel_order != DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
+			DRM_DEV_ERROR(dev, "invalid dual link pixel order: %d\n",
+								pixel_order);
+			return -EINVAL;
+		}
+
+		imx8qm_ldb->active_chno = 0;
+		imx8qm_ldb_ch = &imx8qm_ldb->channel[0];
+		ldb_ch = &imx8qm_ldb_ch->base;
+		ldb_ch->link_type = pixel_order;
+	} else {
+		for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+			imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+			ldb_ch = &imx8qm_ldb_ch->base;
+
+			if (ldb_ch->is_available) {
+				imx8qm_ldb->active_chno = ldb_ch->chno;
+				break;
+			}
+		}
+	}
+
+	ret = imx8qm_ldb_get_phy(imx8qm_ldb);
+	if (ret)
+		return ret;
+
+	ret = ldb_find_next_bridge_helper(ldb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, imx8qm_ldb);
+	pm_runtime_enable(dev);
+
+	ldb_add_bridge_helper(ldb, &imx8qm_ldb_bridge_funcs);
+
+	return ret;
+}
+
+static int imx8qm_ldb_remove(struct platform_device *pdev)
+{
+	struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
+	struct ldb *ldb = &imx8qm_ldb->base;
+
+	ldb_remove_bridge_helper(ldb);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
+{
+	struct imx8qm_ldb *imx8qm_ldb = dev_get_drvdata(dev);
+	struct ldb *ldb = &imx8qm_ldb->base;
+
+	/* disable LDB by resetting the control register to POR default */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx8qm_ldb_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend,
+			   imx8qm_ldb_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qm_ldb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-ldb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
+
+static struct platform_driver imx8qm_ldb_driver = {
+	.probe	= imx8qm_ldb_probe,
+	.remove = imx8qm_ldb_remove,
+	.driver	= {
+		.pm = &imx8qm_ldb_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qm_ldb_dt_ids,
+	},
+};
+module_platform_driver(imx8qm_ldb_driver);
+
+MODULE_DESCRIPTION("i.MX8QM LVDS Display Bridge(LDB)/Pixel Mapper bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
