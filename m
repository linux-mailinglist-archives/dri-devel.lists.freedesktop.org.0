Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588A307100
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9873E6E937;
	Thu, 28 Jan 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220786E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irHlVybcRM2QdYadz9N0/J1Tko3NGNronk2l5qaWVdFYX9myJBkXSVlwnuosux6ddgnc9A7uFdZYFTVvY5VOZW7TubG7krY6OMkaP16QoASmobQXCG2WO/O7RmkDwHz7MFIBKuijlTgJmzdoKppxSv+4jjcpKkyGwyl4Pn+Y6FvnPhACskobWXo39CRtMLxJnOpApOyW2mTz8/yrRnvwzgSsizW1fFmX2IQ1qajnt3t11SK0v+8VC5Heg0zliZkDteomYQ2DYSJ+uDzA8J9atz8NpYOD7Vny/lABf+ZRzTNnMOebDmw2YIFy5HyT2YwvwdPaL9ri5xhaiFU4Kh8VoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA0LVl/u2vag/nj1oDsiDQJ8w8S04RA2sF/NIu2uj+U=;
 b=O1iXSz/IAo9w000rh6loH/AGtv3K0Ae2mpFSL1nvU7FZE+qbR9rL0utJ0DFHT8Ys3nMnITdbKgEqmudRlx+ZPt2uSEMP8WcCo2iuW6c/nOOytBjInzroOmg1ruNvu6QgjRDhez66eldZlOddsmJM5K/PPaUlUE/Exv4jHExRCvxncrOD8mejiMWy340IdACuB/TuOpF68iO1rwelwrlWNIJsNqDNqUdJmZ3tNMkgwfpzgIzJ2sobMJUWdHjwICj7JhcUuLcZTWbg/noeSc2AXUTPIuj0WCdxXIognIJel7nC4q79RgApHogyfGjzHBEYt+tDZAtK1BCN3jcNWmQfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA0LVl/u2vag/nj1oDsiDQJ8w8S04RA2sF/NIu2uj+U=;
 b=H5v/hbrXgt0/FDfsMgK2edeKCvtqdyYis4vSrv01NiTG+LA8TE7annHRhRgbufY3FndtcWOgus/DvDrSTIegCuxHM/teDspmdVnAoiz53yDrfigsLeLBolJ2+64gQLQbk0dimPUnYWIYlHIpJhzYIh/cr70qwvQ3zEqnA5+iDL4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Wed, 27 Jan 2021 16:51:24 +0800
