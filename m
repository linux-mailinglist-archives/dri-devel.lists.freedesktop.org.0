Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AEB8291CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834C610E551;
	Wed, 10 Jan 2024 01:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39510E551
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggUlrYv7CkNTC5VptpdvUzU6L957KqnI1OzOUaI81fUeso5sI0EkhmtruK/yLvdiFgqtwEt31V0uX9Agr59SOn7qTKv4vhc0AqrYY/OYFN8nw7Vik5XsLVE2qzvWK9f3LKBLgtR221QlSVmqQHeoPSI8RQQewbmBlDXiRPxBN6yLRofPAITuESHN7CoxTZhXRriEtYWPKB7q+u81GI06QNr7IcaCWrFEdIhuo5xRdtpO1nCWTwYGa5T0jELWY4GwkVXLKHUp2cwoPUpHbvl2YGRQqdDSxTNcrJrfgiK8s13reV5GaiRm+KsVPEC3A+z1OiNNfMxAu8WHnhNgr9HjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctJlFvUXzf9J9whabAcXvLasMIJ5Owm7IbUibAN3lTs=;
 b=mdyOJDrBoqG3AwLr/WOjrHTortIOfrtSOasNnachI8iWWz9RJOtU7Ky3IiEVCyZxjZ0fT3NKRyWF3AlTudUrnZdnbV+pYzbESKs3FKLs6VqUSlw0HBreNAjOOKTfq1WPFRAXijoSEBUMwJJH02CCCW2K/AMT1dmlBsBee2Dx534CxvAmBPe3gMpgURfj+jSUV9MEG9n3qawigWkCUTO3OPlQtuuzO22QZnnskZ+3abehcqk2N3AImEVc3EIHFmSCZE3Y+QvFKHuKe2ysL5yex0b7o+/hMDcJuewdNkxhzy032ALfVpaDYGfGUwPHtF18W1cAWICLwPVIOFI8w1IJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctJlFvUXzf9J9whabAcXvLasMIJ5Owm7IbUibAN3lTs=;
 b=oyc9dqyvQrdpiP8sJvdJowpf+Vw9fsrox7k6cfupL1kAWVL/ijAxcQDeX0h1K3hsDVx7Jw1jl2GVDw+JLyjBSz/bFVc22fOZQheXkENjdy+4r4UQVy4J9RyDD5pqXf7S4DuA35xu/n1BuV4nIyIb/HMEW7lofUwTqryx5kgMwuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:10:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:10:06 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v12 2/7] phy: Add HDMI configuration options
