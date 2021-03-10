Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0E333990
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAEA6E9FA;
	Wed, 10 Mar 2021 10:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDC96E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:10:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdXTiriqa0fzyWo59msDuPCM5eG7PhhPUN4qtiuWPifLUK6KiaaTrbRGfNyX1e1LYUapfv8LWpzh4BEQHIt5a9PmYRX2mma4gvPv8J3cnshYxNBRi2tyy7sjB4jhh3tTnjwHywXjV8fO4Hd2J5Vn4sWysRSIS35PMAd3iYmnrVG/ewOtQ9frvl3zT6P/2s+Tf2IQok43wjltT5/DkE8SjadoPtBB5cg6JmRZWTZ3cVSeBGrK9W/QwYGaW5KR9fFaxjF9k4XHR0BVKRx5a1oeSiYioatqkbDA2IF9AUj0ftWjUZUQuqcNGN/gHJYUN6CXJkI51Bx2DP9HXsndzemPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBu27cjZwly+SblQcqFl8oc8OxlT8oNoUlwwIV9MuK4=;
 b=CVLx5XHpMDEv5WU+i1J79TS0UFC1T9Oll58ayL/66XLu+9f9pmxJgh0BP467OXLJ6apK/EI7mnCTokkPKl9rGfeQ1L/FYr1AsD8/l+hpUWTj5yEhcngXcPER2aiMzxbP9XnyiPs1gNtFHvi2xD+EJLluc/9vwC0AJl1foijxvs6+cViEptPUUi/UmgS9VSSuRY60x/bjsrMoctGBaIqLxGlcdolvelft4cx6kSlDyFyjYLjsgo9lzMNp0z6LnKbRHWVcLDQNf0hQBxWwu87dCW5Xlk4XEHBz5wqfAutVlzHSdBlZqUMW91HeQqRcpB2U45kdCApQ3fvxMSYZq8aPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBu27cjZwly+SblQcqFl8oc8OxlT8oNoUlwwIV9MuK4=;
 b=KjN5Wq2btHulAR7PH2oKxXS1Ll9rraXxvwoK3JrDs2gEnUbfABVoLqCu1yxYMcaej9OCwzxyDgY31KwntS6xhcfVzQijM47jPwxnhipzTymV3lCj2rmP6rhdXubfEG7iARKmpx9bGe5pF886wZ01Cjk1bsMBSCtCzxNlcKOsO0U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:10:15 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:10:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
