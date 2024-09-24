Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B833983F47
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C5910E5EA;
	Tue, 24 Sep 2024 07:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="k0u1Sko1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155D10E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzeeuteDLxd4hbN1VBLUgyg5fLQ0a+liP5d+qJox6aerLbW6/+4jXpaRLQqeNpQ6Ml1CNZswXBaPI6pMQrywOYYCf15FKSdXv0MdBwnSENPQwcunO936CVqjF7auERn0ToWsNXtw0RquvPLW6xTn92NJM4fM/1ibOyGu80pU2aonWGieP8V2PkgPJxygT4C+rte91S2hZtcM+7YiErUZXcsJGDZpSmMoUjHRHH69Pb+kd1i/kR81VoItlBOL11I2vVG//MM2uyAheJM15/MvigI+xmdXm5Tb8VKDupp70MV0WGsGz8IbACz80+AuL7GrW53oBslxdxMXns6gpV7v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVNVwOXVWFzOeVbw/bwP+iE1CpBdSXlA14FEA0vxGWo=;
 b=jbqVRkU3RV+/8xBx8Q8Ekq1ikUPKyeHIZfUg6a8ID1AnSxoQbM37B0mkBmlN2ACcT/qaKZMxqeYxKmojdxACCDnor3Rlfqf1cM4z/VKn5aoTytIwiVpXDDSqoYykfXWqHXnS40F+wLt0Kj8RLkY3LV/o8ru1ox2kyRgsXWipyLTwBwNpl43NEfAE+2eDR6RnpykIZn1ObyP7yEEHTUyv8nGhahclkDPD+X7WM3K6D9CL1HI5dSPjx+9qkQYBrkMittnjSmuVMrpOCrIM6BfJ/qrqzjwyRo0vqqkyTIy6J1ycY5gQt0p7LY0aU1XzBTvIaLa9/PoPnkGrf+8UP7kUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVNVwOXVWFzOeVbw/bwP+iE1CpBdSXlA14FEA0vxGWo=;
 b=k0u1Sko1QD4Jc/X43uD9aARMi6/1kSS9orqqJwn2hE7dQsl3UMd4Uy3m/pOkdKbZnkH5eDhz7lCLx4YOIgbYNNLJ+a7/wUGsmn33O1qMZGQpp7SfyiRf4+C8MPHuhbMS1iN4QkNXI4R9gl5s8XCMt4dGs0WATJCJVQA3sikDqPx01bXuuQr+mCttMzK3TNjj7XVdpTMKcYTA85WJWyfCTk/U9IT19C0Dx0tYaGe6CJ/Iyg7DeTWEiZLkejtlNHvhIrkFnWuct758nAeBJO+W1vLYMbroNzKkwuKsTM7phBzWCFmVmGzfdnvVKHwD/A31kJsY7E09YE7A2dKSoU71bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:38:12 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:38:12 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v17 2/8] phy: Add HDMI configuration options
