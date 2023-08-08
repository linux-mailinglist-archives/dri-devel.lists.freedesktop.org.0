Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE977390E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829EC10E3C6;
	Tue,  8 Aug 2023 08:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653F010E3C6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqLQsFnxn5yQpG1Mzve1RIl/HkrM6S9f4b5oWG7V0U7yKIZh47H7M4nm/QFUdcd6zLtRGDpyrI32t/dTV507VwrGIvrBzUOBRqalvvUibMLi6MPqPVytjxBdCABnx7neu7ugNi7h3LJtYcb/yGANDPHF4hWEekZcx9mZ0Yh6kARyOdKqYfVCP/8SvW4bhDwZp4+ilZY8VRU/B6oeqyW4aU6BLOofVNEOZu2T01455x0URrWX7toOzqdoTV21hohBGy/hW/9s2CnZLDutRzG+u43txzefNzoHPM0usvb3FR3Zk1RynRrVLV4rNNpM0u0NsZ8N0utIGYVkIi5lPVWmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JodstHmgiu7wHelxOSqNRCconyWEo/2ieKC1lYgfdig=;
 b=oWQUJ6q1IMZYe9txN+eLv3HzCjieA4P7NsIRJUvnLRSYJ+1VkzADCDob4JChoKQCPuPyH2P6xw+LXG3y9IHK75MfKYIuFOCXh+3Ba8eYDnMKuPR7R202GI0ZNX8q7d36GGj+CqZkydHTEm+pjPAAIAczmMb/MIOoN/IP9Sa3fLk2hQMCxRspVrb9hV91sM72SN8IbtpuFixVWBlBqab0VyAsQZ1Co1gI7ni9aFlXqEcD4pPURNbHqtqt5Foow3LCu32nTVs4e8dLRSzyBKIMyRY+tsHI+pMEXF/AIUSXldAaXAGe3X8N0XwCgWB7wsAjo7dsuBbdxVa+FRL78bDBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JodstHmgiu7wHelxOSqNRCconyWEo/2ieKC1lYgfdig=;
 b=qxt8btpO9ca6i1uFSYPgMCtYL4uykFpt8LX4n64iB3jkaafUUc8BK/ip+kDJf2Tdo84qFA4haOUptEbkKzU9X/rcoQBNpeg4cUEd8gLrBTwcPOwqW7qZ+zB413uLecDoIvJn1GBMj904LbGOK5qtdoLQMTtDD1HC9bBsWGNoyX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VE1PR04MB7296.eurprd04.prod.outlook.com (2603:10a6:800:1aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 08:33:45 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:33:45 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v8 2/7] phy: Add HDMI configuration options
