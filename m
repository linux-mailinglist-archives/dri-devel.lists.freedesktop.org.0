Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31312F74A2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BEC89A67;
	Fri, 15 Jan 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B86E147
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfe6ddJ03M0pqQzblqQNeI0b/QGvy7u1O4u5nbTcK2BLpYd8nIarecMYc6jC2NkmPyPRvj3v/tIfr+Pw5shn9bLmG0jmX0vUNzH6pelQ1NwSZVK7Evqi7Nou5s6QNv1ti2L+uULVJu0Q62rNMiUJAJaxbxXA0Sff/FAZYKEnMsowFy8sPnxy2iiT7/HgxRuVTZ7jbqIoVECe3KYB/PMSr+GNuB72B4Q/fdNQZ0xWQZbM2W5dzD/2fcd61ROFPOlGX9Yh+z9Z0epuJ4r/fKwWzOUAOW3HiTdDoUWZGqRk3FRgDrLGj4pHMp+tBzfkNufFb6xcgFGgwKX0be4KEK7acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFvT59+r4gZfTsCQGwYdSt1yVz2qzP7N0XAR+GjRjjE=;
 b=LBHnuURGYXYj+4/qJtV0qmAkvClAtajyGwQ166zOektHgTAxzPTuLizabHmJJ4QWlkUCwSWdkV8kicsm1rFWJmYBcWPkE+g8iZ2XVSaf9OhHwQa0VP/KLSmqGsKaHVbGtp7EguGPBlxWpBB/CXuD+gP0IF4FGnaYir3ZkZUJUcT1pldlBhxXOm84RhltcExcuGVCaoHodYFIMNHK4SB8QvATq2uM5D6olkNU3Dt0jBCgCIg1trrmzwZvIzfR7DfdHTcV4B/o16i5rIznkS68mpwEiEuG0bBkRmqaa+3NjCijqF0Ey+DD+A5wCAD8zrEKHSzQ0B/4zzdy8yOY1tSLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFvT59+r4gZfTsCQGwYdSt1yVz2qzP7N0XAR+GjRjjE=;
 b=fzyousRUJEVL7tUK7HnoXW38ApUl0UDFQzGuqDavIi62M3DNYFFJoHbOOodhcuvOBF0yEkwd8zgyK8FEnvjp6yByKsuijNuMPaPPp2/rydHb+Ur8gXyJhYHS5L8abQezmD70y3FjFz8J7vzcfx8D4QWWucQe+WTxehdeHk2y5F0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 09:32:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:32:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 01/14] phy: Add LVDS configuration options
Date: Thu, 14 Jan 2021 17:21:59 +0800
Message-Id: <1610616132-8220-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58ff588b-ac64-4cd7-6ea2-08d8b86f5213
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB489344ED142094D08F1C79AF98A80@VI1PR04MB4893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtf9O3ece/FkZUjrKXgYXK05lMRoClicgUK8VawaOsICPxrE+laDZZBK+yGa8sqd+sf3WxHvh4p8cjnrFEMVz9jYDf5/1v2yVVUGsQWtoB4Zkpm0D9y3fFkfZCHWiKCj6Rcv32WB0dAPl4EuFWz7cx3s3TbuxrRG0Uw96yArOTiTTQNEM3T57hjMEtlGP0OPV6qZeo0FoMD7wANB+bIsnTp9os/tMZGKBJ2sNGpESKoPUbdonm9iwBb6Hefvk8eT1FByohlXB8qjXmLoX7ZsOX0HX4Tt3AfJznVIE40vGo2kzZZeX5XQ2KjRDUOWekVtRQjRYVpjIVX8gs7Idcth/iGIxr6pQm6C43X9HZz31VAOSbwPbB3rgrAbOkngehTi5Ni7hkr9AxSrOiD5je+3JfjweoPcuWAk7AIGZMkHMU4q+tcNbtIo5nXgcYlvUXClMzH6Oa4jKTyrDW1JTGYUCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(36756003)(6486002)(16526019)(186003)(5660300002)(4326008)(478600001)(83380400001)(8676002)(26005)(66946007)(316002)(52116002)(8936002)(6666004)(6512007)(69590400011)(66556008)(6506007)(66476007)(86362001)(956004)(2616005)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?veTESyMbflWOpPzYZoOE+DLQRcxHNaL/8noDl1a+ninnVtF5hgY0O0O8k4F/?=
 =?us-ascii?Q?+Me3TZilANJNcgC6RO+py149tBzYlET5wvcExSCqkfWjLUoyMmJD1L+5YAjW?=
 =?us-ascii?Q?toJWf2mShu1FrNzDMM8lwygyw8xE+vb4BZ+EC2181tM8FCAhCseGC3rw+zge?=
 =?us-ascii?Q?ZGR8AEr804uAzjJO/dm01pKxf1l5xpIHPLl2R75x3uOXL4O0epRpOIQR/lrh?=
 =?us-ascii?Q?7ccqWzR9cg595DFV4y4QJdjEs+18nEzNrUw7pFwpl4aPhHQMbLdpo2VgSdia?=
 =?us-ascii?Q?FBMCd3ygBHJc9WqJ3LLEtLpajnSVGRuocZ/ipqVhuQ+SKcQWsW7Qru6cx8kd?=
 =?us-ascii?Q?yQgMkv/VKKO0BaZc4yszI3ooMXUQ5Ws/5HRIAu5dpMD0KT45OoQoDRgtP7QB?=
 =?us-ascii?Q?TRRLbYVcqMLmM+ovzASXf/N9qPtJtKEAbPYGIQmQ5TZg4iQR/xhn47CWuwEh?=
 =?us-ascii?Q?D7GGaQqQ78CgpR2v0whmNwGCX4mFROgV+JW756MvtdrRb7o2q+HYj/6i5z4M?=
 =?us-ascii?Q?QGGXk7WsGcnZbQF5YDqkSvm0nFkTyWDkxoTS8ST9r7/tfXC3qj7ohfMn68U5?=
 =?us-ascii?Q?sag3OpxlCZfcyJODC5zzbljnNLxSn1lBu3pptK4sPQf1mBUYu29ioCSKYhJs?=
 =?us-ascii?Q?BJrh5T047HX3Knm3yXu6LRLppe/363beWSrNddjHMgaurVVbf5MSlYKspuV5?=
 =?us-ascii?Q?aLn1lUmpm+tnfigVBnxml0QN00IGgYDnqNQzVQy+z4uXtgxNaiiF4CV+iQcJ?=
 =?us-ascii?Q?Zhs3qevA07OCHy8HK3jQpnv6Csuq0bbGFuY4u0qTJhWJsdi4nB/vCKX6rSJH?=
 =?us-ascii?Q?I4aMASY2O7TtV1RDgpHGqdbuBkJ1lqCn9rRULSOdijhqeUop7gFANlJ9FbId?=
 =?us-ascii?Q?6H9YXXcsuWaOK/5BakIBKTLUCSGzfABO1MJIerTZsOdMrfKpTEKiHF54hO/B?=
 =?us-ascii?Q?V5kM0gr6k46luAv9WQ/NMj0bwjc23XsYEjeB7hQP9ZqHH+izzQz232usUjV9?=
 =?us-ascii?Q?KQ7h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:32:32.9531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ff588b-ac64-4cd7-6ea2-08d8b86f5213
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUdWaiUjG0lKPsOzNWJErCZtETQPJSI8XgbFXBsOCxPWAD1+O85ygHxi4T/Kb77MiuMI0w6YrEToYsN122/LOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
