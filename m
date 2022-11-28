Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44C63A216
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7F10E1E7;
	Mon, 28 Nov 2022 07:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060.outbound.protection.outlook.com [40.107.241.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854E10E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXg2H/321pUqcpRjSGsqQkU0FV6LyRO/7MQM7x6dOmzEi+InpzUMuPXIu1OePhZ2YS0es9u9YkxSXF9wXDYVeEyboKevnTgOM1bA9WTsH8c8InSsu7kktnpmDZi2JA9GW02WhHhiKFkPP0Ehr6lkAz5WR74bDJS113HidCgRBG+TmFlIygSOKpGe1seBurKzrLutnNJ8V0MKanxr186pn6X70NQxmPRqB9dVqzUAR9IAGTheXwOjgiG1TT24EJXeMMy9xpC1VcHViyKyebBYEr3oIfxTl9/dcGOy/VU++CqTPGTrReklWjiZfrfCH62t3lIw12iIbZtTkvkA+MTbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjzfNg9NDJHgJ/WSbKq+MqsQK75uslQGriF3wOGvWC8=;
 b=Ys/TZO3BAhZ2LUwyr2fipdOPyjEFKd6Fhb+3WppMbhNFUVU4FTCOzTYzbus6O8NkmybBOdadCn0zs7l1Id73AXxaC1N6cJcQKvRlzefEsG7pBwIziINKmaeiBeQUV/pa6LyTqokdBnVt/10GgkBUyoPWqpRBIxULEP1XIPC9RxdsfI6+qKSk8FwZmlAQsF2fFGexdrZEV2L5k6dZUAK3XhI7H+BIywxT7oNznGGxufJh8T1rGc2+KnfvGolossUZyJjtC0nj+4ZTwJx2gjY8hePAAUyJVda8o0GsnO0GJZ2amr7n680fgAgu+DwpmNfRPvSge4pi3V606y1yGByaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjzfNg9NDJHgJ/WSbKq+MqsQK75uslQGriF3wOGvWC8=;
 b=YTlT2CQq13VI+xRWcIgwHNICcjgq2GSGc+4wzqeeAcUzJK86ZXi0/uUqDJgm+CxyhXLxXfTRux2KMhwx4WKJgHzJDVyyKiPDpF3ZbpOi/ifx8Plb8QZhVgzymDWQHdQhLIGEAfk41A9wTO7yQqeVaCWSYEE/1xUK04pI9feQz7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 07:38:16 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:38:16 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 04/10] phy: Add HDMI configuration options
