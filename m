Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8726FDA95
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50BF10E46F;
	Wed, 10 May 2023 09:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2059.outbound.protection.outlook.com [40.107.8.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334110E46F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgrTOzlDl4MasWXrsKJqY3vdC/zBIo3aA6kynBHM7mx0CRMzFuZ57hGiwvUJHw/EMY96wmUjSRG71eAaYE7aq4Und9r2vMCntXN9Ydd0xz2u/9o0qVECj1uQecgYaNalEDTPCnJOHHAbYNyQ5ucCRr/+imDro9jqkJJBW0Lb6e1NbCb8xeoGwMxuM++jZVVrWFW/FHz6jACaU2wp65QyqiBi8l4Eb5Sfk7EkIPJhB7u3d9aowqFsVg+o6EC5skt27qGfWtzY3uMN6BmxVh31OfEPPijXKTxRV1dvJNjp7kN0CDp2RbnNIktToRUYKgKJUGNWSfGD478NyXBDCYjuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNHD8g2U4xOqngqkCoSvDlg1+SRNCmEVGTfMxaJUeOQ=;
 b=YA0yBx9bsaBfP2+aqN1lIhLqg/HCh+xE/aK7Ku+I/013cjcjERMmi8ePMXqjHDDzL2uw0DOA4CzdbbTMaWucSohuXf2Ot1UL7K8Gso3E8DytIUE+KW+AH/ZTPqBJ3yAYjbTCH5RypY6c6xErcAQ3ulKz1klFJQP05Q8LcS+3pLrjtImdjFmNsKHS05ziZVgUCR1xWfsBOTJv4vGk7dZZXosvWiM4WafEE0GmF5SrdMJK4a2e+HBsCXDjUV1RQzt2rtvi1VW6FwjCbbcv8ZDhwrbHLHlPAWBUHZVozJQFGFXuaD8b1XhB0uT87DVOCENFLgn2Avl6/3b6Jd9EaSDAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNHD8g2U4xOqngqkCoSvDlg1+SRNCmEVGTfMxaJUeOQ=;
 b=WIEMN1Hvg2eyhtnMX2QGDCQ/KBCiADzRFwHnSTHNJGxxluIUBDVeZqOmE1pLhPxmPaGg3soAQHZk6qEdkDYr/o9NSU9989bsUUFzZtG3O9/KTSfBjllQqYUe21qddp5fp1AKOBAJOB0Lln7UqzPKlUZx8O5iWQd/om0EcZ1DEyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8161.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 09:21:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:21:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/6] drm: lcdif: Add multiple encoders and first bridges
 support
