Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADFF506177
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE4B10E186;
	Tue, 19 Apr 2022 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D7210E186
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+HCX+u4AxWM9SdQEN7TPGMZvsvs3EzV6IIMdw/f6ISA08cJ/y89+fX/1k18Q9QJGXTWwG9AJAcfg16fcK7Fcy9Zwss08xI3G/D0dpi0UFSr6Z7QVV947VRHn3YowOOOJdl22W+VWFssjtVEX7vKmqjpjVdvBSZl+v72xAefcJ5qC9YfSbGcrnaOG54OuCR00z9cd5bJ5PKSWSaCr5LiqU62puHgC274/3gjX+0OQrvjjBafliHth4LBxlYNvq8ZN2EOJ8Mn+E42V2TzWcW7sgGCsc1a7fcmNCVtjrTCTD2NblaykHH5Unlrin0m8CS6iURvhshPHXLsKwQeaqwzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zikVNYi3cS+FrIsX3tOfjPXYjapqrG9gbDqBXBxuQPQ=;
 b=eD6iU9wHDlJS8W6q+lagTNRVg+TkPcajCKPWrshoaab1b5XUaLUoGviWa3V2nFDH6wIHwM5XNizIGAlqxwpnFCAepVZBgcK5fnC4+DK4jJMfHW+PsDaGuqM6YfXxT0ChhjJ8C2vn+4rKIeP5ewLNZYtKEyB8jBpM9dsIjToEk0C7UjFm89BdAzutyNcxa060NAXFaU03ET9kmZrRO0cchKOGRFFHnxsw8YxjvYgS2seZ899oh9Nscpk+E5k+Voi2b7ot48vV0Jz7HqS4srO2+OHncZvFms9PTOffXlAnkuux9lJVhnrgMyefL6BHE2yUaZPJxEr0glGidBdqVBrFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zikVNYi3cS+FrIsX3tOfjPXYjapqrG9gbDqBXBxuQPQ=;
 b=AOhFs3fFlRFlIu14lBGBqyi7ChPAZG9hQPsd6N0g3ydteIWhyjjY1umVCTBOE+7IJIAXIGbYIy5H/JFOIy1vYzpxD0OFrIPH6sAWvHXh6fqaWQplwrhiuXvzoTeqn6JmeRX2izfOe3N3qvksY8t8RzLqZGTcobmQGtYXnoDyZTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 2/5] phy: Add LVDS configuration options
