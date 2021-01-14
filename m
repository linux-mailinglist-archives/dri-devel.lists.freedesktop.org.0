Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6662F74B2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8245D6E17B;
	Fri, 15 Jan 2021 08:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283C6E156
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhVRgEjj0CQVCmrLGyNevGz+w5mOttNVW3u+gtnHu3+VFVQ49aawSc+XsGe6wwkVyvYALMtbaLD9S/l3QaSeU5AEJsd2ihRefdmJ841wqaatHocyGF+6W+07R1M7bVaR/zyMgjCXrW1EMxv2UUPp2IOafXnIcrbNZTa2z98U3MqcOGRENQPM9qOPHrf4j2Ub0UEwk84qhgo9aSpgqFd0Fyf0QrxgfFz8zq0QJEF0aDIrBH+/EqTaa6Xc4+it0i25sD3Uyron2cFsXF0n7tbXHRuxexvOSmVqU4mi0FV6AvZOvm9iNjQ6avYdZhJV2mcGjvLDX1mG6wLa3pMxOcX5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ3H+X6uwu5lbJh2qrP15UZo7MAswxblkVTXlPTxWnc=;
 b=XMA0fL1j+tiFkeAso0ZKa0X/Y8CH8nfvgTyCKbkWLagZpaA535SN3lfhv2HVNfoGWm915DBb3Ad8/TtlglPeqIIUnOcES1IrSfujCEue1gTlXiLK4YTJe+0R3eNw1DuuXgt1l2yE6dG6atkMM/24g9O6+WfsHm+6fz17aBQ/EDY73EjtOfBbJ/S8CXzOmsLrL52oa73jq3HQMjJ+VibrSq2pexOUak0HHG9VdXutSnZ3bAP+olZX+yEs0m7T6Sr5D9+tMrBBAakp5qAMuvaHA4JU7GkPQ+vW3j5QgWARftMf8q17kEI66opK0048FqiinIxGbJfSZJ6+337p2+5c5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ3H+X6uwu5lbJh2qrP15UZo7MAswxblkVTXlPTxWnc=;
 b=LLrbUduTZKbeVw6OWJchP/bpIU1urjtHbn2w6sWusjcSw5yAN+DLXTohj+IMkfk9LqIE2cqTk9bqdrduOzTGtbr/P9JC+5zG5YXVSPjyVUITXulLSUFeWXqbaCOgriFUon0bCxPv+3cPAqDCrXjquKiH+QR1Z2R5z7D1NUb3q+4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:31 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Thu, 14 Jan 2021 17:22:08 +0800
