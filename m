Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331792F7E4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22F410EC80;
	Fri, 12 Jul 2024 09:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eWPV7BwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013055.outbound.protection.outlook.com [52.101.67.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A065610EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GljZOUEgSsPA4Ts08SUT46B3KYS3PR5WTPDqfaBmVgYgTYA0Ntv+XM9Rvn1AhMsddFZJuR0wMcXwmExquTGcnaagvom+XRNEMM1v2tWORM0hH4zHBn11SwwQAff6Cd+gaegGUSxnLCio+Un/V1uKLGRplTL/kM2Da/8e0F8gJDeUVDz0W8h325aJp8eCGvOkLJ24zDNbtebq8DpVjb4ydFZNDCAhNQQ4fkxTpVoVc05yBexdPieIcXXr5kPU8qhSZqaHGIOg+hBsc3ZovAszwQTRLW1v7oU9czO610D01U7PUcGI+31ew3Dd4is5pUSA9/w9IIRL8GISbTQY6BIbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k+ddR49ukOMTj9E87tZVKQ216l7teCBeBnwO7gDxd0=;
 b=ub+vqchgaJ7mcQ4unFbeCMieq58I5UNlcdc/b8oMmeNdafjmlrJS4+jefo3PUf8uCm7nDYau9BNOcerMataCVUOGjYdl4W+cs8oHatTkC7g+ZnmJhZSaqyOQwh62X97X0zGTfdNRvXlQibDRYVVgNe1fc2/KohxEwGjLt9O/z6oDXn6uHKp3fdg250HyZasoWh0kl+v4+BUES2znR0z7TCu6Vx/DbiXBQpun5BNXRODXFip1zpXcX5Nygg1MUSVgkyOE9QGpyQmO6g0FnxYAwfxpqVXNR7X2rSfYfFPdGmqDd/xW6wTjXcpO9I5+3ucCCYLHuTsVEJpBTBkiX8cTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k+ddR49ukOMTj9E87tZVKQ216l7teCBeBnwO7gDxd0=;
 b=eWPV7BwHYzmg4SU4jYlK4oOgst/AwbGTHwcioLezvwOhmUTwUeMN7JJvCjblLkISwVe0IrbnSNbRomRlX7beGEypZer22JHZCDhZZ2jF58MEKyZx+KIDBKcvHNoKGjpXPvOvbsCly575kJOQZ97txmoKKhUTYDPWKjh220gA/I4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:34 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 08/16] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Fri, 12 Jul 2024 17:32:35 +0800
