Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC5544417
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46DA113DA4;
	Thu,  9 Jun 2022 06:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5D6113D8C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaTNZxRbirbHITANruZcK7dAIPmrXLwEVq8L+/GWt95xjv0HEnTRAe0OhRw3Adn7YG/L2svGMVO5kl/oG9CXV7iY1+u0z/apBNtqP8uoe+9kXFI/zo9SWfvsqih3NOa/Zp/e1RC3nycrhsIEhjhRL+T4OPHqgmW5Md+ntRQM9Zxm4uThPc8s6SCAyyeOBHFys5DP6VpaTO6BV4iQe95ErFhihrgWY96aQLMsA43uvcAqTLYq/H3qRMzY06+VTjNqMdiF9UH5NUMj+uB3E0PktPNusCOaZP96ZqD3fjHPyur2rgwQ+sZEifyE3PUGGjuhbQr6Y03PxrvXNSuKFqNpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2vHkVkRKBkFo6/ZJ0eVx72OJCJ94Xld6WEnVOgNN2Y=;
 b=GO2zu33JumbwyvXz3Qxh48hYaUZSMATgRqoqm/2HTQIn9oX5f0aONGfzAm0jRTYyDKZznuOhKKoHIMmu4HFPl1h5aTogrjFVxnBZpboDVCiHFDJiYAlmYdsVqOqdegjzemgm3gqwhbNbW68HAq7niuZFRQu84mpkCkOWwvph3k+CeV3nAnfqodBqf5R2BCO986R0Nq2eLfX5dekMZLoG7TGfHac8npSb9K0A1aryZItndaur3V5ZXXS8xPrcnubch606sCZP529lBKVRpInQQwnHuyfEASej7wTU0B4ULw8YTVVobjrgzm+O9bV6YaphxidQKBQn11e/yC5TWFSHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2vHkVkRKBkFo6/ZJ0eVx72OJCJ94Xld6WEnVOgNN2Y=;
 b=n0Koo5yN1ZshzJGKP1d5bo3Ee2c0eSmcrPv99qwV0Tx6EojrdWOegI+o/RtgBNs9XtBLcY4JQzItJ40kADfm2CAclk2iNBG8qnF90VszFeoyRRNN13j3ACZZi/T3LIc91A45lG9fmcxEaIKLwHRwabKao/0PmaR0M7wnyDjyOTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link
 support
