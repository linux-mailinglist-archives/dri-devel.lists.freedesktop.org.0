Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B869400E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0A310E4DF;
	Mon, 13 Feb 2023 08:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E03710E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCAnVHn6k94fvQ3X8X0AkW6mTe+/DY5sLO08M+YoubwPGYnj8DnvM9LWUc0c1n0RTTW5RhjWFxhXAkzkAeRLKVAX+INL6xgcYRIaq7OXK4fELAJOgaKq888z616gHXvvPnlvVZYLL+3hT3uOzbCC/VEv72Gc90lXFBhoNq1d1nwKTn1WQe2iPKuE2Qm1ZlsYaQyJu+X1Y5vt+5ZHrPcWd5fZjSPQszWwSFOnUyXb29/0dSoKDjgTuD/IVVhcj+XP3gqvAkfsxTHNSu1CVU1TC2fHsnEpwFK8IePpGnnvfWrZS1pvtbJdSn/up+s8RQ6xUB8FJ2CEUD7ldZmpDGs09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLz1nghvDdeU8XX4c8mS1zhXYI5HBw4HFppFon0xTiY=;
 b=E4insgQn6eHOTw9Z300gPizT5MUGHZcPjFoXB8cJB7pFRmHI7rCknPSeV2PdfvIdKN6xHZnSAOKaGLVBdF2P6RkgNBTVsiAzgvB6ytl/cNv1GTkqCgAmkHVvlWsyPwCO70pDfS0hn5oeXZ3YdwiCuucMlrp15wrt5UyaZ0O/6OK8iZhMLaHYz2vnxjG6NvS2ZrToquybsI50O+xDFVJ0yIRz5jgKFqeG0Uyy/f//Xl8dSowx5xBNpGXQ8g9nGkXDwI6ut9NZg+5km9cs84sEIqpyhAwSMpjJI/JcTsv+sacLbgwKCSoFKnDdusaSEY4TcVzJN3llLeQDT4FhCzJsAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLz1nghvDdeU8XX4c8mS1zhXYI5HBw4HFppFon0xTiY=;
 b=oEtHM8Iyy9KaitMs0nXzcu1znDjBbRmYAGd9fhVtuLEYqAQUis6CQYil53fr4m1+lmLsrSyFTwU8A73XoWqhvEqqqNGscvpPQQojjxKAe+kkCSlbkml5TCRI19aosOt1TKNZLVLwqMTdlZMHcmvLRGqzY/V/lB4+C+nU6JmQLJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Mon, 13 Feb 2023 16:56:10 +0800
