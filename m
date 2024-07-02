Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F9923D90
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912110E1CE;
	Tue,  2 Jul 2024 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FiMgo25+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99BA10E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1gcpXeKJfjWKc1NNdCuxNvxzDH+kSEOekDmCqguW7wngSB9mDOn77A24mIEJnjrq8++JzzDTpTjeQAItZw7cSGLVabo3Cfa062wNCJJfSi9tZxtgicQp0ckL9JkO1XdDV3br22UYEZAsH2MBmDcCc+9HdN3Kga9kOwAdVzJm55I+QZpcrUXBAmqnJzLB77OCmijr5iHfKD6hhQTkFpy90RXLDrkVN8CMuiT1aA4uMM7gb8JyEb1DSbhn7xpYcO/ynkgsKRdzEbVfkQIUKmQnXQiEOiZAnlj1ocAjuyMwbsIRoHXJ2ipXv/sjRZFO3iVff2PnNvnsmGE8HcQktIiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rvyF4WRgf4bVK9mb91jorAvwYvwn3sqxhXL8wALUpc=;
 b=S/uTtFQLRAuRIxQLxczuxwdkLdrxEts8XG3cYKqG/eNcTgX1d1R6o8G+mXwBansF2MrxTVBR9EN/9Bz07l1B75qyc6GoqrzWUlm1aisOVwSmg6HCW8wMdKAcDlME6awEmk48PMqvaqXd+FJMSm9iUuMUTlCDPdjY2Kn2Js3JBcpRKcEKpm99Fh6+HarIeJ20Do+8GpxWYWPF9+TkgrXMOxcYJjAtIse+1jdQmO3Hq8DpVMLAv5bYJwIiX+7vdslFXhjmxph4GegsBsw1ijSz76BYaVheNC9/le+YRDGy4c3PbK7gvsWMb3gpY43o9zI7kkYXWQfBl7kpw4AWRgMoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rvyF4WRgf4bVK9mb91jorAvwYvwn3sqxhXL8wALUpc=;
 b=FiMgo25+oaw3uRi8SHkWyPS0FRwNlLNzmY8E8bd3jd3/gyeg/8MY3chAXRRncacLzg9jvjruP9FKccGdjBb9MD4EaRqGHdvernBNmu8TYgmjxJayC6KuTCbBYfGyOxU87fYvd1w+6ESYlbFbsYENIEbjxVHvGSoCQUsmmdsyy1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:24:05 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:24:05 +0000
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
Subject: [PATCH v16 2/8] phy: Add HDMI configuration options
Date: Tue,  2 Jul 2024 20:22:34 +0800
Message-Id: <b1acbd48470d41b53b359d27fa2ea9358a037324.1719903904.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719903904.git.Sandor.yu@nxp.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e722f3-dcd2-4664-bf6c-08dc9a91dd26
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K6rqU2eATeVi5TLBiSVWzOb8mBE3+fvjFgF96DC84FKi7ajo0j18RNNc5OiN?=
 =?us-ascii?Q?0mFuR57BGclQyfiSk6E0+/4Q6QXblvaspDdrHFFjJE8NBru0AeN8D1b3dcWO?=
 =?us-ascii?Q?64WuW9v8uVmNxA1QDZhcPfeVw3aVLMN7FWyLZJgLU0wPSDlCRlzetGk/EM5J?=
 =?us-ascii?Q?GdjY15Tsii84/Fq2q/0DoKV88wbqKAnkgJdrzOP2fSIZABZZo2lQB/xfY5b9?=
 =?us-ascii?Q?4tPONQiHZt6c1NJcZyKco/bUqE7ocXaK35RtIomLUlXEl5eugTsCvf721OHq?=
 =?us-ascii?Q?cC+refSUugiaY6nKoo4RnMB5pvjehy+/n2D98IRoUXVief+p6FJ8k5KSJ+fx?=
 =?us-ascii?Q?ZAOQyv85CWIarK3W64fvXfxlwlx73OT9UkbNXqdeUk+vvMQHz6TTrYtVLdYH?=
 =?us-ascii?Q?3g1u76uebwdBcwgjzgwXFejD2dzYUV+oX3rjPZZrJ2SiWm6+gvjqPmrNBrWe?=
 =?us-ascii?Q?Yp0NzcLN+thEHPwhOs6QkAKMSdYU1ox+xqRmo3PID9JWyQDFVi1pUXLco7CD?=
 =?us-ascii?Q?7VSNADI93ZRrco9LC9rdcMmiHHKBX4VZZttkYGRLOjIit38fV9uNb/vSLLzq?=
 =?us-ascii?Q?WjKx0cXIY8bffDqF/lyun2ZPECWymz+IQkWJ+/z3IkKaMqpGL70v4aVaDrBv?=
 =?us-ascii?Q?TdvixCcu0gyh0/kQudqqAguxaIbDTECo+UoRdV76y3058Q9efAy9Vg9To1e3?=
 =?us-ascii?Q?19GF0zREQqzAVgEnR2lbZqAksfqrUgnBBOojPJERIRuzGtjGNEOG6/aG6aTl?=
 =?us-ascii?Q?os3GKjvgE23Y4dHKVhRtelK2anfYoZmPMozZzz8v0SyKeo2JJcb+JmVhYM/Y?=
 =?us-ascii?Q?0N51F8tdE67ML3Y125boh/Kd+kaz/zsCzs8qDQ7aS36kty9FE6q69O0GlBbn?=
 =?us-ascii?Q?U48fmuX60MlLP7mar7FbyH+OfaZFZ2GcRlOGBK7vSehD40U3u870gHJhHJIR?=
 =?us-ascii?Q?QKjp2hXaqaobLVs/fS68ZpnlygQX8ULHdoNPTEHxch7ZEyF5J5KwEyC3Xvrj?=
 =?us-ascii?Q?iox3ZI0jItgGdFuId5hHpNz1c5+CCsUtGD/jQ1XGeh8UtjVylkMDLwE5tMzx?=
 =?us-ascii?Q?XDrTZUhPNM7d0EXG9uCB6iddMICLYu0NIvhckVDNyHhtQtJx7wiuemF2znZ6?=
 =?us-ascii?Q?4v3/Q0KYIFJMrCzpFQwsPjQKmf1ldFEkFP3GPAMruPRQONe3Q2eUKr9lv2WE?=
 =?us-ascii?Q?zMj3vTwq39OJNcGFzzyUTyyR/9qcRO/xhbbbf6YTdRWKtxqiZNCwvav45SrN?=
 =?us-ascii?Q?qqbhSmfaKhR1bvfh49KHNQpFvu4nW3I2U2541WmLOS4BvigtzzEI3nmPS1/s?=
 =?us-ascii?Q?91k5K0edIfQDzZO/4IX1P3HL3CeyqXt1SCO/h0iK4guYc50c6RXXoc8f2kcE?=
 =?us-ascii?Q?k149rr4WIUFBrmWWm1Nh+dJVTuaxj327T/uoWsgWSSL2Kcj+2N8yURRVXji1?=
 =?us-ascii?Q?otvlR0CK1JY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AK4wsy8GtFpJhpEOKnhJFBY1VbxZTvUE+V36dbdEaUpvA5YJgGzBpyJAdEiD?=
 =?us-ascii?Q?eSsBHWppiak45+X3oEsTmscwwBD0KwoI8h4gJGKX40Hg9Nz3xbomnU0sEwNb?=
 =?us-ascii?Q?2t2Cj5nc7mWUY8Tvrryg8n+IKM8aed7Hk1mAMrl5gen5s+2KEhXBw/ck/VON?=
 =?us-ascii?Q?esHLQcNyIKmoZqPc9nPu11YyEhEIS+YbrITkPeZbmW+VS6oKL6N8H3fq7WZk?=
 =?us-ascii?Q?yD1Thub1bYv1joQcmqdB+3lGbOjNhPAMddteYNPhKTUyLS/VaJWcqEmDU7O5?=
 =?us-ascii?Q?s53J86Mq2VWQOXO6mNlngQshZal58jbg6UGABhR5OVziM+IMHiXYz5AGc8q1?=
 =?us-ascii?Q?JQsXu7NiImTUzzVlhcRe4W7aDgGT+FzveOaN1bfDjERv6wMpDpWHV7QxW6Sx?=
 =?us-ascii?Q?dv7NR0UGxY0bn0p8+34eYrJ63o2y1CKDnD1wyMgKJvXOKbjwlHCYGiZHZcG0?=
 =?us-ascii?Q?MVmnSpP59/jDT85j44Rd2g84Ikpi/ArFmFmtQCVwLRplrtxoJtuBu+cJt4Zk?=
 =?us-ascii?Q?t+F8/sj++ZggXAT8UCI7hLQCW5pwauTfdLJWmxmWSsP6gE+g6gChzpolldzx?=
 =?us-ascii?Q?gd4taIuNUtF7J40gykyJTk46X8brjMntGfoqBHRprJD9sctSU6mxLpp/uV/U?=
 =?us-ascii?Q?tpG+FCUBJL1fdoPwJYgDj4xTSI98cnO2l2A2zvQ5agqViPIE5YeXv2Gx80dW?=
 =?us-ascii?Q?b3AHnZM5iceMq1TgH1qA/tWWena8SeKLmT2lUr3/gDK4lHHU/C/AFTBCm3cd?=
 =?us-ascii?Q?CZqNFYNrHuTZaceuqQ1pBYDsOuatJpWjepuJWm6q/v/a2wIAaX5sk4dcYePy?=
 =?us-ascii?Q?08Ktw0N+y51Qghnu0g/WR+6L2gvVdUai3EMrOybv3sNQX7UBdYpczk4l6HUq?=
 =?us-ascii?Q?DKXpNFztn349+Gf/Q2n3Rlhj7nQ49YItH1S3bGY3587G9a4GEHRMPWLhRmja?=
 =?us-ascii?Q?vOGgHSGcef2cv2OGyE8K6zgGtGLvCdwdjCaqJW+RV3CqB4AT41et6OKDLPbs?=
 =?us-ascii?Q?7fVUzjFvmqwolti7HOlfp2oU706itsqXWDwRHSh5Tb0kkARndHiwtwz1cSiy?=
 =?us-ascii?Q?2i7kKVJM/MwOabx7jcIiVFbGK9PgFazScmUq492ePLl64+DephJeQ/jB3Aqf?=
 =?us-ascii?Q?DGPrrF6ibvmx4x4E+K17T9K0rVs6cbqb5i3fMfsGrz54d6+JkhIycW2/80tv?=
 =?us-ascii?Q?NJqGRHRBfiI2Ztsn66j1fxnPjwQ44qiHqmgt07bHgvwdzYG3MpRDSSOiJjZt?=
 =?us-ascii?Q?AzXas1U42hKmn4FGnwG9rtAeXT3sHAloybUkxGQSAfjcPMMYTBp23CGugBmr?=
 =?us-ascii?Q?OAU9ak62wFFMwTI5sOoij5OZ8FfKAbb+63aAbK77ynjQBShPe2bmKO87R2sV?=
 =?us-ascii?Q?9kpc1AfSxIdGZK7O0xB3PWHYgG9PLq7rb3kpdaBXfhB9bMT0lG9jtQULb2S+?=
 =?us-ascii?Q?OE/Vm5oxr6m8RAThWz0xe8QK8DfJSXVltoa1XuH6RRqxb+TKUyvBlZZ2Uqyk?=
 =?us-ascii?Q?bJ2FpYwdArXuCgwkP3FFNkOYV+z74i00sMknNRJqTx4++WQKO6GSsjHO4P/4?=
 =?us-ascii?Q?ha9PEdcL1mnh26AThv5lsyPiybIv/83S2o4CEheP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e722f3-dcd2-4664-bf6c-08dc9a91dd26
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:24:05.3177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHrN+yMRHgOKDfI6BICeEfYCsbNCDUwwPk3bbbHuLq01mw8Mc/TU8orCVI15S+fWSh8LwpzJc9hKxJCZ5j4iWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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
---
v15->v16:
- Remove pixel_clk_rate, bpc and color_space fields from struct
  phy_configure_opts_hdmi, they were replaced by unsigned long long tmds_char_rate.
- Remove r-b and a-c tags because this patch have important change.

v9->v15:
 *No change.

 include/linux/phy/phy-hdmi.h | 20 ++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..dd923e19d17c
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,20 @@
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
index 03cd5bae92d3..4ac486b101fe 100644
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