Date: Tue, 24 Sep 2024 15:36:47 +0800
Message-Id: <c9c0c1c2e156731a46ffe0cfa3529e6f0e6a1e5f.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e59403-4671-4530-cbd5-08dcdc6bd7e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pGtkiy18pPys2xRkF30tNzio/Wkebo+aSLLvpDH/Knkv4nV0b5P0njPkoAgK?=
 =?us-ascii?Q?y9+0h2R3ikZYRAw26ALlUZyGHlV3Jq1lLWO9kSgSem9UgNEGdePlSFnKbsyl?=
 =?us-ascii?Q?cJEQqp3oLQQ34OhzVzmiNoRL/4iu6ISvBImSNY7nBzifMELf6X7Azv2riQJX?=
 =?us-ascii?Q?Eplx+1CtHqX8H6ZLgLMZTCcfVwYdZahAmSr/QKbSXuy44G7WSq9kp/kQoKld?=
 =?us-ascii?Q?53ohiRAkNQsNTIzAwezi58pYA2fEwagSaaYNfpCMJElEkAqJ4wsCQdoowA0d?=
 =?us-ascii?Q?yL+3tJM95wcliZ0oUjfW6dIsYRjlXvQ+vX0Mz7eOO4bB0QJAFLWBe8XEUByw?=
 =?us-ascii?Q?ohtNVbkB9elkpvXnAnAAi2tDMDpDbNoFI9J4lm9cGuueW/vuj3iMW/EtuE77?=
 =?us-ascii?Q?V1nMEwpAYCi4q6d+H6oFWOsPLTmWfl0dads5jySVauVFkx7++vDvaxDEao4Y?=
 =?us-ascii?Q?zeUZam4rS5xlGwhCiEpahTaVTEVg9AuRJ25OFiA61Ps4Nth6/dv0zyKKZXQd?=
 =?us-ascii?Q?uY46seEUpDLRnHhETluoCzLaJjZleCuKe9Qt5qgmicl+kNTvAS8+aWNovZgS?=
 =?us-ascii?Q?MPC5/l8pe/pzH+VpEmaMT1y0WEdlXSWYz0yUh3oVsvV5Fzk6k3JwYUSqxCXX?=
 =?us-ascii?Q?+rT4FdWEdJuPt1nBs/SLEBYtLzZUmZHut+m5BIsBCsREFrlK8IiQKU5HGWCc?=
 =?us-ascii?Q?ImteRoIHIaeS6zsy4hGXX3kbmpeMFL1yLCJHoWpb7wsd7QrltYm4k6V98U+c?=
 =?us-ascii?Q?GI33yETfTw6BWjCyY+OA/ZWCLkjUwj9CAr6iGO5jxHs7dONlupoyOGYfxBqI?=
 =?us-ascii?Q?gDHkUQ0dHj9ZtVbdRYWAa1qoGmYNiNoAAXBTc45sWdbOryxhjrPCh7Sta76d?=
 =?us-ascii?Q?Rh1B/ltRVUwovGbBmFm0CXiCFq2yrXy9K8khZhMhGv301OcFYQxNU8mWQwpR?=
 =?us-ascii?Q?unp7BJTTeO6pWAlBwZcWj7301WQzvVhSIsB1u3DI4tHBBwmCKqHeIm92sgHE?=
 =?us-ascii?Q?n4BzT2WuRNdhcDJqfzyL+cvkeyBKpTDvJdWjm7lMtrHa7IUNB0+dumlLvRWw?=
 =?us-ascii?Q?rAb+MdxjDp9gSHF1Bc6SQ4gSlLVyk6tlsn2D95XfyLtO/PTGyOcLclc8asog?=
 =?us-ascii?Q?lt80OTpv8Lpon97Hi58V3AWSIJ6hJau1LVzIghrNxEZSQAtT4qLSDS6fQ+Xv?=
 =?us-ascii?Q?XKnnJtdwFpaKqr9bRtscAFib7MZ/ShK3KsULsyM41Bq8eIpVBgMlnhaFpN+F?=
 =?us-ascii?Q?h8jmCiFhjv5JuVR9PDJgGFgQGz+JVx01oJCTXv0twhV2w9XOBJfGijWovCrq?=
 =?us-ascii?Q?WAUvgO2ZHDdwwxBN2BSMV6Syte/ueQ8V5+2chV5/aqDKIRt0dTkklzto373p?=
 =?us-ascii?Q?ghMrmfA7FhcR9POfyYkP0t2Z8rgMscteknMuEMBovOa+SVguz29Hp0SKvS4U?=
 =?us-ascii?Q?AjSzy7lVfpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wP2grfh4WT3GKwlCPL2rWkYnMriypqvhN8wzEZ1VdGZBaebRnNV3AXd78tDC?=
 =?us-ascii?Q?s23vTtzLDDUoi2W5vtmV/ZcfXcsLPJRRUGIEf4ovamwIkYYbl1nVFMCfo5HE?=
 =?us-ascii?Q?MTd7hfDHas2B9Ty2SDkIzClH6G2NOXdtFEXsGYOJqRwvqXaYWaruXyDbmQc7?=
 =?us-ascii?Q?w9KfWVNciicnJLyjHJNjVWucUcw+8cvq5zuvKvDyutsD9ik328wQDcMSOIym?=
 =?us-ascii?Q?z8w/J2qJdKOjlEow3ZdF666rt+8/tOPyDcbaO4EPe4XCsKMt3YK5meWZ/k/D?=
 =?us-ascii?Q?BuYc1WgVyOpttoHBvKxqu2P3O2pys7M/dDINGF4ZN7AeoaSqqazfm8cBGKF9?=
 =?us-ascii?Q?0QOTGMEJmBXE1+dwfJb0nMI+R0XozxozHDF+O+vUemJHj8UgSGu/Glu8bQTr?=
 =?us-ascii?Q?QE3GCgGh6I725IoFM0CHP24+41bGsFCIzB1mgu/m2bHw/OmgLwUIP4wa811B?=
 =?us-ascii?Q?3bniaIAuDsVjvNaYM8Ch7GCMCb5MgNdUdf8v95YW2Fclqz8KQ3c3HhrJCDo2?=
 =?us-ascii?Q?szJmNfK436pydBYPfwV5Jzz/fHKmnu0nl1cDsT3n/Hwjzkw+KH9ZqSgMQF5x?=
 =?us-ascii?Q?4OMN7ZFOcPJ1OnfD/GwneY3/GDpv0/a5dQFAHP5krXe4ykEwjAIGXeCVAn7e?=
 =?us-ascii?Q?Szl56ZsRnbsRVASA0T5+Q8uVLySJ3LK1EghC+Dmlyzl6T+qKU/lZd/zkRrEw?=
 =?us-ascii?Q?tgoOBGpZ++KlnwnLacPP/1j6v7fRcc4ryUOeMl0It/QVvHBek8egZvWMiI0f?=
 =?us-ascii?Q?SqlumbcSYO/rGTfyZzf1Pxt9WT1i/mj7abcnzSdXU2E+UOdprYPauKApO7CO?=
 =?us-ascii?Q?tFoPVRVqGMgiAvKzxkmFfQAhny60Zg+Mkvpv/iyyV6tVOrco/4lyK6F74qGv?=
 =?us-ascii?Q?/zSQLSexDUStBy7+5/sdRKlMCxIqjafjsyUrhGqVEVajvdYNNJ1d5MbWBU4f?=
 =?us-ascii?Q?CosjkK4nsxiR7PMp4x7Gi4k0q7fmkK4JkZ5hKMGoS3+YkadQtlGJVic1sDiI?=
 =?us-ascii?Q?zrnrOBuxyoGDy165hXwhlPVtf4zk/QBlJstyn1wYUStXDsmAWKODcmTPkLCk?=
 =?us-ascii?Q?ktwF5jMOxms8zfsk6yfJs71AphjwjHV4xjUveFBCfCLHwi5ywx9xxH0Yut+t?=
 =?us-ascii?Q?NzwLH4M8K9AyPx4hMFagUoO/ZMs1D83BlZp6lIk/9hBq1LSfZbOtXkThJ6cA?=
 =?us-ascii?Q?g3tmwSx5YrgNQG6hrxtcG/zfQWO7x6CeaoXvrl+GJM6Y1mPUvCOSO0T6gWHY?=
 =?us-ascii?Q?scNH9ks7t4Fwipb7TgfnhVL2yLorCepvKL/N/BAhtROD6Vhw7VE0lR6Gze7o?=
 =?us-ascii?Q?YR285Yvm+Xr4sUGiPefRTSl/ZF5Q+uLeWsiF+pt/WuAMsRdX1DUbaaIytaEP?=
 =?us-ascii?Q?FG1iQLyFuidELac+eLX+c+mKiiiQEOCuRKL2/CV8+QUcSTkFvWWQtHOoUuJZ?=
 =?us-ascii?Q?LHiLrj4aNc8iDPkOcszZ/Q+mCtHGRauyVgiLby56BHqK9w4Wahf5LP9FDJ75?=
 =?us-ascii?Q?91g1mZ7UmvCBcUk1XSqLSTEzuSaDTM6ReWbqEGPP7TT8mY7GlvUeaWFAQAvU?=
 =?us-ascii?Q?+0dyEo1PpfXTeFj6hctyi1xMGEhAd52CvLjJ7fRv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e59403-4671-4530-cbd5-08dcdc6bd7e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:38:12.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQa97ULIAx28pa0XOtu6ISFAz/0OXQ83I2zyAA1nslkyGxgkgzMMPrd9lSUjJowb49ynSXyjVBgbHnzz7TCMuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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
---
v16->v17:
- remove headfile hdmi.h
- add 2024 year to copyright
- Add r-b tag.

v15->v16:
- Remove pixel_clk_rate, bpc and color_space fields from struct
  phy_configure_opts_hdmi, they were replaced by unsigned long long tmds_char_rate.
- Remove r-b and a-c tags because this patch have important change.

v9->v15:
 *No change.

 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000..6a696922bc7f2
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022,2024 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned long long tmds_char_rate;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3f..4ac486b101fe4 100644
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

