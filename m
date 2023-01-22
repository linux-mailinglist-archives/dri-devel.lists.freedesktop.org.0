Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7356676CC0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 13:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238C210E0BD;
	Sun, 22 Jan 2023 12:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870C510E0BD
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 12:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxQmC9irTLJ6oaabsia0gmqMoiGtyOwEXyc3J5Lp/4elmWrldN/z7cfsmN2VBQ/xDSfCRA7ONjSP7n/nku123i+y4NQ4HfOjQGUbQz1TP2/im1l2azdPdwQ++pnc21yLPuOV6kdxvDtGcUoQMrL+/cHBlmGyo3VinDuql1yWzBdWxtAoGFnAvzBwG4YqrPV4Asg07GJKXnUiaZ2QhsalZurdwDFvMf2xe5NS+viQGMFv98OfcjN6/fR7EX3svUUtvm3ZX9SnRmKtkVHAxdHk2Fo71y8A16VRDdQiAa/+SVRA/zQWy3wsqV6SAACSvmu6hd7Nyb/vE7By6sIdRH1bZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHUFVYqL03WIsm3S5aJiqGert3WPnmhlt885p1b82G8=;
 b=NhzjypLeqqu0vqjwNALe9QMeYPI7L3dH4IZz5rHXwMFzsk3tspBMmZ3vCt8eeNYteS8SYEY79d9jcXlk7sL8wLIdoeVsHuWfRSMmWrMK5S01pOKw4iNcO92janDXqzebt0xFTUEzwlR42gtJ3slMwQeDStb8I0sUMIrjn+GZ2rZBMwrH7sCxfM0TtcE7CytiRsSgwGMVm7ccUdZU/wluuUBooZZ643z5QwAva6Jq+bqaUD/bLIEO+WFNt+z8BACKg/3E/+92A5F1zg+nW3Bwru9HuCwPN0kJzmHF+ABFKGQHM2+dRVqHYfNv9HlRcKPFKf7jrK5F2y8+e+ezsr7Fig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHUFVYqL03WIsm3S5aJiqGert3WPnmhlt885p1b82G8=;
 b=Z0wXgXhsLK0v4s9Iqt/aCTcg+2+hMSsnF4FCUZPjul8H8IK1QQZ+VFoQVkkf4njUcz+aTBZWFvSRTBqLeUhfUeceJgo43nvfJ8wRSeOUAdiZoiDpkoliXt8faHd29kJhmj7GmCNGfgsPM/+9orFFcyW9JR1STkfAo/35XWK/0bA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9388.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Sun, 22 Jan
 2023 12:17:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 12:17:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Date: Sun, 22 Jan 2023 20:18:36 +0800
