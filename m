Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DB6F9F46
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FCC10E0D8;
	Mon,  8 May 2023 05:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1534210E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt/6ePcmQetRnNtdxuRpSxOhwsvDzKLEba3GpaEUlxlHDrcGwcpQsKYRASu0MO9weuCwYF1rmuOoXTPSIKWi24jwuDoteybgu5bDVvskNZsgN2gRWd3S/ToYjCp54Mi0CDl4H/a7Hi5cUqDXhiP9Rb8gDSp4wupTRj0I21PFQBAkj2NAY/wOdc3hgK0z8c/45NS6+A+ZwtjIOZfbmL3EWOV2oFbbgFcet+566XzLnlJSQu+Sbv7b+4QU3HMy97jGfPN7FdZq3nneEsjl2a0zsWqMT/wM6TgNKAm7GF54rxUl3974XU6+Vkckr9OhiDzsdQ2tPQtIl4T0z6HVtLb76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brKg1su96r3gljeJtfAE0Sts6yWeMD3v1YApnhix4hQ=;
 b=WboaJpFJzDu5/yzfv7r3UJ2uCIx7zbPzQmRuWd+we7KHmssobfzfrKfEHUbJ/9VnfY5wYIW/Jg4nYAcYn5SS3PK5ysC6RfWf+6AsPP4gdkxN/VCTCyQm9+yiEcVZKiWuZUM+hP6ZYsy7+zm0ZsEAns1G6mffdTXSyjS8TaJXFnFjc5XFgusCYaXX8/aH9L2mNNSBhggg0uPIIttRTe02xIGY0zkvMVtumJ4tP1bNOd/uuQlojz2X8Ma50OPnESnsMgm+umn6DSgvyh/V/ZjgVC6/znO6Cr51xlLzAAs+yW24A3sgKa0qEVDXdY/TSeghLxn9AUX3jkdhy/oypBvdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brKg1su96r3gljeJtfAE0Sts6yWeMD3v1YApnhix4hQ=;
 b=dZp1s/RzL979cT++52Wf2Ls+6Rt/zw/EnLAMZ9oGPOmxx6AZBE1OeHPfKIQU4BhlMh3vAcoi0VnGt4cDLlwkPVdiLNe4/8HBg+Dog8e3APUa3gdmxuTKHBWcd+OQasNqrQ27Vg3zloCKiJ4a8wkaNBfSHW8EZGqM2IRNeAsOW9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/6] drm: lcdif: Add multiple encoders and first bridges
 support