Date: Tue, 19 Apr 2022 09:08:49 +0800
Message-Id: <20220419010852.452169-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
References: <20220419010852.452169-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 382e2425-80bd-482b-d915-08da21a0f61a
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB329188B4CA4785ADADD12D0798F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rEIucyih/0UqZg3TZ/BE1bbJBtFS9/bJOT80Nm/IgAbns5mKHTaYr4s70vLnuaG+akElLKx0xtJtW0Y9d8sltGanikNK9w561QuekUExjBglbLeha7CKq3QKqngW/BzLFewJo1+XmP+jzBiuHy7aaOOCB5LOez9v/u4ftAfmCCzve2liWBcarf5TBM6C4/n5AMAYv7y/cWUnOACxi4xnU4pEP5C7y19k7qz35MYM/KRivcIUDc4/ztC9q2uWzw6w1h2ZC1UxriY8p8V63oLHe5UF57renTviVLdfkiOZ+3+nzNLCBhaWa1RYwYCP++EvkOf8XO7EAHCh0QxsqNNllIvSVaURezg8xAiuWfATgZaqKwhuYcFxvpq7BeN2mwHOvu17RUy1dfCKcahvwnOq+lm8vRDftv+E0hYVLqnEOm8jUxBuRMG247XJSdr3+yvWLQOtCOPXJQmlJCWHK03leOqO0qoUlxiB4jJPI1HjmGK83NyhNO4CDxgRUZSz+sA75aCTRayYFLxnF7W02TwcY/oEmahZdNjoOcYNv/SiPYprQutpzUiae9/MegRwffQSijbjX5696uVUFe1KTK8WJThqg81K2ilNQk7YfsOYpFoAQO7WqFGMYelOByLnN2aXnXKe+JWhmLdTVh7q7VlYk/bbNSMxtMvx2o6CaP8iNFhD4TdDM7zuCfobqHCGCiDARhx86kjeny3JO6g/CbZaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(86362001)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mdpiAyV7BO6TVzJ8AUCngKK92OL6vdd1J6qz59LCkHYCnxSUzHR8R9RL7hKL?=
 =?us-ascii?Q?9j3zJ55F+7quTHRG7d5J25mAayMsoZDSJxKEkm9tN8nAXMvx17xpPIal0cMc?=
 =?us-ascii?Q?KhX+ZV5CthCdaue1ml2fCqfx3kC0Pncsr42qNSkzw5eH6935BhBd1n7kusCm?=
 =?us-ascii?Q?djaneAfV5cBypHNNk+/deeHcg+KjjqWbOclGttKSLjcJe+G8M+f7vEpvScuX?=
 =?us-ascii?Q?HMRE1ekNb2Fdf56FT9BjDv9VTJ+jtu+8YQei/FjWlGevFbY54vsbuI+DHIig?=
 =?us-ascii?Q?DsvKiJ/B1KHFOBvoZoz1ReG2IFkeGmE0Jcb+xgNyK5UdMeTy/KDIbo1ayg5n?=
 =?us-ascii?Q?ivepsuLppb6nqhUECGYLSUxCaYPwArwbbQVSI34PM6CgEXRvZY1wiyb9H5eY?=
 =?us-ascii?Q?Idj305+WhjM+sJtqY2VnAAGy40vv82KRioDYqNr0R6MYZfnZDlpagQgE+dbj?=
 =?us-ascii?Q?pWjUuj1plfkxYrCF8pCzUOygfxGmMfBq4aKFj+DiCNWeoti9sSa+HVjwvZdV?=
 =?us-ascii?Q?UTZgCq1mTxW80tAPfZeKxvAl6ApODfC24bdlfD/xGtI7I69OF5uUcdSmar0u?=
 =?us-ascii?Q?qbyZgYkSbQ2DYG2MVRDJ/k3OP+NcilUyJT2xKrNpQ+laa2zSdSVZk5Yp99gW?=
 =?us-ascii?Q?4y2uC8PJj8WdH8Z8okoGDsZdrpV+StUJRPDdEnp+t2BOCmi0TbyOH3G9iVVr?=
 =?us-ascii?Q?L2LcGxuVdREhUGBqlGu9NmWz0YSPQghPeWchDm1V0zJTQ6YiqFt1KV4CzFNS?=
 =?us-ascii?Q?+0jbSHfHgqDfAgcP28G8EYYiPZSKseAcaPvy+0Wc8KlUs2JSpKWwr2eYN93r?=
 =?us-ascii?Q?DTTkCotNjyP295wSEaDE/21ojp0bY43yuxTJtijmqKMU+8BumrtRWmSWazfE?=
 =?us-ascii?Q?GhZKv/TEKMTMDHr44VIldxFUo51orI2dPN3U+8SjIX1OSXhCNm8C6GYAaknc?=
 =?us-ascii?Q?kk8ZX+lFFyMpdekq3DWzUDmh2kqI8z0vixSQd+gl9Xvi/qZZm4FXe8o3Cy9v?=
 =?us-ascii?Q?RjQNqtTsbhAplZKVgw3bx1gD+sYIc34tpN1sZGCVDu/wRvL1FZjDNdpEST+B?=
 =?us-ascii?Q?AwbECDTAq6dHmc6I1GPEhnGKr+lK22ERnftQpp6hQyZTENkddgx+xOtjNjGn?=
 =?us-ascii?Q?+ttZnrkeyecK/rZzhjIQ0VroZ5CYnvJ9bhQB+xweL/b7bjFqabRArk5QVjUA?=
 =?us-ascii?Q?ZLM4g+moBGsYS6rWplYjWb9yk5qFssf7zc3aKzRD7tptej0GsPMjmqfZhoyA?=
 =?us-ascii?Q?YXIrhmaWOmWz/TJiEy/ZHb3ql+SE5SfVEvew6Nfe3SW1sUWVJdawN9uPtRqG?=
 =?us-ascii?Q?Yjf4rNv4eQzyAmUMAlKdharqCM5YO2Se2JEIJectTqPh8i/mFXO5pQvnAvUM?=
 =?us-ascii?Q?Du81XZrebm6HN4ah3JIO0hf3ChqIEhzfuk77/4ZGWGsyyOJ2viIUQ9cXS3pS?=
 =?us-ascii?Q?sj7HkPILkk6xNom6xRr+SWYx/hO0DJFX68/9s3J8uIp7dyN/+XbGbxgbmGwg?=
 =?us-ascii?Q?TiYvQNtfIdfAE+LGidOznPty7oB3P/jmvw/QQrQ1J0YJJhlBGusuCYK6ARNQ?=
 =?us-ascii?Q?DPZsn7d0gDpzwYky9cTwT11pHcuWunXe6xfIvkupJABiHrNtWw576aN/p7gl?=
 =?us-ascii?Q?fvr455CysUhLCEsJCSM0TlP3ZvEFP6V/7L9y8SI+xWL1TReyTd93ycLtPGnt?=
 =?us-ascii?Q?Cmcnwlp9PWnoTvxNjVVgll8TO/dTFOGPHZwvPdu85RsaKlI2AOSyoBGnzX/f?=
 =?us-ascii?Q?XQzrKP+Wjw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382e2425-80bd-482b-d915-08da21a0f61a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:23.6284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duWNk1GP3LcN+pSd2XYyk3E640VGcsT6mASYGcOjswO0HQBW41zsGbcpesGgd8BQVskmr6q935GfFxVwdedLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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
