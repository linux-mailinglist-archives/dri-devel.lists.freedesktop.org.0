Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10531E4A3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064F36E81F;
	Thu, 18 Feb 2021 03:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B986E81F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI0ZIzTT5J0GLJ/4K9lxX4ihmo5+kHV0g3RXZActihYtGobCuDSnpuVbOPC2crIDQyhGtEJMqwCreGkkXK5fSHIWD+4pL+Uxvv1lnFXPdBnCHYxbBrMAV/07xQ84S8moJDoKl0Zxa7w4boYxyH9KU1o88bZVrPqSboVPSL4I49dNBFWzEGfMuK5vXqgKrExyE+kiK/oTp9yMXDBhf6/nyNIPoc+w9OalWjxRQpr1z+h/LJmN48+ZMaBtWk5nimI/vPuUn/ntDoMy2QL2OSHfMH7atw9fzylrrT/Km3lfCOUYGOLRaR6tR9WyaMCa264QiT071vDFLZj2svcTBqRYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jdvufd/eLLpFBOk0k3+BYP7Q/YB9A2NgOauYmyJAyPM=;
 b=QMlYqtpbp8LyP3oetVnUgG+4eJ4Pc8Y2BXM8ORe4LuMD6DFUpQp9ljqtuOwSdFVC+LLa5eErhl881+7FrdThfLG0SvfiQIkk5xnvhKQdqOddC4YNs72XoQwkbpawW44KJms8sSB38xC0B2QpoTCIU/l2+AnozyR54TJyFu8pRW/Hx6xU4q94xVHRuJaAH5VhHGLYbRywdu3NX1JgT2LnzxkT4qbRqfORue6X6RPyFGRPlBQmUxfalWdFlwAW8i0ByeU23lEmjx3xpkpXR2Zkv3TZZNuUoCZDDapspxqFtn0UGg48Oo20zmzhPEPrED2PT8xjeXUmXsMUp6TToPQnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jdvufd/eLLpFBOk0k3+BYP7Q/YB9A2NgOauYmyJAyPM=;
 b=MFthZb5w3LSXNfux/qlNeUpYzngAjsUohjCvmjmbtUqmoXnMvyF7zzdiTeKKFHwTE3l4R9G5utTBIZYf959vJzU1oaUPS4JwZCUsZvrpGAGEUt6xCXc5R2sSPsoo1itA7cFSnDsxUnXNFUTEeja2NElxG0uu5tJ/xCKKOilH5os=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Thu, 18 Feb 2021 11:41:48 +0800