Message-Id: <20230213085612.1026538-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4fc3dd94-8fcc-4d32-3ea0-08db0da00f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhmHmGbvOEHgFL2T1c3czTMnnNwkSWa9C6RsxRXcABkWXfabj8dG2S5XYt2/oQsWkA1eQ41/juv4oIC96mpVU8T+UM0XahOcKW31GFlH07wt4GuXVqSf3zCgQC+UB+e9JZytzdGiKjTz8zDowtlgmdcL7/ASfKRSxR25Z02x3oqxYK2jHJFixW+CGXkoi+4MupF4s+XtvENIERlZ9ZZkSzefC/ta/rFADTnarzVAVdC8gfl3wuHoRfgUFva8puuCOwJfYdAD91MWQUeC8mrjQk5+kHJCNd9WnTSO2hxi93QFs2d47cU7u8spIZSA+PswMRjdVv5LwOVKahAXLvrglByPUV3NqA8OICyHzTfeZknWZrIJFcOZtQd3o6/F2NLTS/xEPJWMEbmGUFsef8wh8tdX0YJe0VW4mUG1dRjajtmrX+OslsI261escMgcWhKu1ahOgSpTljVTotMVJmEYJIy9DRXkH64vw2O+Lx4kdxcbBZ8HFF7o4UrTyLyA+au+PC3fqt0CjImqEpyrNmCbJ0/6tGZRczkYpEtJIibEayCel92hxNAkJnMpn/hHgMY/EUm7vOkY7or2w8nmM3PrZEQD1FRGqXopbn7yqmcl9TC+ueBNZDzo2ER9/weaYBKANN/hrZ1YFtnI36y2UpH4NzkJ/ylkIW38OV2WpkIFYt3/hg60yBhxjBOAjUQ6SCyle6VNP0LFyZygZMKvC8m8Cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(4326008)(8676002)(1076003)(66946007)(316002)(86362001)(36756003)(2616005)(186003)(83380400001)(6512007)(6506007)(38350700002)(38100700002)(26005)(66476007)(7416002)(6666004)(478600001)(6486002)(52116002)(41300700001)(2906002)(66556008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uHKPTBaqBqksCDI19n4TKMlvar9Hgz7XtHzsKbEhYbhSp9KO32UItG/dYfjG?=
 =?us-ascii?Q?ycXofSPdjErZfNYQk9IjzKMYYYuFYR3j9mSdh79Z+ik2H+egck/pAd9qkRxc?=
 =?us-ascii?Q?DS3tKl81hKsClTj/tbyGq+XjU+2KcrQ58g8K9sP/zXrEMVBYI6lAyF727rgC?=
 =?us-ascii?Q?KFhCQVvM67eZxpWaypMai0BHtQ/h4TRwCP5RKFvKvs/Sc5pzV9DHGgxTixVw?=
 =?us-ascii?Q?RzmsYJD+l98S3ctMVwE8XcdHbat5XqiqjvkMONF3PqeqKkhbCyT6TzGDkQAS?=
 =?us-ascii?Q?2I/StiYNHi0Vt4ygnwNGrki0sK6YwtxaqxCYd4Uv2+7e3+WyHCA0YcsFM1+Z?=
 =?us-ascii?Q?xi96dlooq+BbO31N7rYw0Hcvej0ACGFNbDXQOA5eLWA+kr+WwkjSTDufkGrT?=
 =?us-ascii?Q?tRHhjmeOnPv+C288A5sIz6ZIKqLDfDqqtvb13eB3fqA/U8SnHyuzn1XEAaLh?=
 =?us-ascii?Q?6l4o+ZJ3zrT/jNUeVPAuv/uVv1ZFW4d+GJA9nCYu4suTPzHmMADrLs3q3enP?=
 =?us-ascii?Q?GN7kSs7oVqoiaUuRgovwXaHoSzew89kFY5iGF3kAd8zOyNDB5KiJwCAh5BFC?=
 =?us-ascii?Q?mjmGOwbjovOLPeqU498PxA6yt6nSF/LvQ85FqorSo/mZGtMlSHa3kY4qMsCh?=
 =?us-ascii?Q?v5r7sOIS7PSioe7JtNOLc0Fc8Hh34SEmJF79C7VuihsN5nPx2kPHW4WlnEgZ?=
 =?us-ascii?Q?eUiVz86M47FaubIUdO9FbUqQbvjQiSHVtKVodEpE1KgLct08AjRzenCOh/2W?=
 =?us-ascii?Q?zY59eOgNYYdQQClD9uFv4RtSTt3yveHsc+8576110LHUm5enY/hk76vGD4zA?=
 =?us-ascii?Q?ReNLNiaxtI1yCo/YHcKwoj2EvnrKBeT7vooguX4r8uy/xgkMjjXF70euqa2o?=
 =?us-ascii?Q?/kEmfNDe9JfkKRlHstD0xysZ3K+7encPxhvmjbCmQS8aD8F1+zGqm26KIGSb?=
 =?us-ascii?Q?iSsnIYquGXKF3BPfQuFWumQwYVzpG2GHIiDN/eXLNuuuQWGRTaeZQdn/gUgj?=
 =?us-ascii?Q?Boh/oTqb48sVl3VXBKb5x2B0h2L8FtnbQjKbMFfw1wYe5cT+YzrcWsEbtZJD?=
 =?us-ascii?Q?0YA12FrAfB7cenLUljgk6yPgRLYLxUmDk15Hg56HjOvUkvROAN+oqO68loM2?=
 =?us-ascii?Q?K114U9B0mlD3h8lRHTCl5xL0rzkoZYa6wHXZdjkyCZVn7+LcfsXVqMLW/R9u?=
 =?us-ascii?Q?rj/Hi6pgO9x2KubW+1SjN8wDbq+cF8x/xiy2SqaCxHUdUcfUBKIrEjvN+6xU?=
 =?us-ascii?Q?52XyusnNnVGg+5QjQ/OcBbn2GSIg9GXR35PQbROhSRKlQp4+kO8X8Z9kKSUz?=
 =?us-ascii?Q?EBYuqHitfhxLXwHvTXbpPQLsqgzYH+L2a02TcEgs4wAiteLBzl/hxb+p1p7o?=
 =?us-ascii?Q?eQJIQZF5WwYTzZsMZ4YTCtcSkNj699OrzHPEoJmF8wTHkfzPTi1R07VOp4xV?=
 =?us-ascii?Q?rSxAcQ5a6BaFstqNSIoc+wswZqYuAYFWdw0yZ7GeXt6sX5PUvXn43Sw1s8pH?=
 =?us-ascii?Q?qMj1lsaO0f98BO4AzsSlmZytj/HBg84I/X5Sc7Gwm6tbkvlaKIOVGRdMDRi8?=
 =?us-ascii?Q?VP2+/Ls140yZmqoWCU8q3rioaRiHzWnLidRx1iCX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc3dd94-8fcc-4d32-3ea0-08db0da00f37
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:30.5670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEb6K5FhNL9y3TUj9o3Cgzb39TPFsH2hVtqhpVlTE1vdqWlBJpKLBj2bKehcoqghqGaV8lHytDXC8nb6A+Tlyg==
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

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Check bus format and flags across first bridges in
->atomic_check() to ensure they are consistent.  This is a preparation
for adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Drop a comment about bridge input bus format from lcdif_crtc_atomic_check().

 drivers/gpu/drm/mxsfb/lcdif_drv.c |  2 -
 drivers/gpu/drm/mxsfb/lcdif_drv.h |  1 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 76 ++++++++++++++++++++++---------
 3 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index cc2ceb301b96..b5b9a8e273c6 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -52,8 +52,6 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	lcdif->bridge = bridge;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
index 6cdba6e20c02..aa6d099a1897 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -31,7 +31,6 @@ struct lcdif_drm_private {
 	} planes;
 	struct drm_crtc			crtc;
 	struct drm_encoder		encoder;
-	struct drm_bridge		*bridge;
 };
 
 static inline struct lcdif_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 294cecdf5439..4ea3d2b2cf61 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_color_mgmt.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -424,15 +425,19 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct drm_device *drm = crtc->dev;
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_connector_state *connector_state;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
 	struct drm_bridge_state *bridge_state;
