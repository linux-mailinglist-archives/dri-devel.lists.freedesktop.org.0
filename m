Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699018291D4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FED10E555;
	Wed, 10 Jan 2024 01:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFF010E555
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9VsiPDn+GmbfnHFN+RKz7P0pE3eZ0IP41i+9klQGme+LdvmDORGKFtrNjYTJhIVHZsFdKeVrYeAOlw0K+PMxaLEWgF03VbtBGRYaoyOn+Ico0VembIOWSAsEhi8Jc+VqpkOIQ7/U3SJ6G6uH0PXn4Iah68+Qzmk7LK0F4fR5RK0MdzfY61/UNp29/gc2yehh2ASHP2CHcuufV4OCNhkkQDfnIJNFParyOUPA/UCOQ0N2Tvfk0hCnZnQ4hK1xBDC3wPITpyFusApTJ/lbvkksx0XbhWRqLHHTYCaGN5/lLXHODQ8tPT6hVbPwTnKKHdjTatn+Ys76zm2zKWgStwVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8H+/ahfaWsRR8lgjI4dqJKwVUgGbEOylcLvf0/il/I=;
 b=fyEFwUOyWc02znbYcjoS79OJXmDPN5Kp4iB78C7QyN7dZwtw0wVnIDxN55nPA8/KQguqjaDW4D/PNjoUfRamN9dQVlQsJ+UK7rCIkgo43lxTSnyDT8ORBdCO3gbrs7R3uBg5B1xhoEmjs5RRgyZSuxFhMoyn/8DNEdYCuGKIoIMkN/kVqPNIXEZXer/QOpodn80ODi6UJykLQ3c9q3PO9Bx+hJpFsR98WwrdYhxduHNUi1DNDkcQpZyylbRjDWvf8hp9c6yzpvBMSkFBC0b60QOrv62C4OVn4ICOrTy5/Z7YvFO762E6qFI4RvU4uItv/iaHw7UrxlO8l3bzs7iX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8H+/ahfaWsRR8lgjI4dqJKwVUgGbEOylcLvf0/il/I=;
 b=YZFi/lLxx6EiAEMYmOuhRb8x3FPyAyJ7qP634u6zBG7KT8kMJENGxGAOkJjyCqSy3gUcEeUcl47kyr5jtWNDdK8Y6VP4W/lKkFSt8E7XQaxjx+TOhnOpb5U8+6Ex9j35D3hfWRt11DkDrDm1AYfdaaeaw/xTzvvakK9suf9Mo88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:10:32 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:10:32 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v12 6/7] phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
