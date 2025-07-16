Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A5B07017
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDD210E735;
	Wed, 16 Jul 2025 08:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LSmIA85v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1193810E709
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0dPq3+8Ysc7FeVaHLlxG0X9FnC/kf3HAXrKP0XK8dNF/Eh1pmOFKWlbTq9MlmtIWf/srwUsuYTl/IPfpe0pNAjHgb4CTeemOB90d5+67jtk5aV/rHyOlNBCXUSwZPMUVgxwyRq+KLy6XkS17PYXaEItzy1Dqr3Qv+WMWqBD/XG2vgjfX7yiucdB+b+T1k63OZbAS5qRhAlWQlz0ndu2pLYUDiqLTRCBitgnYoQBoaXuvsZsMfMjW22n1TedepIu0bQE7RVZoqG6iGD5RjW7Bhip9izxlN+WWY3Zsn2p+8fXSlLdwOh9+IR25EozJsm8O1aSjZrFuctYARW/BtcHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xW+XWxXG0pfNTA+6mSxNYkDVwfUe15fJMQ1XpiycVk=;
 b=yerFh3vkWhtAs6Hjo0H150ebY8jUP7s/DiwXRDPcAuafPHA0MRyo/813uLVtbVrWvdP3noJOu+tlCj/aGQIGxrKBQiBzLglGODMnFlJnaTqtlYZB11cZT63IjgSWIAdvMdCkiD+jFXCyD+Wv3XfegPAabU6IHX+t2W48IE1TU27CZnt1Q1o6rityKdbAQQAYuBuPHHUqdGxmFVb1KkQX1Pj6N4EubDL92mKF8WMBjmlhPblUDnsPAanisjETEJobyXxu7yfyMTTPBRSLVkYZZzfaZEaEPco5NMOiVB6y0yLM1Uio+WAeUPmcv6skvj6cpiRp5S1K+nLk/CZsrPyF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xW+XWxXG0pfNTA+6mSxNYkDVwfUe15fJMQ1XpiycVk=;
 b=LSmIA85vFEvPd0QYHjp7gQ2VbBgPtskX859klwJiXvKL7ZchmYqN5BwO2g4ZQWSpTAwwMzM6rUFBuGj0PDizDeNZ8GdUI8cJvFH+HkwOOY2Dhxf/B4FLjfqc5Ymk1E1Y9m2fBxVRLqAz/JaCMxmqHefVOPE+6nNUlOxuZ0l2gsaFVTfU0OufeeuGLMltcH4mbBMpvUQ/JLtybHVPDtYRrzqm/j0+Fk1+lJMoDAV/I+R33CG6awFfZVgWP4zA4AnKm9QK8kH0a++bZr4g4DcWFM9gJnKEcEGYNG3dw9qmH1FSYFEKM9TlSb0ehE0cKITztlsqcWLOIX1xDA8Ne5obmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:16:06 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:16:06 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: imx943: Add display pipeline nodes
