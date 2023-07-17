Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07C755B4F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B7110E1DD;
	Mon, 17 Jul 2023 06:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EAC10E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PByoydFgIGMa9GpUKCnewuATCUuyD2EwtDZNfALwvjbknWWvhg4fBth5NOQksD5vJ5BGdLbViVYqYW02fuKX/uzXcuNoq94LbMXGOucQyX5G2PoeKEa4mI9aZZjiRECWI8truRYpNK3di0rk9jiluq44RudmPOTokYnMTiOMb/dEt93KcsTMp1L+SUeGdsyQXRuFu6j5CXHflv3c+rA3Q47Wv7CicBIPMiF3ARJSEY6fX8soyySu7Hq+Jb/PE6FMNCjrO/EcjEAyw56KvXkcIYSEtGisddr3CoemdaLismkIuFvo2yv+4HcsJyz3/cgpHXO/luA9ZsyR8p+PQDygeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POi25b8s93OGGpyE7RAi7QH/scWVsemJ+1Ty7H6HYWI=;
 b=EsxLZFMn54K/rn26WNTkHnw0bqa48Vn1FvQYCKvitnj9ZX+IEc38T4NZS0sQafSTmRzW9ofP5A83tEQ/z+z6lXQ479n083SKRW/YtUx4iUqb23fQb0LD8THBepOhkOfDJlBwXfkRgdDuQMVpmXpd71nornDAUwhHxw+NuCwG/ZvmEO0BEjrjxepxpBnHqtRnzGP5tN4Jt+/+d5k9qmlwkPsBZdr/dsFKIfEgkhpz2ENP/DsC2YAVPQGB8CVF6s0dztGycpUUxcJtY7k3odIj/acMPEsYHpQJd1Nfm6VIBjB1Cq/nOyT9a/5pAJ9FSDzYKPuYvTX2m6RTPIk6GZUesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POi25b8s93OGGpyE7RAi7QH/scWVsemJ+1Ty7H6HYWI=;
 b=p09AnDz2as/NTRuKUUd/ahKgu+maFiAz4t+MyrjSHcITvybkfAbnM7TxRB2tZlUsM1Q5HG8NhRmOPxfeox+3djELdyEJx4BbacjEKJin2P012IQcz+cm66P0EcI/dgOfDuCoymckNAfMXTXkz4AuDMcnd8366ef1gWlKz99ASHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte
 clock cycles for HSA and HBP
