Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37319730CBA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331810E47F;
	Thu, 15 Jun 2023 01:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2073.outbound.protection.outlook.com [40.107.15.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F3610E47F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noQd2GiXGp1lph19+l5v8MisuQuWJ13t9E+ysCmhvkmnaXdGL7H7x8mpG3rVA0ivT98SviKTBEUypzytKb7dIDPWlcD5ypbc8Usb7rMz4pPs/keN8M3hQFc4MQhDSbhVpj9u8W5TJWA1lHIks9UFMHTbykKgEtXdNPEwHfiftLZg19f3lG7xHuSH3HlRqnOE0WbnWTklPbHg7ABFQEtMXIVxdTfBs73s77FcaogeVZCEXXmKxN7iibxE+rbGWhIwyrN7fkncNlrus5o7zjwtJkaVPr8uK8dRJ5LXHHOD2lW8dd6VDhqm1Hpxmq07VEXLH7qHGZ/YRWxrGB7A828HfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIH/AYymuGZyREmJ/luGrtO/gJkITEc1O/MToNRqjGI=;
 b=eAmq7wtMgHZA5G7IxQtd9YSL6EVh6necRtah1A2xRar5fU89K7e3JD8KrY05KlxKrh7YXthQkzQWmJewzTTPXQZBt4vyVntm8jY0JbyYpZiXk9jYYMrDXkXpLX9e6qMMwFLiqy3kOQI24Ny5YOUPJmD+mkzpaAOK2H78LL+BrtyRdyv76iz8TLlruMVHjh7H6FO+sm4ps1s2HQ2qhSreYUWKQTA/RS/4IAuRXnbWLf5sPUZwg2epDZOxb9fZcftGaIIDMqoCDzWqrlWmWkbt8KUxnEqhy3jmgrLejt+rXbeYeQVYPYw/8jHNVj7eB1iJGlxXrHwZJAJPX/2q4Jdttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIH/AYymuGZyREmJ/luGrtO/gJkITEc1O/MToNRqjGI=;
 b=BlTgQ8vFyQdnhX3vqx17RAts42wtb1iM3jgxY2ZJgavmIOvpnColBc1U+udUWp9DT13kOwFmrBQ/BNiEdWF7nZ8hj26IrP7YU3LSIqomeYha8Oj0Xoj9850M+OS8rP2Xsce49YeIdv2NOi8W73L2OwFgcvaUpkNnelI5xezHKbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:55 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 7/8] phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
