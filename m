Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5EA771964
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CC210E1C2;
	Mon,  7 Aug 2023 05:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30BB10E1C2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=judhNTCadGuRJ9QhwwmOxjWldC0bnky2wcHVgn6Hfc0WUT58YLagqrmSt15oKIQy8dLRapOTsN7QeIUBa94qMFj2xjskSqAOzhK7uUP9gXm32NHhBH9VJBEZBqkc0PzPi9p3d4jp4cUoRQQ/GSlWxk3/C2lrt+TmwiCSjtm7inVKZftxAv/OAPhG/NOrRE8KLZ/JAMMRtHmG1w84P+jU4Otl71WCVRv2AH3pz5g5enq88rW7lmZkOy0XAd8x83gvzB/BCKOc2ihyaDUQSlwT1upA88fnOfGVnhcoaJu5sMmGyw1NBDBQ0TeJBvoCZDwI/sgnUE3bMoX1K29fIrimYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPvwHyPm/+RhMw62kuGEMYt5dvTiM3F8aa/srDQdTvc=;
 b=OzflrwFk7h2bIT3EZiqq3Fm1ulii67edMIv61HqveG+rf6H7jWmu5V7iT3g0/ktd346iRBg+HIFppZSfmFOA+iSHSDT44vV2gA07YlU1mOF5tJ3fAW/D47+7uaAKHPXpSUIk19UwA7Lh/BwC9EWq40f/bWV7+1pelpGEmG2OF5HGajzRaimLCs26vhHRTDJmadLKpWsZFyIC2bsbCzpBMwb6o7QQ+oUf86ca/eJAoi9e3Xr2ifE2GsSsRLcdz155Kgx+eCNuTNZ6eFBIKn8awfP98CUR8QyhYGdsHysCjDkIiwTULAZSesiFi056vS+U6+rhXrteVUW1tO75Ebz1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPvwHyPm/+RhMw62kuGEMYt5dvTiM3F8aa/srDQdTvc=;
 b=OmidvkvjFy0xDT7Z6xH4E0g+eFuRlC8zU8wtiKUHNBt5AVz4qNOmXKMPwYAgj9qby2AnoBSusZHVm0umMQJfMDDMuM0joMUGMqwYuiOwN9/90oGpfAj7CBk/17OTf2I9uaV8v/26UcM88Vm/7tGpbpoxkkeCoiJHcl9cd3WfL0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:22:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:22:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Date: Mon,  7 Aug 2023 13:26:04 +0800
