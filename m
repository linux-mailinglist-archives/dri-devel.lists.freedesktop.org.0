Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284BB7C7BFD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 05:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B558910E594;
	Fri, 13 Oct 2023 03:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2081.outbound.protection.outlook.com [40.107.105.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2910E594
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 03:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYjR0g2OvyIPp7DJGqGb9XtwWg/rqskE4mXGMa8esw+I5M++NUoaT3K+BVi/7wUabqReRW3tZ9zXCz20CW0iab8OahOUrroRs3tQpKbIKFsfJ8kKruC1/WZ5QXcQG5fpDC+bGpU+tl7z4aYhvJwNa2qxIqfJZY8+JeeJ+rQcVHTrQlSbPR5/o81KVAAPEX2BCrd/anb4PjXaRnXNhsM/ke/73Y07nKm1UkrrE9B/ZuEBcE04YzHHyg0cTromu2gukouVMyex1C3pxSn4sb23m4GZEsIg5PuuPhcDzw4r1W/DZJ+3FIHXXkqElWLc6C9uKf4z3WewO8RGB7h5djDvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lO3qOymfqU2eweowaCys8bto6Ii6+c35U1DMSbKqsU=;
 b=dFsxIYAjXIp6HRDGPyNEPoQswJzgcuMF43BPgbs0EI2KT476Dj4kEiM7LK53EKdAnx0CS80BYHLlUWIs51iVDcHQFLq1kWP4QvWh45F/Sp0oFEc5H22hGppEF8C1pXztQl5KVJdv6uxPTb25oKsNOZJ5CskSLKN4hYx0QAOFmDnQw9Oybh4VVqgZ2UsBh8UwJcJTDNAKA26qkj8JDrmuodzT//HqS2kV9ezTBbyg41z7JkGgPu2XH+0ky7TbLsZKtmm8Dtedf4NYpFAR2h/sdRS6vC6t6ij5R9E3+GtO60zRo7dl3IZSev8VBYqo/DEUIvZEBwwr6/taF2Z31s1PWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lO3qOymfqU2eweowaCys8bto6Ii6+c35U1DMSbKqsU=;
 b=gZSDxUDQqAYIEpV4oD5KAt9mfo1AsBg1izAO+n+gNW0n0y4M3cSKC2ISLR9x1bHmDvn0qPjC8gj4em73ng2Tm9G+4jQqiRM8aBffzXjx95fakkUL3DNGKYzFsbLcO+dWrj/+0aX7xLGbXj3aECXWODRr0bDjyLrOaCRyEZanRhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 03:25:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 03:25:47 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v10 2/7] phy: Add HDMI configuration options
