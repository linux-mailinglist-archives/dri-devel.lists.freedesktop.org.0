Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41993755DD5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E89710E204;
	Mon, 17 Jul 2023 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6AE10E205
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdOuzJfqluuwOUzKwv9ECRZKiMXYCJ4mDVuMciUczrMJVRrmTzkf6EG3hugTuiIfSeEAC4tQ6uAatgWtWNK+J4dVAie/ntImwFC2GTKpexazYcVN/hc1wetU/7XUEn8B29akHz58xZJYpE4e6m/30aoccJ670oniFGoTOfYLK2S47rSwrNPqFYd/5zDX9Lo1T0J6qJKzPfWkRgryzVd0qNggxDv0yKTRHFi9BiSs7XNXZAyVMrepqau9ztlSHumY3/QXHHNYldZbGA8qRkhuR2MyrqxSbIck0zMW1VqLWRgOP93vO855/CX8HfhgMcrKYEskxR171j37znzNdfRXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVviy5ybOcRAR7uvY6hxeQObFkfq7Ef6L3Qsx2rtIlQ=;
 b=LrLaxgrpuIVIbdMGOx23Ia1nrnqD98FjFfWzGVA4za0ctGhkedYB/e8c64isPkVQrJJN0m2ME40mmDv58m3U+tRiGaH19jTkGhYEPIL5gioLoi0/8Z2hc8Rakh09r8bViEAGetld7pn+4ovXNQt/4sVi1h0vNQMdl99j4iGp68wiZ6qKlWKYwZwgIu6HHMnfQVXmccWOVh7pIzes0CY68OUEQHpG8V8yhqOFy6a6/7JBvyp/B1uVBJdLJckPmEEF4BwWVFxK3NHeZKalze3vUsL1/YxALFN7GQx6IIr8muU76Tqm3fc6HTJdDD6Dbw+dkMxrwLM5ZUBQdGMlzaialg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVviy5ybOcRAR7uvY6hxeQObFkfq7Ef6L3Qsx2rtIlQ=;
 b=csL8f+vZ6pPsGdfO5jqwp1Y6IVrrskpnQbG7xT0xcPXOzMEDOTWmd5thdVq9BBMQf/oPgAJB7X1DhMgUV0fwA3KNOTupAGtfmI96qKdCq2RDI36z81KH3x+vMUPjkrU28sUoVSnRwz7YHPzvstAiCaXM9A7WZ75HDoqbSPnG5r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 08:05:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:05:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 7/7] phy: freescale: Add HDMI PHY driver for i.MX8MQ
