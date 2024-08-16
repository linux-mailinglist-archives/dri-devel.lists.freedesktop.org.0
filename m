Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C49543AF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD8110E5CF;
	Fri, 16 Aug 2024 08:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cLsfMsTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013005.outbound.protection.outlook.com [52.101.67.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1919610E5CF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxlSC908290oJ/9uOTObd/yen2CHogJExLjbt30cg5ib9BnNWgB59Y6eOCpygFhYAvaz8cVEX0Qu6SAGuIDlwiBVO1f9ak+fq5oapSpyXv/F/d5sm/Nqs5v6GJ8v2M18gPMY5gbULldKyA3DQtk6ffmhJQHYYaiOprJJoZetrk7Vb6+bLu2zxQJUvwF6VXOcf/HIO0NraymIek+MEkBgBDTnX/PRnrETfmMFZvdFtvigXNj8law0jdmCZnlYGoCtjDCZQ8PlzBdLAqdaGZ9Bpugy+mcrrI4WVGF965fRRolY4akmc4KlIGza67D0OFxnQxCEpmlq25xzk2YOrI9vGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SASibpNd9cI06mVGfQKiplrHGCETLJd/7QBCcWPgQJQ=;
 b=e5kGS75uZ+ZwpspysuBZ0xYhLADxrAiyutsG7/w8AHkt7pE9m4SeyB58V5fmLpcOPOaJB/FblUHmo4W1n0r+t12l7pw3I8HRuA66kq1Jy2wc43K0wGbKbloKFXpUXffOVzBDImFKdUO+5XBbR891eR3BqIVax1qYdHD+C43eC1EbRJptQilcd68WvnUb5KYwDooTE70yqDg/n5qBoQ+J0UJknPTy0IPk0CPY6Dk55cRMjStTohRdLR7QNbLn7dkTV9R+q0VUvWt88gQ2kPcnSM+jjNcE6zFmsI/gKio/ZL0yq/FjNOF5cjyVuoIwfe0hdaAKaRU//q1I8C6VrQshVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SASibpNd9cI06mVGfQKiplrHGCETLJd/7QBCcWPgQJQ=;
 b=cLsfMsTcKsPv4SsegxtyQESUwzO5hcI2FDKaVznW6pzsYt+wnFMQ6WiN9U39LIabkm8ORcpK88HvOt4dQYIbKIu408/x2xKxoyKUDEoUqeNs1x2MrrF3mToXjRhsf1Q/99OhtVdNFBhT6DmizfQvfj3lljeQecqblyX52a/qVBm8FccKJtZf7cLxlk98MROa2hOEmIudL6zyDxvyQKRJTE6jXcNX1KSWhv0UUf1Q9Rur8lHq8+bp+iLZXEQ6cgubtUG/lsIvQcTa7H874LDftHKEiQAKj51knQW3pzvvr5I7sdVI+d+9/3BbbsWV7feOICCa+cQgRWfIsIZwkYvvEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9941.eurprd04.prod.outlook.com (2603:10a6:20b:67c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 08:09:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:09:47 +0000
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
 daniel@ffwll.ch, peng.fan@nxp.com
Subject: [PATCH v3 RESEND 2/2] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Date: Fri, 16 Aug 2024 16:09:33 +0800
Message-Id: <20240816080933.440594-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816080933.440594-1-victor.liu@nxp.com>
References: <20240816080933.440594-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: 6156556e-f651-4cd9-3b9f-08dcbdcacb8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vRndcO3nfavVzCNkrocbWKSalL7LosPkemG+gIIkl78SZH6Ls/6TOjaZhcnd?=
 =?us-ascii?Q?6REp4hsOx24O4mRh0raCPAXTQdax1L9zMx7eUrnjRQews7puygFacsqTVnV4?=
 =?us-ascii?Q?4P/0XjLFn0/33qqwUXl6nNdpOuwERnOdPPzgYFn90dRDFdiiUKVXWgycYIZb?=
 =?us-ascii?Q?BuTaW2HSsIKxvM83MjGNzV5c/ERL9TTIgwF1xvQx+KVEcidTq3JoXuSGQmdI?=
 =?us-ascii?Q?W00pI4mtzY/ZXJOMYs2EBs0Nm7L9Eets+MtkV9dklCisQ3+D8Zg2O5r8XMiE?=
 =?us-ascii?Q?I4loqdYYG1sViZF/bX9n12Pb2u3gBUwYh6N3aquuOQQloSgG7p44jPvL96BN?=
 =?us-ascii?Q?zLftsjiwm7728na8pkFPCCABOT8UeY515yEjDoBSvSgZMYSbshfeS2JK82e+?=
 =?us-ascii?Q?qPUdNSjAVma1P3ErskdfNq2P/YLUrDGsjh0ylJU2xK/WvW9NbjEf/tLQXwfW?=
 =?us-ascii?Q?HD+3e0WN+4cZfO16FsxyYa38suhAis+N8YfNPNhDjoKUFbmEvF9cR+Dfl0bL?=
 =?us-ascii?Q?L2VaYEC8A2qPrEbpTnfiGnZmIcPeNN+P2Yo5sdFc+KwdpcTYmS2hrbECJkEg?=
 =?us-ascii?Q?bvPg0IfZgyJqYZ7wkFxygi88nIU12LobvJIiU41xHdhBM88TVS8Rfg9TG452?=
 =?us-ascii?Q?IEkArntOMSAzgU1OS/MJacmkXj6+3YH0t6DfX6sqJv6rikT9IY12VoS8UMrI?=
 =?us-ascii?Q?PrZtt2vn0eL1xH0EuloiJPXzpAB51kvqJfBd8d0kmEZATcgb+R1WykoRYgQ4?=
 =?us-ascii?Q?QNDJA0znI0tvIAycH0V49My9h9MBwkPdIVxFDyPW4a7C8flm6ZVY7aaTxZNp?=
 =?us-ascii?Q?2DGDBwBXQPY1mqqaW8piO/y33j7bqEjq51G+7iFMdO65c69wy7VlBjJps3uc?=
 =?us-ascii?Q?1uHUHROdiK8e9vJyXZWMz+6RzMq1m4hisdAEoxtJ6UfuCJXLXpAWyO7Ao8Nx?=
 =?us-ascii?Q?vf1kDnkbOfB3u+zDCK+0aMQODp3hN/chON1PNSsNy0gsi2xwggvhwZT+WvjL?=
 =?us-ascii?Q?TCq5toL2yWGNk0k65nUQraAzsdRdy9iNY68AWTYAPMDkw+NkJRx7IJa3ibtM?=
 =?us-ascii?Q?X/6+Kq7mwpFsOTm0F9fZbaIYkcS2y8wPp6iwvb3sjv47X/rZFpbfk9LT+8t2?=
 =?us-ascii?Q?hHi2cFhoCzX0OPb5zpmI+KUkvy6HIAvkLfXwXnpKoyzi+/b6aV+Wt5O05aG7?=
 =?us-ascii?Q?II1yaW3XCTJdXSqq7+L5pA5QesDTtq5tCYtJi61ua++Ipiz1aMFoidvbUWJQ?=
 =?us-ascii?Q?carsx50GzgaKNX4l+2G1Kcd76zr/cbbPmzjD3lhy1nVEEY7Ov8ee4TDhfmf8?=
 =?us-ascii?Q?7YgMSOEYlmDGbqMmWFBoyK1kIZGqDh6P0dS9tUsntPvbNUTKxL5i5Eao5cQG?=
 =?us-ascii?Q?1xLVwSU/t3woLXoLZczrLqAzfn8ARsCkPvFAbFNqpIWABm2nVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgTIAqOrFLnO4byxxAwdzwM5x5zcuNHJhEfLYXJXpcdmQ8bNCbGnESohhoBI?=
 =?us-ascii?Q?JV3b3H2yWzpJk0/5zzfMJQkwceDstRXhQBGCk1BL/akj7/hq5vqGiy74Z0GX?=
 =?us-ascii?Q?YwswdE6SDC+UIDVFV9+qhLS9yzQypBydHf3KOMMFiyFGuftVggpf7bktfodv?=
 =?us-ascii?Q?6TgB63Bh0Ctzqk/J2Cz/BJE90Qx00U4V7lFcinSpId3uwwHJGN2Orw1fatEr?=
 =?us-ascii?Q?+8Ivs/gq1mIYItns1yw2eCOAQSZ0PI3Car9uHnWGYLyKBs0V+QNjtBe/0g1E?=
 =?us-ascii?Q?F9SBNjwUDzL1aTg13KHXxR4726G56AHAZQWwiI0tYQp9mQV1eKSIBkM6y2WJ?=
 =?us-ascii?Q?OWwyedCYOVGoRM66Wsiy5S4z+hsNB+g15snqyMtj3kRa6HKRpfvJEMudnoL3?=
 =?us-ascii?Q?7kwZUPiUjrCAsf1rLJ3YZfJar8Gh8jm+70uevH05wO2qrAynpjg/QTVhsRmA?=
 =?us-ascii?Q?Ue7F5sWiL3SldSVLmaoWmFwG2fJnJHvUlAXFYyRVCuT/r83kxotH09AGrYyh?=
 =?us-ascii?Q?2yIzeHVzSG6RkYanAC57FP61fPJc9MO/Kvl8SCRmprhrEmJBsIyrYPFh/NYk?=
 =?us-ascii?Q?cVb7Lb1XtP2L+pq8hQoftn+IzdsNv/GfAJl2TzGyxW3SDd5/QPaGKUE9T9ur?=
 =?us-ascii?Q?NAOUWFNjc4/wu7D/pS9kw3d8BJHLbki6ZNP4WEn93hj7/X86ZMTxkoB5+493?=
 =?us-ascii?Q?//zqQ/CZHKPd//4WTioxUEKM86QVjh2E5k5cDaP/7upNUe2vHbXGBQyyWsY6?=
 =?us-ascii?Q?pjCFYT160fK3YTAqx0S2lFzgDk67hALl7/ltpQCBJeImkG/QQ8mAAQNtGHBo?=
 =?us-ascii?Q?9hUE3EU08hxU/o/ns9KVYcUKCX6YQXvRDO4qNLiw6yNV7RAqbSPSWLW/iBrs?=
 =?us-ascii?Q?h9JakEOK1t5oatUSNwMIxSvKJZGe2hOFwwJ9e+JeUBjzIBHwwpBZeaxFUEMR?=
 =?us-ascii?Q?g8tT81GYOP95eZC6pXJeonOsvMFIUelexTWh0dkxyCMafAf3uM6hKnKycVH/?=
 =?us-ascii?Q?sf7E4rd2R1MNgT5rhhJO78Y6VAY3uF/26CjzBkcWWFfSfpXliu6mPBh63oxT?=
 =?us-ascii?Q?xA+ucGcqOyHEsB4qg+9KDrcuflrDuLrUMSwpTEmBFCiMe01wq2kJtd/tTz/U?=
 =?us-ascii?Q?F0wlPCml4GfJIGLEj6TEV+tEaFLa3YqosR7HkzTM3jUKiloq3W5YELuXzsNk?=
 =?us-ascii?Q?7oUPs619UmmHmFALuWaZ13EEQqyltA3yhuHTHYCWzel1xSHzz5PhZlblRei6?=
 =?us-ascii?Q?iLLa4iq+rMuNFoCAyz6gVLDKbWpwSk6WHySiv/f3Vtb3V6u9/Dkn7+Ok4bTV?=
 =?us-ascii?Q?c5kYjFbofFVfBdov0542/9Lz9Fr5BnF2afbMkjy1pxTPt+iDwbuBkzuPck9K?=
 =?us-ascii?Q?Y30xiqXLYhE7hoD3rdbpbBFxrRn7t35xEEZlASI9CuOsueGSpL8/woLukpBP?=
 =?us-ascii?Q?F/E/nKiShlPxZAJomx4SvqToTdhnvtHN0ozPt1TpmE2eKR3z/98VOv3cozbB?=
 =?us-ascii?Q?kebWRGsA2ZAqYpcYRp0ZlBf5lS+6cLWpQz2TaXf3JPw+QSg952Mc6cD5eKLa?=
 =?us-ascii?Q?D0Pm/8DbPZM7EGSP+R20LrcpW5x94c6Js/BX4p2l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6156556e-f651-4cd9-3b9f-08dcbdcacb8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:09:47.7548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SC24KZibEo2q6Es1NI4ZBiV++9/tw1//KBMoi7LtoxaTfLovZ4RhBoFWfGpDGGJw6UfLy8D9GFauD//JYGaeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9941
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
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 209 ++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
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
index 000000000000..61e01b503be5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022,2023 NXP
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
+#define DRIVER_NAME		"imx93_pdfc"
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
+	int ret;
+
+	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
+	if (!pdfc)
+		return -ENOMEM;
+
+	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdfc->regmap)) {
+		ret = PTR_ERR(pdfc->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(pdfc->next_bridge)) {
+		ret = PTR_ERR(pdfc->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get next bridge: %d\n", ret);
+		return ret;
+	}
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
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx93_pdfc_bridge_driver);
+
+MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.34.1