Date: Wed, 16 Jul 2025 11:15:12 +0300
Message-Id: <20250716081519.3400158-9-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f6a8b9-8085-4462-7c56-08ddc4410331
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lU93M9lCv2lN5TN/rQXo5AGWYrPCTPP3vkSLyhc9ZskEUEM0/T+2Nde/QCKg?=
 =?us-ascii?Q?1uizUqsBJPS1etUNWuei/k1M4UL5u7G9/q8MiEIrVqERtjH4wW506vIPeI/0?=
 =?us-ascii?Q?VOFqNcF7/tDH6ii4tu0D0/7uGJMz2vcp4H9A0Kieyr7XW3zcCp0PN54NVFiZ?=
 =?us-ascii?Q?jCT8Yjz/BlyTG+nXaYtV3LbgVMmQBm1nPa7tCZnk/pLwsMaorvOZgc7G57BW?=
 =?us-ascii?Q?I1U4AALxehGyJqC6zn1ss6PCklLrbl7mcqtlM0Av7CnrlcjpLGZd/ZBTXOLT?=
 =?us-ascii?Q?fUTFzHc5VCUQ+RNJ/wolPG8UVqesABt1/jh/EOdgSPWSRPcx6nxYU2t3zSZB?=
 =?us-ascii?Q?pMKTiJy7xyrW7Hk9E9NFPdoWuvEcgak5zsCfcPuTcOeD1RGgY1qBYxhbVrXP?=
 =?us-ascii?Q?V5D/3/GMoOpYwKGFbWNk1wwuik5TdZplicRG4Lct5dCOlqhzaYeVjEfd4jhs?=
 =?us-ascii?Q?pRLGw5dumI8zLL27mmutQ8wCidnYe4nd7EUFjwa/3bo9XuPgt+cizDcML1h+?=
 =?us-ascii?Q?qN4CxdVMKUEqeuqosOSdKENccBZhc0Ph79sBdZ/H1LnuFhVuzwqJC5t3K+aS?=
 =?us-ascii?Q?NoHaLrq9JXGr3bcTgVZBcVO9TmFpJUw2CPS3x4D6xpzx0LJQltlLh3BSeiNf?=
 =?us-ascii?Q?rgA3EjTqvGdiEObjSwFKpUh7kZ8swkVynZkm7GdfDMAztv07bCNAsCro9ahE?=
 =?us-ascii?Q?VqwUb9NNfPr+jAINZi87P72KbScwktogIlHvP3ESmlJVlBZVvTWMH/NExkfL?=
 =?us-ascii?Q?VRiJtp4PfAwKCUUDiS+MDRI/77WTe5BK+/ODiMkWvfj5nK5bL//olHLyiZEp?=
 =?us-ascii?Q?0M/v/ZHP+BtajfAeN9it4GLZpxZEjswZ5DjAn3s/bi19JaMwORqNKklI9aZY?=
 =?us-ascii?Q?mG+h1ku+5V11TqGkkO9op6z005nU4ao/wrBKDR/dsthWUd3q8huwNnvR+wBp?=
 =?us-ascii?Q?1rgWRRUQ+Shyzuxb/DjzTUqmVTyxcyuV/YV09A7/WigM54F2G+EPrUAfU6uo?=
 =?us-ascii?Q?ITiBUjFMBzN0b5pZYn3dCTS28d7KANG40ph75jWnh7X6GGTy0EdSPdwaa1YN?=
 =?us-ascii?Q?7mdDcJITVkhp9fEVmTtq9WMCzEQreBZdT8nLHfEZGbg39izAZkfAtERUk/7D?=
 =?us-ascii?Q?tWQLrL5k3s8MeYThSNSjtJhjxAtrC8FWRbTBEMzdJeWtqQv9gxT7xX9YALIr?=
 =?us-ascii?Q?ks73C3ui2aX597Wv3chXXnX3HHF89kBfomwgpMah76sbNqeX2LDWtpleupqq?=
 =?us-ascii?Q?982S4UBvutYg5bnbxjd63MlbSHFr3Y/U7DVrW6ttqlcKEKabcGYsddUCS7lm?=
 =?us-ascii?Q?W9eCCpQDW+1cyYsSVUE6BHxbLQOTprDhQX7w/kuTp5muT0AM3sMMICDRIxNz?=
 =?us-ascii?Q?VN2cVrXF7l1BTWneshiQAxomBGeVm1/3YXVxQ87KLtQfzo2myWcR9IQ284Ad?=
 =?us-ascii?Q?rgQUvyfj/rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PwUEqrC1v7v51qMAWOk3jBJxtg5aUI6fBUCYyHJgTB7uv0SzjqAZWrPDLoLU?=
 =?us-ascii?Q?abH+O64BWBqhwZgUyZMcEDQbiHR/9pT9zLg1bDGndGPQsOvSa0hzXEDW5z0s?=
 =?us-ascii?Q?es1hU2XHfo+f1E5xakjwQfDiI0G9JDP6q/asQegBrZjkxY8L8biPnQoCb/nC?=
 =?us-ascii?Q?uEK0fu2zsW6WZasjTLWoDBhXb2sWU3jk0GDNwrIRROehzmfAXGWOdf7UJy7V?=
 =?us-ascii?Q?Dfw7pqr3kCaSGylLOZOuW2jpHSpbmB1Dugu1WXTtmVD5qCCjD7purJtvt16Q?=
 =?us-ascii?Q?+f4XYesGjcay1LKyhSlzjcXspNDVTvLA0OFhf2+K0Cdqmy/DfP0deFqEO+Cl?=
 =?us-ascii?Q?b7UNW0+H3PNR65eTLR96OphnQcD+Wj1hhIWUlvi2zx1E56AmWQn0Bk3tKNlo?=
 =?us-ascii?Q?BEPrIq/zGQ08WBf8ShnvOvqJrdJaeNLze2Xp37UkmlMPmKhbMojjrzbdbCy6?=
 =?us-ascii?Q?juuEOKM/y7pMSVyVfbgN9+v7gBhxm02fcDd2z/gLv1f6ZI7iwCgizBucXZsw?=
 =?us-ascii?Q?V6RUeAWlMHR9uAkosRzfoIBvbnyRmoszala2vxYSs+em1Al68HSwdRKJrzMQ?=
 =?us-ascii?Q?rqoezTNLagvWPlfb3HEq9xffQisxvi+n9bBT0ZMiA4nLPWmqsDRc2BVeN8DC?=
 =?us-ascii?Q?KdArx7wBXGj7Onrj/jXhbXb6nxOLGWm285bYkf1oU5j3rmoQA1y1IKLB4oV4?=
 =?us-ascii?Q?d+n6RLMqMZoxKYarWb578ebyoM1fSEh4wQ77IuDdnJnTTh0xjCiq+DLU+tpz?=
 =?us-ascii?Q?eoD5lPcoTmwu9Osc+tiX/NA7a42hCUKXmi8dk5GOa2uwFDYgeP3GsEmbsKb6?=
 =?us-ascii?Q?prcLF2ZZArK718z9pAKBRYSsX4fTOPucpvIapnCiDsubPC8Qg1VF+l62h7gx?=
 =?us-ascii?Q?uvJ0WO/kx4oACUNS8qC4KidaBkNIHspuxkeZO4rfRxpeedkF+qKZcpEsxFwU?=
 =?us-ascii?Q?fnhz17Fi8DkzGM4KfU1E9Bj6SGOI4P0fP0nOjmhNw/MXHpXHhgaQt77MdxWH?=
 =?us-ascii?Q?2D9thO5ILhnW30v2zDIbvutZ/xn6r6HpZYYWi8xnBPEU+5RxuHhLsk2Yqv4W?=
 =?us-ascii?Q?rYczejxT7SeLLQGHgFh0vXWbcBvmmu77AoY1CAUlF93Xt9Y19Hv9MEY8+9zi?=
 =?us-ascii?Q?9QvsUvSZ3K8AvO0UxeBIELXeZp2JxTQOVLWnUiKpqi3Jv2jQa5tPkWJtJutF?=
 =?us-ascii?Q?gvVZ6LO8flGyY6igvo1dJI5nFbyNWhmgj/4cCwsr5/ONf1L9Hwi4fziFoxmN?=
 =?us-ascii?Q?T52y9dJ0UQ9uxp52Tw76ZKfVRZjzGRISFBVcL9pup7lKR9vn+5Y28COOBpGY?=
 =?us-ascii?Q?jECu4x+4TeFp04mgZjcltSfjtFoK6XdWZwIOxK2jDVr1ynRC/1Fzcjfsct4K?=
 =?us-ascii?Q?BGsfR4/VnzRWolvwVMQUdYRK6ESsrdRiK3iKnxHlzS6Kmw0ycRovwG5ltuBM?=
 =?us-ascii?Q?yVDrhzAO5NxJYY5wTxpg/4wNh2n0b0qihTQk989WUqR4GTrQkgUrq8ns8ErC?=
 =?us-ascii?Q?bw2AaK2K1V97UIgQOWeai/1WetGI1gpgbpPLmFM5lBwlvRgCA5rE5JdmHXAo?=
 =?us-ascii?Q?zyq3fNyyHXJY4T4fYd6AkN3I26Y6GxF4Q+rvgciu9xTkbgHf4AL1pDsp1aan?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f6a8b9-8085-4462-7c56-08ddc4410331
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:16:06.4262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8i3Sk3atPwsIrSZdHKCehixcqke9LQlp+DgYtUYiAZpIgixZ9fSsjUrwLIjcxCPLE8I0qko+vQNz1yP/n3Low==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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

Add display controller and LDB support in imx943.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f2..db00a94812e18 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -173,10 +173,64 @@ dispmix_csr: syscon@4b010000 {
 
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x4 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			nxp,blk-ctrl = <&dispmix_csr>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1

