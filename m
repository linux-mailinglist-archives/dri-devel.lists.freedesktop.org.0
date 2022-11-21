Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F6631A31
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192510E147;
	Mon, 21 Nov 2022 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41BB10E147
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzOwjm9k0YHFYs6BXmjFUfzshjMDQHigTQBdtGtgvjPQFjNcypoatsll9CWHmhB5Yap0eM7XfXyYrDDFe8tbzMQBV8S1DZv20y9Qiw89HZq4hsgAn29aZauLjiDVAP1O1J8Fz0hCa39gZXKUXLkUbhiH6aToCoa4JDMLBLZmPdPxtgM+43RsjqH9w88QBGQs/YGPz5qK2r3e0m7nge4vbVg24SLgF7gV3O0ZhSbGUGAjY5hN0QiE0LdoLpUGXTO8WNXRiy0i+Ayj0beqMg2zCT2KrFRzrucWbcPqFK2gLfSsyfBdIaVUAMcjMaWVUD2bBVVXt2n/m+r4dLopSuVtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjzfNg9NDJHgJ/WSbKq+MqsQK75uslQGriF3wOGvWC8=;
 b=NumpxeaM35VTcT2PWFunw7+42wUnlW9my1sZiBQjefD72CQ0BPamaNaH37VH+MGj+mrYRU30bFxg6e4JGzsuvTC9uBcZ/hdUlHbFQerjxdN8E5H3SvS8DLMfKOSNViLAZhAURm7vCGZDvKckoyRgHhA4s65GjxBpin3po/KTtDgPPOnvXUrSGERB9H7kEns1Xqh3zNraZ641AGHtEfSP9Q/ShnFDBONQ0HcNaXgeDOwmE/KoaiWTq18NfHRadb/8u3OG0gMB04hHZQlJ5hO3jW5cTBVBOiG0RJPzAqwfdedAyWGIpGZYiU5zeacvdh/wQv6XnHTtlGL9qca/jGkcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjzfNg9NDJHgJ/WSbKq+MqsQK75uslQGriF3wOGvWC8=;
 b=eQKfcP5D3USkRdKR2K6pZfNr+gpgaK4FJXQeCkjHy2O4lgjWgyr7HYdfyV7iaopmt8DjY39X+prFq6Etq5hxJF+VkSX3BOWVJopwLLlc0ZEmgT54W6m8ItX5WPa6QKNK+s9ox0UXzaC976ijlvu5GH4JeNxnCV9qqVIs8ULpxjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:21 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 alexander.stein@ew.tq-group.com
