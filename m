Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050893070D4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC16E8FF;
	Thu, 28 Jan 2021 08:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2A16E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA3ur5A16gKXAQDHqAVjmmXWs7DE8T+b7Z9gVHXU0YVqRlfrpRGSeOM6i81YkOGEIaEZ6MAUqPadmO1i/4Ivsdj15PpIIH3oz0wWKPh0yWa/edT7YWz04LN9ANKZqOY/eqT/9Wg9EEZPxwl2EHfUAxMLZBigDV/BH482hWkP0yytdh9x6yjbNhzwaIMVIec/mA8uLd7zUgzAxgBJ3XTWU0TdXsivdYRh6sRt94SQEeMxt1iMcJ7HDCl5MpW/6cFQIESNDpMH01Oh1LguV3isNX9viQqJV8HT4uMGutNjiAmPKlzhvQuVIchiaWQt3+94oP1eWC+npOS4Du4T+jhSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaZtB95mjXI5ox1c29+WhofHL8anfUM5/Y9AXrVeu4c=;
 b=WoynTzWYC/dQ+PyZhFNZZU1ahgBxdAxoRkEcBCJw51LiC55/iaND61o3K9LmEoGblnT72X8JXNOHp1SlXhroI9J/qY2ymBQYIe7xJwO9IBlbUvsniUUck2ZDRIGtWqo/QLitYDxypRkMY7OKVm2n/uqK8b53EAEYrhNJFK5ZKrmaaVbl7AXQ7P3wykBdMmmfaUnzPqi5UxsRgtFzkD/01wctqFdYed4gdbI7yUkI0/CxER8239C7NBjdg50U/hsMO3PAzKdxCAlvUxcY5hZ7wHSxD/ocCJzDPYffhtH/N+HPsqGpuC1CVHB94tTkeMJTnd6fulfJ3QXZ/Sbj7xbKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaZtB95mjXI5ox1c29+WhofHL8anfUM5/Y9AXrVeu4c=;
 b=gsr3oLVS6Acc3WQzxswT3UjLgHaSz83ybkGOL4Eu50iwMJivFBBLurlK0UQOZJbzjMbOMg6iuV49fYKN3iTR88pb5mm8jVcSRTMcH/NQy27/UXEWK3fI8AAEZf7VrJ0yWyNEx5E1Edzndw7q/ygOZxyO+veK7Esb1lBDDYXGrZk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:03:36 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:03:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
