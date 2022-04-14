Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A421650065C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FBA11209F;
	Thu, 14 Apr 2022 06:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30073.outbound.protection.outlook.com [40.107.3.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66C2112098
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htlAUFN0r8TyI8nr38Q+tD64D98q0bHehrNJOo1kERyx4c2ajmNK80E4GaCR1/siYEpsLkKMgJBBxklQ/orRb3jSEbsGkGTZWGFJ4nmKYx6YMaL0otzIi/IO+FJMtEoTNpvc5eRI/0r2OLpNzdMDVRPIRp7Xf/NRygs++JyM8YU2WtA38cLzxaI513NlMFkQDLrQF+roU/qtTn6WvPFJnP6K1TJxZJE21aEb48dKZRg3Dg7RW8aXxkc+ERs89h1VTL6WFG9k2DEVPfvLayNo0XwWZmx2gw5MdeeNelEy/Yzu/MzKc+VEkn5nbsXBC3dZFde844887QePhlzWw7bNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8Zr3YFbJIKG5gvgmaqYc73+19wAQsUeNtXpvpqylHs=;
 b=EhE+Qn3LBd2ZfBORzFSj94Pbojxi5ItKTWBj2SXAIKJZ6HogSn12N1C7IJagALm7FS9gxveBaIA664BKZ65+tUkY7Jsso0SsCDf9+i5jjmAZA4H3ekgmuD8l5G87FsvSbKojb48T7yHl906k+rIBpBb85dsUjK88Rf1Jeoy0f7Uo9e5PYjBms2TJXX4q9eIpHTQSgfj7g/huymKR4+Wm/hKcdTqCVCM4d/I31gSiL+ZrpRabdgQSK3TETgHEIXQMyEGnNaaedncz6X0G5hxN5N1ZllK/Zb/B4IExQ7XZJ2i7b715NuIACKvjxSzFYwf8tFgYgmOrsuJp3r95Hv+UXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Zr3YFbJIKG5gvgmaqYc73+19wAQsUeNtXpvpqylHs=;
 b=eheeULgu81vY5G3fOXJ1roIIqTjTeVwMjaMnv/il6CkkAzo2F2RYjTvh7ivap9sRHCGG3ME8oJE6NsvQdZoQrga7sqC0JFndTQypkTKrau2DfDGwe/QQRoQ9Bxhwr8x6EP0oOnjo0agEKn1fJQJb0cSKzvtTOYRJ8JRV/EeFWPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB4744.eurprd04.prod.outlook.com (2603:10a6:20b:5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Thu, 14 Apr
 2022 06:47:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 06:47:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 2/5] phy: Add LVDS configuration options
Date: Thu, 14 Apr 2022 14:48:55 +0800
Message-Id: <20220414064858.405096-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414064858.405096-1-victor.liu@nxp.com>
References: <20220414064858.405096-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26dbf842-370c-4f30-8123-08da1de2a8a8
X-MS-TrafficTypeDiagnostic: AM6PR04MB4744:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB4744ECE11B2F2F656FCF20C898EF9@AM6PR04MB4744.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 80BbM7AptSc0gjO+4RQSfNZUrHmd4Z/hD9clOmKtTr7D5rODRPY6bZk/jsJuAKBpPTQ4Kh+O47wL/+xtrAe1X7wi61wgBYjytDg/4H+tjK9Jg9JNisMfeCzXBBsyfcl9H/m/FBv1LdHSO9NwFdub9pr2nya7zYkih2mjk6a2EPFoachoWJoGCU9pDnKF7QGq9sTDvdGGJlSTwCDSWfyoU5ZoL4LHHVw1zYB+PmV6kdE5bkmXdkkedHMucGSksfqNKOq9oxufujmstBhiGV8RtHaZFIc9huOya6fq44kAJ4TMJbp/UubI5v8oq+HWVOB5Qxe2cKlJxQ2ZEqZDCZQaA/+iNV5It0Gv/G953C+hKwM7plc+W6YBYIq1zrLNpTeafSI+RplliGHIX7TlLIriONRGlY4oEZkwxRru1N0fcf3LkwVNbju5N0qGUtlufO7NOXL0juKkUmFMrCD3u5XnR481LeweXkgkXbI2y93YdNv+vEK8Op88e3vNP3KbehuD+Q4wBP5y72C+FC5DKztxV4JPN5JGwtw+HUA0ZZT1PAlTOiCf9SydI24h7jDQxsEuZcRdAymCTlv8Af65CMUEJ9C/TfD2kftPaChAhKgT+kMCryj8ofrKxDwI9L53TxTT32ySsc0FmJDVwlblTreAkVDQhKUTGkEdFiUZWVyo1gK2XZQtiFGG1tOVdOHTjlcCkmmE5RZ8qboCws6Djy+oTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(7416002)(36756003)(38350700002)(8676002)(5660300002)(6512007)(83380400001)(66946007)(1076003)(66556008)(66476007)(186003)(2616005)(6506007)(86362001)(4326008)(26005)(2906002)(6486002)(8936002)(38100700002)(6666004)(508600001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?knZaC7SOezZ/XO+2xVPZ+obkWU+892nNknWAenH6ZV7UBZyP/z5VxITvTk2E?=
 =?us-ascii?Q?fZoOrt2CB77i2OFZzfgQJbfk/e9omQ5osf8Vt/7Z2m71lxZQ7aEhD67Okzps?=
 =?us-ascii?Q?hTxsZ5oG36K6NCHcykyJzOXjL9sH+1PliAfkZ3GwWKoBZkLlZ8koAn248s++?=
 =?us-ascii?Q?bWHLthKaIV+zPZT0JeaDwKNyTjHC2oidNa7GiArtW7DydL+LxRD2DYbMl5jw?=
 =?us-ascii?Q?lFI83h0+lPfM/HMCYq9tvFNcwqyiImAr6YwMnksbvhCK8WGbDCfoEifWiGFv?=
 =?us-ascii?Q?wMv5l8VX/F0M2H+BJWb+srLTEgiUc9nCmSglOw/93xHAXIJv4EZiACygubUJ?=
 =?us-ascii?Q?8uyztmk5pD3iKcT5UhLrvsSax4kr5vJpREBj9IdWddVVzGuyOq0WCPh94XE4?=
 =?us-ascii?Q?eL5vRTWZ+e5fIcWFlz6q95w5xH6Tc5pEcixChdgJUMdokIE1g5VA5/P5eKuA?=
 =?us-ascii?Q?MVCkEcTqLJFvSPOPHrDR4d1ZOhJix64RKaAwHJFB9/gsD4HTXqsOUnc/SdpS?=
 =?us-ascii?Q?iQjDw8enPz2gHB8KyywwfHmN1qFUMZBhSoEcMKVBLWO2yW933LuMgA8yC6xp?=
 =?us-ascii?Q?MrBzvwkCnVpQdYqlwsTC+l6BJYLdDCtQz3CNNsOxGNBzrIaHzwTRaHiTdLqN?=
 =?us-ascii?Q?HpQo00OMg20InMvu9M18ZrSnJ9jZljr8nqwTz0ZXFK8j7mccn2KSx042ZM1/?=
 =?us-ascii?Q?jxHUEJTcRtFfYppF8ES153Y4EfuW2+kqFRB77p0pRMR3W4R+n3RBmzNgnDhB?=
 =?us-ascii?Q?raSW3ONQQhtUp9SYUWaIlxldJwpSZ0VkEv4r1RcqKajNXqu5JYaI8dRJeiwH?=
 =?us-ascii?Q?t3PnX58c5olPKJqV/Z9gSFvZKn+F4XIig+yHsBz3OKeRfLIGkSFn3oaEThKa?=
 =?us-ascii?Q?asTG3E04/cXjXTtSfQpipi0AEPosiPQYyxZP4OgXyLIKCdi3Jm6N5Yt55Y7A?=
 =?us-ascii?Q?+dRtv3+sDgRv1SSg/g1XSHIYgsEfAviMSaA/b2QKc4K3sCUWpbiPmHNCU93S?=
 =?us-ascii?Q?oGL3EgvqdmlaYH1d0llqzm2jSaFeFgxHyIPwOQX/pFbkpYbaliVaR26ZBqvi?=
 =?us-ascii?Q?klIKsX+EgJGnR5OsfGpZsRkVXxDwfq2tQQbkYIr9/3Ir8SRrE+wVKsCc1KUQ?=
 =?us-ascii?Q?+6xWP4Y0mvs0LoLwIeWkiVAw+XgFXlkTAwtze7qERsImTJD03FVHtrtVeaIE?=
 =?us-ascii?Q?z5DAZgm0tVARPWfsbL4U6fPE6z+fJ/QwsYFOC3DCbGmq/kcC2FaQNm092ANE?=
 =?us-ascii?Q?TKFQ4hGRM8Pxt/vxV9ERCdo2szQ5ROR/U15ksbHKHQaXHJg5fASx+q1pVXpv?=
 =?us-ascii?Q?VMgSmHUHp+BhfOKhkH+rM49H10IBw1U1euK6Bk9BdrgfqGr3MnazgqYgx5W5?=
 =?us-ascii?Q?ef+dnBXN84IwIDbtW97RWtge5+N1T2HJsVdQ+QjdbLIPP3Fc6VfsuDwAIGDW?=
 =?us-ascii?Q?EHjEXkwZCSkkbCahzM7RvmE4hHEqokdvIM0KQZXEGnmYuNgxaxN3bnEwf1K/?=
 =?us-ascii?Q?xXmGjF/AX44Ecuc7mp7/U2RGYo/uI+y5gTc/8i9+jABtj7xlibOG4OVVV27u?=
 =?us-ascii?Q?q0ngq2vGb60XeluxBq6t7yAHBrFI2IRuYP97I20M5/1hrntW1NXjggtTWMwh?=
 =?us-ascii?Q?H3OMr3Ii2RYRp58JO/BIQq9pex8sTDpoF0Hi9POXHY7MoAxu2qZUH20vNTLC?=
 =?us-ascii?Q?HJXwpLxKskOi76xtXewqt0VWPpf9aD10Cqs3FcvW6d1eWbs1E/EaFRRVczVt?=
 =?us-ascii?Q?jXkLKHhWjA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dbf842-370c-4f30-8123-08da1de2a8a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:47:35.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hvoi4AkO3wpaQYJGl3GMraPee2b2Ih3YRYqh24oSHb3tDwRbYyTlrKYrYgLUT089BUhVJssSC6XqkeuH941f+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4744
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
v6->v7:
* Update the year of copyright.
* Better variable explaination for bits_per_lane_and_dclk_cycle.

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
index 000000000000..9f06dfedc435
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
+					clock cycle.
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