Date: Mon, 17 Jul 2023 14:18:28 +0800
Message-Id: <20230717061831.1826878-7-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 808be26a-a9c3-43ce-9e1a-08db868d0f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsxiXmSwAOaJ42XReJNcsFUCf96q8wqBIXGtlLeKozDetGMH8RqeNjGRm+Flk+hy4/lFplzDp/rIPlRFfQxV5ZfYpOmimSn7CX7a3WXqJgtcoKad/YY3L/4Esy9Q1jWjD9e33b1b6KTZDjxMSvatF4oBQ9yK3FAedMdfcUETjAmic04E8xr/uQQV8CNsxK8o9dURHdDHsukcV41rHBYMSpjt3c0txPWgrPcQowc7gppAh6dXqoIgwh52iOjbPDzkDfS4Gko+b1D9CDNvS/S+tqPUXzDphe4cj8QwhSrbhlgMl7NGxy6xZegbnHir6uU9WD58D8dJDnKHCfXnCIoyC5z/upO2YyIHqbCP9hCcLV/deHPK9BelQzqHeXQKLmlgHORwiq/SV+xcR/ywYFvZ7DcvAAhVMwEZtvGEDARJLlzfixsE5HknOKuOgoz/JxWL1U6nTNVlsDgdon3iKeaVNgbwN8ryh/eDT40KHv0mrPu7acvXeb1qlmwKmk8qdxCfA5A9oKJw578P/6bC4k8ZzBDsdvQLHq86KDANYqmjxCfw7PLzL9yviL60ebANGkhKv0YJID7c5UOhsVhGC+N/70Q2kZH1m0Rl6E7kpb4Bw3Tt8NMXYFc7GzriFTPlpICK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JGJ85iDMCjK8GLPSDbQQGxG3xoUnLsm5Mn/49pJJSYtYWsGUq6maigACjBmp?=
 =?us-ascii?Q?Omrg6vavV8K/oSlDPv7NWfRkn85kimzntMgon0pLOPuGMEER6PKdTTl5PCjX?=
 =?us-ascii?Q?FX5rQkc6Cvd7/SEL8TJEKrBDDVi8p8NRgnq1yCs01mwELcoIL3ppF9NiIjP9?=
 =?us-ascii?Q?pZxB+kPUefGDgw68zXgrr98nMOFl5pXUxviWvfUztrnNOfie70DSOA1si6JZ?=
 =?us-ascii?Q?VPUIsguxbgRBkmnj+8KyENlK3M/ghbRR37DqM48aX+xhQs75E71RZbX1V0rQ?=
 =?us-ascii?Q?2e/mZU9lntUeW/zi3WS+RP7/LBxCz/RRi1uWyDHbhjmQkiQlcsHUJ475gsJ+?=
 =?us-ascii?Q?smtT8lhrC7fXqQXBQa+f1w4wJRluvAKWKcR0VXLT4S/pF3PaoYlHmsSPdygS?=
 =?us-ascii?Q?248fylc7MC/pmk8F0yZ2/DeQA5lGmTuCQfeHGeLcmyXWuDm2TAklOCgPGf2J?=
 =?us-ascii?Q?2PON4hiJZwGeHg10qvllshWiug+FqUQ6K9RTXG+s/UTQEvGG1Q/amtbP/W0V?=
 =?us-ascii?Q?B6v2c2nTZc0mLXN/7UBax9C1kj0GrYja7EJC4bZWCSsrucBNC3SkujPVLH2r?=
 =?us-ascii?Q?njl9wojIWqDjgfRZ0pGpdesscvFmGh1K6GESp+b7X9aGV2Qar5uugOGsO6X1?=
 =?us-ascii?Q?ePskMqkhLCSTEKmN9f/OGWFeRzuIm9hc2WuzOTpP2D/qniP+/nBYvwiQnnVQ?=
 =?us-ascii?Q?/YRC8LvbTEFz7YHYAhQYrKeTU7f9FL02Cons19KqfRISAhVSEI7VaxZq4dc0?=
 =?us-ascii?Q?9/ETEpAfeRbZ9MsWakYCnK+hi19V/BLoH20P2M07Ssmcm8COc39yzQPwxHpv?=
 =?us-ascii?Q?bbjzo5as8VfDILE8QJ8OU8BzqP0xxfg0NLiJ3VGYchFm8/9Lob93lD6QV48B?=
 =?us-ascii?Q?iHCq7m6mbX6Q+A5ri7zfzQatJejU1439BhvZNdSzsAmx67qUkLaCu/cGeEQC?=
 =?us-ascii?Q?GvmqAg1KWLAo+8DY25TwH3WCACrroJ95GkFGQODNnRnWp9xYCVLE0EYnnEep?=
 =?us-ascii?Q?QGTc+aWLnvJIGIrzeDpqLThizQyLVu5rBQGZiK+/SPgRN8CbplLBBgfHYEUQ?=
 =?us-ascii?Q?0Qhf8dyJPqcZ0IVcjhzm3P7Na/zm5cIG16zBLzbmzgXIa0sf4tzwdBgJOVop?=
 =?us-ascii?Q?9cNCyi5c0h/Q/eJHdsNbVKTZyO8KzLXprLwqt1eCooVf+0KoGQ1XovueFJCU?=
 =?us-ascii?Q?1N2HFTa81Y6//VnZHhMfVzhBt32f83luJihFwYN1J+FhIg/hNFNFiSzA6mH0?=
 =?us-ascii?Q?qFiMJffCiAQBHHfRi5wHcMfkJ5yrm4Xtel/rs4dUWek1FadLEdxYoqS7Fwb2?=
 =?us-ascii?Q?S+gHDV60fMxXHfBmEP/oyJN2or9HOvBG7f6guhMUhAubAMwLhuOqnVInKVr7?=
 =?us-ascii?Q?aPU0B0L/6gNVCyOdgcJptsvxqNTv63JiD9FF71c/i20xizTBu6/DUcSodfaG?=
 =?us-ascii?Q?DD/mW65cBl1DoZlLovudhU49KdgyJu06jXqH+TnAyCbvNQtVgwUBdxR/M6Xr?=
 =?us-ascii?Q?Z3Ho9GlfuRRbUrEypFaLAO0fOiXpdz8/4SYZzdPInN7EjvEaIBKDCjdIojmH?=
 =?us-ascii?Q?0FQ8oSDHLcoVvJ4nZCHIRk3M0XqPh3lUyxWwJ1QL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808be26a-a9c3-43ce-9e1a-08db868d0f06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:20.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNRSAV+l1qxXQ+GnaOkilAczwior/UcvpT0xL42cEHiW8eP75EQqz0Li29GanmXrlyXXAM+n3EeYXVI4A4sLAg==
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
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 332388fd86da..536306ccea5a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -757,12 +757,19 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
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
@@ -778,6 +785,11 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
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