Date: Mon, 28 Nov 2022 15:36:12 +0800
Message-Id: <89d8325b57ceb62fb5b11b04f195a6156965375f.1669620155.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669620155.git.Sandor.yu@nxp.com>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 35980726-6505-4475-fdb2-08dad11382ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Az/7UV2vhaG439xCBfgW40Xp7mEEtTNDRc0ITXrul3sGrz3ogJz/VVS1c1/DdW1Pu7PlHvINhdyf+fXj/ZZ4t9jnCGZXY8HoPWjQxkiAVH8lBHRgc1s4atuBKkh1jgsEUngVhTL26xU6cNMdFJsUCaha4oPSAwBM/BNFLgLLfpF/cjTiugcDqPG5WcchODv7QHNUnp+lqEKojaXdvCyBaUhjK63/5AAHrx9exOy4zgaKrF+BeM6tLbDhTwXjzSgcvPw8V8q7Y+EalfyS4ZzcRSBeRBkFs2mZ0KBiEg90hcIPmzXqtUQY5hrOBJjku8SW5ZgUkPY4lIBSPHWAO7xy9jJmFnBoL+WfEq1wO/0gVYeR8qW2BgOJlc/HfOeMNuinJgulUtmjxYWxgEQx7h9LZmnMTO3HVsZH/XJsicyVMzAczi8xuhULqwKfwYGr7dGH48aWHkRc3qM/KvD3s7ek8y8Ft6fbjiH4izx9KVIO8kMGLJ7Ef0s2bhAvRN4f/tP3Oq80KIBcZjBv4AkrxRTAoIeXUCRg1mjRgxHNeMdn/LuW9Zl9KZJUt00vCKf4yOZdpMj5nUbZVoUEvIlEtWeobx4sDYN50jIM6AKm8jPQ2P9wpmRyO9necbWcyf1RdoVP/WgKwnhKhzdjK21e1t8sDZLSNC8pLc+xnOhevVVikucl+5wFwGnKbOUMNZDAUSjLk0KErJucsCJPoihwSYq0yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(5660300002)(7416002)(66556008)(66476007)(8676002)(4326008)(8936002)(41300700001)(66946007)(6486002)(2906002)(316002)(478600001)(36756003)(86362001)(6512007)(6506007)(26005)(52116002)(186003)(2616005)(921005)(83380400001)(38100700002)(6666004)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5K5rkaSNU+q4xnsjJB75tFgopCoulIpNLZk5ctzdEL9XFAcVkg3RMXUFk16?=
 =?us-ascii?Q?NfulLOxUnERIET7Iif+N01sB/UoDZs4oChi6lp4qATkCd+ggnCfqaQ526sxc?=
 =?us-ascii?Q?stFxAjgqnf7KZ1RaKbhIX1kSpQzGVn6Z7erm+NmoEWoO+dwwRstezihAKB0t?=
 =?us-ascii?Q?voml+6kKbsdGYMWdcu4XxaTuQZQ6YQOW4zArZ1Ra73sdSHrw/bOWn0JYyaTG?=
 =?us-ascii?Q?+OnOzHQuO/kafIPLe+TUzKk8DJ2Y3p3foug14rruEiBjDL9vvUHIG3e0f4W1?=
 =?us-ascii?Q?CFHn5tKZ5txj4mct64Wmw76DkyoI2ITPMrLifKpApGuLlvR5ZHEiC7qYAO2J?=
 =?us-ascii?Q?biE3tgiaF8npdKl9pDVJVa1yyVqX1rK74VYn/0LjegOBU/tN+rmPCjQEPoCq?=
 =?us-ascii?Q?DjGTjTl4z9DH6FDL1efz6Z2R/sajqRVLRuEdi2o2DYji6A0l2+/icobTXtpa?=
 =?us-ascii?Q?AFCpPGMUJatRAjTJIJMtjA2od2H9sk0wjZ2LuYsfNJQnPLq5YBmXcPDuyJ6X?=
 =?us-ascii?Q?MX1vD5tOWntU7zab0tvNLnlbEGJnWAJnNY7We4NNeqCdMXm8PgwQGN0G9nYB?=
 =?us-ascii?Q?BjaqCR8oJq06ZDIg4LerGWr3Fa91H3y61Jm6jh/8AXLlLYfBFuxOmuorDy3q?=
 =?us-ascii?Q?dgEopuje5SWP01WkI256ln39xSlvN93ygLy3z+IXLpYQdXfiZ9EC6UArcAx1?=
 =?us-ascii?Q?Y51uvIHin5KnZn5p0f8Ykdv8B9LceKrGm2vHVm1h60IoSOKsESOAzIm2uTFL?=
 =?us-ascii?Q?UXRQUXUV/B652hqHdtFWKznDPRRmdfijV5IhFcgCb+76sRQps02DhTyGba2/?=
 =?us-ascii?Q?AAsWXAkPvnMdD0vF5dxCVoRSu+q5FkAwQanV5W9IebM4Cjj1Bj0npEanSjIE?=
 =?us-ascii?Q?BDkhWxOKmeUExGg0nIGTSS1SsN3VY4IN78HpjF8U2TjqU41oRHQVrkygPdme?=
 =?us-ascii?Q?U/ggFi4A6h5FJ42memlsLT6SS7s20jeW/bAzBC2CSVECYMbcZXTlB72fs7Nd?=
 =?us-ascii?Q?ANLQ6zrquVQcCBRAdEZ0wajI79nQJd9/UyUdKqdpZL7A5zq/tt0sNTfBlkNM?=
 =?us-ascii?Q?0Idjd3PusaMoE9YbS7rckHaZKSOug2FjkJCvtmGWKAhX0r/boPcKWXfpdPdI?=
 =?us-ascii?Q?oluN9OIFakDB6Sc2wXIO/CbMaizEb1JAxlEQKRmQL1K0GMsquoYquFVdf9rP?=
 =?us-ascii?Q?C8XWzDDJIFhxBqqiZeuSkd6EkTlvSOHlNaGAkEqusobvr0lMpXGm1SQ9Cf6A?=
 =?us-ascii?Q?4YhmjRn5XPoBu/cIyOaTijC1w+ObwlQ/B8ehujmQ4S57vZ8swhiyaNYvUjbr?=
 =?us-ascii?Q?eRJ9LoIk5Qu9aTb1MkX1/kqbK2Is0v/grThLqi/LVRxUydt8aaAydmMxjac2?=
 =?us-ascii?Q?ne4F54FAz2f+9pTOMzEiIxhhV2YE3jxu4SkXL0wOqxtnjm/Hul3XnoRcrhON?=
 =?us-ascii?Q?c0+o0HQbe0DL0+bLwF2SuzuAeZXXLTXLMBpNNqishdgeXVadwrY1wLuke2zW?=
 =?us-ascii?Q?yvzX2td3zhatvHppLrA6jc2I6X6pgCzIkbMGvvqYtXvroGshXRkmC9xDeE/v?=
 =?us-ascii?Q?ucUzH0dt0G0WLABe2Fl4TvM5P13NKx+jfNCsjiAO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35980726-6505-4475-fdb2-08dad11382ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:38:16.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpWr0hpTPPGX7TVOcUsPh1Y7RK48+K79MC3ye0urChVyvZBtD09be62d9JVoyOMMft6728YivS5fpthlE9w4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249
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

