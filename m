Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEE867AA73
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0891210E72C;
	Wed, 25 Jan 2023 06:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C625510E727
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4eo3j9DFibXNb3jjLFYayWxVLZ98Jrf3/UI2rLCfuwv50hAzFOJ0Y4YNxHXA7frT0KyUYnN32TIbo//0edmUmNVaS86/fOYPCyspYsMMTCjm0TNvaOEfglTPWYJJCWu0HHn+TcnYrw0ryMaRIBtPZyUGmuV8/P2c/+sjuNaLjqUYz3IuYkpNXOON5ApCXdIEvYGnUbBoGaf5jO2nEDOsIYYJRFn/tdAKwaQ8wDA2LamjfZnqNwEG/hdETJmrtaWJaJzBdUyX20DANxIIfI5UP38OAM3fuoZPIh7awQsXnOOmTgMfBC9KinCsizkB7huHX+MJBTaSV/mX2GaiiuAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7xbrzQXE526yhSX7xtTpEVwQodi4YtqOzy0tAlMi7Y=;
 b=DUMyhGUhiTfujpz5a2bnOwNDKHmDUL6XLlKWAg+5tAzKTD4HRfrPO6fF1GKBQ1+xDBEdvcHNXRZenE9GerTb/RAwWUY/7aeYXdCilczcLF6wiy9tpv4F07VVIWsyOd1YQUyR4j/ZC91CP/oayJPEADDG9uGuUJK4OpVDqR5yVGHFYHe8Gw1om07zh5Apd8/bPMNO4CugjIbZ2rc8C603n4eVmtX3I29p3irE9WLxKS0/NorpSt+4o5C/Mbnsoj790Kp6FMKLtl8Z27FpmPguTtNCNnWUi75EuaV/pfTy3C1RFwWSh9vNYJIWcizXX+SxnSCTBdpRSBQAGMwSUGj73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7xbrzQXE526yhSX7xtTpEVwQodi4YtqOzy0tAlMi7Y=;
 b=o52W2skM8j55+cixuKOkYPnGNZpT3pq36kbirXgWu5ADKOjMWVkog7zYFk2M2Xv/5ffQLM9Uyse07Zg9dmmUIhkxYwIq25Fh1y6Mdmt2JnObtk46ONrAey66NadZOi5UBamEd7vYqIlST0d+O3CNBoIVBGKyb6n4H+UjG6KlUpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/6] drm: lcdif: Add multiple encoders and first bridges
 support
