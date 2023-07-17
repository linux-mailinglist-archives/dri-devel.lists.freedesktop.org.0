Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FA755DC8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2866F10E1F8;
	Mon, 17 Jul 2023 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2085.outbound.protection.outlook.com [40.107.6.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8210E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foFRzGAV2Rolz7e4cMiBkgD49wLtsr8oYZWKVqoD03+dgsQ5ViRQpcxV8ETFTok3nPugijsKYU8UUKs1qR5le4bpSyj2m3gtVEilhSvzVxH2YPvc64PCI9Uz/ZX7dATaNDcugx4g1c129DK3xKMQgaepLHuE8niVR1/ISGzAWjJ4RBbbLKyKurReEqPLuEhFndf26OayVw3Vwb8cOTmE8+9bf0HE1iBHjd6s+HJu93WyAwCTswgBRCacmhR23+t6Ne/Fc08YBC9XDlJREGH/ocSKOk9FmRBTHNiopbES/8qEuWI2JNQ9DkZDFl36v9w0X2Lrn3dggqLqtmB/aqY9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JodstHmgiu7wHelxOSqNRCconyWEo/2ieKC1lYgfdig=;
 b=cE3pbDqRgor76nYowsgls0VPqs5tspSQqd51mzH96XlhyVx5z+Z5I1rvBJnmC4fqJINInzKjNN7RkU5ucYnOEVz9A1xc98B1t3xuqUSLcD6Zld2ADab1Lfo43DhKx1s5Q+vVkvk2Hz1H/Xiy9qt6pocot343E3ZR5Gg9wkludFIDZaCvF/wX46R0Zq1trjkGZ0bx/BVT280CSHok+JKCcvOSTyKO+fSh6jR2huTBdUJh1k50N+ibfs7Gug5KIGKkN5H3Dk+73LJ8biiSEOLkDjKm3BPC9K4QNjurBv3CORUmsbJVKlAgmiCWDe8kpGZKv3tEAaPgYmLwk31dHgiFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JodstHmgiu7wHelxOSqNRCconyWEo/2ieKC1lYgfdig=;
 b=hd+GlxvBj6Ud3MhlwE7qGBk2wLgdCXjPbxrFEA89fbEKp8Og37aFtWLd5/+9V/Rfa3JhdtIXRw5zkj7JVDwwEXZiY/hi8l+MFRg5KawBpMQQjVs/LDnFssWZPS1+OC7RisrXYV3dPEKjHeWp2XaCvfhfmlGs3kT+cb07HBM+NKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8291.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 08:04:53 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:04:53 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 2/7] phy: Add HDMI configuration options