-	struct drm_bridge *bridge = lcdif->bridge;
-	int ret;
+	struct drm_bridge *bridge;
+	u32 bus_format, bus_flags;
+	bool format_set = false, flags_set = false;
+	int ret, i;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
@@ -442,26 +447,55 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
-	if (!bridge_state)
-		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
-	else
-		lcdif_crtc_state->bus_format = bridge_state->input_bus_cfg.format;
-
-	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
-		dev_warn_once(drm->dev,
-			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* Try to find consistent bus format and flags across first bridges. */
+	for_each_new_connector_in_state(state, connector, connector_state, i) {
+		if (!connector_state->crtc)
+			continue;
+
+		encoder = connector_state->best_encoder;
+
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (!bridge)
+			continue;
+
+		bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+		if (!bridge_state)
+			bus_format = MEDIA_BUS_FMT_FIXED;
+		else
+			bus_format = bridge_state->input_bus_cfg.format;
+
+		if (bus_format == MEDIA_BUS_FMT_FIXED) {
+			dev_warn(drm->dev,
+				 "[ENCODER:%d:%s]'s bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+				 "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n",
+				 encoder->base.id, encoder->name);
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+
+		if (!format_set) {
+			lcdif_crtc_state->bus_format = bus_format;
+			format_set = true;
+		} else if (lcdif_crtc_state->bus_format != bus_format) {
+			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus format\n");
+			return -EINVAL;
+		}
+
+		if (bridge->timings)
+			bus_flags = bridge->timings->input_bus_flags;
+		else if (bridge_state)
+			bus_flags = bridge_state->input_bus_cfg.flags;
+		else
+			bus_flags = 0;
+
+		if (!flags_set) {
+			lcdif_crtc_state->bus_flags = bus_flags;
+			flags_set = true;
+		} else if (lcdif_crtc_state->bus_flags != bus_flags) {
+			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent bus flags\n");
+			return -EINVAL;
+		}
 	}
 
-	if (bridge->timings)
-		lcdif_crtc_state->bus_flags = bridge->timings->input_bus_flags;
-	else if (bridge_state)
-		lcdif_crtc_state->bus_flags = bridge_state->input_bus_cfg.flags;
-	else
-		lcdif_crtc_state->bus_flags = 0;
-
 	return 0;
 }
 
-- 
2.37.1