Message-Id: <20240712093243.2108456-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b995a70-7b11-4a8a-06d2-08dca25494ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?19yGD+ZbW5zoRXsplPdqwFGanWLCF+0PpEMpEd2e0tIrVOBkF0Z0BHEpAbop?=
 =?us-ascii?Q?7X0vsI24Ximc05rQITlF8xEQwjSmhcxhGSC6CjrtkwN7KFDx+zvf7tuSftfV?=
 =?us-ascii?Q?fuGNZfESm65NCWv4Nauh5BFdI1scYFuEtA7Vx7PJQIV4eYEV2dzynyysqm2Y?=
 =?us-ascii?Q?tddS8z38e42Kb7oOgLKOzGoj0WjxlyXSKE6Zt2+8Tr+4RvpZ1w53JKzUIJg2?=
 =?us-ascii?Q?O93Twv0rOJPDBloBnnvkunH66YEa3p2fbLCAkmE42N0T3SXjITyS1TkM1A3t?=
 =?us-ascii?Q?/jYYF1LZBZxFKbqOEhzN2jXzbnZEwi+g0iBTstuD6vHoEtiHl6JpBekNcAoe?=
 =?us-ascii?Q?50fUSmED7nh3JtXmki8QOJtYDIwmLOAFUkZvQfRF+/SUwXjGwZclKkMOz9DY?=
 =?us-ascii?Q?2RIX+okgID7bFy+V3Juvz5MCiGnnX1G9Q/cxOwi55N2iVTCu+ScpWEogfmgg?=
 =?us-ascii?Q?/jP0kPuo6SB0q7Nqta7Y3KTrcIKSZ+pAGEUDSiTJjRZzlnAhlLdKvP5AJ/Xo?=
 =?us-ascii?Q?mLZMPQCXrXF2L6UXRYjZzpnExjdoeWv700iC6gyWuZfPufBlxwXr0Enzbva6?=
 =?us-ascii?Q?CFUvJY3CebOAvg8hn/UiZFNC7ThHIolu2Tn0aRhg4M3QFdf7+Apj34YFYIgT?=
 =?us-ascii?Q?l1jJhOBrcfY6QQyBGejUzGDdsW/Ew5CULZVvV7DrlaSbXZGRmyWL5UvmTIHJ?=
 =?us-ascii?Q?46LCQCnRmIMiqyW8QYZmrTit5JnM9rDHk+zn+oZt42iDTmdyQ2XWxUdW8z7c?=
 =?us-ascii?Q?6dKSQhMkOxJ8ikNzHktoUI4DRprxEphngbvkyuaFXkyEsLjM+zNtfd0q47dz?=
 =?us-ascii?Q?/w8nEVLE5jcuWoB9ujElwjETSvOQbBt3OephNwUcdl/nsLLcQsoekH0SSNyI?=
 =?us-ascii?Q?9fEogAiteSHRnJjq6TzhKHOw4JCYZ9r2qSLyYH6afDAHw1OaZ+Hu8Qx5zDeg?=
 =?us-ascii?Q?R8BaP4JEi9I44J1ivimCuGyMoJnGxUyQ4iZ4YoLVrfKH6CgnHGU/gzX7a96y?=
 =?us-ascii?Q?kQeVtVuKwgcxDQdGW/0ItcheE4tI4glEl0u291M8rvqTRL0FRtUdUJbYp16I?=
 =?us-ascii?Q?DyIYR6cyNSCyTkVTaQ/lSzDFu9OKzLFUBAA/yGu+sqBRh2BAxxKr49FsMjOs?=
 =?us-ascii?Q?dl57/FT7oImzTDXD8JTN8qcQvAw4W+p9aBeRb0XeDC0LLiyMUQKaSK581ZTt?=
 =?us-ascii?Q?E8kn18S9yEwwg6q7NKNvQalz4cBFNPHICyW2YlzqXZnE+bTvkRI98eVVsxAq?=
 =?us-ascii?Q?bdTQw5bC2cjf9nOFLWLsTtJ5RkJ0U+CgPG+1XWZ6ddrDTtfAXNailRM3t5f6?=
 =?us-ascii?Q?emw2VvLyVD8Z5m4J9Vw9eUeoGzbgaCu4aymKrCpPPBAL+my+OpoS5y8aPUTf?=
 =?us-ascii?Q?7yBdBL3BPnp7sSTAc/6yHBQq/kTIlEpHBjVGlJnDyR6WL/OuDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6fGw02i22WuE5NDJzaGbkwkpmzJkuAI4Yh6O30fVge2Hw5sCmlVWOXW04mQ?=
 =?us-ascii?Q?+A52ElzmGpgS73TioH7GAIV+vgLrdNnlQczhAqigw+1DK9cHAd6wrEBkjoXh?=
 =?us-ascii?Q?F5269snB3kfRKeAgzvorGnzzjuRJTQmc4zXjOpII2M3xnYcMi4tCkWes5b60?=
 =?us-ascii?Q?zYjx5YltyeYhBLTKXrRFcbGqXDPr7FoSoDyi4M1qb04Q5afTfHjUUurZ2Pfx?=
 =?us-ascii?Q?UYNSU1zVif/DNRiTdPcDBf8GwhyKd0SNnKpkmAZIUX/1z8zDfM+xojkVSG5D?=
 =?us-ascii?Q?zbXGvYZtcNBzRIOIQyfFccKbg+nQLOq6tpE9C+mUHs8J6bFgZF7MXoDs+rhL?=
 =?us-ascii?Q?bRFV47AfGE6vDZMFrsp39wVgevF03Y4B+yAe7WNaWTjbtbb2ckpepWMMoKEW?=
 =?us-ascii?Q?XvtGUWE9BEvuo6YntUEq7FMtRKmXoRJ7hVB+84/iDpxERidnX3Qxk8ryJ17v?=
 =?us-ascii?Q?t87q7q3qRt8JFyIEVSuw/zWOAeKQl1M38tp+dPwwCsNsNlSgP+/03WtfBMEz?=
 =?us-ascii?Q?IpLuGtP947lFyI1TuHYMWDrbGsp5Td8nayo2qI39ABc01jOUjUXI9Vhv8RsI?=
 =?us-ascii?Q?SRbjzAE6xHgckgMqgasmgU/6WFDhWIar0aHYo+afWSxV60XBzU7Tjb7uDtdD?=
 =?us-ascii?Q?lhp/nj+3vbdqyUWyvARVDZM2RJkWqp8Rl2V7DKKJrmjBIw+M75SjgydJPy7M?=
 =?us-ascii?Q?VkRB/Dfs1Py2cAKbb4cWkZhZZamM5H9qCLdq1hYDQm3rbnFoWRcu6zbWGv7z?=
 =?us-ascii?Q?Xfifwrxnf/HdyIuQkjHc56AxRwuMuzB4JQ4X2wvrJ2K5KPOybrk1deHDw8YA?=
 =?us-ascii?Q?/pt9CuSe85NmNi83wQp1155+aVAsubK6/xyNaQJlp9PXXe82j5o+ZQItDRjf?=
 =?us-ascii?Q?RPtkNW1to1HIoULEBiytJAuSMLjrwDsVC3itiwoeNQyKPXYB+JPq8uyVkdAH?=
 =?us-ascii?Q?Jj8OR+Hv9PBswfHnslynRFGm4QuKVlniETPCxSxmT8X+danJ6NdD6IiybihU?=
 =?us-ascii?Q?KdZ5+bPXdo/hXA80STLCtEgPcoRyGxHOJD8UXrTPTkt1BrOXYjC2/sPq0EZa?=
 =?us-ascii?Q?ORqpt509Z13f8b9qKtdi43doPiTO89HEk7Qi3+EhrL10l1B6aelpVuw3nXAu?=
 =?us-ascii?Q?qL9jZCwv1NAFnn7eZk/ZngrLUZiNhLX1uf//Uc9/m8s7yVyH114mp2jLbIxk?=
 =?us-ascii?Q?p9yRs8EnQFbFYtf98dxc42P8ra+Q7TTvAnYhaGJk81CKHci5k52afXwx2P1A?=
 =?us-ascii?Q?NnYwcw4z7Bk2NSFXgx3dFXba4mfyPYVgMbKok3enwv+o1BV6oLK2aYjaimAf?=
 =?us-ascii?Q?stClNHJqKWscBdgbA/p6e2+n5Y3ykVwlEoXH8nkpbTRR1Y6eM+y3NYSG/atQ?=
 =?us-ascii?Q?Kv+p4RX2e2wXf6G33kLZQq6eA1QoYQwbHW3GKiwius401526plNj80UEETwS?=
 =?us-ascii?Q?VJA/JHuo+ewjXIjy5Z2yrWFffdthJbXxP+TuhhflbLAAP6C73/Ng9I2p0BkE?=
 =?us-ascii?Q?HonN6Nlo9kmSUtq0h8lF9WEP8MwO9QbH/4HCyo2/qcGfk0ix6Smbyie4xykO?=
 =?us-ascii?Q?BW7hXJGrJDBiKJESNzGyiDaaGzvu9NzhHxYR8D3w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b995a70-7b11-4a8a-06d2-08dca25494ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:34.1582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+3v4zTOUuNIkxxrICmNDE/uHduk1b9wU3DDzDWjmBeqJyzoQvAzjWt9zvKmwT93Yu81vTbyZFVZ7AvSg4K/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.  Add driver for it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* No change.

 drivers/gpu/drm/imx/dc/Kconfig  |   1 +
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-ic.c  | 249 ++++++++++++++++++++++++++++++++
 5 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 32d7471c49d0..b66b815fbdf1 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,5 +1,6 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select GENERIC_IRQ_CHIP
 	help
 	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 2942ae6fd5bd..1ce3e8a8db22 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