Date: Wed, 10 May 2023 17:24:49 +0800
Message-Id: <20230510092450.4024730-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230510092450.4024730-1-victor.liu@nxp.com>
References: <20230510092450.4024730-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: ca58f142-217e-4744-b771-08db5137dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQ/cymh3J3vBi3MrpyEtPwVbvwq0in8SzATNfvP53uQTDOmxp/Bch9Pn/RElm8KCQZoeEVsZp6ozP/9rx7YU/ihlCrUTLDtZZtWnRU0VXqYVP3mXi3WxmAujlIA0Wod0104qIVufj+e+TpV94dnofjldfqQ7jSycW/nsTr7Jsr/ZIupkA/xPRU+uY5A7ar3jiyq56DdFLXSenn9HCHraYwWkCTtZrsTS2uUPin5YCvgrqkswJLNuJYInQqyNpXc29Fj329MwWN34ZJf5OXcHyjn1aD+zBpRjG9aAPdGDd6F+pOlVoctpWTtScpdcSViLIj17wTcADGT1BvZUlh7YUujsGTP4uNURO6Al96mee2wPHyOFT3QaCP/BZhhBam1ZC1HiCA54w0bzp5rsG9t55AGZg16nTPnqBmF9+qqSlSF0hLlpflrLGDpk9UsRMOHLk02AtSxdifrRWdrVwt9w6uGcEy7UOpgWNkCNAqOC0CGPmLs9OvOJsXG+QMCl7jspWaDW6XrQz5KWVH3v9F8FpqUKnklSXFe8z/QYrPyaDcioXMjSd70cfrNMcWfmL0F6MFjNJDTpFSnZOb22ciFTIL726Z6wJJl6R/wFGi+tZMePuApRby8E6eJv3r03/joK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(66946007)(66476007)(66556008)(83380400001)(2616005)(38100700002)(38350700002)(86362001)(6666004)(52116002)(6486002)(1076003)(186003)(36756003)(26005)(6512007)(478600001)(6506007)(2906002)(316002)(4326008)(8936002)(8676002)(7416002)(41300700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLMQxDaxKjSlQjVN8UQqsmmCw4wjzEGTC8u+t0B4v2Ea2n2GfMSlIYXKV7xF?=
 =?us-ascii?Q?pXGtN+ahMkwFlq9S85lSCrQwTgqBi/xTKFUIylxK4hhbutGAHWR302afrJRB?=
 =?us-ascii?Q?IC8+M/U4IDEWCnFRk3W8dvmQLYXmBsiYjNBT+O7ZbUpkCbl5tfLNDJAoB0kW?=
 =?us-ascii?Q?PRaY2PIKHKHELadHbSeFSskcZyFzaC79DWnPnu+WgeK2gglKj8ISeU2zQavq?=
 =?us-ascii?Q?CHgNHJGyh3oamzGQrBt14/W6RO80pug38RzcyscUi9nwr1j08m7r9gIfo1TO?=
 =?us-ascii?Q?zL0drEHVgiJ0Dpx97YR4424C3vCdDO+ozU64R/TZhtW7TQNGq3SDJ2ZOdhTv?=
 =?us-ascii?Q?fZMMbLAYnEie3tpuikZ3lTSvjNvdwyHgW+x5ZtIY2ioUn3n+Mw2/VWZ3PRPH?=
 =?us-ascii?Q?XRADXc1rKQeNgPgnuM0vQwxqWC3YUnWZeZgE7QQGO/1EbbtV6tEK5x3n0xrX?=
 =?us-ascii?Q?zc0f1lPuoAQN9LeS2RxontJb7+OO/sJUr2Sf6gFeBY2Gxfv4AGfMtoSvMP1Q?=
 =?us-ascii?Q?g9GD7sPQchIob9qoeHOltdNH/bJ4RdxaiImGMDsqlV+62HhNC/eNPecRpnuv?=
 =?us-ascii?Q?F7ahKgNRJFWNxkBk/FviGSr5WA3tEGHoXcPby1fFDzMmYXLkKH/Ao8zBhrz8?=
 =?us-ascii?Q?3uLrh1hbyuzoqQRfvRyrmEMwtTy3fnrqvejx6X+c1qZATKXEEIaP11GTNc+4?=
 =?us-ascii?Q?cBTgd7/VYMKiSXiL1JCXQWgz8BLP1hvoWVGwFdrcpiMYCfLTg2leZHSORd5k?=
 =?us-ascii?Q?O3b2aEiN6lVvDvNgEF0dIOig+SniCT7nO8tPyOqOCJaLH3nSHR9qnUCwkEq8?=
 =?us-ascii?Q?5Ptlrj29kL/CS7JcShqcJb1Gno8cXKpdKpBpJjfCx9uBhFMuP/sKqKjmyvuY?=
 =?us-ascii?Q?3jU9e0Fa3bacjq63a+GWoHdjZX1ItycC6FkSGK7BeyZHuouzhtziHLLQpeuw?=
 =?us-ascii?Q?lh36+FssNZwvQjGj1Ou22NAY1dcfLM/kSecBMIDTxT9k5i+sFztXel5e8xW6?=
 =?us-ascii?Q?GbII7ubnaF9BIo3szbhie/eaDyV9Tr96oW4tOpfwpFLiUHBe63tcJNWuKnYl?=
 =?us-ascii?Q?mjlfzAPdzSzOGyg2vwo9HfYpry5cY9FKY/C5+2x6zLqrWpA6HxQSB8XcojGt?=
 =?us-ascii?Q?wvnGMUPlFCVBXviZ9RzGw1e8Dgdjvh/E5tEuL+Ycx7kBGyOtQsNgrxHOcFgw?=
 =?us-ascii?Q?F+z9Ibr2lJ4VbCzPFGzB/W0eryjdOjX7CXAgxdlimi3Ow5MhefDIAr8Vp9hC?=
 =?us-ascii?Q?fp+9EWypfSmEdx6Q5ciNTP5Q37rPSAKo5L6YQfa/uCyEIrNh2unMmMvIzV32?=
 =?us-ascii?Q?cHYrFA8HaNmvvpay7GHuvQDhQjgj4TOF41tOcqrTtMifValLftFOqRPUn49a?=
 =?us-ascii?Q?YYDX1vEZqyMNMFxhGuSS/gz8OtlYaqnXYRsn7On5TZ9MR63C6JUIcVKLJJN4?=
 =?us-ascii?Q?WkioPye0S2Xkl8Q9dqgboLyLcO7RHKsIe4MtY7YQ6Q6lgsEPic3xpFqdnwyu?=
 =?us-ascii?Q?N8bRRD/lbJJrm6re0AtedibPOFp7RMLy4sljf7wHMA5H2Jmi86NGjSQU933q?=
 =?us-ascii?Q?BYSRcH7hSTqD6Y0+dMBcpZQCnkYtSuFdF5JLqLvH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca58f142-217e-4744-b771-08db5137dfb2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:21:02.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnfdQ1ioq1k0DzHQ8THjB7QDsidylcKqBYMJUcWXnSmo+Z88fjMqW15++3AhXjzV+LyvPnFKetxilZpUR6/OAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8161
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

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Look at LCDIF output port's remote port parents to
find all enabled first bridges.  Add an encoder for each found bridge
and attach the bridge to the encoder.  This is a preparation for
adding i.MX93 LCDIF support.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Drop MAX_DISPLAYS macro. (Marek)
* Drop the encoder member in struct lcdif_drm_private.
* Drop endpoint id check.
* Allocate encoders by calling devm_kzalloc().

v4->v5:
* Rebase upon v6.4-rc1 and resolve a trivial conflict.
* Add Alexander's A-b and T-b tags.

v3->v4:
* Improve warning message when ignoring invalid LCDIF OF endpoint ids.
  (Alexander)

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
* Drop unneeded 'bridges' member from lcdif_drm_private structure.

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 70 +++++++++++++++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_drv.h |  2 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
 3 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e816f87828fb..dc85498b81cd 100644
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
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -38,19 +41,70 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
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
+		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
+		if (IS_ERR(bridge)) {
+			of_node_put(ep);
+			return dev_err_probe(dev, PTR_ERR(bridge),
+					     "Failed to get bridge for endpoint%u\n",
+					     of_ep.id);
+		}
+
+		encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+		if (!encoder) {
+			dev_err(dev, "Failed to allocate encoder for endpoint%u\n",
+				of_ep.id);
+			of_node_put(ep);
+			return -ENOMEM;
+		}
+
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
index aa6d099a1897..61483a4e058d 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -11,7 +11,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_encoder.h>
 #include <drm/drm_plane.h>
 
 struct clk;
@@ -30,7 +29,6 @@ struct lcdif_drm_private {
 		/* i.MXRT does support overlay planes, add them here. */
 	} planes;
 	struct drm_crtc			crtc;
-	struct drm_encoder		encoder;
 };
 
 static inline struct lcdif_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e13382beb53e..2541d2de4e45 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -659,14 +659,6 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs = {
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
@@ -759,7 +751,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 					BIT(DRM_COLOR_YCBCR_BT2020);
 	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
-	struct drm_encoder *encoder = &lcdif->encoder;
 	struct drm_crtc *crtc = &lcdif->crtc;
 	int ret;
 
@@ -783,13 +774,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
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

