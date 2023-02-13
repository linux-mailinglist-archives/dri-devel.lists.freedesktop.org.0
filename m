Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13F69400F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4B310E4E0;
	Mon, 13 Feb 2023 08:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2010E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR/KK3m5Exy1+JygnECvxL5NdjifdmYFHoOEdhWD4Sccy6392v7FgVgcA/k5jrq5JgeUS5+OXBtnOik/Q4c8wcWyKiYzT5/mbvFkA3TjUh96guCYrx1IdROYhTCw6hB9ud8WVv6Ros9Bq9l6bVPCUM+LJV9/37IDC1Nqlj8xUduvlnY4CdiXEUo/dAP1k1rW1apoJLTwoPRvPP3uuhzB7rAMgO/lthRPtIVWxvVGCxRgCLmFAkS6j5IHOt+vkT5O1nm8aXEfNCH5OaX81ItWPCnukBJEYNPTCGnKO/vySmq0zwxJxSPQs3HJeaSLYPQ2tTOMzaZrzPGEIEsa94o23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYic69GlxJLmbZGNNJ92I/sTEku99+XOdbfKZ12DIp0=;
 b=Edn3wDKmLrZIWngeuJ2dpATuWyAgIJwXkuUursA4n7KNJCswSy917yJkdILCL7n8XESB1tcqTe4VdYTyvrxSHD3kP29XbRwO19Oaim4ASJffd6bZTJCoaiBbU+Yx/f6KkPTkSko2ekWGfzMsxCJO7VI5RjRVeqsM6/vboRZRVzuAFq/ihJeVRwT73FDHwl9lyxqHA6eqxsSW5CS2B0+Vh32oJZ9pEP0XDcZsBDBz8kl3nyhXH/wPT0N9k7j5M/cw6tTXkjiwp4qNN+LfY6sDdoWiJBa1ry5HytoFtvadCDBUTouJAvd3u8PAN8tG9vFR9V6zi5q60pupqXvllveDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYic69GlxJLmbZGNNJ92I/sTEku99+XOdbfKZ12DIp0=;
 b=Z1GGFUNYI6BVAWzQU9xaBr2fSGVQ/2Z84CTCR75f56F+ApuI66ZQjQ3pDwYY+WfpeAyjOWglCpkZiQ0GkoBknBlaA8krCyNBCNX8R5jBa43lpH+D4HfVUm5ijf687LpJK/XjkrrIKhtoM6T/y624Us8l1jgm5t3vfvkZ1ot4a3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/6] drm: lcdif: Add multiple encoders and first bridges
 support
