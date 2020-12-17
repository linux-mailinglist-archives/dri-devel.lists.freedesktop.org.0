Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC32DDFEE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DA76E060;
	Fri, 18 Dec 2020 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2469B6E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jED3eALCXXc+WBbalhfktJX0Nz2PwgMi6bzKf3GDPuytMboerx/9N1H9PxVE+B3xYmqtoB7tE2GrhHu68qDXGxW8qNmhA6D/UZqVu1kEAWGwRn7ZoB2VZp9gliYj075ZQtj9E0Vwk3YrVociktHuoO4PyWnaV1uFWu58AXYYIRU1iSH6bCrzgAP/09LXEIstnfjvDhbPUc/IvrrBINvMAr8JBiJrQkRIDAzdBAZJfkUJUrOUnSPuuooA5W42J2dokjWsmXBLGSGRFaw2UwrMDREs094OPu1sYvUcNUBVkTTqUYS2SiA+XNejPllva+ilyucoFtumR7jBFXSofapYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkut0l7W+1BuQ7/b8/6xBqFXtS3VpyacZrcsTppoRI8=;
 b=YfzRNj45Mz3OrnDf4NPryB2XENfxOI8UK4fseObc6YWE5fJdYoVxty0yA0fqoB6IrAVkm9gmIc2eoAiDRj32CIo4jRewZPYk74QpTXgCxRmsSsB2huh3nyB3shArIQOrRmFrpJor7omFng3DudJlkofhK8+Q1uP6Bzuj3iyXLSUU3+0vk9fUbAGJkB14yTWBp+MTaf8RWvyjgs/yHxtKzAhrRLe3xAVniUJac9ID1Xz8WGXQJ7kU15lbToDlB4OPaK0mltJn3RpPgMyq0eOBNfEK6uiHo18oWSYRM4lMCw9iTVC+B+q5IJP9fNkcLkkl6UV/GuTZJZmSQ1eTx0Wv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkut0l7W+1BuQ7/b8/6xBqFXtS3VpyacZrcsTppoRI8=;
 b=VhJxWJlkASfNaN+GKgv5XKG6w6LPDOqEo4xXwo3HkAa7woBnECMySsZ7AkWhRL8mMJXwwYTOm3K82vLXdIxqMWrjk3Q86Xk4yg6Lc1fhbjZYfsqW/5Jwq7q4U1YTk2SJnSkWfWNO8hcl797xRjkt7o4jrxpaWonlmmBOGH6UHQs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:03 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:03 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Thu, 17 Dec 2020 17:59:26 +0800