v7->v8:
* Trivial kernel doc style fix - add '*'.

v6->v7:
* Update the year of copyright.
* Better variable explanation for bits_per_lane_and_dclk_cycle.

v5->v6:
* Rebase upon v5.17-rc1.

v4->v5:
* Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
* Trivial tweaks.
* Drop Robert's R-b tag.

v3->v4:
* Add Robert's R-b tag.

v2->v3:
* No change.

v1->v2:
* No change.

 include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  4 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/linux/phy/phy-lvds.h

diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
new file mode 100644
index 000000000000..09931d080a6d
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020,2022 NXP
+ */
+
+#ifndef __PHY_LVDS_H_
+#define __PHY_LVDS_H_
+
+/**
+ * struct phy_configure_opts_lvds - LVDS configuration set
+ * @bits_per_lane_and_dclk_cycle:	Number of bits per lane per differential
+ *					clock cycle.
+ * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
+ *					differential clock.
+ * @lanes:				Number of active, consecutive,
+ *					data lanes, starting from lane 0,
+ *					used for the transmissions.
+ * @is_slave:				Boolean, true if the phy is a slave
+ *					which works together with a master
+ *					phy to support dual link transmission,
+ *					otherwise a regular phy or a master phy.
+ *
+ * This structure is used to represent the configuration state of a LVDS phy.
+ */
+struct phy_configure_opts_lvds {
+	unsigned int	bits_per_lane_and_dclk_cycle;
+	unsigned long	differential_clk_rate;
+	unsigned int	lanes;
+	bool		is_slave;
+};
+
+#endif /* __PHY_LVDS_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f3286f4cd306..b1413757fcc3 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -57,10 +58,13 @@ enum phy_media {
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
2.25.1

