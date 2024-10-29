Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533969B420B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881110E59D;
	Tue, 29 Oct 2024 06:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H0llgiSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97310E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRcKyoUkg5fTjFGH1xpHRsgM88Ip+1E2X/MmyO5FkRoY5Ti30WzH/o51oWggNJfCGN/rbCrQsmsCe+OZ6Pg4Pr63MNn+AfF0XzrY7p2Nw/resPD8uP6R91SEH3OWrg1+EvKisw8B+xGvomU5ukF7gY9e5GNUHUd40C1DfWY2DZE7xoGFy5NZ7z/qK7h4y+VhXKcsFQS3FZvxBR/VZbqXw6Zwhon4Q41sHGHjJPcBwQZqd9XhndlZtFxRBDnloU4pkdTiIpYWjQo8hJx/8DZTkXYaFVPPsvhtNNCNYTqAH4q5+MseNXJueCFe4Xe026ix4122KU4dqTJct4njbIHvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cl2GgfvQrPuItTGFrR7habFXyGI34o7VUU/NOXY5KU=;
 b=nn69rACiecQPcfaLajkvcetAHanJGj25dtTyeWoZCwRbq3ZW99hVY8FBPMImmWeWijpBV4fnpnK8+gauP0AcNREs1ihCgT14Li6+N3yOF27zOejUTuBEegVFMdGmXJcRHPKeMKUmIS/yzIfoHAVrwf4dVupXdrx1JeV3717iseNQ/ggJ2T+SG6Zkd5RbtIDA0UmSEjhQoJGC/vIgLb/7NXBBOjT49jgI2j2fPCkKDqaiTvaLZsmw8rkP/cdZ+RRf/zaVhicHtUafCZ+SiHZdUaIUDIuxcbeCJQmdSsvXd5FE9mYGzqY6UHchfCk9OTXT4u63APuKCoUEDs7niGYTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cl2GgfvQrPuItTGFrR7habFXyGI34o7VUU/NOXY5KU=;
 b=H0llgiSmKU4JyhwNvAkyjAtW3zU1cjpdhi9B+uee+MUzlpsWO8pdxiMd3oLsRjb82DAJ8blCHMU0icEnug06zhG5/U1bB9i1ch/1Umq+S3gkXpA1JKy+9Yoa86fE3DOt0jJsln6mvO5JLVWDTMr6x8qKV1v1VjgjurH8fkZ8iLvdCHWrzf20YsMMWKSc+U3EcoLwV17oDk5thTZFeXjcBrZdPRFaD/aE7/OPzsIMAR9vWrBgZCZjtIrhzx/YYuP1YkX6ta97Exfl/s03hs2NeinJcp+AUhw9hk9Cf4aLICg3xNoQ5BlDFRRwK4iZEn6VJXdCIc3dtWaTnZIlvX84dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:04:35 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:04:35 +0000
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
Subject: [PATCH v18 2/8] phy: Add HDMI configuration options
Date: Tue, 29 Oct 2024 14:02:10 +0800
Message-Id: <64f6885b5a5ca89c8214b3138cb58c3133ac2109.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730172244.git.Sandor.yu@nxp.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 001e49d2-5472-4c79-f0a8-08dcf7df905e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4d30eftMQk+rdFhu4JfQMt4U+kZGYXDQwp9ugEbDLzaAoLtpl1pOMVCvefs?=
 =?us-ascii?Q?8ks4koMFsWCTQkkIz/IYXWHAIw2kyaBy46PeactVb5Q7QFJYTutbZgZRRtIf?=
 =?us-ascii?Q?qfzbnuc3Lyc+MOuxChS0TUFLmVO7Q6QRgN6ziFH4DVGVVz45KeQomA5Ipi7j?=
 =?us-ascii?Q?VVO+pU3annA2WFecmwrZfX/md8r/SXqBWGKvKbw3LGh98dA0bnJOjs2IAedK?=
 =?us-ascii?Q?aoG7bJ6LQX7/RBXD+Wm17SA65YIMoZeCk0qO9jy78jTUiFCDuQgyFAbA0r6z?=
 =?us-ascii?Q?AdadUkHsF29geAqvFneTpGkBTZuSB7KXMVlknoXw1O9uL5fFvBZK18YoCJmD?=
 =?us-ascii?Q?SZozG0Bya+N8y9NF9HoSjGFJsJWDWEHwV3YcJEyYnkMsqW2y56bxYehPtt8f?=
 =?us-ascii?Q?jgtIfetDAUdZhEL/4XEuz//ciNa2xeqtzdiZ0ABVDde2l03Nv35nUnKWKzaP?=
 =?us-ascii?Q?dG6EsOq6oaZKAEaOLahQl9DagnJyziT5e7FOZUXU1I5zyPbPWhWHwdv0Xica?=
 =?us-ascii?Q?6h5tnWOQVQzMVXHrfDdYeRn/oT6QA3AFNMRMOOlYcGWFOj+PZmpuS8Kh5ldK?=
 =?us-ascii?Q?FKegq7WlsgJaimeMlo4Wo/Hxk8UEpip175nWE8eXMRj4+pCUCu35+d1iA5da?=
 =?us-ascii?Q?dJrY6O37Aa84P1lmvcycqXIjdc03LrF7aWicxE+aOhJ7zxCxFksVbTBRuuzh?=
 =?us-ascii?Q?1ubAyVhjhOVnafzsU0xFZU+nLUQHvWb1yTRa5tNkgBJheXDBVSqlXXwIbNCw?=
 =?us-ascii?Q?5EnVQ9i/dGZHuUadnvVjZPR77trytfJYlDcGlKTiRYNtII6BQIBKrScwwre7?=
 =?us-ascii?Q?QlLMabDwgdCB4fcvGQvN98aQVFpKh3GxckxMygbroRXicFCfCBeHfic0OOAc?=
 =?us-ascii?Q?MVW8rBYn5JulnGfaei0cGfyHvo1UsocqyYUTr43P7J4CBU3EuYZCwyFkMLzM?=
 =?us-ascii?Q?62thI/Qgmnxg00sJDER1LPvTPL+7uABbCqBnfeSkOD9YqZNZnwH2dz5rkihi?=
 =?us-ascii?Q?TkBCwPseiBoPsOYQ6cbjbUynM0glh5lyGJ6eQxPe8q2qKwkghUukjDA3y7mD?=
 =?us-ascii?Q?DzfGl0Nqo9EBhUbCR3z90RrcQVJEMjfIPQf1TOeXHgxEqNgf43AxDnw9Y9GC?=
 =?us-ascii?Q?27RgD5IFhITubS8Ch7H3TnvM0z0m00bS9Jza/AGWr+kzcRH2NMQeB7krbbkQ?=
 =?us-ascii?Q?oZ1/WIgDFOOrnJPEMhokYVpSnZqgDNJKD0Y3cx52YCA3zSlLzmKJDfi/9jCH?=
 =?us-ascii?Q?9tDhsIO8JIv1JX1nrzBDcMs153xaWnr9T+1UPs+qH6cxKsSnZEd/d4RVmHo+?=
 =?us-ascii?Q?Zct6zHiOQx2/HJHzbNipFlSTSMlhmoF62QwfviLVuWLcTHgXFsQdz5BR3Vum?=
 =?us-ascii?Q?A5Df7fkIOBxVxPOY0Zw2Zn4PTyDM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1XDavMFBwBNz6scetqXbAvZzx2o8WZvpvAwTRd3IUtXp/wD8KI/EMD7uc1qL?=
 =?us-ascii?Q?06/ffocn7B1bSZakDpz2RMCd5/qqd0uYT+UuE7x5CxZZm0l81id+KGIsx8/f?=
 =?us-ascii?Q?amPumtAEfx4ZZvFBwrDYlodjaeoRazb9HOu/F01jGszWwiQbJC1XTXL9+t3g?=
 =?us-ascii?Q?ugS2HaEC5pjEqcGlJAVjQptF1QH/Tmns7RoDz8D++1q10eWfMq/3ZwwdCts7?=
 =?us-ascii?Q?zd8zxxtww6lj8BW3HxFJmYHiUJYCCSbReapV2J8cxOYH1dpkqazCblwWCnvY?=
 =?us-ascii?Q?0iyeXpKUczsga24R7JC2m98h7RAgmLPhDkKsRpL2Bbm3nlzmoj2mzNJVsT9v?=
 =?us-ascii?Q?slx8IPpQ8qxRQRI/WjhQuyTb/Qi2ePCHwW0Ip+kgq/XuqtC2tn2IuqNv2Cmy?=
 =?us-ascii?Q?mhRE8J/oCU+cwNc4FhXTOg1GCZ7M84yYgY/gRPvcJo8x7DVQNTyktksc9JGC?=
 =?us-ascii?Q?G3LZKNyYiGUvupQ7yFYQfkqE2MkGCbxp6fA3U4HCjHDFtLmhG/eF0WTFMmY3?=
 =?us-ascii?Q?MA8uHFPNj0DT/e9wEnfA248E3ceh8dyU6AhorNWSzq9tvAvjFcLkbujg+TJF?=
 =?us-ascii?Q?FVy18fdf/RnWtsIitd/o4a3+iToUflVkeUw46F8U5xRBXJkivEIs1+krKiH/?=
 =?us-ascii?Q?cqsFuXzXJXzlepYjSQ8h1x73fyXYJF/qROGSha76d7OmC4fRcgGu8XSeS59Q?=
 =?us-ascii?Q?bejO7kReTQfkTZeaOya4JO5AXR/k1TkF7PN/aZ+RsUVLcftYJ+1pK2AbF2Su?=
 =?us-ascii?Q?WjkiAPZSxajX+yWky/P0I8T2dmYQVUinpLpsol0FI7X+/R09QRKExDOF1cng?=
 =?us-ascii?Q?t2S4WSxDs1r3GpkHiNk1L3Oh8NFx2tSbfVBFoGNzTWv3bFBHqDIQWHzdIMzu?=
 =?us-ascii?Q?bdOv1Xf1NMFYBPpB84/WSUm1mfmJ/+iZc/1993FsBTpLeC15ARJlj5ctX1O/?=
 =?us-ascii?Q?AOxhAu28hPlBJ2GzBdJ+n6fZ5EQ4CIEAifLR5/fSiScVY89ycNwash11gY5n?=
 =?us-ascii?Q?0qLqMDCZxWISpFcgn1beAzW8i/q+hGtKeSxXmmaUocBkEor7BvGLD9eJ7QpE?=
 =?us-ascii?Q?wBCXf035oUb19SV0J8KorlwbmNjXac8Lh3JmwG731/XeDtylLYVCSi6ccEox?=
 =?us-ascii?Q?Q6tSEoe7/b/SEaQKcDVL1SL7enAQXnLLI4arvWyRhiLl4O0SvLKcSQZLTCIl?=
 =?us-ascii?Q?DZhyj3L1DhbKqjxHaRLhuXz2yyvtPxrRfz/1kzaj2aK7lZYyhwojhCml2pbs?=
 =?us-ascii?Q?IIntzpew5asmeQwT7ZKpyTyuWFyuAjnwwrkEg2JXRjZsQFOmqV2i1nE5IFMB?=
 =?us-ascii?Q?vwPlx82PmD9LNUCtvZO2565KKGMwCCuNw1uhgJ9w/p44vdW8G1CukEwq+y8a?=
 =?us-ascii?Q?8R3+4lylydJg1FFNzAqO4e6vBBwmh0NFwBaI9fRB3QJl8bZFmYloIbYqQery?=
 =?us-ascii?Q?iA9ormssyKM6Whyd709sN4TG+5dQAfZeT68AK5b9r7e6UB04+IWa/AejxlWx?=
 =?us-ascii?Q?Gs1TxpoeouI4pItSbq7nFPGQfLQTeEvPX0S5FP62oVuMw65atHpXsmU6LOV3?=
 =?us-ascii?Q?97EcrT+BYxepUnjIWCONvxESoXFP2ZYNMZEbmEFu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001e49d2-5472-4c79-f0a8-08dcf7df905e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:04:35.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKYhpLTE8FHd9WLFlNlS8zbNYKyAjT8mWiBmQuCwBIw2julnGwBC7bE32t/Mok9xglTd5RyFC+Zrq9uHZ01deQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
v17->v18:
 *No change.

v16->v17:
- remove headfile hdmi.h
- add 2024 year to copyright
- Add r-b tag.

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

