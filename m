Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26F755B4B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB04010E1DB;
	Mon, 17 Jul 2023 06:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349A110E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkrIo8RVTnR4mS5V/LGZN2RvJlKj4z9cBRqo8r14rKfkQQlRlMXcpA15EnnjVWyYdppOaJ33oEdB5ZIC6CyOXL6AeQIEMPer6OqgkzG8u5l2IUcOV/GZjn5eNvwqd4xQsMXAYfDlj7veRk1nFo/tPWwZqIxykF5/JeiKWxWMIoVugqWyjrwxWsc7mlLRWHcWLknHUmXrv+NJp+6hlwUgRzDTeHaPbReax7GA5THue5nQdlBqwHPGOYecPs1F1bSppXf9/nCP95Wzcmk8wKJa9n5wOLYf7c3dIcEBjnQ6q+DKPBEHocW3oriXhkuOmMBjHfIWxL3tpIW+pl+Hr9Jn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qab09Aji7FWDC56F3wy+x3e5aH4E6ECZ216cpHO2QtY=;
 b=I7ZueopOxRwjoyas37x8fDxs1m3vPIxzQJq6vMb4SjMPKJ0Kk6MsEuouOM/eKtW+qgr45uSGaVRha83t9EXNoGBHkyVDLb9IEkPBKFQ1WyKgUQIZGnzK+Mi6EzoKltdDX/BzAd5qOlNE25HACGL5CtiQlHc7CHfsfXL2iJ2/xKs45kXRPRoe8IZreaMF6AaDexD49Uaxm0mI3UuWTeRNeTMf3kdOcY2k1VpcstwzhVFmI/B5ApTFQPWpR9c7eAVWNJoAZRl8EHUQk3w2ko3qWnevIs8yABzQ6NVkdRuIms7hEiuzaL4Gw3iuZuwyJ1d734nYy9EruXIGouQG4WA7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qab09Aji7FWDC56F3wy+x3e5aH4E6ECZ216cpHO2QtY=;
 b=izXHARnq7bD2+ukfALR5eMW87tT7b7XqJOU9tLAfSbeY5PQrTlaI5jXjTHfNC9Ruz/gdVOao1cNdUNrfqpwI6E6zTr17mLpeUqqZ9JWdqOnZKXHWeRZt5cWSN3Z3pR8vnno5D6YMxs3bfbZjp7UXDLSuTcfBNwlvl/fvkfncng4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate
 to calculate lbcc
