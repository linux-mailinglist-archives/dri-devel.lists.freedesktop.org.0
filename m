Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E069A5CB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7537010E409;
	Fri, 17 Feb 2023 06:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4E10E409
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhCj2MLtJEE5dy92Yzh4PmmKOJAoStob0fM4I+7aBNcpgKFjE4WY8uU8vb9RPtPCIo/ADEFeYpwMt6X8/SzN9lD1hG2jzrFgzNhgnqup3Yvn7NI4Op4aET5VOCLOES3JzBCHqnw735NCdPKFRab+iNbByRdMOdJApVA3gwa9PGRxJ7PwKfRhhWyKRFf3ixccQUlTjIqkelL8Y4NYHJZQJ6/RJlioeJu7jo8jKgpOzg322oOebDj6gcpHpcfoS59prYzXAQXB870Mu8cdxBdqLVXOE0kNWSpCopWuJeQfOCx1YeNu95F8GFXiUPs+UITAdxIYre9Hd2DyuVghDYIMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBwLD/TkwbrMLepjenPJEqZSFYZVyz7nF0iU6vb9fqY=;
 b=gZ3Tprp/iRF/dtdxZ3tcqUVevcianK50oWgVEryJEMBv/c0AZO0O7vXEbB+wpJQYDpc5p+r2PeZNVxhFWAxaxDERDVs/vjzXXnFkeMQgmbTAfX4pK7lq2p3pRzPolqtMoRyafTK7LPt6yDU4uOOaCfubVwnXI1yDCaDpaEd5LRkbg8FJlyigHLlGepjjM03XEqz80fNmWCk46Czme/OVyKZDJKV9I5Vm4LGG/vkpSVWF5IjwFYsu10LFnTW98gAJeLP5XodAeYu02j7SwrdJi6LX2vnrZ6XTt61StugZtk1G6byg7yJm8K/J79IxxjYehv2MAPZ/x7gCWIX56i5cGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBwLD/TkwbrMLepjenPJEqZSFYZVyz7nF0iU6vb9fqY=;
 b=IXzM0qFmxdH8xDuw7yLKdCI6ZEfRESBVtZ0DLmLVDCNhi28BbeTMcLozsy1yYksAtq3htwlPqkCT0KITFj9zQ2BlqjmfG17/Yo2UUP/Bjg9CZojdBi85esMfjuntDgaJugQtXimdVpjnLR/VBvGRyxb9yKui7EnRppr3oaEwIB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 06:53:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 06:53:29 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/6] drm: lcdif: Add multiple encoders and first bridges
 support
