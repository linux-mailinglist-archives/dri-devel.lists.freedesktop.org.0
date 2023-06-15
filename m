Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A371C730CB5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7FF10E16F;
	Thu, 15 Jun 2023 01:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2085.outbound.protection.outlook.com [40.107.15.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580510E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6D7ndkUhLp2sPmhk17djNF9DsqzYqADz7IRMFr7j2RbAZq/lhR/1LH+dCyUjDb5L1VWagbg986uZN6w0bEcLzCV6a678h53HVbYYDZGVtAqfpf6IvvHLBkPnUonFfXtpXVvwyLh08kQ2hYnItWfgEh9t3d9Qk+8+jKaQAaAovZmJeiO9I/UrMzZMplxg82ibAUyCP+i3JQ7/+XJR9MhhnogEWiJDJ0+HNZ3FlEOS4CTP3k6xscvfy3Q1sbk3fPzn0tM68fai8By8OGAxCzHqmu6KuCsRZ214BJ3VW7pqfvGuy5R+3JBXJlabWi/bw5PEKxwb/3hTLuzHE+yepr3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeoiFXLYhwmAemN/90bvxCShXGEJiwjtDdONCOjk8ts=;
 b=ZBb+EgsQjgg+9j8jb6gXy6d61TVpUCP0S0hZWzzyJPOJ0mIwfBxDf3r7ViOMogvRzm/VzldrbRswTWOs/l0B1Oev2HtRdBAWLRu5ery/WH1aVr60dqFnnh2mSvJYZpESglpFsZLLTnvfKMTH7jHUnxhI5drq8noKtzfyM/gp83iPXblgCvg98WdqaDygph9V3V0UNZzN2PEoW6DhKB5X27Qx5pGe2nYueu6ri7k5FeIncGpeUWThZIYsr8Hm7Tt/DUCQQVvoW/58piM8XHmxMCQt9WhwSUzvP3HiFTsNZ2abHRdZ3bzEp5GQ4zW/ixRDDXGwUEL82RDGfQ3FFN/N8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeoiFXLYhwmAemN/90bvxCShXGEJiwjtDdONCOjk8ts=;
 b=DDpyPv+i3dD5mjQSNwxfcmFMLIrgE7FIMdjhTUq9NaqwLvgkZfoPtHU54l3zcQXYiYQMEeIvgMTzHvNj1uTmKN7g3XAQyeMioDNdHqLuf2Unw39bSDfVbRbU4TUayVxcpBVmTro/onIh3yyL8lKtbtOoRRpAVWJ6zeEWnAGtLNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:37 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:37 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 4/8] phy: Add HDMI configuration options
