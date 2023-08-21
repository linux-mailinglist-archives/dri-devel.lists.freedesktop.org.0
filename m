Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322A7821F7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9548C10E17E;
	Mon, 21 Aug 2023 03:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2410E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg1XhwC4o+eWCuR3XKQFTvN3Yv5ym5YwWwCbh7x8zs/1o77A8JMv6Nthazgq2qt0SW35ILOV6eK8NfiNcpV4uATr/+SWZRH5zDR+EeuQcoydcCNeMFVDenmPNeaz36jh3C5VRCCx2HfzKa6SO+bNm2e+JdvbJOsjypqtG+eoczsy3an2TMEs8VnQERhcR1uc8Zk5/IvlMCwGawaUM58bdw0XaeqhvGlFxi8qrPIYsJ7J4iO8uRs5rMDq1ILvt/SMdKoFlc51dIbIZ70h1obolH4gXgqYIE31XNvsS011moO0N90gsBgVbSI0Uc0AR7U34ZBHog+2w0kg1ZmX8hBShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT32ykjmXob2U8ilTeXW2ZG+9MRcznifpijOIBI7G+Q=;
 b=kAWdxTSIstEAMrtM8wShgxBivFlL30EeGdUq7cJdcm80RH/Xjfetq+jkAkghSYGc1PKw5gPGnAfi0avzRV+V9mQXq0xVmDTBQTVJmXqnFHqmuGfggc8Qsdj8p+Ziwjyz9PL00tvUq7URlyZhW3Mcz/LgktMxnBAy3qHX21IIFn9whZMrNudbZExAVj0l0kFUnGLImw0bVSMk1nmiM5jkLTJ5DfmE2fp8xLEzZWObQ1marEMaCv9hRCaZaI3JuooJ1ghf+iVB1pjvbZL9MzwpwFgk0LVeIvaKJfaE8VZH/yHTOMFT6muRfwsYb1EQm3TMyKNxYiIjKm5+JsqN8BCppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT32ykjmXob2U8ilTeXW2ZG+9MRcznifpijOIBI7G+Q=;
 b=JQkMpXnQDyBi5XUiwFbxoYMFFfD1EzirKU85PMoEox+drBIJmRqHb2A/qX/36rIF78UfcGgk/FZzynxPd5FJWRaXyzBPgJCWWGEc6v2IYj2WXysgg11IgHLkdSg4ASGefTVc0fOESfFS03MER21wiFyDaCBUe19nf9GqiKPxD/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:37:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:37:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum
 lane byte clock cycles for HSA and HBP
