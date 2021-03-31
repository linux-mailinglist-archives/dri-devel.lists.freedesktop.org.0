Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB734F907
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46166E9EA;
	Wed, 31 Mar 2021 06:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40059.outbound.protection.outlook.com [40.107.4.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E736E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVu9aolOXrH6oGDPzBVQ4RTpor6XgBjHm2vUqLLhOFjK8/zFXqnO3FlW9DLWThy/fFBLlPzlrtaReH7InBHqYQ3cx5fQnym34dbsi34bCgAKJcR3T94aFU5hWl8ccrDo0YuNJO9e4T5OyKDk9EGTgqPGwGo8dmA1tQSVeKfps6od8FfNlm1Lcs5dXsep1s7Yb9p0ya4e4tbDyhoL5o8XHwkWKcojwf/S8JBH+mRY2M9CHzpoRcX9fOygr3zy1g5SZ/O4YMP51ene9zVpMewzdzz7H2xMJcFu80yEnRWKPZdQKsPW78p52pXkYS/FZz6zijVyab5YFbGmhgIhyrib0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUoliFvlLveYUmc1p18D3TQS1GcA7Smm0Lp3LO/J11I=;
 b=HMxkOU/WhVrbkhFJ4Avvto5LdUlWQRm6TocH/7oBonTfkWE2a8/yT/vrFKIL58AJfo1YEyRXm4WqSWogWOmxujYc7c5xauyPipQPNmqUHZ2SSaUOR419i/HZ+yd+U32cqp+YY3NZsISmqoCVBy1D2l+bdCngzzHQvHhkojNASR/eVTnTpGJjIL/k3eE83aYHbHnDZMYrI5uTaaTAhXS+E9krDc57ZZ64lszmch8ipxg6/tpapR3W9vfk2G8gjiRrzkqjnoovdypTgjyT5bmEPebVdPIrf56T4TRHjLxxnma70piNy4oMHlqM/VjacG1f8/2spaAo7aoRt8LLFH/rMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUoliFvlLveYUmc1p18D3TQS1GcA7Smm0Lp3LO/J11I=;
 b=PF6bhhKoopRgyiof+6B9kTdZ2Lcrlfu5MpYW4m7uZSplxdXj7OxxNxbiBYOrLOGA7PavotiEeLJilFiMK4NolmlSxeWq8VaxWwnXFEoqmcm4h6rOINRUNkbnlu3f9B1jngZ6N7vTXFMkkwQNtEQlmy6tClmDqunBrHsr2T7PJKE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:49:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Wed, 31 Mar 2021 14:33:17 +0800
Message-Id: <1617172405-12962-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64963825-6399-4265-76ca-08d8f4111522
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB634980A4C1A50C2A3E610CCE987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u04il67rfXjQAan4D4jFV6SOXBIJV2QulsllX8NhntFTnvQfKpFgRNhfJ8gakGqMzO/5OqyVUXnyP5WwiZ+sSZvxCHeTLz1GCe9SJ4UO4v8CInrkyc/xcONoeU1iypeyxou/2k2Dpmho13g7PHMt0BL9P4sU4R+YMUCCzQgMVLqHXvktBC+MBmS4dieH5v/xJ1N7eymWivC7afbgnAuOt9YcYKGMLPX/LXYyyUQ+Fm2i1F33hUjCfM2zMA6s+P4Z/IicLadnOdlFsjB4rWIipH7egarjqtSKVJSsAutS7O6tiEiq8xP0dxKQ8bwLDK+zlUE6qU/V9Eu8wVuLfMtTB5fd7U4iGjWEgzFh9lM6KKIiuxPQv109H9ny1GIPDaP56YYaX8hb6BlI41wggpv+iBNAQHNwL2wv9G6YoSdkGGHGRQaj54D5Cn0/4LNS7si3/ls3kPV5Ryi6vl2P+kYrsdLw36bJ1fh40b4L/kOEYQ5mX0BSYhymoXtJQnSTrxWThNkIZ7FzzyACHfeu9AwC/IrdRX4mdIn+EcxJsD9qU1lDzNV574+X7qwrrh0jL51FP9Ek5AM/qMqkb7ZE9V5gZjSeVFZwBbUsSn3vcMxWwFksf8PUFsqONoRLSeHp6HrzYjMODaAMOPGG6rB/3NDktOehf4vvZ2BT0y06PQhpq6cJ8OWGIcMrNQ29evksAyiJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(30864003)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CFuqUpjHmTz7OkcxzaiUAVpPSXKFyjOa5E5SPg4MyGh6tDN2tEOzTwWcyN0b?=
 =?us-ascii?Q?pxWGghsgBzXkWgNFKW2/KCiJBYZeAXSqstLrxiyOG+QVyuzZJ3VIJN51LiAh?=
 =?us-ascii?Q?NkNzu/OHGE3lBVGFw04xO6jrZdLxphOTADRmpdecJTixS8TEcIjx0vPXm0wQ?=
 =?us-ascii?Q?/Ip6GyLABUDJjgJRHqAf3P4yz7VGcgKnx45wzPnv2178fgMimxMvhotPLmc5?=
 =?us-ascii?Q?p1qoBDDqW8r+2wLxE5Pv7pBPEbK/4ohagTdjw4DvbbuiFr6lEQL/BeO7wUJY?=
 =?us-ascii?Q?h1REWHEHYpLz0oHk7orypYwZLbbEByUULuoyaarrLgct/2L4yK/UWvE+HJvV?=
 =?us-ascii?Q?Z969AcKPosVMhhDPIzVi2ldrIHMQM6tP/gHy2M4XZgJ0ml5U8cNNvNaBCRtM?=
 =?us-ascii?Q?M8ViCJgvUfTxf8J/Ni1L0NIAsy0HmdTWLBO4M1Tq1qmMmjtYwuEeuXxJmnE0?=
 =?us-ascii?Q?TgyQ1y1f2HU0bbn17PHQufC5havgN26xt1nV6z+Jod8Yiy246h58H31ZpVQI?=
 =?us-ascii?Q?5hefH/PcJKfcrVeLNDx3m1zmLIGf6NpJ+dHCH3c70uUOU08QJol3RNgS7sgP?=
 =?us-ascii?Q?YC+dhYgIDkvA7LT8upiSYCW6RJPZ1vce1XFgzTF/SViHzWunHjEwck4zNnT5?=
 =?us-ascii?Q?Z07UQSu/SGNPo1lJ6Q7QEa+7CzdYKgTVpfJcIEF6XToZzIWV2Pjgdxb3LdXi?=
 =?us-ascii?Q?FPFCa4YPjzmt1CYRAopmxYGwz1AbculEmZKlT84/voO2efs0gIb9fevCEkqL?=
 =?us-ascii?Q?togczv1tZUqoSPRRjI6eZ3s7Nevr6KH/HwupOEmTwHgF7W4m67YCwFzmYenz?=
 =?us-ascii?Q?uOlW/84YrKnsWyzyC1tyfmUOpCONxFCmoK6BpiMlIQV4JOtE2zwH3bjJJnNK?=
 =?us-ascii?Q?9v5qqlQY+PrsKEaZvYikytyz9FVLENYoej2sOmgGD/PXCbmCLhuUDIVNfvFU?=
 =?us-ascii?Q?rZfMd6bhUKaQZ8xvVdv/yBZ56OQI6pH78Bkmf2nTGgNayXqejgns9dktVtMv?=
 =?us-ascii?Q?aX7iftmZsZf4COt6rlaa4vnC7FqTj0Fxo2SS4pNYcAWSi1It3RursBsnbXO3?=
 =?us-ascii?Q?3yU3NQO4efNH9D7B2hXcwVkyWy4/VEMf7dAicqR84EYHE/DRiWqjoqode/JV?=
 =?us-ascii?Q?9ybA9HrvF33LYsnqKxo0ryu7fk7STHY+SbuL9ejE+27YIARGVhcN5XngHQ+d?=
 =?us-ascii?Q?Yboi/sxIem9A90LXlW7AjpP0037xpDOzTFHLduyxQTirmZKBERqZkYSfagTu?=
 =?us-ascii?Q?tyERMMVLVJFr0vkcCBnniEnMmQoMDkkvk5pGbbgC881uv22gBofzzWLOlrW4?=
 =?us-ascii?Q?bo38iqPsgoi2hJ3UywJ+RjEM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64963825-6399-4265-76ca-08d8f4111522
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:08.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBfIAA0v4kkiGkqkATzq9qCxP2qtOvo7/WZiQpjo8tXteb3wmmGNU4eK3NP6ZKwCn2ntJymU9sX7t3mHio1LgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
The pixel link forms a standard asynchronous linkage between
pixel sources(display controller or camera module) and pixel
consumers(imaging or displays).  It consists of two distinct
functions, a pixel transfer function and a control interface.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
v7 contains a fix for checkpatch complaints.
Marcel, as the fix is trivial, I add your T-b tag. Let me know if you want me
to drop it.

v6->v7:
* Fix 'Alignment should match open parenthesis' complaints from
  'checkpatch.pl --strict'.
* Add Marcel's T-b tag.

v5->v6:
* No change.

v4->v5:
* Make a comment occupy a line. (Robert)
* Add Robert's R-b tag.

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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 429 ++++++++++++++++++++++++
 3 files changed, 438 insertions(+)
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
index 00000000..52b9b96
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,429 @@
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
+			      "failed to enable DC%d stream%d pixel link mst_en: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to enable DC%d stream%d pixel link mst_vld: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to enable DC%d stream%d pixel link sync: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to disable DC%d stream%d pixel link mst_en: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to disable DC%d stream%d pixel link mst_vld: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to disable DC%d stream%d pixel link sync: %d\n",
+			      pl->dc_id, pl->stream_id, ret);
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
+			      "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
+			      pl->dc_id, pl->stream_id, pl->mst_addr, ret);
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
+static void
+imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_enable_mst_en(pl);
+	imx8qxp_pixel_link_enable_mst_vld(pl);
+	imx8qxp_pixel_link_enable_sync(pl);
+}
+
+static void
+imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
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
+						    struct drm_bridge_state *bridge_state,
+						    struct drm_crtc_state *crtc_state,
+						    struct drm_connector_state *conn_state,
+						    u32 output_fmt,
+						    unsigned int *num_input_fmts)
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
+						     struct drm_bridge_state *bridge_state,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state,
+						     unsigned int *num_output_fmts)
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
+	/* select the first next bridge by default */
+	int bridge_sel = 0;
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
+				      "port%u endpoint%u remote parent is not available\n",
+				      port_id, reg);
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
+				      ret);
+		return ret;
+	}
+
+	pl->id = of_alias_get_id(np, "dc_pl");
+	if (pl->id < 0) {
+		DRM_DEV_ERROR(dev,
+			      "failed to get pixel link node alias id: %d\n",
+			      pl->id);
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
+				      ret);
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
