Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277456F9F44
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A595F10E0B6;
	Mon,  8 May 2023 05:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280C010E0A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOqmslMGLcorGiwGcQT4PVP1uPlq1P9aLeAPSRMei8gie1wxlMj3YW3op2RKNN1g5fBXjKD1ANw9ok6mVIy6DrJyBvdYoIxKD2Bfe44+RrGEkcDbP+i1AVCcAt22O+j9tk2OMndbdM5wrrH/hskfbchpvmORAk3pXPNXERyivYuq6RHLe2pf8CXr1fYt7G1EJNjBzx4HK558VTdAnO6N3qvk46cdaO+veFENxF03YXGBOnNY3yDoGVGilv8zPN9wgDjn2wD65jA/kFTvAyOA4V0KmBKh4Jw7ktorcVbMboO4qhTs8Kn2+rcX9XfRjaXAzgOf0JeVkX/FErZPHF/yHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uDYhMYiKSeTrtovzlXlM/aPxP4hsbKM+VTiwZbdzOo=;
 b=gotLGXROZU/Zc889YgCq+gViRONBw5WmTdGhrLrVj8Z4rv6weXHYrmYj1NSTal+3lbHrodc9ovxc03+A7FDHu1pWSnn0KA6nxYdhrvfdFZ0kp+uRL/8XRvd3SlvDMG/GFM0iSd+St+zgVk9XvUe4vNQM9ZZ1p12jh3i6uqvwtgzWMX2KjkPUDRfXSrwju9ueiLD3+ut11vUVOfEFT/hUXDkpvv5AxkvmGx5TqNGRwfy2pI9EJFBzsI8Ck6/0nVtBDuZsZLInKcWl0TClns+lzRIvE9fgZCbg3Xx/VllLL+ImkSVReV+ezzpgZz10XZDGpYTK1HOvymFOP3YZQdYJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uDYhMYiKSeTrtovzlXlM/aPxP4hsbKM+VTiwZbdzOo=;
 b=MLjDQ1vaD5VzBK+7+OPeLOWsmsWDTCwTA3PDk11utvwET/lQFQ54d42oIb0qr7fzWrqgT77aj4agzCkm72OA6AHoKAU64WqjSVvZAHF9mIe+YjFd62GDg5NNdFeP4qQXONeh2D4blm2vp57qI50CjbxKDoRiKjsw7r8JcsS6seA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Mon,  8 May 2023 13:57:37 +0800
