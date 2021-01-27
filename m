Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB243070EF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523BB6E916;
	Thu, 28 Jan 2021 08:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5862B6E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAzEqcPw6fJ4eqz4e+OauoULfFe6nMmdm0ogBxdMnKWuyPd36M7upSwOeinglc26lzsq8cK66moY+VuSIWE9Rv3I4XNqLqAzwH4Bj/kNuO8a7bc7qt59ymHd1PqeNs6rwKL7aQDdD1KXohPCcJBiEGI0zPjsUYDgX7xpU2pSAgf6rEhAqpXIxpns7UvJFmJ37nFQCJ0lMDzR9dRPz/WwUASlxCNnTuV1xRYcYAa8ktX0CX9SmDfL1Ai/KCkL4IsRrqWkfqscAMoskzEqPFTIzDTyhhPAAz8hispSSgkQK6i8tXkRNjw5oTunou1CyTZBlXUBi2hMikx7x+HyKwFZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5nrOFiuq6Gk3lVjBGa3OPSw6b7fpY9Ievcl0sphnLc=;
 b=OZdyODyG+3tGLIzQZEE1r7iM3nopYlNOucPo72qMp2q8L6JvJ6ramNCcBWJ0mNPGVQqJpR8COXEttnbUWQIvKhVss+79NscKYw96NaKig5r/o6giBjDovquZF3w/hVUs4MSICQARQg3GmKsl0CKRvOVHGFHVlqg0JhPT9ynPx8tFgJO6kXyXJuC5XKMPK+Mp8988PHlqs2R4vQ5l+G0KlVdr+sCzV7ZDYx03+84StFfbRQ8q/9L8y/7L8iWtzayzhdNoMFfvDZRJKg5qmszy9Wg6rBrB4tWbCgHXxjoQESGEo6mc4yYfbTWg6EMXU3LL33gDaTPb3eoyDIQYl9e2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5nrOFiuq6Gk3lVjBGa3OPSw6b7fpY9Ievcl0sphnLc=;
 b=OWOiXONOzRmImfS3MtiUf5ItEA556U0gloWXAxpVTRcQMH/P7umGeD24jOS5v2WN9CoA7irel82C1ItqLMkye+hZ0MXfDYe+C+q/4qI2xTgIPb120QRLKzyoGFp4Xm1Z4IgEofHxWcOzO4bXkmUJJkQQLxSENPXoljjuvfMuwtQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:48 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 05/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner
 support