Date: Mon, 17 Jul 2023 16:03:53 +0800
Message-Id: <9798b02ae5d2f32a2a626b7cfc54a81200271d61.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 859991da-a878-4ec1-44f8-08db869c9437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kWVeUIVf94TYj2Q+RNWTs6hAcpM4dOCPC0vdoQQNDK5NtJ4kM+UsOF5Na6XdURBM0AiXblPLJK2CT2wCEh2SWAr/n1vagJk02w2EQeJgsoUuuU/85vn1fxuwCf7d9sLrG6kWoPIlxpfyC8QD3VMvxuPYuermBTbBrc+0J8vLFT3mXSqXHPrx/oRgwCa2/6n4uAx8B2HxZmC+nlfz17I8+aNFOE6MvkcrJjdqnHTAxo8aIguqYupmM9/YaLlL7X8ik9pBWzBllIt5roy8arcdrmc/q6rv5N+ItQZUHOsoK7bEN9W44iMAi16kNpysvKErItLdbdFRX9olZYOTiFoNISOcTmRpZmtWCsvuLwfkuzYXfhk4UfmVcmjWH/fkeRWKrPTz6M0liKJTuOZyGhil4rZ2M3VDFZDTJnkGeQWwN/rW4WGrPxysICQvU1PW5sOOqFiU5JntnA4Gcm4p7sfi4/6fjr0SsW8HqLJZ0BtOko+makDI2TEsl/qSqxTluzRipUdVwPTmU4P+FJbkZyvn5LEWFe0TJL5VwAjZC7yK7LCMLFz5OjiulxxyfalNEcDMif9OaIkfj9Yw4F1yTvxk2z/y11lPMixyKF82dR93GIxH7rwjobUXPQJvkBCWZjy4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(6486002)(52116002)(26005)(6506007)(6512007)(36756003)(2616005)(83380400001)(38350700002)(86362001)(38100700002)(186003)(921005)(8936002)(8676002)(30864003)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(316002)(66556008)(66476007)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1I1PR/40yiNPkUSKQ1fQUWy4+W91bEpQQyMAZIFhgcYNKfj+bmvx98l8fx2?=
 =?us-ascii?Q?rzKycReWILGmJTI7NIHxUDetnMqc2/MjjuppQvnsI+p6/8tgbGFAVEYD03qj?=
 =?us-ascii?Q?iTe7ZEwQDhvqyDyXOvTOsarLTwr1ZpQlyZO4b1isAJT6uGMiJqwFe3u2fv+n?=
 =?us-ascii?Q?jz4cEAnh31Rbv+lhm49/qGf/DMXw3XmX6tWMFeoGJHj390uMp7mFEmQ60Exf?=
 =?us-ascii?Q?BvyrMO6Nj/IBq0GBTyx/pXRkoDV8FoTzt4iA7GeG7dKvaZFkFBRDTt0tk6bs?=
 =?us-ascii?Q?lYruK8Viqlhy1PWRrwUiGoTibom53DlN1hzbNYKqZoHLnXPKjmasHE471So3?=
 =?us-ascii?Q?9uIytuG1o3LevtEIyph7Zxb/Xqe2OAJlubBsVx3O95o4e8fpUJaWBgns2awy?=
 =?us-ascii?Q?ijTno+1hmKNJljhOxb8GAu2k/hD5raTe0kCeICtHuhjkAqB7x+Xd0QIZwp8I?=
 =?us-ascii?Q?c4EexyVNCx6SQ5e9DzFjen5GV4+K3PfwWjEkklnw1NblNmLSg4a3qcoyyqGl?=
 =?us-ascii?Q?VTSnMLnjpPWavWmNt3Zb0l6OTsNlaX9b2+6Rm/nBzctoZVB9M/n8T/HcMrSg?=
 =?us-ascii?Q?HVnOE19H5ifWD6VbOA43AroKKViptIqDQcHdpfI4b5gHDCUlgzsy8EUCxBoO?=
 =?us-ascii?Q?6znoy+12B5QHtyI4pCF4ofD2Oh8oCvxMSAAS0naMYmDNPANU1yXV1sM5HYCe?=
 =?us-ascii?Q?TIIbIprUsMqiSBfkM0s+jTIstcGjVD36xcaTyONcQwdurfVFhJFqajnwU7AE?=
 =?us-ascii?Q?CgUtJ6YFXflN392XqoWMNyffRzZZ8lr8BuUBijbTbLjYD5BpZD8ajxccS3gn?=
 =?us-ascii?Q?3gem1KoEZYxSer1wrxJ7t+aNF+y14fVveWqwgzh2BdllDrzjc86+hBBstDbA?=
 =?us-ascii?Q?ES0/GPlAujA6yCS1mXN0jzIeDJjzJzezRWCfj8i4nWSNf8JlVC6YAONkOQBs?=
 =?us-ascii?Q?KnVzcCUuhRNVeTUrZi8KBZkTAtDwDJ7/PFULSOddB99szJYD84jQ+FK8Misa?=
 =?us-ascii?Q?b9OUmvfKAVhfApC+8r836BQZZC5Kdt0o9eXKxyvREy6QjXPShDDIHal2xpWo?=
 =?us-ascii?Q?1syDtEk+DA4C+mb8MRALVtXS+wekcz7veEEXGvnni0sU/qK45Mo8TsFY1fo8?=
 =?us-ascii?Q?mgSPxVlpYmPSDBmMzBzCDoUxwI4ODD+kjb1QbgiAKMaGq/Tt27Bi2lUnulD4?=
 =?us-ascii?Q?9zjuN/3C6ByZVRFCAdHaCKoM7WTUAmezq+q+yZELvLYqlaQHb9Tj9ACMz1yZ?=
 =?us-ascii?Q?ci0WD/QUQ61/aYzySoeDH+6t6KSRe6+oSyqIXRu0j90D6iywpKs4q5Y9cHfQ?=
 =?us-ascii?Q?Yq5LgTHbrybDRHzZU/hcLi4A9K8mrKXDGsd3Gq8BYRKrJ4Dj2LSRGZ3KNWt/?=
 =?us-ascii?Q?AHUBBN3Q6Rl5+3zzSClZMkWWMMGDONG/pu4XeqsJ9V/4k+DBoEE/+cehybrY?=
 =?us-ascii?Q?7Gv0nAEPZBD9Il31oMaHQDJuc4stR4iEhEelFm22ROUtuLV1hzyDq0feAeFz?=
 =?us-ascii?Q?6cK/MVNIhovJOXZLBnvgBYHrZ3YVk0YY1JJjoPRB7O1eH1eJ7dYrRrSQ1XHY?=
 =?us-ascii?Q?5TymFj2SY9VqKn++SyWBIfCJZgwA6jzmjdhI9Qcp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859991da-a878-4ec1-44f8-08db869c9437
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:05:26.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZEoqE+upKht9t5TBVtScnL7P9gFwn0N2DkAtmNPlfK4jXDyyWi1/bjomKwX6cQG/+9du92RVBVBovd0QXIi6w==
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