Date: Wed, 10 Mar 2021 17:55:36 +0800
Message-Id: <1615370138-5673-13-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:10:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c267bac6-69ca-4e22-a739-08d8e3acb331
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2813680FD6A5E380CB29025098919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUoFo/R3YlMrumFrMSCPxFOqd8udjiNdMqNdbqkP/R8FyXNWunnBifyEsqtktaNQRYxRcmpR4yg1lRj0kNcm4dL3WYG/AYn//10LdrAhNuIDOWGbbFOcVLpJK2m0vcaGssUcLG7oOZRzKdK7g8gXQzQjLpu2ZKc6QTtXJZkAHkuZy9Pq0KDTnUa3ME2JG0uvcqCq9n7+DiCdli1HNF3C4z3OG6w3F9GK4krSk1T2v9AhtL9sgE+53w0OT9zw3NeNilAC2oxi5MeiK3difDq5YcbysdMOkDXrwiowy7Qx5OGbkpnN5ScZ3M3vEAClGN2rw2yLGt0iZzuRX5/nSPvTrjrCD8Uq2ynCjhu0MPcU3qClXJ65JrzVsxCAC2kKis+6kx4fBgFpd43aDc7PQ3QjQL+nMGL4TlJeHj652k28hxgvVz+YpmORBBuyNFcCXEi2MnwODZAJSUB3Hgj0jISCTfdnodCJbdNV3hsKpdbvZW2Glko2ybTL0IuVn6HY6ecIIe6ZCosJ2XvhpM7tXnoMF6fRFXhBuiEZUT7zCETzLzGBKuV5+3q22GoerJiy1iUruqCwEvIJXhG57WkO8k3O70tLgUSrKr+T5QpWB1oO8Rka8dx/b/K7KWkB6ZGR4vHfDkBJ3ikZ3Egidvq3oNpWrgt3drhyrnqm+YMgEz6nfsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(69590400012)(6512007)(6666004)(26005)(30864003)(36756003)(6506007)(956004)(83380400001)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(966005)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K7Nk39WEWO28y98q/+hx5gHn9O695e4Mwxo/rX+tAEmzF+k6I35eBnJ96cZ7?=
 =?us-ascii?Q?rIa2AT0w1mgepiPb0MnXkJ25r59M0/3nUzuK6OjoMHgmdlC1M+IdLFhTz4G6?=
 =?us-ascii?Q?vCJI7xczR87JFgWRGs24jYmd4H3j3kY5jfPXVf/BhPN1hxeQu+VjIJCW/yVe?=
 =?us-ascii?Q?9xgqJM+MsQjai/CJupo/dk5GJJi3z6+V+WbedrniUUPc7umFCecjTEREvqd+?=
 =?us-ascii?Q?pNjhXwWX8OKJdTtX4RaThuMHVlyw1IDL++Oenua3frzSe0A5jrOEhWx6hduS?=
 =?us-ascii?Q?AebDls9cvUfVS5sK1WeV5iM+cvE9qzv+4yZc2m2XtKnHJZg4boYfDLuH4hnz?=
 =?us-ascii?Q?RlSuYk4kTpl3m0PYBsrOejlSnyrnHGuSirbZbq11p6XKZ2f2DTbPCpH+vEh3?=
 =?us-ascii?Q?FTCKEaGqj4e+Lfp/3Ze0rybB6jWh3oB+mbitEqLYUOPyLEMGbvirlasdCLPZ?=
 =?us-ascii?Q?SktgER8D1eZQl8gjixrk8aNMF1gFK6wYMliocommKL7YjVUf1WuYI2FKkx33?=
 =?us-ascii?Q?YWH/ncqQ4P8V3L1+UJ+8J09g4Tf4p7kbHSqCnOnYuB222OwRjZyUOMn7wZIq?=
 =?us-ascii?Q?TJLRHl+wpm3l83YZX/vfJ0AVMhs65rGIqNaAZtzWkoM5myJbp6fWE7F0QYEQ?=
 =?us-ascii?Q?Xt2bWjcWDRks2mpJ5wg3Qa+pYhjTDOCG42GXCPY3citKKRaBY8FL+7p42NIi?=
 =?us-ascii?Q?dLyRrHN9MIojqmphXVGcgrxCm5dYZqgw8o8POLB2xqq/sxSETpn5t98xkhTM?=
 =?us-ascii?Q?L8c2pVjW3/46M8DpNUn5G0QjS5HhneTKS2MvyjoL5WgHlatus7+ZjT3ifIHr?=
 =?us-ascii?Q?dbqTWhx3zc3dx+Y03/Qy5cDq/6jsskkyHwoqlwH4zgxS77FZpFnW6JuARwta?=
 =?us-ascii?Q?x2GQG8AnIXgZ8J1oGNk7qjq8k6CVuThn5NuPqlKAaxJJ9nRQZ/CzAt1lY3C2?=
 =?us-ascii?Q?4CLaBC+yn9gFV0OdSdUMidypcgKYHHU43hPtHfcfLDUZ1vsql2bqKDdgfo1D?=
 =?us-ascii?Q?Ow1nvLlZLl3P5Rx0TmNHRU747chQbIzIjHhGLuzCAg8kFb6rsiL31yBQuz3R?=
 =?us-ascii?Q?j9mRY4AqVdiwdaM2GZoo+zhblXpTKZKZJEdiX43sdDSpRuzpZgP/VtDWWilJ?=
 =?us-ascii?Q?XPCrR4cIZPNcK0wEl5XZ1T/id6eFvX/CAVQPkDsMlgNbw5LnddhCzb1gdZu8?=
 =?us-ascii?Q?hS8OgucN0bcrLVP4lMiyqGcSy+eq9sT8VWVTfMowe6DuowKAcdhfxDppwhdp?=
 =?us-ascii?Q?6toONRBTbVdHB3ee07o6E5JOu5aSea97Nld0/m4CUGRipG85pn9c8fNkR/yF?=
 =?us-ascii?Q?UknyVvy5Nq54Sjl49tzi9FSk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c267bac6-69ca-4e22-a739-08d8e3acb331
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:10:15.6079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5eKHUsvvMtPfiSKbxhUsHTDa7BQs1BE3+9jAE0ReYDgEYAbY3sUNRrRkBzDm+2MlCcpf0oAfLJYg3AO4BSsMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qxp LVDS display bridge(LDB)
which is officially named as pixel mapper.  The LDB has two channels.
Each of them supports up to 24bpp parallel input color format and can map
the input to VESA or JEIDA standards.  The two channels cannot be used
simultaneously, that is to say, the user should pick one of them to use.
Two LDB channels from two LDB instances can work together in LDB split
mode to support a dual link LVDS display.  The channel indexes have to be
different.  Channel0 outputs odd pixels and channel1 outputs even pixels.
This patch supports the LDB single mode and split mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on the patch 'phy: Add LVDS configuration options',
which has already been sent with the following series to add Mixel combo PHY
found in i.MX8qxp:
https://www.spinics.net/lists/arm-kernel/msg879957.html

