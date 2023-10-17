Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352A7CBBF0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CDF10E26F;
	Tue, 17 Oct 2023 07:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF6210E272
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajvUztgYcM2DXAxEWXbq9ld8R66+S12cWGNThlEV6T4iGMmkkBJLe9Vy/v+HeZIDSJMMeJDTc/yOhdyA9HN0gHjZxfJJlwwBjyBAv1i7Z5/Bqe/Gvri7NgmAd5KMGaq2ilta6F0kGtZtbbbXJTvOdE8xTQvKWmBsHoAIYuNtxqlG1Edsm4AURslqKxkgsKN28JJeQOISlbpZepIus1pxu3rgl4t3W14/PVeJQaifCmv8CnpqlBVakMRTKr3h37l+uiwd7tTfzsEyBCgwNfPaaRCGq754l0EU9XUeoQj04Emc858xTTqzut7F7/PAlkd1Io4cE4jnFaulBPyDxLqlWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzAZgLl2joNtA+vCPyQVBMSal6U3/ILkdme3HEMQtNo=;
 b=cluz6Z+vf6akTRHZH2gnQJRF7BIoYnEzaw+8W2Po23qZrpYHq811D5JhxOMbSjF2lGhCvNGwhKMl/rvcNQICWOUleOb2ROrATOl7L5a044E9XtpMvhPbjA0tDVZt0MmsmScajXksAEX4wlBkzBjacKrRsRMokf2Vig09kZrLboHVvFxK4w6Cq4p9EQ9ulKoC/PnH4HDNkRWGsO1RLNoqF3xW4dYWLSR9F/4apqu+VraUdF4VEL0KrPbUTDMH+VGkvOB5fpqR55Aeb7r5r1za00du3w/qK8EGnPZcu63sM2NwHvZGsSqw0axE+7M2Q5qiqtr8hJB6OVGb8mB2nu67Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzAZgLl2joNtA+vCPyQVBMSal6U3/ILkdme3HEMQtNo=;
 b=UFEi2kvsgULG6KdpKwNZq7tP7ayjv729lQ4zVG+a2dhnCfuqdRYgs/UZVcXV3kvSIM3sNIEtHRZTQxb137lyf+ipCEuML+TOaUeRvHhRjT+5hD+F4EVaOaeU7ildnic1HREi5Go28NSq5dEHODjiYdlTcqqLYWW/owzjfU2AMaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:06:03 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 07:06:03 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v11 2/7] phy: Add HDMI configuration options
