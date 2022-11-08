Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33326211CA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84AD10E43C;
	Tue,  8 Nov 2022 13:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318410E43F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKyl+4MIBdlj3+QuSffFaMAnyMzAVEXxf4w9RwHjLINuNN78Pgj3CF310OyWzbn3VC7TJwGX1hHk1PrmrhxGvfjvK5oFCKxs1QNxcDfwwAEJDz8++xeCnh1VWGnZt7F5UiKS7rExvsibwupsDfnuZksIdst1eA6VnDRDzDE5SmgPK8D9JcFPfXnq2uPyQ8yG4hsshiFFgmuPwyrY2Tv/GimiEwpekd9p8PoO9lWr1dbGKUYqXIZzyVBvIou0UpA9dO6lwAierNDAzR0PHDwq47zLark28f7gKu9sYznKS9KFYeb+cOW88w8eGIyL3Bn+/La0i1/LXn+JrJss5CUCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoMObaoHu8KTKmQ88r6WUD/O/qGZeHbzp5rnpj1bqBg=;
 b=BZVsClp3Nlwz/EvTeL5XADTJRE7cfUrj1Emo4xJSaNGQNbFP5vlmMJKfKtGFT/+fcbqmGMbe7epfmuySf0l01iQZw1MDL8BtvjdudCPJo/DOaBcFHcH6oI6HR9wTfxZ139nftVATb7UWL9qNDaWdGZuyALLMe9wBk2RSGqX16eaPdv/gufc7cEYmpSpafUgctWJlwMePzzNf/ipzz4lXSiCq7Dog7iK2uRXaKy4KGkjDRbrHHA6f3DCimGEMJ5QgABVMNxmUw0P5867sScc/lEH5tLnF1zXVudviP/bRBh5QfYcxm08A/gOThTkKd8UptfUyjgrlnjcHDiAmMhexjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoMObaoHu8KTKmQ88r6WUD/O/qGZeHbzp5rnpj1bqBg=;
 b=fcLSxBIyHqSiAgYWTXSNiOsc07jtpsIyqsCwvxARkg1XDMvyCf6TUhTrORk7gXs9iDi536Y91473bF4invwXks7gM58WYYuEPqCgob80Yuy0H+p6nsYcYbodhbpyMnNvMqKLPPTdkKJ6AOU7LtLS0ApHUf12mg9YySBEtDz7N9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:01:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:01:57 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 04/10] phy: Add HDMI configuration options
