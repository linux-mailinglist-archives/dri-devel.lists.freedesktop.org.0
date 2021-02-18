Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817031E49D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49756E223;
	Thu, 18 Feb 2021 03:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3F6E223
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbiMmGKtT+F7y7ypjMDO6boksoTd6piRm6DVnd9vhWBAin1GW/gTjRo1HvZM3eErQbXAr0iKhJiiiesFKybmPvhHKzkeuD8XkydcLwGy5T8BznFJowv/LGy09d3J42FM4quINHcRAR6DzobBKFsq9VVoS0fcr+s2Md7uGjTcExOTu2pa74rvVwF+8K9xHowegza4K/nMDr4bn6TNMxr8gN+oE7mD6cvz/jotnl4F2cq0EGNjp0AvlXpeSFUor++WP3pZF0+Uf9CHvqDRJl9Jr6sFMd/ZSTkof0vQf51uvuFIktIwt1z5OrrSCbkxbrlvZ8o3/KnMHlx5+qK32FHZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ew4t8+IhhnAGQtqzCLPzoJ19nNOe0O5jMtxEDjdKOsc=;
 b=aOZvotlHp/+Mjb+p0LAOgvvfvZIjj2GNTvgs4kmVlPQbQkT6hWW7ysAeNtjSRxuVxdvCvIxS+x58pxOoJtOltvgyrZcDMDzyGij0pOFeJPYeZdaHd6jEjfm97XBFCvaxCR3zYlmS45UO0k6+/ewDCKuNVK1ahL2QHZZ70+gqSvjpyz1jPejPN+ohMhx2pmFZRW9etrM4WmWybEu0A8muCUdI/QzLAgkWZf6G2SxP0F0H+FgCc3H7dsbTQXOeDxAob1/VjtC8LYzoVRe06oiaPzjorLfHEdGJvWdUP1Cqk1Sw4lhGqp9XZE6S5Ttcb2Xf0dI2047bM7dhbif3kqHKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ew4t8+IhhnAGQtqzCLPzoJ19nNOe0O5jMtxEDjdKOsc=;
 b=Ku2m2DiuxkkiMFcTQ/yHW5nj7XvP1pZ/gce+T/kQ1Uc43odOwbwz2HO1ehMg5mkIRPufS6yn91qxPX9WWBke1/KagYu0ZorXB3LK9OyxtkLEHJH1U5IBZDAAH6Eba6hLatJ05gUfRFxow2JlPwGQchKODB0x+4ULrHs1zQ3gah0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:11 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 01/14] phy: Add LVDS configuration options
