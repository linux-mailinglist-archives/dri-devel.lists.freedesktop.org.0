Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A37755DD2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5310E203;
	Mon, 17 Jul 2023 08:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB5610E203
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asa4gipEpyapTzPAHQ1Sn1I8I67ixIB8noIrt2YwzYyzL1egrxt19HD02+AFlsCYub3LtVXU9nUPS51etVyNMKeTkvoi9q1M+L4FZbgqmvdgraE37Mrq8LjLsPdUrMWv4icCKoV7MEWT8ZwsRa6jUp+JZlLpoEl4S5fzlY618SiQw9EyWQvonH3jYkhfkyzZ5Ysm0j4je3X+nvSwFACn5UtOFSphMDyR7DuGNPF/9dypXfqmPrIs7ASGeX9ragwhVbO4farFEqfK8d/zGp0uwyGwbj6ynX6E7VaucE0lyP8UnNp4dZYpzMzgFJLC2ZUYGsG7C5t/rLHOthMIkobPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OE3J4qALaA4j1ClGIXSN0Vjb+Rw6QXfOuzwrJg+tnk=;
 b=jVkY9z4sjscGhIbeWSly2YOW2CVCwbzq6yzWa0rDIROf2tyTUpZiDI0zpsT+J6jMWYdaVUfFd+o1nSH2tkvjvgS+xUqMAk53GjoD2wfqSGvzvJlBlqiSdQsuxsY7VIGBZOC7WVh7Hzib7A4M2IXlrAYd4/mlEXLI1WpV+dfbRdnkzqMPjN0aSuH2hOm5GAWzC+Fspo7vSFuQUzrAkjTj2PhDzTyvfCeXRsxzQPCa+jsFzqbysIBsOKOAABnCWqMQqOmt1n7iqC6O9r6vHW40b/0Lzj3o/54UrYa9t1uIf7ZOjjGNBTvhcUOpB5+JBuWgEjjHjVm6P9Cx2N5+0zqd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OE3J4qALaA4j1ClGIXSN0Vjb+Rw6QXfOuzwrJg+tnk=;
 b=lVO+i8hh6zKgsmCh4BlmY1T/hGWDHg44yo11eM8i/+xg/FO7uXy9p37pfRdrrqDgflKc4PLqKulesw2rm7jbF6PuZarAHEWbc1K1Zgny+6FRiEj1ph0eKO4M7QgTJAl8liBngD6iaBvz9F8OpLLcfnez38uct/WYzDZ6rT9Qimc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 08:05:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:05:19 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 6/7] phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
