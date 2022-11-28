Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF563A22D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D6410E21B;
	Mon, 28 Nov 2022 07:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2057.outbound.protection.outlook.com [40.107.13.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3B10E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctemrw3PqBGmk+BeIR3euTVeMT0TnTuD04OqkLiHXYjy7Y9lDfFeeY2n1Jrb+wgTmZywe13QCaa8flDTswBBS/2Wrrn4ig2CU05oyQxo8XvhkjujyQAAzwP2HgXejLQ/ONRJTs7G8204hd36+pstgRPdmlIB5IsLsdG53o7/owGzsL0a1cIpPo+TM5C73kwlffjU4QqSohoLEW5eVqlxJBagxxJz+/Cyd9z+FABLlnWA7Js/oVES/GY6Gs4oPtxRxXdpc1NSJRRXrM9Vp5a2qNsxr5sMHgcIMRDqiny4B7d10s83ik/rxWOF/lA1IpiaLIfuq4Q0wggzZYnLpa7eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G84HOVTIzfvm2LSS4DNpbhY58TaClaBEwP+Dbwcf9Uw=;
 b=M7eD+zv1utEshflX4qyc8O/2Hx3Jc7/OmPbdwp/WCqQHr444XKOOYSlVepWZ7JCorWFYbRuJ9/CcCLcihCRhX2TMeBluNkYivb+9tvyyMAtkJyZQ8+8x3ZtgqDxIodRzAax+GtEQKVomClINoIxvHiPeq+emF72PK4mW7NqGR0Rv1W4z2La2N3IJ14sREh/NhcOhzCFRSEzzgzwnJAAOys9IfDiu4bXkyjY2psCUXbp22ferX9IHJDmotC5scsKwzLeJ4Spa9H5WA+MvnZzx0KgJe4wLCkokmc7aLyY8M4X7mSFHKdhQhmf+zFTR/QuMWxPSMoXbA7SodNNh+Dxjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G84HOVTIzfvm2LSS4DNpbhY58TaClaBEwP+Dbwcf9Uw=;
 b=peJGOoW3GEnXSNzYFimzkwbRSJDm+wm2qCKOf0/wl2NgWq+jkcsiohTy3xnU36Y/gJBVSrKkQziY4PG9HbirhCH8EVMeEeG0k/w823GvTnln/6O8j0iR0cRPYzhZ7/MDP3kVZzpmdU0N8wF5BuMf9ncjRqEprJyTGbitvYUTc94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Mon, 28 Nov
 2022 07:38:44 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:38:44 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 08/10] phy: cadence: Add driver for HDP-TX DisplyPort PHY
