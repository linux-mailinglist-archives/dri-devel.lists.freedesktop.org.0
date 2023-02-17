Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260069A5C9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBA610E3FF;
	Fri, 17 Feb 2023 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697BE10E3FF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho19rkWkZPkbbtmwCTdj+HQ+9eo24185EEJM3CrPACq6IUdRU86bHMmXuNbOnkjR3XKRNr9rt6iY2Sva8aofrI2L2s4P4gpclhBbYi42moTO8VTsXyBHZxaQzN1C+v99dDKQxLsFr0gusb67rpBgRgJFgXrzqaptd3j+cxzGQ42nBAxDZiJnMJ/0czGv1OEGgrB3wKVudy7C4+5s9b0b2keuYgb7H1mXxcziljXbY++Pe+gcHSNLhbiDlq4/Iey76a/ib3S8Fp7szpLRkB0TBJboE8qmPaL0jAExe7P2x1HGaq16zydUPcQcyF+zbWp8a+PrV0slCyzBddZsVqYWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45Pt7RvBtxBF0Gwzd3YEF57mgnD0zEJn7sUE89fFrxA=;
 b=jAfHD9Qxi7woyHGntaX66NLYHe593dcX172bwznEf6k6pt6XsvfX4NvB4FBJqXPZ7XeTXweXJczZkmn4f31mSW493h5NoRrvwOeyIBB1M8dvt2blIO3emXMz+Vq15V6ocOVCX91zxO5gXjeQHuGuysAIihPBN+Z7hbZaDPiVlMbX9tWYXdF5OrgNL3tSwtWYppt1lm4f21YAWOx7PClrp/c8sJRwOB5M+w3phISk9/atIF0gYVK1ot282a3WOAJsEANRK4wlhX/HqC1KwJ1wDu70MNZ9f/NH8Jq9tt7FGaHvX+EabOHeD8qzHCiVU+NTqskJBatMLslrzhgCH+WfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45Pt7RvBtxBF0Gwzd3YEF57mgnD0zEJn7sUE89fFrxA=;
 b=eh0Y253szI2IKXoLkYwwSvvOkapKl+tUVWLQSGcF/Rz8lsRlay8x9y8SlDLaRPzJlX1RL4QN9Yfvspm0ghRF4kKgwLC8CLHZyFsyteEsNhDSwG2+HxgMRfLI8I/Dpso1GSXMS0jph8ICz03MaRXFvfhXrAKKkO1ftxdMzXn5vmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Fri, 17 Feb
 2023 06:53:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 06:53:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/6] drm: lcdif: Check consistent bus format and flags
 across first bridges