Message-Id: <20230807052608.3038698-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230807052608.3038698-1-victor.liu@nxp.com>
References: <20230807052608.3038698-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 47616819-f20d-4c08-e88a-08db970647ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzM/P0Z6MCMc2dVHWzt4nTLajKDCLuAworpivIvnhwkIvGuZugAcr+0oUS3La4wmRPY3RcNbEDCrLwP7kDVCVH7/FJD4VfXflOMD8j8y65PlqiuCjjq52fiWJLEqTlzsG5/7Ths0baimuQeA3GnRcYfVn+a8fdNHG5EWLanSpdS0q14sNRqJjLa/Q0KoDx3taIc4RIaq/61GIVQDcF8/g2flUN7CH33l9puV+DD47iCN4xoCBPUktNt70CDaCb/DCRrVS3MJboqfwDktK8pBMsVdBZCm7XnBBY7TuzbtdnlW9VW6dVucgT5COz0ZwS/0t08G2IRU/HYVhbX2nURHZiJiAI160vxXMsl2kTIIC93oFSulwAI6RvgFlziFpCqdEbv50NjyZfxVUJB/AshOdYo9+x17XLzHvN7cPnJnJR29m956FqOaFpspABUTd0wbsRN+96+OoGqFRUdzL0v2DXKilw/EsK8ml8AgQSLCQ/Odnm2KYur/+smx3p2rm3iLpbx/DH1QssdQkP5r9h/toTtfbiqVqEeCHgwYF2J1KMwVb57vd8/2/Q+GprhzGKlc+JmifULEWJMyKssWe/z6ssGTXTU4ZfhqEKabygqRR1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6666004)(6512007)(478600001)(86362001)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1IQIK5DPTOpzYcMWukI4IcCA27fHF8CzMl0yfjmNerHWqQ8WewkB+Ll1IFzP?=
 =?us-ascii?Q?x/t0s6VZ2O74ukzTjX9Dk32q7uc4QFGepejVcORO92c3jDzXdk6J8rk6HYP6?=
 =?us-ascii?Q?CNDa9wtOXEQKqNOHuLecaWIxQh24RLPSVjJ9AsMUvwIa/C8J1P+B+oIXrWBQ?=
 =?us-ascii?Q?CoL+D9ogpbhZLtEXEDKaeIsVFHVNJU7Y9iHaLx6VNQ3bRIzN/ydRqvTBCGz4?=
 =?us-ascii?Q?tV0F/ilLd4BBaBetyQFzQevmmYBon24Z8LtHvHscgN8Cw0IKLrcW1bMwmyAM?=
 =?us-ascii?Q?PnrGaJj9lRU6u3+C0ltCmkxQQFFyKvRK899Ap6vTHmmWmNm4GDfK+hL3fwxQ?=
 =?us-ascii?Q?rjo3JjExLl7fW4ZnHvcsnaigd9VRFvnOZ1iUrvvsYox7Co9v+2uazXS4dsHT?=
 =?us-ascii?Q?cCbtTS7tc1naUNYogmahJZeSkhihc6P/Bc46JKz36WkMJUMlqj4gu4JDOLKw?=
 =?us-ascii?Q?bEsF39I4+bTKuAif5/fWWuBFxbkZdKhUlNszRapr8jdt//n0WjwtBlm5SyyL?=
 =?us-ascii?Q?q6tDtQWvy+VUJ2A8fWPe2vC1LjP6ryhYpmOHI2KGZa4ttNeyIX0o4bj6dTWG?=
 =?us-ascii?Q?4lc8Fax2MgI0rj13R2LmNGRhOcWBG5Q9MEkcRl+SCl5v6OWi1byQ9sSDnD8p?=
 =?us-ascii?Q?9m2XgtH9gprXYsbFiPf9UjvZjRzyPn8POwLrwQq62YZlj0T4eiMJeqb3XUjn?=
 =?us-ascii?Q?jgkNW1jIzMENwMQJ34EG3zqJBC3xhDGrb+WUTItBSQtMaoUHjFtfTG6wo52a?=
 =?us-ascii?Q?ZF8wCInYg3FeK07pEq3BBSB/iBprC5bvZSnSl+0mIRF0tXvdpgnzPX3g6Ct+?=
 =?us-ascii?Q?C2RiNieBfMDw9WBcErBbu6etDBMIP/goY+ZPt7PikvAvhV3AXlJ2x8a7ux2f?=
 =?us-ascii?Q?U2iSzdJcN197Ghu6L5sTVSjAaUSRYPDz1C5Y8grwri9lArxRScmEtJioTYFu?=
 =?us-ascii?Q?pgM8fJuDNjZz7ZzZ6X7AU/ZST9PxvoQdsk+XR74DrLt2aqmWJTQabvfNtyTQ?=
 =?us-ascii?Q?2lCAfuH2yOuXjfEvvtAe0VNgKeJzUczp07XWn4B8qja6e9+QxRM7TpbMmyFc?=
 =?us-ascii?Q?S2xjTjdnYUX4WAMZQFoCMUlV9CTudhZRkg4QU1gmY6pMhx1bubjzmpNlRK98?=
 =?us-ascii?Q?PvIzVNJUCWke88WCb3YxO3vc1KjuuAKZ38xrKf23zPiNIjraadTYNDDfPKIy?=
 =?us-ascii?Q?x9RYICKyuE+C7sn0tfvK4B/6zFS29kKJVecY7sf94ou8GlGuCjBSqE4KfHiE?=
 =?us-ascii?Q?3MvXUBP12QUgGwgIjtR7ohBXFZzuez40o7n0UbFvszslyskuBQR73un4TfGb?=
 =?us-ascii?Q?iBoLBg2tEG20Vj5u8RdseWYVYZsiagch9pjKO2KPCfKNeqQrDqGuKVzUBQr1?=
 =?us-ascii?Q?WwFNPOzQ0uOQa2qxJV9PXjdc7OUk8NTS2I0KBq4w85iFLTZSw601VY9cjpTs?=
 =?us-ascii?Q?9w/cf+r5iWsQv5ij/z736BbYeTi/bFu9vHaIiXOnq12IyvJpvMxXGUJTRiNQ?=
 =?us-ascii?Q?0ha41cGGVsakiWpd0d/IE2OXuzoeIipTVYOJ6VpiCJj1il7Juag7mvUljFHu?=
 =?us-ascii?Q?3bnvrzU/+IOiBE8O9f3nQj9ctvm8DzN+nspRT1W8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47616819-f20d-4c08-e88a-08db970647ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:22:23.4877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIUXFf8UJ6NbqzsC6iC9exIrkqmnst6LOJ+m4j53H4jgPzF69ON8XO0eStC3Gk7Dd53EWfBs+1al81ob3VdCpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
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

To get better accuration, use pixel clock rate to calculate lbcc instead of
lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MHz.
Without this, distorted image can be seen on a HDMI monitor connected with
i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60 video
mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v2->v3:
* Add Neil's R-b tag from v1.

v1->v2:
* No change.

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

