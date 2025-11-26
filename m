Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069EC8A356
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845B910E631;
	Wed, 26 Nov 2025 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="opsaU7Fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1FE10E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufmHZZmN53wgI83IpR1rpQtu3jK6w2tYE7rP7izkQtQZqFttQC1diiQFw1X0AV1gNr111DioJ/yAod8rxxP1hXO18KZEmGfD40HBcGKSAV8cGXq5iFfHnjFvPwpv8A9OW5hSL2jLpNolqAUxP/D4mwpLNSGQWIGjpJHyNOZuEnrqchxN9khY/ypwhrvgJyMQ30igyIz7cG8gWtla/Feeaj8LBm/Gw7LkS8ZCQuRl8K/U3tuvwE4NrXAAdlhKkto2StonOj8y+yF3+tqrBoTYMTyqxzQAZv/f5SJLRRoX5rIV04X563prQEJLgDuJBEOp3CSGMaQXM4Zq4D5R9joBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1t64e29fKc0OfIGDOEUGtY/32Bx+XYYQJ0d5w3GafE=;
 b=vPjNc5YTy1w7bqNgleihQZXTb9519uJiJH8uDXVt2CXUhItc56ZsMy+alBEPVlbNa1XiBYIoUXTh14ra+40dV3CgAar9fb/jPeQGe85P0sEE0BzZ2y3uZPKxiGBHSs0dIRaIPLpOmk+DMFqC1GNEyAu2n3DgAmCqzTlNtCZ9KiyOPB2pIS86QD5jrO/WuYWAw5mIMgedsNya//z4VCFa8SRAOa6K4YSV+kpq/d9kG1x6UQHxsrrQPH2QDz3P+baBFG7stVtZChZka8yWkdEWyPRsTU9r/+TjKISgl1OtbOAzL+J8mRh2uWT/zbyKt3AKrk5FPp/LzRdYPnRkJQph9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1t64e29fKc0OfIGDOEUGtY/32Bx+XYYQJ0d5w3GafE=;
 b=opsaU7Fl/o2UiLsOIigOCGgjVwperrzzydCrhKsPFV0ejz0Gd1Ex/AQc6aeXy0RZQxRJoMu9Sss9QcuY8Jvl6r36Jw0V7sKht+SlcgVEZ3CoC8lKUe2yiqOGrTyEjerQE1TumvJ4ALj2jnUPDEGTrO1YQsPwZRuLTXd+W/LeCcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:11:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:11:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 21/22] arm64: dts: renesas: r9a09g047: Add DU{0,
 1} and DSI nodes