Date: Thu, 15 Jun 2023 09:38:14 +0800
Message-Id: <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: bf050f20-0c04-4b94-c47f-08db6d41a8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwjcsDvsPmvjX5esgxDhWwQbVWM1sEWdsLL6iPVT3XAMqEEL0Ax+zSrVpHu2fo9DlBqYK91i26DuFAzeRGSDZDDUH4oCqaO6WGk7QmDsdIkAlucBT3Q0YHCESQRKhOt2SIRBRD8jAwY3j+rE5kEx2BOKdV+YPkRnasWWlh6ZLHlp5Tja6OuLmMf4f/FKMNJtXkB73Fej5CMEdXu5AOxmC+h6ANzL2pbXZU8G6oCIJ9qFDZ5h6YVNcRWn9FrGLiBbuy7aCAziGdbX+0q8evLQn0CB23xKvxwSUu7UKsn9w1XbWFIU08wqFIhU7ehJsd7SiL96I2SElgBOF/Y9ftWBjvQbAjItglMpnpQ4GqrOfizcDWKhx7ZPSRK4N7FMZXG7mG8WJ/07pn8C40ra2ZP7fWFXHph2PB/OoFKowm6Keg2++ZURTAi+X4LWNz8LCgDXqUf9nf4VdS/eZG+63Lb6kXeTh5kShdm4G1zj764K22LHKgp/bBrJdA3+jhEOXk4lRUdxDHVhOnSefpUj9vajDUqPkFBcOuXpcq5K3hH8evvX8I+o1xDt4pZ9pW7YBtWdrKohoCuZy2HPg3XsdfjTtRVsNyApPjO+qUBBhUWEY3cPXhZQJCbxqMCM6N5r/jROwG4QTE8oi0k13Lq8syGI1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(86362001)(4326008)(478600001)(26005)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iiPOAeojDtX18yxs4pqg57EiXsJn6+AcbCy/pNkl2EkJdVX0JbN1z+J+fTz7?=
 =?us-ascii?Q?T3jqCGxOoU9/j9SsucdTWkxw12DoA2i9cwFljyFELkDTJa14a6iEu1PD9y26?=
 =?us-ascii?Q?DgYspT6/toBhgNP9Lzd1mrUD1slvoypfsEgCmN9qfYJEkF1MCWBJnxM1+IJG?=
 =?us-ascii?Q?BIltaDi1WjHmRe5n8vNxOU3rxW6IF5YFuT2tBTgQ4tw0vqffxzBQact9U+Vy?=
 =?us-ascii?Q?gbkc0Y8dJoqNHGhCr1UNxC+737juuxUuphRJS8ial6a1iGbNDZ3Ws3Z5zMaa?=
 =?us-ascii?Q?mv9Vtcf0NFouNDWKBTwijwBFFw6LvAlDGgEsxizO10dsRrIH4P4TLg30IYpE?=
 =?us-ascii?Q?Ell2NY3pQaBO2+so5yIOK87+DzS7WPPE5rzGRNv+WfhkHrA11scoLpgTsAPY?=
 =?us-ascii?Q?2HBpKeDM6efjeTrAF615z/9QoUDyL0fVOYsQL2pTeTG3lIqeo6InpDNaCjIv?=
 =?us-ascii?Q?NOIvIpNKBJHJsodasnQ9iuQGgKFZ2mDSXfXApOunIUMzPEPe+7g6Zb1fqUtv?=
 =?us-ascii?Q?hNTGX0ZhERb08rrf+llZqfC4dqv+OuVhSSi0dni2lJv9FItPcw35y4RMoh1E?=
 =?us-ascii?Q?5bjt43rvSx79Nq05/6QTdU9bHI/48fL/wBmv3P/36c4E8KEQpD3F9bicVaiC?=
 =?us-ascii?Q?7KWo7AEwhA6A1wyWWQUA5SekBcwVDsS+gGpoiKJ+3j3s93b2V6kBU8hz3qmt?=
 =?us-ascii?Q?LI//GVc1m1RcoNNgxx/BWZU1csVwfaahlnzCjEUaRtuhpYYLpa7gSwduTN0m?=
 =?us-ascii?Q?FlBaCYrDxgz2nfEQdRVoJyS0Fmf51cZhlaj5cGQAQ/MNXpEKv4Ee4/vVzhay?=
 =?us-ascii?Q?bLOiGHtuBmwhGd+AQsGtRxZIsIsMqfU8mIfH2cYVo1Zc4M2GC7vDjP815Y3W?=
 =?us-ascii?Q?3KibGufstdenPMFyQEmhQ9k1KgrEg7CgJsM1O1PZukzjU2YoX++hvAJk78ln?=
 =?us-ascii?Q?2D9dexXGGD+vt0JRS4duqezrKZ1t4mj4BN+lOG+P6tjC6AAbAISELJhof3lQ?=
 =?us-ascii?Q?nCHkulUd1uaGsKBQ7gMEsEi+ZOROjbg0odUo3qw5Ch2F1IG83uCxng6O4VFn?=
 =?us-ascii?Q?xbaTl/NPJguSkE4xmj5RQdREiKasCecE4xjtlIDZJRnYX+BcsvlmFw+HkmOi?=
 =?us-ascii?Q?gBuz3O0Q6tberWAI4K7gwoj7z6yWWiqbtxFEdGHnReyoLw2o5iM0DWC8iRyW?=
 =?us-ascii?Q?wGqOl0csOGOy/tIBEm364QoYa5rCvrsVrkXsNOO91QTEFIAEtHjsX0EB2T2R?=
 =?us-ascii?Q?Pb33fgwfhwZ9YD+hZD1CnFrBOtnv6b+ChFcYOD4OFkKLMqw/15pmTTJETBYp?=
 =?us-ascii?Q?zHfCvrqTk83oyoAqrhvpnC0voPwG+KHRdil19i/ppKDdxS26psZeMgXrVCxD?=
 =?us-ascii?Q?P8+N21c21mT5Du3CBKcgqJyCWuxHXE5dtEaa6Fysgym5AGX/oAYWbbyWAA66?=
 =?us-ascii?Q?esSFeUZTU+U64fGD6h2rQjZOoVIE3UafJ4mITCPSYr7inwLNPC/vP7yN3Fw2?=
 =?us-ascii?Q?wNO50PaswJp7uC2MAGkFaOcCVUwjQOZyzyTu/i6slhB5scnXDiuUJkbHuVk3?=
 =?us-ascii?Q?B0cpWl0ffCG12Xy89I+5pAblvsAxDQzAR+sj1w8O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf050f20-0c04-4b94-c47f-08db6d41a8af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:37.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5HJRXUNLv+aKOR/DcCu66BzGKeAmqjX3UUctI0QXYzIg4CKa2mcxfzA7H7SUh5gwR//jmHyLGiZiWVx58eCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 include/linux/phy/phy-hdmi.h | 38 ++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..5765aa5bc175
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+/**
+ * Pixel Encoding as HDMI Specification
+ * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
+ * YUV420: HDMI Specification 2.a Section 7.1
+ */
+enum hdmi_phy_colorspace {
+	HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
+	HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
+	HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
+	HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */
+	HDMI_PHY_COLORSPACE_RESERVED4,
+	HDMI_PHY_COLORSPACE_RESERVED5,
+	HDMI_PHY_COLORSPACE_RESERVED6,
+};
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate:	Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_phy_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_phy_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 3a570bc59fc7..93d77d45b1d4 100644
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

