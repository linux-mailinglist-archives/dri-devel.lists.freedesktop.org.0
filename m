Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F14848CC0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 11:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0738510EC29;
	Sun,  4 Feb 2024 10:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="j4yL2aJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3696F10EB8C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 10:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exy+mCXc6EYcXk8dN0hX/4SnWZFMi8S8kZ4ggH9sqAme6CfpKJzm9CtivPAVUHyLoajqYKm7W7XLJA4Rt9FHUTybv2IMAF47dsNaG+YvhLIT9cOB/eiypPOcQxBmejIqPBFSxZn59OtSYDzZXZ1uvgRwaHlgNGkMLum64KJUWYmdl1iYr/OAEYXvISxBaPn4A1xzr+DuU28DEQ5r0G3KWqve0CPGpgxeiz9E7NLqBo2KJzStUW6nIxfQ1yC3xroSYoGf2tb71ynrRh32+tEJVD1Zfn5XMTA9UXIUaCXQqXD1X8se/fUEyKIDavlFyq+zbFF2zB8rtKjgqAMnYQeCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG9G82LDw3MojFFzzVJhJKtdj1zwG/+FHlSlEhiw5lc=;
 b=HmmlplgHyHqSQgSgSebk8B5Wrp4czWhbua1G6ePia3t5ouJpEbl/EwvfVH8tlqkpVkAOUQQ3KfnMll4VYVbgXHv1hnks9zqnWEe4AvYNXRIL5XMB0wc2tjo/O5EId77vpzFSqd3m4ERGZCR+gItYrUQe+nVwi8PhZWJ2Hz06S7POiz28jdMFW9LmFZAbPH1Drv4W+Egp8T2fm2sG0I0Qoj81bNmkOZnYmAArqC6HRVnshxVbi8+h5HdLbmqq/MsmZBxcO98LZH7GM8T4EPyB63MJ8H7SUf1CKo3lCUryWwmDIiWXam0kppY3E345yOD1cGmAB1v9IkeyT7rk3mH2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG9G82LDw3MojFFzzVJhJKtdj1zwG/+FHlSlEhiw5lc=;
 b=j4yL2aJCcJBJLDNfmVY8d9XhXm3Dr5vyPwShP6H+z1SUGSXhC+UUhhMF+MzCakgNcdOR3ErvShVT2+zzY2+pYcjiQUyQ8Mnace5cJJEpSxgUZa3hd9GfLFGb9bOe63NnOEmqVOhqo5ldKpGAOO3DOi/TwKWFWU13GWSeZJh07Ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 10:23:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7249.025; Sun, 4 Feb 2024
 10:23:06 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v13 2/7] phy: Add HDMI configuration options