Date: Wed, 10 Jan 2024 09:08:47 +0800
Message-Id: <bd943bf7ced5077862242ef58fc39df64b2190d7.1704785836.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704785836.git.Sandor.yu@nxp.com>
References: <cover.1704785836.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fbc3d4-7c7d-445e-1879-08dc1178f188
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOz7LGtjk9TMjsYlNKyOGTINKmKrDUs3/VOGKNoRUZFN/WUy4cSrfPi3wam2mLAX/qSfJJFNeQ47mxy9tVX8vi3Hh5/A4P1Qah8i2LBmnptBbrxt1kbFglj5dKpxAAXtGd89MzGVAFSTIGz+3bpsqqJiRK0awSq2vbWctTyj/6kmsyLe4HrDDOSn+/1cb9GfcqM4Io72PppBMHzpEc8Q2Wsg7id+PcOmmg+0p6+Tku9lnV7Cd5Fh0txWj9lIhQ83jxQ3BP7tzQNaNEyxMKgdaLKewQuErJdM3d52MaSAgCAA15Xc49oSkxrP+EGGsVZVAtTSJ+3Z9Q+mERwOgpbxoY3So+93oPOBRUa4wTUGMQqJBh0XPSN2KWJksQI8hkOM5IkgmdGBuv9JOgcGrsScG6OFX/v86NjUn/a3KRIw++LQr9j3dP2QQC4F913zJp8NgheaECkJQMBJM2nmMJsFW/n3NvA5nyFVShvVfxCp+sZuX3oDYlzASQxsO17b5XMdm7WOMDO4ABFsKeIpgpDKDD6z21iiztNftHG7IUt88jTXVIz8o8NFmddKuC244WDFtNCDGvSNJ1lg/ya2hlDs9gTiYoZhndMwpNojWGpp0VNLMoUx8W+2TgdWNz2ssPYqqPEWbNQucfZC9DzPjxSjQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(38350700005)(36756003)(921011)(86362001)(26005)(2616005)(52116002)(6512007)(4326008)(316002)(66476007)(6486002)(8936002)(66556008)(66946007)(478600001)(6506007)(6666004)(8676002)(41300700001)(2906002)(5660300002)(7416002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGo2MTNGdVNHL0VZYkRRWmJDRlMxSVorTHRxaFV4TUdYQ1krUmZ1SUU2ZEt0?=
 =?utf-8?B?aGxUSXBZRlNtV1FnMnZNZFBIcElQZ2xOTlFHaFhKeTlMaldGM1ZYUEUyUW5n?=
 =?utf-8?B?ZkJFZDF4ZU0vZU4va29NbSswZHp2N0R2OGtaTTRlbmxHQ1c3Z2ZSZnpQcVpl?=
 =?utf-8?B?QzNTQ0hiWjBCaEg5RGNpbWNiQkxyTW81RHpZcXgrYUpZK1dVRk51MXJ0MzZJ?=
 =?utf-8?B?bEFiVWcwZlRhTmZlbWg5VEdvOWRPN0ZERG1YMm01N1Z6Y3ROTlI1aUlKVkxR?=
 =?utf-8?B?emZOampvaG1zdW5lNGRTVkNsV2VVNXhTRHlzN0k0NlhmTW15MkNkWjZzeDln?=
 =?utf-8?B?SG1kemtlSGFwWkJaaTZoeFNsV1ZEVS9ZZk14dWduREZjeWFqMXF3b251Q0xo?=
 =?utf-8?B?b2EzOVlBaFg3eUJjdUdkTUpXUmhlQ0ZtQWFoQ2ZhNlpkUUJPZnNZd1p4eldT?=
 =?utf-8?B?VjFLVmsrU1lVN0loYlhXd2dtSm9ieWNwMXY3Z0dKVDE0bWJ5WTBOR0ZHWnNN?=
 =?utf-8?B?bHBrU0xiVGVVRTFpNERiVzJYSzdwMUpyMm9sQmI4S0lNN2FhQXlJRWF3NzVz?=
 =?utf-8?B?NytsSTc3Z1JjTm5SM3JvTGtBTmJXS2ZxZWtZdVF6WGNCeG8xTXJjUzJBa2hi?=
 =?utf-8?B?aFE2UDJtS2lwN3RZM2hqS1p0WHBZMDRYMytxK0J6Qy8wTDBwNjJyWGZGdC9G?=
 =?utf-8?B?THo3YzRweEJ6MG5EM01odGZxWmtld1JEYXNiSkQ2RjcxTmovdi9WQWczUnJ3?=
 =?utf-8?B?TVBTUEpkVmdPSnZERjVrZXhtanhmbkljTkovNUgwSUxRMGNZS3dnRXZzdmxU?=
 =?utf-8?B?Q2tjczRwZ2ZDcUZaeVMrN043MDh4Mk9TY2o5em1CYWdVVlJ5TmVjMEw3dFcr?=
 =?utf-8?B?WkNpY1Bxd2dkbXZBM21EQXdOYzkwQXdkRGdZR3RCRnVBNHg5cWNiK3Y1T2xU?=
 =?utf-8?B?SXQvN1RNWm9iQUFPdEJCeS9VMk5TcTZVem5yTExNT3YyK2lTSG95ME9oeEZJ?=
 =?utf-8?B?aC9LK3JEZlEyYUZrV1NtRzVudkRzeU4vSVV1c2JKZGgxTTgwVm51a0YrRXU3?=
 =?utf-8?B?dUdlWWZMR0J1ZUhiWDF3OVBxczM4TlRNcnFROGNyNlJqQkNIQkpmVEhkS0FT?=
 =?utf-8?B?aUZSVndGZ2RjQUN2dHoxbnlhcWxqdDB5bEpRQmNnd1B6VUMrWXZxNkFzdE5S?=
 =?utf-8?B?Q2ZwTUY4N3UyWFBBdHd2aVJDeWYxMzJTWlBkUGhmT1BUanczd3pIS25VSTZu?=
 =?utf-8?B?NWtmS3dhTDhmRm1hdzlRYVpTR0F3TytUV3QwaHMzbk52Uy9KM2hvZElIWlJK?=
 =?utf-8?B?eFpibDFuRWJYd1ZSVloxaUdITlpiRHVPTEVBUjB1MnE2cHFoU0l4WVFWejNM?=
 =?utf-8?B?YnU5Snk5QXpiSUtuU004OVczdFVVbFhJVHRFRXlkRHFud0Q3ZWNSQ1hzcC9T?=
 =?utf-8?B?YmIzSk5mbGpOSnVtWnJpRDFDNFp6aXd6ODZSUE9qU1F4b1JiWFMvRTZneHJo?=
 =?utf-8?B?aGJDcCtCRm5ubmovcjJIdDM4dXFKc0VFQnNMbHhJcHNXRnhHdlQrK3dyV1pa?=
 =?utf-8?B?VmRZbnUrMDhhTCt0WEtwaDNuMlZyYXMzSXA3UDlFTm5pTUE2QUY4czFNS0Y0?=
 =?utf-8?B?Ukhpbm9pSHBhZmtMMDlZK0N1VC8yeFVIbmRzOXdRYTVOcmMyTTZrZ3Fqb0tT?=
 =?utf-8?B?M3dWdk1nUzJJNmw4dWVzbkUzR3o2NWxjdDlxOVNFUjNZVFZ6S0tTVjJhSUZv?=
 =?utf-8?B?UDhsYXpsNGUvWWZXbC9DaDBBZm1yYU5SYmppVTNYVmsxVXVCcWplenhkS1Rs?=
 =?utf-8?B?dGhqTVVoR2lRSm9OYkgyTmlOWWJxdUpHZzJkUmNlcVljbFBRRFJrdmRlVWVu?=
 =?utf-8?B?anROdDdYZDd1QUEzWHFBQ3JCNXVwNHZCbWJZRUgvcUhVd1ZXaWRIbUZkRVRO?=
 =?utf-8?B?ckVEYW8zeXBLbkFPeENpaHVJQ241SzV5NE90TVdwcHV3UGFocTEzV1VKWjNj?=
 =?utf-8?B?VVFFWVhjNjZ1czVxUXlJN1l4NklxTDRqZnI2Q1FEUmRSRDczSHhsem53VS9P?=
 =?utf-8?B?MmpoTHErN2V4aVpaeG1YY3RNRHdVVEtRd1ZhTFp2OXZCN3RWaXg4YWJUTjFt?=
 =?utf-8?Q?80mCii34IpTWCOY/Ij18ZQ6Bo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fbc3d4-7c7d-445e-1879-08dc1178f188
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:10:32.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol87RbkeGqMjRVE/Ps0R56mxZY9VWAABASgasBPIKyZuq1eiS2T7JGtGVZdMjF/y6Pf9eoMRgXDutZMFUGePxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9836
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Cadence HDP-TX DisplayPort PHY driver for i.MX8MQ

Cadence HDP-TX PHY could be put in either DP mode or
HDMI mode base on the configuration chosen.
DisplayPort PHY mode is configurated in the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v11->v12:
- Return error code to replace -1 for function wait_for_ack().
- Set cdns_phy->power_up = false in phy_power_down function.
- Remove "RATE_8_1 = 810000", it is not used in driver.
- Add year 2024 to copyright.

 drivers/phy/freescale/Kconfig             |  10 +
 drivers/phy/freescale/Makefile            |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c | 726 ++++++++++++++++++++++
 3 files changed, 737 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c063..c39709fd700ac 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_FSL_IMX8MQ_DP
+	tristate "Freescale i.MX8MQ DP PHY support"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	select CDNS_MHDP_HELPER
+	help
+	  Enable this to support the Cadence HDPTX DP PHY driver
+	  on i.MX8MQ SOC.
+
 endif
 
 config PHY_FSL_LYNX_28G
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index cedb328bc4d28..47e5285209fa8 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_FSL_IMX8MQ_DP)		+= phy-fsl-imx8mq-dp.o
 obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-dp.c b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