Date: Thu, 15 Jun 2023 09:38:17 +0800
Message-Id: <279d6d605656a7ca1bbee6270d66aa218a1b7d3d.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: d5639fd1-b143-425e-45ba-08db6d41b39e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYoEjmRaYt+LezdWDqD/oSTfIFK7anW4+ebhkSVpdV+optDTN0C+GZPIfI3NB2eU0lJ6JNsekDgBULm5XCGszUH4dDTihmh+Y5mybbw9ebuVJwMOAIYEOlNBVx/7sYhN4Fz1EiIYEDmGP2+0KFvQwXONwJCfjJxazylcDzwHI7ea0kwGvyLUek3D04Me98aIUBox3NAk0zwqzexPh8+mAQuJi4485rMksPnlMReTxmGbQO0cRB00PziNRQX4X/KSqqIN17H4zEnTaZQAbHaxprzb454kf7jHfww5Q05Y9XLao1BrdUNyIcWy/o6+fQ6lDQBqckKMpx/LMBIxvQT/kkzn4VNN8slvWcWx8fI3tioIL+Hvwk3OYbef2YWLvWSrphRcW2+SdzjdC7snpp1MRgioBZITONBF1QwUVb0bOLPiHo7ZZCk1KgNdCGwO4EZWcqjhzOARwNh08G0LXmpWhMRgWZ4Yn/AjF+aE6UfVt79lT8TFHkfrtVWZMdoCWE/mWosSZpHyfLbRG35QISsxRVW3ZULFs7BFBEvrVtzRnQwF2vlA3xA524AI5QwXzwj0jhpSXpZjMbH+HIcJmeZFl027TH7ASTnEGm6s9Z2ne7H/KojImsl2+GrflN0+J56OnbZMClXu5eRAof2mSUDzCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(86362001)(4326008)(478600001)(26005)(30864003)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9LWkh2UkhtRFBQOEFraDdiNklBQ1EvYUhEN0xYQjZpY3oyZ1hjTFlnK050?=
 =?utf-8?B?eFNzY2l2Q3BoemI1OHhFK0tjRmhmeUpGUWs0R2JyNXI0NWtZNDJ4Uy9QTk9T?=
 =?utf-8?B?Z0pmWUNhT2Y0UTJ4NHdIck5kNUt0WHlPaEdPZ0k5a25wTkRsK1ppanR5NHZW?=
 =?utf-8?B?NHlVbkJvc2tpQW5Wd1BIMDhwZ2dXellQaG5COEc1clVXRW94N2RydDVNSEY5?=
 =?utf-8?B?STNQUjZLdURneEVvbkZIOUFySXY0bHMyYW0wY0hCN1ZXalJ3UXN0SkUrRndE?=
 =?utf-8?B?eC94Um5Nd2FjQzFFS2dHdXo5ekFrNDkyYjlLakFOdCtOZ282cUJLVWlXak9K?=
 =?utf-8?B?NjNoRjVaYk83aHV6azUvbnRwRXkzSnNrMlZWY3hwNXZXa3JGa2YxUFAxMUVh?=
 =?utf-8?B?THphQU1CZmxJdGpvU2puSVY4alhiQVdnUVNEZHVxbHJEYWxxVW51NW41a0ZU?=
 =?utf-8?B?Ti9VdzZ2V0h0VzZUUTljT2R4TytRMlhoYjRQUmttUW44TnJ3bnpQTjRqRGNk?=
 =?utf-8?B?a2Rwenc3bDJzZnFhQklBakNUdW5xTDIxaHJLL09WTW1tSGZyMEVhek1EMXZh?=
 =?utf-8?B?Y1ZvYnN2TzdWMjF6RDNFbmJiYjhGczJGZDVydzlyQm4rZ01EYS9TK1dmUWZ5?=
 =?utf-8?B?RFZ1K21ZNzdWdHkxdVdxSVVacGp5RDczcENyd0ZDb0NiclI5UFR0SW9lK0Na?=
 =?utf-8?B?bS92eXlTcnVWUzNlcDc0VlFWSEJpVldGaHpwcFd2dURmUExxWll4VGFjS3p1?=
 =?utf-8?B?REEzMzA3N0gyZWsyNGhxL2Nla2p6S2lMQ25UT205UTIvZGRrTWtyMTNsS2FD?=
 =?utf-8?B?TVBaMWxJdlZaZ3NyMElwMjFOTkFTSmZQZ1NaRFFZdVVFR1EzTmVvM3ZrS3d6?=
 =?utf-8?B?SUVQZTI2SDZyelBTUC9FVUI1U2RHM0NDUTFRd3pZV01VbUVxc1gya0lBZGFi?=
 =?utf-8?B?VHRsUkFDMWUrS0dKbkJqSlR4UGE5eHlOb2ZBOWRnOTFhMzg5eTJDVkhDT29N?=
 =?utf-8?B?RkpCU3hBSE9Wc2NmYVd1RXJSYkRBSzNuTXJoZmRZRThmenlnZVJhVjR6Sk52?=
 =?utf-8?B?dUl2TzQ1amhoTXQxT3oyYzJDN3puazhrN1FQT2tQVWgxRGdzQnc5TTdTNTk4?=
 =?utf-8?B?ZlQ3WVFGVk42VWxaWVpEZ0I5S00vZGRyQ3pkWEVKdUxjMlI3aWhXbnFhaUxs?=
 =?utf-8?B?cFhrT3BNU1B0SmZlVnhmSm4zdFVmVFh5b05vQ3pNSnFibjN1T1d5cmVlbDc4?=
 =?utf-8?B?VVVadFU2VVBsQkFDRklmVTZRNzVkcEJtU1NhUW1VV2hSZEM2enJxQnRQaEd5?=
 =?utf-8?B?U1J2eng2cmhXNHpjN3o2WFBMWVB2MWVaOTF0SmVZTzV0T3NmWkF2eHBzVHky?=
 =?utf-8?B?SElGR3o2YlNPV0wwRmFja0tjNi9BcXRZamNCWTU4Z0UweTdHbzVCWEFpekha?=
 =?utf-8?B?ZS8xRFozT0ZScFRzejFvUTU5MGlON2prN2doTGtkRDNhZnFBZlpPZVBlOGhk?=
 =?utf-8?B?amFkS3RKZ1NpWkdnUC9lU3RTQXN5eWpOL0lNVzZYZEkxQllOZGh5bFcxQmNn?=
 =?utf-8?B?dE55dmYrbTFCOVNyL01ScnFEcUloTll1K0lLVU5NK3NtbFpkbEkwSlZZNk9m?=
 =?utf-8?B?c2JOcU1vaHFwS3pPRnpXY1pZZnFUV29rNDVKcjkyS2dTSTRjS0xiU0plRlJl?=
 =?utf-8?B?S1FML0d4TjMvYVRCY29FSFhhU0Y1UlNpWVNIaERsNWY4ZFJGdzN6WFUrdld6?=
 =?utf-8?B?WjZ0WU4vM1VhRkRPMHRmQ1RVZWEzbWd6RHpZUmZFakVWdENUZ2UrRTVNZXRY?=
 =?utf-8?B?eHE0VlRWekhaUlF1bFhRckVEQ294emgxMVkwQ1VSek9VRWdVd0dURmg5R25F?=
 =?utf-8?B?SHkvcENXRFRYVVh2aDFwNnJHcFRLRFpBTUs5emh4eDYrWisyWWcwbzZKRXE2?=
 =?utf-8?B?d3M3eTdkRzEwUkUranNjZFlJRUFtMVJxN2RvcVNPWS9iMWxkMDJSanpFa3FP?=
 =?utf-8?B?cFd3Y01heHpPZ3ptTFlqMnRUeHR0amFpOW5hMXpSRnk0SXZrSXhxNklTK01H?=
 =?utf-8?B?WWx6YjNPeWVIUGtxMHJVd1NOU1Q0ajVpMmtUTS9rZFZaWms1SXV3VFIwYVFJ?=
 =?utf-8?Q?QRiTGXDe9Lk1PCV7wIzrgXbsz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5639fd1-b143-425e-45ba-08db6d41b39e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:55.9076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG/bFks/XOdb7NB4TuqKNQdtTqumF1KbfAGM2rBlsYLmhX2YNk6NuYgLB8uUrPkqQL4snaU2+Tlow6BRFZH4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
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
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c | 697 ++++++++++++++++++++++
 3 files changed, 707 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..a99ee370eda6 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,15 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_CADENCE_DP_PHY
