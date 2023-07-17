Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC97755B51
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD78210E1DC;
	Mon, 17 Jul 2023 06:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E546610E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwNAnrgYMH4qs80FeYaXfkNEx4v/VDeKqzN6BgRTW53T4/wZhgd7i0F2YRyFYByQrBbjVQDSlTaJD4i8MRh2B6gKl2hhSaKwsbHLzWq5EaNpvMQlTYPLs+zZPHhO558NOFNDq2D7xwd8YcRwQM++/6hepslM188xdpzanGv0Swc4E7+VBPjOQ2S0weTqMJ7zrZxFUu9QqmItAuBC7yu5iNxoeV2Y7aZm7Ot4jnYiomLqiW/t+DlWBgJuaVTyJEYxYpJBUFXOjVbUar+YagOfAm0+pNrUsEa+lo0UB8zqWKmUvUAeaGnbU8KgMvNfJU9vV2pv7aZHrr6Yp1OydOvsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0cdEHcFLlJAXsmnT4mtG5zci/b3hDN6K/NgDcNZlX4=;
 b=ZAetXI71pjk27CGBrwpBrz2RSOGHgavmkHH2Fwo+NTWGoxf7JQDWSiHMRf7eHb+BfSStAC+DvhyxcbxTFipWIhxvFiHQgegOj1SKQkfGZlAeDgUyEim/7tLSBP0wzv7rjUyTFvyoLHdXFsaAvuxMk0Ug8DLOG9qo9K1mo+hQs2gxbGk3lkk1t55wiVRd/DI+H8w+2+sam46OUCm0zW2yagZx6xepzMolgwm1tIN0HhsAR/yG6wcdEtEKXEb8+uQQ3YYXWP229Jl+3aPJQ4wGrBX+QYuX5+4YW3uE9lj3XfhjX2ybmVL1oZL9i3/l9Q6F9BA22FCfD+X+FpTIhIeqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0cdEHcFLlJAXsmnT4mtG5zci/b3hDN6K/NgDcNZlX4=;
 b=LkTMkfpBFymuqp9YLjePQlSJFlQNWKxSHBZnlvZ6TVZtUhJyPxwe6zKTBF3ZKKSIDxX5I7kOf7HRiHzzYs8i99B2oI+tnD0ZefMPlCDahxhl+Cs6Yffzo8zIIJXSVuPAz/UCcASqEcIGYloEOYhKn1xpZdEoUv9bXrMBzOFLf9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX
 timeout check