Message-Id: <20230508055740.635256-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508055740.635256-1-victor.liu@nxp.com>
References: <20230508055740.635256-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: eecf5ab4-c0c7-46cc-f313-08db4f8888b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfgB+PGT3Bq+PAeAY7YPJgR+58kTftqfi4R4sQk+SYi7/V7vmTZmLc0CEuKQ5In5CuAVDHRv2+Sptk2dqhq80lk5yG8lJB7pHer0f3RXlE5Lhr7xYOlK6YAhX3Felo/FobAMrIl48iK/4+FMzLhtPb+s3wKHZnShc1AuZtaO+p2ohwDBs8fNFYGgbcIFOuJGYlMOKtdmuDVM5Tj3Bu4kc+lMoMdGPWuQNrGtPMrgQRa01nO8k2ikAB3OdZCQkaCE24lyawDmkfYRRKeDejTmaLST2WO4wjjLkXQ+GLRbvNvDy8wXifNxX2hds81qz9OT2zcf/ml624Ey6eMsyMBRZmJd9i07fEvK4CnPIrNeDxaNr25H80LQS5cjQgyK5Nrxp2+Jso7f75Is0ou8PZIbrHDUpS11zTPJzz2/qchQI0ZcTwMu/Mw7wNrZZZ0cQU2BFMDhWUcfJJTJP1Tc299OSRlSJPZAV9JedTEHclCL6Jji5tXtqn0BPDwvNDqpqAbsB7BLwphq0oqKJxZX2nOuM4Cdvv5cCMsbVE3eUX82SQuZN89znRck8dpCeDPAowFmoHiCuNk4drgwogWxjDvS4XyXR8Fv5C2AxZOht6RC9B0Okfyn9j9pHm84JA5IcElj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(6666004)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PWUXLrTBCoiya4GEIpzY8P1v1BsekN/AUz66tb8lSJoYtexOUGbX/DIRTP/v?=
 =?us-ascii?Q?xFBpfVrXcSlLhRNdyuW9KWZmJUZURcTYPwgzdEv4yYbk8i80ayXc4HQTmZvI?=
 =?us-ascii?Q?wUig/GHd9LcoWb0IdY7zNYylYiozlO8EnoSJqMj03xyGtTqfoMC0wvQCobHR?=
 =?us-ascii?Q?8IPTZIQH3AnOLPXF+JAjBrL0CARUxYyiMXEGBJ1t0ubB9K2oMxlRCiK31xyj?=
 =?us-ascii?Q?2mmyEv+ABU+dgrV52ctJ1o5OfG5Ei/Dt9hwoE7F0+A7CoYABR0XY0daLofkS?=
 =?us-ascii?Q?EE43DKeCYfu/OaUMqPWf2crisfwEcMTC0h6AImtex/LVcLUSEI/aS+Rvk54R?=
 =?us-ascii?Q?8nH1+A/YsZNkHgqZ30KTRqulB3ZaWyCQEbWOWiJ+kXrJKiFUxVf3U/dvGktZ?=
 =?us-ascii?Q?vU+BautAH84ec4UoasXkbRfqfGob0eyEFuYLc4885m9RzVF0R7ZCx5JX4Ucr?=
 =?us-ascii?Q?hQ0Cz0liA4fgvZyViV9QgfsnoSV62XaNCvTwBIlMTACzw20C619f/oQcY82S?=
 =?us-ascii?Q?Xl41Fd8C1EgHVHFMCun/4ZVNnxNJkrn+anHcEZrbl/6evdfQ/c1LZwU2/SQ1?=
 =?us-ascii?Q?pGfsDpJMV7QJ6yq3BYrr3TusWf0WPJn5ekBi8q8vx8pZLb/Rd9fbK1Eft2MR?=
 =?us-ascii?Q?rf56LOYldBgV1udZFRbs06o7JrrE9d9dYAY7Gw56JVuJtCnxMdFu5fZIDF6n?=
 =?us-ascii?Q?rd4+XHdkyUbD99rFIF7GrD9H+Wa4P0nOXw3ys0VzbEWnKOiJrFEJ6NAETCYC?=
 =?us-ascii?Q?V7ADz9it2hhh1zRJHXKtWlhQGKp1tNn76bcnAHXZSMxt/RYdRf723pcdBp9M?=
 =?us-ascii?Q?S7LbtJ/cQUoF00KdgGgYw4CvHKvwJVvzC7R1iDJ3Kp/E3GID8nr1F6U5fotz?=
 =?us-ascii?Q?jUBy3TsdHK+PfBo0vccIxe14IAFrE0/Ta/7XKzH+EhqzC8xPUENZZr6v3zqn?=
 =?us-ascii?Q?xAA3XNteNm6DJBKYBX5wozJyk3F2Obee/s2aDt67AlLyVjwwGOd2bQiPAbjt?=
 =?us-ascii?Q?+KmNaI1VDqJQgOZAiO0N57ZfyXjB5nskJdgo3jk7MZhvc7loYivFXC88gQJI?=
 =?us-ascii?Q?ptzIAsIw7JVl7kvH9yr8b7hHbvG6D5qdxtvzB/Wy4d1N4pyBHF3VRGHb6Cul?=
 =?us-ascii?Q?b4R4GvxsrGQ8OLnOQNGJylTdyPrsMOCRp9GsAqvHsQb5Nl7PeWGqRXnaXcY8?=
 =?us-ascii?Q?vDLNwEi/VJ5ek7KK3s7/0IkDwreSMZfxmJ8COJp05P0lRhnbpz13uuAYXlxs?=
 =?us-ascii?Q?acXLi//kIOLPHnh0aXeNvsYLvNrB+P3ihmPPf5xksZMJe5FEWYF6ENrHgXTW?=
 =?us-ascii?Q?iWBQEud8FKDxNZ0YWy4wju84frqDKjcVPcsJ1DemebYhNUGORya9w9zht/ro?=
 =?us-ascii?Q?DpCMl4vZlj/xMGaOACAhwyfmE2pmEmaxbHc2+efFk5SpEN9kT4fjhn0ytcv1?=
 =?us-ascii?Q?oypEiBx+qwkeyGqMcBbHJNLCJoqmdlO5hu76B14o50dM3aACPM0dr/FMeHlV?=
 =?us-ascii?Q?TdhUgVSkG2Gl1Skmeay7NwwCbij9ALsbEAbF1bFNcjLGuRstaphjtvt0YJRB?=
 =?us-ascii?Q?qYWHSha13tv0jfndhsJwgcoOUr535250YPFS1X1F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eecf5ab4-c0c7-46cc-f313-08db4f8888b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:23.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2FNOEeTbJmUQyqL/SQimGqX8y04LTHvCUKrdCqVtSOl+dpkeEoaWJxFweMVry6+nANiFQAK8bpHEllrELmJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of determining LCDIF output bus format and bus flags in
->atomic_enable(), do that in ->atomic_check().  This is a
preparation for the upcoming patch to check consistent bus format
and bus flags across all first downstream bridges in ->atomic_check().
New lcdif_crtc_state structure is introduced to cache bus format
and bus flags states in ->atomic_check() so that they can be read
in ->atomic_enable().

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* Add Alexander's R-b and T-b tags.

v3->v4:
* Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state'. (Alexander)
* Simplify lcdif_crtc_reset() by calling lcdif_crtc_atomic_destroy_state().
  (Alexander)
* Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state(). (Alexander)

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 134 ++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e54200a9fcb9..d46de433cd8e 100644
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
@@ -458,32 +494,18 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct drm_crtc_state *new_cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
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
+	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
@@ -520,6 +542,48 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_lcdif_crtc_state(state));
+}
+
+static void lcdif_crtc_reset(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *state;
+
+	if (crtc->state)
+		lcdif_crtc_atomic_destroy_state(crtc, crtc->state);
+
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
+	if (WARN_ON(!crtc->state))
+		return NULL;
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
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
@@ -548,12 +612,12 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
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