Date: Wed, 27 Jan 2021 16:51:26 +0800
Message-Id: <1611737488-2791-13-git-send-email-victor.liu@nxp.com>
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
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:03:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae6437ca-5b81-4b9e-5f43-08d8c2a26e24
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29758DBF32E418A15D0CBE8D98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lh5hqyzy5yYo5F5DfM5PLudcjejayEVZTAhUiXae1tTfsip91ir8jfXnycivMOisC22rIHTSHOdoHrQJWZa1Lc6JaeQx36sH9kI3EE3GZWA3PmqxQ/rkonYIV+tlmKJs0iV9soZNavixxqtu84LdIgo6LpReTLmSxaz+u3j6lqXr/hPmGoh6yyVILG5bP+Q/Duk4bj3/gxAXj+5v+Ez6110guON7VkQblTU5rAueROvntWkEP8xm+Dbf0cEhVcWvldM6W/V1mJRh/Gw9w/E0UHlgi5+zbMA8NSh4gGHLZkHLIcB3sfjDNpKvIq6zCwYOyfRUPSYut0zDQzYtQSDIvtYlxJ/Kp76HuO2xwuG1dk5xxB2DrwXM6IDHQ3I9fZWvwfq+sq9/MgqEeg3UAv34TZpfdtO9SpvzcpUwnSuVSecTkkavU381UBKx25qYSTx/aqR8v1G4ynAxZmGK5Q8mK7f4KJje2JTC5SGP/gp70PUg8BAKBnuWSour+xkC8JWLW/LpvaDgdLgn7T7ifx5PKfeAx8/mFs5XPmTbKKF0838rhlxDRhCOXaKSuT3dH0cqSt2NrlurOzVa05i3s84jOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(30864003)(6512007)(2906002)(52116002)(83380400001)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Uw2OWN0YmPyo63z66Ne1VijIZg8bSLKTBJDdmF650F6MCZuft1MFUBAE/yf9?=
 =?us-ascii?Q?7ltyQNpPMABpAY0GDv+cC2+OHcXgcji5sHDr7BlMlKL9qwB1hgr+4aZLXdC0?=
 =?us-ascii?Q?iY1XbLKaQkUb6WrE7J+CiaGBpLeA7oSfwA2nIuDBr2d5TLMkVtl7Qsdn/kv/?=
 =?us-ascii?Q?CLORi5vsfU4YdPJkNCPbDf9adrBddkF+qa+/aAQ5QlNXqj6MycAiZ4wBtm7h?=
 =?us-ascii?Q?AUbiVgONHi28U2FdnGpjHLHpXpkHrWOPHQNll/rnzX6CCTLzALwst7XeawmR?=
 =?us-ascii?Q?/JveZrYsorvsZ1qYrt5+I0sNCe6gDhdhU3/um0qui7EeD0gATBW++kv0OBpv?=
 =?us-ascii?Q?vuwisg9R3N7yd17kQybROaHQ1CRLZxS+IGTMCkRHrDnjmb7JSiMmWcHE6oGd?=
 =?us-ascii?Q?r8VzgMEGU05LQzQ7qO0RNUoxpYHSDx4C5s0Fqq5bMfYaBGnu3yhG3Rc72C6+?=
 =?us-ascii?Q?0mlCJOFud9BZuSl2fyaW0KItd6Yn9TYkINxlkQ9v/ycrekiQRFI1zk1CiZij?=
 =?us-ascii?Q?5y89NWhx/ruoB3yCkL/O0m4Nf4/0HAcVBBL+wT3L14OofSx4xq6AoqHAUMsJ?=
 =?us-ascii?Q?6s5ct879+Wd3ZMeQVRDApsGPKRo9DLTkgOU9B3hbvfW0UKhBDY8bE9U8KADk?=
 =?us-ascii?Q?Nxl8vYLFr/gst3m+HCyiWalHU94rfpE3AcoUxGeMC8Wd8FUlQocH2apKIS3m?=
 =?us-ascii?Q?yTSMj4XQdJKFCRexvhpTC3LSNAnr37KgIJRciUYAlt9Q5kxES7Jae3/kgPe2?=
 =?us-ascii?Q?Hiwg7jIW8oFiXkqATAIEJWhT5LugndkQSuW2yLo+mZh1RU02MeT/DUZRxqse?=
 =?us-ascii?Q?Dcozg5Wn8VkqG0XcjDF04uGjagCLY8DS4hlWx3rPWIFjqHkreKODVz9FiFrE?=
 =?us-ascii?Q?TVDQmwoeHf+ZjVXwcZj9EzZJa6mfZorh7Hy2lA66d/pQgwkr2qlUAFkkWHGF?=
 =?us-ascii?Q?jmUe2TahQOLNVBh+mBxLQ7HIqbv7ECWp92jsejOWgAWbTtlhGCCbI4SPj0ot?=
 =?us-ascii?Q?1A/krk/QZBlpvBw5gdMDPSECPE0pJ99LJ/uYKE8pah0bmVlZ0+8TTsuvZl4J?=
 =?us-ascii?Q?3q53DjEf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6437ca-5b81-4b9e-5f43-08d8c2a26e24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:03:36.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBlUX/DHh6jvNeB1ot6F3U12I6NkKPJK90ea8aqs5+a+eGhswfrPAwQmLihRNvpSfXgmoijg/uCOZURCLjNVpQ==
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

 drivers/gpu/drm/bridge/imx/Kconfig       |  10 +
 drivers/gpu/drm/bridge/imx/Makefile      |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 719 +++++++++++++++++++++++++++++++
 3 files changed, 730 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 23e24fd..07ad230 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -6,6 +6,16 @@ config DRM_IMX_LVDS_BRIDGE_HELPER
 	  Helper to support Freescale i.MX LVDS Display Bridge(LDB).
 	  This bridge is embedded in a SoC.
 
+config DRM_IMX8QXP_LDB
+	tristate "Freescale i.MX8QXP LVDS display bridge"
+	depends on DRM_IMX_LVDS_BRIDGE_HELPER
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
index 902b703..13160f0 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
new file mode 100644
index 00000000..62453b9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -0,0 +1,719 @@
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
