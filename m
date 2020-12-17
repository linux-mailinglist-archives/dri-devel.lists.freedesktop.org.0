Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B22DDFA2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CB89A8B;
	Fri, 18 Dec 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150073.outbound.protection.outlook.com [40.107.15.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F46E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSIXRTuzEtUSyNAApy2JO/zF/4YKdd4f5CAtJEaapjwT6cq7ouVEVsA68FYjw3LXu30rDbkayT4n527BJOJvPVezl22+PY7Z4yo2+porZt3M41XFEG7ypjtqJGBIeqY54gu9Dca4KIS+n44dTwlKr9XsI1IBlpew0UQm/9vL8KSSWczn6PDz4RMx2z4JvErW8SRCNwR7QIp6nrA0z9C2kIgMPfhlAYpmkyKAXnHnTJL6YbGSQfIGoXiz4Bzjzz8DtYKYGEod+sxqFymRBR9Cr85LUwdR1Rnl3DquHm6ttJl5gXE6+iua4yQtb90IByGGrL7jstada9fIId1dxCHKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UySgy1tszdzpwjNFus24cV0VEePAxF19l9XF1t+FzOU=;
 b=elTWv1ZjNFRH/4ru3ioZT5Wa8IRv9D1dQ9cYIEcyih1aWlldP+Pc2UdFWlXfMwAKl2IeEDSobw8h8qCtvo26IkeEmhD/zrreu6QOPZb0pB87Mu9H/X+IGMHTtathBQ/08XOOYanEBUYe2MqSR37kFaszz7Ys+rqw4C3/wa6ZcqSlgpYUfzCkc1N/B2960sWXBrvPxJjJA3uZPqhJdYaTbPKdI2rgPMZBegrpCJWiiloKZIs5BBQtPw3kVrNlZpLnmGWDZAOOIR0pMYgOC5MUnDrqY8uYtNgV0dSPAWyFobJjLbbSGaXyGPg9MfPkkUzF8Vp6fOs82Nun6XoXSvh6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UySgy1tszdzpwjNFus24cV0VEePAxF19l9XF1t+FzOU=;
 b=Wo/r1UY2Pa0yn+bgeQjYH+i/QOc9P/Uo84xtLJwPwUaRdAH8i6WBuXVGik9i34bo7zT9xufCJpfzKd+I6+kCfGxbw2rjas2mGBr35+sm8j6kfNhKJGBRXejvY0wp6qbtrjT7o2fQh2OZeRF2o05YegCWmKfosO0enYY4tDtd5nw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:21 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 10/14] drm/bridge: imx: Add LDB driver helper support
Date: Thu, 17 Dec 2020 17:59:29 +0800
Message-Id: <1608199173-28760-11-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:09:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0dcacefe-f0f2-4f53-ae84-08d8a273d304
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73122D1899ECB90FD340204598C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLNfAffU4Tt+Qpv382cSHnfGBkr6o8cymP9beigSwGStLB1f2AGQ2LfcbOr/RL2mmLMwF7DJqpXCTL366+fq+MJbDpQB8scur0TINmBR/Xw4WhmZlATjE5bIvbdeNwtG3hIkDt/2B3UQ3C3WHR85g7Tr+2x3NEOEiUJB0MmSz9v2kPUQAuqFLfdH7ktD4INt6ZamwfIhQEMtq2UPCalZBolQZxeE5ZT/6Gq75vCeOjvyxYk+Xf0DuATv5a3x9u6TD+duPqVvosAtHX4VYKQv1l3qY7DCwxxl9kOFyW9dflJ40js4qS/ubNmjh//lrEkm1BIaViUvpci3qk+oR7F+k2dR429kzSLxAwyWyfhNlTn3wH0tp+MYIX3dQJZoWHj+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(30864003)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c8QAD9KJKnr4rRQFOYpOcEP1ArjzfzfljLwmuIiAOQEVfu7OxOVJKkiB8jyB?=
 =?us-ascii?Q?Hs1na38m0ioZNWjDIlhd9hApcTCMhCKFnhvWsvCp9lvrrBtErH4fnqaEKCdw?=
 =?us-ascii?Q?cw8Z1DB6tV6tuTHlspKmC7rVu1gOe6BEhlVfci9BmGR4L11f44TYkqnS9qtR?=
 =?us-ascii?Q?pbJ10HsMfM/ogELvClsk/N2e2eJi36rxHUf7ekLN/BGwHqEQ+hgvxIYgyk1g?=
 =?us-ascii?Q?HNO0D1cNFs1MOEN6lHxEw8q4uHUnvc09dfloCjLULnfdB8kxwnV+eJYw+H1Y?=
 =?us-ascii?Q?YDz+x1iwnS+3fHOsImyjubS+k3Et1uD6rbeEZjvOAOrlA42KEnBGTrdyLTuc?=
 =?us-ascii?Q?xMQwn8L39QdALGdxnRooi8UqO0005vAn3KmH0yfj6BWy76wma6TMK0gfKYd4?=
 =?us-ascii?Q?kd09JwRVP2yTzQXdp0oZsSPoOPJQpvdlAIN7QkfKEAXs2OSH8kL+/2Vw9ESi?=
 =?us-ascii?Q?crnX075KTlvzpiH75iYNnDpD642oQUKp/4pbndMEbiCqPB+7cQO292ZTY10p?=
 =?us-ascii?Q?Sbfb5ZV2iUEJ43CtMB+8ofwZDznXsFgRgH87TVWnkAjHBKFlPkSkzGFRvaVr?=
 =?us-ascii?Q?ZFqfo+YOGafxCk6dXHRP2L60T/Dl1WsqwagLTF3XVBcT4NJ+zC0vZJpmKks2?=
 =?us-ascii?Q?66V8XyfxgJ+AgRSkODATfyZQakTi5R8LFmzMqgIkBaqdtOyzhysBpjhpiw39?=
 =?us-ascii?Q?+6NQ+NqtQQntAHt4BdQ/cjMNpmxZhRAkuH+eNLTuLfI9wsUz8TockXm01WS+?=
 =?us-ascii?Q?2Iwk5Jx+h1ZGEsz8MKe1vlmQVxMJrBqZ0C7o7ladtO+GG+unXXzW79i81CDw?=
 =?us-ascii?Q?nY1xxM2hk/xn5Zq6srIG/b3rqYjK8RKz2XU5p92Z+MF2DM3llK4CSv3hTGc/?=
 =?us-ascii?Q?axAuTaqrWeRw7DdE3tjZbx318LHtEqIeQ8TTbUlB4TeK89exkohl9ZNpBk8S?=
 =?us-ascii?Q?Vcey2w/xQegSj66frFIjAvUA1kmOO1c/PzWmlya+q8fh0K41G1LUILMom4vx?=
 =?us-ascii?Q?TYGz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:21.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcacefe-f0f2-4f53-ae84-08d8a273d304
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1akOet46O0eT8nFzpkAqSlsoPB/7KYVS3+3VVtG1yuBprHnnkwjsWZ6XvNCi1Nwa1Pncu3EKuxpuNCYTL+fgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
