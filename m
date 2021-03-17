Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D033E7F2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7586E4AD;
	Wed, 17 Mar 2021 03:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E36E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GP/DoIr21vXq1SY2YG2g66D2fCNy6dCY4DaBjpsih3gObn9qA7C2n94j4hOEbJ0NCtl90YlK4nsa6Wmty5/ply+DQQxabAdnsNugMgmsfFx4Z9GtPVTf66JItfwegJwwuKWz7eGl6B0MwjoP5Wt+qvbxBP2+OhlYpk+QNu59IOwHsBfCIPs/WKJpWHi//FQNoRZx5vQUEsOkp0U+KWjRWVMgoSlXZtOnexy/YQUIaM9ImdmCjVHFThZqrOMQgDFL1uQCVU+N8gDUQZ8OFWRkcD7oESJts5Q6AGqxVIAJfZPC0pHulroNgSYd7xg4XEi5HFJSldkRNjUmohMXFUy+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlXS4ZiONPzvzZBinMQMA16k22Agif0nN6/RQYhQ2iI=;
 b=G0DqkESqQa49VgK8/06DUtRrE4pJDoTvL4nrzNdr3o9KJoKBlozDUFhP1fpIQIRFTASPVcqyPJB131s/RgtyuYKVe97EylJz3KzBjSncDGZLFnRjI/i5XV061IFlAWpehHmGFlit/ozxPNi7sJTxfBn2h3vLhody8A5/8z9GJbbrjZ0O5ddiiAdOjDHdiWDDFfPEDFQrY02C3oygdBiwRFp9z3RHHNUgQ44dyD816ox92JpPHMZbLswFdPEn368TfBrUGEUW6n+qDsy0t9ZZwrTpw6JVrsdWoRETgvz17QfWiNuHn8ldcFmSsZFbNXojQjg8ljfiuf+VNv40RNPsXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlXS4ZiONPzvzZBinMQMA16k22Agif0nN6/RQYhQ2iI=;
 b=jiHke6LJU7yCueBmTK1jDbzWHfqK1ipqHnP9gIaYFUIWoxma7v9WNiT2CzwXmih6bwk6ltyzQMYNEndL3UXKKPDTzKeDTeAy8ihAV3KSh23hgExgzb7mQAS64TIYmlymhPDtVotkzndRdCuDofhUWLBIt7z5Ut0ul3AP6Xl8UE8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:56:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 04/14] drm/bridge: imx: Add i.MX8qm/qxp pixel combiner
 support
