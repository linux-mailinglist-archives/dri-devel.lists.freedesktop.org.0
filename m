Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AA2F74A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757A889B01;
	Fri, 15 Jan 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1DB89872
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRYPRdr0OWKYHrl1hyUczronzjP2PXLeuleuVqWHaDD+Bl5jqNAr96JfAspkMDksPIeuvKqln2WfTZVQS/k9Du0/pGKtsrVqVVoSNSOMor8nETMp1/or8Fw7Nk9lEir0HhZB197PEfblmdNmUOz679IoZ3dez39GHCu58Z1f8VZUF4i54vdmdIeqIvquKDAhDUPRrBf7yhnIuOhvGaGpw36bVEMp357Qx7GdK3/bjB6FZ5SrRRpXWVwuuRAWobDudIiuV4TUX4lQA4o47vCDmPlh9f42elzgazlhorfaoh4EpDPz7L8RonDIf3HMf8c2uGNPKLAxasbFKcKv4Sb1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIhRnbdVb1vezdTRTeGRniv/e3WdQeL/IIuytbJlZjc=;
 b=AymDtWxS/fyguz6NH+hiDB9mRbwEZRZ+h0KHktd1gOv+pm7UN0mitc2Xo4ur0vxxlqAH5amDnhWs3UVlZQRgoteydOcOT5hnh9dFvmetBDLnrgzalaNWCyGhbEcYn4zjYdCpLtIFbnyO93LUE1eVRaOG8ypfAkFtZ9ggREQkT99Dbzc1scE3AEipPMYYK+Vvq7FSqOQnIDtdBlKdM0/yf/AZjcVE0aO0gsA2zZAm69WjmJPYUszg5MQn+x155HhkoUrvRZSgzcw6X7Xb2EhBmmvZnRHodayICmW8Isgw5DM51zON09K0xJoCPVtt6LPPyDswZRLupb1zxZLgeuRDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIhRnbdVb1vezdTRTeGRniv/e3WdQeL/IIuytbJlZjc=;
 b=idL5O9tEPceYJTZ6KbY3cb0baNiCOo4a1eRIzngQ1wSPPskSYvIBH0z29znGmPxRHadrW7POlKvysvP4wjRAF3HtavpG7zSgGRJ3u3OZnPAEZRCyXHk/vjeyUM5XT4CcTIiqrwGzPBcUL2LKHUGMW3wKSE1KEcZy865A23IDf3s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:12 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Thu, 14 Jan 2021 17:22:05 +0800
Message-Id: <1610616132-8220-8-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d192f483-9622-4033-da27-08d8b86f68d5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5710B8759680CF6EC9050D8698A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7U63C2oR21CyfJTMWBpZBTNWL0kOpBfHLL2wg0dCjQQR4qmy/oRoRecTAaDJxZCm6txd53K+ILpoerTTBnOZ9kzIwEvsLW2QX8T4FDyq0ulc7zOVs4IbPI73Tl7lYfwUshv5VZLI80Uc0okjDluBeXK8nZev9y6PiIl69ZspCj6HEIODXL6DKc4KgYge6Ze9XPrgBLBUXH7GJC+Mq5ebOjrkB7FkOyhSTMpvhVOKjX8hkyJSm1COxIcDXriEBggQR51oilXFlwXriyMp3oxSWENEAYYGsD131C0OP2iltDaRPO2oJNAzzjvFBsvcA3JqU7AtK0yyxUQo65ONOeEE/BKvpO3na7wKlNBt4PNE7xoCKk1xRXAAgG4WIxcgbMVHzI1AkmVqqfjiuKVdhNeZ6m3RM0GbN6zl7pYy7LaQ9DEPBbr8b0Wt2R67q/JHAGxGBHPD19H64Fom7eGKgPhmhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(30864003)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(2616005)(7416002)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pIDgOY5HF5yHbblySQre0NQi+HJ7eLxX8DzL1N5Y+D7yXAfsyqY//XZIcKDL?=
 =?us-ascii?Q?+Ht/sXigSautgKRCSjSQHskgt00dxB9LnGdF+vvzlJBL+ZL9kUhXQUNvziaQ?=
 =?us-ascii?Q?9hrzhe0zCFL0oo0UyiNLOrk3zK8HoCWOiPs9D00rdAMhanB80zkvkxPszl3C?=
 =?us-ascii?Q?MPBHxBUM3/EWanzCxM5eYZyazIOjFRcNM3uRmeahNfiXgvcpQDIoT4JQFRER?=
 =?us-ascii?Q?4wDe1LFOigkz7ItBnVcvM0bBFk2KV4brlby0Pws/XvGVcTjBDD+IkQrtTmfL?=
 =?us-ascii?Q?KPXAxgK9w47rN8MDeRIyK9H7WTSP3oZxdgeeM9fTB/zOfjTZhfdqt/9VYgpv?=
 =?us-ascii?Q?rjUcmiDCb/osvCY+BzIy0Dd5oQnLIhGTGkWXwB1unVJH2rlc0C/YcLkNmCMZ?=
 =?us-ascii?Q?PtPfc1pWkMEw6rmNn7vtyfZ75AT2HSFju9E2N9NBnBWnLBKwVTCzkmVg6z5B?=
 =?us-ascii?Q?a5YUrGEUaNCsv/ttCyCzg76BpDzmaCfp7lrMRlreX1okCGX+36BbcLuSBFWn?=
 =?us-ascii?Q?Q5OwC3r1nhR/Q6d/ze4ubij3H42QcE8eWjq0gyjc/O6mOJ/SWAt2qrquPkuy?=
 =?us-ascii?Q?8pbhS9ePSe16kW97eHWi+VF4P+rv3YZnIshnvm6DQP+JDT/dsCvPbFUWJVgh?=
 =?us-ascii?Q?scxbaq7SKQUs/GttHOx6gtlRcny2K7y0pkpPqY8ml0UpAhtVl8OjLzb0ompi?=
 =?us-ascii?Q?RQqgXP5CLr3yvPNxZs8dIekqFz5/0oVHP476JYNqf6WLfr+SziV8X/qXgBck?=
 =?us-ascii?Q?lPSJDWmyaJXLKokF8+EY1o8i9KxPsXTmds1uX+0dcQxdRDOkdO4nSrBelceA?=
 =?us-ascii?Q?Dl/END0yjOEq3bP76WzkG67eyGosFk9Kg17uM8Hk92zlzxatKYQsl+O12QnM?=
 =?us-ascii?Q?KLUTevECM/SNM1NM1I/6p1bORKPXLavwdJHtsADYWkZI7ASMgR2u3cvqq7J6?=
 =?us-ascii?Q?TSTxD022+7reFHVh/dKk8p3mQlhfSLHBAJU868iM/YE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:11.1032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: d192f483-9622-4033-da27-08d8b86f68d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAPhrIlHPyI8hooi5AwP1o7u9osNPWkvuTDE9MnR8IPJsUseHcI6fNd7iLu6EH2AjGJqXmz9c6s23ALhKO30Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
v1->v2:
* Rewrite the function to find the next bridge by properly using OF APIs
  and dropping unnecessary DT validation. (Rob)

 drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
 drivers/gpu/drm/bridge/imx/Makefile             |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 369 ++++++++++++++++++++++++
 3 files changed, 378 insertions(+)
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
index 00000000..c15a2c6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,369 @@
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