Date: Mon, 17 Jul 2023 14:18:27 +0800
Message-Id: <20230717061831.1826878-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dc31cf-e955-4119-d67f-08db868d0bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5VV6Eh+xHDG6aoONsse+kQf6Vy2VkKCwqOwhzomzAK9/4hh9TwxVapo/VuP09HhkGaNvKtjxel7V/UaUoxC9nbZpbVjePo2rvH7K9kWMrm4hFBpO//fqqSlNsobyqjOHGX1tG4RpD7wArhmXT89TXrRdBbbYRlE6jb4qig0+vHwYVyNGnN7qMIhWJjupnOYJHG+rTCJ0A/7CFbB1MAVfq3R6ysD1YAub6lPqDJBvyIRgtGooblLDm/EAwXmzx37sc2ITzD/H7+JqIUOSBHLro5ANZT5EbpvdpKlqhe5qYslMX8sbQRV4vzp7yccUSDzd3T0diQW1x1WSMsz/mNppS0iR9Su5bfhl3+7HykCQYETnszlJykt2VK/z7FBys0Lw0CIaH8medilxq7Hvl4/6suUmTvQpF6cDpn53LEWWgBqNOWkiRI95pyB+pcz4FG3kXShNZAb2JmSH5ybBYiZCsWsAVP8VE/PY2HuBvIUz+gy7AknpSL1OJ+eRK2ullz3EhnhxDMaAW0Dc6UfmURTlob8wmgVuEeeIIck8rA/ky6McNLra6M8G5/PDa8ZrWifam9D51Z0n0YwzhqTFtcB5qpoodBkktVCVsPtPmqwwznk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DhX6i4gXEfDid+4jYJJb4gnnfEb/p4U3ra+Bji2tg4jjd5uucPJj32M+QrX?=
 =?us-ascii?Q?eNAfFQ4eRZzRiPOJlN21UlnHZVALeltoKffMBJKlvXLPi/BEytZk74p/C5YO?=
 =?us-ascii?Q?rfKRO76sugGAhlkHq8O5/L1Jo3mKpMyGwnuVDt8btLVQl8l/msNqK+ca1lkE?=
 =?us-ascii?Q?C5NAvytctfBo93RRDrj0WjhsgYHr2f1fBEoF2P8V14OkswyoFZ/R7jFWY6CP?=
 =?us-ascii?Q?jtRdfES6rc7mtG5+JuJhuytpAfyONdzXPUZVp2IMg1HX5s6nDGz197SA3VjV?=
 =?us-ascii?Q?HH8Z6zgFrCfzyf5RFLan/mYVCtoPUbU9ZPiyITZOs6vcNDOoudnlp1xL7Yru?=
 =?us-ascii?Q?6Msp44Ox0g51B+0dH92+o2KW3HlRfcXbigHamIcDrEhBzomztKwQL3RQUH7t?=
 =?us-ascii?Q?JnAXTJeizxXqAvLgzHHaeaRZkvb+Fr8Le/+uSNJpPCNDsDjJ05Qx9bpqKAWt?=
 =?us-ascii?Q?04eIaqfCoFRALGzb75oyGFcsyoWvDTc7atlBv2Brr6dMhSGNk/vy46Nb9Oe1?=
 =?us-ascii?Q?NYHMtSOnVx3wYyRd/8KlIoiV5Fz5vEO7JpnY2VGvzWYAGqRT8ax0nXjgnEw+?=
 =?us-ascii?Q?I8+vITFnV8nOuV6eojmyQq7A7QhdrOYlz85UyUgfdci/yK1/syByGWd3hH/E?=
 =?us-ascii?Q?fat8bY1hsgGbA3wfEQRmAEwKeaR3FofNVVVcpGMjV42JKLTaZbLXkgI7eFSw?=
 =?us-ascii?Q?Tkf2k3+j9C+PX+hHZ8UYg1mWksgZN4GV1GQZzm6MnhJCpmAMYbaC9+pI0kHH?=
 =?us-ascii?Q?VMGqfJwb5tSG9rKN61aBMRsFxP4Oj3v6oohhlrApEAqSx+j26P0BeaDJnYaJ?=
 =?us-ascii?Q?n9kZ1C4A+B2Lm7NtJlz0viry9Kxsu5dBPLnG4X52IcJbO09GyidBy0afxWaM?=
 =?us-ascii?Q?kkpgI1ibKa1P1m+k7QCZaTmVwuxhtffMiNIYQnldoGFqBBZ+ZnOSsHdW4N5w?=
 =?us-ascii?Q?cWyTJV+MjTzP+ll75hbToJJqflA1LNSMKY1E9MsAlNB3o/yhterx+xg8PNrt?=
 =?us-ascii?Q?2hzMIrtcRLpPhWrxY225x12MfuzE15h+WERUojFKybwtHVRqCASDCkc7krFO?=
 =?us-ascii?Q?OVr+9KoSqoZVYLYtI4ZCOLMZQJqpPvZdgkaSWF9RZioIRt5AYS97vchUrNn0?=
 =?us-ascii?Q?CJJ+F3BpQ9Mcck77cys7+8KwZcmm3xo1xzZcq75RiJIA+pt0I1TvHdW039jM?=
 =?us-ascii?Q?2/DG6JS2oxw5wVX+kyq5eaJn4Rc1CpeOszL8mOeo676KLN0FHCs/NVard/gJ?=
 =?us-ascii?Q?l9OuZmReR4w0tz702Jq8c/1DHkJ0DV4G+K0jhqzemQ2S+/DqU77tEFEEk6Ut?=
 =?us-ascii?Q?7kyUVwOsToeSOUIaPanaDmSMTFq90goFmzWsSvJ5HhbVs1iGeydc+xL/Spox?=
 =?us-ascii?Q?ZudY4XSF9ATaY6JGAVtc/TvgYTAny3xhgtt2ffbUI+ckff8ErX+pWtIYqR2k?=
 =?us-ascii?Q?6nK7j5zV7+w0yAPrluECZWynQlomXV1h8OyRDYtN4dgt0P/UkncyoKMvjuC8?=
 =?us-ascii?Q?nW9+wk8DkXdZP4OjhSWs8l1q1d6MmuoQX8/7+Tm5l2ENlygIEl1emhH52s1y?=
 =?us-ascii?Q?OfoJQjkamIiMQBQXtxQM5Qg6Vw98kjAc/PPfmbED?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dc31cf-e955-4119-d67f-08db868d0bcd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:15.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1WqYm6zYWWWsXpXUkPJKWgWQ3q8QJzgo0xrOxlD9yp2jKsTGe1y5uMFoBgLeRT7YsCqfnMHzhsurNWRfd/e6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To get better accuration, use pixel clock rate to calculate lbcc instead of
lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MHz.
Without this, distorted image can be seen on a HDMI monitor connected with
i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60 video
mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index c754d55f71d1..332388fd86da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -762,8 +763,15 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 					   u32 hcomponent)
 {
 	u32 frac, lbcc;
+	int bpp;
 
-	lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0) {
+		dev_err(dsi->dev, "failed to get bpp\n");
+		return 0;
+	}
+
+	lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
 
 	frac = lbcc % mode->clock;
 	lbcc = lbcc / mode->clock;
-- 
2.37.1