Date: Wed, 27 Jan 2021 16:51:19 +0800
Message-Id: <1611737488-2791-6-git-send-email-victor.liu@nxp.com>
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
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ddae582-1a27-4109-6caa-08d8c2a251a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297500A38D89BE68FE7A24A698BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQ5xpMjbdzo+k8HnaiI0qbtGmc0wE4axPoDYhtWX/txaE9k3L94j7LBYtjliJ+o6j3EoCGlp7EPlEiZnpfPbrPjkVaigaD1kA46vLlV4AcDXbASEB6qt3XceG/wrmmvAl6pcSPR5duGhFdm+IvF5oLY+C7KFLSTab3HHe3A5HTxbma6CaW9/wKA9obPx9hUbOWvzn7wK1OM47OSf6g3JueAz/E5+x84nYq+P9UN16f7uclnNMBgDuNo16w8IuzGBtHZsMqyc+yOis2d9KuudGOg+JaT083YBqZ2V4/yoV5Y+x++rSkrwVQ6Catht+Q7pAw9ss7PrJStIQqvcoCCztEoqGwcfMpy+pb3CmdpDyZDltjyE+gCDDQRfiL4hQ+A0yAbVkLYj9WeqXQCXnTZK2COfFqy+OHsd7p2T2wSGglXEblKxUrsiugyTWd7CgI3/bUKgqWOOgYwef+RVq+22YQGTsuG5fZlb70O002D6qwZToDwRouRLFSm0LXQOlnqEEl9742OUZVJBI2HE7RxeQIouth3dep2uZtzSHA8CLTO+6eCL3aor3ResyuXE1tps1bLNBnxGwjlhl6OhRMO67Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(30864003)(6512007)(2906002)(52116002)(83380400001)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g+41UDbVfe/rw4U7SjLRIIg7/lBID4m8bO6O1ThzNlUohMLasSjjAMVLiq8O?=
 =?us-ascii?Q?j72snc8PJI9DppTIi71EpIrVKHLxMAP2MRwoX5cGm+2vp88/uMHVcKBdjlsA?=
 =?us-ascii?Q?rWD3sOk1yhKg7p/yZ/JOIEQ2Y8qMKYqLKFdtX2CV7d+c/YG8qLLUL2pE7BxA?=
 =?us-ascii?Q?V2nPYruJyOAbj8qiiRJ80RvUGvkt3/lNDSKJYCXNqZYOSI9lr20PEDI4zrmL?=
 =?us-ascii?Q?8BQOSEBFdxTxd/Rk18hdPMyln9PFCyG6FOyxcpd1ynPy85paVHuUxh9KBu40?=
 =?us-ascii?Q?ovY1cI6ggpQKhJ03QT1mXfh2E0iIKk/oY7f9XKhkKRE3gyJK3Qg9MXQfRbG7?=
 =?us-ascii?Q?Vl1Ra3rDjRos0LSwYr2gs1zgaHHrVEpj2eWxBmRVz2Er+hfTN9BJrkL1dXt/?=
 =?us-ascii?Q?yF2aC2Xz/N4FLvFUm0W2Srrvwi3+e85ljqMM9Y8XQ1Ke3iqELzidFWZxEjQn?=
 =?us-ascii?Q?bDJzo6jlAhYB8aIRrULWJGNHRErs++8zrnS88BtRKj1ZwLN0E0jbfcY1DAcs?=
 =?us-ascii?Q?fgifZD/0CUaKh1M5D1gVo07XrYuuitR0phppopNPZCZ0W3gvAQdqTykWFYaU?=
 =?us-ascii?Q?MVt3Tc0yt3XYtwohGeSgdfz79PhBX4V7k+3ZvoNRXm2yCCBunNnZGTW8vTod?=
 =?us-ascii?Q?nGyFZ6GkzDQ1uTgUchghj46q3RXFrypwgcIf9WHawt9iZD1FxiM7/8h9vK/h?=
 =?us-ascii?Q?rYasD3lVHCft8/ewKUNniov/ECBhm4P2+XRilSo3CPA+HofWLkmkFwcZqFJc?=
 =?us-ascii?Q?bZVblPITAnUOSHwvSflmISPDzpTGtHSkhXOlOYD6V7P+9Q3ygIO/hN327XUG?=
 =?us-ascii?Q?m/IkjNBNImhAr0I5NMrFqiUvcWGAROSlGnqIS1qBrE2GSx9BYlnpd9x9VTuF?=
 =?us-ascii?Q?mIWuwDg+82XK1lQ2txzOUaU5BoXFHkANV9FOGNabe1A2JksLMj5ImbMOeEuT?=
 =?us-ascii?Q?7ghSSUuSf8EsEJOSG/NSaUbqesnefTjQYFfXvuNIowSCtR2MmI1ox6TunweM?=
 =?us-ascii?Q?6ItZqMk1SBhLLQMcfcOVvGcXObLfhpct2eABg4gB3BqsAdZmwf8fv3BXbxGm?=
 =?us-ascii?Q?s1j+3W3o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddae582-1a27-4109-6caa-08d8c2a251a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:48.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw5a7hbKDbvMC9+8nsSGSHKurSnmweEwOVEuSGqGdoZZYurewRlVed2LxYYde8OD2GWzk69nB8U90RJaN5B4+A==
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

This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
The pixel combiner takes two output streams from a single display
controller and manipulates the two streams to support a number
of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
as either one screen, two screens, or virtual screens.  The pixel
combiner is also responsible for generating some of the control signals
for the pixel link output channel.  For now, the driver only supports
the bypass mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |   8 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 452 +++++++++++++++++++++
 5 files changed, 464 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6c..84944e0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -256,6 +256,8 @@ source "drivers/gpu/drm/bridge/adv7511/Kconfig"
 
 source "drivers/gpu/drm/bridge/cadence/Kconfig"
 
+source "drivers/gpu/drm/bridge/imx/Kconfig"
+
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 86e7acc..bc80cae 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -27,4 +27,5 @@ obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
 
 obj-y += analogix/
 obj-y += cadence/