Date: Fri, 13 Oct 2023 11:24:21 +0800
Message-Id: <91822a63435dcbcd7d132ec7c396e22bbe30df18.1697162990.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697162990.git.Sandor.yu@nxp.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 3529afdf-9c68-4c92-6d55-08dbcb9c17ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZwDL7pkGyu/TuhRpMxAfm0gsrbDVnCX83tRd82CoXw9fJ1WUICCg8yDmBzuOuKqy9XE7L6f/tHcZ3n0vtChZtHe1RV7JS2URjGUTco0wK2LqFsxnE5gKb2Vigxyic5ru9Od43CqdbrwvcuwNlzywGR7ZWP/5Sw2A2zowPxDY2nSljxotzqG/z83hdvKAhC+WosvdFhvmw3xJ40CQaS8/xd0ITUvW+XFGc9N0DbfPLYcBb5M0KVI3VyKB4RJ/85ZxcqjUAvkvAJHHsXmeTJOumCFFiew+i1CUSh2ccVzn+PMlljNEFYL8BRTWM9HSHbbXiGBKCujmPKFhDKYAbzwIkkAwKSL2cad9xpyr/Yvd6snLhGBfAqPWYhdlP3qsGVhAwpdJoCW65qvl233WLEGy4JtVaDlxgDirxl+ahCsrgYcXoLhUKYcHnJhkZHhjPQaM/SY2ZE0ai6QIJ21qcvmI7msYXvlt2iYah6n9aPNvU4ZfFPsNSqRJSnvNdliF52wsZuY1muTHeuwAq7WRGc2T0n3iEXe2HH4u+8TWnGUffZieV3WsdjmFYu0vhyqPN8MGk4kS5zaBPVmcToR0N9kdrUIGQDkDg9UKKhYTNeNmnIG8ZZTggCTH+jhN6EvSH7m8+YQl7sO6u0WBgA0g8JV/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(86362001)(7416002)(921005)(36756003)(2906002)(38350700002)(38100700002)(41300700001)(52116002)(6666004)(6506007)(6512007)(8936002)(8676002)(5660300002)(478600001)(6486002)(66946007)(66556008)(66476007)(316002)(26005)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hqRikfL4H7OicI0hkTNgC7H8lCtdqPVeCIlQ16qK27S39w+EtKmr6vx+ujs0?=
 =?us-ascii?Q?Zs1dBPdnx/Panl+4g3M7t3PExv2YIWhyquXJfjUaEjiW7064LC1FlXlkfeLz?=
 =?us-ascii?Q?Wog35vuv6xtIojDZTbIKbh+sIEhbANnsS+n3zHw3+TFlCQx0gExjB5gDN5QP?=
 =?us-ascii?Q?11ieMbwJQNUpNy3fQ8GmK7BU63myFx1B1l4ivra3ES0EMh71tUjr5Ab7of+C?=
 =?us-ascii?Q?/oaVXPFkYspeavRQ7dQk1d44Ce5aArb+hDnCBkML7p9Cn3vNKEIwDiVd+8MS?=
 =?us-ascii?Q?x6vOENG0/zVlJkvYtW4dNX5pY6y1JRTvUWRRqgwkaje8j/ceblGw43Xk9Yc7?=
 =?us-ascii?Q?200IGlkl9kSqwnwQ9d0Iifaf4TYd6wrFcl6mpUFg9WWu9EdSeLnb6gDwmrha?=
 =?us-ascii?Q?vnSgv4mV9I36VEsNlMT1onRG6jJerugen+aDf1WQy7UT+Cw2O1xFuA8VFKEd?=
 =?us-ascii?Q?6aFix1sYDJFfT+MUONCu7RMLD054uNhi4mKVXLV2yMSJuTM/rbX55v+igosf?=
 =?us-ascii?Q?KpdyQU7ukABmQmVzdfSA+ZtyIteM1FTIwS7+y+yFa+9d5BmxI0rU7uPLs+yd?=
 =?us-ascii?Q?UJxK7RxsDU4mycPEqbdnplcUoOLmWIsvdupD/MIhd/SKzJ9QmBHUThlglUZ2?=
 =?us-ascii?Q?f6kbKshXWvoUyHqks+xQcYr5+ZiNhBDEwbq9HkxlDAgNlQHIJR+Z55ueacgQ?=
 =?us-ascii?Q?qYBU2S41+XPPisq+7qJsfREeYXrEusFxvbOAYLPzv3NfnwECywYiu1fAk9xR?=
 =?us-ascii?Q?PRZ2vWJZUVPvlQY79zTns0vAH204FTE4FVaTzGKGUSgy0KWtPWmW7yXJZQhl?=
 =?us-ascii?Q?js+PYVeEKtSLxadOzaDwpHNhkaS73VCI14Yh+11A4UEs//6hw/qkYMmUXRbI?=
 =?us-ascii?Q?DZVDl3cP8WvlSjnVlK+d+P6QDIJwBa7AJoaKe9cD86njzU4pM0uXLgd4ENhm?=
 =?us-ascii?Q?NHdO1cImCfEfsoSxCzx662gAxKfJL7NBpsqGdTCdv70AL6m5NN6PZmuSntxU?=
 =?us-ascii?Q?jGRwizkLA/dG7T3MKG5epeR7aWa8BcRvHSWFtaVU/M7y7cwdBfsNx9o/fUJ8?=
 =?us-ascii?Q?YclGGwK5cYCtsJkIKgpvmFZJbVbRjEVcMjn2Z5tj8+SbkJyrpZWxGyyIy/CE?=
 =?us-ascii?Q?OtmdDcLxtQtGmIA/1iD3ftUzYJS2CMHmtpMOrZ36cyALRFGOWLeKFp+y+J/f?=
 =?us-ascii?Q?U1tAdVYw76mt+XgeyKNinlXEWQ6ZP26to/oYopyi16gpT8DvYWCcKiZgF7hs?=
 =?us-ascii?Q?rd1j0SePMgQ4mPa0QxKQNSI65bs3nsk7MYJnWRZ6C6Lq/hhbQKq6OFzORgKZ?=
 =?us-ascii?Q?mVK16iMDuxvsaW43lxuJ12s5h3StwrYUHSDdPygjOdBmxDLSOiaX9J9Shwkq?=
 =?us-ascii?Q?K/NPs1dp4LTEe4FoOat4zlGxKkDX+ovU/v1QuSl2CKoMR7pr1WKf5Am36VP/?=
 =?us-ascii?Q?LZ/fQT1gBxYi69y1VEae8Nv9dY4uHeoZS0py0H2pW/v1Em0ntY3wEmtx+/Wv?=
 =?us-ascii?Q?gPQmqcPIXlgwARSxcqeXKdcclWkN2IDHuxnQc6sg1uE6Zy8niXX/sCEb3QP9?=
 =?us-ascii?Q?qJhOUef25GdFRJVnLjfZsV5i/lhvRSvJTeiQXqer?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3529afdf-9c68-4c92-6d55-08dbcb9c17ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 03:25:47.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlIVBTteACvMfw/bReca+WWtjpfPFtGVfE/iRTrREQJo3O3+sad7bWZh41+r7ulvxbHrHhx0Gyk4I5ZTuq0GGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
v9->v10:
 *No change.

 include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000..b7de88e9090f0
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
index f6d607ef0e801..94d489a8a163c 100644
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