Date: Mon, 17 Jul 2023 14:18:29 +0800
Message-Id: <20230717061831.1826878-8-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3234bf40-1ded-45ba-b5f6-08db868d122e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZZnR8km/ddapPuheGRBBtCQkI4AWIPK8VclBRQMDvywlRtfhfAXBA1J7cJgfGNffw5O05k5bF5wuIFKDVhHU2AvUSJAJBjfgUpWP5JNPUzExfc6P+kPlUoHTqmbeYB4Wtos7I2WeaBfHd1n3XfSV3mFr+XR+yxlwuZd5OpQn5a1b5V277v4FEOECuDeKvuxpNJ0C1iVbRcY+zrpi3y0cZkPN7uY8dUkjQVKUrNKfLzajt+HXO3Yc/aWGJCwHLbVrPUDAA8sU0eBK6+PXImzWezO66NufHigWS0HJLmb5or8jND+uixdSoGobkYGAEJneof3zZjUOTegFKIYVBe09X7l9+1IoTO4Z2cjM6MWw+FijoLe+bFLx5pAHQearmb4XZQAsdAlnCX+MiJmTCKDniH5cjwKVH39KboxJXo3ZYYIMUlQUiazWI0lvVmFoec0j5Q+PqC7SmyCztbRNeA7d5xLmaALUbtTtyNv78EAN4KTyyburpxbhdcbpFYQOTExZo2oh143as3V5lIf/B6y2rlpIYjoBi+Y3bnof65Fc6te/jxAB8KxliQZ4G4C/Uq58RVN2dbnu2naVcPllWssE9NpTtQHgClldY4oQgmabK9JrnhvqSGCl/Da1CbsR79Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BU/KYHnYxBONF0wfwQc6cKdvXSvc+4xoafs1/2x8LAfXRxe98EB5hvwCSsU7?=
 =?us-ascii?Q?i7DD+tSEzCbbad4PBO4ViwgKURkju6PZmbWNKOX1AS8p7ss8tckRFlX5Z1O7?=
 =?us-ascii?Q?vlV2PRryaAc1eN0LY6RrEff689Xm8EWaoMUEF2OsNFGV30YY3S/HEK7VijO+?=
 =?us-ascii?Q?nCmVNIVDQuT2jDoT13qVDUDCQA2aZQ2JtDP2DHFekiKpX7aZvJK52yIydZcj?=
 =?us-ascii?Q?qOd2d1j+hvHUPiLQ4sU0PTf0cOe3oDcf2BhFNE/kiC8jLl26hBGXOeleqQBd?=
 =?us-ascii?Q?VeaKpKfJgaBcdHWnEDzVzE0VgEBsdY4QNUCLnus/jsFMjz1WBn9D9NyzkiQD?=
 =?us-ascii?Q?IJXpI2rNEJLdr1zM9xqj0MXDUMCIiPWneRDTEjGgLoLW7VL/6TQWuosW9zjH?=
 =?us-ascii?Q?S0HpUR1aELu2Z+qAsSQBrUUH6h9qZHpnZSQDOkKENVV2AwTFGmFDka+1bExV?=
 =?us-ascii?Q?Jc6EnhMWpnp6ElzjW5/S7WH7uLbQIdMClHd4o09tWz54zrewv4s4ruKBEmAG?=
 =?us-ascii?Q?SJAPsiuvMFqARCUlOCOdh534wLzPNtpoC+GSREbJI1dlcuB42VqXDpR1nU65?=
 =?us-ascii?Q?NUImrYqi6qeo9CMWYALTXqx0KH7U/vYDUbqOfTgZ6OyOf6J44uOhcC5kwmFX?=
 =?us-ascii?Q?kp6KJ4vAZm7W3RgxJowY4KC5dR+ZcokPWyP5ERP+pU9QbIsiEmMdAATGMb4V?=
 =?us-ascii?Q?gZZMYTFB9lgXoc7SevUBFunhHVswlj1aT/vVRYv6A+NOullwLSaq2Ug1i+ea?=
 =?us-ascii?Q?pJF35HHHUXDphSoIOgy1lWE4MWgy6LMB+NGtvIa+aldzWoQ7DK4rn09W/8LH?=
 =?us-ascii?Q?3o/k/c0lrnv2FABJapbVly+VSRgKniG0FU83loEVnlBaMT6UcS9hcIxaVFpK?=
 =?us-ascii?Q?6t/A1U7OrIVM12lySVODvY5bkscxgqQksthtdAU0FYZXWqesLgym4WK0nh4x?=
 =?us-ascii?Q?vXA0OHMuwk+fONFTPU7BJF/7QVkQIVz9HmXrl9eGHxDirHZB2dg35k3UueeD?=
 =?us-ascii?Q?cLrqHDEUIFvVaHPyqb2rZKlL2X/3Rqwi0YVFOq9UGehpGl+sUFnhGIEzbR4B?=
 =?us-ascii?Q?5VqvMxBigNtDduCcQd8pV/heUb3bT87X7AEnb6RpkU+SOwJJyeVqANmx5jZD?=
 =?us-ascii?Q?1S05t03jph/HEfHK9INKmfSTSdt3/h0ZwPBHn6Tk1AG+HgRQR5lN42j9TXiH?=
 =?us-ascii?Q?Wj/ME8BuhRumcjUjuZricJDjfcdqDaxO6hWFLgBoknN6C+G49X38b6WNs2Fv?=
 =?us-ascii?Q?F+LWRfrFWnt1151BGEKhfH1MnX4t6LKQyLBBOiXxbg7JmkeWGUhj7nYQ/28s?=
 =?us-ascii?Q?n6qzXA5y+FDVuQl1qyrl+ZGtUGtyt4sZyP6ky62WsRQ/wdqWlEAZ3+e7/55S?=
 =?us-ascii?Q?gExikEQfXN2x4aJA7654kzi+Z0ge8N29XUZ08gLOYXB1WluInTxKAGQhlD0J?=
 =?us-ascii?Q?mMIlDOUhBjTOJtwkZ3tUAZ7yZyKe/ewwu8QKqgOqlOe33Q1nK/42j0q7k9eq?=
 =?us-ascii?Q?sv+ZdUgGR8L2AqSnTND3rVivd9z4M506vMUnM4eXIzIbONo9bZVsGMxrqJY/?=
 =?us-ascii?Q?Dee360PNbDaT7Rc4K/PFOLMnW3LVDJpec8pl4Ozj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3234bf40-1ded-45ba-b5f6-08db868d122e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:25.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHSY1fViomqTLW5ZWCBzPV/cSMrWyEkODK5ujkIN6BGo2+X2jGnertlKzGBnYqSE8Caj3FuasNEt+lQ0sQzMaw==
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

According to Synopsys DW MIPI DSI host databook, HSTX and LPRX timeout
contention detections are measured in TO_CLK_DIVISION cycles.  However,
the current driver programs magic values to TO_CLK_DIVISION, HSTX_TO_CNT
and LPRX_TO_CNT register fields, which makes timeout error event wrongly
happen for some video modes, at least for the typical 1920x1080p@60 video
mode read from a HDMI monitor driven by ADV7535 DSI to HDMI bridge.
While at it, the current driver doesn't enable interrupt to handle or
complain about the error status, so true error just happens silently
except for display distortions by visual check.

Disable the timeout check by setting those timeout register fields to
zero for now until someone comes along with better computations for the
timeout values.  Although the databook doesn't mention what happens when
they are set to zero, it turns out the false error doesn't happen for
the 1920x1080p@60 video mode at least.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 536306ccea5a..0fcadf99e783 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -684,7 +684,7 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 	 * timeout clock division should be computed with the
 	 * high speed transmission counter timeout and byte lane...
 	 */
-	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
+	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(0) |
 		  TX_ESC_CLK_DIVISION(esc_clk_division));
 }
 
@@ -747,7 +747,7 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(0) | LPRX_TO_CNT(0));
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
-- 
2.37.1