Date: Thu,  9 Jun 2022 14:49:23 +0800
Message-Id: <20220609064931.3068601-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f66a0723-73a7-4c07-59a6-08da49e41905
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3518D547FAC305FBB2E7F91498A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEsU6hXf5pWhuVX0+QV0T+gcghvV0adMnE0CCu3yCT+vw5JmJd6B/li84cqE0FfHisgy8+C6wLQNuyG1nnJxz9eY9fTK/GJMgbb9x6uNV+m5mjwoO/DZVXGBmVo+uEhCtghRDyD08XwUmWbAYH6oqWBlGcGicye1vQGJbahIi535A2hY+G/livMzqH4uY78eB25gRBAhCI5+XyOiKg5req+T2Qbs+YjsHKAoy9felsL82TpdSDi/aXeo9ShFYyJ44DoM/m4pLS1oywKkq4X0L3AtJERhr6RjLgyJiHYq3C5TsUed6FG9GzrNBX3Oj0KvoV6xuFH53rDq3OQnAfGjvU6Pkdc3F7RoTAb8eSNs3INcUDsiK47eiM1Rd+gAqBMwtwN4DONDksarymeaXXwHdyg6LTl/joMS5EI8a039PfOhXIR4BV6EclHKi8Orf6aBTPJNfd75qVPYvbuHzQav+hAdDEHfcerYH5iGFua0VZlMHdISPAQQEOS08unbsH8C74ym9bE35gulvrZ1rkKIFjEAuAHEjC3ol0uNYKhoaC8VgFDSKSgFtG+nPoXvruYp1m88wY470f3Y1lJzMG+8vmnUbgAwCx3OiYxxRs2UnP+bsIpVinpoHS6Lnr0/8Ikax1p2ag+Ec/+dievnFxHUmUlHPtuaZ3/Ju8X+FlIlE+oIorJ2xs5glo5POjN+GG4X4a3sPctRu4LjI1zFiF7jFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(38350700002)(186003)(26005)(38100700002)(6512007)(6486002)(36756003)(316002)(1076003)(7416002)(66946007)(8676002)(8936002)(66556008)(52116002)(6506007)(66476007)(4326008)(86362001)(5660300002)(30864003)(508600001)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WqnfMUT8rS7l6rteYjm7yCVA4BRGzClka9A9AycLh2FyJpiHkUehgprrSyzi?=
 =?us-ascii?Q?Ph977V3NhuAq5PINv4RlQXgjX63segPGSdrbrVGIqXHM0yOf2JxRsp8ULfP8?=
 =?us-ascii?Q?WIaN4XbhsACCPErQMkMiy28Q0BvlGXJwSAS+yne/T238UU1ssglAJYZwpGW6?=
 =?us-ascii?Q?x6fEnyQ5kESoKgxlPJd/gqi+aMRDKOJL4HMG/k7HXVRB61092implt8a9lzy?=
 =?us-ascii?Q?UCnhLu9qlEic+VIA2YWCs8qoSiLIqoIPXZP0odgQ4dN+OQ+cAkHQk1k0j/jf?=
 =?us-ascii?Q?f13ycr+9MNOaNCqH1DdvjQU7UO+rdllhnp2ypnf8lZ6S4LLRtT/AbfhiRwuS?=
 =?us-ascii?Q?Xy3IJBSoGfdwB1L0KYKyswL2gSJWvnzQFouTA0AWTfvgxJbx+F5RhI8gOSnA?=
 =?us-ascii?Q?JA0v8n6da4H7Y7hdK6G1fHKPsOh1N1B1y93a07ZpdYIZ1FnQk2Qbb6pZtQF+?=
 =?us-ascii?Q?+lMwugPZDw1KzUcw38KLr7Iskq0/ycyEYCOCOYMIJ+259+k5u5gEB3bA8gvZ?=
 =?us-ascii?Q?6s2pee1HYMXqJfPqsNtWlSya6rcgNRx9AAeAHq/2LUL635LyIc1cwI+AiiV8?=
 =?us-ascii?Q?/zkz/s4V/qCzxrMdadm9qHAd2HDp1r0GAfGdON0IfeaTQbYesB6w7Lrx739j?=
 =?us-ascii?Q?NoI77pQFEPctOsJhj54qroZqiAjVXdm6bHNBAE07dUeXyYlJIT7s4fsMkjzX?=
 =?us-ascii?Q?mWRAs1H0Nz6GblLPyACJvrg7HdE8fVhZNAZiVROWkfcAsZYHRIhuyaq7ryTX?=
 =?us-ascii?Q?i3fMCmAOdflfwQZRYBpmbJqVSTGt7iUdTcjrwpPNxBqo0xAa/VncpQVWLy/1?=
 =?us-ascii?Q?2HLg2vqhCkiERObQ0MqaLbadOpAemuVoPfiBZ5jLIfBQR28qQjlMU0zzWJvB?=
 =?us-ascii?Q?xY0xBFDUuvTPOVkoq4XN3yN3/omi3nq1RwADqAQi9wPAoHNd/fdGHt/4KmRg?=
 =?us-ascii?Q?vrmO6nFpVv8diJIEQSfMw3SnX3oWoAP0UiPvmLkHDOpGY8dMmyhoke5S7pA6?=
 =?us-ascii?Q?qbjJY6lc9MgzEzrdzAvxxpaaLBL7L++W2WG4zxPX/aWFJ/rduK84jWKy5L39?=
 =?us-ascii?Q?wa1FFICr58cTA+ELHWJDzbBCTuFFx2YnsI9TJFR5NT6BX2mdPD5lNfO2Dfrf?=
 =?us-ascii?Q?IJgpg/CYN4U+YYycZtH9c1wQoEiyeGeTLbX8aGipt1kIby0taHr2JP4VtaTG?=
 =?us-ascii?Q?8uNc+E6nEwQYY0rm28U7mK8bQPvjCGeSHvmTDrbsMVs50XmOBwUancawLJSV?=
 =?us-ascii?Q?xPTaazsYuyziSCX2QLXOpGaFBdYJ+x+dCqC3qB6vILnueqRDghqcrqFVu/EF?=
 =?us-ascii?Q?A70jHOSNj+cd5CzEfFuUL0XyZ0074xxXDfs08YkwBzyg80sG+Y2/i1EZp01E?=
 =?us-ascii?Q?q51KZs2gjU9P5JaN9c5d/KwmrzLSaRCBYHTAL9ngPDZsMMEgOPng4UdQ1pIN?=
 =?us-ascii?Q?Xv0NaK93iBUEbYJJcukp3u0DxEH5q0ObzwnA2wqecNfvKRyl/MF6JCPal6yf?=
 =?us-ascii?Q?896mB3T686D0zAziEfeMWkKxH1eLnEu8yRp+elIgrwC5KfZE0cLdDJ9a2WSS?=
 =?us-ascii?Q?C/R/QI12VPsG5YvsTIFN2hSudhYSA7oRD89YI6YvUIAcEQ6AwC0HiY7LH+QK?=
 =?us-ascii?Q?vJph8BBWHrjUyoh/uyTiIRm0+6NqaCToJLto1+KCBXRSgsNOkr9CEFy0oCK6?=
 =?us-ascii?Q?QF3GqC5gE8+qZTsgLkF50/C09pM0gymPtaV9EZZpaigsTRdoAvjbM2nsxwUU?=
 =?us-ascii?Q?yJXYbo9Uyw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66a0723-73a7-4c07-59a6-08da49e41905
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:45.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDaX/gCi+yxP4DX12ysQJUgXILmB6mf7xFpfAq86Erv78OIciatq1DWywFb+LVwxpJsGjLvB91lSJBqpG24sFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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

v7->v8:
* No change.

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

 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 ++++++++++++++++++
 3 files changed, 438 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index f1c91b6814a5..4d1f027d07f8 100644
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
index 7d7c8d674bf0..c15469fb5789 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
new file mode 100644
index 000000000000..52b9b96549e1
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
2.25.1

