Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E040E694008
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73010E4D3;
	Mon, 13 Feb 2023 08:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861B10E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V073yHrwnl0guTrdzfUrVjL0dn1xG1yE/kqHPv+k6+2RXR1E2pUslMayB9UTRWSaX+Aa6JPEn6NSP5Ut2/dQoPNLhPWBPSIPNc59+Ki40jWz1M6EN8ZkFMWrhYUNZajwUgLrPa2bxBNIQJvq/4ZJ/iiESlDyPtfNgiSygbmmgUjyAXA7ulLyoQ3YNvmiG7p/ZZjousBMq6nLXvpPkY0WaeGHm471epnNV6diEHL9X+YiUuqOxoGJNG9wgmJahOxALTmKqT2z26uYE9cHoqw9Ub9h5NE+PwMMPANa1bKdmQyfCfu2cQOq7XTXD8P3ERoyVvogl9U+ORg1+MxR2X26GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6NnXmZ44ctfaktKFPzdLi2unr3ubsu9j8G8/JUVyNU=;
 b=hwQeu7ehP67u32n6a4fMNIm/wlO0y5WA80wcLMzVRBnEsc375tYbKpmk4+MRVFwgkjoLO6FU9h6QkbWlYORD3OMrjjqXKzjl3EWsrB1IZGU+1lXODFunCYrvqszomLcp0DmyNB9uy3OKJU1TW4MEAyH/masw6pmMPTnJMQ0iO4h9Swu7PY2biN8b5SgBLNfU9+1f30v3ZHe3YPG5cdS7iSRmppJL2yDuXM292dgF5rtpiswW1M6OAqB38rKj4LR6bwF/gAV82MdSxN4ol7Gu+PlKsba+0eVWw5y8sT7WYgbOT28xeaEnu5e1+jG+49NSy97Y2wAWfgflRrWZRIxJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6NnXmZ44ctfaktKFPzdLi2unr3ubsu9j8G8/JUVyNU=;
 b=Yoi4PFGlgCjGeJkPoHdNVHUbpBDWPYa+GjzDLO+1EYVVjksh55Cz/H47sNctCHjkBFAGBWlDgpC4IM8//9Vf7h/IudCatJ/ZTCxeaW1dpjmhbx/0QuePfvy600FdZkWGkxqF7hLLSOZ1uN931SJG0vcsrR1WodIDY3tDEsNR3HE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Date: Mon, 13 Feb 2023 16:56:08 +0800
