Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F79B4213
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440710E5A2;
	Tue, 29 Oct 2024 06:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="grYTjxEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CC110E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD8HbmUvWFLehkh7EvdUvb9/4x+/F7bcXks7dyHXJ4r/1U+1EM4PGsw+7vuDkPTcCiFXuTFqsr/QfTLlG8aVa7VAFGaGFR/o0EDNZ+Ef6992cptdq/Kdfz1GrAgoNfvVxE94Xhhr/frDqtHTSGqwuE889GSedPOS6MZwKeG+lEB/SNIe5qRsDxeZGSaIC5d2mBXJeMw/bR1Sw2CiCRIB0nXe36/q06VH1hsxFHj2r11p+XtIUctg5xb3/mSuI/6FjlxMy3NWCYN1MYRQz2rfFtRytGxssieRm9GSm+VPbFGuABSu/aVE2iT3du8fN5LfZCWD1j18PIMWDkjxdcon9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afaiy8JHKUUfznvTXW1jxGjN4uGARTI4IYeXQXvJZ1Y=;
 b=xrZPRZqJNbnSFetd6vQ2JHH/D0vRqMZdhQTFEBXktucURp4kLcfk37qSvaMxICx3y9sFUpt4ZOQhoSw2YGV7yANXBEtNAibLpNeFZWavad3Zt9ozFu4A3bQSV+eNdhgdPnMO4xWC9/It2rnuDPHVwAfjQ/e4sRO3pUErjrCGALwt/RPItmp42uSa9u5qPWKnSsw2c3MGe6M8NIKKlvMcJdn9Itzhjcm8JGRFfFI0FCOff4o7JXf12EstCKwVYWfTkfasDC3AK6gq4ZA0a8GcJKawqf186HzGlD0P4UiUtn+jYPos1bA1vtzByOOAI3kE3mfYS6CkY/a8PYNgxOrKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afaiy8JHKUUfznvTXW1jxGjN4uGARTI4IYeXQXvJZ1Y=;
 b=grYTjxEfECy87Xsq30Qv8EaJ+gBCBRAEu5nKyMkd/niY1kuXCnDaY44fEixskyjqluTdpmXcDZ0wOAhvtfK2OAhf+nszTXTelqqtdFFf+Yj7PkWExZ/nKr7av4P3Q8tSU21kjm8yFpMcqOx9myEoy8zonVBwbwxtNqOZHGWzbntSVw5j3Jl+kzkIK2In8NUVz/MrGEw28kdipB2qciK+4rl1rWEyiqZcgBVB9Vgl2ruMCM5bYxGJHOG+6NSIbA7GaPlsGlC84aRF1fL0huJC+WZeFMg+ZJz9QJ9k+kVou+GH5RtAMFQExKehzYks/iZBGU/u4uu99UhGVWYw/CBVFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10202.eurprd04.prod.outlook.com (2603:10a6:150:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:05:03 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:05:03 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY driver
 for i.MX8MQ
Date: Tue, 29 Oct 2024 14:02:14 +0800
Message-Id: <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730172244.git.Sandor.yu@nxp.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c41ae15-1331-4fa6-9d00-08dcf7dfa112
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A6Wi7pXpk9uYzM9KrBxZeRFV6FId5637hvBKIhka3frO328y0sIU3FcxkccQ?=
 =?us-ascii?Q?xJ8k01JJNX5jvYm5Sth/tm2W1i/viYlrm6pn26ZN6j20UWVqas0UFxhR0JDj?=
 =?us-ascii?Q?1xMxo+JYn2TMGpy4DbCLGFuTxHJzuT0q6dHWn2xglGoKDVZs56Eu0xbomNYS?=
 =?us-ascii?Q?PdR37wOPCWrw89XF51bKbHE5TMuOvVGjWBAXL1IT6FDw1UafQd65/9OoH/Ky?=
 =?us-ascii?Q?qRee+DMex29lRQ2+1r02PcCoMTR8FyEsUAYrqOKLPtE2yKwT5uUd8KWv88ZC?=
 =?us-ascii?Q?mZNKXI7HHM/W2iTgNcPBfn6UihqxWw0NO1zHvLtqlPDJqNyhh6quFQaK292G?=
 =?us-ascii?Q?G6b4XbxuoTRj5OZwyG+1Mekf7R/FvtJ0MyVeiowcOoBCpk6Zp4PoNw+fGDkE?=
 =?us-ascii?Q?WlGEf99sMCJVmIy3z+uqgSpShf/SRR00XahrXnPDv9Ab2M9Bmf4+aQOnmcDW?=
 =?us-ascii?Q?+XqwybRr8kykCz6nYB7rFc/3K0Hha5C0oC849P6kbXOhrmFgaG7fXyvz/V4k?=
 =?us-ascii?Q?yaN4Vkqyr4lF3vx0l5B4OwsOoc9Dw1c8fJrOvspeERWr53TES04OZQTB4SQR?=
 =?us-ascii?Q?AalYOBNW+F/tBEopFYPPZ54T5uY13+uU919KqRInR2SdQ8Qghc8TlsrO/tlU?=
 =?us-ascii?Q?A5fkdZ+aMLa+rYRcb1/EH/3zMvY25XDDYxR2uBtgul3UE1HRA+TUQTpgTs80?=
 =?us-ascii?Q?xB6VXnnqnYhJV8wBOb54+EdYNaw8tEFawTRxGuQKoMrkIbicfRoBV5dY6Dwg?=
 =?us-ascii?Q?AJtaIQjWRMA7sP/7Iyk7BHQuUpb/yq+ZWELsKvYRcmmJTH+HaNObzbZsClyF?=
 =?us-ascii?Q?LT5mCRn1Ubw7MceMDfqaNehr3JC0aS56WQ3Xcr3wHeYlEYMHVUCJ3c/ytKcT?=
 =?us-ascii?Q?gMa9EzVUajuDGAWyeWXPnEfLJ8tjTpRDXl0iq/1Bbat9M8SJv01kgEW+EnNU?=
 =?us-ascii?Q?CeCQg+PA5KhkKaHUulP9frwRGOxzWH4x8cQ4aSgw5N0m0jkwRnXaP9YiS86l?=
 =?us-ascii?Q?jtEAcHpIJs5jvup3RC5HfEHuvkgT2hW7aRCHWI1zQOJ/ViyPSiaS0/w9gNM0?=
 =?us-ascii?Q?3r8xonXByuPkf/HjmpgYYxCh//4nG7VHNN7ddPchfprs25CMQr9Mv4H/PXTW?=
 =?us-ascii?Q?m7S9eDQRS6U8lwjITqfOlYEBorlB1kt6bPg3K+d+DckYLulkQRAqzSuixi/m?=
 =?us-ascii?Q?fafeowZrujyzcreRWW+Phs9jDKyQcFYNYoQEDR5yYpKDqQm4a5AWNsx7N0J7?=
 =?us-ascii?Q?/cfzE4mem7KSvZRku+Iy1Y1s/5pFWRm45DirGxFODytAy7cXqJVvqWQ40rhO?=
 =?us-ascii?Q?Mfy0ing7kX8LsLsdrDuIS6hd4tUqcddAjtlFs1odcK8DF6zgEX9svFnr+5Oz?=
 =?us-ascii?Q?Ii7M88UbK5qZp6jXnnfMYU8WyPuv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FbNjAtN8H/kOn8DFCxhuZD3kmgqpQGhsyJNao+7umrIZl5FqYA2UFe5GNsv0?=
 =?us-ascii?Q?DRZy5NgiASpZWynxbbTaqFcYMSUMz8TXTbETR/qm479Z220KKN7jfV+oCbiV?=
 =?us-ascii?Q?cTg6Z77A+tGCiF/kIC7ZnR8TUU+9mlwqnx6LNTQYAdExjTMPi547ZPHbulFp?=
 =?us-ascii?Q?9zt77j9Mj5Qn1S4P4pNAtFp9hNg/dRJMPA+b4g5QB0BQlz5lsUAuOa5MSRO2?=
 =?us-ascii?Q?Q0Mi1mqb92CSyUK2NdhU9oq1vKtLfF38D3ZVMtIajzBnsvTjLFz+DBd7/Tul?=
 =?us-ascii?Q?VelmRM2yzNijFQChsK8JTG/SHghY6e9Pfw2Y+juQsTGuhMDlyLmbwZ+6/T7C?=
 =?us-ascii?Q?KmDvnJ9vfc37Z9RWQIGMn/NlZJYSR/vd24CZptdFNR49S45EqaDTZd+hPoE6?=
 =?us-ascii?Q?EJcujJ+gYtu1jJMUpzig3lBPG46/Yx9OXEFjT9Wagv8u2CbzYc1j8wC4PrWq?=
 =?us-ascii?Q?SE1KDnj/NOAzrayMtkPQWukS9nOykRkENQhBfviHxt4RYJ24cCmCGv8O9P5d?=
 =?us-ascii?Q?vqUiF4jbRn/en00lNyrNcTJXyB5KQLwElTBk2N8ZknT0Th6xn72ZhGQttw84?=
 =?us-ascii?Q?VUQ6FtvKWc7roN5zaw7aOQOoxaq2O+ATZLEM6fpq8MmxDKbcV3g9Td1aSBiU?=
 =?us-ascii?Q?9+gLlxp3ngNsrrTXvLpZisXUW4c1+ftxT1snxhkfnDNYE+B86dXQ0pwrvUYU?=
 =?us-ascii?Q?V7LyMvYqleX9/3fCln3HlQuLUmy2TfE5bvPymzfR0UdQWYD6tnkiGeoGOvQU?=
 =?us-ascii?Q?g83fWGoQFc0+7EVkDPCltVXAVAqUSqFMQ/Cq7dce2A3sPi4TGmhb8k0Bw6TB?=
 =?us-ascii?Q?kA6M+XFcx5v9idwS825GsdCoKshcTC04WvBmXrmVNdihPJzn+f4ytIwF5skT?=
 =?us-ascii?Q?6NNcX7bOuvfAYKkPKLmAn4dMi04MZSL63SB0foVqyr8sYIbFP17KFCLZW7R6?=
 =?us-ascii?Q?isIF5ehFFQv3/LMIqUOsB3X0pzaHbSXX4N4PZ/GugkgkE4E0N3/7mmdy1T41?=
 =?us-ascii?Q?tjbhUBPecqPl6gRQ7pJhA7QqFWJy7Ih9j+vkzUKNzjMsM5LOsdDk4plxl1PC?=
 =?us-ascii?Q?VDE6Ap/Lcyb3gDVvsAcZ+4FP9uuwf3banHzSq7jhvfyDy65oT6xbnSTvxJv5?=
 =?us-ascii?Q?HVJQqqPgbFI4WzSsxJhguXkhBE23fLWz8HMOLBIGW29vBYnXAgbnknHINRRi?=
 =?us-ascii?Q?Sg3bIbkeDqAFiKWquUgGK2WdyWJQxjmixVweBIXZHc7LQd3D4ZNfTRSTV8zK?=
 =?us-ascii?Q?0vvr/e3lQz//FZkWK3Kb22DHrqrzap+sgirSWKFLAX+hLUxNbbGvt59Ho2fR?=
 =?us-ascii?Q?Zggh4lKdLdY1bHSIODe7Tse8fYYZIHmPYzBDrIBC0cg3d5OfC+sF4nNP6Zh+?=
 =?us-ascii?Q?u7Ts32cZ+Tnyyz41LekyowgqupcsutMJxEFR2TG8T4ukBXIbhZAYA6YTIv71?=
 =?us-ascii?Q?X3PfKRQGbObxTrtC1cvavz9VIhryob8QEGNBd1HcPTJ2opMD2SCghxmhrRYQ?=
 =?us-ascii?Q?R/5OQKIyu5toS/PXcRszUIptL4q8juQDeoJB5QGrckNmevJYKtJ2kncxynKd?=
 =?us-ascii?Q?aJwbGxpq9JFVYZyysyQZsIsyvWdqXZEzGaTean12?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c41ae15-1331-4fa6-9d00-08dcf7dfa112
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:05:03.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywyGfpAcEI34RDErOvxQX8NdIQhvqvIP+XQ5WnHXJyq13EwY6kuupCNQFkZIrRt6z1KloTbx5ssPQ9TAOmoEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10202
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

Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.

Cadence HDP-TX PHY could be put in either DP mode or
HDMI mode base on the configuration chosen.
DisplayPort or HDMI PHY mode is configured in the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
v17->v18:
- fix build error as code rebase to latest kernel version.

 drivers/phy/freescale/Kconfig                |   10 +
 drivers/phy/freescale/Makefile               |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337 ++++++++++++++++++
 3 files changed, 1348 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index dcd9acff6d01a..2b1210367b31c 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_FSL_IMX8MQ_HDPTX
+	tristate "Freescale i.MX8MQ DP/HDMI PHY support"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	select CDNS_MHDP_HELPER
+	help
+	  Enable this to support the Cadence HDPTX DP/HDMI PHY driver
+	  on i.MX8MQ SOC.
+
 config PHY_FSL_IMX8QM_HSIO
 	tristate "Freescale i.MX8QM HSIO PHY"
 	depends on OF && HAS_IOMEM
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 658eac7d0a622..a946b87905498 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_FSL_IMX8MQ_HDPTX)	+= phy-fsl-imx8mq-hdptx.o
 obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
