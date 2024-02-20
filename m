Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D823885B144
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 04:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3F710E057;
	Tue, 20 Feb 2024 03:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AXH9jZCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2087.outbound.protection.outlook.com [40.107.15.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA47F10E057
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqLmuDTyEylRZHV5yh1fFjcQziYuwOrhQuA2LbPS+dVz2dHJiIDjK5cWDWKd2RIsE7uJIB8qk94ebQ/mp7EnWJH6quUXul6MV0tYe6iaeXRiVgbt+YcsjjsbWjD4a65hAgYqdG+iY307pts+A1IJzSfdH8bgEJu0/UmpAxL0SH8MW0vPK83XGsKUeLVAHOZw82nf4ppr+zn8kXhkw3X+OkU5kVZ1auk3TA46Z5LlOx2MIsA0g04yNofVYuP+ABPVmzXkJZ8jh+ed14+LWUH7xvuQPUF/b/22G7U/8qAo9b8fd04L4tO/poGgWZwKlmbep9F+zbRCx6vop80T1J42ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt+IWepbYcCS25duvBTyvvBwXG4pgNgpu9mwfkem+Tg=;
 b=HKr+X6xVeQK7X+Xl98ldQlIPENTzg4c2ZV3wVnv4kA3a5/CnXlaPuyxGukNW3R5wxTBE8gzeR54kMemZYz+MCqmrGAx3ro87EnRhZtULwa/N4gLcLgtKiosDvDroZpSEBaWEcCM7emj6gptsfFIS202td2A7O0TWIlc2and1ig2xK31x3ybYmAOEwsHN83qfUFzDehj1smjLTdYS0Paxzjm0oSX3KFpJrJyAo2TCWunhohSri4cZtmoRx6uY/e8CvCwpekJ5jsLoxHmfmqkqveyUxi348IC/ha8a7WI/J5grdFImqTNa39HGBChj5ctQD9VzMWJcbBeE9sEKImGQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt+IWepbYcCS25duvBTyvvBwXG4pgNgpu9mwfkem+Tg=;
 b=AXH9jZCPHifYgsUhvnUInhEZWSaoozJXYgamDy3/lwAmtlpqAWHuaJ9bn6MDmwNRpnAuFigA+ckG9veCN+sQ1d+XJvujcPd/SEpGc5BTxS2klXOEkXFwncrL26dcw8h13FZE2Zw9OElDPWpvRET2GklJFe2KH8v5s6x1RT4/pbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 03:25:16 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446%2]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 03:25:16 +0000
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
Subject: [PATCH v14 2/7] phy: Add HDMI configuration options
Date: Tue, 20 Feb 2024 11:23:50 +0800
Message-Id: <064ffb53f4ecf25f5d07f64d050ae0a4646ed9fc.1708395604.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708395604.git.Sandor.yu@nxp.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To DB9PR04MB9452.eurprd04.prod.outlook.com
 (2603:10a6:10:367::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9452:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 97408b52-2b52-43c1-9b70-08dc31c38ecb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEnqjx/dtg4byT5BsAhPEztEVYdwKmfC52Rx0/tCHUI48aKxQvNRf51v5pf07TJ8e9GLG3evLy1kl79MlzH9iYLW5zeikrYzCOYGY9ApJ+UQOWywZUZ8e3103+2bH35toUOOWG42I8K7kPtNw1CZ/EdI847Y4xTIKrKvVFbfdvW/pbEmaaoRi/d7yo/X+iTRXZGqsbv5+zX21uB3N+mKg37gdjIUdSwrRRDmFoqWZ82IRVtw+F0TJhmwvS4SQY9OMfQ/QbQ392xF+0YIpA5YDeLhNEFxfX28jgs8+VIhiTTlOiGY0jezqk9GMu0WrZsSdrHuOKNz+QtwDKOT8njibUMEGoDG24fzdbcpt6AErNlSlkmUPr4P3yYYbRJTJ0WdrxzijhtBJba9ytLsEYGyCLwJLA1AmJs28CVQOO7rTPbDIfIzskl9kmC/ORVVuNbdFB3kqldJYmgN/g0CSCyT6M2VzfyX/CWdFObd1+FMbTdXu1CmFE9JKSLUE4JHb1jd1JhQiSTemgaGh+DGMUJ2D7Iq/5GX8R20o4D8noeizbUxvPLgSSwiolN/2hIjF2du1jL7UDpvCvbcvKVl6yO9DdxtQr5z3FVtJ5Hgu4HPOJ6af8nbrOULUtNEpwYeTxLCPpQZjgvlnnrHS3jF+D39DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVUOIjWkZ6BXlHeQIbD16LqhER33Gmdu0zeWJkwRVTL8lmaEYJV194nwhJLO?=
 =?us-ascii?Q?os2RgiXpt72579GozZ2Q2CGv62wvw07SRzDByHPD+xyk3eTTtik1mlghRTDl?=
 =?us-ascii?Q?b6sT+tB+5N9czYmip5oGWsIFnc1gMzrbX8rSrZ91dLkxUMt7VB0cSvyp8a+V?=
 =?us-ascii?Q?xJJ6rB5xAzKNLBPnxgd8iAZTUMaixXiXFdhdgoMRFSJOTSxxu2r1uOiFH6ZE?=
 =?us-ascii?Q?VZnOpWYSe+ZACcgq2wYbxHTnwRGEXlJuZ8qdVJzlfKCCk9MVKgNhOlp3Umy8?=
 =?us-ascii?Q?v1h4UJ5TUrxvfPjmpgczcMnvxaLXeSs4qIsmBV1361MjPSqfNnS8BjfFhfbz?=
 =?us-ascii?Q?qs9aYu0m8c2B9iv8BJa8ZPBAP5/nbfbR5FXMBBIK0U4xRyPCjY+necE5/sqJ?=
 =?us-ascii?Q?Osg4rGPKoL4xqOaZjpFDME3rlxlybA7y6YL2foRtB6JETP0KVRiPBg6zeQTT?=
 =?us-ascii?Q?TazAanxpBzDM7DuWb2GlPDAp4viz6HYFA+/40Wcr+gbeQptKMDvBL+MS68Ic?=
 =?us-ascii?Q?gh0f9RkhXIbm0Rvi6CST9X4NuGuLRPQAqmxfLPvMXIv+8fcmAa+KO+6gaeF1?=
 =?us-ascii?Q?cKW8VRJxJzbMfNalLQnlEHKaDCv89czMpl4v8gfI+hZB6Ng5Fxz5mKT4oMk6?=
 =?us-ascii?Q?ChOAhjPB8R8Knx5zB4UnJZm6sXqC5ut32bI20HlUFeQv6wlHlp9kfhy6rpGw?=
 =?us-ascii?Q?ppYnjpZgqIMlzPzjUMZUZybrFdmB5ZzQQDnQ7iKbFg3UXDFw7zCPVFdUVy2O?=
 =?us-ascii?Q?2AgLSBdEUVKZCIEnxOApPDygveoAkS3gQvyRcjdn+eYOpCiKjkIc6tk2+el9?=
 =?us-ascii?Q?Er3BNNvAk5VXFjONgNJwvDZX/Dd72o2y+MMr+4kZYKd+lLKmy0gir/jF+/t0?=
 =?us-ascii?Q?sX0ahhoz0OCjhp1ttJaduCnoAYtTuvMb94iYh8nMFui31h/jGspELjY4VG7z?=
 =?us-ascii?Q?9zUidO8IyG/Mt8BNo+xWUZT8+/0xPu1ni+Jg4wRoYgpjpU+VQ0kMW0WhFAlc?=
 =?us-ascii?Q?Za4zmhSGV1pWqciMzG19eK4m+r7IdJk1oJZvMU2IAPGnzPFEanrwM/mGvesU?=
 =?us-ascii?Q?2fJaYqiVPEoq+EhywCGF40Up5rHuh0/5IvLwd0YI7QqaSdhsFZ7DVRHmLXFv?=
 =?us-ascii?Q?z6anI8uhInZL5MsZC90/wY8ueSDuCdiri7cihfcY4PBCOv6fPnR52/OD7xkd?=
 =?us-ascii?Q?uT3oiDIt6wCvSt69oAwk4jQyhDRyEp7YG/cDVSwmt6FVj6IMGeGrCJqK9MfF?=
 =?us-ascii?Q?/Kphso1cfDUniIqWeT9tHxN5ehCJxdFYGF4HXAjEXBJ2G1TRkMX8M5b1l8Aa?=
 =?us-ascii?Q?PkLUKCa1V078yoSEGyAlG4jK6GCd7AqFb2tzvqH47kQGAf2099+HadjwXZ5R?=
 =?us-ascii?Q?mvFJYsf/K21+u9P7ovx+jxEenkq06S9oLwzqtmKZz5mIWsCT4LPiKoZci4M1?=
 =?us-ascii?Q?bPb7L7FXWtDrcAt8yvcJQHGKe8ggQeosLIW/+2d4CHIHiT79TFDp3f2R5BN3?=
 =?us-ascii?Q?cYZLGuPd8B1BEWOjKcRSKsxywnRepl1tbpFh6BlfdiTCAQOFsmA6Im0qe5lx?=
 =?us-ascii?Q?s10yrdIyXxg0USuMleDZN6qQzzhtGb8PqQmqQ43l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97408b52-2b52-43c1-9b70-08dc31c38ecb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 03:25:16.6003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtQ0kxfAofNsYnCFZHNRvx4S3XAhhCYGdbWAEAW5p7ThCgQdLbAe9bbwLk7ym5oYFR9O5//4mBCd+4digzl5dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268
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
v9->v14:
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

