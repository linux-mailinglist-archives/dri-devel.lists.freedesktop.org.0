Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3767AA6E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BA010E729;
	Wed, 25 Jan 2023 06:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5487D10E729
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOLB60jwc2r29QsbBhI/UsDd7jXR5c0BHH9UBKpBCo+/kms6HbeygeNFhbUgFl95+sV31Xrw5ekoqbywBCG6fIhsmr1hoHUIfdE4oegfD+4RDRmgsuhRahzaHnDvBD+b+cJ3ODsMB7SUEQV4uyhdEtwC1+KRHlHbpU5VUgiM6xZyZRfq+/MKfCsoYdUsEd9nZd0lvlOOmU0TQlJb2PxptTdNzmop9PCTktvOwd+LLWnZ2siSIT/yrWDWQw2uT73NKAbQ4FJB19U7a8VWUuvILSbeTEw94V5B5uRakn6BL1SELFk04bw9cp2J54O6ZlPIIG/pwmTU95mGHHkS4v9DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc9V8G49HPpNQ8UEEEuGJqfy9TrPBgIBZTZirppoHaw=;
 b=aB4+FAqqDK4A7zygK6leGGkrepJ6Nip99g9LgZ93TelEuoQL8uFULvPuX8Ybhl1XVwGswnGCr4QwLC9jyIBSsSrPzYJgLHP4wgDcoVl1PR3VICrk17xJVq8129ta5ES59X/z7BzAaIo6kOxjr4yZYWNDjCIBgIduYvjpfj8QksSh+vTUfDzGiGAiQoySZqC7kGsk3EleboPbjQfMr8pfgQZSDGS9fWwdzBuMwkk5fgamoktKTvP3aObM1HIy+8jRqYnb9JSRMnjq6kb9CAtxMc+jcosoBrny2l+CbNCfnkayH+RQZZkEjXGOvNumej/LQvKVeTvtLODTxNNfgaJ+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc9V8G49HPpNQ8UEEEuGJqfy9TrPBgIBZTZirppoHaw=;
 b=SM5tOGjvaFxW8HgudVYTO9bDc9snn5y1UH2OcodRfTiNb7nNruYPWRkYEjnWBZ3d6ckVPBcHD9xrLgitLd1BRmZtscaE1IuUDY+sA5KaQ/WFoh0dUPbffZLqHBcUuQPeIJvq1cNuatv5oeewI3xiLgk6g/bYPiwvbtYUSVmuJ1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Wed, 25 Jan 2023 14:40:27 +0800
