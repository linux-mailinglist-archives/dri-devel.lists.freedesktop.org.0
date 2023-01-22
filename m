Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD031676B8B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 09:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275110E182;
	Sun, 22 Jan 2023 08:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C545010E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 08:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFbZR7/F7bf/x1+Rh0PQIzC99WCb05Tf6BEQxLPsjhdU7ZEhJ/MAtXVEcchEH34E9qJIE14eXKv4Q8lBzVGTHcOcNZMfLX7JowzPuXzFjzpNa+nbN5mpmH0UlMzMJAgZ4BSexPV4hwPC5Aspy1WEEZXkSSv8/XfTxABoL95JuEwsMqJ5w1OvBOIGKcliel4r6ojYumUJnsuHbIfg79+NYXViE8OBC5oe/eSFThz0d68EVzoE762Embb86B1E2WtZanXqZauCWA5vqBl4HUdIeCzFVEouHUsXwjGkRbF56gIfUCTMjm4aC7UXhkuO4aOudBbSa8bCzK3SXTZ/CpWSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvLbG+hbL6g1HhCNIWNGSPTOY5YT0XGU0XYWIUgSODw=;
 b=nz+jQ0TXH9o9ForbfL3KAmbkzuFJFgiAIA4NSl6mZdX6VHO1PnTdf171PMCJ8HTyiT5jC/WJTOk2hqBRC0GJIB1nt+MAMCUaRTRx9dN51IVDoEOwH8XlKEIoySW8BEAW2qALOkTXjD1O/tO9Ti5t9MBm0lkPlDVw0aFedUOeS0Bh6WnBtTxtUD4quTn0Pll1kMdukgXXwQL4O5hyjzgIclrSBi4fP4fV0C+sIeqkQhHXVGyGtbjwsROHOun0FpCyRRdJ8P8PB7U6mMnsnJbQUDVgN4tmMunE1DHsdyd5XdWtliVJlGQrBHfkwQG+2SYSPddTzdxfUOJEq4aA37y1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvLbG+hbL6g1HhCNIWNGSPTOY5YT0XGU0XYWIUgSODw=;
 b=Y5DA/2LouYn2rd84NXz4fY0Kn7eSvOBCk8KSvdS7Aq8aches1ZjyGupvAx54i27mU/JFGtXZCYXSiu72i4E8iRnHaJzZTFI4+yz85lb8E9C+q0lureT05L9ByO5LIvLh/JIBBJskzoPbCBGcBDGyuiCCbaYYimA3n6IW74ZuDkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Sun, 22 Jan
 2023 08:13:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 08:13:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Date: Sun, 22 Jan 2023 16:14:29 +0800