Date: Mon, 17 Jul 2023 16:03:52 +0800
Message-Id: <50f342972001f079a0946f7718c6e3fa6aed9503.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 65929e56-ef94-40ed-f5b1-08db869c9027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JtOcD3WKi1WjBgfVrvJiOF/tCDKUAORKmmx2SUUzlNfmaIRApowklomlXijhvQLPZq5Wzcvhy6k2twfueTjZ0rH8vpEM4/RGjHoOoD4gb0+KWa5Pw0hBc36WHmreefb9whseQajhkb2ihGkLbhB2y8sKUKEM3C1BHbUSXn92pU8ENtxyfk1a8Wi+GCd81bfeu0jOw/UwLzLf6DehwOVJI8YCJcvVUx0wrSHjSu/spMBwMl7Vso2AfmRdE9gyyfS6XjwxmQHiDk3xDfNL7lwfNj/UtKhruT46tmrFZM9MPd8iwxt/Xa65XvMQT1lzekZd9vv46Kw26/RgkM60PLMjh2kOPNKFwDnt/1xrlXxXPIw1H0E0biBwiPVSJa+eIUbew3mf4OUh/Nlj7GNpWntVCvBhUc8hHT/yO+cUkjCVmOVzFBrwHbFRiCKA+IXBKKDQ4dL4JMcN02KiMvoUzCGj6UEhlVqd9uhsbf+E3qYX9nNkHIdZ5KUwOlsIeUPUzJHSC2RDynPFts+DjQCjaIJsew7O5RSxCsIAsM9M0HMJEdKUOeR34o8jJm3OsmHIZFSNwrxuwVYG4hliuSjWOWtTObTX+uGgl1VpSRJgFoEHn3M3aXPB88ppCxDS01bm2wAjGY4xOqPUGnLDgZICO+EmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(6486002)(52116002)(26005)(6506007)(6512007)(36756003)(2616005)(83380400001)(38350700002)(86362001)(38100700002)(186003)(921005)(8936002)(8676002)(30864003)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(316002)(66556008)(66476007)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1E4SHc5dFhwZlNVdTRxcUc1VWhvQm96bDN2REUrcHpFa1I2ckU4R1N4Qnlz?=
 =?utf-8?B?OE53dk9qVk5WYm9lb05kYzNjUkNXQ2RTMGVPdU15TG94TXRVbkFSbW8rcXh5?=
 =?utf-8?B?Y2wwZ3dCWTJQT1MzMDNjbXQ2QmliUDBnVG5qWTQ1TTZXZE1VaFFrOXY0eHgw?=
 =?utf-8?B?eit0Yjl4V21tTk8rcWZ6WjVwaVRNQi96N2orQlJPQ082RUp0c0FGcmsxSGEy?=
 =?utf-8?B?MGJwMytzcTZ0VjlZVDN2Zy93Q2daaVhSY1BabUh0Wmhld3dwa3hFQmxiODRt?=
 =?utf-8?B?VnF0Qml0eHZpWjh2ckJhOE44ZkJUY3pjelVtbmRlQkRFeWQ4QkNWcDdNL2hr?=
 =?utf-8?B?cXhudWpzUDF3cUlzR2NPQkF0bTI3UHdQN1NBeWY1S25xRGdPRkJscW5JMXJl?=
 =?utf-8?B?N0o5UW92Q0ZNOWNUVk1pekg0Y2NvNHBNU2JBVjZRQ2czTUR6aHE2QXlsMU85?=
 =?utf-8?B?Q0k4bXZRT2oxSThRQ01YeW0wV2RXNGI4L2Y3aEhQRDBYNzlqUEs5V3pONmxZ?=
 =?utf-8?B?dUtBM3BvVGdRRVlSRU04TTEyOGtEeU1OTVJDU3JPMWFiT2ZiVnpEUzRDa2l0?=
 =?utf-8?B?U0ROZzFDam1JejRSVERjd29GQmNST3VmS1Nnd290OFZtc2E2UHV1dTVTR2dl?=
 =?utf-8?B?d0UxNkJkQWZnb0hRS1YyZ2dLclE5NS9XcUNHZGpGMU5uajBsSHZnbGJtbjRO?=
 =?utf-8?B?L21Eek1vejNIelkxZ1NzcFl2ZnNVK3ZxZXExQ1VnczRRRnp1bXprSTRRSEhI?=
 =?utf-8?B?aDJmNWNhWXNUM1QxdklLdnZEZ2c2Unc3RHlKQ295SUxWSUhRWnhmRGVuaXlT?=
 =?utf-8?B?akR3NEJNRWpoS1p1bU9zYjlSS01CQzE1dWVxSGkyTWNQY0FsYkFVR2NxeDJ5?=
 =?utf-8?B?VXdCMExZdUxlYVlFR0lteXpkbkgwQ0JScjM4YVRyd3BTNTlpN2trS1NwcndC?=
 =?utf-8?B?YzJwc2JZRVExMzFySDZ5YmxUQk1taHAxYVh1TjZFTXl1U293SVdlSDNzWDRa?=
 =?utf-8?B?eFZJUHl3MTk5SCtvOVBHR0krRVhjdlF3bVIyeEw1d0cxQnJqNHBwenJjODRB?=
 =?utf-8?B?NUtiR1RVdlhLYllpekhWZEsvdmRjUTROZU5YRTFZTW5hYUpGbVBweFMvaENL?=
 =?utf-8?B?K0NjbkVCVmVNa3FISEFQUUF1eWFDRmpXdCtoU2dUNG9yK2ZGVXJ4TW51eEJC?=
 =?utf-8?B?ck5JdnhhN1JGblUwNGxLNEk4TEczUVZ4UWdMN0UxSmE0eDlRZHJweTNPb1NH?=
 =?utf-8?B?QVdXZGtuYVhrVDBkNDlhaTlZTU9NM01yNzNNVmZiUjRQU0diaG9sRXh6cXF5?=
 =?utf-8?B?WEpBcjVwRmxFSGZSNTVQa1k2UzUxK09sNHdkN1BJMVdnZDdDdGRZNVpTUm5n?=
 =?utf-8?B?RXY2a2dEa3ZIcVVwZ1Y3UkpjdGVCbjQxWGVqMk5vdi9zb2h1aGRLaWpsTEhU?=
 =?utf-8?B?cFp6SG1ZelVRSWE4akNYUyt5bGpIcUhYcDBOaSt0TDEyY1FkcHkwV0xOS0s2?=
 =?utf-8?B?OG05ZTIzMkVKNkdIT0d5R0FYMWxVcjlvVXpzVFovM041MjFSeWVVYmlPeklG?=
 =?utf-8?B?ODhpNnJRZkdSMDYweEtabDFGdjJoOEovcTIvMExlVWFIYTQveEVEOWpncG9Z?=
 =?utf-8?B?blR0dDBkaEpkdTJvR2Q0MGVvY1pVbXZvSm02N083NUlqbWdtamxGdmlkV0JL?=
 =?utf-8?B?UVU0c2hxOFN5bFBOS3dhYm5mMTRpK1pEb2ZWRFljdjMrSWVnNmcvTnJYTk9R?=
 =?utf-8?B?T0Vmc3VUSHo4cDZBNHVIODdqWW5CMHU0bVp1SUpNVUtTRmpQTlBST3pLdlV6?=
 =?utf-8?B?eHdTVmwzOVdUS0wzMDFPUjdoMkphN1c5TncyWUFuNmZFRzhaVU5QOFYwVWNp?=
 =?utf-8?B?YWdOQ3RhckFuWlJ0UlVRUlFqUHBEQTk2RWxXMkVmVDhwYW9wRU92dWEvM1Yy?=
 =?utf-8?B?Yk0rUmNMQ2Y5UTlxN0pVSkMyRGQ4Z0U5am1JL2s2aTY1b3AxelUwemJCY2lJ?=
 =?utf-8?B?dy9QeXJjQ3J1bG5wM1R6TUtoWlpXWTBPb0JHV3BoUFJob0gxWnV2MGJyaE5J?=
 =?utf-8?B?TUZ1ZmdKQXBYdVlLekZ0VjBZM2tMdGVJaEdtbUllSWk4OUVMeGtISEFaNEM2?=
 =?utf-8?Q?eeFnBk1IwGRZgPcUrB2Ulqkhq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65929e56-ef94-40ed-f5b1-08db869c9027
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:05:19.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQEs++rLefJrb9nJw2AclIrRMRXP5dBGQ0d0lInpSOug/R5846Gr8kQUt8BF9rbMBJNV7wlMn/fXiij7vSmY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025
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
 drivers/phy/freescale/Kconfig             |   9 +
 drivers/phy/freescale/Makefile            |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c | 698 ++++++++++++++++++++++
 3 files changed, 708 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..2999ba1e57d0 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,15 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_FSL_IMX8MQ_DP_PHY