Date: Tue,  8 Nov 2022 21:00:07 +0800
Message-Id: <3edf9db8261e7f59dcd84a61a492d2483b1e9970.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7c65f3-8894-4a09-e373-08dac1896a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Ft3WMGaGB2BrKqx/eyvYAVUj933PRROlW7BnDLrdDgXBcSnkJ1OXIdPsww/X1kJVlA9xVoQcGSeTUPDHKHbgxsZWsI55a0HdeE0dEZvszFlk2HLVGqSQq8OQ1L9nS4rWyI5TJ08C71RJTYswRoatSyrHhzICl4qKEakXqYQadvhyuZkmXzRycQVYpKesLzg7+25wxE9rBhxnt2pG8Xyx9DJbEFXBrzFQxi0khQ4LkfZVWSZ4dFqJRhl1OxrCQk4nwSvb39sXCQZGTAyGIhtKOw8jJ8kloZcwbe50OJNGyZ1ifjkluhrIeNbYJPvh1m/+nSJDKQuKpAKHwkEPEVsWtH29OAEHSKRkAqC8dZJJWVgVKRaH9PJNkbBhH5zEHzKJHYyQcCuUXthYW2ywqEAcpINuXJv09d2NI7EXrniL2OFScGNCXbWpxzFr1L0wtrd767SeBeTm9juoDJJeAzUlCWuvGYuKah+MqvFzHJT9e/+4z6Q0Hl6FOtPUmoK8/yMTxfQQBNLY+D3VoytaAP7nQLTRTZZtzFwfMS2cwrIy2htNSnZNkfpPWpAOqYtWmqRCJt1N3CmUOxN0QkzUwpzgEgknbp7u52PiqJqh6XYjZa0VbAJg0F6jB2IoSJ3PU5mGs0u9knawrKSCGUc2+W2AuJMbWz4YkmarHPsGg7oNfBGVvlBN6NTlBspKQDzkr94c187XFJP1D8MXjORx/jUyut6wqt+q2GuhlcULnqBnnkO4rqbYfSIyXCYbmf9WPnmGoFwJHFq3CaTFZ1cc1+EOVrhiCg/us4rRNaHKxtYItw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(86362001)(921005)(26005)(6512007)(41300700001)(6666004)(478600001)(38350700002)(2906002)(38100700002)(36756003)(2616005)(8936002)(186003)(7416002)(5660300002)(8676002)(66556008)(6486002)(4326008)(316002)(66476007)(83380400001)(52116002)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sdECa8tKrKKin4iP+uDMZCN77+SgmdZCggW/aUK9+kmlKDM35Je1ioFMLlx4?=
 =?us-ascii?Q?idNSz5A9i3uEj+PSQECz/vHTr5YAd+k+NOrwgOrj8uJ9bWBfEpHbDai9xVYM?=
 =?us-ascii?Q?/+Ld1J+0uq8ZNhKrCmwAjnSy9ZnJWU8QCGugIlvSqpHLmM9EOYIU1AmKgmWt?=
 =?us-ascii?Q?ew38Lh5qRV9n236Ky8DkuE29cl3hiVbYW7TWeZkayV7uFPqn6FLuAtlpRweP?=
 =?us-ascii?Q?gW4//18oW/KjEUlZQevlwyBhDbc8ioEh73W+582+ULJp73IhRAnnxQGlEKnk?=
 =?us-ascii?Q?+ofTuahZqY8juSctj9JITbOQsX22MpaCw0Qtz3vS+9kSV82lv+dKfV3x3jgF?=
 =?us-ascii?Q?fQMH5RE21+2eZDOlfSFbuJ0/rnHeV1GFpG5jrWzfX3z4B1jK2QL1h7xLjE8P?=
 =?us-ascii?Q?6FEnvUzphsDJjS/n+8ZE0+cWNO4DgYN0Cpg9jt2U0s3nItEszJjB7UDDC3ls?=
 =?us-ascii?Q?iLXjnWJbF/PsXHNPMcVz+DAM2tRUr0Sl9ivPxE6fAWeAwUCfLc3pBv+FXMPq?=
 =?us-ascii?Q?LgyNMMVU4+/MRbZNOZfqXWEX+zT1ZX8I6IynDtew0FZSihrQPjKgESx4Sqr/?=
 =?us-ascii?Q?kPigfV0cCOjSGDy7mCwCqSTcsnkFSIi1kpT2u4CmDccUbwndoaLHbyCC1qYh?=
 =?us-ascii?Q?MClNIP/s5py/727n37TPlHeMGU0VoAnHHDTlC3afcmHpBGFoxBRSXWqloupF?=
 =?us-ascii?Q?iwkLT9H2hIrWDNDALi8xeuyRt58vXqbotvY+k+ASaMD+XuabFPzBvu8OFsF/?=
 =?us-ascii?Q?DC8WeccoWHUtjUee5U1DWV5adW4q0q9QV/R6RhGLgVv3/b291munS+4itWPN?=
 =?us-ascii?Q?3hCrqzpt5NpIYRA9bfXCSwdGR8f1PF8hwT0726rK0ONn5HHhk4G9I+p5iFyB?=
 =?us-ascii?Q?J+NlB9nQZoIILL2DG4xgPOi+dL+0zAM14D/cOBNrLFzvGId5dF7oLdYcULMU?=
 =?us-ascii?Q?HrskeBYJHtGsXWdteFA0XdMpDJ6MrKICenGuhtuzjnDwLb/tIyOke/lBwumG?=
 =?us-ascii?Q?01ZR9aTQ4crtieDNFzPh7//KVpfnnHc9rGHZohHGa31yJHfgmH628iyVWWqp?=
 =?us-ascii?Q?bQ2uJ/xPcZ83hpMov01bl86FgsRdeVaBz7LY1zRe5GCH3lfPoNlAfPGT/a9E?=
 =?us-ascii?Q?FeIEUdUAQTj9eE3YKeDPQXrqJ2juI1O8ZqYkQ8Y85s0YmixS37u6VVljhR39?=
 =?us-ascii?Q?UBVk3qjIGP452CV/ZGpv7gtIHTuSc+WQ9eTWVxd6+Do6rKCY3Bc1ZANrb8MU?=
 =?us-ascii?Q?ipsCdfKvfo9r8iZPGawHeEqEjZBXF3gb8+K0jWpHdoKSGuckv9caifp3w4Lg?=
 =?us-ascii?Q?vyAIHBLIZgCf7kaPhBsvMAkGvGvXYMTFK242YiESks3XD7CtC/6z/alJ8oD/?=
 =?us-ascii?Q?ElftTvM/xThYV+bIe3xy1KMsY6JuZEzAzlr6fvHq9fe9ps+DwIG2jrEWDIFp?=
 =?us-ascii?Q?i0bAvg6FInC6HhUsQRMdjktn1eclDBJUzbusrcrXgVdlD/ZU7jrlgt/2yw/+?=
 =?us-ascii?Q?uO6zLDpYalyTyu8+EzXAkXnx5xADz4+xqFCcA9KC2fSSsUPtFV40yh1/6pWV?=
 =?us-ascii?Q?ygGN0nt0iSP4XFOYvv1mnDX6vb0OWS+VnLVG2cP+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7c65f3-8894-4a09-e373-08dac1896a91
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:01:57.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A9iF78pauRBZrbD2XEfFfhjU8XxeAIjQ7eL83C8n03el7gM23MBgvuVwtItGXwGRrn8NXtuFso0bvHfw/+RQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 include/linux/phy/phy-hdmi.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..73a32eb535b0
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+enum hdmi_phy_colorspace {
+	HDMI_PHY_COLORSPACE_RGB,
+	HDMI_PHY_COLORSPACE_YUV422,
+	HDMI_PHY_COLORSPACE_YUV444,
+	HDMI_PHY_COLORSPACE_YUV420,
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