Message-Id: <20230122121836.778195-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230122121836.778195-1-victor.liu@nxp.com>
References: <20230122121836.778195-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0247.apcprd06.prod.outlook.com
 (2603:1096:4:ac::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 34788f76-3afc-473b-7337-08dafc72a7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhpZtzGmSwPXna2V4hnSV0zLpkZOGKtQZWQseA1OhGjcvWkpIZwTZ5+GKdi2vCj6P90jFhasZlf0WHJnxS95wyUi+7cw9I5D90/ooGwpg1Lw/hZ9MTFqa++WJ2yVGER02g68F2fcQHixAGamGiC3weQSNxhOiBBzgSS/BIAu70XjYLoqsH8Mt9ibVWTqfVJHQLdDV4BNMx1yfuI2qMP+G52GJQ31LBEjdVJb+6fhDALKP5WsYd4OA6p8pZRwensA7e0M4gmVo+t1KBEdh6sCUUtJgRc0neWTi/WS073fLslDBd9N44l/aDTHbigAYaj8oJuvRR1GX++O03pekBUV0zND7ce5vEDnKcDk5r1KiwJLfu+BpC1zIsC/PCG4XKvyuSROXSbEN8VZ2mQVhbBj70kVjSPoYcitHez9RPJVLyWgmaZYeJ5tMtOK8q3vrceKVcepcDWw7gdXF4kGOBUP8Lc0xvmnoqUOlhdqoLVzskcnh/3LIv9iaOv5a5eC6zN+PmPc7yqv0FFG1x28I/CtvX7enhrvxzbSNjHX+O0s8ZiW8IYWp/XhK/sTNdDmqZZYvohDnA5LQrsF1nE+4V2v+9toI70XwVy702ScIXFvN4BnvPqjDmnIacA4kOp9nnS7vq5d66a6yh1qE/1UtSyTcK8vO1Sg7KxtCWq72u3o1ccDXUV/ia4bdB/bmgaLYx5xFcoJiWGAtiqfPmI5l449Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(6506007)(478600001)(1076003)(26005)(186003)(36756003)(6666004)(6512007)(52116002)(6486002)(2616005)(86362001)(38350700002)(38100700002)(83380400001)(8936002)(4326008)(66556008)(7416002)(316002)(66946007)(5660300002)(41300700001)(8676002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVhFSY99pbv4gs0D1QO+9pMTik4uKY4CsLR3tuo4Cvoeh+elRhTPoum8+9Tp?=
 =?us-ascii?Q?x4D+xX9hKuXQRMenkIDr9ZyprjSz5e9MsuarLyITVT+yU7OSM9iwVJxSs2nC?=
 =?us-ascii?Q?hpFm/PCXK3s/9TpznxsdQVMdke+v4qcQCuhU5u+IornvcJw+btVMeBExzpbK?=
 =?us-ascii?Q?6Xzrb/QAvjlPL8T1Q1pNxXwTL2BdetoV9ULF9O9jpDsnGz+kXAdN6zwZbJx1?=
 =?us-ascii?Q?45E7Nx8tmiDP/i4C1R28de+LP7/A50hfKCTLspw5wKTjFVqCdcgOOhefqNzi?=
 =?us-ascii?Q?/QNB9jbNhLTPWQ8WaElaqaNG177AkTWkWHRv2a1uUC7QF1vAl82BlfetP/Bk?=
 =?us-ascii?Q?bQcYGGSvhf5Yg0b/PxYr/cwBNB3+w0fT16eBazPqKIamXukIUxdzzs8IwHIA?=
 =?us-ascii?Q?mcozpWWw5XBw7QJi0Xz2fidGcHpWp++WDDxRbDweCdtdeu+9wHWquHxUJOAD?=
 =?us-ascii?Q?9cZgm7Ax+7AOO1Mm3jknCsRBbfbIUmG64SGCe6S8SpbVFUq4iZPQurFLEJoF?=
 =?us-ascii?Q?iAMsD528oqtH64QfRMSvd7JbomA2KgWATNDwN2tFCAcQCF5OYJuAR2KuAXVP?=
 =?us-ascii?Q?I5eqpFPN26I+UQMb9LbelGtyh7o87faNXh4BrRKW3+6ElPxKCI0WyJkqELOe?=
 =?us-ascii?Q?NrOVkLS/ZHGdJOvafH/nZlNwIdcISN3h3CqD16Bx9QNEwRYzX6CYEfWTtjz+?=
 =?us-ascii?Q?vLGyeOUEHYou21bM2jcOBB/E4BbJxFRQN92ko4pZP8YpYIpp7ZfXoa9pYLlE?=
 =?us-ascii?Q?yAqi/VL8kJ5xYNYZ5lseAg+HLHt/oRJkFsnoaj93m/52XR+KwGC9dvYyce8F?=
 =?us-ascii?Q?TJiugUtGTqODn65MMMxKiViQioq49LMXyrvNy+mtDNZ7ZYeyZPceUDgACjeF?=
 =?us-ascii?Q?/ZYGPxwo8BC4K+LymqoJv1L39ZPMAhPiYWPU/rkpANhqzntdT5Vo8lkd9hNR?=
 =?us-ascii?Q?vtHuevQ69kUe2iD8OTkNed3/tY16x9jGe6dNL4GotutAWytgEWew0a5SE9z9?=
 =?us-ascii?Q?enGX7t+NlZFZ2kYoZgpD5oRktAM4FlIIF4MPSsRJ/BMTbzC7z+YPKLsFMqf2?=
 =?us-ascii?Q?6esJU1MQXBA3VSdPas76fUq6ncemp6z/4zStFLKlCHdmL4gVjLuR98FwOB0O?=
 =?us-ascii?Q?6R/JMYUI/KZOoiN9J8zAWx5yw9MktPTZ9ovAJQjdfY+vfNu+fhTg54GPguFn?=
 =?us-ascii?Q?DcXWSAyHiq+p1eJIe6jKT2WHDr1YDu0yFeDhoSuSG24m852hICl4VFELDYT7?=
 =?us-ascii?Q?nmQiD4fsWlkwSv37zn0WBfLHcA5p3QpoUl4iRtpPHrSgjeGUJUq7ujKb8G/r?=
 =?us-ascii?Q?LaF/SvKlYlCRFy15fl0/4BTBHwiCI44E6kBWsxGXr2at71RsB0NBOca1eQev?=
 =?us-ascii?Q?L35XeTZuUPETUNQ2QJVkH8+C5zpb4NUB6SxRsHcyKtHrTMF+Kgi5W8Q/VA+X?=
 =?us-ascii?Q?7av13kx9IrtDrX52gkJhVjEHApBiNZV5Z/Kxso01MscXtnoPxdZu7WiekA/B?=
 =?us-ascii?Q?JCNsFLnJKirOxIoaAaQybBaDUCgsTitweQQCWLARmm/An7LBshz8J11OUWTZ?=
 =?us-ascii?Q?GNjaMoTUWF5cbcCJUA0h0ije5BxW2IJ8QUr77s63?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34788f76-3afc-473b-7337-08dafc72a7a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 12:17:39.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQoti55TjdIHGshVWyzifB2AuG6aKpZmy4TcOZEgK2hfqjUCnzdFSx42rcxFmJwPEaFSrVYGy2Mq1MtPdljAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9388
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
Cc: marex@denx.de, neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same to i.MX8mp LDB, i.MX93 LDB is controlled by mediamix blk-ctrl
through LDB_CTRL and LVDS_CTRL registers.  i.MX93 LDB supports only
one LVDS channel(channel 0) and it's LVDS_CTRL register bit1 is used
as LVDS_EN instead of CH1_EN.  Add i.MX93 LDB support in the existing
i.MX8mp LDB bridge driver by adding i.MX93 LDB compatible string and
device data(to reflect different register offsets and LVDS_CTRL register
bit1 definition).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/fsl-ldb.c | 53 ++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 9bcba8fc57e7..6ad63ac7367c 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -18,7 +18,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
-#define LDB_CTRL				0x5c
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
 #define LDB_CTRL_CH1_ENABLE			BIT(2)
@@ -35,9 +34,9 @@
 #define LDB_CTRL_ASYNC_FIFO_ENABLE		BIT(24)
 #define LDB_CTRL_ASYNC_FIFO_THRESHOLD_MASK	GENMASK(27, 25)
 
-#define LVDS_CTRL				0x128
 #define LVDS_CTRL_CH0_EN			BIT(0)
 #define LVDS_CTRL_CH1_EN			BIT(1)
+#define LVDS_CTRL_LVDS_EN			BIT(1)
 #define LVDS_CTRL_VBG_EN			BIT(2)
 #define LVDS_CTRL_HS_EN				BIT(3)
 #define LVDS_CTRL_PRE_EMPH_EN			BIT(4)
@@ -52,6 +51,29 @@
 #define LVDS_CTRL_VBG_ADJ(n)			(((n) & 0x7) << 17)
 #define LVDS_CTRL_VBG_ADJ_MASK			GENMASK(19, 17)
 
+enum fsl_ldb_devtype {
+	IMX8MP_LDB,
+	IMX93_LDB,
+};
+
+struct fsl_ldb_devdata {
+	u32 ldb_ctrl;
+	u32 lvds_ctrl;
+	bool lvds_en_bit;
+};
+
+static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
+	[IMX8MP_LDB] = {
+		.ldb_ctrl = 0x5c,
+		.lvds_ctrl = 0x128,
+	},
+	[IMX93_LDB] = {
+		.ldb_ctrl = 0x20,
+		.lvds_ctrl = 0x24,
+		.lvds_en_bit = true,
+	},
+};
+
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
@@ -59,6 +81,7 @@ struct fsl_ldb {
 	struct clk *clk;
 	struct regmap *regmap;
 	bool lvds_dual_link;
+	const struct fsl_ldb_devdata *devdata;
 };
 
 static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
@@ -173,12 +196,12 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 			reg |= LDB_CTRL_DI1_VSYNC_POLARITY;
 	}
 