+obj-y += imx/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
new file mode 100644
index 00000000..f1c91b6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -0,0 +1,8 @@
+config DRM_IMX8QXP_PIXEL_COMBINER
+	tristate "Freescale i.MX8QM/QXP pixel combiner"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable pixel combiner found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
new file mode 100644
index 00000000..7d7c8d6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
new file mode 100644
index 00000000..cd5b1be
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define PC_CTRL_REG			0x0
+#define  PC_COMBINE_ENABLE		BIT(0)
+#define  PC_DISP_BYPASS(n)		BIT(1 + 21 * (n))
+#define  PC_DISP_HSYNC_POLARITY(n)	BIT(2 + 11 * (n))
+#define  PC_DISP_HSYNC_POLARITY_POS(n)	DISP_HSYNC_POLARITY(n)
+#define  PC_DISP_VSYNC_POLARITY(n)	BIT(3 + 11 * (n))
+#define  PC_DISP_VSYNC_POLARITY_POS(n)	DISP_VSYNC_POLARITY(n)
+#define  PC_DISP_DVALID_POLARITY(n)	BIT(4 + 11 * (n))
+#define  PC_DISP_DVALID_POLARITY_POS(n)	DISP_DVALID_POLARITY(n)
+#define  PC_VSYNC_MASK_ENABLE		BIT(5)
+#define  PC_SKIP_MODE			BIT(6)
+#define  PC_SKIP_NUMBER_MASK		GENMASK(12, 7)
+#define  PC_SKIP_NUMBER(n)		FIELD_PREP(PC_SKIP_NUMBER_MASK, (n))
+#define  PC_DISP0_PIX_DATA_FORMAT_MASK	GENMASK(18, 16)
+#define  PC_DISP0_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP0_PIX_DATA_FORMAT_MASK, (fmt))
+#define  PC_DISP1_PIX_DATA_FORMAT_MASK	GENMASK(21, 19)
+#define  PC_DISP1_PIX_DATA_FORMAT(fmt)	\
+				FIELD_PREP(PC_DISP1_PIX_DATA_FORMAT_MASK, (fmt))
+
+#define PC_BUF_PARA_REG			0x10
+#define  PC_BUF_ACTIVE_DEPTH_MASK	GENMASK(10, 0)
+#define  PC_BUF_ACTIVE_DEPTH(n)		FIELD_PREP(PC_BUF_ACTIVE_DEPTH_MASK, (n))
+
+#define PC_SW_RESET_REG			0x20
+#define  PC_SW_RESET_N			BIT(0)
+#define  PC_DISP_SW_RESET_N(n)		BIT(1 + (n))
+#define  PC_FULL_RESET_N		(PC_SW_RESET_N |		\
+					 PC_DISP_SW_RESET_N(0) |	\
+					 PC_DISP_SW_RESET_N(1))
+
+#define PC_REG_SET			0x4
+#define PC_REG_CLR			0x8
+
+#define DRIVER_NAME			"imx8qxp-pixel-combiner"
+
+enum imx8qxp_pc_pix_data_format {
+	RGB,
+	YUV444,
+	YUV422,
+	SPLIT_RGB,
+};
+
+struct imx8qxp_pc_channel {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct imx8qxp_pc *pc;
+	unsigned int stream_id;
+	bool is_available;
+};
+
+struct imx8qxp_pc {
+	struct device *dev;
+	struct imx8qxp_pc_channel ch[2];
+	struct clk *clk_apb;
+	void __iomem *base;
+};
+
+static inline u32 imx8qxp_pc_read(struct imx8qxp_pc *pc, unsigned int offset)
+{
+	return readl(pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	writel(value, pc->base + offset);
+}
+
+static inline void
+imx8qxp_pc_write_set(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_SET, value);
+}
+
+static inline void
+imx8qxp_pc_write_clr(struct imx8qxp_pc *pc, unsigned int offset, u32 value)
+{
+	imx8qxp_pc_write(pc, offset + PC_REG_CLR, value);
+}
+
+static enum drm_mode_status
+imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 2560)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
+static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pc->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pc->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 ch->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pc_bridge_mode_set(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_get_sync(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev,
+			      "failed to get runtime PM sync: %d\n", ret);
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+								__func__,  ret);
+
+	/* HSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+				PC_DISP_HSYNC_POLARITY(ch->stream_id));
+
+	/* VSYNC to pixel link is active low. */
+	imx8qxp_pc_write_clr(pc, PC_CTRL_REG,
+				PC_DISP_VSYNC_POLARITY(ch->stream_id));
+
+	/* Data enable to pixel link is active high. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG,
+				PC_DISP_DVALID_POLARITY(ch->stream_id));
+
+	/* Mask the first frame output which may be incomplete. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_VSYNC_MASK_ENABLE);
+
+	/* Only support RGB currently. */
+	val = imx8qxp_pc_read(pc, PC_CTRL_REG);
+	if (ch->stream_id == 0) {
+		val &= ~PC_DISP0_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP0_PIX_DATA_FORMAT(RGB);
+	} else {
+		val &= ~PC_DISP1_PIX_DATA_FORMAT_MASK;
+		val |= PC_DISP1_PIX_DATA_FORMAT(RGB);
+	}
+	imx8qxp_pc_write(pc, PC_CTRL_REG, val);
+
+	/* Only support bypass mode currently. */
+	imx8qxp_pc_write_set(pc, PC_CTRL_REG, PC_DISP_BYPASS(ch->stream_id));
+
+	clk_disable_unprepare(pc->clk_apb);
+}
+
+static void imx8qxp_pc_bridge_atomic_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pc_channel *ch = bridge->driver_private;
+	struct imx8qxp_pc *pc = ch->pc;
+	int ret;
+
+	ret = pm_runtime_put(pc->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx8qxp_pc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pc_bus_output_fmts); i++) {
+		if (imx8qxp_pc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X30_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X36_CPADLO:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X30_CPADLO;
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
+imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pc_bus_output_fmts);
+	return kmemdup(imx8qxp_pc_bus_output_fmts,
+			sizeof(imx8qxp_pc_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
+	.attach			= imx8qxp_pc_bridge_attach,
+	.mode_set		= imx8qxp_pc_bridge_mode_set,
+	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+				imx8qxp_pc_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc;
+	struct imx8qxp_pc_channel *ch;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child, *remote;
+	u32 i;
+	int ret;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pc->base))
+		return PTR_ERR(pc->base);
+
+	pc->dev = dev;
+
+	pc->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(pc->clk_apb)) {
+		ret = PTR_ERR(pc->clk_apb);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get apb clock: %d\n",
+									ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pc);
+	pm_runtime_enable(dev);
+
+	for_each_available_child_of_node(np, child) {
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel(%u) node address\n", i);
+			goto free_child;
+		}
+
+		ch = &pc->ch[i];
+		ch->pc = pc;
+		ch->stream_id = i;
+
+		remote = of_graph_get_remote_node(child, 1, 0);
+		if (!remote) {
+			ret = -ENODEV;
+			DRM_DEV_ERROR(dev,
+			    "channel%u failed to get port1's remote node: %d\n",
+									i, ret);
+			goto free_child;
+		}
+
+		ch->next_bridge = of_drm_find_bridge(remote);
+		if (!ch->next_bridge) {
+			of_node_put(remote);
+			ret = -EPROBE_DEFER;
+			DRM_DEV_DEBUG_DRIVER(dev,
+				"channel%u failed to find next bridge: %d\n",
+									i, ret);
+			goto free_child;
+		}
+
+		of_node_put(remote);
+
+		ch->bridge.driver_private = ch;
+		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
+		ch->bridge.of_node = child;
+		ch->is_available = true;
+
+		drm_bridge_add(&ch->bridge);
+	}
+
+	return 0;
+
+free_child:
+	of_node_put(child);
+
+	if (i == 1 && pc->ch[0].next_bridge)
+		drm_bridge_remove(&pc->ch[0].bridge);
+
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	struct imx8qxp_pc_channel *ch;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		ch = &pc->ch[i];
+
+		if (!ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ch->bridge);
+		ch->is_available = false;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret)
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+								__func__,  ret);
+
+	/* Disable pixel combiner by full reset. */
+	imx8qxp_pc_write_clr(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	/* Ensure the reset takes effect. */
+	usleep_range(10, 20);
+
+	return ret;
+}
+
+static int __maybe_unused imx8qxp_pc_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_apb);
+	if (ret) {
+		DRM_DEV_ERROR(pc->dev, "%s: failed to enable apb clock: %d\n",
+								__func__, ret);
+		return ret;
+	}
+
+	/* out of reset */
+	imx8qxp_pc_write_set(pc, PC_SW_RESET_REG, PC_FULL_RESET_N);
+
+	clk_disable_unprepare(pc->clk_apb);
+
+	return ret;
+}
+
+static const struct dev_pm_ops imx8qxp_pc_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx8qxp_pc_runtime_suspend,
+			   imx8qxp_pc_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx8qxp_pc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-pixel-combiner", },
+	{ .compatible = "fsl,imx8qxp-pixel-combiner", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
+
+static struct platform_driver imx8qxp_pc_bridge_driver = {
+	.probe	= imx8qxp_pc_bridge_probe,
+	.remove = imx8qxp_pc_bridge_remove,
+	.driver	= {
+		.pm = &imx8qxp_pc_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx8qxp_pc_dt_ids,
+	},
+};
+module_platform_driver(imx8qxp_pc_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QM/QXP pixel combiner bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