Date: Wed, 25 Jan 2023 14:40:29 +0800
Message-Id: <20230125064030.1222121-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 251b2399-00d1-4a64-6d1b-08dafe9ef2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQzc6+bJrScwjQabBdANDZD56Wia0vETMjSHcCijYWBSjHfcL8gIFi3c+73EFiqbypAkmdvwCFjnmeG015LqSiXj6i+xsqia3L3Lov86SfrQ0YbYadBtY3Dt9jneEk41jX2KIrxYJ6+MFYBnN9wgAtsRIx1KK+Mf6TkT+VVQ1cHIOfOZrQx2H6EeRqso+lIVmOV2z5iZoYCTRHrYGC7dU4UVZor07I+zD6S1wCCkPX2TFXDqRxoX4vFFC8t1KkPKh6Q3NAwuVtntMX6TvdRxRDQ7fl53AhoHnaJQ7diM34QD229ErAnWv98Oa64kzQNZ4BFSngl/gxqOXwav9TDYY5CCfc0io6wqMJjquMvM97szdRwY7qj1WL3DoG8tnUDeJWYFcAxcGfcsAwuP1dsv+56MoW6WHjC3TVbObqyKr5oRg9lSvBQLYXSSqhntCszFFK7/gI39eryHLUYel24qIyEQ5Ag8ObLyulLVg4y7DIcI/iuw7zInF0tbanDwF3G31HGvynXnxG6UJ/HYRwysD583Sayn156K3BIzTxCzYjKy92Bm+HkkKQ3Ns6titKMdZjnek7eFpHyiNSQnxsZndWX4+0BWEZ3ElA/7NZ09/M6DNYLoJ1DD7yjKEOJ8ZcL7i4oLhhwjyO68dr82nZ2BDp1GSHMUeyYwCAWrWB+LODmCfJ3rHUr9wUOreZ+cWk1A00vOgBFXG8QglGPf1IT2kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(6666004)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ctj47KpYEGPRdK/n2g4Y4HaYVwwdPPn1LoSc2AjBPMSjuGTX/SHThWm31QHZ?=
 =?us-ascii?Q?aTU1xdWvXCGUG/Xdd8jsWrKYfW0TzC/ahb9QbjdHNtNCNi1cneU+K3sI6xLL?=
 =?us-ascii?Q?ErIYOWacO8dtaIWklDWZTOHdtTwWHECS7FWKUznsXyDDE8yPQwK09mu0OJ3I?=
 =?us-ascii?Q?3/VTPmOEJI7M55iL6V7YUNsuvSttgmq3CYnho8rFa8bwClJJbSGb3uWP23OC?=
 =?us-ascii?Q?AcnFI7OZOezMN0YPaANEXvvMqS+ycktVNazuIFz1wuj4Ir0dLu4Q2PmH5Xrv?=
 =?us-ascii?Q?LgK5HUyH5SvGuk8V2G1Y1qRA63i9Fw5kyiF5I4bm9gpoz4wN6Jsm931bIM3l?=
 =?us-ascii?Q?hbfDGhk2kmVwFsbczOwVA4aQAe4WjRA7eOQyLUnh6mLaIfbMBwUCCvBVtDHJ?=
 =?us-ascii?Q?8fxGyybIh1a4iIjL1oqtSkv/g5LiLIIR3aiTJdD5D91PPInAMZu4Y3x2+hsP?=
 =?us-ascii?Q?yVcqDMfsqdA8gMOkUz6ukaox/iRLlf6GXS586gip4siGHyYhN/ILlk3BNyzY?=
 =?us-ascii?Q?9x0IAeo8YlFCbU05po9KF4jhImQXvkHQEJRoBIoj0dtAlh/ZXGoKQ+jyesJP?=
 =?us-ascii?Q?OsXxu5ajIG0vWfc7Ew3qT6vbku5u36q9V6RZjcKyScT1VutJBMzw75OIYTSb?=
 =?us-ascii?Q?F/mX6RNe7R4hXj5/2juWfzVL9liVpr+t1qTakN2VW23ssNZDj4LWyacvtTol?=
 =?us-ascii?Q?ZVT5MquYUfEguMEeYaZhZPr79lJJ8hND2eSi07S8IYl+VppzTSnNGpOKYrh/?=
 =?us-ascii?Q?vo4Ymguw+nwfcvYUytmQkRg6T84gs/T7GamJ46I4SvUdrayMyfB4bDIJ46e+?=
 =?us-ascii?Q?7UYE7ZdT3u/efZkWjyoO5zTQ3K1na6dRDtRmYn5ppAasv2PBHPwQmKXlZJd2?=
 =?us-ascii?Q?5GuNtPBgKp2WOPF20j66SZaaIGnQ0CFv+/rKxGLXb2vzZe7kb5dyK41VXsOY?=
 =?us-ascii?Q?aR9ih/oWHIdow1doitjjWABiPE8A69Seph46ykUf402BDS4hqcEKdCmhGNFw?=
 =?us-ascii?Q?FtsKB5Tl8gVimb81snGOxSgApp1RG99Sy0OSu46AUGa6W5+/CRr1gcyOOP/q?=
 =?us-ascii?Q?Ne4siU/dry0C2YMyyxZOPPTVedT+EKSllMONNy+Zp0mA2T9T3sjBbBmAoQzD?=
 =?us-ascii?Q?nS8K+P1KztIRDZsXp3UjRT0tBL4+twvWK8Q4c0Ln2oac+pNSivC7F+R5+Sd/?=
 =?us-ascii?Q?Sw2em2zEG1UN5ywpxhnhuiAWj6rm/IUzutMyMDf8lZFHQr2/lso7wJ1xgx22?=
 =?us-ascii?Q?TnMKsT7wjQjNeJXI0lWCQYbXby9ANjXa2Cl6JbsheUuraRbjtpqRLY+Un9D+?=
 =?us-ascii?Q?QnC9lopWlA9kxP5OF0uL0pXrkEnE9pZBvigHVXaN78PHAKi9hz4IwAlQfOCn?=
 =?us-ascii?Q?xcbVZO3xj5vmlnkG7uaqApPq3BVBFKbUMSFZNSqELbzNxiQ+XYSt2rv1ExSz?=
 =?us-ascii?Q?wl4qMQkmhReJaXTxNIDFyjR3sFC7kXR45WFJ6OpClev0IzizRIoBc0agxk0f?=
 =?us-ascii?Q?kmOKE9Y+T1u0NjM4JpoZczW0sPwjoNcLREczmKFC2ukoiI6U9WUua/XXKS4z?=
 =?us-ascii?Q?5/1rXF19iifp2fQRuWlSZWV+dm907ssd3ec2Mpgt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251b2399-00d1-4a64-6d1b-08dafe9ef2ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:46.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d7KMXDeKReolZIxSdCbjl2meBOKwRzLFidR+03eUlDQuIqAEGvqDpLVnV+B1MbvGrSI9x+JmzD0fdI8UBcizA==
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
simultaneously.  Look at LCDIF output port's remote port parents to
find all enabled first bridges.  Add an encoder for each found bridge
and attach the bridge to the encoder.  This is a preparation for
adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

