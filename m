Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE72DDFD0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AEF89CC9;
	Fri, 18 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF96E233
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAb7Lr3E/SL3S53tGCI/lk7UY3TgeQ89Lph+BBd3X5l1jNdBHtaqLSdkQ2nr20coMNlosHNHiEttwl23OfZ/LLOSOBYl/Az+zW4tHFLjpg57KSaQzj0c3xIM7/Mub2ah9Zta5QKttPgipXgna1ej1aXT+uFJTkR38ykIYaehBbNdKM5OshVArVzAnjU7k1dzCZhQWzZRg9eAxmJI53lH/HbDKJUGJrfmwIGRCiuYimv3+vcWIU/Xl+asopaFemnSVgQ5HxEtM8DaDID6BJwAY5Tff+Pg6QMGnkF8bquVBIT+md2XxHNT0mVaRi6SheUz4VY0WyaPILlCbXcj8DpsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnU4eczV0CARgAm6tRWmcWg42EJywfOIhaJ6cSB8G98=;
 b=inSO6G2ATJuvBfO0a70tmvVTLWTOeyk88p+flbYgd3JU2hQzpZ3eOkrkQbJV0JIS3pto5TAkoizytIl4d39ZmB/9P5ycmcDcN+mg+JOe5CCeHYheRBfR+25LqY4aGR222FXgcB9jGgOVjcpof8IFQF0QSc6vovFLwSOzKk1E7JNIu9h3C57EE5WuZ7Bd+41d0PIGi9/fWwpqhfMa3KFKoFV7LGCuiucA45eo6h0N9SX6F+dKn3z+wa6PxHAhSudAo9CN+9WL+uR4oDxnvidMDXPkexqxHe68JrIXiIr/AyaPLsRNEEpFZ89xhUK/ABKIUYqGlYT1s2dAZyL8wkKlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnU4eczV0CARgAm6tRWmcWg42EJywfOIhaJ6cSB8G98=;
 b=nz6/v2dedqY1EoyoL/25ZZ3FRSFrcbbub/AtzQiCByyaKOWOqsSapML83mBgNz2gjgn6CrrwhFVpLm68Gqi8bjlWIhh2QuJN48B7/ma/sMI4etyCLPOOTN/teqKpTx/mRld1vS45MzwZRWdaq5ELQKBO8v++WdlD6TM/JDbB2R8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:50 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 05/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
Date: Thu, 17 Dec 2020 17:59:24 +0800
Message-Id: <1608199173-28760-6-git-send-email-victor.liu@nxp.com>
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
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2139d469-e97e-4aab-e325-08d8a273c09c
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73123D5076509458BC56CE2C98C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOPcX9JZqeCUt5a9redxCe/wATK/gNIEj/FYWBxLjCov8DfRt+ZDa9q51ldzgXbUaDgzoiEESl4NrL4mKvZSOAX2JXB6oxKYdnCoVMWkKK9BRTbuCODrccJJMo5Y2J1+VXNo/5qEMK9hNb/qFUO/uT1kpTMJDnF831JCVqxr6zBGzm6NDvZt/wy3tZ3pKf+eFerJ/KWvWsKBNVZt4O/L05OAi1uTjkLhVyFWyQz2v4ZwIW00DyymHfqWczTwPYHpq/KQ2sMt7CTmK8BUH8zxz0JqgHfGbS4wc3tVcNzzThJD1WJJoxR/DV1cnQKJNa7qsPapv0D9csOkEpjgbR2hoatKFmnYEkv6Kl7CEwvDLU3YoWUrjQpKa5ZLoq0WcswY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(30864003)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QHLJU4SBtAOh6hHngGdm3IYDg9+epdwORbqKCdGUyJwTlsR9H8Yb2IkXDPm/?=
 =?us-ascii?Q?rga5AFurFJGdWUCEnesvUz1okG2VPmtgXcfP9hEK2ROxe4eY7TNzzea4l0OL?=
 =?us-ascii?Q?scXtlskTtyiWhe8tVmTG1u1lmnmDQVqY4w8WIlPi1yHSwx5lEZ60Hs3laC8y?=
 =?us-ascii?Q?6A5rDt8JebKaqHiUV4DHrbX2+S+UgDXwapzkoulL6rNBJyQfiVzKiFziFMjn?=
 =?us-ascii?Q?ytPkwLkfh0vtTU5wpP5z4pESw4+L3QCDS2yQQzeUzSG5TzE1nQPrKq40pm6N?=
 =?us-ascii?Q?8so8UwT8C6LS/DdzLw/7IaDH3pr/kdWnrJrKmHdwnsJTlyX2APGaAN7ZekOu?=
 =?us-ascii?Q?qSFuqct//AKCyFxUZb5S6ePcZ6Kv5qHVQwKz3iS5FHLZCVwlcU4Uttg4+Oxa?=
 =?us-ascii?Q?ZDETTtgouSna+dEPWEkTuCnCy6pNdoWrKPZ86O+9+knVCx0c0dnrpC4Z4qcY?=
 =?us-ascii?Q?tKOa8SzBVpm7ySMKPkn0dIXUIp1CI9nLJevjiqtZdfZ4+spZgKz9Bq3Ej9u8?=
 =?us-ascii?Q?OzMRZRgn7274URJNUoCh6+7SxdlS0R6zd3j/ed0uZoyt8d9O/Z4h9scTgO6T?=
 =?us-ascii?Q?Yu3SIBjFot7aoJH4NdGUWkwi7eWDvNsRNtNnehBI/CvEYdTnnSItruvHYeAM?=
 =?us-ascii?Q?kvwmJlpEHnq76VJEzYfPSI+rLWX4vHtDzBDZ53aL5iNCqB8sAChr0fw4Vk5x?=
 =?us-ascii?Q?0oeeROAVrZH0lQXzAgznsjtHQHUswzsT9OFbnosSz+MXtjwZ+jdlYwgvFfBl?=
 =?us-ascii?Q?onVJVsE+IHWGXV2f3DDdjdyAJW0Fw2wA1jk5kGAZV1JkrRdI4N9FqtU/uuge?=
 =?us-ascii?Q?IDZaqRWykvYRTjPYxsUGWDT93Ziip8ojDbITlN4bwt04Nu3ht4grKxO6Sx7l?=
 =?us-ascii?Q?ko73X0r6pVglYtG3MLzmLqde56JIz6UdWHb5Fx0H4C4M4pmySWsjSL/LwaKU?=
 =?us-ascii?Q?YPjH/klL+0rDx6RHuVpqj0Rj5mf31HQez3mqfECHA9DSsgF2DVSIfoPk0uFm?=
 =?us-ascii?Q?xz33?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:50.8381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 2139d469-e97e-4aab-e325-08d8a273c09c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+aSTn9EG28WopwY5reEfES24Fz6NHBia6bloIdpjXPKPuiZpSVcVJowFNQjkOrAdgQtwRzngqoU/CFpj58C6g==
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