Message-Id: <20230213085612.1026538-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230213085612.1026538-1-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4ac0f3-54ee-489f-a698-08db0da007d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kH6pjT54zSkfCpwQuieUIojh2BM6xlgUMTHTvWW2e9mitbvb6uc5d+ZKaYjk+RT8jJoQIFGemVeJjX2dZ3AGRBJHsmnz5+h9fLWj0YYHJIiHY3nDqknh4PVCz9aw33N4uHXlsNuIPgs/cT5T6jiDt1NJjlakXCT23A4RJ7UKzly0+39v+gM6yMAOLaVXhyhEBFUFxguPg6TuvY1m60j+4+0t7aRf8rwElkjoklPhi9ZpnvGwE/l6qRFPqPWmg46ScMf3sy0TzcyXTy1zvGHnK58J5NtMvQ9Opog58UO+SWwpzXdkDNUgOzulEJ5cTmEVSghJnLqm1wA9QHIfhhoVxTm95NysDvmrDPUZLtk7mvJ4A8StDg4LpsRWOUNCeMeA7LNHQMYUhO8wczS/3MAK3xY7IWe1db4dDKUWVsOdCQsjU6Cb/4n4mskqPCPUaeaKiCxs0oud4jujp9kCSUIrwtR9MHvil0lVOj3EBzLDcD/yW+1WLf+5bl4L/thGqxsWGq/dQeW5JTnXS8XzUH8zE/pu2ufJi1oyxqHTXdjOlqPZ608hzG4cwWpRgGcYGwIAFao5cA9T58WFEIjYM5//bCAh0hIjQPCPer3VAfxnxV59o1nki1ZD2ICFSPdsZ4rwlX0HKX4hyns3pj+bM2hIEqmqBSWBkVhN8fHL9CHci+gjy82JTYwD40VmVtd2DNYdoHg8TsGQOn0fTyClyj22Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(4326008)(8676002)(1076003)(66946007)(316002)(86362001)(36756003)(2616005)(186003)(83380400001)(6512007)(6506007)(38350700002)(38100700002)(26005)(66476007)(7416002)(6666004)(478600001)(6486002)(52116002)(41300700001)(2906002)(66556008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JSLu4/LZ1HUxum3HLJCF5pQbu1v0D4SpfM/g7BrsAX2+mKqEKnrfxIqFDac6?=
 =?us-ascii?Q?6CyCRCMIPDuZVmfap589qywLNEHOaPNrAzAYXy1ljfhrcKk4F0BwbnoV6B+Z?=
 =?us-ascii?Q?PWetsKgjHfmdF7M4SxQpLee6tkhU/pYznFt1uaAupj+oF0j6PGPiWVdQEqsi?=
 =?us-ascii?Q?DIvkHnTHBjHxR7b2ar/9YBGZcsnR7z5Vt79ss8aAoZ7g7+AMJ3funP/qYmSa?=
 =?us-ascii?Q?M6OcW9yHKn3vzho4FnWBMixZNAveS30b+D01qqqHXRfiaVaEKSYP9FS2YmW+?=
 =?us-ascii?Q?hvVuzkiXhTf9pd94gJWLGwlm+1gpdPdBn8GNM29B9KoB8cNOsmpR6fEpUQqj?=
 =?us-ascii?Q?qBsAHO17WRfaDqAG/tWsGe+c8Xk2N55ZV2aDfL83y0jpAniCwixJz5ALqEM0?=
 =?us-ascii?Q?UID+8vinX+VNx/wyTgD11ijvmc9Pp+E/hH0zC8WICHyQLHVPbjKxPJp96Kvy?=
 =?us-ascii?Q?+PUIbgKXt8hiWjJjDxlXL2oqLHqXVZN132H9ugKT0HQwhTmjo2/KBpevHJb0?=
 =?us-ascii?Q?GojgHOnetMcK+GF+trhysevIpuO9NcZLQhX94LBn4c8yNlxH/4W4R6juIgIw?=
 =?us-ascii?Q?36PSX1u2pQgulxZEb+nd1PVoYKTln+J8tAmq+gJdbA7F/siGD6PMyxB2f2fv?=
 =?us-ascii?Q?FmiJKyG87PbfSTj5w2PmNGNF0gxQ9Dg09a3j23i96gokj3RneKXfg2krpSX/?=
 =?us-ascii?Q?c+OSKZ9PqF9QllWCXctf0y4oSxzSM7MfxlPV1Xo6KClBy0ifBxM3FEGp1ORz?=
 =?us-ascii?Q?UTEpD8gmpwjzHn8Jb1YLoMNP3M2xFpYa0lF5sf+EHzhyHkzvQIzTO7VlCfzk?=
 =?us-ascii?Q?JrvMKA7Mky7JPXT7mSddEzS3/Uoy+byWe9rcYw7K/8dhTm+fyyaohlanMXv0?=
 =?us-ascii?Q?O5SuDwMG/LsUsk2DGO95t2bY03oMESWhfydgWBoNLvyxDxLtgwkrfQYqYsKP?=
 =?us-ascii?Q?5WUZACPzELlGqEvDnHCFP2hYLyclnOEZUuN7qmwPB3K/QGHFjawz4TcOtna5?=
 =?us-ascii?Q?Ysh9FEwjH3LX6OL1XXpTSZXdUbpX6c7HKJSX5ZZy7mjeuKQO+Yd+RoVU4V1S?=
 =?us-ascii?Q?0dQNQvZ6lDyWYA9ks+7NH2wilbdqeWugXEp5+AVSSK4FcYa2/s9PCpudttnZ?=
 =?us-ascii?Q?eVVc8eOYOycbUP3DZefc8bcDQy/y5WPky4GMIYh6bYxCxdaPtckmgfCQQ0YD?=
 =?us-ascii?Q?3bTSaWoUINVwYba+//aF8xc243PXHpSHVuHMXtx5oHngf/uBYeUFslEFwkrI?=
 =?us-ascii?Q?/18wNXEzVdaWAhZwOmEUSVMzOU/m4m40W9cucYOSWcPaKMBTcC3LFxa0g6cj?=
 =?us-ascii?Q?yYksejjA9girr/ncBYExTm3mAL4ptTTtbKJ5XCjGSKuOfqM7RSpv7xKl5vEb?=
 =?us-ascii?Q?3bwSale6ayurti0FMnXLISrjikMaO0Fx7VpOaSPdFUAl2NxPqTAbAg0pV7nU?=
 =?us-ascii?Q?KJ87QvRmi2kAzewFOcXG/xEMtS/10qvW+X1bZUa5XoB/93mQjEam6xv+KQp5?=
 =?us-ascii?Q?BIR9mKJ0gQig45BbLVo+Ur14SXidKj832qyBo+4YtuBnohaLWAefnO0Si3b3?=
 =?us-ascii?Q?Gabvs13FCTNOHdlRbCg2GQURI+zhATUELzZAcbAD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4ac0f3-54ee-489f-a698-08db0da007d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:18.6080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycYhzj9qSi6HicPSH9RHRrEtSShYizG1zaPE2sLdKzv+U6dRTvR3YEI4RP5MNpqf8MZ/GMTyTQJ5axmBcT7KYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7600
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A valid bridge is already found in lcdif_attach_bridge() and set
to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
the unnecessary NULL pointer check in KMS stage.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 33 +++++++++++--------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 262bc43b1079..e54200a9fcb9 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -394,7 +394,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
 	u32 bus_flags = 0;
 
-	if (lcdif->bridge && lcdif->bridge->timings)
+	if (lcdif->bridge->timings)
 		bus_flags = lcdif->bridge->timings->input_bus_flags;
 	else if (bridge_state)
 		bus_flags = bridge_state->input_bus_cfg.flags;
@@ -463,30 +463,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
 	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = lcdif->drm;
-	u32 bus_format = 0;
+	u32 bus_format;
 	dma_addr_t paddr;
 
-	/* If there is a bridge attached to the LCDIF, use its bus format */
-	if (lcdif->bridge) {
-		bridge_state =
-			drm_atomic_get_new_bridge_state(state,
-							lcdif->bridge);
-		if (!bridge_state)
-			bus_format = MEDIA_BUS_FMT_FIXED;
-		else
-			bus_format = bridge_state->input_bus_cfg.format;
-
-		if (bus_format == MEDIA_BUS_FMT_FIXED) {
-			dev_warn_once(drm->dev,
-				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-		}
-	}
+	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif->bridge);
+	if (!bridge_state)
+		bus_format = MEDIA_BUS_FMT_FIXED;
+	else
+		bus_format = bridge_state->input_bus_cfg.format;
 
-	/* If all else fails, default to RGB888_1X24 */
-	if (!bus_format)
+	if (bus_format == MEDIA_BUS_FMT_FIXED) {
+		dev_warn_once(drm->dev,
+			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	}
 
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
-- 
2.37.1