Message-Id: <1611737488-2791-11-git-send-email-victor.liu@nxp.com>
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
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94035f33-0250-4a6b-d3e5-08d8c2a26647
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29750800F98757F29C30784498BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxYfQaolV3hTVEa7cb6hg8JOKDGBtPMxiage+k33Ry8aNsMtubBC0Bp2hI1pRY2YtjDoVi5A+VVcbVKNrAbnpST52dCvieoAS+f0wUtRz8OQA7swoZ28mY1F07LagKE8Uac/7LSAw/FXaw/7NBZshDF8hzvst3ncWWg6tqiVoHl1V1nM+EccUeNUsmHzariTJyz6KKcsV0QbAe4ttvK4mBviFlLWRQ/q9stDGoDag6lmiOSyPLZxyTEc0OpfQsNKAfaWJY2dNZnGU0Pwxei0vRdK7Nq6QwJ9D4htANYKrRm4G6jTIvuBOWE/LDIXdkumsFsgvN15RB8h1m9IKqS10MrbT6pAk9o2eE5AjyxQzu7Zj2dFzv80rWMu/JAqeDrIpqkwHyh7COC6Dq4IrgyRLTJ4dro1YYVwWGbe3T6GCmO0QVhxsBan0ZTXzASqCHIqkgqrvR35AFUA3BHespdotq6fS5He8cmbpXm9/90zYcKO5mcd0u5CfXxGKi2JAToplaRY17iHpnUFnYmvufuZyHfTao2MjOOnOWEXZ3QD9305RBHvLi3QsVv+nAXkC54BKEQ9SakBLi8WAesWiSI12w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(30864003)(6512007)(2906002)(52116002)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YySQyrNYcAy4NLBMNZpgdc4HCCfO6ti/O9tanvwlPYjtAohUG38cNkec0oNS?=
 =?us-ascii?Q?C+GSMHbr3VeE6xiW1ddKSTnkXFdNli4v+107vYllEI80uKJcIlfE3BciQZwP?=
 =?us-ascii?Q?2gpespbSqqcrWq6JagUOadWvwSiJ3Vianvb2bYkK1fLvRGdtAZyK00Qz0bC3?=
 =?us-ascii?Q?nTYsIRfKwli7pPab3xLeBOldKdW12uf5ZlN8/DOHS+3FsmhycgA0LhAyxo+A?=
 =?us-ascii?Q?4PBvSnKYwRYIaC0/yjjeBwmzq8ZeEbtQt8NS5ymSTL6cB6/UrWl8XppsnpPY?=
 =?us-ascii?Q?UE18JheaVIp+IVMQP+HO4jOSgJWG19g9myVxi5QsBo8yL38uPXXb1vrP8dhI?=
 =?us-ascii?Q?JbrEips3PUhGs0E8uC8NAfSIhpqgLKDpy5qMGmiQG7FyS6hv9834NnUI7SZ+?=
 =?us-ascii?Q?QbUQil/IHlQ0rW0iEcbdMrPB9iuDPEA45y+k5apDyU7PwYsoCwupcRlDf4JN?=
 =?us-ascii?Q?nfdUSn7ln+81kHGOr91RNvFoVsMfsOO2hYgBBSIi9MdYemedUj2UFxwk0Rbd?=
 =?us-ascii?Q?n/d15Pb8ZBaUDPjje31FlioFJNPB7oRLXxGZTpv4hR/H62krL9+pa9bNSaOb?=
 =?us-ascii?Q?so//sX9+iXDttqziRwkfmjWVVYNgdmPRQWaQl+a88Wy7arbzSnbXbim5G2Gp?=
 =?us-ascii?Q?qE4XabQemJ1kLNCEztq3ONqFoTiMEy+wJgv4ZxixX1jRU02Fv9xkcTT/BjIc?=
 =?us-ascii?Q?+YMN6h2HftVQvu5cJtUIuDBIzJQdVv7m+N9XrbWzd/G9YRjt2HNFKluhfepl?=
 =?us-ascii?Q?IHFk571W6WFNAJJvGgzcGQO3bijHcTjrryQd7VaiDUoQHmR4EcM9UWIpIYsj?=
 =?us-ascii?Q?MnhPbLFEizb5+xul1fUg0vAIJV+puF56fZuu44+6BXHPKnBxfwm5rCwbdCI8?=
 =?us-ascii?Q?UnB9ohImcqnortTHZtXfVin7FRcpiMhxHjMHdaOTmS7MsbcJy+acbE1ojkgi?=
 =?us-ascii?Q?NY0Tc3xS02/K/tgqvdxwbXrlfZ4pH5JwJ9Tvdh2hfJ/A7pRgyXZKdaaSzsc+?=
 =?us-ascii?Q?twVpf03l7D4ub0g7qLPMqe+/Q91yJs3T9Ju+QdspuzetjXdGGrVTYL1ok7ra?=
 =?us-ascii?Q?XpsScOH7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94035f33-0250-4a6b-d3e5-08d8c2a26647
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:23.3916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ap/u33t8Tuo8edvfBmsBjiifw+A9D8N98MiWODaa3kj6AopY2hi+slS/V29jLMFF/Jqy5h8TYxUsxihi5rdlfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
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

This patch adds a helper to support LDB drm bridge drivers for
i.MX SoCs.  Helper functions exported from this driver should
implement common logics for all LDB modules embedded in i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Call syscon_node_to_regmap() to get regmap instead of
  syscon_regmap_lookup_by_phandle().

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
index 00000000..94d7f9e
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
+	ldb->regmap = syscon_node_to_regmap(np->parent);
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