Date: Wed, 17 Mar 2021 11:42:39 +0800
Message-Id: <1615952569-4711-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf4a1f37-6c2d-40f5-74f5-08d8e8f8ac99
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141CD6FF49CEF9A4799BB7F986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ff3YBPOBMnWuFA/LmasrlibwEMcG6xieEMqOhZOQV8qIgsuOTUYCRAK0o+2Mk7NKShabWeTHODEKgQv9hUxKUNHPFKo3jHX3CNUUDck5IQWzrXOAieuyVr7+bx1Y5PSPMxzj65sU+cIDSDp+em2rDwx0VPS/W4FSI8xVosAkEuSrGPThY8z2xRpB/jCeACo50Rxzz24PHQfQsn3/L7VuqE9NP3t0TJwJE/vFE5R8Q0MYvJGoJvWwx/+EjzrusxKGrdvu9fKYSNGy4BDT8g6NWrnHBtDlGGSE1irL7qYpo2CjEa7IcFZpDPGwk6QvcFo0Y7LNdsxlAKuK9Bk9EnjubCeJ19AL8Vi6/JIsS/GTPtP2OuPdO71aCukehTan2E39P8oRXo+WKCo7RMpY+tlpEd6j8+v5qWUaugXaJtomZCPgPxI+ecmKwwmcBqlWleFfS8DoOXmvWryCnGGQFTWH5s5ArOZ9WhEowRLyudamaaZTTvShSWEG85dKMmM4xkVT4Hvpq4tq1yGQeIpbQZqqXF82iOo47BvXt6nY1qzAWfK1B40Zdbo1uRyixMVCUsyatdgzJA62rf6IcdxI9oKAa8shIhsV1zs+gWeESS74pIdLIIgl7cIMKbd6W20v52ID
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(83380400001)(4326008)(956004)(2616005)(2906002)(30864003)(52116002)(6486002)(6512007)(478600001)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HvLkHwchv8mrZSPYxaF1xy4EDOddzIvMh8b7WipXScn4s78Ciq0N3/J4MPQc?=
 =?us-ascii?Q?6xgXy/dq6/WA31LrlaPUfeb9wB+40YWl1rJWwpULs7Krg6HrRsg5/VoHoD0W?=
 =?us-ascii?Q?AGg+g4D4+ZGWeO4keHjvVLwn94+HDoqbCDqBvhx9iIiJH+d0IPYe77RDKsmP?=
 =?us-ascii?Q?jch+Rwj+iBKLmPeaDz/yNKzyyUH/sGjpUQ6uFcDDOC0rCctTecKtGjwV0Xto?=
 =?us-ascii?Q?8wH6AET1D1FMUhXiJ9NSwyvfIPmT4tXynrUGWL2zQU9bFDCmTVvQwkKFLQJP?=
 =?us-ascii?Q?GV/RTackNmOsIvKmONLOg2+0WHCPc3WyLBtNmAB6Tc0hfF+Std7suoaw7OwB?=
 =?us-ascii?Q?Wh1E+3+V6QMWiVcoSmQxcmYX9Cg3pcFzs3iEUmr1tm/iT5rIOWeg9d75idtn?=
 =?us-ascii?Q?CbRM1mzZT+vy6tz8KnNkbNgXvNzx+KGEgnZLAuBxPLSdubNhhOSMH7z5aomM?=
 =?us-ascii?Q?npYmsmfNfB35XvYJiOUkkLJGiHgowI0FxMwYWMtbwmyNuH+7f2CzVLa6UNU4?=
 =?us-ascii?Q?xs1gd13TRKtExd4YoI1xpHMnBQ9lpBqvWy9bwHOin5tDcC+cJEwEZj1663Jw?=
 =?us-ascii?Q?cleK0sWkR0OoBvRUMbW2s/YTIfgmWWUNOQylzyM9gg7r+QThibz5ydt+5kC9?=
 =?us-ascii?Q?xNTiBgVuSnRv5JxEKLEM9uUe/Emm5BSKzohMXKLA5ydraU3QhVfs8Ptch22h?=
 =?us-ascii?Q?u5UEzgNlacxoXRK/xd9N/ajKfnVH5DnT7D6fc1G/aCKn0f9wfFq4m/OM+gR1?=
 =?us-ascii?Q?Xte4hgW0079IWIXk6PmgMNZScgnvNHTcNsVQYReR0WdQ/Rl3V4PKpYo849Ts?=
 =?us-ascii?Q?FIw8U6TyWXokq1J06nalppt7WxzUmaFB9QE8dH7txciV/sC3ZM9lF0Pb3d2w?=
 =?us-ascii?Q?gqry8rJa5COZH8pcHf2HkTW2bmkakgP3ZvuiZ7OKufrqUoAdAuAhhgjKA1TX?=
 =?us-ascii?Q?oOjsifxjsP5huotOofqcOn5K912qAvo77SlqLaDPY6UQg0scRsEvUul83Cgq?=
 =?us-ascii?Q?q/KHOskU0rjDefkXJ5vb96qFGHqu9L+kQZXVOBE0hnJcj5e5Co/odCDE3B3Y?=
 =?us-ascii?Q?avbX+y7jVO2KZuyNbBf2apxgeDYNX4BNscBU4MvtUUnaSUx1eFRsVr21rZvm?=
 =?us-ascii?Q?WieHl0ctWyEuHIg2LI6D1AJyQ6EhZVg78kGpKDyZI/WS9N/MqMDWZ4GBIx38?=
 =?us-ascii?Q?38H4wlebFLvG0YhItLahJ7Z5o3nIlmYsl+TCvj9xr0llEijC30MpOl0vfKsG?=
 =?us-ascii?Q?ouOrxbXqC5vp6YkG0Hnh8ZTVzqKvtzP4l8S+ApiivTF2Gt/PD4YTtk0LyqWz?=
 =?us-ascii?Q?FyMuIXgZZxsOGoT9NA1XCs6D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4a1f37-6c2d-40f5-74f5-08d8e8f8ac99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:42.0715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIaDd0B3m86NL+5OoZ1AARVyxhaV1iEyd6l7QXHDeLBLbMictDlNcr3kl3Z4DsurGZrb2cFUnmpNqVlZOChnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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

This patch adds a drm bridge driver for i.MX8qm/qxp pixel combiner.
The pixel combiner takes two output streams from a single display
controller and manipulates the two streams to support a number
of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured
as either one screen, two screens, or virtual screens.  The pixel
combiner is also responsible for generating some of the control signals
for the pixel link output channel.  For now, the driver only supports
the bypass mode.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* Drop the 'PC_BUF_PARA_REG' register definition. (Robert)
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |   8 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 448 +++++++++++++++++++++
 5 files changed, 460 insertions(+)
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
index 00000000..0b9403a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -0,0 +1,448 @@
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
