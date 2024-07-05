Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237F928465
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E4610E21C;
	Fri,  5 Jul 2024 09:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Sf5E05U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBAB10E21C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaiYgUzxQCrzzkGeRBnHmxXsK1FTsqGYIMCuvmUetXpNg9gKa+COXuan9TUzQvyic8KJx1NJS4fXZAEcsl9iUI3nrDeIiqjlnq24j8NRSicPDHzpTRy97Ykp3jHxMpStCMLHV5LmzgM5mRcZqahtDxJ+bIiS7omtKrHIgcut4FOT0FfvV3iG8tKqFHc3Q/ZViCudh41/jnPj21UNcwrpcdi8Shtyxh70C8InT/LMOOw85I+oRgf/IzjbE8cj6HtyuWebsM50IXCyQKR+yeaX+64MkziVX+X8WURUr2QeF91GSC2nmfB0ykovl9ERi08/ClSZG6VJbgLi0fPA6VI03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MeLRpZn1o42MnoTkWGwyA65gNRDqvVGA2ryZXyt1N4=;
 b=WlI6l9GcRxMKnIGhX0f+SlpAH56jxfjdn3w/JLB/m3uSM93IRPe8ivUkIxNy4nDYdjFehYumCFG95iCb3a517zhdBOzm8Zv1WcxcS2PyYvvCKac1j/eVDpmf2ibuIdqj5QHUeYa6+CUeGDsHzojw6nKmnSsjpvYsVFjNOYi1yeiNpdtb6F2gQ446hb5vwXVMKewS9zOHmMOPyy0QtZP/fYs8LYBrKCpd5yrSASEgds+mXYoE8n36IQO8qRzhtEsPaA7mP8xYDL/V6fbvhDoaSaTU/JAOWv9o4W9oJ8jGwzDHleuz+H9sybcd/YbHrpaQ2Finnbk3n+ojIkJXByEGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MeLRpZn1o42MnoTkWGwyA65gNRDqvVGA2ryZXyt1N4=;
 b=Sf5E05U/WpBU5r+nI3ifP6a8gBXr72dm0eKAeKLSbMFF6QmpduO9UoBwQUHcXH77H+QU4jaIb7CG2GtLxXU5eXuOmSRI8IySYkciSyCiTghZyfR22eDUzjVwWVwbqlkoohRC6I2lEH5Bd6NhWCHy9ZsXJX443N+nKH2svNMAqSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8038.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 08/10] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Fri,  5 Jul 2024 17:09:30 +0800
