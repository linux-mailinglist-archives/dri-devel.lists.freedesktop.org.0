Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B444A3070D0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804496E8EF;
	Thu, 28 Jan 2021 08:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E86E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSZdG+EyalhKyY2Mtr7RzqwfA6pCbDC9B9/WmAvJy45oE0kZcyGypXodw7y3TfsC2NM7XY5mRJLmrHcr4lWSN33DF0mdvgcqoGUwuFg1eg7KSK87jalRV6PMAR5YUMDC3absFhu9N+PNTI9A4MqIPhKz492yKsMMbSDm6BrLanPGV5hIqqUdThgp7HVU7QH3mPMJMjkJ35Z8isiS7rb75JpVgZ8WjEUi7pZdpOjpdeUR7RXfVrs+1ChJ4bTdGju+XBWEk758Namc06SRcEbmmG2xbUkUZedrmbX78H8bf+Hu+A3Nu+0jWHgYAsQ1rhJuH9Up/2NRESIk0tjy62VnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv5hx/jcVfQoJbvsSv+8yH7Zmj0Cww0SAOdqmX/mkGU=;
 b=XbRO8XzPgyGj6KEFI4S6hVuU2y4iDANTfy0R71bJJ6jSJcdVP+H0PsDAj8rIPk77hwSRP6C0WqZ6kwGLYp8O5S9eLb8+LxRhtuaQri54Lu/Eah/kDiLgeNv3Jbmx5e1KV56ZOCclFhpfV5f+RZ/0+MKOqGLueb40scToxEnRxxW82c4wLnTJByvvw5okAYhv3GdUgOtYFAVmiYiJKElNbkzPBwO8/hKHtXBOdojLyDedsaA0E+NWCvQkZti/xd3rvI3rJRAg4Em/KFmXUMv4JnPxU9qWb7k5EkNgTPyEKqsOUw0FD45zuV4IByvu+iJ99dXiUE6EECZ65poXZpI2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv5hx/jcVfQoJbvsSv+8yH7Zmj0Cww0SAOdqmX/mkGU=;
 b=n/iQWvyVNWjGVGGDuLuADLGuMEOkPq9GEm+qdPb9Cx3vrYfQAuUQnLaChsUoAM0MdjMT/WZJLIIik4qPpuJv3m6pRGiK7vqqJxfL+4y3Kn8OvZbMdfh4wrYlNNcI7CX5YCrtfTOkOhBAGXQC9gYS7VeHRklpt2XlMiYJnl7TS6Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6559.eurprd04.prod.outlook.com (2603:10a6:803:126::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 13/14] drm/bridge: imx: Add LDB support for i.MX8qm