Message-Id: <1613619715-28785-8-git-send-email-victor.liu@nxp.com>
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
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e53b3ab-265e-4b51-c4ec-08d8d3c0eff3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421F0C5893E7B9F75AB966998859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuxrrZofZ/W8vZ/zuxHFW+ThyuKSS24W63a8theRU2EvIXrVoaes2i8WRT3KbaT92IAI4Fqf7if4coAwY722lCQEVoynq1pulMaUFKYaGgo5LC6sARdTl1WpVISEZuzGmdShBe5MWDVonwvomDM5CvbBd3DGpRNih+ESZL6b5sr0yax22vYliA3w0X0Ng9EizFMqQ/YuAOGSqKa09xqoygQ+w9LF3xpb0LZK8h1buX8acaHU7PJdWzwcphI0f0DjfMqN9VSagzqTDU/yux9IK13W0l1yOSADArIXtlLvrBL67yTGxouresSIexV9jsBxvnaXWyv2eYadTegJcFBIQHJPqyHyaC8HsYxqDn87ZLC3QF4slTruW7sWzDBHaBgJDo/52z3LJgeV2NhUq2tMc9u2fNRZUk+6bRyLEC/wHNPiDxz2AOz2hvqMPtpZLI0X0oemks6s1ltGXhPSubtBFMvVAUOMh7NwVQbV41RjzSGpvbMRq1ei8RvJc7HHq+zatwlbPLc+3HUOOfmMpOK2zDk5hGjrCYEA99wLZmwpd9jkJrmx991U8pL25VKcEeegszX7AvGFYf7crT5yw2R3NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52116002)(478600001)(86362001)(5660300002)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(4326008)(30864003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yDg5iRRM5pRJqIEDYnGlI6hZe9NluWeXwSuAejw3cSdsa9Xg9RebFyV+MsUW?=
 =?us-ascii?Q?w7zQLZqXJljJXoI/EFqHuzx/0sZFXRbGY5Ag+aX42H5ZVzNWW1Y9QGwpJIff?=
 =?us-ascii?Q?WtsuWNtwcWZRqjGKSYWyOpCTouk9iTj7hEed+l9nQGuX+9+l3o7EC4G5F7c/?=
 =?us-ascii?Q?D/Q5jPArpfF/XkZ+3tOQRBQM75xwCwLj1m8w6diBTau6viFl99uVME/NZzZX?=
 =?us-ascii?Q?btaGC0ygEb+1Dyjk4rZH+KTMqFbw6Wdbzvf7Ltdx1pY6jOwc2YNcQsVyx/LP?=
 =?us-ascii?Q?vrbaI0CySe57wSKbYAo69AcgUrap2ZsTboB6IczmedjaZl9ZY7ANvF3hYEAW?=
 =?us-ascii?Q?Ivfyn8LbV9a+Qp9DiOrU0CjZ8ecjH4lpp2JRD9d7uaEGj+zZrNWqur3I9FYW?=
 =?us-ascii?Q?YeRoX4+EtLiE4wF3vySSK2XM60OUoEoQvR/Ii777yt9WjKqij6YIXWKzftpa?=
 =?us-ascii?Q?ba6dsIpn1fFWwzv05yluPgU5xe2zpM3ZjOfPohK8/f48VD5uaGa13r6zp7D3?=
 =?us-ascii?Q?EJdQwIIlX6GWDqC/T0jgH7tLuZQpRCFQxC/2Jtu5zXV0AXOrUmdE5uA4Ep/c?=
 =?us-ascii?Q?AJTw7nj2kjBxV3TOMIzZ7bkD6XL5MJqN8HZlKHwNVuIVC2eJYWIXBrBVopDg?=
 =?us-ascii?Q?bjdPflk24wdslP8PF6yhftTnvK+lJBhZq2tCGkEU9FOeusf6IkLLWZtysJ3N?=
 =?us-ascii?Q?M5ao8G6G7D/Yq5FoYD85CvL2rY0YaUr4v0OMjUfJewdp0CAwUaTz6mk/ZTnh?=
 =?us-ascii?Q?n05NpvADPvYrFkZwy0p+5cl7ihUoMhSlkLxvXP/2JeRpuuZGBQ5BRtsJyiPV?=
 =?us-ascii?Q?gXsUgVu/4F6zWoQPjZyLQSrrBt+Tvsb/psFgtPfupC9aVquda4crMNTl6aNS?=
 =?us-ascii?Q?HR2V1qdaAfuPcNxM9OXX2kTw6cSpYIusnlcKAyICnQsWj/kMEztOyQQSRFT7?=
 =?us-ascii?Q?3NlJmr2maCKzhtGbfOCF3PD0EAKtjrtG6offrv7U8tpZIwZC93B6IDdg2f8w?=
 =?us-ascii?Q?oKIkoT//45mg50sz7ZN8oXgVT/aLIslAvc0Qyp6EA9IgCmWSnlC/IBatlEYf?=
 =?us-ascii?Q?F3eAPbrTnscWAsi/Ym4eDsCTMZgatnZzQIBSQNJlScfO5slWjZvLPUOeoo8x?=
 =?us-ascii?Q?RSkSjnS648Fxq9mjUKM0CfA+JmMc0chMVEXorVzJV3eFENrr4+5X2xxBK9FZ?=
 =?us-ascii?Q?Xa4RgYR3Z8OKBYicmhRiyiN0pdglmCm2wo+Tal7a0/ViEAVfLPRIF05fT0zB?=
 =?us-ascii?Q?wezQt+adudlwFbaeRHpHTeNJz69kfBO4/hjYgyRqIRiqmtECWgQDypGvHGsq?=
 =?us-ascii?Q?oA12KVQylZUWoF8tLdAeFhkE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e53b3ab-265e-4b51-c4ec-08d8d3c0eff3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:48.9245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEtaIDqp6NuOkqCAAMnoSy0udoxUynaPFSTVJaRXc6bnTb39yjQ9svLiHesBPAczjvEY6bWYUdrstHiWxAzRrQ==
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

This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
The pixel link forms a standard asynchronous linkage between
pixel sources(display controller or camera module) and pixel
consumers(imaging or displays).  It consists of two distinct
functions, a pixel transfer function and a control interface.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* Drop two macros which help define functions and define them directly.
* Properly disable all pixel link controls to POR value by calling
  imx8qxp_pixel_link_disable_all_controls() from
  imx8qxp_pixel_link_bridge_probe().

v1->v2:
* Rewrite the function to find the next bridge by properly using OF APIs
  and dropping unnecessary DT validation. (Rob)

 drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
 drivers/gpu/drm/bridge/imx/Makefile             |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 426 ++++++++++++++++++++++++
 3 files changed, 435 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index f1c91b6..4d1f027 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
 	help
 	  Choose this to enable pixel combiner found in
 	  Freescale i.MX8qm/qxp processors.
+
+config DRM_IMX8QXP_PIXEL_LINK
+	tristate "Freescale i.MX8QM/QXP display pixel link"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable display pixel link found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 7d7c8d6..c15469f 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
new file mode 100644
index 00000000..2e5ba4a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#define DRIVER_NAME		"imx8qxp-display-pixel-link"
+#define PL_MAX_MST_ADDR		3
+#define PL_MAX_NEXT_BRIDGES	2
+
+struct imx8qxp_pixel_link {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct imx_sc_ipc *ipc_handle;
+	int id;
+	int stream_id;
+	int dc_id;
+	u32 sink_rsc;
+	u32 mst_addr;
+	u8 mst_addr_ctrl;
+	u8 mst_en_ctrl;
+	u8 mst_vld_ctrl;
+	u8 sync_ctrl;
+};
+
+static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to enable DC%d stream%d pixel link mst_en: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to enable DC%d stream%d pixel link mst_vld: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to enable DC%d stream%d pixel link sync: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to disable DC%d stream%d pixel link mst_en: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to disable DC%d stream%d pixel link mst_vld: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to disable DC%d stream%d pixel link sync: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle,
+				      pl->sink_rsc, pl->mst_addr_ctrl,
+				      pl->mst_addr);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		    "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
+		    pl->dc_id, pl->stream_id, pl->mst_addr, ret);
+}
+
+static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
+					    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pl->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 pl->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_set_mst_addr(pl);
+}
+
+static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
+			      struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_enable_mst_en(pl);
+	imx8qxp_pixel_link_enable_mst_vld(pl);
+	imx8qxp_pixel_link_enable_sync(pl);
+}
+
+static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_disable_mst_en(pl);
+	imx8qxp_pixel_link_disable_mst_vld(pl);
+	imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
+		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = output_fmt;
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
+	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
+			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx8qxp_pixel_link_bridge_attach,
+	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
+	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
+	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_en(pl);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_vld(pl);
+	if (ret)
+		return ret;
+
+	return imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static struct drm_bridge *
+imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+{
+	struct device_node *np = pl->dev->of_node;
+	struct device_node *port, *remote;
+	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	u32 port_id;
+	bool found_port = false;
+	int reg, ep_cnt = 0;
+	int bridge_sel = 0;	/* select the first next bridge by default */
+
+	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
+		port = of_graph_get_port_by_id(np, port_id);
+		if (!port)
+			continue;
+
+		if (of_device_is_available(port)) {
+			found_port = true;
+			of_node_put(port);
+			break;
+		}
+
+		of_node_put(port);
+	}
+
+	if (!found_port) {
+		DRM_DEV_ERROR(pl->dev, "no available output port\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
+		remote = of_graph_get_remote_node(np, port_id, reg);
+		if (!remote)
+			continue;
+
+		if (!of_device_is_available(remote->parent)) {
+			DRM_DEV_DEBUG(pl->dev,
+			   "port%u endpoint%u remote parent is not available\n",
+								port_id, reg);
+			of_node_put(remote);
+			continue;
+		}
+
+		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
+		if (!next_bridge[ep_cnt]) {
+			of_node_put(remote);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		/* specially select the next bridge with companion PXL2DPI */
+		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
+			bridge_sel = ep_cnt;
+
+		ep_cnt++;
+
+		of_node_put(remote);
+	}
+
+	pl->mst_addr = port_id - 1;
+
+	return next_bridge[bridge_sel];
+}
+
+static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
+	if (!pl)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&pl->ipc_handle);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+									ret);
+		return ret;
+	}
+
+	pl->id = of_alias_get_id(np, "dc_pl");
+	if (pl->id < 0) {
+		DRM_DEV_ERROR(dev,
+			      "failed to get pixel link node alias id: %d\n",
+								pl->id);
+		return pl->id;
+	}
+
+	pl->dev = dev;
+
+	pl->dc_id = pl->id / 2;
+	pl->stream_id = pl->id % 2;
+
+	pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
+
+	if (pl->stream_id == 0) {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
+	} else {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
+	}
+
+	/* disable all controls to POR default */
+	ret = imx8qxp_pixel_link_disable_all_controls(pl);
+	if (ret)
+		return ret;
+
+	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (IS_ERR(pl->next_bridge)) {
+		ret = PTR_ERR(pl->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+									ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pl);
+
+	pl->bridge.driver_private = pl;
+	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
+	pl->bridge.of_node = np;
+
+	drm_bridge_add(&pl->bridge);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pl->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-dc-pixel-link", },
+	{ .compatible = "fsl,imx8qxp-dc-pixel-link", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
+
+static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
+	.probe	= imx8qxp_pixel_link_bridge_probe,
+	.remove = imx8qxp_pixel_link_bridge_remove,
+	.driver	= {
+		.of_match_table = imx8qxp_pixel_link_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx8qxp_pixel_link_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