Date: Thu, 18 Feb 2021 11:41:42 +0800
Message-Id: <1613619715-28785-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06c3776e-2fd2-4984-b97c-08d8d3c0d99a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB342182F7C0C2DF45A931530998859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFfoXQJ1CXtN8oUiZXFREfUTdGK4TdL1qaIVK3k5VAdV+dLKEKRn/hL3AKqiIm75XaoDO2eKNv4ZchxBPZS0/ZDVgXGRPrCe2mwHz2aa75fvJD5H04S7s3Po/OnWR5wer3paPO2va2L4BJ4T6hS7PY/pVYQhPnuIqL1e5o7hRlM826XoMPsZiJzyfRjUMedeo+w7Tf2EL/m5EXmduzcjVNGyHYAuGX1oRD20zQ/sySU+Dkl1jCxd/k6s4beOFGpCeA3sA8g7I7MsXrwyagLly4E+ogD6uEVbnD/1zjYQqx/vnZkw7Q/LWZ8R+hWzFta+Q787vTHGfaG53cPahY3GrOGeyRoxDqY4atCUhP4pizyaWPhAlfxI269qgUMPnzHPXbbL27cMGEmd9FQD8ZYbvDck5Ama2pqMS5LOiXCkXVgw7ST8rHY49IoJvLSMwyz0ukP/+5j7wb+hc3wLV2Cqcx3HfcDyp877xrKXXnCfPyQL1VSWlooBDCOviWg+1sfqkVR90UA8A77Pgmz+3A6cnLOlmCRnMBCO+FBvf5NzI1SO/58scyX1RrLBUAznkOzDIE/qN6sKdGOceS21gPBK2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YOFOO12cWsni3rT6vJ2SHZQue5U7xOk6by+vA04pPLskPPrrgJK7FGjNlK0p?=
 =?us-ascii?Q?b7wDzJZ7NwUm3vETq8hZmrYIbl8Lkqe7HPBmWohuo1rrbjJ7EzeZav0BZMxC?=
 =?us-ascii?Q?No0YQllvAndsG6MbGFul+IEvnifw3/V6DFkwpNMXap0VZisUQnPO38FDRIF9?=
 =?us-ascii?Q?WtDAGuTDa/cwJ+t52kfEqH/zH7SZ8F1m7CxaU11D6Uoa/+3dnx+FzyIZH0O7?=
 =?us-ascii?Q?DOwIGvG6zuYsbuf0IRomFQrWNHT1rOfdKmctstn/DqOrmuSjijeNWYnIHFGb?=
 =?us-ascii?Q?RkfFfLNJg/3nNYIr/Qu4QYtBx6U7WLSykxJ/vHj5g16GLQgStl9C7gF6+VYL?=
 =?us-ascii?Q?fxMof9g2Qfkl3IcP8IbPHHem1tz+cS5XnGIHTKA4zEWGloP92wA8HBdiLiR6?=
 =?us-ascii?Q?ofPR3ZaTSj8NZC+k0kzZ8S5LlvGmCnQWyJaF33ZYtUv5U5zLJGnERkupCFBw?=
 =?us-ascii?Q?qqT1krir1a4a4HxrCxhAbS5S05mumxHLpqMAXiimRWydxW8UvTAuGGjOX8VS?=
 =?us-ascii?Q?/HwW/DNFlM4RlQCkJDLz7zE2GVoAh8h21L3Dy8kXufrgbAPr2+boFcfEt6GY?=
 =?us-ascii?Q?Ibza70SRPBwUw48WKR242ZfsZtNGitxhPL4Uk7gD4of4D+0ZZSXzhv3Sk98h?=
 =?us-ascii?Q?koY5WMXWXNNSmGClakr0EAHWFiV4TouxMFn9D2Ak5V+RufcCTT6VqDoxHHgc?=
 =?us-ascii?Q?Ma1ZIbVxUisd2WtuqXEOp4tUnVYlBlmQWFrYbPuX2uM4eJPBA3oktUiyIrxU?=
 =?us-ascii?Q?N9SEw3Jqcs71TUHy+CZorx54jvCrCWxrOnFoiI9rqyD+gfaKaHoIMakOQo4l?=
 =?us-ascii?Q?SrrcuqbX/nh16pwDiN2LSlyR/uxVNduBw9/CO3bDYyFcXQZSeC0F9xu7Qkb/?=
 =?us-ascii?Q?TvNbkhV+c2qBVpzHP+4P96UtYGiB4saBNm2fMK0Zo/ava3TpxKKVRAy9NYkE?=
 =?us-ascii?Q?TtbaBasQf7anRX/5kH3jVEKXmNiqGy6erlEukaZdvJ5m5sptbOaqCDivNMQq?=
 =?us-ascii?Q?N+8lMrJDhACWR9lNGCvogC/POzv13zQ1xb77BZmGOKpd30IjQbM5HZrx0uur?=
 =?us-ascii?Q?8Suop9c2HnYu5NhbVhu4+yzckQUUGMrXt5QNCAvd5HHDf47J47ztLMd34VGh?=
 =?us-ascii?Q?o4raMK1dI3eeUImhgdJuP+y4U/9RaMBvAXciGJVpF5nEls0XQg92FdOD6tUK?=
 =?us-ascii?Q?dg/WyFSFlkf4K5AZlZtEaZ66nxyyS8JPmwng9Y+vMTQpKtoYVtJBj6vl2xI4?=
 =?us-ascii?Q?PdppcrHw95S1X1k3dp7+BDoBesI9JEkwWPIn083qW4eQb9C2mWxLb4JGuaIV?=
 =?us-ascii?Q?CD+v/G4r/5hWe1xAnQ88DmUY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c3776e-2fd2-4984-b97c-08d8d3c0d99a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:11.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqEPqdpINFzAJjk/6x8WvltOx+iy19QyDr+Vuavqd/3fjS9SXWk/osTHNjtgsVkpr7us7HXEWTArPG6T7iwXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch allows LVDS PHYs to be configured through
the generic functions and through a custom structure
added to the generic union.

The parameters added here are based on common LVDS PHY
implementation practices.  The set of parameters
should cover all potential users.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 include/linux/phy/phy-lvds.h | 48 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  4 ++++
 2 files changed, 52 insertions(+)
 create mode 100644 include/linux/phy/phy-lvds.h

diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
new file mode 100644
index 00000000..1b5b9d6
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 NXP
+ */
+
+#ifndef __PHY_LVDS_H_
+#define __PHY_LVDS_H_
+
+/**
+ * struct phy_configure_opts_lvds - LVDS configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * LVDS phy.
+ */
+struct phy_configure_opts_lvds {
+	/**
+	 * @bits_per_lane_and_dclk_cycle:
+	 *
+	 * Number of bits per data lane and differential clock cycle.
+	 */
+	unsigned int bits_per_lane_and_dclk_cycle;
+
+	/**
+	 * @differential_clk_rate:
+	 *
+	 * Clock rate, in Hertz, of the LVDS differential clock.
+	 */
+	unsigned long differential_clk_rate;
+
+	/**
+	 * @lanes:
+	 *
+	 * Number of active, consecutive, data lanes, starting from
+	 * lane 0, used for the transmissions.
+	 */
+	unsigned int lanes;
+
+	/**
+	 * @is_slave:
+	 *
+	 * Boolean, true if the phy is a slave which works together
+	 * with a master phy to support dual link transmission,
+	 * otherwise a regular phy or a master phy.
+	 */
+	bool is_slave;
+};
+
+#endif /* __PHY_LVDS_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index e435bdb..d450b44 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -51,10 +52,13 @@ enum phy_mode {
  *		the MIPI_DPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
+ * @lvds:	Configuration set applicable for phys supporting
+ *		the LVDS phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_lvds		lvds;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
