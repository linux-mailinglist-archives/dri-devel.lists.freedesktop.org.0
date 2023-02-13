Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E669400A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D5810E4D9;
	Mon, 13 Feb 2023 08:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF2610E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wxt9eeoe7qn/EUd4AbInJ7ILSGIwz/BItaoaUUMVOi+q11vUxZhfQRULkAO9BTwwtonm1TiTjrhcsOEOsRkEDHczL1MRJYD+eXsSasZE+2tcb/cue9bBz+18Y30jC5VWXxPiuP9KWY0WMUZ1hKqJdCMVmScBzTHbNye5DoKjMJXLTGsDpSfyYLUjrlnJUjeRxAXZwwI193hd9K8LE09dzlZHj1qiuDZ5rIJVQoQWAaF06lYL+yaXMsMJ/7161WJ1a8iHf5FQy4rEx01GX20G0WVnusI9NSgvJ+yX/MSV968k+Bm+kfq+qr01U4icSYPAvt1tQ90SICBgwVbW9roDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbqn7uamqwos/5+ZTl6vBAsthI3M6HVDcsRH60Q2aEk=;
 b=QVrNU0Xs+5RLwdJy4yBq7tAC+8IQLxUBqA9iLmySSjcLc/ejCFV2zdCiuzlAgJ5Q7Aw0kHbgqrr0t20K5uRUzkWsMMO7cGqzlCxrzafuJEdAyu0urdi1lZQ+oYgrh7qScWrxNZqtQheNQD8Uh9jYgWe34bLxryRIZb08Lc2x6XLe0UNMpRdG7i2ZbVsWxKHlmdg3VFRDxMcvew3watzUiiMg173oOG6trAvnB1g8vjjpFMGPxrS3ZhSiWOoQG7ms1M1xDCeTOD37DAo/+FV0untuhDXTFNaJSHYWTDAp7bvzQYhL9jmunxd1SLtggn0Cs3dls/UlYO4amKsREscFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbqn7uamqwos/5+ZTl6vBAsthI3M6HVDcsRH60Q2aEk=;
 b=kwEE2H+2VAs8gLBlaHKhL6oVchJfolnLpVU/zmwjq6KHT/DVVQwGE8SyZOR8tJudoOu8kAXSjduqPMH4QRBCJvHKlYJr0j8cZNB+glw4iP6rmAJoR7ZeWfZ97gnXSjU01UL2rl6d6R0WrzhkvfW7U+fW/TGZVEiV/6bi2R+o8GU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Mon, 13 Feb 2023 16:56:09 +0800
