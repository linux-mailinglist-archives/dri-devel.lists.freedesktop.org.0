Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00331E4A8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDE36E825;
	Thu, 18 Feb 2021 03:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F866E825
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXbpPkkpYGE30FGRQrSL0UEMgfAFcZnIHumtLC6JPGUp1eUOxk3UNriqr2sfTpYGKs6wLv3FUkLKbIWSDegXLybmtRS9Qz+TpWRBnvg7qWaHMnAypV1elfA+QrVnn2jrFy18Y8Xl5rSGrigm47kJZ3EbW8/zubb6DZVb3/VIOxFbH3F7HOgMlgJw7mB8SA+LDU/fvdAIVcyx0H4zhH7yR6D0aSGzXbruV5WWoQSmHgfFGRfMFB8IFczG0RVKRJkSVmUyX1irEfWGe3jNcJziwXORVC+h3co+g45WukVnMxO7yMgS7rOtVtTpmVf9gT7OrcvJdUZcAE48l3fvInUzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozYjhKmHcdzOIoMn+dpyI4VhrvneBYZjo8owGrGA9ck=;
 b=VnDvq9l5bRceNZTH2ewnopR6qfnPB5LCtfRXehCW3+LYVt1N+DLOyP6kZAaKjPnQIanOKxspbE1QO9849POOB5eu9CvIXhkfDxaD5UnBWOjG1JZTleYSqgLx9Q6orhgP/oNLPyzvLMLnQymgO9/7D8OyX3Ia8vxxecKMsYqKQPrlw+GweGeDbjtR9CzJmBGBz7fvMN9SSvn/nbl7hpyhzsMClsexSFO46yBZe4B//7dJGXlTa1pWHi8fXNw1DCkzWDB+TE5LnWmX7s6dlvs87qir8plzO9VFEl87G9Hwpzcf2K2X3vlsT/SG6IgmPD52TRwUZSCvQlu59GnzGxE6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozYjhKmHcdzOIoMn+dpyI4VhrvneBYZjo8owGrGA9ck=;
 b=XIvKsrzp3qjrhuAHZE/6E58UBK5x9zyLj/YCmupSu43mf7a7EPo6wzZbwcoaH6M7B0bc+LQMxl/SVBY6rsBcmkK5Q1ab06Ixxo3O59LL3zTDysAK8j1PvEbvJRkkGzrVZE1nj4IuMbBdoBzLFiiPK0BPL1+7lhbl3o4IEwWzQpM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:55:07 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:55:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Thu, 18 Feb 2021 11:41:51 +0800