Message-Id: <1610616132-8220-11-git-send-email-victor.liu@nxp.com>
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
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d53b0c6a-db55-4f09-5ad9-08d8b86f74de
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5710A0A33E7CD4CA2D4A2C3698A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycYvztDoYmoprV7jKMj6XRjver962DeZXPIGLRQoPbna3KjB9+KZMQILekL40inVljCKKlwZGP9dSnk3Kj6Es2t3bweEp2KOkqZIDc+JF4GziT1kCFLcTi8ARF0UrJ5WRjyUUYF4KEgp7xSK4pUc/GMpusp/guJLZMgglA1ic1Xs/qgMyI6LnD76EenxJ5NUuJ7XocAXpTL0gbht9XhrVp7Cy5WRKxH5ukgNNNU674c0V7M70VdB+sfcDy25F4ZJfF9T22q/sDmzWZ8pgqucZsxHhSUTF9Fg77Z4bxov9T5NAogzWoLysJn+Rdw7v8kZt8cRt70ixPMwlAtvzedHHLyVZEZJaJKH1f/hvzzTl9qKc5T4T13DR9ravIwJxQEcv7tojc9WW0tNG2TOYI8oPZFlA/+UPInzFOpfGCBBu5Rqw8r8Qwp3p76rkJifH41koy4KETdZQybDkcSLmdlf8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(30864003)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kxKJapa6eQ+TFRkhC8AR7PPlsejtuTBHvdvvdf+kgzvJsBRUiEOGbjZqzC5t?=
 =?us-ascii?Q?oR2FeIfU1zST3Zc6FpD4WFTXEYN6ccg8brO4zOZcyI6YNMo4YwiC929l7YL4?=
 =?us-ascii?Q?oALLCQep4iBUoYyt1Rs+hcQB+xD+HNh7uZC5eBB9RH8uHFJI+4SbNTx2XJzi?=
 =?us-ascii?Q?Tkxxvn6s9W0nGHsvU+4nhVFKeY9ONcJma+8Sn6/hUwHYORvya3uevPmLnSHr?=
 =?us-ascii?Q?tj/f75ggZ333cD7UYWv4/8Vakz1Nnetx1jCWJubXmmtpF1yoem++CJZxbaxG?=
 =?us-ascii?Q?iQ36g91DYbXzqs7ThjO23rTdCmELpJMh1nyKpvChQVOvqTkGPRA6uNY3jE1w?=
 =?us-ascii?Q?aDd9xChqR+v/mVzSaSXdGQecVQr5W6RyzqZ+w0/RESMq9xxX+6KDDQhoXW7w?=
 =?us-ascii?Q?O/OegPUfDWDizPqQ4Gf7I3qICIG341ubXHF+Mym29ZbjfeVzSyxh2YVKgS5S?=
 =?us-ascii?Q?xhn7gZ6qMI6PsN2chAaDWlZxWu66YCgDCFN6FVxoT8KLh7Hr/4gNFS4F6soK?=
 =?us-ascii?Q?aCeEXomvrX4Bk+dDSmQQ16VTyR9/JqhrM0KW7EUpAC3/eqfSRjScQPUWzD0b?=
 =?us-ascii?Q?Gm6NXC+3nQArbG4kLbeUH/drXJ8WIicIaRCQu7uDHxPMzOU+HIBE/iJzGzx0?=
 =?us-ascii?Q?2A8j0hPsz3uN96PQfkKr3oFR9M8wvJRlWdSUpeXeSeQ6dqVJGniBg7bDdAFN?=
 =?us-ascii?Q?IwMbWCMzyxOqs5RRQPQw75b/VzPZdGi4RD7hRVYiu6SJftd+pW3j5ceb/4Xq?=
 =?us-ascii?Q?A4xaxWfOoBJ9907I93ZWED1TYDlegKs3HVtLofLWZKpNDvzKIJmXCvobpRAu?=
 =?us-ascii?Q?gVz5UZ5x85MnZ0rl+4kb6tjfwpRwlwsyNc+4pG08R6PKGIxBkCTP/9o2oY23?=
 =?us-ascii?Q?U9GKjbIRIz5aNa4ndKUuR0UTKVDNydym4TBSukKUBXUaxCRrOij4Tysc3rTy?=
 =?us-ascii?Q?P4BZ22UDxoZgTkDPF0RVn7jFNSYPrY5BVHbYLuIfruM8/5ufWFdTghfHjrlZ?=
 =?us-ascii?Q?xRVv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:31.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: d53b0c6a-db55-4f09-5ad9-08d8b86f74de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUIY9dRnDc28P21oWCGAy0HT5sq4vasLWV5qEMkSDtMPN5DQmOHnIwmwlLvnJrb47lgSfMQ1NChR3p844J0wKw==
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

This patch adds a helper to support LDB drm bridge drivers for
i.MX SoCs.  Helper functions exported from this driver should
implement common logics for all LDB modules embedded in i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/imx/Kconfig          |   8 +
 drivers/gpu/drm/bridge/imx/Makefile         |   1 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 248 ++++++++++++++++++++++++++++
 include/drm/bridge/imx_ldb_helper.h         |  98 +++++++++++
 4 files changed, 355 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 include/drm/bridge/imx_ldb_helper.h

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 1ea1ce7..23e24fd 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,3 +1,11 @@
+config DRM_IMX_LVDS_BRIDGE_HELPER
+	tristate "Freescale i.MX LVDS display bridge helper"
+	depends on OF
+	select DRM_PANEL_BRIDGE
+	help
+	  Helper to support Freescale i.MX LVDS Display Bridge(LDB).
+	  This bridge is embedded in a SoC.
+
 config DRM_IMX8QXP_PIXEL_COMBINER
 	tristate "Freescale i.MX8QM/QXP pixel combiner"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index e74dd64..902b703 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