Message-Id: <20230213085612.1026538-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0681deb3-3a17-4300-348d-08db0da00b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 452z3K0a6TOKKOmMm1BBFoEnvN7V96yEgVXGBLul9yrO1Kn8iPgwnmmi9qd/+1z8nt1HrfNdH9FKD2HyL59J2QkR3hfo8EW/1hprUbbAY4fXf29RDWGp8ztXhykVrFyi8i3hrUpilU178TTwAn3kzUUhCBDL32R3Faz8tJ8aS/UeCzE5eT+fyXHxlCOvysNTGb0D26bZdctwkIey5gVAqC2v3gqd6mGHx/ZJWBq8/sRCVqHGzZWYgrezrJMrRCvP8LozG3trtQ9hQeP41KVcrN9P1AO41HF7I81HfWebt0gIVWTeihdB/srkIJWNH5OsACKFFuN8+AMYB9IcsuFvHexbkVp2CvKTtv6HVvWttB2mOLzAKfSUj+zmIaofuvxMuuc3uJj4YEVMyZg4e8+Gou7LHgMm2Ay0CaXbRU/70rQdW+mGOyo9HAr9JiQZRGGxUSw7s+LmHODPZf7U1hlEPrT9XC41u0LsYFyJC/UtUsxSLHrs8Zgv6OdwoE/cgJZhShvrfou/m6LgAx9N7FN7fcMk11TrGiSIdBRtpcgZiThhuW5yeZhdoK36BA3QdiaV2vvtkXCm1DKD3aBOXLwo0gsrnQRamPfoh3BKbXSWjivDjsjMe9ATPBJO+eTaZbqLc2fUZwp1F2lND9Eg7IrFyhniGY+OYl4U1L9TWGMiaPEdUFl/pG/h06V68gmVzdA/krpRxNqA+MFbbfHSwShFIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(4326008)(8676002)(1076003)(66946007)(316002)(86362001)(36756003)(2616005)(186003)(83380400001)(6512007)(6506007)(38350700002)(38100700002)(26005)(66476007)(7416002)(6666004)(478600001)(6486002)(52116002)(41300700001)(2906002)(66556008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3m5EOvqB35AXLOfunyWTecYHKpvof7tfNcZMCu5aCTlaaZeydsLRHSzLmqMs?=
 =?us-ascii?Q?IZ4YYRVQRdQgfA1uxqQK8Tb5KncV/GmCwsmWjfSA0ig+1iCLc8BUoqjgBzAi?=
 =?us-ascii?Q?lw3DerF6phyn3Dcg+qnO+zUlfVJYbd2gFpie4IpSkPCnA+/E5W+Bq9fJMvfF?=
 =?us-ascii?Q?7FEZiPRAZ0Cqgt5L/2WXqRkd088OVzrq7V220/ZvkjWz3LLlMSThwWXmuiNh?=
 =?us-ascii?Q?b79bDTFg4HXDgQVWJ3s15Q6Ij59euhvs239XGZCUgE/En/cPGiqp8i3KQuYj?=
 =?us-ascii?Q?aCbNy4LD7WC7onsTQYXcJqLaemFb9gR/aOxXFt4XtoalkpPoh2feEyCFHv78?=
 =?us-ascii?Q?i2O/jwqSAhWZPtb0TlrcMHDfPakhlcMst6IN7gVcZsv0Iq9PqD70GIHpCrbf?=
 =?us-ascii?Q?Zxku/MXI9uWqL4h6F4+mnaFgoBdMBNOJKWhXcQCMpnkfTWcT00owoxgKtBWz?=
 =?us-ascii?Q?XwkSy1CB6vvXZ6t4sx8vVm4nWVo20bEcuZdim1ZQauHzl7aYzwL4FoAWAond?=
 =?us-ascii?Q?HtU3ChB6OybE04G/BPH7bt5FfUuI24w4/8rpkvnvRcu6lwRcPR29wikAKWGy?=
 =?us-ascii?Q?u5nuSWNkvIry/JQ+iQfrIKYIS7koGeNa5AB+LozMItzf6E/Nc3srMr+Zsrwl?=
 =?us-ascii?Q?AYI6puwT+dKkSX3KNrx+KgpWRljA+3pa61sDMbl8hNnag01BLwSvqd7wNAPZ?=
 =?us-ascii?Q?QMPtvsU5/VaiOetgcAIe98Yys6lRfjlYsIq/dP2IGWurY8PWaI/9qeZPHaDA?=
 =?us-ascii?Q?HobE766Wklu7g87qRTOFmtaxE7TFHS9NGiHZhQaAOQAGReoq8oO2qwo0KEez?=
 =?us-ascii?Q?T9ZQRA8HZ1H7xWtoeccQ6XykWac+jJKHQpewkc/UQzYu5H66rm6vsAsGhjbG?=
 =?us-ascii?Q?CyKbhaHssVT/ckkZ2VC66i9ywtslD6s2yT70POn8a7lC5xyn/ul03Byt68MH?=
 =?us-ascii?Q?6SNGRiaegDJdMe46b0SFBC2fp/PGOkKCD9CHq3NkIP/SIhQxPSE9uZ/ZdIOo?=
 =?us-ascii?Q?C/1ni3Ft9tIGPNmAv0/17x4/xw04u7hFT2n6kcsN9YAPKdl+ZK6yng+Wunos?=
 =?us-ascii?Q?DvHjPdtWyZjzaUBetpufLLdA5xnP5d53y78AHQOQsS3xWN33Hcnue30rc0VV?=
 =?us-ascii?Q?1W0umJGhNC5Nz2UBMMDf0xKenk8G+njYKUzvMknkMN5Cp3xmNMjlSwkhI5wE?=
 =?us-ascii?Q?O2EPlPDXWDaa+JiOS087/MTGOg1vhSWLA/+PmyfxJltEC60tu66P4gGa24aS?=
 =?us-ascii?Q?+fPxoeFsSgbPYfhQ523dJpG5AzAMtxIRvWAvmFxOEXig1TLOoCG4JjFWyyne?=
 =?us-ascii?Q?QAlN3RSSFpSU+h3Gug73NoSjiKtNNATi1wYTLhB4zw3wIayK5ePYz/lyUGnP?=
 =?us-ascii?Q?himOpqz1ORpnGzZJRYWsq5qF5f1CmN+kr+YV5XF6C7GIiLlv+KUB7XDniSkk?=
 =?us-ascii?Q?l1pdx60z94toRlPUORch9lwHQHIHQ3SKsNBP8Fy+v+RxM5vh65niJ1E5u9sb?=
 =?us-ascii?Q?B6XI4FEAN6zBNDN/D+vMmWEt69+Dw1Xgh55AtJFFSI3of6zai3Xn1uaq04Xh?=
 =?us-ascii?Q?RufPJwkjk6DzbVFLXxwoRtUUwVwEzfZ9KQ+JcD+3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0681deb3-3a17-4300-348d-08db0da00b22
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:24.5787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClKlsxBa6tLpiw6ikzClw5w3Yke39Mx24bGH8Bd1l1f4a9PFxuPHyWMLByXLfeboZgUHSc2fmyqD+zHlzplbqg==
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

Instead of determining LCDIF output bus format and bus flags in
->atomic_enable(), do that in ->atomic_check().  This is a
preparation for the upcoming patch to check consistent bus format
and bus flags across all first downstream bridges in ->atomic_check().
New lcdif_crtc_state structure is introduced to cache bus format
and bus flags states in ->atomic_check() so that they can be read
in ->atomic_enable().

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 138 ++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e54200a9fcb9..294cecdf5439 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -30,6 +30,18 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
 
+struct lcdif_crtc_state {
+	struct drm_crtc_state	base;	/* always be the first member */
+	u32			bus_format;
+	u32			bus_flags;
+};
+
+static inline struct lcdif_crtc_state *
+to_lcdif_crtc_state(struct drm_crtc_state *s)
+{
+	return container_of(s, struct lcdif_crtc_state, base);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -385,48 +397,72 @@ static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
 	readl(lcdif->base + LCDC_V8_CTRL);
 }
 
-static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
-				     struct drm_plane_state *plane_state,
-				     struct drm_bridge_state *bridge_state,
-				     const u32 bus_format)
+static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
+				     struct drm_plane_state *plane_state)
 {
-	struct drm_device *drm = lcdif->crtc.dev;
-	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	u32 bus_flags = 0;
-
-	if (lcdif->bridge->timings)
-		bus_flags = lcdif->bridge->timings->input_bus_flags;
-	else if (bridge_state)
-		bus_flags = bridge_state->input_bus_cfg.flags;
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
+	struct drm_device *drm = crtc_state->crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
 			     (int)(clk_get_rate(lcdif->clk) / 1000));
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
-			     bus_flags);
+			     lcdif_crtc_state->bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
 	/* Mandatory eLCDIF reset as per the Reference Manual */
 	lcdif_reset_block(lcdif);
 