Subject: [PATCH v4 04/10] phy: Add HDMI configuration options
Date: Mon, 21 Nov 2022 15:23:54 +0800
Message-Id: <ccbf293c5c3b3357f16bc480956d3795b66ea1cf.1669013346.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b23bc6b-b50d-4702-1e5c-08dacb91d3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPb0whDPdX9tfUtBR+W9/fSAqT/tq5YoGvrq95mVNc8Ez4g3O/gVmz5ABIiO7B/Hg58KJ6A8sN1dbE4M0mOguOTmYxQ1956G3kRRWOLTBOLgCZY5lYD3VEqmDKP8jywhRg/KkjLvpzKiY9vC1QNKkDneJCatYbOoyuPbmDHN1fPM5zAH3cGl0v7sfmqidY9wFzBFo/EZCcLAl9CArow60tg3jfF1Y0zmIofL1g+CvwgnC8Br30dfFmbJG/ygv0VdmxXjac3MDBuWolbc5gknUWUs5Uoqg2pyUuuTmmoEltt3nGxab/l75Pc4oSJCGIZGl/UyENzIUwBDpajySNZ6p3uGvqvo+RJTCSp3FIbpV+vPpV9k6tnKOIOXX2lra6Che/LSrcC4dN3UKLcO1H5EMmOvItrRsL0h9vxceFnyYZvsnli8g3Ps2vD7o00dgjtyncTytuXjAnfCoSs4tHr7s+6+8sIM2QNx+zVQgkTa1awr63Z2DV5R/7NhP2g0M/zZ5TtnAW0vHCLp/QospgkyzgNV2eSaXtL2EvI511jhB6s2IfuSyqAV1/R7+2emA61H4wY03Anqn9UdZyJLk0rGv3gHlLd5niYgY5mRrWUVLYbmly+Zqb269ls0u/C7l18Ipddpgiibo9NLWRij51XvD/TnLwj4nHZNIGfB8lWmNx3560I2YWHbKiTwTCqcEu1WchYDvqD1D55K9jC1RsglIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(7416002)(8936002)(8676002)(5660300002)(4326008)(66556008)(66476007)(66946007)(41300700001)(86362001)(921005)(6486002)(478600001)(2906002)(6666004)(6506007)(26005)(52116002)(316002)(6512007)(186003)(83380400001)(2616005)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gWTu30yDmU0y/ITpzitw0oc07QC1M3Lg62h4Qy8t/yuj8oRGGXWbh0x1VlGR?=
 =?us-ascii?Q?fb7S29J8r29FZSyzMC1KqducqrrFEPTEwqmTUwkP1MCqojXu4jsPia3DONJH?=
 =?us-ascii?Q?2J17cddbIy2T3xQsVHZjjZnnN2gJBX5AQJZX/mWpHygBrfQuTb9xygAGBFdd?=
 =?us-ascii?Q?b79692q4EIDIVakIiAg57dpasnMc8dziuj7RW+V8hNbl+IwCwBwaFAv06mAi?=
 =?us-ascii?Q?S3zefl2UeCwZ9yYhWkx/3VanMHY7Rkr42djNTmWCZxV/LX/t5bn4CBX0REWt?=
 =?us-ascii?Q?b4UNRjctuTgeSnhsU/GkGHdhrp2TcbaEVTEOogttfY+xlofl8ccFMIGrnz8J?=
 =?us-ascii?Q?H9f3hMhvpd89p6Q+0WhFJkbbfPDM/cJCTE1BF9QcnopSHUoqU3cvQfeU57e/?=
 =?us-ascii?Q?szQ+dQjOk46BxZ1C7Xn1TXcs2jQ7ibYEEZ27GKJzWQUBHRSlc4m91gSYbZqQ?=
 =?us-ascii?Q?YsGuGYXm5/P6nai5EJRiNAEnNl3X5E+7Cj+kz9Qz5tz9E+gjlffYnetuYf6j?=
 =?us-ascii?Q?pGua5dXCLJJsgq8rbqOlEZs0UGYCJDJffUfe3sYydD5ujILCBpEU6HOwJ4H0?=
 =?us-ascii?Q?1l7zFX5mSV2WPGGGz1W5ed7t/hUQK2LbrpOFT8QIR9EAjbylwbggILBnVYpR?=
 =?us-ascii?Q?FncJmWzOnksfRP7kNekmnlGNdoS+B9kOndR3H1fFbxT8m28RsYUx/aH7aS7y?=
 =?us-ascii?Q?7nMgvEfXWPkZ3in13IW6RfU1VRBqtfT5xt0QpvWI43stzqHRYmiMCSl5q4bC?=
 =?us-ascii?Q?5FxNF6ZbpSyJKMtO4MFysrbgGnILYmkywq5nTmj8mH/Z78SqI+bwPXi1YuBz?=
 =?us-ascii?Q?wln5ip+fdpFEfSkEz91werfpvd7aoT1ni5eLZNLLR1o/jhyl37USxQY29BCl?=
 =?us-ascii?Q?iYebd8kaUcVeR5XH/gdq1x2kJxQN+qUxT1/m9L+41WXaFS0QuJ6a5beLeJAW?=
 =?us-ascii?Q?qk3bmCmraY1ozEilGRFGb1P/uiwr8fDIxzmuoFA/DyukizuUihFuzhxrt/lQ?=
 =?us-ascii?Q?nGjha5eVHOsco4UBiJu+cd1yq2U473v9rImS87wfft4Sl2/euMfMYJBtn5tx?=
 =?us-ascii?Q?B5mkZpQYZpDqOw3saJutsP8XYafWTeFXI7clqvRWsxx9gegKDhXWehYs83CL?=
 =?us-ascii?Q?r7lTYVFlWu3AxliBSQ8021iy4p+q53Tg7smNznIyZtlVRHccwySR5JlBT95x?=
 =?us-ascii?Q?QlSixOX196Osdcy7jUIGtF/qRQPvkDnzNv9H//RZVJRS802JoGLJtIz6sQVr?=
 =?us-ascii?Q?o5cQC14LEUb+Y9/hSr03ldFbVRNvbTnjRTIS3mSEzldEJm5Qo56qDlhae+Qn?=
 =?us-ascii?Q?SxIMNv4cAZnVeYYnq8fXgKYGS/PwENfQqa+BQP1Rgj5EV+Q9ekzv+OEkKHio?=
 =?us-ascii?Q?p1FLKdO4Y0Xi9NGckTYZp+wNnPTnM2/mv8M/UFF/yNEtYlQWUXqV02Jp7r9F?=
 =?us-ascii?Q?E0j545OazNmtJJ1CZpXi5/r+YKIDYwSNm/uaHrVxoL9AlSBcyBSZezQKQVTk?=
 =?us-ascii?Q?ZCH826QzITbDuk0bHHJFEpWb1010GMYcfwgVBtyvsYdZHGo0vFKzovXDQB65?=
 =?us-ascii?Q?VS90+ys9ukH67TBE9dFYKjjEBEK0ZPj8HoPfFlqd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b23bc6b-b50d-4702-1e5c-08dacb91d3c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:21.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4dgcpMBxL0smdCEIOcTAQqW7exWsB6J9laKeJRMsX/5fs/U9FQ2dG9KfvKopaO4MI0/aq1jlgTt83ixoXNlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638
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
index b1413757fcc3..6f6873ea7270 100644
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