-	regmap_write(fsl_ldb->regmap, LDB_CTRL, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
 
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
-	regmap_write(fsl_ldb->regmap, LVDS_CTRL, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
 	usleep_range(15, 20);
@@ -187,7 +210,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	if (fsl_ldb->lvds_dual_link)
 		reg |= LVDS_CTRL_CH1_EN;
 
-	regmap_write(fsl_ldb->regmap, LVDS_CTRL, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -195,9 +218,14 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	/* Stop both channels. */
-	regmap_write(fsl_ldb->regmap, LVDS_CTRL, 0);
-	regmap_write(fsl_ldb->regmap, LDB_CTRL, 0);
+	/* Stop channel(s). */
+	if (fsl_ldb->devdata->lvds_en_bit)
+		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
+		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
+			     LVDS_CTRL_LVDS_EN);
+	else
+		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
 }
@@ -263,6 +291,10 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (!fsl_ldb)
 		return -ENOMEM;
 
+	fsl_ldb->devdata = of_device_get_match_data(dev);
+	if (!fsl_ldb->devdata)
+		return -EINVAL;
+
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
@@ -321,7 +353,10 @@ static int fsl_ldb_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id fsl_ldb_match[] = {
-	{ .compatible = "fsl,imx8mp-ldb", },
+	{ .compatible = "fsl,imx8mp-ldb",
+	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
+	{ .compatible = "fsl,imx93-ldb",
+	  .data = &fsl_ldb_devdata[IMX93_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);
-- 
2.37.1