Date: Tue, 17 Oct 2023 15:03:58 +0800
Message-Id: <4f4ccf83cc63ff28ed2521225a54b076d1a75676.1697524277.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697524277.git.Sandor.yu@nxp.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 611c498c-34d8-447e-330a-08dbcedf8636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ol1uY7Yh33qPJ1V4XitI/tAoNf0RRMCvx04/Sc9lcdftSPn/oEoXvJpL7rOZekxk9VGIn45JTJxmJtCXtg0iCAK0wW/RFqGhKOAL/zHwObnGa5ra5JL9JEab9ww8o144xoEzfg7NRuH5pkt7lHajACuU+GxvXv40zsuHdqFKy14ZuoSHAfJrh2lLSLtBvGsB5ARTsMkT3vUnM6Y6Y8L4p1xNjId2ETMuvznq0P5GPcNXoNDJZHn06xd1fsymlnQ6EU0HiCvvgN0v+U3Ci02hC4mU35L4I3rHeTNbm0iodqJ/pdSFF0SjYx4sGtstLYpEXWeg1UqbC+fglzTWQ6Bn8SflQXFLOyxgZkVekShVJR+AGc/Rv5bZW0xosckC5j8Ep0I1rANGNeqBrleQ4j610ALccI9d68CVy0v0oPBxjhuGSAcANG+VjS6LxTry8FZeuVP6ZpUeJPzwXBurVcp1J6JWN7NB/PCzc/tsTS7xRyAVaw9FZ2hGmqGLpDquL9NbpktrYNJAIZ3l+qNvrTQJhe0Yl+KcTkflpRfVFpswgJN2SrVlRIEXDhd+BGCxaNSx8LlpDme3Q9cs/JhjmOV4Dgcp3SGhncQku8PuEW1YKI3ftA3Q4uUEXgSUWSdbZUt+kuWLcT0cMbq6zBT3LLtPVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(478600001)(2616005)(6486002)(52116002)(6666004)(6506007)(41300700001)(6512007)(316002)(5660300002)(26005)(66946007)(66476007)(66556008)(38350700005)(921005)(36756003)(38100700002)(86362001)(83380400001)(4326008)(8676002)(8936002)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71Hl8eNSc3BLE2m+gItRUEFrTR+RwXYW+OgUa27+c+1biHssBvPrqVS8BDXn?=
 =?us-ascii?Q?hmoRmc1pX0LmyOv4w1y4HaW0og0pFpgDt9bLeFfmhuhaLClouuSFa2HTDc5Z?=
 =?us-ascii?Q?PH4WPNroWwKJeXJwHrOZHiip7b//64G3Q0vXw5Amy8opciE2sEhEOVYJ1S1X?=
 =?us-ascii?Q?C+rr6k3clkgYEqxBs5W3Z7u8aCFt6yBcvPX1ytoVMX9w3SpacThw4pt1oevZ?=
 =?us-ascii?Q?FKXZcy6rBpt/HRMmGPdg71r6L8O9MLSKH1FKos+YOrV1/tFX71/SWlYekg4J?=
 =?us-ascii?Q?bjBUS0NYODxLHiiPtajLA8ySvTDqGeh7+2wjIWHe72UNOfH1tbhg4Nwe2jCg?=
 =?us-ascii?Q?AHQ8cIqa3pEotRkkA5b+tPxv2TQZwymVqx3XNdGm0wPQtleuFxW5xPZPHIqY?=
 =?us-ascii?Q?03Fx8FcrNRqPiIqPTIBKAFuZ4fA4aaNw+QVHrbHjkGq1t11f/9b5JG+ieFne?=
 =?us-ascii?Q?Xr5MI7+KdpVy2eM76UCbkS63P9m5OvGoamC4ye7IWRyID9fOzarnw/SdEjYh?=
 =?us-ascii?Q?irfRPPJpH8SylPCZo+SHHPnV0UwwaNT5xvmft2T7U2PktzrInjq4xaMWGORf?=
 =?us-ascii?Q?D+ZMoBgBFEfuhUecRLnIm+xOh/RO/E82N/u0oqh7k+TceUJANHd0YDX5QFdH?=
 =?us-ascii?Q?aGwzNch4t1HKiEWEEQyoWY3N2B7cvv3EryqlwS428jJ63fj+mgcBzLeb/6Zg?=
 =?us-ascii?Q?dtl6lzde5RTvOy9NEzTcbTt6ozZGf8fhGb/Hy7IzVLKc71pytRHxe9xSwuxB?=
 =?us-ascii?Q?OwvuxXeHu0aoGF+IxPhjTXvCUqIWRyFe0PD0pfjK/OuVlpCy3Z2aC6rHIoYo?=
 =?us-ascii?Q?HvpdJsRf31CWGDblUtQrj7R96KsJ0MSCtiHAnBoUK/CEP4iPNEEoLaRyfG60?=
 =?us-ascii?Q?0KPWD+zEIfmqA/Kw0ahIKAfLGRpUkkJqdCx3CXIhncdvztvFueyavr4hhT+c?=
 =?us-ascii?Q?3pclfessQNHnNK76IpG6yJzhyi/qsUCrdMC8Mpmkjub4YdwcaYpXzQc+n03s?=
 =?us-ascii?Q?U9AqD+YCrw5+FgIq6NeLI4ho90JVXLOKiy8nf+nUYAE6DD72cd21ouQFl0pE?=
 =?us-ascii?Q?li7ToyMSBelGOd3T71p8oLzp2CNYlvBfKEUlL2idWKGrRW+uN7G3NXXU7rTX?=
 =?us-ascii?Q?4wtNgbws0wDR7CcBMAhYspM519sJCa1L2lDpdShesv9TXmOanOrMRHaMiK87?=
 =?us-ascii?Q?d23Mo78czRLv0o11c7lwGATQ6TSAuslxDO3fY6AFqhXwu/kprITBN8rnuxVR?=
 =?us-ascii?Q?f99YefUm3dH/mQj/mV10EFjn2ZojHl7V5yyDBRocv1Wv4jpf6eauQvM268xd?=
 =?us-ascii?Q?3P4tYX2Afpo4doLgfgYQc9ku6AyUzbBwotHF0QvQGKinepyviCHbjY3xQ0s1?=
 =?us-ascii?Q?08bkgCi4BO4EilT2mkbAL8TvLtbvQC8Ez1UAeaSZqP7Hiya0lh31EhtLQPQg?=
 =?us-ascii?Q?dFlOJ0E5mGrExp2VpTm79tt1vZwFyZkHKKUK7mVe3kbssMvwECxmN64xitz+?=
 =?us-ascii?Q?R/Dx5zmSSU5VEC2FfnVzy+aBuK6wzlsVmYMSCViRfwPMGZeoQoK0vlFW5EoE?=
 =?us-ascii?Q?sYn55sQIqPaBytiUQs4MTuWdvFTlkC4gkUqb740+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611c498c-34d8-447e-330a-08dbcedf8636
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:06:02.9958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwEWY7EOQF7qtGvbzE58sK6wbizNdPE/gAh/YlAzduHuIfTKtOeZXQtHW1MuT41PiuqIBwbyGU/n/xancSBOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622
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

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
v9->v11:
 *No change.

 include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000..b7de88e9090f0
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+#include <linux/hdmi.h>
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate: Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f6d607ef0e801..94d489a8a163c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.34.1

