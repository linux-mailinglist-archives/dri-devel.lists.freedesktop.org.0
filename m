Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0695612A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 04:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD710E191;
	Mon, 19 Aug 2024 02:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P1X6raDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175F510E195
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmNtkDzIPfZTppmPkvaknnmBjaFOuCjDxbYtWX/knbRD4/2DOj7EX+BotJV69yuviqUyB9vUz7hVq4//qrA3aiP76eadI8UcxOs7nF52opC0FIjtJMmvgfgy5YDZ7FREE7VXjazFrWeWj10hV5wr1KEigsWWkpMC13LkJSNY80CvFJsHaLjPk9azmTds9z9Nq8QNuP4PR8E7lg3dVKFkqmhCDIq3qP9WqNZEVuP42AMDp+v/02c6SemIYQ8jfNg2H0dbNzWamcHGVF91KpyYa8/1wOnBwu+u6mSxmnkdIUn5NOQyJU0JiJq3n7VWyUFcvXndG+oqlgYp+zFGrKcF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cehUyaCyR1zI3cVhGpoICwdloV3y02HvuGtpiM1/OCo=;
 b=ueXWajDOds9wymM7XHigRrXtyDWkVNzybWQTzjdCAoUBNRKr495pQRJwjj5NeuysjIsPl5vK/5by2a8YPOTDTTEJeTufpNo/blK8aViWta2xGSLxwELkr1Pl33uC9U6pwaBaco8ddBQje8rM7x1FdFnCHJrI4TjkbDZAdfgu39XJQ0YyqPm3krdiMhaxxKBBR8oA9/7BEppbBuA3/LXrAAjyqBdy3n6+J1FGSaatmQInH5SWQ3lBd9Lm1SPotH6Mf7HPxnI+9Kb5CSL5WuCyUuwwelfnn2n11pAwL7Ja3NlDtVw0QJ/DniG/0b2d2/LHKsGDQWiFv5Y2T9HxmF2OsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cehUyaCyR1zI3cVhGpoICwdloV3y02HvuGtpiM1/OCo=;
 b=P1X6raDMwcZ5ro+swLtIJ+lxUyv2lBFwnTMpbN5rR4G9DJ++0pfKC0gDwW6pVqOF6OaRNJWHWJ4udzfSnq5nxonudStS5u85iCUPYrLZYYY1TWqsHD1W2XNXaRt9hc1YmSl2HBjRdU25o3pDLBdl72IwUt9PKxnBE3g6A+FVNQutQrr8RHVrEMJTHNyrob5rnUMevp1wfgnGgatVt1tNTthWNRoBrL1AB5kIfZssuuo1tX+bfPyOaj8bYLMXEfpmLsw02nUh/MhhY9FkJBuR09PYGmOWDryV1qSpH0eeHf2j/QQyhGRA96viOqOkhP+yX8l+1wIXqgixUXBtguywlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8807.eurprd04.prod.outlook.com (2603:10a6:10:2e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 02:40:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 02:40:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, peng.fan@nxp.com, krzk@kernel.org
Subject: [PATCH v4 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Mon, 19 Aug 2024 10:40:01 +0800
Message-Id: <20240819024001.850065-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819024001.850065-1-victor.liu@nxp.com>
References: <20240819024001.850065-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e02fa4-cb5f-4bdb-bf24-08dcbff8430a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b4+0LxD1FokeO71F+E5ULgWUnpXkptz4s7bb6uA1GLc1WqcIwt02uoR4e19D?=
 =?us-ascii?Q?zeVGooDzmc0bn31O45I1Q31MKLULxhUGbZUFh4UhUXuR2Dty2yoQUTxAyH/u?=
 =?us-ascii?Q?n8yodQWDdd5oD/pbYhNRpMB92OKywd5T3jxZ50TWeewOrRKpA60jjPw4V/2b?=
 =?us-ascii?Q?KwRXwIb34UcKY4rcXBZl8Ui7xQiFTR6cWObVLvRegWQ9McPWY7ydZVsDwQsW?=
 =?us-ascii?Q?uNOFlGYRF4T/aP1RwNF7U4nJRcIu/zbBvVl5/msvGgjq7AbaVmYhp2mFj3/I?=
 =?us-ascii?Q?8y+8+PnO8vi7BrcR5rfkA41j0xJ4zZirR8rIMqkONCWvf4CRbzOa3UJEJJkj?=
 =?us-ascii?Q?uRFJ3gargrhiMxloWnEMDlEK5mxW/yWahP67BLZ2sXZcQuvB48D4ntzrXG83?=
 =?us-ascii?Q?JnZHlJgotAEJy8fdD/LR8cSCRgHQUekFfYPA5nnffPoSTOmqET0/0snMjlEB?=
 =?us-ascii?Q?k3K+Y8WRjFNU+1OIqVLOQz8mRYpq4B35j6S+e7+thcV+V6nxYsflOotDa6+u?=
 =?us-ascii?Q?2wtfbxnIw1ctr/E8FdDt12h1sZenrd07z40ZByUSAeevHAigbKP2AbgxaWzF?=
 =?us-ascii?Q?zL9rQiuZ+FYiwdJVXa1s9Ge2rU63nCl9VFSk8inKJBQcKiiz7d1tlB6CnVfJ?=
 =?us-ascii?Q?LhfcWFl7M7nt/vtkIY0kjufp9evwR79NhyEWzxEE0LtDpBIU5dcKQ9kJGUJV?=
 =?us-ascii?Q?84ZgsNBVs54em8H8S34adoaAHg0c8FBn7hIia5i7eIB0u4u4+ssuNSNGzXnp?=
 =?us-ascii?Q?lGUFQKRwpPMi6JnSmpTrUXSfQ+0pfnzTteuktrLkRdiqHEE8h76smCM530Al?=
 =?us-ascii?Q?MG14QMdGzpyMgQQD3N+DyMiHiP4stLDQymT/5SbVAJs7VP+NH+x3AeAZKC93?=
 =?us-ascii?Q?xDmv1RA809YdyxcyOGmXuQKruypt54QjtB0rPCwnZYALGFdvBiSyBdzyEbjf?=
 =?us-ascii?Q?GY60vm+0wfSlHK3go5jaWFJLmrChoGyuyvEKk14A66uPQbfUwiO1aIoeSDL5?=
 =?us-ascii?Q?odfgy3bdnqLCtghRv3AxtLeVJTGH824SElIc8JqfdwQqldkfqulG0lR0XfHn?=
 =?us-ascii?Q?sNMRPh12J64zQRuh67cIMfRAkwMThRM2KCYj1x56zYdVuSouWQR1b3T1Pnlu?=
 =?us-ascii?Q?61y7YAT+KREwbgphz4tvAuq4Ibq3AAaA7BYwRUmb/xrsfqBgIjGpaYx6oycl?=
 =?us-ascii?Q?uxdXJ032JQiAQ1ccRNaHO1Sn/qWviOhc1iftL9rsTj+R2w2Lt4NIxMD/MWaj?=
 =?us-ascii?Q?98yu9ullWK+mMdeWUQsqukAMrt9QdFwRDun+kullTMv4OZCxQnxr35caqYvI?=
 =?us-ascii?Q?c1WMCtBMmoa4q1Uq7NTqVWzLzMHuYQSRlH6fiudhzS5L6gP2Lm9ImxE+sksE?=
 =?us-ascii?Q?tlnSEkeO39euDmcUuvOqP+2ypWn0hAECJpsLQLyPcF/Ue8lomA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D5r8D8zLUdR3Vy0K+kRJSSZOKqsxgVZtWrR6IxwUEE1oXRZgfaNkXmnNLpvY?=
 =?us-ascii?Q?m+f9eCP3jMBIYNEQxfbAH3DbhrLgidakn0Wa8DpYsPsLc0xGz6YxIhF3ZGO6?=
 =?us-ascii?Q?0baCUxUxFXwHGLMCfPywOu+jCMKN664JAtiEXL9AZ7wNYPfJnolOLhIqbRO2?=
 =?us-ascii?Q?h46OqAA7cdvycJOvdJozazlAliC/OBhJKwZgLKMa36klsrcBq6HjalvFrvO2?=
 =?us-ascii?Q?Zqv+zXEdCFA+PGXXB8Se+ntirKWhS9ZEqok9Ec0FgCDnclfcHVbIpR7siVrg?=
 =?us-ascii?Q?HK6Rtoe4ALiWdPI1avvy3GqjLcDpNTgcFOrhdkAGe77uGZ6IonZVDb88zSlS?=
 =?us-ascii?Q?zZjDFOQ4GCam8emR1EO0SBcEXhECj+YVF2N+cYp/MlIQfYlrIW+ilBxHOdvS?=
 =?us-ascii?Q?pUhbLbE9Nxj+1rgeuGpxD10FHGa+1DIOX5HluMdJf4twHB86sh1pocodDi8b?=
 =?us-ascii?Q?AZ65BWgpzUxd47u9LnbIHR4oYccY9HVfHvboDkJXGqCbsiXR/Ys+HHQixloo?=
 =?us-ascii?Q?x0xsaDRBOUVJFoN4dNqAbYHLxs6GNTi+fYXmEcU4G/fT8+2HXdUzhjMNhR4U?=
 =?us-ascii?Q?V85/2eCPdIVoY4FlgT98HX2leuvO2SvfujeWkA2O/94znThV6DUY3eaiQCEt?=
 =?us-ascii?Q?ss5IM0NzzFjCcqOK5Gcv5ld9l02egL2Q/hbq6Drvya3goDCgS51P9TxRppCk?=
 =?us-ascii?Q?VJ0f6pjv8nw8sebPpK+c4vRTh5Mj/WBWP4EvFdGD0OmF15V3oxR/C3NRUhVM?=
 =?us-ascii?Q?rzO3aNbDaycDJfAljoIH6RdgK5MvxD4tGvFOSy3fBDIDZddux6rfnr2w2hh6?=
 =?us-ascii?Q?JICunEgx0ANzfRXiWCHOdOFwRo6Yo0HUU5Vz1pQhCDSs64JpXayuLLUjk42W?=
 =?us-ascii?Q?8Fy3DeRfMHo6NtQV2v9/m5j8nSVShl0JwvfKL3CTBbQF1hzup3WBYOV7G12U?=
 =?us-ascii?Q?ojh36OxQ14lH7suj1PIo0/p3X46ZBGI2xWMS2HOy/gY67wIvWH/PK2IlyeBe?=
 =?us-ascii?Q?2OX1trjoCaN6SThhgA6C8SG0q4tjmOUz3Bc196XEdBr69hYPdctrHQtyiwH3?=
 =?us-ascii?Q?2kozJ30rc7iPHOl33xomNg8CU0+oIiSBxv7x9Ykr4YyYDCplxbQo4x7Pkeyx?=
 =?us-ascii?Q?KNDcAaxRNm+I9CQgbDfzp8tMmF6JPqEh654rJQuVbMXo+tgQgkM3YpuBNKUj?=
 =?us-ascii?Q?4NtC65yxWnwm2rlbuRKD5tt2K2CCbzD1b64egQHd0d+L3HoZJxI2p2SBsTbI?=
 =?us-ascii?Q?NZQPgtRdP60MxCPaefrlmEauhR6Fd4X2arztNYRnFopiqE3uM4N3/G2Fl1N9?=
 =?us-ascii?Q?QQNBYCK/EvFDRJbClhdSpyKrV2qTbTta8xMYKJbXEMgoONbtoVaHOmj6c5QV?=
 =?us-ascii?Q?IOg6Wuo/76+sLju3qQPjzGbpIsxglcZOXfU6eQCEtXWcJSCO+wZauR+ELG6w?=
 =?us-ascii?Q?4tXPpN/X1kOhV5LeuB7ctlHdO0ub80OIkKym6HMOQsYcp/yDhcT2nWW8KCT1?=
 =?us-ascii?Q?ZzoE33+Sv6R2M7c4TDEG3iu5Iq3r23MonMFWdHE2/gOsR78bZ/nva5PUqPhD?=
 =?us-ascii?Q?oTirUiNgaleJE9PnyXvtMBesTXznmWYg+sjA+5oY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e02fa4-cb5f-4bdb-bf24-08dcbff8430a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 02:40:17.9148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro7J8eCt7Pjl7/2LXd6cRL6ybnp+sWdQjUKfpCvRMQ1ulOuqG7xVIvbL0O4QlwrhHxUZvCErDPHGkKcpLPgLEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8807
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Use dev_err_probe() in imx93_pdfc_bridge_probe(). (Krzysztof)
* Drop MODULE_ALIAS(). (Krzysztof)
* Update year of Copyright.

v2->v3:
* No change.
* Resend with the patch rebased upon v6.11-rc1.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver.

 drivers/gpu/drm/bridge/imx/Kconfig      |   8 +
 drivers/gpu/drm/bridge/imx/Makefile     |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 199 ++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 8dd89efa8ea7..088241575857 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -78,4 +78,12 @@ config DRM_IMX93_MIPI_DSI
 	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
 	  processor.
 
+config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
+	tristate "NXP i.MX93 parallel display format configuration"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable parallel display format configuration
+	  found in NXP i.MX93 processor.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index edb0a7b71b30..8d3499fb7fba 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
+obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONFIG) += imx93-pdfc.o
diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
new file mode 100644
index 000000000000..3dd92f7a0fd6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022-2024 NXP
+ */
+
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define DISPLAY_MUX		0x60
+#define  PARALLEL_DISP_FORMAT	0x700
+
+enum imx93_pdfc_format {
+	RGB888_TO_RGB888 = 0x0,
+	RGB888_TO_RGB666 = 0x1 << 8,
+	RGB565_TO_RGB565 = 0x2 << 8,
+};
+
+struct imx93_pdfc {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct regmap *regmap;
+	u32 format;
+};
+
+static int imx93_pdfc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, flags);
+}
+
+static void
+imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	regmap_update_bits(pdfc->regmap, DISPLAY_MUX, PARALLEL_DISP_FORMAT,
+			   pdfc->format);
+}
+
+static const u32 imx93_pdfc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_FIXED
+};
+
+static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
+		if (imx93_pdfc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmts[0] = output_fmt;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		pdfc->format = RGB888_TO_RGB888;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		pdfc->format = RGB888_TO_RGB666;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		pdfc->format = RGB565_TO_RGB565;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(pdfc->dev, "Unsupported output bus format: 0x%x\n",
+				     bridge_state->output_bus_cfg.format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs imx93_pdfc_bridge_funcs = {
+	.attach			= imx93_pdfc_bridge_attach,
+	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= imx93_pdfc_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+};
+
+static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx93_pdfc *pdfc;
+
+	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
+	if (!pdfc)
+		return -ENOMEM;
+
+	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdfc->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
+				     "failed to get regmap\n");
+
+	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(pdfc->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
+				     "failed to get next bridge\n");
+
+	platform_set_drvdata(pdev, pdfc);
+
+	pdfc->dev = dev;
+	pdfc->bridge.driver_private = pdfc;
+	pdfc->bridge.funcs = &imx93_pdfc_bridge_funcs;
+	pdfc->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&pdfc->bridge);
+
+	return 0;
+}
+
+static void imx93_pdfc_bridge_remove(struct platform_device *pdev)
+{
+	struct imx93_pdfc *pdfc = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pdfc->bridge);
+}
+
+static const struct of_device_id imx93_pdfc_dt_ids[] = {
+	{ .compatible = "nxp,imx93-pdfc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
+
+static struct platform_driver imx93_pdfc_bridge_driver = {
+	.probe	= imx93_pdfc_bridge_probe,
+	.remove_new = imx93_pdfc_bridge_remove,
+	.driver	= {
+		.of_match_table = imx93_pdfc_dt_ids,
+		.name = "imx93_pdfc",
+	},
+};
+module_platform_driver(imx93_pdfc_bridge_driver);
+
+MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

