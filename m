Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34043771966
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA7B10E1C5;
	Mon,  7 Aug 2023 05:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2051.outbound.protection.outlook.com [40.107.105.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626910E1C5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByWjAylLX62Cxye64VHA46WAfJJtMSeVJCx3fchDTSuzY1znOrwXc8C/QicNPq/Y+bxXv7KgKCzH0rVRQsVm8YyPCA4g0zQu8ne03VTNCZZMvW8wf7X2ePhYzx6VVzuQNlUalKDxBxWxk01U5nHPqBEPedQpH+yrv0OqiO5+Zz74VC73tN+aw2UJrTDuFQmMMVXmi+RSfwjLPG5jGtdFxllcG+XwzXEm6ssl+2KXqJdmJlOB2dIPxju0+IJobMUL+KqC7/E8+lUiTm9G/qbZdS0sU2Fk0mZFA2TvGWAGuE3hH9A+Y6EghzHdwGLNnSpx+BHzDLdUB15eDHkGVry0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP+CSUUYPPxXfIYSwkFDGPmnNs8Dq19ovS0tsBKgpT8=;
 b=KLbUKS7mValfuZPLvUz4wL8TJzJMLTn16VsuDfG+sbG+pPHVITYv/f1nmDhe5hLZ/FctceaUKc+POatRWCX5jS6R7PfFI7YHEWQNfrxro3ZHjbBi/rqybw6fVeEa9Kj9K0t5IGV7vCHEx3BLfO5mYsC3SevLemXBne3Yri9Lfl06nJYSDkg497ghk0zMx83XRYewHsfZdu1wA0Pw42on4+D28X8cvdztmMom7O8eV7uvYq3EyqPWOzkonxzjjCJGAEAHs7Bx46ykzN9YPz0twQgPP6s8tG1QxlGksMsYoVBeSaam3d96EiMGAIoiUC3A27ncTyeFGIAwtx36svisUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP+CSUUYPPxXfIYSwkFDGPmnNs8Dq19ovS0tsBKgpT8=;
 b=ciESWa8Ck5BIApSLedJfyM2cum7VYJKZCnAqbhMYKVvrodNCTnMgEiv0PlxvO7h0QIKCUfaowhdoDI0ye8YCwvGm670ItM2TO6WYOJOhNn+8MxN6mgJQ6gbMg7JKVqE7pBxTkwt9Aq1Y+ooA/pJ1NvQfCMx3cYTe37h/1WDxbJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:22:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:22:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane
 byte clock cycles for HSA and HBP
Date: Mon,  7 Aug 2023 13:26:05 +0800
Message-Id: <20230807052608.3038698-7-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60175840-690e-4e27-07eb-08db97064c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsKnxtTha/wnLGFbbqijg60wb40XGLWtM0p6PQDc8AsF4f4l/ncxFPyab4mBDn9i4vTG70sr7OLv0cIcUjKMxR0SRa5zHhBubF7SzU/yCz3BHZclnAgC0dY/2CFSRpMOOxTJ+MR12GuUwO++z17U57nsVjukgpRvYuRRE/i4zbBvU8XyH0l0k2/ZEuAmWgy8eO9wEPGokSUXK/Jj+4Ze1zwrrqzOKOk/Ns+u8GgW7PbIBhdaV4ogG5On+eoEPcehp7YQGse6ReNb/sw2OMwP4wfVqMB7gy+syQWMIxb73uuiNoaJhraHVkAkQKXYPJwXPU1azCcO6KgRK+tjTUlhIWN40ssG3C/XSolmOFgmVzrOUYFgDCLgCoAnEdsWJg3i7OG1+WQi/Ocuo10xX+6SVlDThN3dR1DD/hVNDjmp4Qp2okGuCIQWkNnmH5s1fh6vZvQkc1ArW1Z9b6AXQmRUXsOls3FyG104ORGv89XGQdk/6J9/NKP9ZWgMIMNVCEKT2nYWL8czYjxlJI1LVCXWwfc0TbxuMuSKOH2LrV5EkY31J88qMTvLHvXR4GR6igTm/AJ8ghtjKovHjDdcMFBSrStdjOzZFLpkF5LbkzyHkytHAZfEhGSud0CMuZpeQg+5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6666004)(6512007)(478600001)(86362001)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RaTG4Q4hyVPF+9bC16v/cNQDfzwsiQGJPQMQOM6a5NEd47TTcJmhNyudOMdp?=
 =?us-ascii?Q?H4FGr8xajUJCq6WTt+wTAWNUnYeVqLaQEtSEtUKPcOWf8XnIRXVaxkX3efnC?=
 =?us-ascii?Q?/RW50yDMZ0BTd6p3O072VZYyX5vrBdNyC/kPs070NhHHuIVH660V87P3hcnt?=
 =?us-ascii?Q?4rvFb+e8HCYeS61TX4zNAc25iGV6j37mmc4iBKROQGAm+Xz9OmtXwU0oDNH3?=
 =?us-ascii?Q?s3v9sLcWt1DVqqo7YhlKG5ak3N2B7cJP1rw3WlElod/OOYeXPLJtmTn/bg0o?=
 =?us-ascii?Q?9Fy1sJFGAxcUJxXDlocjuUZZa0iJz2XkK8A4Y/B+BC0PDYKJSaREgwDaQAjg?=
 =?us-ascii?Q?Lf0f+jSahivY9srQ9PKFmGOY/V0b9f82VHDWb3U53zz7Z8HiBBrNxYG57hnY?=
 =?us-ascii?Q?xs0kp4AqmDVZGVoniT/y8+U7jH6M0FqCt/FGcTrs/FbJjVfQQvBu0yJ/QYqO?=
 =?us-ascii?Q?YqYZtLvmEA36n/dGQ4W7qVXzxEShJ2r0M3ZwicC/aCaJHuL6Q/PF1et2LLQS?=
 =?us-ascii?Q?M6yDpvcVzTugqyex3qN6OZo+Hf2LPrBWFxzuSSuXUa6s7oAaAX6K65Ga9cWW?=
 =?us-ascii?Q?OSbRne084PBn4VIFba2R3aOyi58rf0a5ejm2XctKOegWjTIZfbFBwiRDXuMC?=
 =?us-ascii?Q?e6VyoBmKbfJC5UuwqGinc8LToGtDTwY4iLRiAEljkb0tM1/RtcUQJmozUiRB?=
 =?us-ascii?Q?i2n93DoUfNUWUnpdnefNQj13exDhmq7nW2jMtq6BFftuG+cXCeORvR7AyEh8?=
 =?us-ascii?Q?/bXBLubgBI//U3w9YG3M33Pvih5nnSzPj+Bs5M4dh0unOcuYUwQffpszBMXj?=
 =?us-ascii?Q?cljhqM65bk2j5lS/Dgo6Gx3oLefnqkj1uB/frwMZmiKdUAwjFaCoRTddXeX3?=
 =?us-ascii?Q?ZWDdIC4UOdA7tJElzCwn+atdHjwwGoscrw/+Jmg46BXaMe2JIohRgJsMPplN?=
 =?us-ascii?Q?sPC3xlDvhwC5Lm5ueVQArO6opuRzyLWN8eXH1fiU6bWO/vUvSHuQx0BosQnT?=
 =?us-ascii?Q?Rro1Nfrep22joEdhrd5KT+g94TNQIULRh1l4Cbyvl80pDkgSY0uS10lAZaZJ?=
 =?us-ascii?Q?3zF+g77kdFG8bK1A6KQjIHGhuQRxi2ZyXTY3SU52lCt/3sgxxKUJP8icj2M8?=
 =?us-ascii?Q?v62zOPcqfZcbpl0x5js3G/CfP6fJZ1D2+VdZ/qe1ZwvmQ95XgiUx409htk3u?=
 =?us-ascii?Q?vfRoxHsVrHvoQui6YPa91iCmnRLSSexJTD3jLNoNE3bbyYtngRbKIDXVXjux?=
 =?us-ascii?Q?lTuh99/SgByDBxAmCKVUBpDZ4w354wccNJ0Ymav/zTaIfWq7GU6tlqEVFYJV?=
 =?us-ascii?Q?LNqhJOvVvs36eesFaa8ZbhpKs/eYb8/wydgDQjqzamBUe3S5IwUzc3VRlLD+?=
 =?us-ascii?Q?AZggIp5LwzX835VUbY8BJgD+Dn3doKHzNEzfyVtCYNQ7RkV1bFjqWNAz/xJR?=
 =?us-ascii?Q?mGNWsSkuWLtUWvZtmqgNELYpsR/WUesg2xw+BhdPDErlE5apyAazMCaWfZWN?=
 =?us-ascii?Q?Ym2hDcVxoFNKOSHPl6DPoHzHsr1BswtgJRs4lZF1CtyPpvAvw3aoH+M53y3/?=
 =?us-ascii?Q?X8yGWMNNvwtYDQpBbaT+AHyc5nTcpU/+DICmoZFA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60175840-690e-4e27-07eb-08db97064c3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:22:30.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPfTQJWj92wx2jvkBSNpDbShsNi3/G3TMR9yE5hKbxc3e9SpHoKubisFzde0Ox3BiZ0zXptgO9IknJ41TkudVg==
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

