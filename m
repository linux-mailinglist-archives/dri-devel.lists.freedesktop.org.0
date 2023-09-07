Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0F796E55
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 03:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F415110E741;
	Thu,  7 Sep 2023 01:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8490C10E741
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 01:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZORW6uEkAJ9W7gW1AG3y3zTeAB94doOmayj07eIekKtO16na7PwBXU8bsYNDB3E3EJWa6PB+9VteOAk2U7EpUerOcdapqqdKKOq8Z/zz3kYJSSVE4s3BOm4LPigzYsfLcG4uywZPh77g3STvW5yLq0cRlsVQcCZnE0PoDYLVoyXonJeCgtSTVzr0LEe4qyqHprPjKluPmJ5CWIQw9+iawbHTOfIo2aa5nSvCwLKotP3ljwpyXYlHyNQ77xW23uUm/fnUUxsili8BMyhuENqI/mtLSIZuTMYVFPn5gGVc1gNN97UTwfZH7gOixPaA0cpsFHJVnekzDcfobYmtQeH4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVwvcY8+h3qzSkC1hY3N/ZNDs1qp2qMS5Yo99hafGxI=;
 b=bmCmQj1UEpU3N0KHAehSFvvzEuZEW/K1sXLCWGABXPeDgMzCskUNzDsaITtb8Ju8mM/GMCadV+6Sb10RLURTlMzDyI14PC6l1R3S81617/tv/vqP0GZzZDjDYkhLSR9UazTkPy8I3QHUea/v/7dxl6eAjPZBFeK7kAQV7hIvbJTyA/ztnEMQYnsGF0Dmq9lTfvTt+SDtqj/8ZkozAbL0YTlLKy2alWB7nI/3n/K1m+rXv9ihNufjjdlOBC477qhTHAuhdwtQ+N6xxnIIrYfLcEVxUg1RaJw/3aAXaguZiD/Pe23XTkT4SHPw3PILHEXABPJPSbcQB0w1oalbPfgtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVwvcY8+h3qzSkC1hY3N/ZNDs1qp2qMS5Yo99hafGxI=;
 b=ncUFr4uEcHv9kNdrBaHNO30FSqM4qUIwYoBbKYXWp2e8B3AYFRcHcuohyUEV3E3A7CPjxxEprXI1m+GEPcJ4PEXoDfzyaHSQI1Bk/HsfIog2LmI3svuxLU4drEwTVg7nwmVzxs470ZAXVtI5PQQfLHdd/LjuQc12nM3EzvV9q48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Thu, 7 Sep
 2023 01:06:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 01:06:39 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v9 2/7] phy: Add HDMI configuration options