new file mode 100644
index 0000000000000..7aac39df0ab02
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
@@ -0,0 +1,1337 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence DP/HDMI PHY driver
+ *
+ * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
+ */
+#include <drm/bridge/cdns-mhdp-helper.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/unaligned.h>
+
+#define ADDR_PHY_AFE	0x80000
+
+/* PHY registers */
+#define CMN_SSM_BIAS_TMR			0x0022
+#define CMN_PLLSM0_PLLEN_TMR			0x0029
+#define CMN_PLLSM0_PLLPRE_TMR			0x002a
+#define CMN_PLLSM0_PLLVREF_TMR			0x002b
+#define CMN_PLLSM0_PLLLOCK_TMR			0x002c
+#define CMN_PLLSM0_USER_DEF_CTRL		0x002f
+#define CMN_PSM_CLK_CTRL			0x0061
+#define CMN_CDIAG_REFCLK_CTRL			0x0062
+#define CMN_PLL0_VCOCAL_START			0x0081
+#define CMN_PLL0_VCOCAL_INIT_TMR		0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR		0x0085
+#define CMN_PLL0_INTDIV				0x0094
+#define CMN_PLL0_FRACDIV			0x0095
+#define CMN_PLL0_HIGH_THR			0x0096
+#define CMN_PLL0_DSM_DIAG			0x0097
+#define CMN_PLL0_SS_CTRL2			0x0099
+#define CMN_ICAL_INIT_TMR			0x00c4
+#define CMN_ICAL_ITER_TMR			0x00c5
+#define CMN_RXCAL_INIT_TMR			0x00d4
+#define CMN_RXCAL_ITER_TMR			0x00d5
+#define CMN_TXPUCAL_CTRL			0x00e0
+#define CMN_TXPUCAL_INIT_TMR			0x00e4
+#define CMN_TXPUCAL_ITER_TMR			0x00e5
+#define CMN_TXPDCAL_CTRL			0x00f0
+#define CMN_TXPDCAL_INIT_TMR			0x00f4
+#define CMN_TXPDCAL_ITER_TMR			0x00f5
+#define CMN_ICAL_ADJ_INIT_TMR			0x0102
+#define CMN_ICAL_ADJ_ITER_TMR			0x0103
+#define CMN_RX_ADJ_INIT_TMR			0x0106
+#define CMN_RX_ADJ_ITER_TMR			0x0107
+#define CMN_TXPU_ADJ_CTRL			0x0108
+#define CMN_TXPU_ADJ_INIT_TMR			0x010a
+#define CMN_TXPU_ADJ_ITER_TMR			0x010b
+#define CMN_TXPD_ADJ_CTRL			0x010c
+#define CMN_TXPD_ADJ_INIT_TMR			0x010e
+#define CMN_TXPD_ADJ_ITER_TMR			0x010f
+#define CMN_DIAG_PLL0_FBH_OVRD			0x01c0
+#define CMN_DIAG_PLL0_FBL_OVRD			0x01c1
+#define CMN_DIAG_PLL0_OVRD			0x01c2
+#define CMN_DIAG_PLL0_TEST_MODE			0x01c4
+#define CMN_DIAG_PLL0_V2I_TUNE			0x01c5
+#define CMN_DIAG_PLL0_CP_TUNE			0x01c6
+#define CMN_DIAG_PLL0_LF_PROG			0x01c7
+#define CMN_DIAG_PLL0_PTATIS_TUNE1		0x01c8
+#define CMN_DIAG_PLL0_PTATIS_TUNE2		0x01c9
+#define CMN_DIAG_PLL0_INCLK_CTRL		0x01ca
+#define CMN_DIAG_PLL0_PXL_DIVH			0x01cb
+#define CMN_DIAG_PLL0_PXL_DIVL			0x01cc
+#define CMN_DIAG_HSCLK_SEL			0x01e0
+#define CMN_DIAG_PER_CAL_ADJ			0x01ec
+#define CMN_DIAG_CAL_CTRL			0x01ed
+#define CMN_DIAG_ACYA				0x01ff
+#define XCVR_PSM_RCTRL				0x4001
+#define XCVR_PSM_CAL_TMR			0x4002
+#define XCVR_PSM_A0IN_TMR			0x4003
+#define TX_TXCC_CAL_SCLR_MULT_0			0x4047
+#define TX_TXCC_CPOST_MULT_00_0			0x404c
+#define XCVR_DIAG_PLLDRC_CTRL			0x40e0
+#define XCVR_DIAG_HSCLK_SEL			0x40e1
+#define XCVR_DIAG_BIDI_CTRL			0x40e8
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR		0x40f2
+#define TX_PSC_A0				0x4100
+#define TX_PSC_A1				0x4101
+#define TX_PSC_A2				0x4102
+#define TX_PSC_A3				0x4103
+#define TX_RCVDET_EN_TMR			0x4122
+#define TX_RCVDET_ST_TMR			0x4123
+#define TX_DIAG_TX_CTRL				0x41e0
+#define TX_DIAG_TX_DRV				0x41e1
+#define TX_DIAG_BGREF_PREDRV_DELAY		0x41e7
+#define TX_DIAG_ACYA_0				0x41ff
+#define TX_DIAG_ACYA_1				0x43ff
+#define TX_DIAG_ACYA_2				0x45ff
+#define TX_DIAG_ACYA_3				0x47ff
+#define TX_ANA_CTRL_REG_1			0x5020
+#define TX_ANA_CTRL_REG_2			0x5021
+#define TX_DIG_CTRL_REG_1			0x5023
+#define TX_DIG_CTRL_REG_2			0x5024
+#define TXDA_CYA_AUXDA_CYA			0x5025
+#define TX_ANA_CTRL_REG_3			0x5026
+#define TX_ANA_CTRL_REG_4			0x5027
+#define TX_ANA_CTRL_REG_5			0x5029
+#define RX_PSC_A0				0x8000
+#define RX_PSC_CAL				0x8006
+#define PHY_HDP_MODE_CTRL			0xc008
+#define PHY_HDP_CLK_CTL				0xc009
+#define PHY_ISO_CMN_CTRL			0xc010
+#define PHY_PMA_CMN_CTRL1			0xc800
+#define PHY_PMA_ISO_CMN_CTRL			0xc810
+#define PHY_PMA_ISO_PLL_CTRL1			0xc812
+#define PHY_PMA_ISOLATION_CTRL			0xc81f
+
+/* PHY_HDP_CLK_CTL */
+#define PLL_DATA_RATE_CLK_DIV_MASK		GENMASK(15, 8)
+#define PLL_DATA_RATE_CLK_DIV_HBR		0x24
+#define PLL_DATA_RATE_CLK_DIV_HBR2		0x12
+#define PLL_CLK_EN_ACK				BIT(3)
+#define PLL_CLK_EN				BIT(2)
+#define PLL_READY				BIT(1)
+#define PLL_EN					BIT(0)
+
+/* PHY_PMA_CMN_CTRL1 */
+#define CMA_REF_CLK_DIG_DIV_MASK		GENMASK(13, 12)
+#define CMA_REF_CLK_SEL_MASK			GENMASK(6, 4)
+#define CMA_REF_CLK_RCV_EN_MASK			BIT(3)
+#define CMA_REF_CLK_RCV_EN			1
+#define CMN_READY				BIT(0)
+
+/* PHY_PMA_ISO_PLL_CTRL1 */
+#define CMN_PLL0_CLK_DATART_DIV_MASK		GENMASK(7, 0)
+
+/* TX_DIAG_TX_DRV */
+#define TX_DRIVER_PROG_BOOST_ENABLE		BIT(10)
+#define TX_DRIVER_PROG_BOOST_LEVEL_MASK		GENMASK(9, 8)
+#define TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE	BIT(7)
+#define TX_DRIVER_LDO_BANDGAP_REF_ENABLE	BIT(6)
+
+/* TX_TXCC_CAL_SCLR_MULT_0 */
+#define SCALED_RESISTOR_CALIBRATION_CODE_ADD	BIT(8)
+#define RESISTOR_CAL_MULT_VAL_32_128		BIT(5)
+
+/* CMN_CDIAG_REFCLK_CTRL */
+#define DIG_REF_CLK_DIV_SCALER_MASK		GENMASK(14, 12)
+#define REFCLK_TERMINATION_EN_OVERRIDE_EN	BIT(7)
+#define REFCLK_TERMINATION_EN_OVERRIDE		BIT(6)
+
+/* CMN_DIAG_HSCLK_SEL */
+#define HSCLK1_SEL_MASK				GENMASK(5, 4)
+#define HSCLK0_SEL_MASK				GENMASK(1, 0)
+#define HSCLK_PLL0_DIV2				1
+
+/* XCVR_DIAG_HSCLK_SEL */
+#define HSCLK_SEL_MODE3_MASK			GENMASK(13, 12)
+#define HSCLK_SEL_MODE3_HSCLK1			1
+
+/* CMN_PLL0_VCOCAL_START */
+#define VCO_CALIB_CODE_START_POINT_VAL_MASK	GENMASK(8, 0)
+
+/* CMN_DIAG_PLL0_FBH_OVRD */
+#define PLL_FEEDBACK_DIV_HI_OVERRIDE_EN		BIT(15)
+
+/* CMN_DIAG_PLL0_FBL_OVRD */
+#define PLL_FEEDBACK_DIV_LO_OVERRIDE_EN		BIT(15)
+
+/* CMN_DIAG_PLL0_PXL_DIVH */
+#define PLL_PCLK_DIV_EN				BIT(15)
+
+/* XCVR_DIAG_PLLDRC_CTRL */
+#define DPLL_CLK_SEL_MODE3			BIT(14)
+#define DPLL_DATA_RATE_DIV_MODE3_MASK		GENMASK(13, 12)
+
+/* TX_DIAG_TX_CTRL */
+#define TX_IF_SUBRATE_MODE3_MASK		GENMASK(7, 6)
+
+/* PHY_HDP_MODE_CTRL */
+#define POWER_STATE_A3_ACK			BIT(7)
+#define POWER_STATE_A2_ACK			BIT(6)
+#define POWER_STATE_A1_ACK			BIT(5)
+#define POWER_STATE_A0_ACK			BIT(4)
+#define POWER_STATE_A3				BIT(3)
+#define POWER_STATE_A2				BIT(2)
+#define POWER_STATE_A1				BIT(1)
+#define POWER_STATE_A0				BIT(0)
+
+/* PHY_PMA_ISO_CMN_CTRL */
+#define CMN_MACRO_PWR_EN_ACK			BIT(5)
+
+#define KEEP_ALIVE		0x18
+
+#define REF_CLK_27MHZ		27000000
+
+/* HDMI TX clock control settings */
+struct hdptx_hdmi_ctrl {
+	u32 pixel_clk_freq_min;
+	u32 pixel_clk_freq_max;
+	u32 feedback_factor;
+	u32 data_range_kbps_min;
+	u32 data_range_kbps_max;
+	u32 cmnda_pll0_ip_div;
+	u32 cmn_ref_clk_dig_div;
+	u32 ref_clk_divider_scaler;
+	u32 pll_fb_div_total;
+	u32 cmnda_pll0_fb_div_low;
+	u32 cmnda_pll0_fb_div_high;
+	u32 pixel_div_total;
+	u32 cmnda_pll0_pxdiv_low;
+	u32 cmnda_pll0_pxdiv_high;
+	u32 vco_freq_min;
+	u32 vco_freq_max;
+	u32 vco_ring_select;
+	u32 cmnda_hs_clk_0_sel;
+	u32 cmnda_hs_clk_1_sel;
+	u32 hsclk_div_at_xcvr;
+	u32 hsclk_div_tx_sub_rate;
+	u32 cmnda_pll0_hs_sym_div_sel;
+	u32 cmnda_pll0_clk_freq_min;
+	u32 cmnda_pll0_clk_freq_max;
+};
+
+struct cdns_hdptx_phy {
+	struct cdns_mhdp_base base;
+
+	void __iomem *regs;	/* DPTX registers base */
+	struct device *dev;
+	struct phy *phy;
+	struct clk *ref_clk, *apb_clk;
+	u32 ref_clk_rate;
+	bool power_up;
+	union {
+		struct phy_configure_opts_hdmi hdmi;
+		struct phy_configure_opts_dp dp;
+	};
+};
+
+/* HDMI TX clock control settings, pixel clock is output */
+static const struct hdptx_hdmi_ctrl pixel_clk_output_ctrl_table[] = {
+/*Minclk  Maxclk Fdbak  DR_min   DR_max  ip_d  dig  DS    Totl */
+{ 27000,  27000, 1000,  270000,  270000, 0x03, 0x1, 0x1,  240, 0x0bc, 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x3,  27000,  27000},
+{ 27000,  27000, 1250,  337500,  337500, 0x03, 0x1, 0x1,  300, 0x0ec, 0x03c, 100, 0x030, 0x030, 2700000, 2700000, 0, 2, 2, 2, 4, 0x3,  33750,  33750},
+{ 27000,  27000, 1500,  405000,  405000, 0x03, 0x1, 0x1,  360, 0x11c, 0x048, 120, 0x03a, 0x03a, 3240000, 3240000, 0, 2, 2, 2, 4, 0x3,  40500,  40500},
+{ 27000,  27000, 2000,  540000,  540000, 0x03, 0x1, 0x1,  240, 0x0bc, 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x2,  54000,  54000},
+{ 54000,  54000, 1000,  540000,  540000, 0x03, 0x1, 0x1,  480, 0x17c, 0x060,  80, 0x026, 0x026, 4320000, 4320000, 1, 2, 2, 2, 4, 0x3,  54000,  54000},
+{ 54000,  54000, 1250,  675000,  675000, 0x04, 0x1, 0x1,  400, 0x13c, 0x050,  50, 0x017, 0x017, 2700000, 2700000, 0, 1, 1, 2, 4, 0x2,  67500,  67500},
+{ 54000,  54000, 1500,  810000,  810000, 0x04, 0x1, 0x1,  480, 0x17c, 0x060,  60, 0x01c, 0x01c, 3240000, 3240000, 0, 2, 2, 2, 2, 0x2,  81000,  81000},
+{ 54000,  54000, 2000, 1080000, 1080000, 0x03, 0x1, 0x1,  240, 0x0bc, 0x030,  40, 0x012, 0x012, 2160000, 2160000, 0, 2, 2, 2, 1, 0x1, 108000, 108000},
+{ 74250,  74250, 1000,  742500,  742500, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  80, 0x026, 0x026, 5940000, 5940000, 1, 2, 2, 2, 4, 0x3,  74250,  74250},
+{ 74250,  74250, 1250,  928125,  928125, 0x04, 0x1, 0x1,  550, 0x1b4, 0x06e,  50, 0x017, 0x017, 3712500, 3712500, 1, 1, 1, 2, 4, 0x2,  92812,  92812},
+{ 74250,  74250, 1500, 1113750, 1113750, 0x04, 0x1, 0x1,  660, 0x20c, 0x084,  60, 0x01c, 0x01c, 4455000, 4455000, 1, 2, 2, 2, 2, 0x2, 111375, 111375},
+{ 74250,  74250, 2000, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104, 0x042,  40, 0x012, 0x012, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500, 148500},
+{ 99000,  99000, 1000,  990000,  990000, 0x03, 0x1, 0x1,  440, 0x15c, 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 2, 0x2,  99000,  99000},
+{ 99000,  99000, 1250, 1237500, 1237500, 0x03, 0x1, 0x1,  275, 0x0d8, 0x037,  25, 0x00b, 0x00a, 2475000, 2475000, 0, 1, 1, 2, 2, 0x1, 123750, 123750},
+{ 99000,  99000, 1500, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104, 0x042,  30, 0x00d, 0x00d, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500, 148500},
+{ 99000,  99000, 2000, 1980000, 1980000, 0x03, 0x1, 0x1,  440, 0x15c, 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 1, 0x1, 198000, 198000},
+{148500, 148500, 1000, 1485000, 1485000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 2, 0x2, 148500, 148500},
+{148500, 148500, 1250, 1856250, 1856250, 0x04, 0x1, 0x1,  550, 0x1b4, 0x06e,  25, 0x00b, 0x00a, 3712500, 3712500, 1, 1, 1, 2, 2, 0x1, 185625, 185625},
+{148500, 148500, 1500, 2227500, 2227500, 0x03, 0x1, 0x1,  495, 0x188, 0x063,  30, 0x00d, 0x00d, 4455000, 4455000, 1, 1, 1, 2, 2, 0x1, 222750, 222750},
+{148500, 148500, 2000, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 1, 0x1, 297000, 297000},
+{198000, 198000, 1000, 1980000, 1980000, 0x03, 0x1, 0x1,  220, 0x0ac, 0x02c,  10, 0x003, 0x003, 1980000, 1980000, 0, 1, 1, 2, 1, 0x0, 198000, 198000},
+{198000, 198000, 1250, 2475000, 2475000, 0x03, 0x1, 0x1,  550, 0x1b4, 0x06e,  25, 0x00b, 0x00a, 4950000, 4950000, 1, 1, 1, 2, 2, 0x1, 247500, 247500},
+{198000, 198000, 1500, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104, 0x042,  15, 0x006, 0x005, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000, 297000},
+{198000, 198000, 2000, 3960000, 3960000, 0x03, 0x1, 0x1,  440, 0x15c, 0x058,  20, 0x008, 0x008, 3960000, 3960000, 1, 1, 1, 2, 1, 0x0, 396000, 396000},
+{297000, 297000, 1000, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104, 0x042,  10, 0x003, 0x003, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000, 297000},
+{297000, 297000, 1500, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188, 0x063,  15, 0x006, 0x005, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500, 445500},
+{297000, 297000, 2000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  20, 0x008, 0x008, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000, 594000},
+{594000, 594000, 1000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000, 594000},
+{594000, 594000,  750, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188, 0x063,  10, 0x003, 0x003, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500, 445500},
+{594000, 594000,  625, 3712500, 3712500, 0x04, 0x1, 0x1,  550, 0x1b4, 0x06e,  10, 0x003, 0x003, 3712500, 3712500, 1, 1, 1, 2, 1, 0x0, 371250, 371250},
+{594000, 594000,  500, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 2, 0x1, 297000, 297000},
+};
+
+/* HDMI TX PLL tuning settings */
+struct hdptx_hdmi_pll_tuning {
+	u32 vco_freq_bin;
+	u32 vco_freq_min;
+	u32 vco_freq_max;
+	u32 volt_to_current_coarse;
+	u32 volt_to_current;
+	u32 ndac_ctrl;
+	u32 pmos_ctrl;
+	u32 ptat_ndac_ctrl;
+	u32 feedback_div_total;
+	u32 charge_pump_gain;
+	u32 coarse_code;
+	u32 v2i_code;
+	u32 vco_cal_code;
+};
+
+/* HDMI TX PLL tuning settings, pixel clock is output */
+static const struct hdptx_hdmi_pll_tuning pixel_clk_output_pll_table[] = {
+/*bin VCO_freq min/max  coar  cod NDAC  PMOS PTAT div-T P-Gain Coa V2I CAL */
+{  1, 1980000, 1980000, 0x4, 0x3, 0x0, 0x09, 0x09, 220, 0x42, 160, 5, 183 },
+{  2, 2160000, 2160000, 0x4, 0x3, 0x0, 0x09, 0x09, 240, 0x42, 166, 6, 208 },
+{  3, 2475000, 2475000, 0x5, 0x3, 0x1, 0x00, 0x07, 275, 0x42, 167, 6, 209 },
+{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 300, 0x42, 188, 6, 230 },
+{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 400, 0x4c, 188, 6, 230 },
+{  5, 2970000, 2970000, 0x6, 0x3, 0x1, 0x00, 0x07, 330, 0x42, 183, 6, 225 },
+{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 360, 0x42, 203, 7, 256 },
+{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 480, 0x4c, 203, 7, 256 },
+{  7, 3712500, 3712500, 0x4, 0x3, 0x0, 0x07, 0x0F, 550, 0x4c, 212, 7, 257 },
+{  8, 3960000, 3960000, 0x5, 0x3, 0x0, 0x07, 0x0F, 440, 0x42, 184, 6, 226 },
+{  9, 4320000, 4320000, 0x5, 0x3, 0x1, 0x07, 0x0F, 480, 0x42, 205, 7, 258 },
+{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 495, 0x42, 219, 7, 272 },
+{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 660, 0x4c, 219, 7, 272 },
+{ 11, 4950000, 4950000, 0x6, 0x3, 0x1, 0x00, 0x07, 550, 0x42, 213, 7, 258 },
+{ 12, 5940000, 5940000, 0x7, 0x3, 0x1, 0x00, 0x07, 660, 0x42, 244, 8, 292 },
+};
+
+enum dp_link_rate {
+	RATE_1_6 = 162000,
+	RATE_2_1 = 216000,
+	RATE_2_4 = 243000,
+	RATE_2_7 = 270000,
+	RATE_3_2 = 324000,
+	RATE_4_3 = 432000,
+	RATE_5_4 = 540000,
+};
+
+#define MAX_LINK_RATE RATE_5_4
+
+struct phy_pll_reg {
+	u16 val[7];
+	u32 addr;
+};
+
+static const struct phy_pll_reg phy_pll_27m_cfg[] = {
+	/*  1.62    2.16    2.43    2.7     3.24    4.32    5.4      register address */
+	{{ 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e }, CMN_PLL0_VCOCAL_INIT_TMR },
+	{{ 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b }, CMN_PLL0_VCOCAL_ITER_TMR },
+	{{ 0x30b9, 0x3087, 0x3096, 0x30b4, 0x30b9, 0x3087, 0x30b4 }, CMN_PLL0_VCOCAL_START },
+	{{ 0x0077, 0x009f, 0x00b3, 0x00c7, 0x0077, 0x009f, 0x00c7 }, CMN_PLL0_INTDIV },
+	{{ 0xf9da, 0xf7cd, 0xf6c7, 0xf5c1, 0xf9da, 0xf7cd, 0xf5c1 }, CMN_PLL0_FRACDIV },
+	{{ 0x001e, 0x0028, 0x002d, 0x0032, 0x001e, 0x0028, 0x0032 }, CMN_PLL0_HIGH_THR },
+	{{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 }, CMN_PLL0_DSM_DIAG },
+	{{ 0x0000, 0x1000, 0x1000, 0x1000, 0x0000, 0x1000, 0x1000 }, CMN_PLLSM0_USER_DEF_CTRL },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_OVRD },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_FBH_OVRD },
+	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_FBL_OVRD },
+	{{ 0x0006, 0x0007, 0x0007, 0x0007, 0x0006, 0x0007, 0x0007 }, CMN_DIAG_PLL0_V2I_TUNE },
+	{{ 0x0043, 0x0043, 0x0043, 0x0042, 0x0043, 0x0043, 0x0042 }, CMN_DIAG_PLL0_CP_TUNE },
+	{{ 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008 }, CMN_DIAG_PLL0_LF_PROG },
+	{{ 0x0100, 0x0001, 0x0001, 0x0001, 0x0100, 0x0001, 0x0001 }, CMN_DIAG_PLL0_PTATIS_TUNE1 },
+	{{ 0x0007, 0x0001, 0x0001, 0x0001, 0x0007, 0x0001, 0x0001 }, CMN_DIAG_PLL0_PTATIS_TUNE2 },
+	{{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 }, CMN_DIAG_PLL0_TEST_MODE},
+	{{ 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016 }, CMN_PSM_CLK_CTRL }
+};
+
+static int dp_link_rate_index(u32 rate)
+{
+	switch (rate) {
+	case RATE_1_6:
+		return 0;
+	case RATE_2_1:
+		return 1;
+	case RATE_2_4:
+		return 2;
+	case RATE_2_7:
+		return 3;
+	case RATE_3_2:
+		return 4;
+	case RATE_4_3:
+		return 5;
+	case RATE_5_4:
+	default:
+		return 6;
+	}
+}
+
+static int cdns_phy_reg_write(struct cdns_hdptx_phy *cdns_phy, u32 addr, u32 val)
+{
+	return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE + (addr << 2), val);
+}
+
+static u32 cdns_phy_reg_read(struct cdns_hdptx_phy *cdns_phy, u32 addr)
+{
+	u32 reg32;
+
+	cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr << 2), &reg32);
+
+	return reg32;
+}
+
+static void hdptx_dp_aux_cfg(struct cdns_hdptx_phy *cdns_phy)
+{
+	/* Power up Aux */
+	cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 1);
+
+	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_1, 0x3);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, 36);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa018);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa098);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa198);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
+}
+
+/* PMA common configuration for 27MHz */
+static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->dp.lanes;
+	u16 val;
+	int k;
+
+	/* Enable PMA input ref clk(CMN_REF_CLK_RCV_EN) */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= ~CMA_REF_CLK_RCV_EN_MASK;
+	val |= FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK, CMA_REF_CLK_RCV_EN);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* Startup state machine registers */
+	cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR, 0x001b);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR, 0x0036);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR, 0x001b);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR, 0x006c);
+
+	/* Current calibration registers */
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_INIT_TMR, 0x0044);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_ITER_TMR, 0x0006);
+
+	/* Resistor calibration registers */
+	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_ITER_TMR, 0x0006);
+	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_INIT_TMR, 0x0022);
+	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_ITER_TMR, 0x0006);
+
+	for (k = 0; k < num_lanes; k = k + 1) {
+		/* Power state machine registers */
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  | (k << 9), 0x016d);
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR | (k << 9), 0x016d);
+		/* Transceiver control and diagnostic registers */
+		cdns_phy_reg_write(cdns_phy, XCVR_DIAG_LANE_FCM_EN_MGN_TMR | (k << 9), 0x00a2);
+		cdns_phy_reg_write(cdns_phy, TX_DIAG_BGREF_PREDRV_DELAY | (k << 9), 0x0097);
+		/* Transmitter receiver detect registers */
+		cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k << 9), 0x0a8c);
+		cdns_phy_reg_write(cdns_phy, TX_RCVDET_ST_TMR | (k << 9), 0x0036);
+	}
+
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
+}
+
+static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->dp.lanes;
+	u32 link_rate = cdns_phy->dp.link_rate;
+	u16 val;
+	int index, i, k;
+
+	/* DP PLL data rate 0/1 clock divider value */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_DATA_RATE_CLK_DIV_MASK;
+	if (link_rate <= RATE_2_7)
+		val |= FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
+				  PLL_DATA_RATE_CLK_DIV_HBR);
+	else
+		val |= FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
+				  PLL_DATA_RATE_CLK_DIV_HBR2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* High speed clock 0/1 div */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
+	if (link_rate <= RATE_2_7) {
+		val |= FIELD_PREP(HSCLK1_SEL_MASK, HSCLK_PLL0_DIV2);
+		val |= FIELD_PREP(HSCLK0_SEL_MASK, HSCLK_PLL0_DIV2);
+	}
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val &= ~HSCLK_SEL_MODE3_MASK;
+		if (link_rate <= RATE_2_7)
+			val |= FIELD_PREP(HSCLK_SEL_MODE3_MASK, HSCLK_SEL_MODE3_HSCLK1);
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)), val);
+	}
+
+	/* DP PHY PLL 27MHz configuration */
+	index = dp_link_rate_index(link_rate);
+	for (i = 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
+		cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i].addr,
+				   phy_pll_27m_cfg[i].val[index]);
+
+	/* Transceiver control and diagnostic registers */
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
+		val &= ~(DPLL_DATA_RATE_DIV_MODE3_MASK | DPLL_CLK_SEL_MODE3);
+		if (link_rate <= RATE_2_7)
+			val |= FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 2);
+		else
+			val |= FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 1);
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
+	}
+
+	for (k = 0; k < num_lanes; k = k + 1) {
+		/* Power state machine registers */
+		cdns_phy_reg_write(cdns_phy, (XCVR_PSM_RCTRL | (k << 9)), 0xbefc);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A0 | (k << 9)), 0x6799);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A1 | (k << 9)), 0x6798);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A2 | (k << 9)), 0x0098);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A3 | (k << 9)), 0x0098);
+		/* Receiver calibration power state definition register */
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k << 9));
+		val &= 0xffbb;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_CAL | (k << 9)), val);
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k << 9));
+		val &= 0xffbb;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_A0 | (k << 9)), val);
+	}
+}
+
+static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 val;
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= ~CMA_REF_CLK_SEL_MASK;
+	/*
+	 * single ended reference clock (val |= 0x0030);
+	 * differential clock  (val |= 0x0000);
+	 *
+	 * for differential clock on the refclk_p and
+	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=1'b1
+	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
+	 */
+	val |= FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+}
+
+static int wait_for_ack(struct cdns_hdptx_phy *cdns_phy, u32 reg, u32 mask,
+			const char *err_msg)
+{
+	u32 val, i;
+
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, reg);
+		if (val & mask)
+			return 0;
+		msleep(20);
+	}
+
+	dev_err(cdns_phy->dev, "%s\n", err_msg);
+	return -ETIMEDOUT;
+}
+
+static int wait_for_ack_clear(struct cdns_hdptx_phy *cdns_phy, u32 reg, u32 mask,
+			      const char *err_msg)
+{
+	u32 val, i;
+
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, reg);
+		if (!(val & mask))
+			return 0;
+		msleep(20);
+	}
+
+	dev_err(cdns_phy->dev, "%s\n", err_msg);
+	return -ETIMEDOUT;
+}
+
+static int hdptx_dp_phy_power_up(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 val;
+	int ret;
+
+	/* Enable HDP PLL's for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= PLL_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
+			   "Wait PLL Ack failed");
+	if (ret < 0)
+		return ret;
+
+	/* Enable HDP PLL's data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= PLL_CLK_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_CLK_EN_ACK,
+			   "Wait PLL clock enable ACK failed");
+	if (ret < 0)
+		return ret;
+
+	/* Configure PHY in A2 Mode */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2_ACK,
+			   "Wait A2 Ack failed");
+	if (ret < 0)
+		return ret;
+
+	/* Configure PHY in A0 mode (PHY must be in the A0 power
+	 * state in order to transmit data)
+	 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0_ACK,
+			   "Wait A0 Ack failed");
+	if (ret < 0)
+		return ret;
+
+	cdns_phy->power_up = true;
+
+	return ret;
+}
+
+static int hdptx_dp_phy_power_down(struct cdns_hdptx_phy *cdns_phy)
+{
+	u16 val;
+	int ret;
+
+	if (!cdns_phy->power_up)
+		return 0;
+
+	/* Place the PHY lanes in the A3 power state. */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3_ACK,
+			   "Wait A3 Ack failed");
+	if (ret)
+		return ret;
+
+	/* Disable HDP PLL's data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_CLK_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	ret = wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_CLK_EN_ACK,
+				 "Wait PLL clock Ack clear failed");
+	if (ret)
+		return ret;
+
+	/* Disable HDP PLL's for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	ret = wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
+				 "Wait PLL Ack clear failed");
+	if (ret)
+		return ret;
+
+	cdns_phy->power_up = false;
+	return 0;
+}
+
+static int cdns_hdptx_dp_configure(struct phy *phy,
+				   union phy_configure_opts *opts)
+{
+	struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
+
+	cdns_phy->dp.link_rate = opts->dp.link_rate;
+	cdns_phy->dp.lanes = opts->dp.lanes;
+
+	if (cdns_phy->dp.link_rate > MAX_LINK_RATE) {
+		dev_err(cdns_phy->dev, "Link Rate(%d) Not supported\n", cdns_phy->dp.link_rate);
+		return false;
+	}
+
+	/* Disable phy clock if PHY in power up state */
+	hdptx_dp_phy_power_down(cdns_phy);
+
+	if (cdns_phy->ref_clk_rate == REF_CLK_27MHZ) {
+		hdptx_dp_phy_pma_cmn_cfg_27mhz(cdns_phy);
+		hdptx_dp_phy_pma_cmn_pll0_27mhz(cdns_phy);
+	} else {
+		dev_err(cdns_phy->dev, "Not support ref clock rate\n");
+	}
+
+	/* PHY power up */
+	return hdptx_dp_phy_power_up(cdns_phy);
+}
+
+static bool hdptx_phy_check_alive(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32  alive, newalive;
+	u8 retries_left = 50;
+
+	alive = readl(cdns_phy->regs + KEEP_ALIVE);
+
+	while (retries_left--) {
+		udelay(2);
+
+		newalive = readl(cdns_phy->regs + KEEP_ALIVE);
+		if (alive == newalive)
+			continue;
+		return true;
+	}
+	return false;
+}
+
+static int hdptx_clk_enable(struct cdns_hdptx_phy *cdns_phy)
+{
+	struct device *dev = cdns_phy->dev;
+	u32 ref_clk_rate;
+	int ret;
+
+	cdns_phy->ref_clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(cdns_phy->ref_clk)) {
+		dev_err(dev, "phy ref clock not found\n");
+		return PTR_ERR(cdns_phy->ref_clk);
+	}
+
+	cdns_phy->apb_clk = devm_clk_get(dev, "apb");
+	if (IS_ERR(cdns_phy->apb_clk)) {
+		dev_err(dev, "phy apb clock not found\n");
+		return PTR_ERR(cdns_phy->apb_clk);
+	}
+
+	ret = clk_prepare_enable(cdns_phy->ref_clk);
+	if (ret) {
+		dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
+		return ret;
+	}
+
+	ref_clk_rate = clk_get_rate(cdns_phy->ref_clk);
+	if (!ref_clk_rate) {
+		dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
+		goto err_ref_clk;
+	}
+
+	if (ref_clk_rate == REF_CLK_27MHZ) {
+		cdns_phy->ref_clk_rate = ref_clk_rate;
+	} else {
+		dev_err(cdns_phy->dev, "Not support Ref Clock Rate(%dHz)\n", ref_clk_rate);
+		goto err_ref_clk;
+	}
+
+	ret = clk_prepare_enable(cdns_phy->apb_clk);
+	if (ret) {
+		dev_err(cdns_phy->dev, "Failed to prepare apb clock\n");
+		goto err_ref_clk;
+	}
+
+	return 0;
+
+err_ref_clk:
+	clk_disable_unprepare(cdns_phy->ref_clk);
+	return -EINVAL;
+}
+
+static void hdptx_clk_disable(struct cdns_hdptx_phy *cdns_phy)
+{
+	clk_disable_unprepare(cdns_phy->apb_clk);
+	clk_disable_unprepare(cdns_phy->ref_clk);
+}
+
+static void hdptx_hdmi_arc_config(struct cdns_hdptx_phy *cdns_phy)
+{
+	u16 txpu_calib_code;
+	u16 txpd_calib_code;
+	u16 txpu_adj_calib_code;
+	u16 txpd_adj_calib_code;
+	u16 prev_calib_code;
+	u16 new_calib_code;
+	u16 rdata;
+
+	/* Power ARC */
+	cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 0x0001);
+
+	prev_calib_code = cdns_phy_reg_read(cdns_phy, TX_DIG_CTRL_REG_2);
+	txpu_calib_code = cdns_phy_reg_read(cdns_phy, CMN_TXPUCAL_CTRL);
+	txpd_calib_code = cdns_phy_reg_read(cdns_phy, CMN_TXPDCAL_CTRL);
+	txpu_adj_calib_code = cdns_phy_reg_read(cdns_phy, CMN_TXPU_ADJ_CTRL);
+	txpd_adj_calib_code = cdns_phy_reg_read(cdns_phy, CMN_TXPD_ADJ_CTRL);
+
+	new_calib_code = ((txpu_calib_code + txpd_calib_code) / 2)
+		+ txpu_adj_calib_code + txpd_adj_calib_code;
+
+	if (new_calib_code != prev_calib_code) {
+		rdata = cdns_phy_reg_read(cdns_phy, TX_ANA_CTRL_REG_1);
+		rdata &= 0xdfff;
+		cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, rdata);
+		cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, new_calib_code);
+		mdelay(10);
+		rdata |= 0x2000;
+		cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, rdata);
+		usleep_range(150, 250);
+	}
+
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2098);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0010);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x4001);
+	mdelay(5);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2198);
+	mdelay(5);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
+	usleep_range(100, 200);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
+}
+
+static void hdptx_hdmi_phy_set_vswing(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 k;
+	const u32 num_lanes = 4;
+
+	for (k = 0; k < num_lanes; k++) {
+		cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_DRV | (k << 9)),
+				   TX_DRIVER_PROG_BOOST_ENABLE |
+				   FIELD_PREP(TX_DRIVER_PROG_BOOST_LEVEL_MASK, 3) |
+				   TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE |
+				   TX_DRIVER_LDO_BANDGAP_REF_ENABLE);
+		cdns_phy_reg_write(cdns_phy, (TX_TXCC_CPOST_MULT_00_0 | (k << 9)), 0x0);
+		cdns_phy_reg_write(cdns_phy, (TX_TXCC_CAL_SCLR_MULT_0 | (k << 9)),
+				   SCALED_RESISTOR_CALIBRATION_CODE_ADD |
+				   RESISTOR_CAL_MULT_VAL_32_128);
+	}
+}
+
+static int hdptx_hdmi_phy_config(struct cdns_hdptx_phy *cdns_phy,
+				 const struct hdptx_hdmi_ctrl *p_ctrl_table,
+				 const struct hdptx_hdmi_pll_tuning *p_pll_table,
+				 bool pclk_in)
+{
+	const u32 num_lanes = 4;
+	u32 val, k;
+	int ret;
+
+	/* enable PHY isolation mode only for CMN */
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISOLATION_CTRL, 0xd000);
+
+	/* set cmn_pll0_clk_datart1_div/cmn_pll0_clk_datart0_div dividers */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_ISO_PLL_CTRL1);
+	val &= ~CMN_PLL0_CLK_DATART_DIV_MASK;
+	val |= FIELD_PREP(CMN_PLL0_CLK_DATART_DIV_MASK, 0x12);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_PLL_CTRL1, val);
+
+	/* assert PHY reset from isolation register */
+	cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0000);
+	/* assert PMA CMN reset */
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0000);
+
+	/* register XCVR_DIAG_BIDI_CTRL */
+	for (k = 0; k < num_lanes; k++)
+		cdns_phy_reg_write(cdns_phy, XCVR_DIAG_BIDI_CTRL | (k << 9), 0x00ff);
+
+	/* Describing Task phy_cfg_hdp */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= ~CMA_REF_CLK_RCV_EN_MASK;
+	val |= FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK, CMA_REF_CLK_RCV_EN);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* PHY Registers */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= ~CMA_REF_CLK_DIG_DIV_MASK;
+	val |= FIELD_PREP(CMA_REF_CLK_DIG_DIV_MASK, p_ctrl_table->cmn_ref_clk_dig_div);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_DATA_RATE_CLK_DIV_MASK;
+	val |= FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
+			  PLL_DATA_RATE_CLK_DIV_HBR2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* Common control module control and diagnostic registers */
+	val = cdns_phy_reg_read(cdns_phy, CMN_CDIAG_REFCLK_CTRL);
+	val &= ~DIG_REF_CLK_DIV_SCALER_MASK;
+	val |= FIELD_PREP(DIG_REF_CLK_DIV_SCALER_MASK, p_ctrl_table->ref_clk_divider_scaler);
+	val |= REFCLK_TERMINATION_EN_OVERRIDE_EN | REFCLK_TERMINATION_EN_OVERRIDE;
+	cdns_phy_reg_write(cdns_phy, CMN_CDIAG_REFCLK_CTRL, val);
+
+	/* High speed clock used */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
+	val |= FIELD_PREP(HSCLK1_SEL_MASK, (p_ctrl_table->cmnda_hs_clk_1_sel >> 1));
+	val |= FIELD_PREP(HSCLK0_SEL_MASK, (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val &= ~HSCLK_SEL_MODE3_MASK;
+		val |= FIELD_PREP(HSCLK_SEL_MODE3_MASK,
+				  (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)), val);
+	}
+
+	/* PLL 0 control state machine registers */
+	val = p_ctrl_table->vco_ring_select << 12;
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_USER_DEF_CTRL, val);
+
+	if (pclk_in) {
+		val = 0x30a0;
+	} else {
+		val = cdns_phy_reg_read(cdns_phy, CMN_PLL0_VCOCAL_START);
+		val &= ~VCO_CALIB_CODE_START_POINT_VAL_MASK;
+		val |= FIELD_PREP(VCO_CALIB_CODE_START_POINT_VAL_MASK,
+				  p_pll_table->vco_cal_code);
+	}
+	cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_START, val);
+
+	cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_INIT_TMR, 0x0064);
+	cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_ITER_TMR, 0x000a);
+
+	/* Common functions control and diagnostics registers */
+	val = p_ctrl_table->cmnda_pll0_hs_sym_div_sel << 8;
+	val |= p_ctrl_table->cmnda_pll0_ip_div;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_INCLK_CTRL, val);
+
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_OVRD, 0x0000);
+
+	val = p_ctrl_table->cmnda_pll0_fb_div_high;
+	val |= PLL_FEEDBACK_DIV_HI_OVERRIDE_EN;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBH_OVRD, val);
+
+	val = p_ctrl_table->cmnda_pll0_fb_div_low;
+	val |= PLL_FEEDBACK_DIV_LO_OVERRIDE_EN;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBL_OVRD, val);
+
+	if (!pclk_in) {
+		val = p_ctrl_table->cmnda_pll0_pxdiv_low;
+		cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PXL_DIVL, val);
+
+		val = p_ctrl_table->cmnda_pll0_pxdiv_high;
+		val |= PLL_PCLK_DIV_EN;
+		cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PXL_DIVH, val);
+	}
+
+	val = p_pll_table->volt_to_current_coarse;
+	val |= (p_pll_table->volt_to_current) << 4;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_V2I_TUNE, val);
+
+	val = p_pll_table->charge_pump_gain;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_CP_TUNE, val);
+
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_LF_PROG, 0x0008);
+
+	val = p_pll_table->pmos_ctrl;
+	val |= (p_pll_table->ndac_ctrl) << 8;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE1, val);
+
+	val = p_pll_table->ptat_ndac_ctrl;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE2, val);
+
+	if (pclk_in)
+		cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_TEST_MODE, 0x0022);
+	else
+		cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_TEST_MODE, 0x0020);
+
+	cdns_phy_reg_write(cdns_phy, CMN_PSM_CLK_CTRL, 0x0016);
+
+	/* Transceiver control and diagnostic registers */
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
+		val &= ~DPLL_CLK_SEL_MODE3;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
+	}
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (TX_DIAG_TX_CTRL | (k << 9)));
+		val &= ~TX_IF_SUBRATE_MODE3_MASK;
+		val |= FIELD_PREP(TX_IF_SUBRATE_MODE3_MASK,
+				  (p_ctrl_table->hsclk_div_tx_sub_rate >> 1));
+		cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_CTRL | (k << 9)), val);
+	}
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= ~CMA_REF_CLK_SEL_MASK;
+	/*
+	 * single ended reference clock (val |= 0x0030);
+	 * differential clock  (val |= 0x0000);
+	 * for differential clock on the refclk_p and
+	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=1'b1
+	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
+	 */
+	val |= FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* Deassert PHY reset */
+	cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0001);
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0003);
+
+	/* Power state machine registers */
+	for (k = 0; k < num_lanes; k++)
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_RCTRL | (k << 9), 0xfefc);
+
+	/* Assert cmn_macro_pwr_en */
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0013);
+
+	/* wait for cmn_macro_pwr_en_ack */
+	ret = wait_for_ack(cdns_phy, PHY_PMA_ISO_CMN_CTRL, CMN_MACRO_PWR_EN_ACK,
+			   "MA output macro power up failed");
+	if (ret < 0)
+		return ret;
+
+	/* wait for cmn_ready */
+	ret = wait_for_ack(cdns_phy, PHY_PMA_CMN_CTRL1, CMN_READY,
+			   "PMA output ready failed");
+	if (ret < 0)
+		return ret;
+
+	for (k = 0; k < num_lanes; k++) {
+		cdns_phy_reg_write(cdns_phy, TX_PSC_A0 | (k << 9), 0x6791);
+		cdns_phy_reg_write(cdns_phy, TX_PSC_A1 | (k << 9), 0x6790);
+		cdns_phy_reg_write(cdns_phy, TX_PSC_A2 | (k << 9), 0x0090);
+		cdns_phy_reg_write(cdns_phy, TX_PSC_A3 | (k << 9), 0x0090);
+
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k << 9));
+		val &= 0xffbb;
+		cdns_phy_reg_write(cdns_phy, RX_PSC_CAL | (k << 9), val);
+
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k << 9));
+		val &= 0xffbb;
+		cdns_phy_reg_write(cdns_phy, RX_PSC_A0 | (k << 9), val);
+	}
+
+	return 0;
+}
+
+static int hdptx_hdmi_phy_cfg(struct cdns_hdptx_phy *cdns_phy, unsigned long long char_rate)
+{
+	const struct hdptx_hdmi_ctrl *p_ctrl_table;
+	const struct hdptx_hdmi_pll_tuning *p_pll_table;
+	const u32 refclk_freq_khz = cdns_phy->ref_clk_rate / 1000;
+	const bool pclk_in = false;
+	u32 char_rate_khz = char_rate / 1000;
+	u32 vco_freq, rate;
+	u32 div_total, i;
+
+	dev_dbg(cdns_phy->dev, "character clock: %d KHz\n ", char_rate_khz);
+
+	/* Get right row from the ctrl_table table.
+	 * check the character rate.
+	 */
+	for (i = 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++) {
+		rate = pixel_clk_output_ctrl_table[i].feedback_factor *
+		       pixel_clk_output_ctrl_table[i].pixel_clk_freq_min / 1000;
+		if (char_rate_khz == rate) {
+			p_ctrl_table = &pixel_clk_output_ctrl_table[i];
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(pixel_clk_output_ctrl_table)) {
+		dev_warn(cdns_phy->dev,
+			 "char clk (%d KHz) not supported\n", char_rate_khz);
+		return -EINVAL;
+	}
+
+	div_total = p_ctrl_table->pll_fb_div_total;
+	vco_freq = refclk_freq_khz * div_total / p_ctrl_table->cmnda_pll0_ip_div;
+
+	/* Get right row from the pixel_clk_output_pll_table table.
+	 * Check if vco_freq_khz and feedback_div_total
+	 * column matching with pixel_clk_output_pll_table.
+	 */
+	for (i = 0; i < ARRAY_SIZE(pixel_clk_output_pll_table); i++) {
+		if (vco_freq == pixel_clk_output_pll_table[i].vco_freq_min &&
+		    div_total == pixel_clk_output_pll_table[i].feedback_div_total) {
+			p_pll_table = &pixel_clk_output_pll_table[i];
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(pixel_clk_output_pll_table)) {
+		dev_warn(cdns_phy->dev, "VCO (%d KHz) not supported\n", vco_freq);
+		return -EINVAL;
+	}
+	dev_dbg(cdns_phy->dev, "VCO frequency is (%d KHz)\n", vco_freq);
+
+	return hdptx_hdmi_phy_config(cdns_phy, p_ctrl_table, p_pll_table, pclk_in);
+}
+
+static int hdptx_hdmi_phy_power_up(struct cdns_hdptx_phy *cdns_phy)
+{
+	int ret;
+
+	/* set Power State to A2 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2);
+
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
+
+	ret = wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2_ACK,
+			   "Wait A2 Ack failed");
+	if (ret < 0)
+		return ret;
+
+	/* Power up ARC */
+	hdptx_hdmi_arc_config(cdns_phy);
+
+	/* Configure PHY in A0 mode (PHY must be in the A0 power
+	 * state in order to transmit data)
+	 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0);
+
+	return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0_ACK,
+			    "Wait A0 Ack failed");
+}
+
+static int hdptx_hdmi_phy_power_down(struct cdns_hdptx_phy *cdns_phy)
+{
+	u32 val;
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+	val &= ~(POWER_STATE_A0 | POWER_STATE_A1 | POWER_STATE_A2 | POWER_STATE_A3);
+	/* PHY_DP_MODE_CTL set to A3 power state */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, val | POWER_STATE_A3);
+
+	return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3_ACK,
+			    "Wait A3 Ack failed");
+}
+
+static int cdns_hdptx_phy_on(struct phy *phy)
+{
+	struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
+
+	if (phy->attrs.mode == PHY_MODE_DP)
+		return hdptx_dp_phy_power_up(cdns_phy);
+	else
+		return hdptx_hdmi_phy_power_up(cdns_phy);
+}
+
+static int cdns_hdptx_phy_off(struct phy *phy)
+{
+	struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
+
+	if (phy->attrs.mode == PHY_MODE_DP)
+		return hdptx_dp_phy_power_down(cdns_phy);
+	else
+		return hdptx_hdmi_phy_power_down(cdns_phy);
+	return 0;
+}
+
+static int
+cdns_hdptx_phy_valid(struct phy *phy, enum phy_mode mode,
+		     int submode, union phy_configure_opts *opts)
+{
+	u32 rate = opts->hdmi.tmds_char_rate / 1000;
+	int i;
+
+	if (mode == PHY_MODE_DP)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++)
+		if (rate == pixel_clk_output_ctrl_table[i].pixel_clk_freq_min)
+			return 0;
+
+	return -EINVAL;
+}
+
+static int cdns_hdptx_phy_init(struct phy *phy)
+{
+	return 0;
+}
+
+static int cdns_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	if (mode == PHY_MODE_DP) {
+		hdptx_dp_phy_ref_clock_type(cdns_phy);
+
+		/* PHY power up */
+		ret = hdptx_dp_phy_power_up(cdns_phy);
+		if (ret < 0)
+			return ret;
+
+		hdptx_dp_aux_cfg(cdns_phy);
+	} else if (mode != PHY_MODE_HDMI) {
+		dev_err(&phy->dev, "Invalid PHY mode: %u\n", mode);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int cdns_hdptx_hdmi_configure(struct phy *phy,
+				     union phy_configure_opts *opts)
+{
+	struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	cdns_phy->hdmi.tmds_char_rate = opts->hdmi.tmds_char_rate;
+
+	/* Check HDMI FW alive before HDMI PHY init */
+	ret = hdptx_phy_check_alive(cdns_phy);
+	if (!ret) {
+		dev_err(cdns_phy->dev, "NO HDMI FW running\n");
+		return -ENXIO;
+	}
+
+	/* Configure PHY */
+	if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->hdmi.tmds_char_rate) < 0) {
+		dev_err(cdns_phy->dev, "failed to set phy pclock\n");
+		return -EINVAL;
+	}
+
+	ret = hdptx_hdmi_phy_power_up(cdns_phy);
+	if (ret < 0)
+		return ret;
+
+	hdptx_hdmi_phy_set_vswing(cdns_phy);
+
+	return 0;
+}
+
+static int cdns_hdptx_configure(struct phy *phy,
+				union phy_configure_opts *opts)
+{
+	if (phy->attrs.mode == PHY_MODE_DP)
+		return cdns_hdptx_dp_configure(phy, opts);
+	else
+		return cdns_hdptx_hdmi_configure(phy, opts);
+}
+
+static const struct phy_ops cdns_hdptx_phy_ops = {
+	.init = cdns_hdptx_phy_init,
+	.set_mode = cdns_hdptx_phy_set_mode,
+	.configure = cdns_hdptx_configure,
+	.power_on = cdns_hdptx_phy_on,
+	.power_off = cdns_hdptx_phy_off,
+	.validate = cdns_hdptx_phy_valid,
+	.owner = THIS_MODULE,
+};
+
+static int cdns_hdptx_phy_probe(struct platform_device *pdev)
+{
+	struct cdns_hdptx_phy *cdns_phy;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct phy_provider *phy_provider;
+	struct resource *res;
+	struct phy *phy;
+	int ret;
+
+	cdns_phy = devm_kzalloc(dev, sizeof(*cdns_phy), GFP_KERNEL);
+	if (!cdns_phy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, cdns_phy);
+	cdns_phy->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+	cdns_phy->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(cdns_phy->regs))
+		return PTR_ERR(cdns_phy->regs);
+
+	phy = devm_phy_create(dev, node, &cdns_hdptx_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	cdns_phy->phy = phy;
+	phy_set_drvdata(phy, cdns_phy);
+
+	/* init base struct for access mhdp mailbox */
+	cdns_phy->base.dev = cdns_phy->dev;
+	cdns_phy->base.regs = cdns_phy->regs;
+
+	ret = hdptx_clk_enable(cdns_phy);
+	if (ret) {
+		dev_err(dev, "Init clk fail\n");
+		return -EINVAL;
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto clk_disable;
+	}
+
+	dev_dbg(dev, "probe success!\n");
+
+	return 0;
+
+clk_disable:
+	hdptx_clk_disable(cdns_phy);
+
+	return -EINVAL;
+}
+
+static void cdns_hdptx_phy_remove(struct platform_device *pdev)
+{
+	struct cdns_hdptx_phy *cdns_phy = platform_get_drvdata(pdev);
+
+	hdptx_clk_disable(cdns_phy);
+}
+
+static const struct of_device_id cdns_hdptx_phy_of_match[] = {
+	{.compatible = "fsl,imx8mq-hdptx-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cdns_hdptx_phy_of_match);
+
+static struct platform_driver cdns_hdptx_phy_driver = {
+	.probe = cdns_hdptx_phy_probe,
+	.remove = cdns_hdptx_phy_remove,
+	.driver = {
+		.name	= "cdns-hdptx-phy",
+		.of_match_table	= cdns_hdptx_phy_of_match,
+	}
+};
+module_platform_driver(cdns_hdptx_phy_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDP-TX DP/HDMI PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