-		    dc-fw.o dc-lb.o dc-pe.o dc-tc.o
+		    dc-fw.o dc-ic.o dc-lb.o dc-pe.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 7c64acc863ad..fd68861f770a 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -15,6 +15,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_fg_driver,
 	&dc_fl_driver,
 	&dc_fw_driver,
+	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
 	&dc_tc_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index c687a36b8153..3b11f4862c6c 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -25,6 +25,7 @@ extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
 extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
new file mode 100644
index 000000000000..8540a0414b39
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+
+#define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
+#define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
+#define INTERRUPTCLEAR(n)	(0x20 + 4 * (n))
+#define INTERRUPTSTATUS(n)	(0x28 + 4 * (n))
+#define USERINTERRUPTENABLE(n)	(0x40 + 4 * (n))
+#define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
+#define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
+
+#define IRQ_COUNT	49
+#define IRQ_RESERVED	35
+#define REG_NUM		2
+
+struct dc_ic_data {
+	void __iomem		*regs;
+	struct clk		*clk_axi;
+	int			irq[IRQ_COUNT];
+	struct irq_domain	*domain;
+};
+
+struct dc_ic_entry {
+	struct dc_ic_data *data;
+	int irq;
+};
+
+static void dc_ic_irq_handler(struct irq_desc *desc)
+{
+	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
+	struct dc_ic_data *data = entry->data;
+	unsigned int virq;
+	u32 status;
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+
+	status = readl(data->regs + USERINTERRUPTSTATUS(entry->irq / 32));
+	status &= readl(data->regs + USERINTERRUPTENABLE(entry->irq / 32));
+
+	if (status & BIT(entry->irq % 32)) {
+		virq = irq_linear_revmap(data->domain, entry->irq);
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
+}
+
+static const unsigned long unused_irq[REG_NUM] = {0x00000000, 0xfffe0008};
+
+static int
+dc_ic_bind(struct device *dev, struct device *master, void *master_data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = master_data;
+	struct dc_ic_entry *entry;
+	struct irq_chip_generic *gc;
+	struct dc_ic_data *data;
+	struct irq_chip_type *ct;
+	int i, ret;
+
+	data = drmm_kzalloc(&dc_drm->base, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	entry = drmm_kcalloc(&dc_drm->base, IRQ_COUNT, sizeof(*entry),
+			     GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	data->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->regs)) {
+		dev_err(dev, "failed to initialize reg\n");
+		return PTR_ERR(data->regs);
+	}
+
+	data->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
+				     "failed to get AXI clock\n");
+
+	dev_set_drvdata(dev, data);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to get runtime PM sync: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < REG_NUM; i++) {
+		/* mask and clear all interrupts */
+		writel(0x0, data->regs + USERINTERRUPTENABLE(i));
+		writel(0x0, data->regs + INTERRUPTENABLE(i));
+		writel(0xffffffff, data->regs + USERINTERRUPTCLEAR(i));
+		writel(0xffffffff, data->regs + INTERRUPTCLEAR(i));
+
+		/* set all interrupts to user mode */
+		writel(0xffffffff, data->regs + USERINTERRUPTMASK(i));
+	}
+
+	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+					     &irq_generic_chip_ops, data);
+	if (!data->domain) {
+		dev_err(dev, "failed to create IRQ domain\n");
+		pm_runtime_put(dev);
+		return -ENOMEM;
+	}
+	irq_domain_set_pm_device(data->domain, &pdev->dev);
+
+	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1, "DC",
+					     handle_level_irq, 0, 0, 0);
+	if (ret) {
+		dev_err(dev, "failed to alloc generic IRQ chips: %d\n", ret);
+		irq_domain_remove(data->domain);
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	for (i = 0; i < IRQ_COUNT; i += 32) {
+		gc = irq_get_domain_generic_chip(data->domain, i);
+		gc->reg_base = data->regs;
+		gc->unused = unused_irq[i / 32];
+		ct = gc->chip_types;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
+		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
+	}
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		/* skip the reserved IRQ */
+		if (i == IRQ_RESERVED)
+			continue;
+
+		data->irq[i] = irq_of_parse_and_map(dev->of_node, i);
+
+		entry[i].data = data;
+		entry[i].irq = i;
+
+		irq_set_chained_handler_and_data(data->irq[i],
+						 dc_ic_irq_handler, &entry[i]);
+	}
+
+	return 0;
+}
+
+static void
+dc_ic_unbind(struct device *dev, struct device *master, void *master_data)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		if (i == IRQ_RESERVED)
+			continue;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+	}
+
+	irq_domain_remove(data->domain);
+
+	pm_runtime_put_sync(dev);
+}
+
+static const struct component_ops dc_ic_ops = {
+	.bind = dc_ic_bind,
+	.unbind = dc_ic_unbind,
+};
+
+static int dc_ic_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_ic_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_ic_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_ic_ops);
+}
+
+static int dc_ic_runtime_suspend(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(data->clk_axi);
+
+	return 0;
+}
+
+static int dc_ic_runtime_resume(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(data->clk_axi);
+	if (ret)
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dc_ic_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+	RUNTIME_PM_OPS(dc_ic_runtime_suspend, dc_ic_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_ic_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-intc", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_ic_driver = {
+	.probe = dc_ic_probe,
+	.remove_new = dc_ic_remove,
+	.driver = {
+		.name = "imx8-dc-intc",
+		.of_match_table	= dc_ic_dt_ids,
+		.pm = pm_sleep_ptr(&dc_ic_pm_ops),
+	},
+};
-- 
2.34.1