Date: Wed, 27 Jan 2021 16:51:27 +0800
Message-Id: <1611737488-2791-14-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 331d939d-80ec-41fe-bd86-08d8c2a27207
X-MS-TrafficTypeDiagnostic: VE1PR04MB6559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB655959918A206427DB907C4698BB0@VE1PR04MB6559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5W81C6Gl7Pdr6HW074peDi+K4lUvelW/x5dHge5ottsEOyB/ZtGcOWGOUmA8pziw2GDf2DhN9PWBZSmVw4/kz+hw3yKGr0ktRyYwrJBLFDMcaW4gt58szL+pn0X4FZOhxnMb+Tb3U2PGGvbK6NXEY//5HiU+u8CAvxgUxWb065hmXsi4/AVU9SM2qBT/dZ7CJWg/tIJGPVIldyM1kYnWzo72guL/yDVGmpDDJHcbulZjx1kkv3CPYoOAluf2Xtdlp8Z6JBxnSW8Jpbka2a4lfyGMo72JsUJT5wfQwjr9km5mVCN/MLv63oo+bfpOl0DbAqVl4ROY7tAjhLI7+VNzqaG5l6023D21npth2hHFVMcuqDRnyHjz4MaoQSRfUm8QKf/VtYq5Wx8qDJvRs74s7+iWa/9uwMF5OoO+XVElAfoMCfQmwUi2SEtr9StueoBAnw1U5LuREwcjoWkLP5TchrMzCXBaeN60XsXorXTakYlhtu9uE2cRSqkerlLfbjmRE3czJz7rH3wk82/GGwg7NGAbwLV5qN69YBYjxtEKAy9Oqt8HqcS6pkemtYi46FzW94L1M5bgCgWt0q6MjOiMAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(86362001)(83380400001)(6512007)(478600001)(6486002)(316002)(5660300002)(7416002)(8676002)(8936002)(2906002)(26005)(69590400011)(30864003)(4326008)(6666004)(52116002)(66946007)(6506007)(66476007)(66556008)(186003)(2616005)(956004)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hq5e2zay4wiDWAUNCNMuEmZG2aTw0W50eontX2rLr6hGI37JGTigSArox+c2?=
 =?us-ascii?Q?PtHxKu2vmNoGvVRXsRbP60VPmP0lSgyQ9uLPJXXcRJTGMLd7UZVR2Didsw5N?=
 =?us-ascii?Q?t0xZ8UidtnvDTeRlQc9cuKARlkVRhyOzDE80cueB2POyXYjRaHL/qKWwq4Sl?=
 =?us-ascii?Q?wjueUfFn+PausPdlM60tW+Z2JBrwIoDrJCR5XGoHCA4WR33IxhGsVLKsIjxV?=
 =?us-ascii?Q?nA4O8wT5HujGLU6gfzWV791fLZSmv5dRSXqL9NZU7gqifbxjf9eUeii36yw3?=
 =?us-ascii?Q?g159gBIyelNcJg/pyHMF5IflW40WuxGoOti+xsbRHlz6QYczmhKFImuepxdh?=
 =?us-ascii?Q?98eFylC4ckRlzxVvuFktbdJJXYKFe8U+0D5jvSEMaNAV48oY4Bb7f/HXiizG?=
 =?us-ascii?Q?H57LXgwjBb3KfizaxKLNjSiU6MkeW0uPnWvcxXmwgSiWvrAD6GSb11I0GCZP?=
 =?us-ascii?Q?s1ux7Bt9cON6X06yZNjMN5X8gEnE0KnfBva1PpapeOXVhRweSP6ENW0WNfyB?=
 =?us-ascii?Q?hNPCkt+75CJvogD0NnDIadcn/UnLrvDniOw8HTpgvIP6VApVSUAZaH3lRLg4?=
 =?us-ascii?Q?6vPRgGEZjsaFudpmGVzd0Ral79aoZrfDmhzkQBWF8nsN//21N0NLWdaLFhVl?=
 =?us-ascii?Q?aEDAyE9aSVp9KjqUvIFwZlkAiseTP229H2ATK9tANLHCglLiqQ2f8h64+h6i?=
 =?us-ascii?Q?hdqB5b+GCHCznTbbjGRAFqvwEmqyGeCSVK/CbAK18CR1iHd8SK/EMsA5N9Gn?=
 =?us-ascii?Q?8UJ8wj2m7ZH/k7OWdFPrf396hOAX4wX/8YtiRqb8Yo3qypKTNLTglUZieFZM?=
 =?us-ascii?Q?dzcrjOEfATZ7gVJowENynidWKKOSlvaUJNR6dtg0FTW689b6HYhVgzUcgSSx?=
 =?us-ascii?Q?pIC3vYvQiVbehlICkSfbd+4wRXN1wciVJ83J9BdqFEPDDtbOhJq++iFgikhr?=
 =?us-ascii?Q?2hpbbxbsSJBVLoQQ+pGA+fm3wGHNGSZsTw2ZyUzPOcfAdzLrQe9h2ZTT5AXZ?=
 =?us-ascii?Q?BrEDGO0eyW2sOkmjLRGebzOdWR/e6S2ZKWNuoVhFObsC8EXMHYfrPWfS67P6?=
 =?us-ascii?Q?5c8P6F6T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331d939d-80ec-41fe-bd86-08d8c2a27207
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:43.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUUJrgSx1mJgplEZ/dSR25gbpD2n8MypLyF+vSTi/HjZSlKqQ7YKf3hk7lNTBWSAg34oOoFNB6DZWpwvRP8wSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6559
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
v2->v3:
* No change.

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
