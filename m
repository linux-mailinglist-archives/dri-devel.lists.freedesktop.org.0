Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B567AA71
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6203010E72A;
	Wed, 25 Jan 2023 06:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DEB10E727
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mquCdv2phPvTbt4otGFYy6Xe1mnRjRbiIQPxD257xkM8JIXiHVsnnmZXLzp5PaUioWhj/1VZpwQDAVEOsjnH6JDSPmaKLcLBW/EpfPpHEzZyGminEJzZWvlr12OG4u7KlJau1bhYfPJY9hgSZyHLoJBiQCf0WkKz+UED2c2gJhcUwK63XoI0GLllko+7pHBvndDRVbyL0AYQjrvroComg025SmV0WBLfbvJIgzhtE7UldkkfpxVfHeX4YAFWo2EGdp9mVjpinrLw/lmTIVQS6Lh06YQRP6zN7Iml2kugXou1fmTSsE89iYZ/i10dNSjbXY45KrHPPa0jxfJaLcVlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4KpjDAKpcyfTxfU+kwq99MhSKRDzG7SBeZbAwQR2wo=;
 b=KVYyPqmep1M2DraXVp0lmOmJYP0Fyhnjy1Sq1J33wokP3BL4QFVx4L38FTDzr3vKg5k1PZfgeSRsOnKCMalchHKv3Vi6zLD5G0xuh6dwWussp3QxLNGAXs3XB7AhgiloSMd1H2NOcAcvOwKmMDArok+JIdQWsMu/3uPxAkYSTfTiMu6tiXenzgf0K8fZBIPR/iJKTjiG7F19yp5HraGniSQQ9ztqSpNWG7GHoLOxAZzH4eHBH55lFoTSgesDe20pDBVjOScuZbYHp9C3B/rPwz91zHhlom0i7/R9z5XLpPyk45140Tgq1+isgnZMH6qCK4JgxnLhqg4KJO/6qzluLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4KpjDAKpcyfTxfU+kwq99MhSKRDzG7SBeZbAwQR2wo=;
 b=ZloBV6W6Vl5AE9+BQd4t/aoRiQVW7f8Jw9lAI44pJPFRz8KXt7LSpkU4aLMopkxk/x+wiQE2URlJMM7M/Wh2xPrQM4p2q5DufsyC9l743983Vri+5Ls2uXKerWUHRLAGVmuxDnvXfpboy2MHkkKsDDApgx4j6VwOY39ROx2ej60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Wed, 25 Jan 2023 14:40:28 +0800