Date: Mon, 28 Nov 2022 15:36:16 +0800
Message-Id: <b8f50894cf73ab8d5fb4da9392e662f6c5bb0d5b.1669620155.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669620155.git.Sandor.yu@nxp.com>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd2ae9c-37fe-4318-1e8a-08dad11393b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjVeV6DQTmD7pQhz5+35z52ruOr1Xxi1L6oWf/A+YKj3OI59fIepJ0q9RvJ5Q6FrYbJrDudLlgGQXIlAoU07N52MzlH3VG/yHgFDQ4GEU/RSOU/nPHGcGlnQxC54ch3WnaYJQVoFuqMQIWDfNLmbPltlaxVrSuNZG3weAmZFxlBeoWjB9Rv8wjehjexYciAYObB9Pav4Dy6LXYGWVsJ9pEft+aehl4CoMXxhg6cEN/vRNtMl2AwdAFX4mu25zSXF1Nl6yjeXZMVBoY5mccTLkZcuPb8PYSe4002FXkBUhpynx8/MWAiuv1ZB2pbGp7HB7K2UnC4GxUa2bHhWDk+TxfYAHcV5lvThRHXBvZZ3Q2kqzl1oaU/3H1eOeOyCeaZMGLAB5FT/9FvhKEt3b8fuCmelCZHe5TDHYKGEyutsVGiafxfqQwF/wsiYtnHAYTJdIH5VMmjzUvv069q7tUtmsR7ln+uOQIQv+FBVrqmArTeM7SkJUktVDJ2jkKcXyNxPgEuW0kkdCffwbUP+oc121Rz0P/W2u2yeykRQQLNOO9aocsqTt80lZ7TWP6im7Lw8h7iw2seqDnd+lMK6CLlv6yQVi/LVR0jDiR8pdz+cVX4Xgbd/+AnOHbSLiZCeRof+rOt2Q+2Lw0SFVBki0enBXccQnCVabu04cvssWhI0OX9v7YcLFB1eDcroesfOMQGfUAkouLi8cYRpV0to1Fw5FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199015)(38100700002)(38350700002)(478600001)(6486002)(30864003)(83380400001)(7416002)(2906002)(921005)(186003)(6512007)(316002)(26005)(2616005)(86362001)(41300700001)(5660300002)(8936002)(36756003)(8676002)(66946007)(66476007)(66556008)(6506007)(52116002)(6666004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJwdGgydzZibnY4K21STDFRT2tCSzZYVkFDS3FMM25RTjliWEEvL2lCaEl2?=
 =?utf-8?B?QlFmMkhvOTFyeExQNVdoOTVPeC93ZEx3Nk4zWnRhV251Q0Q5WmJUcHFhNUFB?=
 =?utf-8?B?Q0daQmN3ZS9TcDRqWWQvUGwyd3k3dlovZ0tiL0NWa05oRzMvSmZKclZWS3o3?=
 =?utf-8?B?MWlTZ3AvK3NxZGVITHhlQytsVVA1dElPbG9KaFk3VXBqUnRleVppLzQ1TE5x?=
 =?utf-8?B?aGNhWVQrQVlLb21kN1pQV0Y2YUJneDhWNFlwemZDejJWU1UyTlZ0RFptbEVa?=
 =?utf-8?B?bVFWeVI4c3d0Mm1ZaG5iNFhock5neUJIbnpITUJDdEtKSmZmL0FqMVRzNDJ0?=
 =?utf-8?B?aXVNaTlqRFJmNVpVbkFTM0JyeHYySEt1bC9QYjBKb1VPWHNzNDQ1UmFJK2g5?=
 =?utf-8?B?TnBiZ1BDMU1iZW1lNVB5aU84a2kwZTBlblVIdkVvTVU1MGdGUEc2SmQxNmZV?=
 =?utf-8?B?c1VCR2M0RG9KNkVLclRIaTVmSTFhOWRXQk15WkJUT1Z1ZVFzRndLNkJZdUR4?=
 =?utf-8?B?d3I3TUE2MDBLSG82Tm9VVEtMb3FMVlV3QS92YXBVZy9ENGd2ejI1VmRjKy9z?=
 =?utf-8?B?MmJobG00R1l1K1BYNUE5Q040aHNGbTlmSkpWRW5FRTNObzNMQU5Jd2d0SDNK?=
 =?utf-8?B?Ry8xSUJoU2RENXRwSG1qSTRvMGF3ckRmOS90MHhQSTE1Sjh2U3V2bGhIcCsv?=
 =?utf-8?B?V1had1d4Skl6RWJvSG1BcWJvbzV3UHpEVk9XbGRHcjFNNUlPRkhVMmtOT3k4?=
 =?utf-8?B?c2tza1N3SmI0R1pOYUVaQlpMWjlPeGN3WjZPM3N0YTJ5TE0zYjA3QlZycFJy?=
 =?utf-8?B?TGhBZ2NMUFd3Uk1DOUtjc1Rxek5ZVnAyQWJwV1FuMW5qSlBNYXFWVjFiUWlN?=
 =?utf-8?B?Z2tZanJNSDFiOXNTWUpKT3JJaGUwRTdFN2tDR0FYR2ttd3Y4bXBsTXN1eVdV?=
 =?utf-8?B?MG16NTFYeTBCazJLNy83YzB3TXJLRkI5STZpa2VRdzJqbm5tM2lYUGM1UkFW?=
 =?utf-8?B?ejBUaWdUOWF3eEExWVN5cEFkRVJ5TlkwVnJTWEJJSTJIYVJEWlhMUGpHYlBL?=
 =?utf-8?B?dkYwMHhlWitaRERJRnVFN1pmVDIwZGpZL3dIaE5ISWtRQXh0OUs3ZmVTalRF?=
 =?utf-8?B?Rlc1cDZMeE95Z0hXVmUzclMvcnVmbjduZXBZRDdUL3R5bDlBdjk2WWhEbGxs?=
 =?utf-8?B?eXJHQUJWeUNWckl0NDdDUG5lSVNiRk94OHJGc2RZKzVkOEJMOGc4R2dwUnE5?=
 =?utf-8?B?QWw0NkFnaGNsSzNGK1Z2VWZuNnF0WkN5bDZxUnFCVDc3VkMwcDQrc0JvWExY?=
 =?utf-8?B?K292L3VFaXFaL1FMODB1VkZDWWpMR2Z5aVM2c255eFI0elpwMEhtallta0Rx?=
 =?utf-8?B?cnJBNmhrMUJkL1NVT21henliVXdxZTFZL3hHd3BLUTRqbTFPN0pKaVZ4Ym43?=
 =?utf-8?B?OTVTcjZkSkVqeldQQ2xFNXIxV2d1bThHMlBDY0l6QUZ2ZkVFaG9SZkRYR0x0?=
 =?utf-8?B?QWREcXNESUdTZ3FRN1BXbFl2a3NpWXliRmxEL25kS3VwOWQrekg1UWxzUHVV?=
 =?utf-8?B?MkM2RHBabjJIRWpIRHRPVWpyWUNMOHRYNFBoZWo3QWNLWTVNc2ZaQlNIRkRY?=
 =?utf-8?B?eUpyRkE3VlNzMEhLS1RkN1FTZmVHSDlweXVFZEx5WFh0a3kydkphOGkydnpD?=
 =?utf-8?B?WGxRaEYwM0x3KzhWem1MOUs1Z0hjT3FiL3ZFbnZrVzIyR2QyQ2NDbiswSTRP?=
 =?utf-8?B?NHZ2U3lHYW9jczJ4bld4VzI2dGRJUjMwVUU5c1lRV0VHbGFhRkNmaUJnbDFj?=
 =?utf-8?B?aGRPU0taTm5BYVZ2Zy80TC8xNFpzVUtvQWJqa3N2V09CRVdCVU51KzAvdXhs?=
 =?utf-8?B?UE11empnbFNEaXJSVEt5bHJJRXQ0K3ZveWRxQk44V0dITmxheFJLa09PcjIz?=
 =?utf-8?B?TExyMG1VY1BJdmRDbzBDN1FFTlRxYXpYcVM4K2ROVk8vSEVlaUxmaWJRTHVL?=
 =?utf-8?B?L0o1c0g5Q1ZoQmtqUUNuTndMdkU0S2lnM3d6N1VHcjZucHZSSURvQnZrZE5W?=
 =?utf-8?B?OUtEcVlDOWYyNXc4TG8xUlJQU20wdFpzY3huZnk1SnVmaERvZDZGc2NJUFVB?=
 =?utf-8?Q?GHHxbSZO4EfcZXRg/tELJ9rWu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd2ae9c-37fe-4318-1e8a-08dad11393b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:38:44.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A/mgoh8dMh3RXrOQuft3FeGwb0+BE69wUI1yKuX1kKxygmz6prgFRLIq5xmzpjWp2985FHjWEsdwZfm+I7v6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366
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

Add Cadence HDP-TX DisplayPort PHY driver.

Cadence HDP-TX PHY could be put in either DP mode or
HDMI mode base on the configuration chosen.
DisplayPort PHY mode is configurated in the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/phy/cadence/Kconfig                |   8 +
 drivers/phy/cadence/Makefile               |   1 +
 drivers/phy/cadence/phy-cadence-hdptx-dp.c | 737 +++++++++++++++++++++
 3 files changed, 746 insertions(+)
 create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c

diff --git a/drivers/phy/cadence/Kconfig b/drivers/phy/cadence/Kconfig
index 1adde2d99ae7..7c662a57b812 100644
--- a/drivers/phy/cadence/Kconfig
+++ b/drivers/phy/cadence/Kconfig
@@ -30,6 +30,14 @@ config PHY_CADENCE_DPHY_RX
 	help
 	  Support for Cadence D-PHY in Rx configuration.
 
+config PHY_CADENCE_HDPTX_DP
+	tristate "Cadence HDPTX DP PHY Driver"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence HDPTX DP PHY driver
+
 config PHY_CADENCE_SIERRA
 	tristate "Cadence Sierra PHY Driver"
 	depends on OF && HAS_IOMEM && RESET_CONTROLLER
diff --git a/drivers/phy/cadence/Makefile b/drivers/phy/cadence/Makefile
index e17f035ddece..5e7d92a4c9aa 100644
--- a/drivers/phy/cadence/Makefile
+++ b/drivers/phy/cadence/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_PHY_CADENCE_TORRENT)	+= phy-cadence-torrent.o
 obj-$(CONFIG_PHY_CADENCE_DPHY)	+= cdns-dphy.o
 obj-$(CONFIG_PHY_CADENCE_DPHY_RX)	+= cdns-dphy-rx.o