Message-Id: <1608199173-28760-8-git-send-email-victor.liu@nxp.com>
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
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48ccf070-72ab-46e3-20c7-08d8a273c7f6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7312CD61114DA8AD501D3DA598C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBITKwm6SfJppEn4H8lWZqPA5dmXbXxycMwgoRTv1fia5k7kCvQZu8E7xBkFtsz2FebLkN3fgCPwFojMNAl6zvLFF4ATgNiNEQx+Aldem6M0Vt9GFxQZLLLMeq0gKlIRqIRQZjr+ziTmne2T6NqL0qX6NUmahZ33x3Wya4BTrihCCzxKlblklNHr6+EDiHWswgst5St6LJ/evtMVj8Qy7+5bVPfYo432mNCFKNiuAZub5td9owJvUpXfvkX8Dz1uz9KC4x/a/Cbxn9Q666rChs5/FAg2Df1/eZfJcU5sGewgVqLbsLIFSpoxOj14JwIXnlM1arfgW8MQ1eXJUxN4TuOwsTFfxmgVOOSVb5SgCRr3Gny010l6V8byuH3206Db
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(30864003)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?keRLBhNySj1j3t2ZMAsOG0s9NA7d9dhVAbu93ZJwHH1qQtQ6eHqjT4BotAIl?=
 =?us-ascii?Q?a8QpgfdeU/zlUoW1z08rNN3LQwXpCdWEr03dSUOGkPBC+Ssgw4pNFBXM7cxb?=
 =?us-ascii?Q?LjOOQqodOm1TQBe9VJkSIi5spP3XxQW8WwFsmozEM+0VdZKimYfymVvp7fEd?=
 =?us-ascii?Q?+yNmFN7ZpVQA2lWsB8aG0FGuEBjT5OdhDDKnQOxIBdoyzdrkpbeTarjYfB2S?=
 =?us-ascii?Q?CPkGf1qNxEoV4I9TArSnRP/VnRhgUQXdwBnMcK+BkPy+ENrDh9GN5bZ22GaH?=
 =?us-ascii?Q?CC3L7rQUf7MDapvrovnPP7PTC8MWdDm0Tn/oxD1FGDbTEQq3V69ekcKJeirg?=
 =?us-ascii?Q?TKG7+lk4YAJAtDTTJH43uaTmZ5d0awiW4huem+gv8r/JjgzGaCEDevzYAvDh?=
 =?us-ascii?Q?PUvcQ0gA7ZtP4K+1uOXi3+UQ1WUnJdyZQdU8VJWUqGzH8OCPfR7b94dbxbzG?=
 =?us-ascii?Q?IqwZxihfJUIYxzdBqEUC54Lg7MWtZySPoDwasiwJ1XFexukb6GRVAYFAtitm?=
 =?us-ascii?Q?ZnUFeOtjvf6672uQpv2KPhE1dqwcT/sKW+JTF8842osPA/mn6OUtUZ1L8H12?=
 =?us-ascii?Q?A4E6E0C7hrmjx2aRAAfBzQxLWUisLJEL+2uAR9/50Q6AoUVxzJs/FGe14uSX?=
 =?us-ascii?Q?t8rqflgb/FeWdLo0zEwGZClwcX+p67yRSYQAeg7CgqTf0SJiGYganeuMpHXF?=
 =?us-ascii?Q?xTYCDgjTagA+ZrxUbuXZOQr3XSqPscKmaItayfteAUOikX/IKZ2XZ60Va+75?=
 =?us-ascii?Q?wQUp+i+t6t0VV5p4PhyJKFWq1t40lUkjFfvliF6JXclqiD+RGZqgTA8rDwII?=
 =?us-ascii?Q?s1JPB9WspinBC/94QRo1TWbxEDoP97yAAfiO6aje6D2Utfoyo35Kyo1WlrYB?=
 =?us-ascii?Q?rS7fJti9uE1fYFA6lWfoH+qBzvildYMn+2koQRcnN7tPmlvw3bHd+UGwEYn6?=
 =?us-ascii?Q?4I0gVMgV5fn6lmF1GE6ff4f+rBpWot845u7u7Xblnmw0R4McXWOoU5KCSFiI?=
 =?us-ascii?Q?aJ08?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:03.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ccf070-72ab-46e3-20c7-08d8a273c7f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+rD18cOoSBu/HoOfY6WYQHgSwKWZZOkvMnbPpp1dEOxGwviOVb4SjbR+WQqnicWD7T9JB+HByhYyV+rRxaHaA==
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