Date: Mon, 13 Feb 2023 16:56:11 +0800
Message-Id: <20230213085612.1026538-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9c30c05d-3879-439c-1994-08db0da01284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8wav9f0dLUp01/WIWRK8TLCTu5t09W7L/5PXxaU3xG9qHHtKcdAKuFgBU9Z+X4dw6/0BXPLYTJowa4rNZNAWNADSpnTIDCjb/GgAZbebGQfoKYmihslFlGC6LHDSsX3rzEelFHkgSItqwb6VBPcjkNhLGOE1Y6z968oOpgGnFcVa/5sTlP1FYiDx7nxHXIeIQs5VRCSY60YXWvwcxJz2OH1TbSqQ5yxx0T4aYb9RUy/ZbkrVdWiFy0Y8kYg73umVMxOpv9u1G0mOEDHjiFMSBKYLK9NTB6hDSj1Skfp08tblFLCUU1QW36dGTUpB4MvResceqlobwEl5fJZlduX2tVqd4sd7paa0vtPXd8eOfWf842Ta4vatQuT0/8UXMFANxeFaoOcPuFjHEdze/npCFpXTjfjIyJ5kK5wSTg/RAJe3EeuwS9jf8HwHOmT79vmgE4pYi7atQTdNj4jwA+CeOFDRn5R8dj3qa6vz87kqBBxrJdHOMwoBJgwO8f/g7nguMqO6v6C0i2M7JXRImTAB4rmzG7O7fuwn2R65bdcUMta+252/Fac9DGU2Xe4BtqhcN3geAcSBYfRKc/w0u01fcRv+qomnTvzX2WhskWewi/nDuu8DntOqm0mlgk/loEIYrXvUwy9jG/h6RtNHjc8zUWJLi3QVus4pYVv/CJBd2xd50vAwGRNdSoCfT6cQopFytILUmd9d9flDIi9rHo01g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(4326008)(8676002)(1076003)(66946007)(316002)(86362001)(36756003)(2616005)(186003)(83380400001)(6512007)(6506007)(38350700002)(38100700002)(26005)(66476007)(7416002)(6666004)(478600001)(6486002)(52116002)(41300700001)(2906002)(66556008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/al4g7AnZhpNshsjdqM0hGwiwYr3lreyDVL64MwykSXQuZ7gxwD3LSGZCghD?=
 =?us-ascii?Q?ma/WRU2weSRqm2iULp7213oGHT7AEXob4pKuR2PpZkHD5pMXOu5balKokjSW?=
 =?us-ascii?Q?FCtuwCf6srdNOiV3H1oub1YxKgtMV1A0MQqoWnKWeVmY6p1wJ+5/jiYKDZPd?=
 =?us-ascii?Q?4rDrdCXdGXxiC7D2DjxpKIvrDEIuoHP8U99MYPbxsqgS6wJqShNp6rmxGhlA?=
 =?us-ascii?Q?bIQPQR5thdiPQL2NXjpp8vZnCt5oiLaDFAR0pnvr9Xt+Y9hvUkiAPkbhwrn4?=
 =?us-ascii?Q?E7MgDLj+9VMdRdcAl4o4j9VtLf9aOHYwdgmJ1LmMeIObI2Hk8LtsGBdetBJF?=
 =?us-ascii?Q?HnWby8fLX4AFFulbGhLKYY4l5CI0ol7XFKGun9/UJIo7ogbyE0etXQe/Oz0u?=
 =?us-ascii?Q?HhyaFrDkOGx6NOCwjN9utAlXFGMhpRPHpEgls2vf6kaTtCcM3XYN2HSjr86V?=
 =?us-ascii?Q?1guAh0fa8rN+5JOneoW4lU9fVrfclYiCyAw3bm2jdvwVE9G6uL71l9ZbsEja?=
 =?us-ascii?Q?NzP0+rA7hjlW9KLrfvmAN5MC6YX/5801EBrKGpia80V9lXs5o0kInqW/08HW?=
 =?us-ascii?Q?vVqertt8N1BBn7gL+Tb4/jW4VlHKqGUAyRNm62OH1FUWLvqceFjlX2Ar8rRz?=
 =?us-ascii?Q?Jf/8/KfZVIyOM9+P1lDiKPUvfRXspvKvHr4JvWBnpGWPh1qYFV6O01LAzHYY?=
 =?us-ascii?Q?84BVlkrpk+LATJsbmhLWKEU7dYeN2ii0r4W9MjUWngJ5x+nkdaLLQ85Ap8EF?=
 =?us-ascii?Q?tgGiMcLOosdC+bUx6ZLnbwK60SAAS0rgJLfdrhxAyQe+qWLK2trDjzHAfbpK?=
 =?us-ascii?Q?laKsywkgf1VPvO3oj+YGkeZzJRyoRJ0eDrRoslIAAjFsv8ynPMq7tgfD4dNL?=
 =?us-ascii?Q?/EXsAw+SFwvXmhepR1WBHzBxN4TvXxPgC/klAQfA+eA7G7wqpGBEfLuQwiiY?=
 =?us-ascii?Q?FWd+Fk4yUR3fvVpHhpC3VUEm44eBFKddOA04+eTJcXpSUGZDalwcqoUGtRTa?=
 =?us-ascii?Q?PRNK1aoLTltQgT8TTASE3ICzYYWXD7exSV3m+S/RkA3xxQ5SmdVU6b1ToLT6?=
 =?us-ascii?Q?aAbekAlKIlz+w1h2DbJnPJo4XPBGJ9dkvTM8HPPuDKJTgRoCYTscDWy9A7S0?=
 =?us-ascii?Q?orYRWg6ckRqZ4YNkiXk2MOQZ7bRDKQim+zNC61UQ0AQWUh/7fKo5M3lrNeKS?=
 =?us-ascii?Q?fT5SSd46BV+YKqfvJWdzud6XHKd98XL+6shA+3ksIdq5ESBjCLGxNnzB4dMe?=
 =?us-ascii?Q?s6jUYSH1/GJ0OrGI5Zf/9HqhKzjiLX84Q2DHlVM54rDpNwbXov5TLuSzzXj5?=
 =?us-ascii?Q?OZm2CBQXKfFrl6Z77ska1UrtYoP+6419cdR4iFJYgUPZKDTO04+sLfx5/wtX?=
 =?us-ascii?Q?TSX2ttvAEc4RKP/xYaGN3sWpk9KKz1y29HMX+uQLdbwpkCVVvUlKaJ6Awzey?=
 =?us-ascii?Q?bJAx2ADgQKm9MwbXy9GQYB7Y94xhF3XizBJunF36UH3o18INATdRN5e6dsfc?=
 =?us-ascii?Q?VTCuPNiaSToyx/cea6rB3xNCD2xxLeWaYciHSQ2UgxekpiNeWh8OjrbujJpP?=
 =?us-ascii?Q?nBMFAd83CF0JcC1vs2Hu1e5LW6SfTOAwADbEUldL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c30c05d-3879-439c-1994-08db0da01284
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:36.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDvaKCoMmYVfntyNo5dreBJzjxSpovwaTzUg1w+f3zXMraQ9GUZAZFxtQbbp+Nf84QJM3T+AGoKT49n8Jby/Hg==
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
simultaneously.  Look at LCDIF output port's remote port parents to
find all enabled first bridges.  Add an encoder for each found bridge
and attach the bridge to the encoder.  This is a preparation for
adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
* Drop unneeded 'bridges' member from lcdif_drm_private structure.

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 68 +++++++++++++++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
 3 files changed, 66 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index b5b9a8e273c6..eb6c265fa2fe 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -9,13 +9,16 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -38,19 +41,68 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
+static const struct drm_encoder_funcs lcdif_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
-	struct drm_device *drm = lcdif->drm;
+	struct device *dev = lcdif->drm->dev;
+	struct device_node *ep;
 	struct drm_bridge *bridge;
 	int ret;
 
-	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
-	if (IS_ERR(bridge))
-		return PTR_ERR(bridge);
-
-	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
-	if (ret)
-		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
+	for_each_endpoint_of_node(dev->of_node, ep) {
+		struct device_node *remote;
+		struct of_endpoint of_ep;
+		struct drm_encoder *encoder;
+
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!of_device_is_available(remote)) {
+			of_node_put(remote);
+			continue;
+		}
+		of_node_put(remote);
+
+		ret = of_graph_parse_endpoint(ep, &of_ep);
+		if (ret < 0) {
+			dev_err(dev, "Failed to parse endpoint %pOF\n", ep);
+			of_node_put(ep);
+			return ret;
+		}
+
+		if (of_ep.id >= MAX_DISPLAYS) {
+			dev_warn(dev, "invalid endpoint id %u\n", of_ep.id);
+			continue;
+		}
+
+		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
+		if (IS_ERR(bridge)) {
+			of_node_put(ep);
+			return dev_err_probe(dev, PTR_ERR(bridge),
+					     "Failed to get bridge for endpoint%u\n",
+					     of_ep.id);
+		}
+
+		encoder = &lcdif->encoders[of_ep.id];
+		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
+		ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
+				       DRM_MODE_ENCODER_NONE, NULL);
+		if (ret) {
+			dev_err(dev, "Failed to initialize encoder for endpoint%u: %d\n",
+				of_ep.id, ret);
+			of_node_put(ep);
+			return ret;
+		}
+
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret) {
+			of_node_put(ep);
+			return dev_err_probe(dev, ret,
+					     "Failed to attach bridge for endpoint%u\n",
+					     of_ep.id);
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
index aa6d099a1897..c7400bd9bbd9 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -14,6 +14,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_plane.h>
 
+#define MAX_DISPLAYS	3
+
 struct clk;
 
 struct lcdif_drm_private {
@@ -30,7 +32,7 @@ struct lcdif_drm_private {
 		/* i.MXRT does support overlay planes, add them here. */
 	} planes;
 	struct drm_crtc			crtc;
-	struct drm_encoder		encoder;
+	struct drm_encoder		encoders[MAX_DISPLAYS];
 };
 
 static inline struct lcdif_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 4ea3d2b2cf61..5f34d01e133e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -654,14 +654,6 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs = {
 	.disable_vblank = lcdif_crtc_disable_vblank,
 };
 
-/* -----------------------------------------------------------------------------
- * Encoder
- */
-
-static const struct drm_encoder_funcs lcdif_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 /* -----------------------------------------------------------------------------
  * Planes
  */
@@ -754,7 +746,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 					BIT(DRM_COLOR_YCBCR_BT2020);
 	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
-	struct drm_encoder *encoder = &lcdif->encoder;
 	struct drm_crtc *crtc = &lcdif->crtc;
 	int ret;
 
@@ -778,13 +769,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 		return ret;
 
 	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
-	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
-					&lcdif->planes.primary, NULL,
-					&lcdif_crtc_funcs, NULL);
-	if (ret)
-		return ret;
-
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
-				DRM_MODE_ENCODER_NONE, NULL);
+	return drm_crtc_init_with_planes(lcdif->drm, crtc,
+					 &lcdif->planes.primary, NULL,
+					 &lcdif_crtc_funcs, NULL);
 }
-- 
2.37.1