Date: Mon, 17 Jul 2023 16:03:48 +0800
Message-Id: <59e90f505664634125ce668b44629599d3d13276.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f6bf74-45aa-42da-b156-08db869c8047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmYyWSNVdHiz52JxMEdhqSqCV5bDp5uNwKNnUy5Mk0+4tgsmyrDx/5jZyVBt+sZJlvlKBjOqPOPG1gIKAi8BJc4r8NqEUvivuRZNHZUOeCk7KGItL1FpehR9fmii0wqoehmJWTzzPguSH82uYEkI8knQmqDXjWcrPdOPY5j/LBc1eY6hd7FGDyNQMrCzPSmUDXRi/wWwq//sOsas//CRdkoWZtPxbtYVRfrcMRNFRoAYMKEpEon4ohBKbBPnAgvEJ8cETnqh24jwFAtQ0laucyYBEjmM/G37tap/DW04W3vsUqvAvA7LcQQw6XcdbH/nx7Q2inXhdZqK9v1xYvZsrpnVJAlI1WFIKF3tiGdBt0lpQz78at1mzzQ+G5cEVNaMcooh3Ww/yr6ZFX7eRAV7UZ/TjXG/u3CKatFUxlz7Bwa/4bhfeoitjK6aflJIiJ/ngMWQi1jWQguAR7Cb6pLaspvr0ZZOf7WfmX57Z6xK6GXqJ/gZilywyGWX1nV4SXgJCGFGXJfPML0RWNRAKcrNUdGuERA1UMzj1SXUDPLz1ZW9HFdoES5GG7NTz53/Do2Z26HDCP+i60Q44uLc1hN9HBR1peOVKYZW4X7lowNaPCub6+ZHa9dHuA7Hl2YYiwN9KSGyHRRMfBnODS2TWmuTlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(4326008)(66476007)(66946007)(66556008)(5660300002)(36756003)(7416002)(8936002)(8676002)(38350700002)(38100700002)(921005)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ge7LHzIXV0ssfpiyIV0MJJZpVOQsz8iL+q77/zlHYMnloO8SqV2hzyulXgVZ?=
 =?us-ascii?Q?Cb9lQMVYmCxmlsnyYbZ7nMCOHmSwnkYhHbDZr6gc1LWaKbNRo/z8Gra1aYLG?=
 =?us-ascii?Q?izWL5fNniDzt4aaIVQy6SrLacg23H56Fy8Z5PJlOP2a8VVjfEZWTAAIR5IWR?=
 =?us-ascii?Q?4QFX0PnNI7HjW0Q547mKLIdBUnruJIkegdrmIXVBVt0JPIkRuK2nmRSH2nMF?=
 =?us-ascii?Q?T4ZWRFJ0AzC0zxAbZrA+wOPZZmPjfZMJHW1cPgmXF47bPt68DbM76rySxyf7?=
 =?us-ascii?Q?PLiNFFxpxvG/Iicbkry/4RjWKT4tNLNX3TMxjt88dq37ntYHdVLj0hyvQi+c?=
 =?us-ascii?Q?pLfgoieQNEkkSz8TvGnin9somShm3Su9/+KHnmJi0AOe1ooOPTfI3WJq6qm/?=
 =?us-ascii?Q?/SYwPrd2p6Ys9P2IF7JJzHzcCrkg2tZW0lsIVLMCaKjpForOyP2H4sVEynzq?=
 =?us-ascii?Q?eDTHD3p7k9R3Qk2Dvk8twkIbuhy1ufg1P+IpU+b72SZg6nIk8pv3JK+7pRQB?=
 =?us-ascii?Q?KQfVbuVwyGNMuXD71xO3Bw90gqGnB8+vU5+7wtKeHaqkjw0whbIBKVPiX2Mk?=
 =?us-ascii?Q?OmrUq7WlHF9uSGfG25hmp159/SBhdYcCioGpDFeyDDj/vaxMLU5i0hVGKJO/?=
 =?us-ascii?Q?xPKB2e4aAnc8FZqgckgOSUhP4ovbhF+WRV+Em6MdYJKXPrsoR2bDaohev240?=
 =?us-ascii?Q?fzx0rxcOzgl+uxUra5z6I+jJmTwrmR1JbRVBa3L6TiKCYnaQlAevkVBDefNc?=
 =?us-ascii?Q?c6QSjTVJ8wfopJ2xoSczY/78UamzB/D8nHmht8pclmbHLDcD/Cl1LNgKsiyG?=
 =?us-ascii?Q?AYmvhE9+z5zbRRHrqyuJSTwwFrYSJiUxzVRdnOuQMtGkFYLYGF6cAHrxfPAW?=
 =?us-ascii?Q?Z6pg+DEzr7oc0DrdjVFcLwzdyMZGEYP34D9jnTKrdL6EOrnyBf/YgUjWi49U?=
 =?us-ascii?Q?ycBgLTQvJnJZUdUu6uALJ0zBbhoroKEWaFVaBYzf/MDcSM+u4odoIWfrnLFM?=
 =?us-ascii?Q?Z9kJ3UYHmb6OrYH+iKDuTJY/ChaHCXVLRB0oyBUTccfl3On2bCotNTyHHlFF?=
 =?us-ascii?Q?som6FRGxRGz4Cf/scqOT9zTE+U+jmhVk/pPImss9iC+F2MTQfB32O4QgAH7L?=
 =?us-ascii?Q?GmJC46UaRavgAYYQaQKoHWF7zk1MN2imsYQkEzDVxFeLTOZcBcgX1KLAD3zd?=
 =?us-ascii?Q?OtsXPUY7//uuk6ifZe33GEGtVdSikYJYdwFCEupLdCbUCT89Sm4iyYGUAjjh?=
 =?us-ascii?Q?DrkdF1sBbOSrGK6k8yxYuVwvW0UmabPAEXzDc4QXztzq+fwmoSVVtgs61KVE?=
 =?us-ascii?Q?sKyDnYba4VlGebQbKYWSJwIztym7eh0NZeo7fUPWJd0XOJojIRTB/LXR3RWv?=
 =?us-ascii?Q?NQqvRfNFjJa4E1y1ldctiWlYvFpCSCa/zAOsE4rArUp2TE9+otS6eZaHWrQr?=
 =?us-ascii?Q?RKHiqx9kuLqNXXOUSSHfL5TdOixJOQUrvSbqIVWQpfTU5SAXfLauKqfCnEBn?=
 =?us-ascii?Q?YX9WBW4YE82ZfV82220/uhld9+2PzSi+QsZVOlZ0n4ZvCEeCm/fcrpA5dCrh?=
 =?us-ascii?Q?foPZotkPW5mONdvpm0QVEU0oYpNbFqAd4dvWfFmR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f6bf74-45aa-42da-b156-08db869c8047
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:04:52.9935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp0K7TiuD2Zdf3k4Zh0TQKnkNPugvVOd5hHM2cVhHf2F2mpQyy38FokRHQXJukhUs6jOfV75cvygaGYr69BCFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8291
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..b7de88e9090f
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+#include <linux/hdmi.h>
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate: Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f6d607ef0e80..94d489a8a163 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.34.1