Message-Id: <20240705090932.1880496-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e049ad2-f5bd-4389-12ed-08dc9cd11443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5aw53LDPX3S6xZ/RfMGMY7kNvWCnHOSTYltv0N39AZAQY6fw6TpaFkStY4WU?=
 =?us-ascii?Q?vOsT4ArxHrMx347zTbuLIY+MzLWtv4kGM+2PVsfV+WALvdvBMqvl0yPKv81T?=
 =?us-ascii?Q?g4iY+nRRlCRI54Zu8JwhPE3++5isa9rU3Q/TBjY74qXz5CYz2PaOUv/Qhi9X?=
 =?us-ascii?Q?CGFQo7FBVjr0pddVOd3eY1bxvF8OQTx0Bd4RIyVnm+kJ1tz7k/N/rQnoY2lB?=
 =?us-ascii?Q?Xnv7kRmv2ih4QwxNXw2zsWXdFqBFbo9WUmG1raEiDB1BMJaTtt4kFi7ZeyKf?=
 =?us-ascii?Q?nweyxPWpSbKDSYvKzVDwXUq4tcD1UWOCsGaXfS2KLhJ3IyUg9D4En+ZrXN3g?=
 =?us-ascii?Q?UPaG5THzkKNACGMs/am83qZ3VxO0TVqx+D9Bm1FQXNTcHKV8zh8yHCMV+xEH?=
 =?us-ascii?Q?aqaPTNrTSECDzefLD/eMV7IBFRPAoobzpb83UTobHTat34+UWHmrjGYP4700?=
 =?us-ascii?Q?INYkU8OZeBtgHEhvOYPj1bGftnh0ERPmpMKDlGWGQTKHIx8mUZ/ES934i60G?=
 =?us-ascii?Q?uRVGrksdJs+4TPsVysenee2WnAHvOW+dvHhN1WTlAj+w6sGRrCCb4X8ggH0+?=
 =?us-ascii?Q?kUAzJvmqT3zO5GST/+qP8eAayfT99FyZ5FalBVgc8/EFSNSiCRp56F//ZCDC?=
 =?us-ascii?Q?LUFY7DAtEHs3twDLovZl/iv3m2zf7VAUROZJw8Ae4cWD8gZoEd+PZ/g4/LSc?=
 =?us-ascii?Q?x7qToNxO6vi/w8vM8HDE7eDXTQIR1ysoM8bHVavGJoTBOIBl712x4PTOGVV9?=
 =?us-ascii?Q?rX8nMq/MeiPDK1yQ38dgjCIvMxznaW1E1vLAjyJLAajrpFbc5pmrJVM2hXTI?=
 =?us-ascii?Q?5zQXZIYRivXl+yONSpMQCsqEsedyLmANkWd1ukQoMqwVYw66ZIGleO++9vwY?=
 =?us-ascii?Q?dbF+R1YYw147X3YdAc48jod9fCgNCzFz1/T1xEpiV1BDcfGEbLxUHig/JcxL?=
 =?us-ascii?Q?6neYFR1VuOcaBNMfmIc9mNthBFzEomHy3+TnSTmpOmLCRD0cZ7FYw9aStJs6?=
 =?us-ascii?Q?gfyi7abOvudBakcJ3KpeetcGLDGXn9m6YPYxp8uIkKU/wmU1vufix+mLEYhx?=
 =?us-ascii?Q?1Ats7gFQPy5Bze0tXIle7ZLI4ywaH0Wr4oc8rpdTw07tclbVB9zqyUFuoLx+?=
 =?us-ascii?Q?2+hOYqKd3CWxjmXTtSCtfmtin1yRdV20FfsjIJea+YQJNTxSBHIwePiOnn0q?=
 =?us-ascii?Q?G4s2E/2ZNR/zUuncsgHc1/d3DGKTHpYxoIUgMu8hAYRtVgzVKSkrwZJTZwLb?=
 =?us-ascii?Q?HrO7KuDuVVRW+GVy3Q+CKM2Da8h+9c+B5jNg8QywMZt7zMUryvS2urdNHRY/?=
 =?us-ascii?Q?D/PUaJW542bQ7JKLobMeVBQBmFIMpuleHVva4oXF3EzyIDV8tkAUa4YhGHfM?=
 =?us-ascii?Q?8ryox0bqmpBfTjf3y4ZwKRdWXjDkRbX2rvJyJsswU6S9q58o1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pmVUTf/DfFl+TzJsTNRKnDDRL59mz77pEA8hSZly3nQAxfiNvZm7ceyTTdyH?=
 =?us-ascii?Q?M9QYk0+63w8TkrozcSfJcLUAqehiPjQrwtz3RESIk+HC54uO8SkIiIBJA3zj?=
 =?us-ascii?Q?lDtAlLlsJqH+/GcJQjlQ5IZVi5gW9g+Yec2kSLi9/jn9r8VBFI4WbKQogCLf?=
 =?us-ascii?Q?XQt+hkROGalayguJlXK12lpnn0ymoIypz20XU0Ncvi6e4PQW646ujL4v/77Q?=
 =?us-ascii?Q?jwueeBKXFvgdNuP7ZtLEGUY8xIsf4u9TnRWTWEZ+D6CB0vPi6nV67yZnskcz?=
 =?us-ascii?Q?KA0dGVC/ZwLC/i8IZqXod+efp1j6dtkeCjtGukXz2s8qZo6p47R+I+gP3dBU?=
 =?us-ascii?Q?sey132cLEqD8G9GcOaNvsGrMU8mJqjaMq3MZkNG0r8WDuEknQF7BTj+zk5tx?=
 =?us-ascii?Q?2t2mM0bFbDBnyUcze4EgpjjqSrRHO6ydHawowU61RPgX2KJaRttJCPDx1zQY?=
 =?us-ascii?Q?IRAF7wRsHJLyfoqmOSgUNKZ0AkeCI55CtCuJ7LOO/pvTcBu8gCb04pHbSZA4?=
 =?us-ascii?Q?Ck0dTxTPt1qSNk2KC175VVP0m59EtD8wqyRxA/n2IjI8bo5g2PE5bjdEGrf8?=
 =?us-ascii?Q?MqGry8Bic3jpqRm067mgmgXSqDF9JnhV8d0bF+inhKJQhmh4uZchbuCDY57f?=
 =?us-ascii?Q?g7ZPfuLnTzaiHo3j/S2seA4/6FHI6aQW/8H7nnZEoTen1DF4kjfMRaFiKT2N?=
 =?us-ascii?Q?J9BhftyRt0F82qNh6XcuGTmwANjhnngAyEWE14yl1XhNqv70pZwVZJvlwgDo?=
 =?us-ascii?Q?2BeWs3EdgOf3uohX/dZlNnMytEAFpofqurjujieJ3rrnVilRtgo8/aMnDeg/?=
 =?us-ascii?Q?Z3O1gFXXHuaFnEqj0aJ3jomdr0bzWYUDYCBGuXQ9ucwSquaXDmkh3hjygDR3?=
 =?us-ascii?Q?Qhge+KUQFJGFVjsADvh/6JRazPtz7iMoXYAbT0Wm7DEcgEOdBLpyJZmAzFT3?=
 =?us-ascii?Q?EEjhZQpRdG5XXl4emtD1rRy0mpHDVjHUznjzIY1gdDyCHN2wrEp7XzJM7Zyf?=
 =?us-ascii?Q?61+3uwHGXuwW6xX3nFmt9NhNpRVgZnou+RnGcocrR4OFbK8Rimug+4v1UvIn?=
 =?us-ascii?Q?1LPKL8dt2TKcrryvZckQM8N7uSMGQMgBqoLB0ep7KtqhYrnWi40FIdEGFVRX?=
 =?us-ascii?Q?xG8HzQ2mqLDgg5MMhFjb1XEdV9yGJtguRESEvQs4CwohkRc+PA3Rfl0BXbza?=
 =?us-ascii?Q?b9AM6F2W92QzvWca0JAy0Y7c4IXypBWokaRzbqHbER2SOg1PD08/msfWmzpM?=
 =?us-ascii?Q?7w8v9WkopIqEFJdPuG2EbndX5nPMqXoGmKctaWH8VPHKsl3zm526MXIl/Mn8?=
 =?us-ascii?Q?mRmLaxalgkvUtAXzmZ5ttrz8lMmzDkoie5qTpvcZTTspS3tyNqAtxcBcOtS+?=
 =?us-ascii?Q?FZWiePx06H1Ggjuy0gTD9d7UZl6MTzClq7veFxve9IAiZnyYQwnJmOElucGm?=
 =?us-ascii?Q?wahVl/D5cDFf31H/z4tips09KkFCIX+LVLvVYunrwYzcmbBW1iJuEgaIPj9E?=
 =?us-ascii?Q?0z2qZloqHvG/zYHMeK4G3NNYPrNpKQNbRId6Ydjvm5R3GIBxoURX5cO6UkqT?=
 =?us-ascii?Q?viaSgr0Cxmsbs+nwyhK926Kh7v8maFjHSMPdgX3E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e049ad2-f5bd-4389-12ed-08dc9cd11443
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:38.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxwaCzw4OfaWL+gV0MEmY+rL3Qf5+YiEk6fpE/+/uug3Ned/5HdZiwdXJGwmGI6Txh2vwIb3SEFhvwCqlHsmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8038
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