+obj-$(CONFIG_PHY_CADENCE_HDPTX_DP)	+= phy-cadence-hdptx-dp.o
 obj-$(CONFIG_PHY_CADENCE_SIERRA)	+= phy-cadence-sierra.o
 obj-$(CONFIG_PHY_CADENCE_SALVO)	+= phy-cadence-salvo.o
diff --git a/drivers/phy/cadence/phy-cadence-hdptx-dp.c b/drivers/phy/cadence/phy-cadence-hdptx-dp.c
new file mode 100644
index 000000000000..75f331ed6cec
--- /dev/null
+++ b/drivers/phy/cadence/phy-cadence-hdptx-dp.c
@@ -0,0 +1,737 @@
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
+#define MAX_NUM_LANES		4
+#define DEFAULT_MAX_BIT_RATE	5400 /* in Mbps */
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
+	u32 max_bit_rate; /* Maximum link bit rate to use (in Mbps) */
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
+	if (of_property_read_u32(node, "cdns,num-lanes",
+				 &cdns_phy->num_lanes)) {
+		dev_err(dev, "%s: No \"cdns,num-lanes\"-property.\n",
+			node->full_name);
+		return -EINVAL;
+	}
+
+	phy = devm_phy_create(dev, node, &cdns_hdptx_dp_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	cdns_phy->max_bit_rate = DEFAULT_MAX_BIT_RATE;
+	of_property_read_u32(node, "cdns,max-bit-rate",
+			     &cdns_phy->max_bit_rate);
+
+	switch (cdns_phy->max_bit_rate) {
+	/* valid bit rate */
+	case 1620:
+	case 2160:
+	case 2430:
+	case 2700:
+	case 3240:
+	case 4320:
+	case 5400:
+		break;
+	case 8100:
+	default:
+		dev_err(dev, "unsupported max bit rate: %dMbps\n",
+				cdns_phy->max_bit_rate);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "DP max bit rate %d.%03d Gbps\n",
+		cdns_phy->max_bit_rate / 1000,
+		cdns_phy->max_bit_rate % 1000);
+
+	phy->attrs.bus_width = cdns_phy->num_lanes;
+	phy->attrs.max_link_rate = cdns_phy->max_bit_rate;
+	phy->attrs.mode = PHY_MODE_DP;
+
+	cdns_phy->phy = phy;
+	phy_set_drvdata(phy, cdns_phy);
+
+	if (cdns_phy->num_lanes > MAX_NUM_LANES) {
+		dev_err(dev, "Invalid lane configuration\n");
+		return -EINVAL;
+	}
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
+	dev_dbg(dev, "link: (%d lanes)", cdns_phy->num_lanes);
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
+	{
+		.compatible = "cdns,hdptx-dp-phy",
+	},
+	{}
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