Date: Sun,  4 Feb 2024 18:21:47 +0800
Message-Id: <59d5595a24bbcca897e814440179fa2caf3dff38.1707040881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707040881.git.Sandor.yu@nxp.com>
References: <cover.1707040881.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a941fa-8f85-47c7-6b14-08dc256b471a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxrtfZZAdMz3tsebMi390dm9Ns0K0nuEengxnSkqry0jk424BH3G+17C6RO9fM+cS4QrYeSFJCWcgg2oY/Vt5VEnzqhoH503kCH7TrxQ0sZQJ2Sy6r6V5z6QBjDcYD4ZUgaZjUtG/qp1H4eKBu8GZaJIXb19j6VWUNSevVURNtE1GLLJuJvqQ/5tUU+VQJJQWqdRitdKoI/rDMpIY77fIg9BREuknrCYdtSrmz8YLgiC9GhLaV27hTz5jdlvNeN2sV8+B/bFybxIzECGW/4KHYVJ8BoiIpizz+Enz0J0OeP+qLIN8M/a5yt+eMWlr01w3CbFxpHC/yBabtJta7RZFVQYsrjeo9tgAtRteVnsuw5So4gAJcLwnk8ZaCeiGc+ov15Al2DkthViKFjLEazMVbGK044AbXI4XrZJaoc5w/HNY0I78LaZJKHP1+oCXwv4LGjXxTZ38WLD25E9huAM0IgyKWV6wJ0TN4Pukwdq0QKSb89YUg8RaCxdDPXwGmrEqmDc38jHPNn0UzrqzEMwdWSb/hlp12swIE4ssQ+VWkqUdyXlmy6JKmlB/95XkQCLj9lL1JwXYMnWei2Iurm0Ubz3IGBUvxSp0JayoG7lvmslKrhKJvPNp/WvHEJb8K0A7od1ql3uNvxY0nyh0WdGDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(26005)(2616005)(6512007)(86362001)(6506007)(52116002)(478600001)(6486002)(38350700005)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(6666004)(38100700002)(36756003)(41300700001)(2906002)(7416002)(5660300002)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HLUA+eu1CEFnHNBw4C0prEE4ng7wsHrTy60s3OvHE8I32h34y6oHoyBilSSS?=
 =?us-ascii?Q?aWDXn/dIogoxaHWwQ4cJTxlNPQP4qqTu04K9h85iokgJNPJ5tivSOQTQK3H4?=
 =?us-ascii?Q?DX7+BRwd0kkmQBu0KSTi3DH3Lv4I0P30oyTlQ3MFW6EI9KrTYEXD/y/OuzvC?=
 =?us-ascii?Q?h8vFIwiBzQDRORwSmOeTlffq9OY+vISYNdJ84UCmAIEUrw2jvzdBsMwSdfoI?=
 =?us-ascii?Q?d7WXjXpMILsueqh0cfsdbnhGbmeOjdQ0dYvnU81fyrixBo71HWuEWEQ4wI/T?=
 =?us-ascii?Q?OxprdqA3jzsU2MuUft/ONQYa3VNT58LmEbI8ffKj2HJXEwVwtkUppltUlcP7?=
 =?us-ascii?Q?9vVM1+oe7d0MOeiacYy3CRVCDKPgjQv3H/XjSQw6AdpWpfyQB8oJSZ3zPlE3?=
 =?us-ascii?Q?pwHSAaNGDPaAs4dDucf9vOULsl6/gkqQGP8+PJV58Z9FujLVuJWwZND9ct+o?=
 =?us-ascii?Q?yPyXiILTPTdBZfvqSJtVu2c5xpKGdUFV47d81cRFvjxS8loshpDCeRVT/t7B?=
 =?us-ascii?Q?d0rb/NOtJCf5qGxy6/9WLAtIhYEe1uQfbudTk7HtpP7LTkDcvN9YILFgazDZ?=
 =?us-ascii?Q?YcaTQesER0Gz1nl0ioGHu+Nc0yyLC2/RdirsAtnsKqrIMLW58zbOTuwl8Q49?=
 =?us-ascii?Q?P7+BcJ4643V0YQ1NoAvlqS2PJco+Ua3V6/IyohYr5yr/UOr5fw/dEZSRpqPb?=
 =?us-ascii?Q?LCXpJW78jrP7l9qOT1jNBgWd8DZpKJWwzViiEySYHvKVilQ28+XJ6IGcFdZK?=
 =?us-ascii?Q?8lqRhUSZaOUU6rTRLS8Sqsr2513OI6iFq4qRfnbxyXbLDizluG9FT04GzOaz?=
 =?us-ascii?Q?cqCd+He0+J6JcYYnwH/jYCZbABImhhqU/vgW3PpDwu9TV5HWjiLRZIGjTyF9?=
 =?us-ascii?Q?jKfrocscd0FfsPRl/cODZZ90Kic7GjHVgogixuG1Jw/44lOdcKCrGRu3rkY/?=
 =?us-ascii?Q?1K61DsuDGhnzeE46dsk29wmh2JyM2hkArm5UVyE0qOd48rSltZw3Sxoczs1j?=
 =?us-ascii?Q?bj3ImU6c/wJ1ObJgOnChTwSUoNiWhfgj/Q6ydOm7yIlbCDSrbhWpNXbV9wnQ?=
 =?us-ascii?Q?RG3p3lsrS2+vDI9AiV9hZrqO/ifHJgUj21PDK3yMoc0dznxv47ofpuWmXYWo?=
 =?us-ascii?Q?HPj+rgXhzo1hBARszX5tHPwyjBuH98N2WfFaDZEBrhYjCX6CQvkJ1F4dzwBq?=
 =?us-ascii?Q?wGs+GsscmFQtEDcyX6OrUMgGWVj1f/N/2SAk25+1+OLPCmDgbFwMAeCzwsqf?=
 =?us-ascii?Q?I8JDCBWonIvYnigz7ZtGjggDe89tLdvocWclI9HZVMVrGJgsZudnlQHhDGtb?=
 =?us-ascii?Q?OMgqcO9T8ArUzOLnkbTdtUedHpGjwxaODSRqgF0iV6omUWkkIW/NoxU7+1KD?=
 =?us-ascii?Q?vPG2tJacEASpF/wSvaY+QAI1SK8wf+uJzAniXV2dKu8OChb7Y6iAMGaLmWkh?=
 =?us-ascii?Q?666jQRmPx6H92YWm5MZLd5Om1t0VwYUis9GmDUf8PYCj3gI9Vu+a7BzVY4mI?=
 =?us-ascii?Q?lb8DeNtHF8Ozescvs6IDc+/Bawt1fKoVz0vjls2KtTYfwTvTnP5RFQeay0Rf?=
 =?us-ascii?Q?iQpzHA1o8+KQOc5P4Hwz5imlAZ82FYpmwNMFvjEa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a941fa-8f85-47c7-6b14-08dc256b471a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 10:23:06.6492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKnGrjMGQel3fPdBxDJjLotiViUzki7MP1X8AwAxl86L0/9DXiFqM5DKjfLCmeqpzDrQwRXdnIevcP0u/Fy9vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
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
v9->v13:
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
index aa76609ba2580..0731b8b707f7c 100644
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