Add Cadence HDP-TX HDMI PHY driver for i.MX8MQ.

Cadence HDP-TX PHY could be put in either DP mode or
HDMI mode base on the configuration chosen.
HDMI PHY mode is configurated in the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/phy/freescale/Kconfig               |   9 +
 drivers/phy/freescale/Makefile              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c | 907 ++++++++++++++++++++
 3 files changed, 917 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 2999ba1e57d0..0c07fccba917 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -44,6 +44,15 @@ config PHY_FSL_IMX8MQ_DP_PHY
 	  Enable this to support the Cadence HDPTX DP PHY driver
 	  on i.MX8MQ SOC.
 
+config PHY_FSL_IMX8MQ_HDMI_PHY
+	tristate "Freescale i.MX8MQ HDMI PHY support"
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence HDPTX HDMI PHY driver
+	  on i.MX8MQ SOC.
+
 endif
 
 config PHY_FSL_LYNX_28G
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 915a429d9fbc..245783c04951 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_IMX8MQ_DP_PHY)	+= phy-fsl-imx8mq-dp.o
+obj-$(CONFIG_PHY_FSL_IMX8MQ_HDMI_PHY)	+= phy-fsl-imx8mq-hdmi.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c b/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
new file mode 100644
index 000000000000..cf4dc0d83673
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
@@ -0,0 +1,907 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence High-Definition Multimedia Interface (HDMI) PHY driver
+ *
+ * Copyright (C) 2022 NXP Semiconductor, Inc.
+ */
+#include <asm/unaligned.h>
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+
+#include <drm/bridge/cdns-mhdp-mailbox.h>
+
+#define ADDR_PHY_AFE	0x80000
+/* PHY registers */
+#define CMN_SSM_BIAS_TMR                0x0022
+#define CMN_PLLSM0_USER_DEF_CTRL        0x002f
+#define CMN_PSM_CLK_CTRL                0x0061
+#define CMN_CDIAG_REFCLK_CTRL           0x0062
+#define CMN_PLL0_VCOCAL_START           0x0081
+#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
+#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
+#define CMN_TXPUCAL_CTRL                0x00e0
+#define CMN_TXPDCAL_CTRL                0x00f0
+#define CMN_TXPU_ADJ_CTRL               0x0108
+#define CMN_TXPD_ADJ_CTRL               0x010c
+#define CMN_DIAG_PLL0_FBH_OVRD          0x01c0
+#define CMN_DIAG_PLL0_FBL_OVRD          0x01c1
+#define CMN_DIAG_PLL0_OVRD              0x01c2
+#define CMN_DIAG_PLL0_TEST_MODE         0x01c4
+#define CMN_DIAG_PLL0_V2I_TUNE          0x01c5
+#define CMN_DIAG_PLL0_CP_TUNE           0x01c6
+#define CMN_DIAG_PLL0_LF_PROG           0x01c7
+#define CMN_DIAG_PLL0_PTATIS_TUNE1      0x01c8
+#define CMN_DIAG_PLL0_PTATIS_TUNE2      0x01c9
+#define CMN_DIAG_PLL0_INCLK_CTRL        0x01ca
+#define CMN_DIAG_PLL0_PXL_DIVH          0x01cb
+#define CMN_DIAG_PLL0_PXL_DIVL          0x01cc
+#define CMN_DIAG_HSCLK_SEL              0x01e0
+#define XCVR_PSM_RCTRL                  0x4001
+#define TX_TXCC_CAL_SCLR_MULT_0         0x4047
+#define TX_TXCC_CPOST_MULT_00_0         0x404c
+#define XCVR_DIAG_PLLDRC_CTRL           0x40e0
+#define XCVR_DIAG_PLLDRC_CTRL           0x40e0
+#define XCVR_DIAG_HSCLK_SEL             0x40e1
+#define XCVR_DIAG_BIDI_CTRL             0x40e8
+#define TX_PSC_A0                       0x4100
+#define TX_PSC_A1                       0x4101
+#define TX_PSC_A2                       0x4102
+#define TX_PSC_A3                       0x4103
+#define TX_DIAG_TX_CTRL                 0x41e0
+#define TX_DIAG_TX_DRV                  0x41e1
+#define TX_DIAG_BGREF_PREDRV_DELAY      0x41e7
+#define TX_DIAG_ACYA_0                  0x41ff
+#define TX_DIAG_ACYA_1                  0x43ff
+#define TX_DIAG_ACYA_2                  0x45ff
+#define TX_DIAG_ACYA_3                  0x47ff
+#define TX_ANA_CTRL_REG_1               0x5020
+#define TX_ANA_CTRL_REG_2               0x5021
+#define TX_DIG_CTRL_REG_2               0x5024
+#define TXDA_CYA_AUXDA_CYA              0x5025
+#define TX_ANA_CTRL_REG_3               0x5026
+#define TX_ANA_CTRL_REG_4               0x5027
+#define TX_ANA_CTRL_REG_5               0x5029
+#define RX_PSC_A0                       0x8000
+#define RX_PSC_CAL                      0x8006
+#define PHY_HDP_MODE_CTRL               0xc008
+#define PHY_HDP_CLK_CTL                 0xc009
+#define PHY_ISO_CMN_CTRL                0xc010
+#define PHY_PMA_CMN_CTRL1               0xc800
+#define PHY_PMA_ISO_CMN_CTRL            0xc810
+#define PHY_PMA_ISO_PLL_CTRL1           0xc812
+#define PHY_PMA_ISOLATION_CTRL          0xc81f
+
+#define REF_CLK_27MHZ		27000000
+
+#define TX_DRIVER_PROG_BOOST_ENABLE		BIT(10)
+#define TX_DRIVER_PROG_BOOST_LEVEL(x)		(((x) & ((1 << 2) - 1)) << 8)
+#define TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE	BIT(7)
+#define TX_DRIVER_LDO_BANDGAP_REF_ENABLE	BIT(6)
+
+#define SCALED_RESISTOR_CALIBRATION_CODE_ADD	BIT(8)
+#define RESISTOR_CAL_MULT_VAL_32_128		BIT(5)
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
+struct cdns_hdptx_hdmi_phy {
+	void __iomem *regs;	/* DPTX registers base */
+	struct mutex mbox_mutex; /* mutex to protect mailbox */
+	struct device *dev;
+	struct phy *phy;
+	struct clk *ref_clk, *apb_clk;
+	u32 ref_clk_rate;
+	u32 pixel_clk_rate;
+	enum hdmi_colorspace color_space;
+	u32 bpc;
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
+static int cdns_phy_reg_write(struct cdns_hdptx_hdmi_phy *cdns_phy, u32 addr, u32 val)
+{
+	return cdns_mhdp_reg_write(cdns_phy, ADDR_PHY_AFE + (addr << 2), val);
+}
+
+static u32 cdns_phy_reg_read(struct cdns_hdptx_hdmi_phy *cdns_phy, u32 addr)
+{
+	u32 reg32;
+
+	cdns_mhdp_reg_read(cdns_phy, ADDR_PHY_AFE + (addr << 2), &reg32);
+
+	return reg32;
+}
+
+#define KEEP_ALIVE			0x18
+static bool hdptx_phy_check_alive(struct cdns_hdptx_hdmi_phy *cdns_phy)
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
+static int hdptx_hdmi_clk_enable(struct cdns_hdptx_hdmi_phy *cdns_phy)
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
+static void hdptx_hdmi_clk_disable(struct cdns_hdptx_hdmi_phy *cdns_phy)
+{
+	clk_disable_unprepare(cdns_phy->ref_clk);
+	clk_disable_unprepare(cdns_phy->apb_clk);
+}
+
+static void hdptx_hdmi_arc_config(struct cdns_hdptx_hdmi_phy *cdns_phy)
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
+static void hdptx_hdmi_phy_set_vswing(struct cdns_hdptx_hdmi_phy *cdns_phy)
+{
+	u32 k;
+	const u32 num_lanes = 4;
+
+	for (k = 0; k < num_lanes; k++) {
+		cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_DRV | (k << 9)),
+				   TX_DRIVER_PROG_BOOST_ENABLE |
+				   TX_DRIVER_PROG_BOOST_LEVEL(3) |
+				   TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE |
+				   TX_DRIVER_LDO_BANDGAP_REF_ENABLE);
+		cdns_phy_reg_write(cdns_phy, (TX_TXCC_CPOST_MULT_00_0 | (k << 9)), 0x0);
+		cdns_phy_reg_write(cdns_phy, (TX_TXCC_CAL_SCLR_MULT_0 | (k << 9)),
+				   SCALED_RESISTOR_CALIBRATION_CODE_ADD |
+				   RESISTOR_CAL_MULT_VAL_32_128);
+	}
+}
+
+static int hdptx_hdmi_feedback_factor(struct cdns_hdptx_hdmi_phy *cdns_phy)
+{
+	u32 feedback_factor;
+
+	switch (cdns_phy->color_space) {
+	case HDMI_COLORSPACE_YUV422:
+		feedback_factor = 1000;
+		break;
+
+	case HDMI_COLORSPACE_YUV420:
+		switch (cdns_phy->bpc) {
+		case 8:
+			feedback_factor = 500;
+			break;
+		case 10:
+			feedback_factor = 625;
+			break;
+		case 12:
+			feedback_factor = 750;
+			break;
+		case 16:
+			feedback_factor = 1000;
+			break;
+		default:
+			dev_dbg(cdns_phy->dev, "Invalid ColorDepth\n");
+			return 0;
+		}
+		break;
+
+	default:
+		/* Assume RGB/YUV444 */
+		switch (cdns_phy->bpc) {
+		case 10:
+			feedback_factor = 1250;
+			break;
+		case 12:
+			feedback_factor = 1500;
+			break;
+		case 16:
+			feedback_factor = 2000;
+			break;
+		default:
+			feedback_factor = 1000;
+		}
+	}
+
+	return feedback_factor;
+}
+
+static int hdptx_hdmi_phy_config(struct cdns_hdptx_hdmi_phy *cdns_phy,
+				 const struct hdptx_hdmi_ctrl *p_ctrl_table,
+				 const struct hdptx_hdmi_pll_tuning *p_pll_table,
+				 char pclk_in)
+{
+	const u32 num_lanes = 4;
+	u32 val, i, k;
+
+	/* enable PHY isolation mode only for CMN */
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_ISOLATION_CTRL, 0xd000);
+
+	/* set cmn_pll0_clk_datart1_div/cmn_pll0_clk_datart0_div dividers */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_ISO_PLL_CTRL1);
+	val &= 0xff00;
+	val |= 0x0012;
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
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xfff7;
+	val |= 0x0008;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	/* PHY Registers */
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xcfff;
+	val |= p_ctrl_table->cmn_ref_clk_dig_div << 12;
+	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
+	val &= 0x00ff;
+	val |= 0x1200;
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
+
+	/* Common control module control and diagnostic registers */
+	val = cdns_phy_reg_read(cdns_phy, CMN_CDIAG_REFCLK_CTRL);
+	val &= 0x8fff;
+	val |= p_ctrl_table->ref_clk_divider_scaler << 12;
+	val |= 0x00c0;
+	cdns_phy_reg_write(cdns_phy, CMN_CDIAG_REFCLK_CTRL, val);
+
+	/* High speed clock used */
+	val = cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
+	val &= 0xff00;
+	val |= (p_ctrl_table->cmnda_hs_clk_0_sel >> 1) << 0;
+	val |= (p_ctrl_table->cmnda_hs_clk_1_sel >> 1) << 4;
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k << 9)));
+		val &= 0xcfff;
+		val |= (p_ctrl_table->cmnda_hs_clk_0_sel >> 1) << 12;
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
+		val &= 0xfe00;
+		val |= p_pll_table->vco_cal_code;
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
+	val |= (1 << 15);
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBH_OVRD, val);
+
+	val = p_ctrl_table->cmnda_pll0_fb_div_low;
+	val |= (1 << 15);
+	cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBL_OVRD, val);
+
+	if (!pclk_in) {
+		val = p_ctrl_table->cmnda_pll0_pxdiv_low;
+		cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PXL_DIVL, val);
+
+		val = p_ctrl_table->cmnda_pll0_pxdiv_high;
+		val |= (1 << 15);
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
+		val &= 0xbfff;
+		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
+	}
+
+	for (k = 0; k < num_lanes; k++) {
+		val = cdns_phy_reg_read(cdns_phy, (TX_DIAG_TX_CTRL | (k << 9)));
+		val &= 0xff3f;
+		val |= (p_ctrl_table->hsclk_div_tx_sub_rate >> 1) << 6;
+		cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_CTRL | (k << 9)), val);
+	}
+
+	val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+	val &= 0xff8f;
+	/*
+	 * single ended reference clock (val |= 0x0030);
+	 * differential clock  (val |= 0x0000);
+	 * for differential clock on the refclk_p and
+	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=1'b1
+	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
+	 */
+	val |= 0x0030;
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
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_PMA_ISO_CMN_CTRL);
+		if (val & (1 << 5))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "PMA output macro power up failed\n");
+		return -1;
+	}
+
+	/* wait for cmn_ready */
+	for (i = 0; i < 10; i++) {
+		val = cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
+		if (val & (1 << 0))
+			break;
+		msleep(20);
+	}
+	if (i == 10) {
+		dev_err(cdns_phy->dev, "PMA output ready failed\n");
+		return -1;
+	}
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
+	return 0;
+}
+
+static int hdptx_hdmi_phy_cfg(struct cdns_hdptx_hdmi_phy *cdns_phy, u32 rate)
+{
+	const struct hdptx_hdmi_ctrl *p_ctrl_table;
+	const struct hdptx_hdmi_pll_tuning *p_pll_table;
+	const u32 refclk_freq_khz = cdns_phy->ref_clk_rate / 1000;
+	const u8 pclk_in = false;
+	u32 pixel_freq = rate;
+	u32 vco_freq, char_freq;
+	u32 div_total, feedback_factor;
+	u32 i, ret;
+
+	feedback_factor = hdptx_hdmi_feedback_factor(cdns_phy);
+
+	char_freq = pixel_freq * feedback_factor / 1000;
+
+	dev_dbg(cdns_phy->dev,
+		"Pixel clock: (%d KHz), character clock: %d, bpc is (%0d-bit)\n",
+		pixel_freq, char_freq, cdns_phy->bpc);
+
+	/* Get right row from the ctrl_table table.
+	 * Check if 'pixel_freq_khz' value matches the PIXEL_CLK_FREQ column.
+	 * Consider only the rows with FEEDBACK_FACTOR column matching feedback_factor.
+	 */
+	for (i = 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++) {
+		if (feedback_factor == pixel_clk_output_ctrl_table[i].feedback_factor &&
+		    pixel_freq == pixel_clk_output_ctrl_table[i].pixel_clk_freq_min) {
+			p_ctrl_table = &pixel_clk_output_ctrl_table[i];
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(pixel_clk_output_ctrl_table)) {
+		dev_warn(cdns_phy->dev,
+			 "Pixel clk (%d KHz) not supported, bpc is (%0d-bit)\n",
+			 pixel_freq, cdns_phy->bpc);
+		return 0;
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
+		return -1;
+	}
+	dev_dbg(cdns_phy->dev, "VCO frequency is (%d KHz)\n", vco_freq);
+
+	ret = hdptx_hdmi_phy_config(cdns_phy, p_ctrl_table, p_pll_table, pclk_in);
+	if (ret < 0)
+		return ret;
+
+	return char_freq;
+}
+
+static int hdptx_hdmi_phy_power_up(struct cdns_hdptx_hdmi_phy *cdns_phy)
+{
+	u32 val, i;
+
+	/* set Power State to A2 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0004);
+
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
+	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
+
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
+	/* Power up ARC */
+	hdptx_hdmi_arc_config(cdns_phy);
+
+	/* Configure PHY in A0 mode (PHY must be in the A0 power
+	 * state in order to transmit data)
+	 */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, 0x0001);
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
+	return 0;
+}
+
+static int hdptx_hdmi_phy_power_down(struct cdns_hdptx_hdmi_phy *cdns_phy)
+{
+	int timeout;
+	u32 reg_val;
+
+	reg_val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+	reg_val &= 0xfff0;
+	/* PHY_DP_MODE_CTL set to A3 power state */
+	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, reg_val | 0x8);
+
+	/* Wait for A3 acknowledge */
+	timeout = 0;
+	do {
+		reg_val = cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
+		dev_dbg(cdns_phy->dev, "Reg val is 0x%04x\n", reg_val);
+		timeout++;
+		msleep(100);
+	} while (!(reg_val & (0x8 << 4)) && (timeout < 10));
+
+	return 0;
+}
+
+static int cdns_hdptx_hdmi_phy_on(struct phy *phy)
+{
+	struct cdns_hdptx_hdmi_phy *cdns_phy = phy_get_drvdata(phy);
+
+	return hdptx_hdmi_phy_power_up(cdns_phy);
+}
+
+static int cdns_hdptx_hdmi_phy_off(struct phy *phy)
+{
+	struct cdns_hdptx_hdmi_phy *cdns_phy = phy_get_drvdata(phy);
+
+	hdptx_hdmi_phy_power_down(cdns_phy);
+	return 0;
+}
+
+int cdns_hdptx_hdmi_phy_valid(struct phy *phy, enum phy_mode mode, int submode,
+			      union phy_configure_opts *opts)
+{
+	u32 rate = opts->hdmi.pixel_clk_rate;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++)
+		if (rate == pixel_clk_output_ctrl_table[i].pixel_clk_freq_min)
+			return 0;
+
+	return -EINVAL;
+}
+
+static int cdns_hdptx_hdmi_phy_init(struct phy *phy)
+{
+	return 0;
+}
+
+static int cdns_hdptx_hdmi_configure(struct phy *phy,
+				     union phy_configure_opts *opts)
+{
+	struct cdns_hdptx_hdmi_phy *cdns_phy = phy_get_drvdata(phy);
+	int ret;
+
+	cdns_phy->pixel_clk_rate = opts->hdmi.pixel_clk_rate;
+	cdns_phy->color_space = opts->hdmi.color_space;
+	cdns_phy->bpc = opts->hdmi.bpc;
+
+	/* Check HDMI FW alive before HDMI PHY init */
+	ret = hdptx_phy_check_alive(cdns_phy);
+	if (!ret) {
+		dev_err(cdns_phy->dev, "NO HDMI FW running\n");
+		return -ENXIO;
+	}
+
+	/* Configure PHY */
+	if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->pixel_clk_rate) < 0) {
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
+static const struct phy_ops cdns_hdptx_hdmi_phy_ops = {
+	.init = cdns_hdptx_hdmi_phy_init,
+	.configure = cdns_hdptx_hdmi_configure,
+	.power_on = cdns_hdptx_hdmi_phy_on,
+	.power_off = cdns_hdptx_hdmi_phy_off,
+	.validate = cdns_hdptx_hdmi_phy_valid,
+	.owner = THIS_MODULE,
+};
+
+static int cdns_hdptx_hdmi_phy_probe(struct platform_device *pdev)
+{
+	struct cdns_hdptx_hdmi_phy *cdns_phy;
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
+	phy = devm_phy_create(dev, node, &cdns_hdptx_hdmi_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy->attrs.mode = PHY_MODE_HDMI;
+
+	cdns_phy->phy = phy;
+	phy_set_drvdata(phy, cdns_phy);
+
+	ret = hdptx_hdmi_clk_enable(cdns_phy);
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
+	hdptx_hdmi_clk_disable(cdns_phy);
+
+	return -EINVAL;
+}
+
+static int cdns_hdptx_hdmi_phy_remove(struct platform_device *pdev)
+{
+	struct cdns_hdptx_hdmi_phy *cdns_phy = platform_get_drvdata(pdev);
+
+	hdptx_hdmi_clk_disable(cdns_phy);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_hdptx_hdmi_phy_of_match[] = {
+	{.compatible = "fsl,imx8mq-hdmi-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cdns_hdptx_hdmi_phy_of_match);
+
+static struct platform_driver cdns_hdptx_hdmi_phy_driver = {
+	.probe = cdns_hdptx_hdmi_phy_probe,
+	.remove = cdns_hdptx_hdmi_phy_remove,
+	.driver = {
+		.name	= "cdns-hdptx-hdmi-phy",
+		.of_match_table	= cdns_hdptx_hdmi_phy_of_match,
+	}
+};
+module_platform_driver(cdns_hdptx_hdmi_phy_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDP-TX HDMI PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