-	lcdif_set_formats(lcdif, plane_state, bus_format);
+	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state->bus_format);
 
-	lcdif_set_mode(lcdif, bus_flags);
+	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
 }
 
 static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
+	struct drm_device *drm = crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge = lcdif->bridge;
+	int ret;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
 		return -EINVAL;
 
-	return drm_atomic_add_affected_planes(state, crtc);
+	ret = drm_atomic_add_affected_planes(state, crtc);
+	if (ret)
+		return ret;
+
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (!bridge_state)
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
+	else
+		lcdif_crtc_state->bus_format = bridge_state->input_bus_cfg.format;
+
+	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
+		dev_warn_once(drm->dev,
+			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	}
+
+	if (bridge->timings)
+		lcdif_crtc_state->bus_flags = bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		lcdif_crtc_state->bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		lcdif_crtc_state->bus_flags = 0;
+
+	return 0;
 }
 
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -458,35 +494,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
-	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
-									    crtc->primary);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 crtc->primary);
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = lcdif->drm;
-	u32 bus_format;
 	dma_addr_t paddr;
 
-	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif->bridge);
-	if (!bridge_state)
-		bus_format = MEDIA_BUS_FMT_FIXED;
-	else
-		bus_format = bridge_state->input_bus_cfg.format;
-
-	if (bus_format == MEDIA_BUS_FMT_FIXED) {
-		dev_warn_once(drm->dev,
-			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	}
-
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
 	pm_runtime_get_sync(drm->dev);
 
-	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, bus_format);
+	lcdif_crtc_mode_set_nofb(new_crtc_state, new_plane_state);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_plane_state->fb, new_plane_state, 0);
 	if (paddr) {
 		writel(lower_32_bits(paddr),
 		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
@@ -520,6 +542,46 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void lcdif_crtc_reset(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *state;
+
+	if (crtc->state)
+		__drm_atomic_helper_crtc_destroy_state(crtc->state);
+
+	kfree(to_lcdif_crtc_state(crtc->state));
+	crtc->state = NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
+static struct drm_crtc_state *
+lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *old = to_lcdif_crtc_state(crtc->state);
+	struct lcdif_crtc_state *new;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new->base);
+
+	new->bus_format = old->bus_format;
+	new->bus_flags = old->bus_flags;
+
+	return &new->base;
+}
+
+static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_lcdif_crtc_state(state));
+}
+
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
@@ -548,12 +610,12 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
 };
 
 static const struct drm_crtc_funcs lcdif_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = lcdif_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = lcdif_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = lcdif_crtc_atomic_destroy_state,
 	.enable_vblank = lcdif_crtc_enable_vblank,
 	.disable_vblank = lcdif_crtc_disable_vblank,
 };
-- 
2.37.1