Date: Mon, 21 Aug 2023 11:40:05 +0800
Message-Id: <20230821034008.3876938-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dc83ac-1fb7-4b08-cbd3-08dba1f7f0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQuSJqnJ/Hn3x1JkqnVvDwFUiSr4cLyGKatVbL7ZBYVrHjN31EVdQIqpsAFzKnKHkCYxXT44lslMfTKPpjMe2kpXFTWp3DJr8+tAhRTeKWg3X9V4hBcjmqW3oT11W/9yPdw39rF3uP2xDlyk/j55BIEH1z83zdoRbJaPMf/HBAkBtkThCEURXAlDfDKpDOzcDVdhuGGkhnbWawzs8YTr31mtAoO5DHQ45GgKhbFA4JFwPZkGNpOSgxy3L/bqMagMDdxunGD9ouYpvDatcUswVQvA6k9nja5c/guvgNVUHPZYajycVkWZQLHoZbS3eNZlE37Rp7il+VWrkx79rhWlxTi5esSQxrf7wdaPIJOgc3Lj0RxE5LYOjTTz6WHtU38W04B6E58R9q2FZ5agZOIGFyRMhMIhNFidsuBbEaw8n58fdmVkGjCdOt1v8mhUvuebSkZlfaEXtg1nHjcRvRruVSTF8jYAYw3vqYATT3w8YOMZEUpLxYDS9QdFAR/BB8EFxycuvfBjJvSIVSwlXgs5pEyMjWJsgXYq/GGYqapUy+sdV3MhBnBxXwYe3lViS7gliy0KxeQCJsTOXoWxNbfcXXrOFwd1hWjZlc+MM69xFpwBpL0gPYfE65EzkEN3Bg18
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YbY9VrsfI8IAEkygQUNLhL6FSPk+XtVqwEro4S5Ws8aVNWbbnaW5g1veaTx/?=
 =?us-ascii?Q?oiRaaS8KhrdQlgQef6bqwNQZROYCc6fTakNnu5IqdIgRhW4SCrAmJH82epKt?=
 =?us-ascii?Q?dVyP/3KShYg/WJwxC1U2isHrwDVAEIZ/kIqs1Unc7uYQwQE8560LZDPpc9tY?=
 =?us-ascii?Q?chXMsLqYGNP7+fRi9xDp7pOLQhyGArsdya2lWQ/LjRxvlqwuiB4Dnihwyn0k?=
 =?us-ascii?Q?n6JC1kTGcckAnc66UVK2ZEOLSDQPJFEjS61gBudAOmMfHyjl1zFEd1HixgbE?=
 =?us-ascii?Q?v7FSVwwybneMOe/g2Vb0TfSiQsmNZh6YYk8HHh6quCCbk8/c/LcNYn2dv6IT?=
 =?us-ascii?Q?Nl3KuT5DlKWRUjPpfmDRAE23S0uY4utIDUwS/AlkCtoqXZrNXO/w29G4s2cc?=
 =?us-ascii?Q?x+2P1xn/clxKJ0vGDrTtX2rvAy+fxDvyDYJnOGMkMIUHFF5vi9SXSbw60LqU?=
 =?us-ascii?Q?FRu2UBcUIzoiM3LqMfMONmg04Ml57mfvri0OHgcxw3td46SEIPNLzwLpzFH6?=
 =?us-ascii?Q?3nwKortBB9GdW6zsbsdfzCWYH0LyVD5iMAWfyHeUvq5rxAUHlbMligX9FteX?=
 =?us-ascii?Q?2ofkxRyI9pnhe1W2kzHIEa6HinOvj2nk3YFJ1SaQ2jdzBY3Kiu8n5xLOEWNk?=
 =?us-ascii?Q?Y7jkWw5ZzPtq3rHnB7QijqTI2VK4Ulqln6W4cjMAvviswHJXhrwuSc3ScI6W?=
 =?us-ascii?Q?byLyf0MakY2a4SsvNJI1GbsPXNm1kK7KNlo3AGS190QRtwWtzgW77IcV34YZ?=
 =?us-ascii?Q?gymi4oh8t9uEGyXDa8khumd0g3IC4bXvkq9N+LYxd1SW65nqZHynUXTCuXvk?=
 =?us-ascii?Q?WavKLTzr2dukdy9LD1/I/x3+Gz1ztrbtK4RNSejoRNVC2VtY/sva0yMn9M1+?=
 =?us-ascii?Q?pCURvUVfIHuMgod8ATpxb/s8Ggc273jZ/MWyhtl9OIWWAfP5eVjJM7sjzYW6?=
 =?us-ascii?Q?/crrO9V+z/36ZGQMydpOVoW3mHOgb+gpWyhLvQupAH5LJP+csf+uowG8Oc40?=
 =?us-ascii?Q?O8MqiLVntxxXnj6ukyPnyr1mkyRC7JFGjE47P52uVVbNCVFi0r2Fna3ttvzT?=
 =?us-ascii?Q?k6wt9nnEA04jpOr1GLrxl2ZjGDaXFabwMKHvbS9mODCfiSUKb64n/BvAAKuH?=
 =?us-ascii?Q?VQ5cau4RPnqyAZXHANBt3swqSdWqBSyZmVsJrvpDQx1a4vSLvv3KOAbGzECq?=
 =?us-ascii?Q?WxXVCx58rwD3w+uZxTAbBj0n/w84SbsT2qH/fJffDDMXhFvIenu1tqUHPOre?=
 =?us-ascii?Q?FIowgZmvAcRtmAlLR3l0KsHvAQaJMJb2iPiHlhriqd/D9AGo96IsLBCT5Cm5?=
 =?us-ascii?Q?XjI/YTkQzQ+uHbRSu7Ag6ifcWpkJydyP8Q0fr7HUP/mgIrvKtRcBrgm1/ziF?=
 =?us-ascii?Q?TRbe/CyxwCl3dMgOgy0QqBA8WUN4UFLstMa/VP9KtkRNvr9vPQ3vy3JJ/5vb?=
 =?us-ascii?Q?j7qJuW30s9sKsdnt9gNNtY+tnHHGl5p/oi3vKY9z4m7uUH5P20RzY+11OZsw?=
 =?us-ascii?Q?coQOnOtzfhR4X+prerVpGX2ChygF8nS1lFWhxRgcXxhYBcLI4khpmN9BlSp3?=
 =?us-ascii?Q?/yhw/I/Nua3BRNCwLZhw9TV9wswcf3j4ll/Ozjm0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dc83ac-1fb7-4b08-cbd3-08dba1f7f0ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:37:27.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fABbwaGZzHd+s34v0uniyn9mGuCMaI04cEGmtFMGFjUj0KnN/80J766fTZmM79YGbFSGsAaJ0nVhsTDdIbJp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Synopsys support channel, each region of HSA, HBP and HFP must
have minimum number of 10 bytes where constant 4 bytes are for HSS or HSE
and 6 bytes are for blanking packet(header + CRC).  Hence, the below table
comes in.

+------------+----------+-------+
| data lanes | min lbcc | bytes |
+------------+----------+-------+
|     1      |    10    |  1*10 |
+------------+----------+-------+
|     2      |    5     |  2*5  |
+------------+----------+-------+
|     3      |    4     |  3*4  |
+------------+----------+-------+
|     4      |    3     |  4*3  |
+------------+----------+-------+

Implement the minimum lbcc numbers to make sure that the values programmed
into DSI_VID_HSA_TIME and DSI_VID_HBP_TIME registers meet the minimum
number requirement.  For DSI_VID_HLINE_TIME register, it seems that the
value programmed should be based on mode->htotal as-is, instead of sum up
HSA, HBP, HFP and HDISPLAY.

This helps the case where Raydium RM67191 DSI panel is connected, since
it's video timing for hsync length is only 2 pixels and without this patch
the programmed value for DSI_VID_HSA_TIME is only 2 with 4 data lanes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v2->v3:
* Add Neil's R-b tag from v1.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 18e7d64b0216..c10ca32dff0b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -759,12 +759,19 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
 }
 
+static const u32 minimum_lbccs[] = {10, 5, 4, 3};
+
+static inline u32 dw_mipi_dsi_get_minimum_lbcc(struct dw_mipi_dsi *dsi)
+{
+	return minimum_lbccs[dsi->lanes - 1];
+}
+
 /* Get lane byte clock cycles. */
 static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 					   const struct drm_display_mode *mode,
 					   u32 hcomponent)
 {
-	u32 frac, lbcc;
+	u32 frac, lbcc, minimum_lbcc;
 	int bpp;
 
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
@@ -780,6 +787,11 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 	if (frac)
 		lbcc++;
 
+	minimum_lbcc = dw_mipi_dsi_get_minimum_lbcc(dsi);
+
+	if (lbcc < minimum_lbcc)
+		lbcc = minimum_lbcc;
+
 	return lbcc;
 }
 
-- 
2.37.1