Message-Id: <20230125064030.1222121-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ec461c5-0760-47f9-0883-08dafe9eefc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +GOae8EvoESq9wq7Ciy0670r4dvlzHjqXs5TH7OltSrrefhNP2PfuZx/yPTEthV4LDalKlPfl6Xc2opqjsuYdkSLaVmhDGxEMyjMkHqKg/i9Op8Nieia1yr/rfiVcExTXtVkL/SUwlwIkszInmAzL/a1LmvfXrNcHVF2e2rV96FBVKezT1Ig7vJFPA+oG/l3FW8LtXuPPOP/0qCeVSv1jEAfnvHlBfbM4miSf8rW+HOF1odBpTsxDV5JOm0OPyuRLp6n859nP1AqOOOaGotuG7XWAjzeWC27oq2f3guut0H1MqGHlK6I3nnYTI4pyyS1Cpb+ER/oh1gVh1czYvx5jDvwcpXtLc43tAlzqdfRd8LXCQD8hwJutJyGcLZSqWfP9AjWiR37vMxYhcDzzbpIDdxSaT8/U02SE4g1aJlXYLky4Bsg38B0iy+8jDO1KUIktwtvynlbZPqtIWkDo5DMk/FZbl2D+c8NFUYJF76F9frW1IX9Hao+pkJlCwKs9/vsLLj7YWyeturgTDnOf2jZTMVQ7VtFyJA7BVeYc0pGYUFIpjd0f+7Z32pIDQQ8PGLdcNw1YhMIpx8ubF+IoGYkCfQhLwjKt2cmhOxgalwu5+LFFMKW8FQ+JnmjcWXTonlXL+qGRVQh+qfXhsKRaQPJ6IHnaAhttucKOVZlzR4BGHcc+rKpSkkZVDeeKdfhtE0jf1iYtZNw+NYQfQwkcqS08w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(6666004)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0QXiuIHKYFVVnhBhSZ/5VHn8Aku71Y+mfc4DQp95WVEXnvdWrXZGR4mAYPB+?=
 =?us-ascii?Q?gBI5qiz2h0MlOjqAsM7A/VqkrY79bgRGDXCel+q3wHWR5pkcoAtWR327YiVc?=
 =?us-ascii?Q?e0ZWlQG3atFBLamXUuLeJcsFepjWLvlW7yCTbSBk/CMweledPOYp6cJX8TF5?=
 =?us-ascii?Q?N395iYDTfQG29fuj5kOo+1SmSE8GQZf0gqVMRYfE3/b35yPrw+4uSoHUKCT4?=
 =?us-ascii?Q?NDnnb2DrQvYz0SCvPwPydEN18RhdsF11Qu55lD/ilX65HHx/Pp/OO5fICbS7?=
 =?us-ascii?Q?SgLYY3dkcW0Xsp5mFyzhTJteoFvhY0ZRIvG4yHDpHCzgDiga/x5o/TiPAFMv?=
 =?us-ascii?Q?jTCy+rKHsxYFzTyoB1emBitrHDMlKE5gG5M782ke7xf7t2Hycwxn+OvbeGzZ?=
 =?us-ascii?Q?X2gMXkovSjqTs4jmr7H1eyyNHf82oQi/LnNpKh8Na98ZOB1ilk/c2Xc+kiiE?=
 =?us-ascii?Q?ks4+hdD2JX6z/Yupa46ocyPV2W4Cf/oPF4zXQj3JWUpFwz19FomcA5BCI+Z/?=
 =?us-ascii?Q?1yHU8YiCYUO/onEvCdCgnEtagGKuqpd09tMqQl09mpkuYGK0jTLwrR+YcpNG?=
 =?us-ascii?Q?NnndX7wClNc6iBz7OZffDa4oRLQ+YaQ+NVhjrw1wlb0ZFCN2jKRNbB3CXCN/?=
 =?us-ascii?Q?zxpY+fgynYagFpfhjKsxkVIPwSLqTN0l6JqGDXLUsmEJjF41RF+TO/ZutBa5?=
 =?us-ascii?Q?pfzjhBFflDICKvQtiQjKHTDEW93NSUjTbajOGIBktXup5Wt0QA1KzBXOhpq5?=
 =?us-ascii?Q?t3miygmf8FEEROmzqx2ta4haZJMU6HobsgrOBqybCeLIjTeVC+/YCzjf3o3I?=
 =?us-ascii?Q?igKHo9PZQ34BVKQjZyA4DxL/0wQZkTklf7UV56sCyPgdCQul1pGARhfD8n1x?=
 =?us-ascii?Q?Fo6KPdZ9qtZkXbfFQOy5rKQglApUdEGv06R+P5jFEqemgeC5XUYWaCSLlXvv?=
 =?us-ascii?Q?B8cgGxaZ6Eit8hfWT5LRtAhsxhhRHviKKPLYmUzQcHUrKhdzKFpJiyZtKThd?=
 =?us-ascii?Q?S8vDONpNTiAeT9iOxCF6VCbYv8w8cdXs/0DzDbZRwc/824SaNDrDKkVoIzml?=
 =?us-ascii?Q?DIKjkfFw55fNs3iWIXNNoIc8UFPKOKvcK7qz9CStgCBSz+tJsiVhC+xqgH+W?=
 =?us-ascii?Q?TKvgauQoo9yJ+6i8N83zgj7YyC4RvQdETXe5s3L1Tpopep/49ukwvlhXiJfV?=
 =?us-ascii?Q?zFUVBQIHRNm+UZPH2aEG8NDuCwZXhHRg84o4zbMyMZfF6sCLAFpEk5ntJQqs?=
 =?us-ascii?Q?EEAIYnHMV+i+XOrOosEmjbRz1/+6Jedo4VIGcWxggcisCpiGodWNhqchKvsu?=
 =?us-ascii?Q?rpkfz9Rb7sQiO++YBbzjUvp5C+0aw7gOkJgxFABUOiPqhuuUA/nyOqYsZPXI?=
 =?us-ascii?Q?8EuuPBy2C0M5iAS9yM5qd9n9W8cqFKGlYRAiNHc1IEQO6VLKVRk+UEVGHIcW?=
 =?us-ascii?Q?cJaCaa70YyojZ5VfZpIfXmE22J3J9Fg5roe0nvmbbmnwe2iE6+0tIoizo3fL?=
 =?us-ascii?Q?cnVx7+Liyd1NjFXwmYvEIPSTJOMDbwzK6k9JPhLjE8SdHUPxuOB69Dx1HGmI?=
 =?us-ascii?Q?uUAnjbIf6aMYhkvfzfYrNThrkCImSKg2Ts0v4W/4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec461c5-0760-47f9-0883-08dafe9eefc6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:41.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZMZjpanTfqzrVkZuQ1rv9j5dB6b0335Ay5rMqzx9bw2/Ka5q+LrPLDLCyFjIn1MYK1wzIPEHVuommfZVf/8ig==
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

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Check bus format and flags across first bridges in
->atomic_check() to ensure they are consistent.  This is a preparation
for adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