Date: Fri, 17 Feb 2023 14:54:06 +0800
Message-Id: <20230217065407.2259731-6-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: a00cf244-8c0e-4fb1-9705-08db10b3ad56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyPNavni6Wb/ODpyTr7BLF4i5+61tgWjOw6urMxEWuuo9LmgHCOM8rEV9REgnXYd4uUgfllPiBpYIyHP80H3EWFq80KMNWYDhYuRgHE3PAoJQaOn6dfQoGzztUaXYvxPWYupeogdxumJT9TKD+c8jpGsVdOAETo1LElyuFAvEMSwo7dcgdJkvx8hGXS690VsYV0xIimSIRDG3muJiux4TOS65pU5tjQwDPruooJvIG/kyahHlym7SvqEJa4aMTNnuh5jd00DQijmyj4aOPB2Qoqqop6H1wRo/hdRMtl1uJaa4QmAmjuuubeM3lVt61GOyZKDgUZ28FozbNtKNjZ4U/Iv5lDsyOqYOhbe9E85Le1ORkvf0t9TY+w1zlccTgvy6b5mVCDZ3FxTtL9q5L4N/bltfdNjK18V4vG80EYnfYMhYdQOj5nnmNhg5Kq9dGcsFgu72PUwEFLnZeM/Z9YC385v5Cj5ZbSnVWv00OI6ntnW7Ztz2OhYXn3sJ0fmEbx6W2SGJGde5jp1shmjPLPs2eHB1LP5gFLSIvY+1jNuHJfFIn+AR0TjNRG6UxJLyHSNQX+rAXFiSgZk/syveF7tEnObbn3oVOpoZTJIHVVWoUX2ZKmQA5Egex+SFBRyVmG7zUuPW1cKw34UXLGd6j8Y33pjbGQXzII/UzWKvhP8oVd2WB4/OiKoNcLz+R03cXoFRmzb0oJ3yAF1xVY8h1Qe3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(36756003)(66946007)(4326008)(8676002)(2906002)(66476007)(66556008)(7416002)(38350700002)(38100700002)(478600001)(1076003)(6486002)(41300700001)(52116002)(316002)(6506007)(6666004)(5660300002)(86362001)(8936002)(83380400001)(26005)(186003)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ObxqFQ2b91oAOaa4uh6CHXCcQ40FKyDs2XBnvUpzr2cEHMLvV5SPc0pSdOJy?=
 =?us-ascii?Q?5aGHrfdzaUTUABua+75LEJ+r6+CdTuqEYQfJhke8LAHscWxcmm2MrlQ+a3EU?=
 =?us-ascii?Q?7IMkwEihIWdT7c5zJneBYPo7ci6UY7jLAzSSYtGuUEo+XiBJUv3QEXbocN3+?=
 =?us-ascii?Q?ORv4PTsv0yo4Fl/SF1KBdAtTdHYQd1EL+3ujyezeLBrBORZjRO5tZuCJrvZm?=
 =?us-ascii?Q?9nsR3nYr2RFdHNQcJZrNYEkAodtQT0ga2mCO12kZtTPCYrztpARWaUxQ4FKu?=
 =?us-ascii?Q?1YtH445v6yyXNvt8G+3cu8DJBn+GK+xH6vrT4g/6j7h9uGUDgGQ/Ute5Nnuj?=
 =?us-ascii?Q?XqV87FhltKdqk04HrDhqEl2QIUr+elBiaeXvv2lhWQ1Q0EbPUN96jX0xFfMP?=
 =?us-ascii?Q?bJ+A2qFgpJeAwgPELZ4mCAhaPI+1VmryFFBv2KSO+UgSIOPEX/0spU9TtTJb?=
 =?us-ascii?Q?yT72fw8iqRO7vdlZETxgn0qGu5C7MxutcPB32sXD0UWnSMb4PtZ8hbhtCpbu?=
 =?us-ascii?Q?K5Jp3iL7bExazRtWc0wsGc0qrw5lnLQ07RNeowXG+Zk1r717n2hCurZOdvfC?=
 =?us-ascii?Q?cQbBp0loS1vy69/OLAo63k8Qu+1B9IYfYJz1EMBrES7RPe6dU+SpBOtZA2ZA?=
 =?us-ascii?Q?BNW3/Wp0Eg34BSOWch+jwODfjrgbY2yk54ARNMuzMPI7wLncA0HtL7lSKd44?=
 =?us-ascii?Q?IFswOnn4KdDKwDonwlf0PUYVTL820Ajb+tygcZ+aGPx0qEr98w7mt4ING//s?=
 =?us-ascii?Q?akzhqb7aTRErN5JUd2EeQYqQm7rn9l6GNMyCAagVB16rNne83cxt+Hvhv/mB?=
 =?us-ascii?Q?sCz+RK5sO4IAt2nPqI3BNQ6hK5YZraB/pS1JJrGm8B60jlH9ulR0fSelxy6N?=
 =?us-ascii?Q?BeUmOY/Wr/WWwTZh8FqqyFdWzmk15GfVb9Hy0zEFGkubjFI9iQmsssn7M3VK?=
 =?us-ascii?Q?XW6Vc/7R+ByPtunGXcrwL+mRYDVkTlCg6P5sCmXLmlQ7hcphiMUR8i4Lx8e5?=
 =?us-ascii?Q?gx/OtLh8rWKvSkx9Top/go6ZRdf40K1TT/t/Q+hNVE90eUzsj+9ThMShLVz9?=
 =?us-ascii?Q?TZsFk84QG0VqMRUXjUtJFTO6nrvf1VmibyY0K3rXUl0R6/s70goMhIloPdkC?=
 =?us-ascii?Q?C+6TINdzgk2edZ7TNLmwInoxo9d5EJM73obRblMZOJ+Lg1ocBZSaxfSKL7eL?=
 =?us-ascii?Q?ITh4N2SXAFTrHgD/eHpNmL5kXMUrd9bvdxVdjFL49UW62YWVzBXgvRXrWiU2?=
 =?us-ascii?Q?CWH1UWyq2RUNugc/T04etu0MeW8H1/SDjWdPGeO0pYk/VsAMvrVmfmOqJ0G2?=
 =?us-ascii?Q?TFPDRzPihnvxvEMt+2UhETRckhRxFvgCpxYb1+JkcE/zF+Uwlxy/p9ibTuty?=
 =?us-ascii?Q?0W+XYQ4v95sBgI83G84RR0wzGg9zVIAajoxulQg67rjhRZPZo6Gbh2sBYBWv?=
 =?us-ascii?Q?SikFuPYGa6Fd5xWTFntHKHp6UzYKznrM8BCTVl0DKzAp2a+IIpRNuWvAyxOs?=
 =?us-ascii?Q?eV86VPMKT02QqtFOrpfTcVreDEtVDmN+xF5y3l7tr57lC7/Q1YdZLx2nF2v8?=
 =?us-ascii?Q?ByI3l1f6w6SZQaqipiDD5R7+wfEZr9VtQb/pbBXC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00cf244-8c0e-4fb1-9705-08db10b3ad56
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:53:29.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryYHq17Chb8lJOFzukmGg3Vn5iB2Jz2at/PiJmfswI4xOswz+2hBk4hLDrIfCJYmgZ6XQrxYDMe6W6huFyommQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
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
simultaneously.  Look at LCDIF output port's remote port parents to
find all enabled first bridges.  Add an encoder for each found bridge
and attach the bridge to the encoder.  This is a preparation for
adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Improve warning message when ignoring invalid LCDIF OF endpoint ids.
  (Alexander)

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
index b5b9a8e273c6..f1f5caef390a 100644
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
+			dev_warn(dev, "ingoring invalid endpoint id %u\n", of_ep.id);
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
index d6009b353a16..c35d769f91dd 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -656,14 +656,6 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs = {
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
@@ -756,7 +748,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 					BIT(DRM_COLOR_YCBCR_BT2020);
 	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
-	struct drm_encoder *encoder = &lcdif->encoder;
 	struct drm_crtc *crtc = &lcdif->crtc;
 	int ret;
 
@@ -780,13 +771,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
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