Date: Thu,  7 Sep 2023 09:05:29 +0800
Message-Id: <48d74313e8a6416979ce0a1830d62c5443670945.1694047629.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694047629.git.Sandor.yu@nxp.com>
References: <cover.1694047629.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e1c754-0337-4b20-0ea2-08dbaf3eb0bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKpjn23GU/kVUIuYx60Qr4JSaeFTZb3DHUrvMDU9QktXqZ59XEayuWXdl4HH5vi8yvX30QlLXESGoleMQ2o6lvPTRwed5FMW7RBdWZ/2h2u3KXk3ScaswLp8Xhv/U5vDIB8RdpfREhfkz7tVSPyc2LD1wLQOC/S5PDf2JdPd/D5nAw4nvVZzuI29HYhr045A4dRET3/kTAv/dC2bhX2Nq5fCOeOLs+p/HUivvOyVt2gNCcs2Y0MiC0XxuADQ+O+N57uteaYa61NSoh//owi/HyeDbyfEPWyVH48vGTIO4vPWMpmkabiBS38q/KuSiJO8SqVrYmA59VNtU1GPQTihkZMV8fjjS0T2Bar77hxbpk7shIc5KrZLIETIIkPPc4UnUsblTbsHwVKNzCbzexyLFp8hRSYz2Cz0252iM5m/5iH+acxULHpBTxgCPvpKHyRP8a6oaVKGO3fjCrC2vipagsbQKO7R7M0yOUbrw3Z2DeldD/EF8A6eofIglfsiuQ/eSdOkw/8qVP1r61jl4hjlIH0KfB53TUdSjCiJWtkdWXW1oTbBkaoTmNq3htUMTHs4jTlNBb/ttfsXXGpjz3u4reqm11SsMmNffVPmbOM+PtfVHP3wE8KcvkedC8nF4JMZyQ4OuBny5r4yYKy+oZ4LPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(921005)(66476007)(6666004)(66946007)(26005)(66556008)(478600001)(2616005)(6486002)(6512007)(52116002)(8936002)(4326008)(8676002)(316002)(5660300002)(86362001)(83380400001)(38350700002)(38100700002)(7416002)(36756003)(41300700001)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3QqZsbwezfEkM2xt2GR3KyU6+fcFfaUSua0QjE3tbDnb3+zjimz8nw7qRUd?=
 =?us-ascii?Q?WH18AVDB8VWXzeWpKxc83FNd11LFhh3COY7dVqIjF11cZt063a4km1B8jgrP?=
 =?us-ascii?Q?i/epBXjK8THyTLC+NS6b9SIG/QeNPl4kxgmGkjCuGd740sE4kXRKiGXNIfZ4?=
 =?us-ascii?Q?iDn6q6Fk0K3Nj1FiRDnVwoGg3afW/C+0SibP/UtDSVev7G9Somk0t1s7ZjRf?=
 =?us-ascii?Q?XwV29DKGRp4KAjIV/NV18tNfnJlD+3TtmFm3hqPDquiv1cuZ18eSawM2Gcfe?=
 =?us-ascii?Q?KfrVx7j4koPPz3jkFv3mub90mIQZPJ3QqXlBGUwIqPXXFERYQ1qflmUhdVLH?=
 =?us-ascii?Q?Gw8cNQ5V+cJU9dmlLWffP3t67zc+CA0rlGHSAXd9HkFnfgugx3G9BY9ZsCGH?=
 =?us-ascii?Q?1X/kEVVtRGKDZKLa1zrcqo0M+bPfcd35WilJkV/34DI/mQFgWdQXcJq0WXme?=
 =?us-ascii?Q?SN1nvHL+FObQYXpHq/E8cEmZd8QTcHOqaWc9TzEyhYMao4JOcz0MHW4Zj0VB?=
 =?us-ascii?Q?EyMk1OpNn8p0Q2U2biKhdOepe0dfhN8mOV5On0A+Ao5l+/97IUy77/sZRhhu?=
 =?us-ascii?Q?zThkQzOwfNEJEp02R7ymY0LaX+5UF04BNudtDUKY/9ezm9r/kflFrwZeKKJJ?=
 =?us-ascii?Q?w6HAbRzxQDVz1sYiQQL/7ORoXp6msQNI5RQRQ4ezGlhlzuoBI89iDcnTRZta?=
 =?us-ascii?Q?jjZMTqrawYL1eNjsRJuECNAVx6QnTFUa1iLlmcHFSAhu649klZ1nwKePKV6r?=
 =?us-ascii?Q?mGVAKX3JkacjpXzz6LJM79JhaYI/hzlM119YK2rLmsrJBvptbqTRkBlXsYJJ?=
 =?us-ascii?Q?/PD1uunKDwp2YzeSddzevAVtNYd4VRKhG8tkB0M4sJnVJXA/z/GSz4ML0Gq9?=
 =?us-ascii?Q?G0gvsVoWH3HGe+dyA8TkMzbI9rcL7ME+GGyR3Butf21iNN1P9kQsfkUvVlZm?=
 =?us-ascii?Q?nCs+Tbyago0XqlmxRjuk/+zB5hqLIPbW+36AxIOk7gPFfzZxujuHf5dkEswB?=
 =?us-ascii?Q?Uk0P/IVDF9rdL7tQKa753mua26zjqmeb9gW+KtdkOcWebHJZEnKC+ipCslS2?=
 =?us-ascii?Q?xbP7+7OacOjFIPHXrsSzGHFUG2cW/lgWLX64oSzYqXEZFgCrg+UCBPsyzqQa?=
 =?us-ascii?Q?uGg/Fl1X2CTOqv6RZDOdi4dleXAHVQowuAOUuEh8ViBvH86wK7MJNl6hV0Nh?=
 =?us-ascii?Q?dGXaZcPmZhgjSQEv1XNv0xFeOJqGgJS7K8hWI7nfTTpeUAx4nzmZwy9Y5Umt?=
 =?us-ascii?Q?sxSRfTrLEHZrjzLW348vnzetJWT1fn9MB5t/SseteMsuS2YDctrYm9HulfIl?=
 =?us-ascii?Q?UxBjLTESJGO9MCdvcwrBYteizKI4zOTmULx1JLkw/aiDy8Podck2zyOczfX6?=
 =?us-ascii?Q?7B1YVgB5vBC2v8ePl/CZyM7DviQsHpy280SlCt9DJ3PjJ1PrPJ4zlrk+UuJc?=
 =?us-ascii?Q?+lcN3OUnWZ7+kOQvrbLk0kRtX0VEgO/42KBmD2bwzdYrQV3OM10+tXNFE5+W?=
 =?us-ascii?Q?HGlqdCnDpPLwspXoqhK3B3uqdfI1hVg8g7gm+XeIQeYK8mVMSXGtIR/fRYiL?=
 =?us-ascii?Q?9KHSVxEAndd0ZHU7Zq12J8QFDLUe8OHZymoAZ04A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e1c754-0337-4b20-0ea2-08dbaf3eb0bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 01:06:39.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k+VnCBBoHkEpD+2CHjQ9VMKDOud01PTMDzFe26/3FBisFxUHsOBGBRAWRL5l5DK/dBou7hGqDDL5UibcnnShA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802
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
 linux-imx@nxp.com, kernel@pengutronix.de,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v8->v9:
* Add Dmitry's R-b tag

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

