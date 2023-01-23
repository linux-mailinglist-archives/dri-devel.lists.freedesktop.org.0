Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D366677588
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEB810E30A;
	Mon, 23 Jan 2023 07:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2078.outbound.protection.outlook.com [40.107.8.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4410E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMc6WjGxETGl3yh/9Kvee12u12+ijxfMDHw4xeUvumPXr9AdJ4+wAj2MnBvyd9EWSpY/x1/bv4AETW8Kp1c4fLlXxHK8jVhZNYqEICjyKA7G2lCDZTf2riST6UW7lcTlTiVLTaFzwFhhtS4YLGdtl1X1NTqW3xc7wggzegnSTKj5XVkFW6D89Jh9l97XdRbejp6+OCI9UOD/2ByBkpX6CLILn0YaPz5TLL3rVRVO1i7J0FSBv26JD6faOI8E4mMkLILJ8DFjiiIcMJ/kS9pXVt3KqkEX1oEUsz+IeTNA+RgWXXX902WlR42XEfuoscxHl2PqtZbarHEnTqbMuM/L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbnLuoPnlJ0Wx7L17Iq3WkVVgA7nnZ11nj8wnZp2K+4=;
 b=U3EIaACOH1VgGHDqhDMJpb3vS3sz/3FpO++Z3Sket0RMrL+N9k1KBdT8QpX7IawHRUSut5xt7iUA8H9x0dPqoFJrTLXhSA2hKB3jBLqXy8NjAtGCRRjmAnt4pz4bl0UNpV0dsq9gEa4hQBKzXjuYRJokwzlL98Xkx7HEjYq/5NjEkVb/UB9LvlLPEcpb/B/fDDg3yIL6DpLedXqMShEsRdwqY7cyAmdsfostUmPs0XAGpXwww66UjeVYLkmdp/3e1KzsTMPIyVn5dKiB9JyOdl3bBSzXz+YkXiArI5FTk6N95RNT02EvN5/3gosnx8MM5jVcypqsaYyFH2DHMfr+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbnLuoPnlJ0Wx7L17Iq3WkVVgA7nnZ11nj8wnZp2K+4=;
 b=VPy7W8q7hkAiA+dBTUY9VN/05r3eQs1+5nfEltcT+XKLgjfLjKNXUpHjI7irpAZVQ2bgbXTlt9WFcn9R5hldICOXwS0rMw3fvPJoRhw47yWzkiptF6j8Dh1ftTRmtWMrtR2VLLZYm9Am8dP9LHEAy9/2ztLiRTqrdEVCDiOZyp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8184.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 07:22:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Mon, 23 Jan 2023
 07:22:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
Date: Mon, 23 Jan 2023 15:23:58 +0800
Message-Id: <20230123072358.1060670-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230123072358.1060670-1-victor.liu@nxp.com>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a88bf26-6d70-4c96-b846-08dafd12a54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSmechsuaEh5WoceZRbK0U7+kQE9jP1EgpaW4FCF3o5CqoDIQP2OPsOpbOi5IVRonVQl8Ab9/+fBCjoNNF2va8yb74hzovR8q/q39On/t1um+8EnYtlH2wpVGrsz0ROJTcSIjHRVxKH0W0ntI3PNSBbGZEn/sw+VCkMJa8w6/q+hAxhYIizTniFu1qmzKdfxj0chlSL8EIMUNn/BZK+vBoD2XeHstAepBY8yZJYbuH+xK4EdbOPna9uJlQGA1L+ZAPGkAwkxUSE1xHKmqnHNt98XBGlqx0G0L9gs6aR66DdVLRudtHE9ugieWz+iTq2ufcE9oQK+KlChK4x6UH3H3HDrVLo4Ix2GHII5sMKpsA0EVzN3b9JNVKh9lNAfgtL6bRWo5bhqJ7Z2Ljqdklxagy2XPojfLbnLTirUgFekjoHPYi0+6wokak+ohBxh0oLaQbPNUiqtIu28yeAtAbISBTxb5Qwc5xlTkvBs0u67Ls+HaGNt2ijD5FGFl2BaZzITI4olbtBlmaHcdw4lDAUWugnkMPmFJSWgdB2Ow3PMitQLJeLHnlNcpwt5fupDKhED70JtQXOsygU76d7Ec3JpEojBcV0u6yH1PVMB93EEhN0mZ9BRYVB8OQ/VnAw5pXfct+N6J/zbvN70aRJbV8RlrVoheom/Zv6Q6RMb97wkUV+M51jKpq1S75S/HTOIIbkY6klybt/xBGX8vSTx5Tr4UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(36756003)(86362001)(7416002)(5660300002)(8936002)(2906002)(30864003)(4326008)(83380400001)(38100700002)(38350700002)(41300700001)(6486002)(478600001)(52116002)(8676002)(186003)(26005)(6512007)(6506007)(1076003)(316002)(66946007)(66556008)(2616005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uOf5ufIZlTkN5VXQBfNOJT1aNHg+gK49lyEXUZuoqKXQCwzIBSw6sCmOpYE2?=
 =?us-ascii?Q?3/Sleq0uyq89y3gqIkCY+tK6ub2PZztoNM6mzHGE+imD1RAID6p7TrKyrFvx?=
 =?us-ascii?Q?BVq/9Hx/RzmYaeIsDK002garWqTkhd9hcL1KWm8Rrk+P5bEamhOTqvFghixi?=
 =?us-ascii?Q?avMdhqPcyQU7DxauK8g/k0q+Tfa9hoCc6k1WY7EsHv1sVPX4pD+Txrlx4cbk?=
 =?us-ascii?Q?UaJN5DQr5Yjkdof0Mcc0fXnN2qEEXJ7y5V42CO5aYS7V4gNXd1tKYCdZfwu3?=
 =?us-ascii?Q?sXgUF4kr1OYFPS3tEpQWcdZbvI/M9QC5MExTuw3hp9JiJq2LEBYMotzb/QKm?=
 =?us-ascii?Q?d95QP6ZsUTQXETLkGyzy8xSITR/BLf3WWYhJGVNrUqiHahaVpaOMZiYZmt+q?=
 =?us-ascii?Q?SjqC1kzYNdOARoQ3/+xHZNbsQCuoJ7JCdJpFV/JC0C+mcLB26JtERrkwptB9?=
 =?us-ascii?Q?tRp7cHe993jP+p8E4eQAG7qVeNPEJUdPxek8CYR++yFhxb0fFMg8j9RC33GH?=
 =?us-ascii?Q?ONriDxLmwExrTM2TYVm866/At29UGamQE1T/ZIITU6s1HqGYZMbgTSHoW/Ea?=
 =?us-ascii?Q?bXhk1ch7EXcbQD0cBNBZdusCle+m2ZOmGykCbfDiamFqtoYOdKhcVt2fqqtz?=
 =?us-ascii?Q?npNiYOsMpEJ7zDJo8chqzz+JSSCn3kJhpUV9528ZGFOXBrBZYwJA2+LfC71M?=
 =?us-ascii?Q?qi+5PPdSrecdsVgjPoZYTYrgpqjqy+5lI/B0M6dO7h1Y/vaj1vk5ru8aGa/9?=
 =?us-ascii?Q?ndJq8Pjth5CxadgPQHjopc4a5CpQcjrUFnWqw37hLfEUSuo6oTyEgNNGKZPH?=
 =?us-ascii?Q?E7qM6ou6FUX8QOozS6hiUsqFrDz3C0Bv8O7Vu9qOT4Dk1UBqVBx1REFqYuJZ?=
 =?us-ascii?Q?aYE9DzEjZl2NqguvM0Rr/cz9ic9PxfREgzH7it4/Ph76enunYDWR1xUSHNda?=
 =?us-ascii?Q?DzoAhcquOXqHIwuFmcxdqAkfWbDC+ijzut1NKP8Y/VTwQFaxdRauT9PaabyE?=
 =?us-ascii?Q?YZTbpbTwV/0r2YgAWlYJ601mXDsB1UHf21efLk7qxasMcurzxrk9Fc2tl+PQ?=
 =?us-ascii?Q?YHFumJWMp45tLtoMiM/cCIpb/RelBcTB0TMBSxQlVK3fLG1gzQAGg8wpSO9o?=
 =?us-ascii?Q?BWt0SZY6Cux8hQLA7MAwb5JXqKhWtVVnhuIUXugW/n6CPVdNUxi1pXTAA7ai?=
 =?us-ascii?Q?+OWwFG8hzgtj4mlctGTnSNenh634zsxtWpZQOQPvcLMoltRA9lhP6oemgTjH?=
 =?us-ascii?Q?4qFmCO1FBvhwB2zUPribrNnWk6oV1srAr4JLZDUR3wBuyE93Wf0N5Yeo8L5L?=
 =?us-ascii?Q?EQlniOwPg0Z2/uYwiGpuYuC6Yc0NVYfvR3bYEJT91B+30Q2eu3gEPxz+45Ym?=
 =?us-ascii?Q?5OCI5yGaEnGYEygQ+KjWlkkLDO8+Mp+ZKhv1fu/06ks4bTbewoLUBg5lcDiu?=
 =?us-ascii?Q?I8sR3R35ZDhZPnT3wrVQnq+tzLFlJwJ8vHYA8563fk8nFeCrp5AkIQfRgBAV?=
 =?us-ascii?Q?md2T5DzsdG/LBXanQG8lLIQ25jDLXqTM0WxdMyfWWo/MZJC6x4boKG+4K+5k?=
 =?us-ascii?Q?WOV1+BZ44v1yz7xfn+OorZ+JiFzsBuDUiqdFl0P3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a88bf26-6d70-4c96-b846-08dafd12a54f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 07:22:55.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P90wEpn1qgNLp3KF8Oep27DfWeha+gLUyivR5bvHL2TAGTuGybY1AJKDAMBk2I4LAVTapX6A92sBLy/LpowHLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8184
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCDIF embedded in i.MX93 SoC is essentially the same to those
in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
controller through LCDIF cross line pattern(controlled by mediamix
blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
parallel display(also through mediamix blk-ctrl), so add multiple
encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
LCDIF DRM driver and find a bridge to attach the relevant encoder's
chain when needed.  While at it, derive lcdif_crtc_state structure
from drm_crtc_state structure to introduce bus_format and bus_flags
states so that the next downstream bridges may use consistent bus
format and bus flags.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c |  73 +++++++++--
 drivers/gpu/drm/mxsfb/lcdif_drv.h |   6 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 206 ++++++++++++++++++++----------
 3 files changed, 208 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index cc2ceb301b96..4d41f6b6eb14 100644
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
@@ -38,21 +41,70 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
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
-
-	lcdif->bridge = bridge;
+	for_each_endpoint_of_node(dev->of_node, ep) {
+		struct device_node *remote;
+		struct of_endpoint of_ep;
+		struct drm_encoder *encoder;
+
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote || !of_device_is_available(remote)) {
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
+
+		lcdif->bridges[of_ep.id] = bridge;
+	}
 
 	return 0;
 }
@@ -199,6 +251,7 @@ static const struct drm_driver lcdif_driver = {
 
 static const struct of_device_id lcdif_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-lcdif" },
+	{ .compatible = "fsl,imx93-lcdif" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h b/drivers/gpu/drm/mxsfb/lcdif_drv.h
index 6cdba6e20c02..64459c3904e8 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
@@ -14,6 +14,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_plane.h>
 
+#define MAX_DISPLAYS	3
+
 struct clk;
 
 struct lcdif_drm_private {
@@ -30,8 +32,8 @@ struct lcdif_drm_private {
 		/* i.MXRT does support overlay planes, add them here. */
 	} planes;
 	struct drm_crtc			crtc;
-	struct drm_encoder		encoder;
-	struct drm_bridge		*bridge;
+	struct drm_encoder		encoders[MAX_DISPLAYS];
+	struct drm_bridge		*bridges[MAX_DISPLAYS];
 };
 
 static inline struct lcdif_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 262bc43b1079..ba36447ed900 100644
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
@@ -30,6 +31,18 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
 
+struct lcdif_crtc_state {
+	struct drm_crtc_state	base;
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
@@ -385,48 +398,109 @@ static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
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
-	if (lcdif->bridge && lcdif->bridge->timings)
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
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_connector_state *connector_state;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge;
+	u32 bus_format, bus_flags;
+	bool format_set = false, flags_set = false;
+	int ret, i;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
 		return -EINVAL;
 
-	return drm_atomic_add_affected_planes(state, crtc);
+	ret = drm_atomic_add_affected_planes(state, crtc);
+	if (ret)
+		return ret;
+
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
+		/*
+		 * Use bridge's input bus format if possible, otherwise use
+		 * MEDIA_BUS_FMT_FIXED.
+		 */
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
+	}
+
+	return 0;
 }
 
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -458,44 +532,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
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
-	u32 bus_format = 0;
 	dma_addr_t paddr;
 
-	/* If there is a bridge attached to the LCDIF, use its bus format */
-	if (lcdif->bridge) {
-		bridge_state =
-			drm_atomic_get_new_bridge_state(state,
-							lcdif->bridge);
-		if (!bridge_state)
-			bus_format = MEDIA_BUS_FMT_FIXED;
-		else
-			bus_format = bridge_state->input_bus_cfg.format;
-
-		if (bus_format == MEDIA_BUS_FMT_FIXED) {
-			dev_warn_once(drm->dev,
-				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-		}
-	}
-
-	/* If all else fails, default to RGB888_1X24 */
-	if (!bus_format)
-		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
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
@@ -529,6 +580,46 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
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
@@ -557,24 +648,16 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
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
@@ -667,7 +750,6 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
 					BIT(DRM_COLOR_YCBCR_BT2020);
 	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
-	struct drm_encoder *encoder = &lcdif->encoder;
 	struct drm_crtc *crtc = &lcdif->crtc;
 	int ret;
 
@@ -691,13 +773,7 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
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