Message-Id: <20230122081429.694574-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230122081429.694574-1-victor.liu@nxp.com>
References: <20230122081429.694574-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bb2beb-c05c-45a3-1e78-08dafc5088f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZUpGzjSFetzW8lCtR3Lz5DB0zBtyCfoXkAmf7H2LlV9GaWNz0hVuK3l/ci3i5jdAEJT8UnPeIrp/50kvf3sTaoXGsjmrHmxfSYVcJP42Obe6r0joICn89TNMKKArpF7ywcpPVzcJZWz/SqGpjEgKzX36egYTqPdTzT1ZeIeuSB8maoDUQ1tsfXi1HgHpJgKyMPeQsa4jt1JIW1zKkQwx43dpJiJKY4G0zP8UR+QJqegd2tFrspXbTT51pRNEetNAg8N4gPxQIEfaj0h61v8kVRK916qjnDQRNktLijRGv1clbgf5L7MrrjOsYHbCOEiVC8f6jtAkI0unjSNlvj/qY9VSWepBr05UP01Fkup1HoqXnChHkMqWTxTbbniueK2q/heMY0sNIdcGOP2Tb81Cjh6kC6LTw0W6sL88sajAm2QVl37ogNmQx7c+2bPVonghZ7ar8PKmNb7QBAPwDoJLTj+dH3oQuRYMRHpUMdOARP5EmyGnFuPR0U1h9aJFoWcyC5YiIrJfvISSW5z7l4dN4J9twZnzwSDJIS9mSF8EoWSgN3D5yjU4UoKxnojRSJNN1r+a3sG+0Fl0KBrThAflOAM9hBMyhXyaBnttpPz7rG7YKA4aagUCV7vDWbrqzpvWF+1grpfOZ4o9v+WOgVp+qvlQR/hMKBwVE8hd8BHkhOgkQoH2SnfgEmg1XunlvmPIdCze/yQow77DiVorDcz/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(186003)(2906002)(6486002)(6506007)(6512007)(2616005)(316002)(26005)(478600001)(36756003)(52116002)(38100700002)(38350700002)(86362001)(1076003)(83380400001)(41300700001)(4326008)(7416002)(5660300002)(8936002)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPpgNXks5B9oPT5lxEcV0RQqHAVe1IpCXW2Bl6zQ6cThMzpYUEtcCEeMBGND?=
 =?us-ascii?Q?M2BICa17Prslfyb+PJ1iwAr1v+r7RJUR813BZbmICoHL4TYDoL8+Sj1OOtUo?=
 =?us-ascii?Q?AfM0jBGr5+Ektm7YkZowd28MjkH8Ukl7divTYi4jSkuC8vofpv6J8QFLf3Zl?=
 =?us-ascii?Q?7CvfFiVCgKn5YzR5jKNghqzHbvt8ORawUcp0no7w3F5pULv00WZorM6Rwef5?=
 =?us-ascii?Q?qN/FUXHNksAhhcIskWrJQ9CT0hPOz0vjwLG8gdHpRAaDuPdAr8/pKs8A3WdB?=
 =?us-ascii?Q?3U241xJlDK+/kV6/54dOyAapdjUjzIx94/aGhYICm5O6FccsMFISWg8s2I8S?=
 =?us-ascii?Q?9h8gCRM1E5HD7inYp/CPMnqWwPt9uWhaC6Miq61RUT+r7w3Q6MjdHAY3zGsQ?=
 =?us-ascii?Q?qXIwCa7jqC3UCuDa4CoTs2sNplUm+citliWqR+uyV03zgOQ1CV+AuiKLHNDm?=
 =?us-ascii?Q?B6xVqtHgutumIT0rFs4tDp1IeG1tyi+36SOmBCGm0KOqEfIMKfQqfO86XREU?=
 =?us-ascii?Q?G2qCr1te6gDEbT3z7p5X8u8UY0/+mbi2FLE+jcxAW+j+9k8jHjLA2hx7HBDx?=
 =?us-ascii?Q?JqmP60l5XqYOpVHuGpzCMS8ZNDvmYufIfqQMTlaXgsXG66DHnSHuOCoIBn0Y?=
 =?us-ascii?Q?KhC1H0BY9DCbpnDtgnHpGPsHVriu+5es/Tu7bfUgolOpGuFeD8I1CJNXQbVa?=
 =?us-ascii?Q?SMZXN4inUEISTGx0NWvC6IS0ryS81bumUvsO9YqCka/NLe589CFwRhh0TQsi?=
 =?us-ascii?Q?cjceKl0KkUvRYExuJCxQYnpW1ep/WoasXVRijnNPuv3F6RezTG37MyEycqGV?=
 =?us-ascii?Q?VDFH5Q1jbuw9RFRJhvVoa8PZHLTbsZkSlXkHRuDBJ/h6U8hH+4I43R+JM16V?=
 =?us-ascii?Q?CmxY3kP9Dbm7jUsKuncQAcL5E/yl7aRcs8xC+QYUCXPslxObYeuZXMCLXqB7?=
 =?us-ascii?Q?qA2Zk+uN1AMUixYi5xgJqxcKSyHExj6qGxsKrN+oANi/uZXAsPiSbUniIt8S?=
 =?us-ascii?Q?NgRi9ZHPMpC+QXozSc+VkMjSfVqRuLLLOxRFTsl+E3Rj4Tci9cj4GXhrGTjq?=
 =?us-ascii?Q?e9/sE7nd8S5kKhN0sha9I8Oh/JWwekrR8dikNa0zz2UQv3cvz18+juTd2ftS?=
 =?us-ascii?Q?dI339lpOd0nLzm9gyfo+/pjGOasEdKrNPlBfkegkHy8QsEDYXDdXfgad//wN?=
 =?us-ascii?Q?RLMG+bon5tKhNMecI0WfK/6tqJRSk82LRvjVdOml4J5+Nt6t2MMWxAz5eXA0?=
 =?us-ascii?Q?NeRF1l57WzEY4G2kH6kL60TfzJYsMEAIMLb7elZvbxivgD1jvMGNyW5TILN+?=
 =?us-ascii?Q?l6TmrXK2Y2QFeWgH67ap+GzT3ic/o21eZKZ+eVN41MgqaVooTnnI0OQ5V5b6?=
 =?us-ascii?Q?UZYcmUDrtlGsi3OlINBtBAaUoaGcoJHqc0Ez/w4v8hDd5dzhYR/v+Zw0HOb/?=
 =?us-ascii?Q?rzLa/1RNjChp9F8hkGa6VafRySJgftJZnkxn1hYKSgvhU17uDBAsY51R9udL?=
 =?us-ascii?Q?3xRcc31Gkqu91xiu0XzEs9zPPj8UdG1vuj6OZMW+tQe561cZ1eFrCaM7nnd+?=
 =?us-ascii?Q?wfZrEsj5wAXh2vt1xNNteIosIIE0QVFLw6Ey0VI5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bb2beb-c05c-45a3-1e78-08dafc5088f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 08:13:25.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gm2ZYoa3c684CSE9rGPnBVI5g11H0ucI/cSKX3Dky5j+JNRM83SxYFnODfMH9LcxU6khqmZr9fryzcNyCSjlmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491
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
 robh+dt@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
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
 drivers/gpu/drm/bridge/fsl-ldb.c | 53 ++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index f9e0f8d99268..7da2b2dbc7cb 100644
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
@@ -158,12 +181,12 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
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
@@ -172,7 +195,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	if (fsl_ldb->lvds_dual_link)
 		reg |= LVDS_CTRL_CH1_EN;
 
-	regmap_write(fsl_ldb->regmap, LVDS_CTRL, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -180,9 +203,14 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
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
@@ -248,6 +276,10 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (!fsl_ldb)
 		return -ENOMEM;
 
+	fsl_ldb->devdata = of_device_get_match_data(dev);
+	if (!fsl_ldb->devdata)
+		return -EINVAL;
+
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
@@ -306,7 +338,10 @@ static int fsl_ldb_remove(struct platform_device *pdev)
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