This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
The pixel link forms a standard asynchronous linkage between
pixel sources(display controller or camera module) and pixel
consumers(imaging or displays).  It consists of two distinct
functions, a pixel transfer function and a control interface.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
 drivers/gpu/drm/bridge/imx/Makefile             |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 411 ++++++++++++++++++++++++
 3 files changed, 420 insertions(+)
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
index 00000000..1af7467
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,411 @@
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
+#define DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(name)			\
+static void								\
+imx8qxp_pixel_link_enable_##name(struct imx8qxp_pixel_link *pl)		\
+{									\
+	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
+					  pl->name##_ctrl, true);	\
+	if (ret)							\
+		DRM_DEV_ERROR(pl->dev,					\
+			"failed to enable DC%d stream%d pixel link "	\
+			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
+}
+
+DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_en)
+DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_vld)
+DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(sync)
+
+#define DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(name)			\
+static int								\
+imx8qxp_pixel_link_disable_##name(struct imx8qxp_pixel_link *pl)	\
+{									\
+	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
+					  pl->name##_ctrl, false);	\
+	if (ret)							\
+		DRM_DEV_ERROR(pl->dev,					\
+			"failed to disable DC%d stream%d pixel link "	\
+			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
+									\
+	return ret;							\
+}
+
+DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_en)
+DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_vld)
+DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(sync)
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
+static struct drm_bridge *
+imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+{
+	struct device_node *np = pl->dev->of_node;
+	struct device_node *port, *ep, *remote;
+	struct of_endpoint endpoint;
+	struct drm_bridge *next_bridge[2], *err_bridge;
+	u32 port_id, vld_port_id;
+	int port_cnt = 0, ep_cnt = 0;
+	int bridge_sel = 0;	/* select the first next bridge by default */
+	int ret;
+
+	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
+		port = of_graph_get_port_by_id(np, port_id);
+		if (!port)
+			continue;
+
+		if (of_device_is_available(port)) {
+			port_cnt++;
+			vld_port_id = port_id;
+		}
+
+		of_node_put(port);
+	}
+
+	/* check the number of available output ports */
+	if (port_cnt == 0) {
+		DRM_DEV_ERROR(pl->dev, "no available output port\n");
+		return ERR_PTR(-ENODEV);
+	} else if (port_cnt > 1) {
+		DRM_DEV_ERROR(pl->dev, "invalid available output ports: %d\n",
+								port_cnt);
+		return ERR_PTR(-ENOTSUPP);
+	}
+
+	port = of_graph_get_port_by_id(np, vld_port_id);
+	if (!port) {
+		DRM_DEV_ERROR(pl->dev, "failed to get output port\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	for_each_available_child_of_node(port, ep) {
+		/* 2 available endpoints at most */
+		if (++ep_cnt > 2) {
+			DRM_DEV_ERROR(pl->dev,
+				      "invalid available endpoints: %d\n",
+									ep_cnt);
+			err_bridge = ERR_PTR(-ENOTSUPP);
+			of_node_put(ep);
+			goto err;
+		}
+
+		ret = of_graph_parse_endpoint(ep, &endpoint);
+		if (ret) {
+			DRM_DEV_ERROR(pl->dev, "failed to parse endpoint: %d\n",
+									ret);
+			err_bridge = ERR_PTR(ret);
+			of_node_put(ep);
+			goto err;
+		}
+
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote || !of_device_is_available(remote)) {
+			DRM_DEV_ERROR(pl->dev,
+				      "endpoint%u has no available remote\n",
+								endpoint.id);
+			of_node_put(remote);
+			of_node_put(ep);
+			err_bridge = ERR_PTR(-ENODEV);
+			goto err;
+		} else if (!of_device_is_available(remote->parent)) {
+			DRM_DEV_ERROR(pl->dev,
+				"endpoint%u remote parent is not available\n",
+								endpoint.id);
+			of_node_put(remote);
+			of_node_put(ep);
+			err_bridge = ERR_PTR(-ENODEV);
+			goto err;
+		}
+
+		next_bridge[ep_cnt - 1] = of_drm_find_bridge(remote);
+		if (!next_bridge[ep_cnt - 1]) {
+			of_node_put(remote);
+			of_node_put(ep);
+			err_bridge = ERR_PTR(-EPROBE_DEFER);
+			goto err;
+		}
+
+		/* specially select the next bridge with companion PXL2DPI */
+		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
+			bridge_sel = ep_cnt - 1;
+
+		of_node_put(remote);
+	}
+
+	pl->mst_addr = vld_port_id - 1;
+
+	of_node_put(port);
+
+	return next_bridge[bridge_sel];
+err:
+	of_node_put(port);
+
+	return err_bridge;
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
+	ret  = imx8qxp_pixel_link_disable_mst_en(pl);
+	ret |= imx8qxp_pixel_link_disable_mst_vld(pl);
+	ret |= imx8qxp_pixel_link_disable_sync(pl);
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