Date: Mon,  8 May 2023 13:57:39 +0800
Message-Id: <20230508055740.635256-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b8acfe0-db52-4f2c-8878-08db4f888eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGT4JHH+US0jg2+q6HrAch6Kn9VGapISagJiRBnbQPBWyEJ26DmxQXFsjH+Du3ms5HEcMKj+Eeia4BrVAXiITp4fKUt6yTgL8iz7ViCF6V7lXkTeXxMSsJYKaoV3aO9e+sjFkmIzbOwbyzBvORjE8v+Pr9TL9J3kjj4xGsu1R/2xpXX7b02bmUIbNnIQNvmWRGCf4A89Mz1voQsqJBl8+nBZGV56b3neD2kvv88NHBaoybpRKVmsWrw4Cnw3ZrrkptxiXW3lnpUsbrwLq5eGr7/MmeP55nzcJBG20y6lyZvM+jxLGonOp8VjpoQ3GmYMC0WZ/EBbeUi2mta1WzzxQL58lE1dR86U7TjpkRt1Lz1y5Kyr8CLW6XqdPe+3o0rVEwECkLUvFVWms4XGN4P5CGQggaFSq+14boG3VskwWSZ2g3XXGOEc7CNkbbQ3BkWXnAUflFTvInRxzxlnDRDT2DuNENbsuD1rrYW5TnlU+2kZOKDQc8hkgA06HEvvpxQXy28taw00JVJ51ex6pW9mgr8vWI4IP+1qI+HE73XDAa97PB07yfib7n0r+YmaXkr3zf+qC20hx6MyHKQYgyeNYVOkctV5V4vGnNzyCU6N4RsTSZZ9O7HbmDANCb42oGCM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r0uwCVJNMMff2yb8W/j/l2+EpR0j/Fjx/YfJ+o0kM5K9c92ac5EgfdKoP7za?=
 =?us-ascii?Q?BArf18LXHKP4aDe256fZyzEJFvXRTqNsV2OC68I7k7c9x1yTgHOFtf8K0K5E?=
 =?us-ascii?Q?kC2xE01szH0EZ3+vodoLXjxROS6vGQAIVkg3vmb0GkHC//qa3dUa0gr4fk/6?=
 =?us-ascii?Q?v84R1Sv5eOHpj673UVGDJgmQHmB9gXLRsfxzEBdFJ8n9GBAhCRXcVsQgdpk8?=
 =?us-ascii?Q?U7aA/F8Awd/VHenysD6GVrptyuajUBoyoVvxmwGo5tP7YZY8WQUneF319jWS?=
 =?us-ascii?Q?uZZ+T6UwqPlw51xedXdlqp8VBUFa4T2zEeHUUaosyHm5LdTpAou65Y5k+98U?=
 =?us-ascii?Q?0K9rQbj9QHj8fOtmTYHDFxrJhlLIQSuexDX8fyndLfKTB0rA79C+fXVo2/XT?=
 =?us-ascii?Q?EQ0gQlrlNjt5mllrhj7bO0ydkttYkuBMHji7O3V5hOcIGIj04fo8B867GJpk?=
 =?us-ascii?Q?DosbdSaDmUVy9oeVV4U7ruardgYgRr+DhZCSIcy9JYknMpo5t/UZwtdvvWyB?=
 =?us-ascii?Q?79oUNElha7132E5U9zatadk1ronepYxFrVKYLcbw20ZXATCwHN2gDNu9imTP?=
 =?us-ascii?Q?PCpIjzOOiKrbXNJlcatSppnQLnWblC9teRUCzyd4oAZGoW+yQNcTyWR97yH9?=
 =?us-ascii?Q?EFJkLcRlfkbY3pHrs5+cpXB9RzWSPqz/e1wUDa2ji74bDU6Aa7hwePdl0kUt?=
 =?us-ascii?Q?3KursYqvDfsoO4eaw5oS8nCV/7WgFMdaUUI++Fr028v2m63QZKNzvpyB4pPS?=
 =?us-ascii?Q?NyXyKVC/CiFt0K0cjUtKajxJqi+8cU3HrxmB5zsJhxS6ZIT5qd8c844EIGvC?=
 =?us-ascii?Q?ArCQaWFxuWiJo3BQlxV6nYfGMRMgpT5TNsUAiKhMEpi9KDTLtBVrVtc91Wqw?=
 =?us-ascii?Q?9yBAdR7hWc4bYpVQIAc09LYfyAAMyQLJhKaQ0yw7EUm85XkiTKLJl73zGyoV?=
 =?us-ascii?Q?K8Znuu+WhFFLnF7ihNKP4KGCKXTz0T5J2Ra/I0up11xtER7nDikF+/rHsdtP?=
 =?us-ascii?Q?8Q1toXJTgufcpxQu8H58SNWA8LRwJeChrGjsKRhxz9Bvk5b2EGyH9ZLaETNS?=
 =?us-ascii?Q?Ntb/63jR5/9ZStKNI8uVw6iy5HDHltTTgAaGnsh2f7rbI3PsWfMLINqA6eay?=
 =?us-ascii?Q?xQO68zmciva9yQZ1cVWOP6AWq2UVLZ3k0CJyU/Fh0fSKCzhBYkqPsTtpNP3r?=
 =?us-ascii?Q?T9SaaG4Ndln7fLxcMhNcXhQ+8ZGZJ66o7XVPmEbjwQ8ezpX4j0khTuPidOfZ?=
 =?us-ascii?Q?x2adltFC4HvqGhp8FHWQj9wMHvtlcA9jPST9LhhkWrAqIF3WnOC1pTEmGc6I?=
 =?us-ascii?Q?xLnVACVTqm8WUfxml2Cycoa8HCkLexmTY0YLwiUpEVrXyS+2nxJlY0hY0hB6?=
 =?us-ascii?Q?y0Z3FV+6NQL9q9gRwWRqjdgry1ZSuZ9yY+7Crj+t/P1Utis8m08jJaBYzb5x?=
 =?us-ascii?Q?3wvrPVSbRTKwZryeXDo5AZDYMAlgO8pr5rQUJQUx2ZDqdpBaiUaLQX2dwpxk?=
 =?us-ascii?Q?qQM1y0Fg736CqhIWOCuDYD5mt8SecQGcCNa1aqSg/4XNQZEQrUQa8jmtTPYN?=
 =?us-ascii?Q?DJl3ad063O7hrrLetWnoC3lCUk2QZJywOar3KZTb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8acfe0-db52-4f2c-8878-08db4f888eec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:33.6882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2l3afQYj5UZg5vmF8tA2OnQmWIhLb6t3lEk8GVjhfPhdMKwvprw8cBiYFkvg7K8hkzzV3A9WpMmp1hkO0iZTg==
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

The single LCDIF embedded in i.MX93 SoC may drive multiple displays
simultaneously.  Look at LCDIF output port's remote port parents to
find all enabled first bridges.  Add an encoder for each found bridge
and attach the bridge to the encoder.  This is a preparation for
adding i.MX93 LCDIF support.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 68 +++++++++++++++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
 3 files changed, 66 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e816f87828fb..cf27b63b1899 100644
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