Date: Tue,  8 Aug 2023 16:32:38 +0800
Message-Id: <20230808083243.3113192-3-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808083243.3113192-1-Sandor.yu@nxp.com>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VE1PR04MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: bea2dff3-f681-451f-84b0-08db97ea2de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37mm9TZEfeiU08HenzNQ1R+4dCFyTFtP/Bet2uoZt4zAuZjoBCuVoWzTnHZsbRhq4Aq9qO/+GmvIxB8g7xxkU1X328hscx6FLe2P5eTctieD5PnZD3P9083fzT//DlW0s2okxFoJkOcYKlyUVJkFFx7WOIiBNXFKfmw3fqeHNovBrzC9bxbBGNi2NGGN1EXKDOOAhtXqZkCZtfN5yttk+eq7Nnl1G1BYqTp5kFA0WnKvYIBOckHnBX/wvYG/QepUlCUIFOpG/LsqVD5X3WuPoXz3iEIci+Rhcpb6pZJECfMQpr4dlbQoiKPNl4G0EVXjCYnxrJVExXSOpBLLqBN+achhQufn30zbSJ5/SN1aOQNAvTXw178rGXBIDFf4JomP5Suuyc0RVQpFeBzt1LpC76iCNPUKFMaR3BZ1HWGxfkw5fC7bLOhFUiOe5CyAoRJpZifdHRerJDy3khELBA6MWi9m3yE7TYXgaYAjc07Vxf6CDAsZavPGfcUh1Q8V95zuzo1ZOGYc0Nb0gLkBMuYboFCf9iNMApiZ99ronf6GKuHnOdGNW7CgST+MJElHvyrcSTBJEMZo8wJ/k1JrSSBhzin2Q3CnFHMh9MZKGmmClwRBi0AeSAQAclDZyqKocuuxKcRf4q1fMpxrjszVf7dOPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(1800799003)(186006)(83380400001)(36756003)(2906002)(5660300002)(2616005)(6666004)(38100700002)(52116002)(38350700002)(6486002)(66476007)(66556008)(921005)(66946007)(6512007)(4326008)(316002)(41300700001)(86362001)(8676002)(26005)(7416002)(1076003)(8936002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9U+25sS7A0xW273cRaKv6bXH6tJxl0Qw4ltdfndyrMMvZz/uGi3SdBLrcuL2?=
 =?us-ascii?Q?eyEK+Q99qGfr/VSAP8PO+dB/RW5H9Zf7HKRE2ZryYkm0h3/KwlEPgFxVB9V5?=
 =?us-ascii?Q?my9bqPIzK4mI7JSGtA2MU/MHsYwJLSsIyZnMd/4CWypkA8xbMP2/RHLBD3HO?=
 =?us-ascii?Q?TRZB6QcJ+kArpioUWbXWm8E1+0BbSnNY6HatefhnRRpisk0DVALHgpMgFV9r?=
 =?us-ascii?Q?59c/bnofrqjzau7T3oMuW+dBFB1jZ0KEd0hR672ViigO9DRZsUaS+5AbXI5M?=
 =?us-ascii?Q?YkV/qO2mMDCRj1zYxswwcmqP6VwsuPSvgtOAl4z1umjMDbHpXGq/H+IUB62y?=
 =?us-ascii?Q?WhcPTpzrvWqQbUlIBpL+ux19zgHvX34kC8TKwhN0X9jLmQohRLGr18lCvwwn?=
 =?us-ascii?Q?UocstgLtoDC0CUKPd2336W+ujAd6r4lxSvLHE60W+/q5zstnNlmn4z1x8VZU?=
 =?us-ascii?Q?Ho4eNjgufKJttHgRX6qHgmDPmdjQZ4K3EjD3truNXOgroPkZiU7qv8rdMfMu?=
 =?us-ascii?Q?VrD3tQH39okacs2K0cIKhW4sXCIECBqp0PxRybCiI4rTOnsSUDgGiM3JkMut?=
 =?us-ascii?Q?53fIdAhe74XTlA61KrShiQjydLLZPZA+Pu463tlDZlyHuwPMk366fDGY2n6u?=
 =?us-ascii?Q?mNNGCCOVdOiEX6eNgFf5+yfQgulmCfCNykWd8fjRKKygMusLUe248HwPMEVH?=
 =?us-ascii?Q?i/GxjLDB1M5BgIyJLvdIwtdXNrckpEOvvTddEjumjAJF4sKFFSZLngvi2CsY?=
 =?us-ascii?Q?zs6y6V0P6+BzB9FUo7J9bLPe022sfBMWkfspKjgBKPkkIqPTx9ID94704Ge6?=
 =?us-ascii?Q?r0sNGIsCCRTwrXufyvsbztHE3DlHNfik7ZyqeuXClVlqnStMz26lV3V6lzDU?=
 =?us-ascii?Q?yK7NCoZXMWkybEaaNcOt0Ek/0dEUZO6cowZ2jBda/peLRZoUDtvz7/8sr8uN?=
 =?us-ascii?Q?PjZTi4k2SWVZmZYWcqyTuiPpYWs5yeUsVC8P2KYdbdzkPySBg7S21a7HClAb?=
 =?us-ascii?Q?e1MitkjYt9/WmK9ENtDhZ8/0WyXM8kS3GHk7xRmUcyHey+iz5cI0iXOh9izX?=
 =?us-ascii?Q?qBajZzw3Cg8yHWcYjzBEJ4jB8/5OdsI/jottEt9bPbScGBlyAnuQ5bM+KDg4?=
 =?us-ascii?Q?BBOYSJ69xncBfjGS4dd0YI8BhRwFjFNZY9XAujJLQsKfyKZlIhFEmeD8A7Wm?=
 =?us-ascii?Q?pLJt5FjN1zztFaVdaY5kwVX8E4PkB9KQImhMCujS7YcXjPzTYGEo0e3vS0Oc?=
 =?us-ascii?Q?Lg0yYu92P8Hmyhe6BfVdzrp6GaqR9ohjb5p2kD0QhBu8mwGSA3P9Pe1w3inu?=
 =?us-ascii?Q?KCqv114EjNRV328Wfr4H5MkQfP29BAagEn6rVffXV1XWgsxY72ZkwT1Fp3b8?=
 =?us-ascii?Q?kKKruRTKwGCz/5RlixU1SaReaG8slZGfdd373KOQhNbG4NYPnwgREKr2jbkI?=
 =?us-ascii?Q?SarvjSjmMblDKm8Wgj+mKbmHcrbMYtlCsevpnp2xwvhveNPlgv3Qlt5yWbJN?=
 =?us-ascii?Q?qwOOjeObgI/BocefUP+uAy+BsYZK23yb2ayz0IZ1QPQmlNQHAY5VwZe8Fvfd?=
 =?us-ascii?Q?99NYYBNUP9XIhwQKR8ahSCMgbUJHEPMFqLBDgz5k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea2dff3-f681-451f-84b0-08db97ea2de6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:33:45.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Io4E9nPFP7sANDXPdWhjgjTV9bDnNz1/7Nbaz6T2arAuIcW9E+Ef/uOkci54jvCVo6bFIBawFYs6ZVfsj0Yvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296
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