new file mode 100644
index 00000000..ccf06a7
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ * Copyright 2019,2020 NXP
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/imx_ldb_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
+}
+EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
+
+bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
+	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
+}
+EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
+
+int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+
+	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
+	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
+
+void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	if (is_split)
+		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
+
+	switch (ldb_ch->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
+					 LDB_BIT_MAP_CH0_JEIDA;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
+					 LDB_BIT_MAP_CH1_JEIDA;
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
+
+void ldb_bridge_enable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+
+	/*
+	 * Platform specific bridge drivers should set ldb_ctrl properly
+	 * for the enablement, so just write the ctrl_reg here.
+	 */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
+
+void ldb_bridge_disable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	if (ldb_ch->chno == 0 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+	if (ldb_ch->chno == 1 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
+
+int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(ldb->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				ldb_ch->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
+
+int ldb_init_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+	u32 i;
+
+	ldb->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+	if (IS_ERR(ldb->regmap)) {
+		ret = PTR_ERR(ldb->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		struct ldb_channel *ldb_ch;
+
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel node address: %u\n", i);
+			of_node_put(child);
+			return ret;
+		}
+
+		ldb_ch = ldb->channel[i];
+		ldb_ch->ldb = ldb;
+		ldb_ch->chno = i;
+		ldb_ch->is_available = true;
+		ldb_ch->np = child;
+
+		ldb->available_ch_cnt++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ldb_init_helper);
+
+int ldb_find_next_bridge_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct ldb_channel *ldb_ch;
+	int ret, i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ret = drm_of_find_panel_or_bridge(ldb_ch->np, 1, 0,
+						  &ldb_ch->panel,
+						  &ldb_ch->next_bridge);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					"failed to find panel or bridge: %d\n",
+									ret);
+			return ret;
+		}
+
+		if (ldb_ch->panel) {
+			ldb_ch->next_bridge = devm_drm_panel_bridge_add(dev,
+								ldb_ch->panel);
+			if (IS_ERR(ldb_ch->next_bridge)) {
+				ret = PTR_ERR(ldb_ch->next_bridge);
+				DRM_DEV_ERROR(dev,
+					"failed to add panel bridge: %d\n",
+									ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
+
+void ldb_add_bridge_helper(struct ldb *ldb,
+			   const struct drm_bridge_funcs *bridge_funcs)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ldb_ch->bridge.driver_private = ldb_ch;
+		ldb_ch->bridge.funcs = bridge_funcs;
+		ldb_ch->bridge.of_node = ldb_ch->np;
+
+		drm_bridge_add(&ldb_ch->bridge);
+	}
+}
+EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
+
+void ldb_remove_bridge_helper(struct ldb *ldb)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ldb_ch->bridge);
+	}
+}
+EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
+
+MODULE_DESCRIPTION("Freescale i.MX LVDS Display Bridge driver helper");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:imx-ldb-helper");
diff --git a/include/drm/bridge/imx_ldb_helper.h b/include/drm/bridge/imx_ldb_helper.h
new file mode 100644
index 00000000..2a7ba97
--- /dev/null
+++ b/include/drm/bridge/imx_ldb_helper.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2019,2020 NXP
+ */
+
+#ifndef __FSL_IMX_LDB__
+#define __FSL_IMX_LDB__
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panel.h>
+
+#define LDB_CH0_MODE_EN_TO_DI0		(1 << 0)
+#define LDB_CH0_MODE_EN_TO_DI1		(3 << 0)
+#define LDB_CH0_MODE_EN_MASK		(3 << 0)
+#define LDB_CH1_MODE_EN_TO_DI0		(1 << 2)
+#define LDB_CH1_MODE_EN_TO_DI1		(3 << 2)
+#define LDB_CH1_MODE_EN_MASK		(3 << 2)
+#define LDB_SPLIT_MODE_EN		(1 << 4)
+#define LDB_DATA_WIDTH_CH0_24		(1 << 5)
+#define LDB_BIT_MAP_CH0_JEIDA		(1 << 6)
+#define LDB_DATA_WIDTH_CH1_24		(1 << 7)
+#define LDB_BIT_MAP_CH1_JEIDA		(1 << 8)
+#define LDB_DI0_VS_POL_ACT_LOW		(1 << 9)
+#define LDB_DI1_VS_POL_ACT_LOW		(1 << 10)
+
+#define MAX_LDB_CHAN_NUM		2
+
+enum ldb_channel_link_type {
+	LDB_CH_SINGLE_LINK,
+	LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
+	LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
+};
+
+struct ldb;
+
+struct ldb_channel {
+	struct ldb *ldb;
+	struct drm_bridge bridge;
+	struct drm_panel *panel;
+	struct drm_bridge *next_bridge;
+	struct device_node *np;
+	u32 chno;
+	bool is_available;
+	u32 in_bus_format;
+	u32 out_bus_format;
+	enum ldb_channel_link_type link_type;
+};
+
+struct ldb {
+	struct regmap *regmap;
+	struct device *dev;
+	struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
+	unsigned int ctrl_reg;
+	u32 ldb_ctrl;
+	unsigned int available_ch_cnt;
+};
+
+#define bridge_to_ldb_ch(b)	container_of(b, struct ldb_channel, bridge)
+
+bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
+bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
+
+int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state);
+
+void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode);
+
+void ldb_bridge_enable_helper(struct drm_bridge *bridge);
+
+void ldb_bridge_disable_helper(struct drm_bridge *bridge);
+
+int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags);
+
+int ldb_init_helper(struct ldb *ldb);
+
+int ldb_find_next_bridge_helper(struct ldb *ldb);
+
+void ldb_add_bridge_helper(struct ldb *ldb,
+			   const struct drm_bridge_funcs *bridge_funcs);
+
+void ldb_remove_bridge_helper(struct ldb *ldb);
+
+#endif /* __FSL_IMX_LDB__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