+	tristate "Freescale i.MX8MQ DP PHY support"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence HDPTX DP PHY driver
+	  on i.MX8MQ SOC.
+
 endif
 
 config PHY_FSL_LYNX_28G
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index cedb328bc4d2..915a429d9fbc 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
+obj-$(CONFIG_PHY_FSL_IMX8MQ_DP_PHY)	+= phy-fsl-imx8mq-dp.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-dp.c b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
new file mode 100644
index 000000000000..415273ac6aa5
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
@@ -0,0 +1,698 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence HDP-TX Display Port Interface (DP) PHY driver
+ *
+ * Copyright (C) 2022 NXP Semiconductor, Inc.
+ */
+#include <asm/unaligned.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include <drm/bridge/cdns-mhdp-mailbox.h>
+
+#define ADDR_PHY_AFE	0x80000
+
+/* PHY registers */
+#define CMN_SSM_BIAS_TMR                0x0022
+#define CMN_PLLSM0_PLLEN_TMR            0x0029
+#define CMN_PLLSM0_PLLPRE_TMR           0x002a
+#define CMN_PLLSM0_PLLVREF_TMR          0x002b
+#define CMN_PLLSM0_PLLLOCK_TMR          0x002c
+#define CMN_PLLSM0_USER_DEF_CTRL        0x002f
+#define CMN_PSM_CLK_CTRL                0x0061
+#define CMN_PLL0_VCOCAL_START           0x0081
+#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
+#define CMN_PLL0_INTDIV                 0x0094
+#define CMN_PLL0_FRACDIV                0x0095
+#define CMN_PLL0_HIGH_THR               0x0096
+#define CMN_PLL0_DSM_DIAG               0x0097
+#define CMN_PLL0_SS_CTRL2               0x0099
+#define CMN_ICAL_INIT_TMR               0x00c4
+#define CMN_ICAL_ITER_TMR               0x00c5
+#define CMN_RXCAL_INIT_TMR              0x00d4
+#define CMN_RXCAL_ITER_TMR              0x00d5
+#define CMN_TXPUCAL_INIT_TMR            0x00e4
+#define CMN_TXPUCAL_ITER_TMR            0x00e5
+#define CMN_TXPDCAL_INIT_TMR            0x00f4
+#define CMN_TXPDCAL_ITER_TMR            0x00f5
+#define CMN_ICAL_ADJ_INIT_TMR           0x0102
+#define CMN_ICAL_ADJ_ITER_TMR           0x0103
+#define CMN_RX_ADJ_INIT_TMR             0x0106
+#define CMN_RX_ADJ_ITER_TMR             0x0107
+#define CMN_TXPU_ADJ_INIT_TMR           0x010a
+#define CMN_TXPU_ADJ_ITER_TMR           0x010b
+#define CMN_TXPD_ADJ_INIT_TMR           0x010e
+#define CMN_TXPD_ADJ_ITER_TMR           0x010f
+#define CMN_DIAG_PLL0_FBH_OVRD          0x01c0
+#define CMN_DIAG_PLL0_FBL_OVRD          0x01c1
+#define CMN_DIAG_PLL0_OVRD              0x01c2
+#define CMN_DIAG_PLL0_TEST_MODE         0x01c4
+#define CMN_DIAG_PLL0_V2I_TUNE          0x01c5
+#define CMN_DIAG_PLL0_CP_TUNE           0x01c6
+#define CMN_DIAG_PLL0_LF_PROG           0x01c7
+#define CMN_DIAG_PLL0_PTATIS_TUNE1      0x01c8
+#define CMN_DIAG_PLL0_PTATIS_TUNE2      0x01c9
+#define CMN_DIAG_HSCLK_SEL              0x01e0
+#define CMN_DIAG_PER_CAL_ADJ            0x01ec
+#define CMN_DIAG_CAL_CTRL               0x01ed
+#define CMN_DIAG_ACYA                   0x01ff
+#define XCVR_PSM_RCTRL                  0x4001
+#define XCVR_PSM_CAL_TMR                0x4002
+#define XCVR_PSM_A0IN_TMR               0x4003
+#define TX_TXCC_CAL_SCLR_MULT_0         0x4047
+#define TX_TXCC_CPOST_MULT_00_0         0x404c
+#define XCVR_DIAG_PLLDRC_CTRL           0x40e0
+#define XCVR_DIAG_PLLDRC_CTRL           0x40e0
+#define XCVR_DIAG_HSCLK_SEL             0x40e1
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR   0x40f2
+#define TX_PSC_A0                       0x4100
+#define TX_PSC_A1                       0x4101
+#define TX_PSC_A2                       0x4102
+#define TX_PSC_A3                       0x4103
+#define TX_RCVDET_EN_TMR                0x4122
+#define TX_RCVDET_ST_TMR                0x4123
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41e7
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41e7
+#define TX_DIAG_ACYA_0                  0x41ff
+#define TX_DIAG_ACYA_1                  0x43ff
+#define TX_DIAG_ACYA_2                  0x45ff
+#define TX_DIAG_ACYA_3                  0x47ff
+#define TX_ANA_CTRL_REG_1               0x5020
+#define TX_ANA_CTRL_REG_2               0x5021
+#define TX_DIG_CTRL_REG_1               0x5023
+#define TX_DIG_CTRL_REG_2               0x5024
+#define TXDA_CYA_AUXDA_CYA              0x5025
+#define TX_ANA_CTRL_REG_3               0x5026
+#define TX_ANA_CTRL_REG_4               0x5027
+#define TX_ANA_CTRL_REG_5               0x5029
+#define RX_PSC_A0                       0x8000
+#define RX_PSC_CAL                      0x8006
+#define PHY_HDP_MODE_CTRL               0xc008
+#define PHY_HDP_CLK_CTL                 0xc009
+#define PHY_PMA_CMN_CTRL1               0xc800
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
+	RATE_8_1 = 810000,
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
+	return cdns_mhdp_reg_write(cdns_phy, ADDR_PHY_AFE + (addr << 2), val);
+}
+
+static u32 cdns_phy_reg_read(struct cdns_hdptx_dp_phy *cdns_phy, u32 addr)
+{
+	u32 reg32;
+
+	cdns_mhdp_reg_read(cdns_phy, ADDR_PHY_AFE + (addr << 2), &reg32);
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
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xfff7;
+	val |= 0x0008;
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
+	val &= 0x00ff;
+	if (link_rate <= RATE_2_7)
+		val |= 0x2400;
+	else
+		val |= 0x1200;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* High speed clock 0/1 div */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= 0xffcc;
+	if (link_rate <= RATE_2_7)
+		val |= 0x0011;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val = val & 0xcfff;
+		if (link_rate <= RATE_2_7)
+			val |= 0x1000;
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
+		val = val & 0x8fff;
+		if (link_rate <= RATE_2_7)
+			val |= 0x2000;
+		else
+			val |= 0x1000;
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
+	val &= 0xff8f;
+	/*
+	 * single ended reference clock (val |= 0x0030);
+	 * differential clock  (val |= 0x0000);
+	 *
+	 * for differential clock on the refclk_p and
+	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=1'b1
+	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
+	 */
+	val |= 0x0030;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+}
+
+static int hdptx_dp_phy_power_up(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 val, i;
+
+	/* Enable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= (1 << 0);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL ready ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (val & (1 << 1))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL Ack failed\n");
+		return -1;
+	}
+
+	/* Enable HDP PLL’s data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val |= (1 << 2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL clock enable ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (val & (1 << 3))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL clock enable ACk failed\n");
+		return -1;
+	}
+
+	/* Configure PHY in A2 Mode */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0004);
+	/* Wait for Power State A2 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 6))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A2 Ack failed\n");
+		return -1;
+	}
+
+	/* Configure PHY in A0 mode (PHY must be in the A0 power
+	 * state in order to transmit data)
+	 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0101);
+
+	/* Wait for Power State A0 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 4))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A0 Ack failed\n");
+		return -1;
+	}
+
+	cdns_phy->power_up = true;
+
+	return 0;
+}
+
+static void hdptx_dp_phy_power_down(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u16 val;
+	int i;
+
+	if (!cdns_phy->power_up)
+		return;
+
+	/* Place the PHY lanes in the A3 power state. */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x8);
+	/* Wait for Power State A3 Ack */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		if (val & (1 << 7))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait A3 Ack failed\n");
+		return;
+	}
+
+	/* Disable HDP PLL’s data rate and full rate clocks out of PMA. */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~(1 << 2);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL clock gate ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (!(val & (1 << 3)))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL clock gate Ack failed\n");
+		return;
+	}
+
+	/* Disable HDP PLL’s for high speed clocks */
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= ~(1 << 0);
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+	/* Wait for PLL disable ACK */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+		if (!(val & (1 << 1)))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "Wait PLL disable Ack failed\n");
+		return;
+	}
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