new file mode 100644
index 0000000000000..2e24ca04c5980
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
@@ -0,0 +1,726 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence HDP-TX Display Port Interface (DP) PHY driver
+ *
+ * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
+ */
+#include <asm/unaligned.h>
+#include <drm/bridge/cdns-mhdp-helper.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
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
+#define CMN_TXPUCAL_INIT_TMR			0x00e4
+#define CMN_TXPUCAL_ITER_TMR			0x00e5
+#define CMN_TXPDCAL_INIT_TMR			0x00f4
+#define CMN_TXPDCAL_ITER_TMR			0x00f5
+#define CMN_ICAL_ADJ_INIT_TMR			0x0102
+#define CMN_ICAL_ADJ_ITER_TMR			0x0103
+#define CMN_RX_ADJ_INIT_TMR			0x0106
+#define CMN_RX_ADJ_ITER_TMR			0x0107
+#define CMN_TXPU_ADJ_INIT_TMR			0x010a
+#define CMN_TXPU_ADJ_ITER_TMR			0x010b
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
+#define XCVR_DIAG_PLLDRC_CTRL			0x40e0
+#define XCVR_DIAG_HSCLK_SEL			0x40e1
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR		0x40f2
+#define TX_PSC_A0				0x4100
+#define TX_PSC_A1				0x4101
+#define TX_PSC_A2				0x4102
+#define TX_PSC_A3				0x4103
+#define TX_RCVDET_EN_TMR			0x4122
+#define TX_RCVDET_ST_TMR			0x4123
+#define TX_DIAG_BGREF_PREDRV_DELAY		0x41e7
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
+#define PHY_PMA_CMN_CTRL1			0xc800
+
+/* PHY_PMA_CMN_CTRL1 */
+#define CMA_REF_CLK_SEL_MASK			GENMASK(6, 4)
+#define CMA_REF_CLK_RCV_EN_MASK			BIT(3)
+#define CMA_REF_CLK_RCV_EN			1
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
+/* CMN_DIAG_HSCLK_SEL */
+#define HSCLK1_SEL_MASK				GENMASK(5, 4)
+#define HSCLK0_SEL_MASK				GENMASK(1, 0)
+#define HSCLK_PLL0_DIV2				1
+
+/* XCVR_DIAG_HSCLK_SEL */
+#define HSCLK_SEL_MODE3_MASK			GENMASK(13, 12)
+#define HSCLK_SEL_MODE3_HSCLK1			1
+
+/* XCVR_DIAG_PLLDRC_CTRL */
+#define DPLL_CLK_SEL_MODE3			BIT(14)
+#define DPLL_DATA_RATE_DIV_MODE3_MASK		GENMASK(13, 12)
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
+#define REF_CLK_27MHZ		27000000
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
+struct cdns_hdptx_dp_phy {
+	struct cdns_mhdp_base base;
+
+	void __iomem *regs;	/* DPTX registers base */
+	struct device *dev;
+	struct phy *phy;
+	struct mutex mbox_mutex;	/* mutex to protect mailbox */
+	struct clk *ref_clk, *apb_clk;
+	u32 ref_clk_rate;
+	u32 num_lanes;
+	u32 link_rate;
+	bool power_up;
+};
+
+static int cdns_phy_reg_write(struct cdns_hdptx_dp_phy *cdns_phy, u32 addr, u32 val)
+{
+	return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE + (addr << 2), val);
+}
+
+static u32 cdns_phy_reg_read(struct cdns_hdptx_dp_phy *cdns_phy, u32 addr)
+{
+	u32 reg32;
+
+	cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr << 2), &reg32);
+	return reg32;
+}
+
+static int link_rate_index(u32 rate)
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
+		return 6;
+	default:
+		return -1;
+	}
+}
+
+static int hdptx_dp_clk_enable(struct cdns_hdptx_dp_phy *cdns_phy)
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
+static void hdptx_dp_clk_disable(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	clk_disable_unprepare(cdns_phy->ref_clk);
+	clk_disable_unprepare(cdns_phy->apb_clk);
+}
+
+static void hdptx_dp_aux_cfg(struct cdns_hdptx_dp_phy *cdns_phy)
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
+static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->num_lanes;
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
+static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 num_lanes = cdns_phy->num_lanes;
+	u32 link_rate = cdns_phy->link_rate;
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
+	index = link_rate_index(link_rate);
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
+static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_dp_phy *cdns_phy)
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
+static int wait_for_ack(struct cdns_hdptx_dp_phy *cdns_phy, u32 reg, u32 mask,
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
+static int wait_for_ack_clear(struct cdns_hdptx_dp_phy *cdns_phy, u32 reg, u32 mask,
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
+static int hdptx_dp_phy_power_up(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 val;
+	int ret = 0;
+
+	/* Enable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= PLL_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	ret = wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
+			   "Wait PLL Ack failed");
+	if (ret < 0)
+		return ret;
+
+	/* Enable HDP PLL’s data rate and full rate clocks out of PMA. */
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
+static void hdptx_dp_phy_power_down(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u16 val;
+
+	if (!cdns_phy->power_up)
+		return;
+
+	/* Place the PHY lanes in the A3 power state. */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3);
+	if (wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3_ACK,
+			 "Wait A3 Ack failed"))
+		return;
+
+	/* Disable HDP PLL’s data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_CLK_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	if (wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_CLK_EN_ACK,
+			       "Wait PLL clock Ack clear failed"))
+		return;
+
+	/* Disable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~PLL_EN;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	if (wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
+			       "Wait PLL Ack clear failed"))
+		return;
+
+	cdns_phy->power_up = false;
+}
+
+static int cdns_hdptx_dp_phy_on(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+
+	return hdptx_dp_phy_power_up(cdns_phy);
+}
+
+static int cdns_hdptx_dp_phy_off(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+
+	hdptx_dp_phy_power_down(cdns_phy);
+
+	return 0;
+}
+
+static int cdns_hdptx_dp_phy_init(struct phy *phy)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	hdptx_dp_phy_ref_clock_type(cdns_phy);
+
+	/* PHY power up */
+	ret = hdptx_dp_phy_power_up(cdns_phy);
+	if (ret < 0)
+		return ret;
+
+	hdptx_dp_aux_cfg(cdns_phy);
+
+	return ret;
+}
+
+static int cdns_hdptx_dp_configure(struct phy *phy,
+				   union phy_configure_opts *opts)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	cdns_phy->link_rate = opts->dp.link_rate;
+	cdns_phy->num_lanes = opts->dp.lanes;
+
+	if (cdns_phy->link_rate > MAX_LINK_RATE) {
+		dev_err(cdns_phy->dev, "Link Rate(%d) Not supported\n", cdns_phy->link_rate);
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
+	ret = hdptx_dp_phy_power_up(cdns_phy);
+
+	return ret;
+}
+
+static const struct phy_ops cdns_hdptx_dp_phy_ops = {
+	.init = cdns_hdptx_dp_phy_init,
+	.configure = cdns_hdptx_dp_configure,
+	.power_on = cdns_hdptx_dp_phy_on,
+	.power_off = cdns_hdptx_dp_phy_off,
+	.owner = THIS_MODULE,
+};
+
+static int cdns_hdptx_dp_phy_probe(struct platform_device *pdev)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy;
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
+	mutex_init(&cdns_phy->mbox_mutex);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+	cdns_phy->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(cdns_phy->regs))
+		return PTR_ERR(cdns_phy->regs);
+
+	phy = devm_phy_create(dev, node, &cdns_hdptx_dp_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy->attrs.mode = PHY_MODE_DP;
+	cdns_phy->phy = phy;
+	phy_set_drvdata(phy, cdns_phy);
+
+	/* init base struct for access mhdp mailbox */
+	cdns_phy->base.dev = cdns_phy->dev;
+	cdns_phy->base.regs = cdns_phy->regs;
+	cdns_phy->base.mbox_mutex = &cdns_phy->mbox_mutex;
+
+	ret = hdptx_dp_clk_enable(cdns_phy);
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
+	return 0;
+
+clk_disable:
+	hdptx_dp_clk_disable(cdns_phy);
+
+	return -EINVAL;
+}
+
+static int cdns_hdptx_dp_phy_remove(struct platform_device *pdev)
+{
+	struct cdns_hdptx_dp_phy *cdns_phy = platform_get_drvdata(pdev);
+
+	hdptx_dp_clk_disable(cdns_phy);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_hdptx_dp_phy_of_match[] = {
+	{.compatible = "fsl,imx8mq-dp-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cdns_hdptx_dp_phy_of_match);
+
+static struct platform_driver cdns_hdptx_dp_phy_driver = {
+	.probe = cdns_hdptx_dp_phy_probe,
+	.remove = cdns_hdptx_dp_phy_remove,
+	.driver = {
+		.name	= "cdns-hdptx-dp-phy",
+		.of_match_table	= cdns_hdptx_dp_phy_of_match,
+	}
+};
+module_platform_driver(cdns_hdptx_dp_phy_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDP-TX DisplayPort PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