Date: Fri, 17 Feb 2023 14:54:05 +0800
Message-Id: <20230217065407.2259731-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217065407.2259731-1-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: cb01bddc-0962-45fb-f44e-08db10b3aa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tEvc0B/wOgk9G6cy0YmaHukcvcUuJth1TxnYSUy+ICIEWV/SMhpIujwZ7FvlzPpXEA5aMjhiafPjaaW/hksvPV6Q9Lx6zSWtY4MZRLo6Y2bJCv+7mbaM/l0pbAOO1eAS8R5UoYdPWRixwV2PR20PdeKSFbrzAehQtXT18Jpnj10jgqGNILV7oxkIVSkveZfeP6LN92ZJOYajwnVxaMZPM9mfhIevZHpCLP36f/C3kV0afYFY+P9O1uMBd4kzFrsiW1m2uyE/7bg40dkY7UGygvHsYqq8FAI8MFFpYMVfKYU6Is5+1/jxjn6JeUUoziXXAu80Php2Whr0X4MyEE17W5OLWFM4b7QfdwQbCZC/nFSTltGNdL/OOACrKx7nupQkNmN/E1efasGyyyqGXjlK2ycc0CHV35NXRjzjNBdHe3Xxhn+4F5bRnEbyEhzLtrpLAx17btJJDwsaD4xv5qV/KZD1KpynYpjt10+2dBN6HtVmSQ1BJ3vC1V0Xcb8nouZ8iAOOlBO2MItGINCQrShl1SFRHRC4VagQlu8onfRjOr0F2sHZmBMn32y587o0U3ofyGoe2a4WyujOtUeqWKfQHz5xU4ANYbBC98Kwbx2u2fc6R4xu7lSvmBEY5ryHE5WCaSb5ujnFy7PMna4q5WORdfcu5xtwXzailPj4GCNHui3UfdPprk3Frf5C+oiHuxAMYmjbpBpo/pWmUA0RyxRFuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(186003)(26005)(6486002)(6666004)(478600001)(52116002)(1076003)(6506007)(4326008)(66556008)(66476007)(66946007)(8676002)(7416002)(5660300002)(8936002)(316002)(2906002)(41300700001)(38350700002)(38100700002)(86362001)(6512007)(83380400001)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KS1p8LpQHTH8iGGDjY6HsZNauD1AtEwPbIeXXIbot2vE9PTllhdWV6BmPQnb?=
 =?us-ascii?Q?uFafh1M42FbuyAZalRhj2+0YEhK7PSiJqBEq24v3CHfG5iRoWx44qrRtSkri?=
 =?us-ascii?Q?85xpBTF7VMf4OKt3SNYoHfZFRhoPeuEZsN/mY7gsZHZLn9loJg4Ld8clfmNg?=
 =?us-ascii?Q?utj2aRBZNVVnJFqPLm85Gauf3EC0+VL226Iw8raUIKMIJNJxlnOgN9jFgQW3?=
 =?us-ascii?Q?vxLQXIC5+L6U40bc36WFsV6P/wDnP3EGc3mt2grd6jzJbkRILvuE+482HpPn?=
 =?us-ascii?Q?HOBkklpugWVH9NPA8i5FEODQyu/erlTWi+s/RZLmJinfD9tvwlw1HwrnfwlO?=
 =?us-ascii?Q?5BpZW0CstFAxYh5P5k31F4T9SAHb+7bWUWKiZ39wtYoZBGZPEQ0HAEX0pJHi?=
 =?us-ascii?Q?6sD7j+1BijjTkGvL5qfwhI4AS8YremB68UqOgi1L6I3fgTcJ+mJ9ih8gzFc5?=
 =?us-ascii?Q?7xVYkMXIOWiOS3VV2Ew3Fa9e6GcK/WxsDgYqpFa/RSZGKQIxjJGmEqwAElH/?=
 =?us-ascii?Q?YypaNMGqkGdnhlZljF3YN+H5UyLY7DZlyQDAbMSXHBhDtkz6AMRE+Zrm7/+j?=
 =?us-ascii?Q?T3NjEIpl5yMAerkAkB/rRmYRqgm/Twkrn61N0apS4QQUTm5Nl4+kg4vwWwMf?=
 =?us-ascii?Q?SwP83pCG6lo2gH9Mn/X8P2hscsjUCKZVcYjLCu42aR7Kxa+Kyzv5MweUJKH+?=
 =?us-ascii?Q?1x7VHXZiQpsbRm42wAt+Mp7DDyz51s5yUCDp0ROAXhjUYFneq7Sn2Wg2MSHJ?=
 =?us-ascii?Q?z/tntKm4nUtXcgUzCYXrMU3n4ed2VxqGn1pLJ+WbEjLQLATbUKb+NEY0701s?=
 =?us-ascii?Q?sR2AmiEYcJR+hKkdGzjg9zKGwpMX5IyAUnuSsOQ+dBVYWjlAR+uFEWPR2EwA?=
 =?us-ascii?Q?d6TWsNf4hbov4gUlE5DgbkYvNtkl//LJu6cm+Vha/Ulr7zYGT12fKHujJTrm?=
 =?us-ascii?Q?Js0RIWFvYuF0bVH7UqN1Hl9Ye9vDH16dpGzCWLDJ5n/GpUL5BBTDPeW548iM?=
 =?us-ascii?Q?+9n0qKqNkC/9JjgZch0nhCFt3jPKFJN9wXlU6g4WrKD4p10nb35usCcXUAQi?=
 =?us-ascii?Q?qkEf6j5h+XVcXVKPBVTN7JQKwY8Z5GJZ1EUSW2j5d1QXRQqZq8CHG/o1tx/8?=
 =?us-ascii?Q?2hDAKzn2QLeucR6iEoisQlA8y9jhxVKcUgrBRWO2SuYdph3M4/ze+Vshmv9p?=
 =?us-ascii?Q?8jlbuvfpJ8T+uj1/feU5oUdDBYmnlWbOOZa41YNaQBh5/igfco6x3cbnuz8A?=
 =?us-ascii?Q?5xg0UCz2ZStI4ldDGrzMSsMwrnw0kUjEiv87JWMZvDiEvvAfl5zIFpIti7Co?=
 =?us-ascii?Q?YXjFwVXQA4+qu3FFPLJ4wzp5inaobSAeVZ5uVwxImakI5ACOf4ZSqNpCPbbg?=
 =?us-ascii?Q?I4jPxxd2Z7e+8jkLRXMVA+uVwKc9vqSO8pI30btyHgUEiNNNlWH92X7pLMEg?=
 =?us-ascii?Q?T/OOBBgYr+ffib5/s6pqSWX1jSDyR3/c3tk4IIqFVT+1+ZrVSB2LEko7Snh2?=
 =?us-ascii?Q?CCY4VB6Lbskz8V1TYZ3WrMzr4HZO2jt7oIxKGaVtk5xSXiFX1vqPFq32mJ8q?=
 =?us-ascii?Q?eLnd6nmYAiWiZGcbu9Aj+tx9aBGuQjqpbEieKD8K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb01bddc-0962-45fb-f44e-08db10b3aa51
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:53:24.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oExaU9NmZNydJDtaIhtSU/k/BMuuk5sv9ZnHYXtnHq1ABipdJQpWg47aolyWu9Nv81Fx9qwdeOdzvGFK9U4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541
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
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Check bus format and flags across first bridges in
->atomic_check() to ensure they are consistent.  This is a preparation
for adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

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
index d46de433cd8e..d6009b353a16 100644
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

