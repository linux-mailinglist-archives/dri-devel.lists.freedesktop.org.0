Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6879C3070D6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5876E8F8;
	Thu, 28 Jan 2021 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8ED6E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJhJ0IZ3zBuoYZJWHiysQsMJILPbSQN3BXkbEDT//GxhZVGx3TAlvHNW2TdP8wFHp2v0AOKDV6Jx2cxmit1/UY1sICy1sqefeIdkXShc0l6W8OF53MRakwhTJfVMGDvyVoeOMl5FoxOqyWUAnEt3ptcNq9B/MoIPUEc3DGIEMwfgoM6FNZEimliqc5tL7I19ZrlblqAyxxOKK4qlXzIzamaSjYL5nkB5glCeMZbwiKPwvSWIfMaItByUCQYBLodDyaDJ8jWXyacQ/Uz0AhiWxvZBcr+sgwyZJT2+1KlE0XfDssoj0xTaJ9xWUiXixIuQ+pT3USBlj5l1Y3BcryqlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC86KoH3wlxsXwcy+lYW7cA6YGyblupeW24O0ThV7Y0=;
 b=HuWNtUglPUxJrmnlUv3mVXZL/M0fO6VYqK4/aovwWI4bimljo6xG4Fg3dXSTTXso0S7YjcLZ9d60dtnxoOhYb2aNfekZYKYo90rAMU+C0WRdq+sFVeTmMdsHuCyvGnCifbjTpGbWl/b9NHsHdMcGmeF9hJCYkTBJRFIOUE08V9VVamz2DbsXZPNPdR401Q8W2HP2vgY8xV/r47GJ0OB4kU6rjR0/ESTx/th00kGAU066LTDyv8p1glhO+WWxk6zBzx+v8rYhjqvl5bIDeTTfQbr39rsfnTcAyOKArzstHoagD8wsvAoyBG7P3mhM4MdtdXJ+0kGDPXYD5vu5LHEPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC86KoH3wlxsXwcy+lYW7cA6YGyblupeW24O0ThV7Y0=;
 b=hsUxufLBFI1sJx/inSpTTnw75VRAyg5Wso0XdmBFPyWwqGiioDRFjvqTvBhklGMXyQI4at/WuM9B1/3ucpPZ7cNkNKN0Ru7pnr+OVEt9cThvBPUEqySO6VwdC31wVbuukwDrCXhp4lKIZx6pIe9pKe0u6mfpgwiX2VdEpWbzd4M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 01/14] phy: Add LVDS configuration options