+	tristate "Cadence HDPTX DP PHY support"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence HDPTX DP PHY driver
+	  on NXP's i.MX8MQ SOC.
+
 endif
 
 config PHY_FSL_LYNX_28G
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index cedb328bc4d2..c3bdf3fa2e72 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
+obj-$(CONFIG_PHY_CADENCE_DP_PHY)	+= phy-fsl-imx8mq-dp.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-dp.c b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
new file mode 100644
index 000000000000..2bd6772a5d3b
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
@@ -0,0 +1,697 @@
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
+#define CMN_PLLSM0_PLLPRE_TMR           0x002A
+#define CMN_PLLSM0_PLLVREF_TMR          0x002B
+#define CMN_PLLSM0_PLLLOCK_TMR          0x002C
+#define CMN_PLLSM0_USER_DEF_CTRL        0x002F
+#define CMN_PSM_CLK_CTRL                0x0061
+#define CMN_PLL0_VCOCAL_START           0x0081
+#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
+#define CMN_PLL0_INTDIV                 0x0094
+#define CMN_PLL0_FRACDIV                0x0095
+#define CMN_PLL0_HIGH_THR               0x0096
+#define CMN_PLL0_DSM_DIAG               0x0097
+#define CMN_PLL0_SS_CTRL2               0x0099
+#define CMN_ICAL_INIT_TMR               0x00C4
+#define CMN_ICAL_ITER_TMR               0x00C5
+#define CMN_RXCAL_INIT_TMR              0x00D4
+#define CMN_RXCAL_ITER_TMR              0x00D5
+#define CMN_TXPUCAL_INIT_TMR            0x00E4
+#define CMN_TXPUCAL_ITER_TMR            0x00E5
+#define CMN_TXPDCAL_INIT_TMR            0x00F4
+#define CMN_TXPDCAL_ITER_TMR            0x00F5
+#define CMN_ICAL_ADJ_INIT_TMR           0x0102
+#define CMN_ICAL_ADJ_ITER_TMR           0x0103
+#define CMN_RX_ADJ_INIT_TMR             0x0106
+#define CMN_RX_ADJ_ITER_TMR             0x0107
+#define CMN_TXPU_ADJ_INIT_TMR           0x010A
+#define CMN_TXPU_ADJ_ITER_TMR           0x010B
+#define CMN_TXPD_ADJ_INIT_TMR           0x010E
+#define CMN_TXPD_ADJ_ITER_TMR           0x010F
+#define CMN_DIAG_PLL0_FBH_OVRD          0x01C0
+#define CMN_DIAG_PLL0_FBL_OVRD          0x01C1
+#define CMN_DIAG_PLL0_OVRD              0x01C2
+#define CMN_DIAG_PLL0_TEST_MODE         0x01C4
+#define CMN_DIAG_PLL0_V2I_TUNE          0x01C5
+#define CMN_DIAG_PLL0_CP_TUNE           0x01C6
+#define CMN_DIAG_PLL0_LF_PROG           0x01C7
+#define CMN_DIAG_PLL0_PTATIS_TUNE1      0x01C8
+#define CMN_DIAG_PLL0_PTATIS_TUNE2      0x01C9
+#define CMN_DIAG_HSCLK_SEL              0x01E0
+#define CMN_DIAG_PER_CAL_ADJ            0x01EC
+#define CMN_DIAG_CAL_CTRL               0x01ED
+#define CMN_DIAG_ACYA                   0x01FF
+#define XCVR_PSM_RCTRL                  0x4001
+#define XCVR_PSM_CAL_TMR                0x4002
+#define XCVR_PSM_A0IN_TMR               0x4003
+#define TX_TXCC_CAL_SCLR_MULT_0         0x4047
+#define TX_TXCC_CPOST_MULT_00_0         0x404C
+#define XCVR_DIAG_PLLDRC_CTRL           0x40E0
+#define XCVR_DIAG_PLLDRC_CTRL           0x40E0
+#define XCVR_DIAG_HSCLK_SEL             0x40E1
+#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR   0x40F2
+#define TX_PSC_A0                       0x4100
+#define TX_PSC_A1                       0x4101
+#define TX_PSC_A2                       0x4102
+#define TX_PSC_A3                       0x4103
+#define TX_RCVDET_EN_TMR                0x4122
+#define TX_RCVDET_ST_TMR                0x4123
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41E7
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41E7
+#define TX_DIAG_ACYA_0                  0x41FF
+#define TX_DIAG_ACYA_1                  0x43FF
+#define TX_DIAG_ACYA_2                  0x45FF
+#define TX_DIAG_ACYA_3                  0x47FF
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
+#define PHY_HDP_MODE_CTRL               0xC008
+#define PHY_HDP_CLK_CTL                 0xC009
+#define PHY_PMA_CMN_CTRL1               0xC800
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
+	{{ 0x010E, 0x010E, 0x010E, 0x010E, 0x010E, 0x010E, 0x010E }, CMN_PLL0_VCOCAL_INIT_TMR },
+	{{ 0x001B, 0x001B, 0x001B, 0x001B, 0x001B, 0x001B, 0x001B }, CMN_PLL0_VCOCAL_ITER_TMR },
+	{{ 0x30B9, 0x3087, 0x3096, 0x30B4, 0x30B9, 0x3087, 0x30B4 }, CMN_PLL0_VCOCAL_START },
+	{{ 0x0077, 0x009F, 0x00B3, 0x00C7, 0x0077, 0x009F, 0x00C7 }, CMN_PLL0_INTDIV },
+	{{ 0xF9DA, 0xF7CD, 0xF6C7, 0xF5C1, 0xF9DA, 0xF7CD, 0xF5C1 }, CMN_PLL0_FRACDIV },
+	{{ 0x001E, 0x0028, 0x002D, 0x0032, 0x001E, 0x0028, 0x0032 }, CMN_PLL0_HIGH_THR },
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
+	struct mutex mbox_mutex; /* mutex to protect mailbox */
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
+	if (ref_clk_rate == REF_CLK_27MHZ)
+		cdns_phy->ref_clk_rate = ref_clk_rate;
+	else {
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
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA018);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030C);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA098);
+	ndelay(150);
+	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xA198);
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
+	val &= 0xFFF7;
+	val |= 0x0008;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* Startup state machine registers */
+	cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR, 0x001B);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR, 0x0036);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR, 0x001B);
+	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR, 0x006C);
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
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  | (k << 9), 0x016D);
+		cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR | (k << 9), 0x016D);
+		/* Transceiver control and diagnostic registers */
+		cdns_phy_reg_write(cdns_phy, XCVR_DIAG_LANE_FCM_EN_MGN_TMR | (k << 9), 0x00A2);
+		cdns_phy_reg_write(cdns_phy, TX_DIAG_BGREF_PREDRV_DELAY    | (k << 9), 0x0097);
+		/* Transmitter receiver detect registers */
+		cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k << 9), 0x0A8C);
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
+	val &= 0x00FF;
+	if (link_rate <= RATE_2_7)
+		val |= 0x2400;
+	else
+		val |= 0x1200;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* High speed clock 0/1 div */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= 0xFFCC;
+	if (link_rate <= RATE_2_7)
+		val |= 0x0011;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val = val & 0xCFFF;
+		if (link_rate <= RATE_2_7)
+			val |= 0x1000;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)), val);
+	}
+
+	/* DP PHY PLL 27MHz configuration */
+	index = link_rate_index(link_rate);
+	for (i = 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
+		cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i].addr,
+				phy_pll_27m_cfg[i].val[index]);
+
+	/* Transceiver control and diagnostic registers */
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
+		val = val & 0x8FFF;
+		if (link_rate <= RATE_2_7)
+			val |= 0x2000;
+		else
+			val |= 0x1000;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
+	}
+
+	for (k = 0; k < num_lanes; k = k + 1) {
+		/* Power state machine registers */
+		cdns_phy_reg_write(cdns_phy, (XCVR_PSM_RCTRL | (k << 9)),  0xBEFC);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A0 | (k << 9)), 0x6799);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A1 | (k << 9)), 0x6798);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A2 | (k << 9)), 0x0098);
+		cdns_phy_reg_write(cdns_phy, (TX_PSC_A3 | (k << 9)), 0x0098);
+		/* Receiver calibration power state definition register */
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k << 9));
+		val &= 0xFFBB;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_CAL | (k << 9)), val);
+		val = cdns_phy_reg_read(cdns_phy, RX_PSC_A0  | (k << 9));
+		val &= 0xFFBB;
+		cdns_phy_reg_write(cdns_phy, (RX_PSC_A0  | (k << 9)), val);
+	}
+}
+
+static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_dp_phy *cdns_phy)
+{
+	u32 val;
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xFF8F;
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
+				     union phy_configure_opts *opts)
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
+	} else
+		dev_err(cdns_phy->dev, "Not support ref clock rate\n");
+
+	/* PHY power up */
+	ret = hdptx_dp_phy_power_up(cdns_phy);
+
+	return ret;
+}
+
+static const struct phy_ops cdns_hdptx_dp_phy_ops = {
+	.init		= cdns_hdptx_dp_phy_init,
+	.configure	= cdns_hdptx_dp_configure,
+	.power_on	= cdns_hdptx_dp_phy_on,
+	.power_off	= cdns_hdptx_dp_phy_off,
+	.owner		= THIS_MODULE,
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
+		ret =  PTR_ERR(phy_provider);
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
+	.probe	= cdns_hdptx_dp_phy_probe,
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