v4->v5:
* Link with the imx-ldb-helper object. (Robert)
* Correspondingly, rename 'imx8qxp-ldb.c' to 'imx8qxp-ldb-drv.c'.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Drop unnecessary DT validation.
* Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
  get the input remote endpoint in imx8qxp_ldb_set_di_id().
* Avoid using companion_port OF node after putting it in
  imx8qxp_ldb_parse_dt_companion().
* Mention i.MX8qxp LDB official name 'pixel mapper' in the bridge driver
  and Kconfig help message.

 drivers/gpu/drm/bridge/imx/Kconfig           |   9 +
 drivers/gpu/drm/bridge/imx/Makefile          |   3 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c | 720 +++++++++++++++++++++++++++
 3 files changed, 732 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 1ea1ce7..94f8db4d 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,3 +1,12 @@
+config DRM_IMX8QXP_LDB
+	tristate "Freescale i.MX8QXP LVDS display bridge"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
+	  Freescale i.MX8qxp processor.  Official name of LDB is pixel mapper.
+
 config DRM_IMX8QXP_PIXEL_COMBINER
 	tristate "Freescale i.MX8QM/QXP pixel combiner"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index e74dd64..96d5d1e 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,3 +1,6 @@
+imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
+obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
+
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
new file mode 100644
index 00000000..d7f59c1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
@@ -0,0 +1,720 @@
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
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#include "imx-ldb-helper.h"
+
+#define  LDB_CH_SEL		(1 << 28)
+
+#define SS_CTRL			0x20
+#define  CH_HSYNC_M(id)		BIT(0 + ((id) * 2))
+#define  CH_VSYNC_M(id)		BIT(1 + ((id) * 2))
+#define  CH_PHSYNC(id)		BIT(0 + ((id) * 2))
+#define  CH_PVSYNC(id)		BIT(1 + ((id) * 2))
+
+#define DRIVER_NAME		"imx8qxp-ldb"
+
+struct imx8qxp_ldb_channel {
+	struct ldb_channel base;
+	struct phy *phy;
+	unsigned int di_id;
+};
+
+struct imx8qxp_ldb {
+	struct ldb base;
+	struct device *dev;
+	struct imx8qxp_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct clk *clk_pixel;
+	struct clk *clk_bypass;
+	struct drm_bridge *companion;
+	int active_chno;
+};
+
+static inline struct imx8qxp_ldb_channel *
+base_to_imx8qxp_ldb_channel(struct ldb_channel *base)
+{
+	return container_of(base, struct imx8qxp_ldb_channel, base);
+}
+
+static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
+{
+	return container_of(base, struct imx8qxp_ldb, base);
+}
+
+static void imx8qxp_ldb_set_phy_cfg(struct imx8qxp_ldb *imx8qxp_ldb,
+				    unsigned long di_clk, bool is_split,
+				    struct phy_configure_opts_lvds *phy_cfg)
+{
+	phy_cfg->bits_per_lane_and_dclk_cycle = 7;
+	phy_cfg->lanes = 4;
+
+	if (is_split) {
+		phy_cfg->differential_clk_rate = di_clk / 2;
+		phy_cfg->is_slave = !imx8qxp_ldb->companion;
+	} else {
+		phy_cfg->differential_clk_rate = di_clk;
+		phy_cfg->is_slave = false;
+	}
+}
+
+static int imx8qxp_ldb_bridge_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
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
+	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
+	ret = phy_validate(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
+	if (ret < 0) {
+		DRM_DEV_DEBUG_DRIVER(imx8qxp_ldb->dev,
+				     "failed to validate PHY: %d\n", ret);
+		return ret;
+	}
+
+	if (is_split && companion) {
+		ret = companion->funcs->atomic_check(companion,
+					bridge_state, crtc_state, conn_state);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static void
+imx8qxp_ldb_bridge_mode_set(struct drm_bridge *bridge,
+			    const struct drm_display_mode *mode,
+			    const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb_channel *companion_ldb_ch;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
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
+	ret = phy_init(imx8qxp_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
+
+	ret = phy_set_mode(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to set PHY mode: %d\n", ret);
+
+	if (is_split && companion) {
+		companion_ldb_ch = bridge_to_ldb_ch(companion);
+
+		companion_ldb_ch->in_bus_format = ldb_ch->in_bus_format;
+		companion_ldb_ch->out_bus_format = ldb_ch->out_bus_format;
+	}
+
+	clk_set_rate(imx8qxp_ldb->clk_bypass, di_clk);
+	clk_set_rate(imx8qxp_ldb->clk_pixel, di_clk);
+
+	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
+	ret = phy_configure(imx8qxp_ldb_ch->phy, &opts);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
+
+	if (chno == 0)
+		ldb->ldb_ctrl &= ~LDB_CH_SEL;
+	else
+		ldb->ldb_ctrl |= LDB_CH_SEL;
+
+	/* input VSYNC signal from pixel link is active low */
+	if (imx8qxp_ldb_ch->di_id == 0)
+		ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
+	else
+		ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
+
+	/*
+	 * For split mode, settle input VSYNC signal polarity and
+	 * channel selection down early.
+	 */
+	if (is_split)
+		regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
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
+
+	if (is_split && companion)
+		companion->funcs->mode_set(companion, mode, adjusted_mode);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	clk_prepare_enable(imx8qxp_ldb->clk_pixel);
+	clk_prepare_enable(imx8qxp_ldb->clk_bypass);
+
+	if (is_split && companion)
+		companion->funcs->atomic_pre_enable(companion, old_bridge_state);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	if (ldb_ch->chno == 0 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
+				LDB_CH0_MODE_EN_TO_DI0 : LDB_CH0_MODE_EN_TO_DI1;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
+				LDB_CH1_MODE_EN_TO_DI0 : LDB_CH1_MODE_EN_TO_DI1;
+	}
+
+	ldb_bridge_enable_helper(bridge);
+
+	ret = phy_power_on(imx8qxp_ldb_ch->phy);
+	if (ret)
+		DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
+
+	if (is_split && companion)
+		companion->funcs->atomic_enable(companion, old_bridge_state);
+}
+
+static void
+imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+					base_to_imx8qxp_ldb_channel(ldb_ch);
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct drm_bridge *companion = imx8qxp_ldb->companion;
+	struct device *dev = imx8qxp_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ret = phy_power_off(imx8qxp_ldb_ch->phy);
+	if (ret)
+		DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
+
+	ret = phy_exit(imx8qxp_ldb_ch->phy);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to teardown PHY: %d\n", ret);
+
+	ldb_bridge_disable_helper(bridge);
+
+	clk_disable_unprepare(imx8qxp_ldb->clk_bypass);
+	clk_disable_unprepare(imx8qxp_ldb->clk_pixel);
+
+	if (is_split && companion)
+		companion->funcs->atomic_disable(companion, old_bridge_state);
+
+	ret = pm_runtime_put(dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qxp_ldb_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool imx8qxp_ldb_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts); i++) {
+		if (imx8qxp_ldb_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
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
+	if (!imx8qxp_ldb_bus_output_fmt_supported(output_fmt))
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
+		 * Default to MEDIA_BUS_FMT_RGB888_1X24, if no match.
+		 */
+		if (di->num_bus_formats) {
+			finfo = drm_format_info(di->bus_formats[0]);
+
+			input_fmts[0] = finfo->depth == 18 ?
+					MEDIA_BUS_FMT_RGB666_1X24_CPADHI :
+					MEDIA_BUS_FMT_RGB888_1X24;
+		} else {
+			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
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
+imx8qxp_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts);
+	return kmemdup(imx8qxp_ldb_bus_output_fmts,
+			sizeof(imx8qxp_ldb_bus_output_fmts), GFP_KERNEL);
+}
+
+static enum drm_mode_status
+imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
+			      const struct drm_display_info *info,
+			      const struct drm_display_mode *mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	bool is_single = ldb_channel_is_single_link(ldb_ch);
+
+	if (mode->clock > 170000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 150000 && is_single)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qxp_ldb_bridge_mode_valid,
+	.attach			= ldb_bridge_attach_helper,
+	.atomic_check		= imx8qxp_ldb_bridge_atomic_check,
+	.mode_set		= imx8qxp_ldb_bridge_mode_set,
+	.atomic_pre_enable	= imx8qxp_ldb_bridge_atomic_pre_enable,
+	.atomic_enable		= imx8qxp_ldb_bridge_atomic_enable,
+	.atomic_disable		= imx8qxp_ldb_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_ldb_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_ldb_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_ldb_set_di_id(struct imx8qxp_ldb *imx8qxp_ldb)
+{
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
+	struct device_node *ep, *remote;
+	struct device *dev = imx8qxp_ldb->dev;
+	struct of_endpoint endpoint;
+	int ret;
+
+	ep = of_graph_get_endpoint_by_regs(ldb_ch->np, 0, -1);
+	if (!ep) {
+		DRM_DEV_ERROR(dev, "failed to get port0 endpoint\n");
+		return -EINVAL;
+	}
+
+	remote = of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!remote) {
+		DRM_DEV_ERROR(dev, "failed to get port0 remote endpoint\n");
+		return -EINVAL;
+	}
+
+	ret = of_graph_parse_endpoint(remote, &endpoint);
+	of_node_put(remote);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to parse port0 remote endpoint: %d\n",
+									ret);
+		return ret;
+	}
+
+	imx8qxp_ldb_ch->di_id = endpoint.id;
+
+	return 0;
+}
+
+static int
+imx8qxp_ldb_check_chno_and_dual_link(struct ldb_channel *ldb_ch, int link)
+{
+	if ((link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS && ldb_ch->chno != 0) ||
+	    (link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS && ldb_ch->chno != 1))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
+{
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
+			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
+	struct ldb_channel *companion_ldb_ch;
+	struct device_node *companion;
+	struct device_node *child;
+	struct device_node *companion_port = NULL;
+	struct device_node *port1, *port2;
+	struct device *dev = imx8qxp_ldb->dev;
+	const struct of_device_id *match;
+	u32 i;
+	int dual_link;
+	int ret;
+
+	/* Locate the companion LDB for dual-link operation, if any. */
+	companion = of_parse_phandle(dev->of_node, "fsl,companion-ldb", 0);
+	if (!companion)
+		return 0;
+
+	if (!of_device_is_available(companion)) {
+		DRM_DEV_ERROR(dev, "companion LDB is not available\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * Sanity check: the companion bridge must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
+		ret = -ENXIO;
+		goto out;
+	}
+
+	for_each_available_child_of_node(companion, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
+			DRM_DEV_ERROR(dev,
+				      "invalid channel node address: %u\n", i);
+			ret = -EINVAL;
+			of_node_put(child);
+			goto out;
+		}
+
+		/*
+		 * Channel numbers have to be different, because channel0
+		 * transmits odd pixels and channel1 transmits even pixels.
+		 */
+		if (i == (ldb_ch->chno ^ 0x1)) {
+			companion_port = child;
+			break;
+		}
+	}
+
+	if (companion_port == NULL) {
+		DRM_DEV_ERROR(dev,
+			      "failed to find companion LDB channel port\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode.  We do this by looking at the DT port nodes we are
+	 * connected to.  If they are marked as expecting odd pixels and
+	 * even pixels than we need to enable LDB split mode.
+	 */
+	port1 = of_graph_get_port_by_id(ldb_ch->np, 1);
+	port2 = of_graph_get_port_by_id(companion_port, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+	of_node_put(port1);
+	of_node_put(port2);
+
+	switch (dual_link) {
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
+		ldb_ch->link_type = LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
+		break;
+	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
+		ldb_ch->link_type = LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS;
+		break;
+	default:
+		ret = dual_link;
+		DRM_DEV_ERROR(dev,
+			      "failed to get dual link pixel order: %d\n", ret);
+		goto out;
+	}
+
+	ret = imx8qxp_ldb_check_chno_and_dual_link(ldb_ch, dual_link);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev,
+			      "unmatched channel number(%u) vs dual link(%d)\n",
+							ldb_ch->chno, dual_link);
+		goto out;
+	}
+
+	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
+	if (!imx8qxp_ldb->companion) {
+		ret = -EPROBE_DEFER;
+		DRM_DEV_DEBUG_DRIVER(dev,
+		       "failed to find bridge for companion bridge: %d\n", ret);
+		goto out;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev,
+		"dual-link configuration detected (companion bridge %pOF)\n",
+								companion);
+
+	companion_ldb_ch = bridge_to_ldb_ch(imx8qxp_ldb->companion);
+	companion_ldb_ch->link_type = ldb_ch->link_type;
+out:
+	of_node_put(companion_port);
+	of_node_put(companion);
+	return ret;
+}
+
+static int imx8qxp_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8qxp_ldb *imx8qxp_ldb;
+	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch;
+	struct ldb *ldb;
+	struct ldb_channel *ldb_ch;
+	int ret, i;
+
+	imx8qxp_ldb = devm_kzalloc(dev, sizeof(*imx8qxp_ldb), GFP_KERNEL);
+	if (!imx8qxp_ldb)
+		return -ENOMEM;
+
+	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
+	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
+		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get pixel clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
+	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
+		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "failed to get bypass clock: %d\n", ret);
+		return ret;
+	}
+
+	imx8qxp_ldb->dev = dev;
+
+	ldb = &imx8qxp_ldb->base;
+	ldb->dev = dev;
+	ldb->ctrl_reg = 0xe0;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
+		ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
+
+	ret = ldb_init_helper(ldb);
+	if (ret)
+		return ret;
+
+	if (ldb->available_ch_cnt == 0) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
+		return 0;
+	} else if (ldb->available_ch_cnt > 1) {
+		DRM_DEV_ERROR(dev, "invalid available channel number(%u)\n",
+							ldb->available_ch_cnt);
+		return -ENOTSUPP;
+	}
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qxp_ldb_ch = &imx8qxp_ldb->channel[i];
+		ldb_ch = &imx8qxp_ldb_ch->base;
+
+		if (ldb_ch->is_available) {
+			imx8qxp_ldb->active_chno = ldb_ch->chno;
+			break;
+		}
+	}
+
+	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
+	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
+		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
+						imx8qxp_ldb->active_chno, ret);
+		return ret;
+	}
+
+	ret = ldb_find_next_bridge_helper(ldb);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_ldb_set_di_id(imx8qxp_ldb);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_ldb_parse_dt_companion(imx8qxp_ldb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, imx8qxp_ldb);
+	pm_runtime_enable(dev);
+
+	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
+
+	return ret;
+}
+
+static int imx8qxp_ldb_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
+	struct ldb *ldb = &imx8qxp_ldb->base;
+
+	ldb_remove_bridge_helper(ldb);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
+{
+	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
+	struct ldb *ldb = &imx8qxp_ldb->base;
+
+	/* disable LDB by resetting the control register to POR default */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend,
+			   imx8qxp_ldb_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-ldb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
+
+static struct platform_driver imx8qxp_ldb_driver = {
+	.probe	= imx8qxp_ldb_probe,
+	.remove = imx8qxp_ldb_remove,
+	.driver	= {
+		.pm = &imx8qxp_ldb_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qxp_ldb_dt_ids,
+	},
+};
+module_platform_driver(imx8qxp_ldb_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP LVDS Display Bridge(LDB)/Pixel Mapper bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