Date: Wed, 27 Jan 2021 16:51:15 +0800
Message-Id: <1611737488-2791-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a76f8205-872a-4940-497e-08d8c2a242d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2975670822282C1B6D230CEF98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Th6T7DD2U5AAIUHVigSn+9D7ak/EcnoZS7P3YcoVzI1E7M3HlpQjahhkpvRMyFH/U1djqR6ajNFaDtlVZxwq+wGMBUypa2C0MCuTXfYAOO/YEjmxgUyNXRS+wKUqY8NLJk7Cqh/5dG02AYGFPIJzDsl6Y4G9AQHQuJiidYOb4IoP6xLwiJ9tUuYVod2AEsoYTlVw6u+MQxCeQyMWW4LEZE/NWzFPpOXrEJkCm5HQmZyfozL2ScVID3t+xKTc0HWy3P5zuQ4qxtwmDAynqSreTvVNiGevpl+71RELLM+batVYIV5JUDT7P/T2Wd6lh0vF53BSBP8uQFEKb9vk6AEnQRhDW2lMxCUBqh2uFfTE+PdM6uLiO/o8maXYqcuIAFbBNdZNju2JqFhN6H+TaG1zAfy38K5ejkmEYmnKCkeoJ4Ejci0RM18dzkeXo6k0NESWFVfcPPdmaIe+ekNqrCfdy+YtsdGSX0e7XBQOvmb3SS+apzUtjiX18Cu7dw4DvQGOQwGrbusylCpPSR/eU+tGehAyUUTlGDOPSQ19TiQ8eRo06VhHdsv1XOD/WlJRN7AWv7byIMXEiHcirBST97E5Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(83380400001)(66556008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QZl3N8TUNyjGb8u4j0XwhhBGdloZ7Q4wMLR1bYW/o22uloUm+U6BSZlRTFOz?=
 =?us-ascii?Q?btZQzplgIvzPq0NRxfI00lxat0UR0ap6iAeZm/k8bVz+ZzGs7pf7Dfl3eMPk?=
 =?us-ascii?Q?+EwITeobc6t/5jz7V3VaCpBAhmakasZR7gNyNSRxky1LFAP23k0ci/EurMXR?=
 =?us-ascii?Q?OO7uWVnC3G1fjuj1tEZ+pwqe6F8YdmKU8QczlIvD4PVrtNBZsIEKABUkjOL1?=
 =?us-ascii?Q?6iY9z9rmBsZ1IoPR8EOVuk+earGNTx0LG9vXuZkBeS/zZKH8CT6tdcoH8e2Q?=
 =?us-ascii?Q?sQyR6RD50Zto2ituIgFpQ0EEd1pkLOsY7l6CUhVilBd9kTfiKr+a7sO2qe0e?=
 =?us-ascii?Q?8iZ15tfQvjm0WwLpdKRd6yzYW0bnsTx82eOCWA4km8ATpHFnwIIaUK2jU2Ng?=
 =?us-ascii?Q?MwhJ5z//XgAr2CMLykLYJTPpkiuWieysOCsWNEdLPCUGSQXBiaNaIepI4mxw?=
 =?us-ascii?Q?GBVcbCvhGYP/VQVtpH+raeVkkTtIIyDiPwoTi3p3TeBOmqZmu1xdUSn7cUPR?=
 =?us-ascii?Q?11JeTaRWpAHvwUgm9NGRSLvNxSrOVw36Qz9DpZwOr6wqBcLyEMlpK5UTHB54?=
 =?us-ascii?Q?rt/1p1BdexYOqz3zWLA9ry6DKmTzue7640erY6PndLukV2hqLTfit+ZUNGhe?=
 =?us-ascii?Q?rfJCyHaNVAzAV8KB1oO5WUORrjHmpyk8XHAbh5In78OLuLBSjrihGBLwQebZ?=
 =?us-ascii?Q?OhWcK5vGMwLZJPaW8JUw8EeWR2KHPqr4XKK38IawbDo1pxRMnSXjEVJD1Qiw?=
 =?us-ascii?Q?V9T1Y5QWUXbPhZBnRkMGVIyXEtdU17shPYCuV7oxEaccyu/T2kz9hEkO9Lg5?=
 =?us-ascii?Q?ObTaVI0c3GI0bLRJ376Mnk5+wjjLHZYEFvlhw1CF+2u9aQ+ukOjlvOQve1Hu?=
 =?us-ascii?Q?W9n4lTPgakDSm0VfodnfxcQ/44nzeOUi8sjR6fdXPhAZnQ2Ve3krmJ84Y/d0?=
 =?us-ascii?Q?yRUkfOc/VGWIFoJFZWfFGmSTCvgG8njeEpNoKF3VBbfNVabNxYRv2+o12Vgo?=
 =?us-ascii?Q?zi6hYjl+Zi/o4poQzdWATDlSrjVK5zmhoVdi5vhGXoBwtLEikVkeqP0fJHEa?=
 =?us-ascii?Q?3+uoO7O1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76f8205-872a-4940-497e-08d8c2a242d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:23.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7ZCv5s2yqOoNi+gO1SZUaSKzw1taC2/tYv14LF2nu3StlqKKCafJw5ESCwlKvzgnK5ewyZYSMGqKw1t/ZUwiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