Date: Wed, 10 Jan 2024 09:08:43 +0800
Message-Id: <19070c125268cfe900021dea6e7e8379b89c630e.1704785836.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704785836.git.Sandor.yu@nxp.com>
References: <cover.1704785836.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c48ee13-31a6-4af5-8d15-08dc1178e191
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C41mVvdKbANM3x5S2Eedwk7edRVsY42xcYNVcdgXtLHyp62nNtkiFXDjJpr/1d2ubFVY6XFBB9MSoyObPUiAwQ9bVnpT4q7xD+tQpufyV9MFDwEmC7qi7JhBHg5tKC104OVatIsCQrThCCAjpV2kcJBomZN1YRtu3zCyOFowqv5oZ7LnDcbivi0sX9OOOIogYJbKlF+Y1n4DVKVFx40EY/Pz9o9i714DvMYIut6usDWdgocCv5QniPr1fw8ZyEVkEOMwWdzOgUMDbq1tn6rqrYwYC9Cr1EPDh33J/mmBFselaY6a6u+n4x+xOIQx1RPlXgba0f8iQqyhg8Ttol/6M1UqnEIR0SnU1WQhcAZpt2nVO4yQ2qbc2ydJcGnacD1HxtvAZ7L7dSwFWJ+aBkD6jNk8il23Xcdxrws7v4v+Uefj21d/xo1ad5yGbpeBFcvTd5H/tnv5oTnMtRhSOLs36rOx/e4bNIa/pWNCH51byZj+CfSfPVgEMAsaZzbth7I0gK0PERLGYK/fT3gUOM0eyotJiMDYqwz9/CY+Hq2TStcy+VNcYn/loiG2j/32qm/tgSKfniPC4+uKsfM7Bsu6CTRgWJJE7CbVdj2usR3GLi4AthM5iU0L/dlycbCl1V6IzSMYPR9S77sSvugZsy4hrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(38350700005)(36756003)(921011)(86362001)(26005)(2616005)(52116002)(6512007)(4326008)(316002)(66476007)(6486002)(8936002)(66556008)(66946007)(478600001)(6506007)(6666004)(8676002)(41300700001)(2906002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fq0oO8S/wSwhHm+0PvMZVHCkUMi2gafj6ZKLbNoNLwv0FVqz+6v5t4fZf1nh?=
 =?us-ascii?Q?JBFvLh7NwjOCv9y9eC+pL6D247C2sj780SuNOo0hKnAJJVLZ0W/m7KGGWceC?=
 =?us-ascii?Q?mMHYjSPjiaQnCNlPsBdH7Flb8HF0ZSNCfcdO9uKhOr75NtLEONulX1poejSd?=
 =?us-ascii?Q?w/1cpou9YkjM3YMhBPohH2FGKdZ81ooCsUSA5sTvCwJ0d/wpe2iMNb0GvMmv?=
 =?us-ascii?Q?vshsbF2/4BFNKSmfn6ZWr3JKS3smBFKvR4oP9uU4cmEI4U+CqNbENCmzSyNa?=
 =?us-ascii?Q?sMkphflj+wWyzl6r2Kpo7t7ScOh6sWZIUanvhf2tYMwndVbUMs+kOoGo/0Mi?=
 =?us-ascii?Q?oBtRnocc62MwstU3B5AEkuIZU8S3Q/PjzVdRu8yCGvTIa3xeFmuKzG/mTZIN?=
 =?us-ascii?Q?m42H6qD7LfsXEP0xWD4QzFY1pcgujBOUuULf/h5Gh01/Dd5iDBv8PyphjAGw?=
 =?us-ascii?Q?OpAUvH7U0/H8yrZD7ZsParTLCbDc7vLfFLm3GKPAIBThS9Tlhf0k6ajZiZT2?=
 =?us-ascii?Q?nqAv5rR3YZ+m/1jodN3M2WuveDTsD5ft76hiUeozK4WUrFqI27VO7jKzsyFD?=
 =?us-ascii?Q?RLQaHiaOQPlOzj3Xk6cTZgJAV6+l3P8Im870PuD4TV0MLGhXA27XxhobyChK?=
 =?us-ascii?Q?Mi0rJir/NnCJip/2RKOzriH2qz1WjKoTsz6tH7+r46wCEWabtNVF+4tJalBz?=
 =?us-ascii?Q?gDu0Q750Wp5kwOf+xAYSFyIOc1ucMunW8g95SrUTtfwx0VfDNcdqaBM1WJ/8?=
 =?us-ascii?Q?PqvDajStZ7N7ehFfGGVOtd0nynfxVeLpNAcZpEMABy3Wb63zPNzRtpPcLJsk?=
 =?us-ascii?Q?XO+KKaV1GblrnrtpFrA68fhSIkjbGJF7Hr+YN60BQNU+mJiafeeTsewyiYB3?=
 =?us-ascii?Q?LtFOvqlnjNYPRr/wbGxBwesCd7AzHRc+j4vDipU2u2s9YmxpSd9W4N8D7toP?=
 =?us-ascii?Q?5/fx7TwDHFwd9nzU/GLRU0JrNWFJ/EqLU4IKE+5g7I1awh1EkPliwywOhZVI?=
 =?us-ascii?Q?NQjuu+osOcy/RDhKHqKFiscdmcPfaEUuertuXzIJSU2Bd8aooxvgHybdA+GY?=
 =?us-ascii?Q?E8Kf6x3INK8W21TFdJieIHdPh6AoQdJTd4vd4HdaN+BjMN8dSlJh4raoVJT+?=
 =?us-ascii?Q?/qs6DYB5o8MJCeCP9LsuqRSFxo8k2xMzGRztcF46eASoqdiVdLfREXZkRbwV?=
 =?us-ascii?Q?pKr48bm+nEoGZZn3fpd4IfNjNiw7rWhTx1ZJLC2O19g7fXEhterjgxgH1cA+?=
 =?us-ascii?Q?2TArCVYkDApx0Diw2pml9UNmFjhXNw+1mpgLMkz1Nf6nSiYnhfDtYEhx/+IS?=
 =?us-ascii?Q?C8Qi4jNTmJ8iQaRCIqy/Fm9hBKC9Fy8YeH+54Tv4Giqkip5GnGW0y/3zWGsC?=
 =?us-ascii?Q?617WdHtt3lfRydyUkyOiJq9exw7oW8cf9AFZVKcGhfgYmAaNaCnA2sHaXk3B?=
 =?us-ascii?Q?gv0FpNMJuMK5huumPtmOQtug+fwnRn2QmPF3jzaTdcoDUnXls1V9YbHxgL38?=
 =?us-ascii?Q?YQtNuk71hKv7Jht1INc1/w3jsw/g6bHUvdlOd+8jXwDFDBO2lZv1jcNnwy7Q?=
 =?us-ascii?Q?4VxPACGvOBvExFMO3p8eBE3A18esQzfS0Wa/UOkm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c48ee13-31a6-4af5-8d15-08dc1178e191
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:10:05.9711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfbFPpTccMd8hL9sAh1HSpgwZYnIadvos77L3w4A5ckuaRIy7US9aNhet/UYlp6iUxmzM+yWM7l26iDDpFRGfA==
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

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
v9->v12:
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