Message-Id: <1613619715-28785-11-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:55:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac4a7f50-340e-4432-eaf5-08d8d3c0fb04
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34212C967648B2CB173FF08698859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KS7AtSmLfV1tRsRNnu9XuGvSdcj9x9AbZ9dJbx379fjU4ZbVSCQtaLKJn2DXzL/DBaK8GSHWRcwympiGqNu3mG2Gk8nu4Q6BdvP/JUZRMSCSyoXQNOFwKpJ6ac2iZ/h/uz+fMmc/c2GXMbV5teWElue4n/bibZNxa6HZlx5054rNm9Ne78m/LfyQRJ8FcXVolr1cDJMhqS//hV5pHdHJHNs0Kq4aXEz5I5n18d1fYoteqYOYCTpOA+aYxnpeDy+N24jDwRQDUPRgVhw7fVLdApVIcY+DkGUFist5b63fQHRZ7Q4OtM6wxGzEvo7Bn7bgu1Z1R9AHAoGWIO/oyse+PiZyDSbX9ZZ84UJlk0TA54OWVl4O28+cudFE4DoYI4z73+jb9YXOo92fxjowNRSd/W6EFXCP5RDpvnVMMmoCQINJR/f8BoO3W7CPPa7XiOuz+23stYWnz21z6cWw1AMniuG5gnDMVaiVLvd6GNSzqZUBYjVbRr+Q/SaKs1I5TdO5YlouXbGK7D5wbZXUBWpLt/pQibuEtmHDulYo7zt9BphwLwTRnC7WSmlBF0rXWDTn60iHCc3KOxTzmamkkw5ODQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(4326008)(30864003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7b47tZnmCuHd+C+UEDP71QxlctgAI05sSwqire0XHN1+eiIMExykL85uP1Kv?=
 =?us-ascii?Q?Yg4EEpeaAqygvawoDj/0wcxdYlsAMts66THtnKwIkdeZzy9KsqBWZsfGk6yC?=
 =?us-ascii?Q?dZd8dejPiid+r7FNBoAghCT3P+n40eyL6nD1U7fEANQqPb3GbmJrsAu6Cig+?=
 =?us-ascii?Q?ifA/zqbYq5HjGo9N4JhvZtHIF6b5C61uM/QEjIOr0rrZ3urzBlM+bnJ9wYsk?=
 =?us-ascii?Q?afnj2ICpWUS90gTNV/DTbftskbepdFRmtur1mOBUgkEjNoG2v94Kgc1r8ab1?=
 =?us-ascii?Q?Xfy2xyyE2UlUU1xoeKbKl8qWd6p1Hmir9L2udU/aedIEAjIWpPSUAou2Ja+y?=
 =?us-ascii?Q?6IP85fxDxosxDPqlekzKdor4YDmR3XA8cXLp5hXHC4QA2LXDDnCiUtBN7lI7?=
 =?us-ascii?Q?wjRynRcoowIl6gh3s27lmKyiBSqzOsfBSNG4dhKmh6R/VMVvfLyWyRq/o5r7?=
 =?us-ascii?Q?AckA+oap3cMUWmWh1NyFkAa8Mr5vvLD9EW7Nlw7enwYA+VSpSiY0JDnFX/Mm?=
 =?us-ascii?Q?FZtnq0K1bhZJ+jlOYY6lAcN+LEgXO1CVTAnCWgZ8/IBhSSaP04UzxqmXgwQD?=
 =?us-ascii?Q?vUZkht2W73kgkSnl/gemPOgXHflRHGetAcEPQhy1Eqj5om3An/hiDk5gyRyz?=
 =?us-ascii?Q?TKnOTiwcvM+o3FYMWuurhso0hexBXwptntAVX2lARxNVOuXGIXnF7NpjWl3Z?=
 =?us-ascii?Q?FONO07g9WIk96eEVhYrGILeCiu6HV3+mwNB046P/ChxFOYd9cWN0PVCA43mM?=
 =?us-ascii?Q?6f9IoB56iufxAI1XovCQ5PWbihauIs2lUhi1Y7bIKHsFABcOKnj/fy/0vEjX?=
 =?us-ascii?Q?AQYap1Wmmj9PQoqkNqaVoJajfrauvRbHy+DKlMwGaI/moyilOJ4CIVX26qOe?=
 =?us-ascii?Q?xiHhL1ZmiLMQLMJ4yl6ud3gbV/gRn7RHWrqqdpXGuxyJAoz8HhGyn1vqc7Fd?=
 =?us-ascii?Q?f6sEXcE2VgI7kZsrFd2Z1Fpw7JjonpdQveab7QHw5XrDB1ev+bSImdR5pf1N?=
 =?us-ascii?Q?oAL/fHLI5Wqv32br27RQGDRRZs/g5nysr3MwuEop90Hc62dEk7AD8fD7SLrQ?=
 =?us-ascii?Q?ZrR/nolrzg7Ub6UqldhGcXIT/Mu6xKvyp3qmV1buhJOnN5QTh05knA1UDAPq?=
 =?us-ascii?Q?gHTpbd+GVwrxAzYU9pPIBWlmg/PF28nY3jTF4GZqKbPNG+ChmxoklQDsfWc8?=
 =?us-ascii?Q?y5jF/VdrYpibX9/6G26Pab1olactjoLv5F87/ATlt9dvDTiWTaU53yWmmXgQ?=
 =?us-ascii?Q?j6MNfNC69tg/lwxBokAVKByduransgA/QoC8iLQYuba7ok2hfElhF4UI2zys?=
 =?us-ascii?Q?txhI2kjLak34r7pGMG0lcY/z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4a7f50-340e-4432-eaf5-08d8d3c0fb04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:55:07.4328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bieeUwsI53Bcl9NA1cO0aREgEqjZmkdXhhNPFSUoSFwHoZAuGUvQcDwX/vuuEGoF7YLCMZwWGTtf1iDFX3IgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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
v3->v4:
* No change.

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