Message-Id: <20230125064030.1222121-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230125064030.1222121-1-victor.liu@nxp.com>
References: <20230125064030.1222121-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: b029bf80-d0de-44ba-48fd-08dafe9eeccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YdZDGJLFvHJ+lCo6ujJzhmCYK5qnmqMWfjLscN6ITI7jCTg9MF8kAXzQ/a256I6pzZt25UURbamAHBCY3KJJt6do9tKJyW9V5qJBcHh1bq/Rn8l0ZlgKtiR/dKf1nnZpoZ17FBmmfcL/vt7NC4Ok904afoJrIOCNRldnKeTsIJt9TJjRoBymfpqWyGIflQH33yvorAAST1PH5evgyE24+gDlES+Y/1XAt9jCBuTMNuL9vxUayi0RPxPjHZlDqZchwxAAkVg+/WJhhHUzXCSU0mMcQ7ANT3H9W93HwhDutuF0veSfPtNf+bVanlKhFlHSGhUOFMWFFORfCSTnyHOv/ymeCrpV/xN+9lL9aRSW81cNZohhh2Fa0xcr7pq4iv+QnE5mYIGlHn46SBS19fi7BZ6Sj10CocqaB/EeSD1T2CT/c0dP4rx+rZWUjMM9D3ucy+UXMk3glvKqbdKb06tdM9UNwo6uUUGo0Es7oG+iwp/KdMhO/bqWvZ+6Fe7zNIXgYZd5cyUOetPXOnrX2wVB1s/gy6nf27pDOfapKrWaFBdOVd349E+7lvK1eQVNBSkvw0RhJCofsg5dko451d84hwLqhGPv+rOr3qTgoQYI46y2c19x6Uwxk5R1oF3w5pkkYUQyZV1jK2CXA1WHGL2hGwq7kUfCczbw+TE9X7WRA0B6sYWVDfDXHSeQrXvf8AwmfFGjAgl1cZM+uuzfxmJvXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(6666004)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bTDnXg+cCnr/s5vChZP408wjXaWvfzumJSVLbJ0pP0BxVSqtm+MDSbeIvudd?=
 =?us-ascii?Q?6wSbhRzsv5jmtGf4QhVOwii0EDHxSlLyzVXxVYmP/mBhIZyH9KCUsmolisk9?=
 =?us-ascii?Q?gemgMNWSoEeQwrQa+gOIJ16EgYukXT4mdwc+0Gy1stFzaTGOh4EpbFx0hy75?=
 =?us-ascii?Q?iZk/zGnbmAc1VvmpltwtIH5AU71gHHHoJr8JTXUH0eU2HO5uKCaNzfAKw//z?=
 =?us-ascii?Q?k3W9s0iMq1hL5S4f9q0N9Let4rGRJ7UJzIR8LAL1cU527jA6TA9pymRUYNef?=
 =?us-ascii?Q?aypW4261PbpHc4D05sILrD1PIgxPLUstQDVOciw+BkzcYrccLzp8LJM3bJiq?=
 =?us-ascii?Q?7ZmzV5j6qsOlfDJ0hg4PXt61mlXs/Han7xdp1M1m8lrScuHnOUnxST1515bG?=
 =?us-ascii?Q?HllhW83hYGaTDwhsGocZXUmPpJcdG9yiq3wOoS72Rvs33rnLFDz0F8DojF6S?=
 =?us-ascii?Q?K3nHVtYXO5aFvMps/o61gt06mkqhmCMzqt2vcfR2xzn0z4PiL3JTUBt5vbpl?=
 =?us-ascii?Q?UbBb4v0ODIyXxnDzhP8fpyYZhSO729IXkEbyLiPC3uivnKAddgfqR2o53fc0?=
 =?us-ascii?Q?/9R7yre4Fa4vnQ5IV7tHlOTDQrHbqJ2WlIsW/rrOaWw2ftOdhPk2wwvqMPil?=
 =?us-ascii?Q?UWd2CS97AIXhV+M5fn9aMlsJYlrnet/Hp8uwu8VtHpT4BNpliNWTPb/GAtyh?=
 =?us-ascii?Q?Z5ioDC6S2qF/4ZQZwd6C1Fd2/KiuJBNPVik8IJixCAhZ/LGuJGZJDT6L7IZN?=
 =?us-ascii?Q?HRnAVHL5IL9/iFawSKyMdkCe0n2lGFmI4/xnHR6adIeJPeKSyWpHbAnKvJ3F?=
 =?us-ascii?Q?Bmh2lF6vsHFhKgaEvIDnIT85hXl4exouOYQSmTIS7Q102BHZQBabMvN0mYX8?=
 =?us-ascii?Q?H77Pnw2H7XgZe9+buR+G697aahwXCkK1jech/I98tjIAjNU/1ndB5ZiTiRkY?=
 =?us-ascii?Q?S5m9j74N5JH/WWfMNQOe9AV5LOsCBWClJz/Mui8VSBCus+8NLTj8Msyl6KKi?=
 =?us-ascii?Q?yznrcwuSh8QFph7kmEAHextCNjrFHLQyhm9mvw6LKSj2Qj8VErnFONwJgDY+?=
 =?us-ascii?Q?93gqvi3uhp3QtTJnMmdjoCJq8oTCExmioDYuMDXnjUU3diKllXg40H1swwid?=
 =?us-ascii?Q?lDJJPq5RgFW2UM40/WGRDDTS8Tz6iLtPHQnXeBsVNouKFrndCKPVwX5odank?=
 =?us-ascii?Q?YsBC17q1Q41SfhzN7npWvYzCJeMbXfAOzmn11FYbZcZ2/9mSjqTBfoP/J2ee?=
 =?us-ascii?Q?wKWJKrts+z2JYsb9ePqtw5ZV+K+wbF0L3Wi3tm0OcfKGAgTGtbb+g20bGKwV?=
 =?us-ascii?Q?Jl8gAK3S0Zz6iPCZvgJmYKnKF+2LJ42aPFFLU+4w5AsfEgCp4Cwt9h/PdbOP?=
 =?us-ascii?Q?ylWoMlI2tsyhFY5J5Dr0tx0O6ieccexRBOZ++zFzNNexNLDEBfDeY+u9I4lN?=
 =?us-ascii?Q?S0C4pSAjeEM4aQbxuGnfceFzA0wbvm79rVoKoZbFBJsIAT0D1peAxyIJwSJm?=
 =?us-ascii?Q?Yu+E4hP5n3uMxhinwJ9h1ediG7gQLrEZIWzqGl8hg+lDKeN9JGsatGAABjwi?=
 =?us-ascii?Q?z724HkHuP/pMsmKiw9tZlNJQQio2aOcgmbijbyRT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b029bf80-d0de-44ba-48fd-08dafe9eeccd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:35.9073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muZmP3CcwnkaOYmGe1j38jKZBpr4exMwkw314EG7eqckEkh2jqTO/ELgb9/piQ9R/PX0+7WSqEoVK7KoqoImrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
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