Date: Wed, 26 Nov 2025 15:07:33 +0100
Message-ID: <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: b475eb40-e41e-4286-ccfc-08de2cf5ad86
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hJqEXxiSaGDaXc8ExkX/2DGvUQOsoOrMhfO/CxpXznwpYsP1lOJkPMOVHGOR?=
 =?us-ascii?Q?R1/TYYfDxvl30zefsSQVKq3oOoR/XgYO8rMW3gCCdyhlXk2tvzu4XatTcRXR?=
 =?us-ascii?Q?dsJlNo9qES8PujXE4p5hMyxAwZ9C8L5KsZD2yUQ0zdlkeG0vF+cEgBOth+NY?=
 =?us-ascii?Q?yJU4eiDevYUEe/WAyZoIAYuq8BhwbJtrLiGqDuFfWobNrwLHLdO0yu1haXXl?=
 =?us-ascii?Q?7PTq++4hqHfD1pj/O9eJvZHYxieV5kE9WmvFqB6C1lMVnaVH5ynPPGUkyc1u?=
 =?us-ascii?Q?wwGRBzMMmysDEfwDZtYYIA+zIGalRdtmZIOaT9FcvLZKZQ68oDs5FiFp0Min?=
 =?us-ascii?Q?5gXWf43E/Wj/Lw2dc63HFLmfq/nnOHthrGMYRR1ZClnNMaCBgoqfxbZ9pUIx?=
 =?us-ascii?Q?sfbi8f522mN+xZZwpMWbM1mltjXHCvQxBgXq/adOnYxiCiXYuz5Sz+v+DUuJ?=
 =?us-ascii?Q?ayUCZCVB7OJDEJ0oZaP8Ibu7Muq2tvVIJaPe/wj0f/AI9sLCwoHnATAr2M8Q?=
 =?us-ascii?Q?0JNiEzpkOgpDLABW6zQX1W7txKu2UY40OlVWYd5TL+UtdNOf+mmoqGUiCqfP?=
 =?us-ascii?Q?EJE8rGDB4QWp0dre8o8tjoGTVdiN8wB0STVcX93q/nsxHxFt15aX541qUpFC?=
 =?us-ascii?Q?OOsQ+Gh79q6kdUcpm5be3qPaiRFjCQizZi+2OA6i/VE4dAliTR+75T6LAqRb?=
 =?us-ascii?Q?hspTxBihtV7/k1VUXDcfxFDfALhQaqVbpvxVC9fC0RxNp0/IXpGDrEa0W4xT?=
 =?us-ascii?Q?EnHjMz7bGSyR6F+c98lpkO8AI/2tTMwF61tTF/UPABj8F4HLRcW54HxrIFqt?=
 =?us-ascii?Q?HAW7n8+o5Fp1qjzXd5DA2E0p9iFPj15VzJWa3R2qst0BplOe6K4KZ1ApWMba?=
 =?us-ascii?Q?CxYiwqiLAbiatgW4uRwTGFY8SS1uMeBKVDx9xyME3hBBVmmM5dbLbFJaWd8R?=
 =?us-ascii?Q?gocaxkiLnTrEU8c7TBLLn2iT9qcdhjnpE+aBS/74UZL5HPU4UsECJZw/0hs6?=
 =?us-ascii?Q?lDjbwxJkNZL14QeIuQ3+OiPBvLwQhVmqv74wnJd/rewtkFkkgmeOKMXED68M?=
 =?us-ascii?Q?E7KvGd8oAuD+OUjTY5h1j5F/cc7+IRg7TPchFLFDrItNFFFLhMYzdSzYaTgZ?=
 =?us-ascii?Q?2HvlFPY2JWlqc961Dk5rFVXPZbolIJwo1PCeOFav+uk7iKgpTf1r2tZy24Rx?=
 =?us-ascii?Q?OKOmAdEiVPkkv7QbFMUI/UpAETVbzX1v3vb/CXsk5npkAQnrwlMdJn2R6Mmi?=
 =?us-ascii?Q?1O6s0+YVshxVuTs4Ne9FUX7Sejd7yK0aCTva7pI6RRd2+EosTQmQhHkktdrD?=
 =?us-ascii?Q?dgZrrynUmlOoT8aAA7trA9+i9WIetw179VVXY/S/LlMULV/UYVPU99TJQw9N?=
 =?us-ascii?Q?SrgjVi34i6tGN024cnFBrInHSOPBEpwFwJ+dXtqf7dEoAY7nKqNpjf240Hov?=
 =?us-ascii?Q?HAl5f1q+cck4qVfcatTIm0RjRo1e7cBpUgWvL8qNrZr/+Ah1WuN2nrGN+q1f?=
 =?us-ascii?Q?BfBxlBI8GOkn0U+4PKwQBWJvFVhqIrp1m72E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o0XDC5qHXSLuRYbXz70v19p1iCyhwm35zWW3z+M/C9a9UCqjWoKklPnJfZ+5?=
 =?us-ascii?Q?pDzXwWVw3At207lP8Y8lKlaR/kQBsNTSqdkTdQeGQsvgng9QRnVE0NiXQNvG?=
 =?us-ascii?Q?mn1v5azc2lnEoXdWtbAMQSJGU7ptEvYbFBnBy8DzmMppH+gGId0YZFl1LO1f?=
 =?us-ascii?Q?EhNtFeJIoQm4+vG4z1aXMLbNmCEEDMGu3GdPW9cGqVCTbFxuvUdnYt0kJ+bC?=
 =?us-ascii?Q?WMbS7gV2Dtf/44V5uxUMDhQUqlyW5PciwZpwQmTtIozHOb0nxZ2Se9YKS3NQ?=
 =?us-ascii?Q?uZiGc1OQmqdO1DQ0pJDIyNVGMHt/SEI9e+PkMQ73NhY40o+4DOeau2wQGuCu?=
 =?us-ascii?Q?yOU6sNCJ9KAbwQPw2S0a9bLE6keMblL0BF5Dwyj8i3aR2PoWH/qmrCteNUVB?=
 =?us-ascii?Q?M0kXPefNF5kptt0CHwT1dFhL7UCj2I7fREZq+JCah54lf59sSHFpf1OCKjKQ?=
 =?us-ascii?Q?4PZL+sOtibvXQb3OkaiwV1oDrziAUYgEPeJUtuTDlKEn49XIHYLubRrQtJP/?=
 =?us-ascii?Q?QKcGso4z5oyp18OYAtlQ/Liu2Us7A+uChtn21Hfh0tHU6oRNeRX2VLKscepr?=
 =?us-ascii?Q?nq44OW0r0XsIYXikwB0Qg73O4w4ADZ03hs1+8T+4sWNHNb6g0IpgUyA63kK+?=
 =?us-ascii?Q?ULxCOK8oBx/IxQdR9IEqDTHvH/BRs4TEEagnpDB3Xv7ylN1JXg95JIhXyQHG?=
 =?us-ascii?Q?4An59im23/muFmBxu9E5jODuFiRpZFbCe4Ha99VO/E3Qp5wegO1PUe7lxqgQ?=
 =?us-ascii?Q?UnJiVK7/+P3GdpP2/ixdyuwtM9pfg7nw3XkD97vVhrsniYak2QAOFkMiFQGD?=
 =?us-ascii?Q?91am5u8tXLQh/QLf5qpG4FeSOrrVdN3Ad3Q7nmnrl/BN5iM4aC6/jHCntNzd?=
 =?us-ascii?Q?CCwDIKaxzsRfugg/UOH2IkPiBOpWsrxJ0HabAgID9hZzm+CfCYKv6p1NDC6o?=
 =?us-ascii?Q?yFEHgDAul90bv689ho0VwwAJBXFHgfW6goepB/LmNL3AQG6RyAxJlw7JDHba?=
 =?us-ascii?Q?nqyIylVoBDDfYmG3jUMMBxtwyiFfWrIJuRWNIng8VjoVwjWJQF2xrCHliaon?=
 =?us-ascii?Q?D+On/ajgYQFEVVDKsbBzya+TR7OqDV+3qm5y8iL3XPiu5wekVrX6vA1wGVNU?=
 =?us-ascii?Q?N84gRj/U9GUS4D+fscs9MeaEwB83gTUOQM8pVwTumKw0fYIMOpBC4n8Ghk4W?=
 =?us-ascii?Q?gBjIEZPUNFmapxoAKQzIp5XPAqsQWLylmP+lSPXq+xrfCocTPzXcsxBGiYGz?=
 =?us-ascii?Q?KLYJLCkv8ZmU2uiUwy+oNuuR95NX/W1hcpKT2kfIKWAw0Ey/meiVpzKB/j8q?=
 =?us-ascii?Q?qxc839N6vTL1kuUhGAoNzGZzmg/VzxjbdIyY0m8VyHknF77Q8MUDaFOTctEQ?=
 =?us-ascii?Q?+oGfZRLieq5YYM9YOs1qbLqVNpiwPFRQRDXUAflo/BJBN1MOd25VKGddTRM9?=
 =?us-ascii?Q?eBJPTsFGjTQkdUcRjGMZjJDw4wVFPapU7QOgdYXTt2M6qxDKCJE0JPe8wkK5?=
 =?us-ascii?Q?mxIRCppAmL1clYljVscbol0R6ALvIzFEbIMf1vOpoU+omzHa5kVRDF/DzlC+?=
 =?us-ascii?Q?Ddpnds8TwYlRhw3X2YbgR0XnnSydHoUuDC3cYYYxcW4iIwovXE+5ymsCkBPP?=
 =?us-ascii?Q?A2sH2u/e9UHCfOmtQv6vVDo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b475eb40-e41e-4286-ccfc-08de2cf5ad86
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:11:22.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKYzlOy+3fJ9BFaqphh9as5/NJQx/2cCpRW2Imsz0+XUv4ISbBIPZRH9HfOMxcE+C+/E8F4MIR8WXJHGvZJnwOnEzXA14UGw2dMHreHI4M4/JQF5lvLuaG17YqO/VewD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821
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

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 11f7a3c98e74..6b6de8d61a30 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1182,6 +1182,127 @@ csi2cru: endpoint@0 {
 			};
 		};
 
+		dsi: dsi@16430000 {
+			compatible = "renesas,r9a09g047-mipi-dsi";
+			reg = <0 0x16430000 0 0x20000>;
+			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
+				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
+				 <&cpg CPG_MOD 0x190>, <&cpg CPG_MOD 0xeb>;
+			clock-names = "pllrefclk", "aclk", "pclk", "vclk1",
+				      "vclk2", "lpclk";
+			resets = <&cpg 0xd8>, <&cpg 0xd7>;
+			reset-names = "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_in1: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dsi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		du0: du0@16460000 {
+			compatible = "renesas,r9a09g047-du0";
+			reg = <0 0x16460000 0 0x10000>;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,vsps = <&vspd0 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du0_out_lvds0: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du0_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
+		du1: du1@16490000 {
+			compatible = "renesas,r9a09g047-du1";
+			reg = <0 0x16490000 0 0x10000>;
+			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x11e>;
+			renesas,vsps = <&vspd1 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du1_out_lvds0: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du1_out_rgb0: endpoint {
+					};
+				};
+
+			};
+		};
+
 		fcpvd0: fcp@16470000 {
 			compatible = "renesas,r9a09g047-fcpvd",
 				     "renesas,fcpv";
-- 
2.43.0

