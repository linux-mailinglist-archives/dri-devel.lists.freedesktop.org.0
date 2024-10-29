Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63589B4215
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0010E5A0;
	Tue, 29 Oct 2024 06:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G/X0ZVTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5151E10E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lue+bLND98mJwTYz++OgADSoe+lXZdXZKNYGJnCyWNoxDh4yWut7nPoOlPde6T83LenaGwHsRiWL/be1H21T0wvOloMvasWxgODUHNve4sJj0nEzrNVwSqqeGd4BMBalUTECN6lDAnvqXrw6Ylc+WFrZdd9IFHvRt8zgQlEOAeMovHuZqFXKcJrmY408NZcY/AV5j8MVwO22Q3hnS3+wYwjW1VoM9dkQacnILzX0OtaRIur1nT0RB1mL2Hy8zaeAbTwyDnZ53RXz6Hlpt7yQy+AxjN89KC6277zBbxirAYJ9UyppgKQK4NweN9GtA/YkWKvSccBDTTLPHu1BErxxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUrOhOv9/jctQf/WkvN3hG36JCNaDeQH+CLVke1O8u0=;
 b=W8AeHILOh5YToArYR68lCfF6fK++tpknaFzLOqxr77Olmasw/30H7Ti5m0FFtVrPzgU4lutfDdPKEsWq/Il6LlPhv6VWLFFJpi5ZTLBXuFoSTRwEoAMRcgdCaxkHSOMfVYXoHRdRilh6LIvv35j8qAqkKWNx+a/YvFG9Mn5OGDMPZRHh9MZU13Afv8/p7ngOp+kHqWErh8Qet/1oJBlPUQ/z+XZ2SQGMo9yVyuXDQ2NK1SzqAkaM74dUuAyOecTJcqjY2kaKFP36Cu1Rq9EnVhgrAakW/ZyuduQRaAyAVADcV+SxKGNFKfvprFDglQaaSrgYRLPOZ/mIJxVQgFo6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUrOhOv9/jctQf/WkvN3hG36JCNaDeQH+CLVke1O8u0=;
 b=G/X0ZVTpIUBYCjWoa0ovfWlDn4CiGXlVQOQOZ6LamocYIUyaZYdvkQACIi8ai3GRyIaYGlZsdS2bIqhW6oxBkt/2wYvLZF29IJVmJlpZp6h3akyN8twdYQ596V7RNwo1V9K8i0Z6Bfe8x6lfDZrkXBevn7C3R1yjFiTS/7Gw/Zk69oKDgWp8+xFexAx0G3qonTCgccCvis7c1nY0JgJFxM6W/4JsRxy2WMktkc6EODHO+uGV8YHPZln+WIQi9qKn9zaQ7gV8CqW+CuNwcfRdDKGwwiTjADeYd7+Vl9H1gjyXsw28arm5QAtkm586f1Z6DmrON0bMMdrc/Ow3l6IZTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Tue, 29 Oct
 2024 06:05:10 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:05:10 +0000
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
Subject: [PATCH v18 7/8] arm64: dts: imx8mq: Add DCSS + HDMI/DP display
 pipeline
Date: Tue, 29 Oct 2024 14:02:15 +0800
Message-Id: <7d4da909f2ee24163ff99e069785e075446eef2a.1730172244.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 437ddaf0-3e4b-4522-5c6c-08dcf7dfa525
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r4qXoHuloR0bOp3KrZimCZqKY6hOrEmIwem5OPsqCG6L5gxrBnIS5xG7/azw?=
 =?us-ascii?Q?Anbn5hcgpp1ZDRDzXXhtD5w5UfkW/MB0s+XGWWwgp/UPnq89xsFtuz92gt3Z?=
 =?us-ascii?Q?fJjxhSVIF6M5yzCdnhmLlbsTF1HdS7sdhM9qpFuhdhavPb6NI9V8O7JeSeWI?=
 =?us-ascii?Q?JYmJJwqwu+CNlsloJw20M40gqznsgTVc+U452wV+4jHfKRtE5YQH9iA/gg28?=
 =?us-ascii?Q?RP4qE2RlN8F52pH0q7nw7FtmBQAUUXJp5ddBaUUqJCrPtxiPFvztTDkgYA2J?=
 =?us-ascii?Q?uyMifraJgbSibLF7Vx+94mXrR/AxlB313c0qfXCOwPsJTS3bZwCKGbv4iMfF?=
 =?us-ascii?Q?bCubBK6eQMNv3zV7LVzESM3vSmC3VSQltovcSC9EEOzmk4CsK2JWAss61/vD?=
 =?us-ascii?Q?a++bezb/1yU7l79+GZ8S/iqxa2YLS+kpAl8mwFR2MeIYHo0Kq5uJ1gN0wcPU?=
 =?us-ascii?Q?I0om1zVwDGhF5uPv6bZdkCY8cd0ekL6852a5it1TalVcWPlpGOYx9fDFSYRm?=
 =?us-ascii?Q?A7YjhaMlYJjhFwua2wr/ZLh+yt95ZM4bmXHnYkoBN9AU3hg6COOOI7/L5KE6?=
 =?us-ascii?Q?DQK+Oals7IliaFakGHkaKfyIvoEJLLdulvcHZRB1x324RL5Pc/YYPtQyJA8k?=
 =?us-ascii?Q?jOlpfZshIjJpIQQvVxxAd5L9VQIqLZ48JzhBbAF76EQCJ9n3y7P+Z3tq/tCX?=
 =?us-ascii?Q?yldQm/mJz1uODH0SvGo5aek02Cw3j2q898cqPZ7oIxQphBcUzd8sOhlOeqtP?=
 =?us-ascii?Q?zcDdT8XV9uACZC4Ir3Ood7hYI8aR162cq4R1k9evIe2eN+JtSCrr4vsN3yxt?=
 =?us-ascii?Q?rg83Y1AgwWJE8yYcn4o7KeKtUoFaMlAE76Pr7vsA5hMXLD4Fbudzx0/yypob?=
 =?us-ascii?Q?2Y0I6RjvyLoIkUDEZ+bCiuCP8esM1C8z4d6JQHRryIDbfvJoa+4lYqyAZ0Qj?=
 =?us-ascii?Q?0NoVhnWUkn4i6V5OcfIVTKVv0WOm0EpLKDZpoZ+3XhXZYY5PPzXS6X6upkru?=
 =?us-ascii?Q?pPSIFmxBJeL7K+rphm9uzFU2fcPF4gX8tPAhduBefSvT7jgZU17AnAuwuwtv?=
 =?us-ascii?Q?22IOcjlATF1JXLagRQney8kEXXp/NTVwkjs9M7t5Ht5VLyG9MF6IqjYS4vkA?=
 =?us-ascii?Q?D/f4AqNQqbG52Bjt5fFsCOsco9qkjfqDaPa6F9SonXKSZcKpFVdM6SOTEuYB?=
 =?us-ascii?Q?CGHJM+/+MM/ulCyBz2NHwO/moSSZkM6x+bZzjeolYBahvpiQ5aco8nZLv220?=
 =?us-ascii?Q?k0q9Z3t/huYUKSnhJYL4kAAK4FtuA1US46mtXnJNEgft/ing/DKO07nSdfj9?=
 =?us-ascii?Q?g7HUqch+LoF3CEuYr8SPFyEJLkf0AZEauJEckj9DhqzY/TXm4JaxYrTI8dqU?=
 =?us-ascii?Q?uNPs0HLro/j3qy7+mc+Wh5PMI3Ry?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9Mnsw2hv5fdjDR0gsYoAwaTfNzSTc01NYxuJ5uCgK4KD0RVg+O6FLWXIoDM?=
 =?us-ascii?Q?+ZgJ1NHLMEEzGxj3FmAq+R5313MjSd+Bz9a0NTz9eqqPBQLTcAXvqQIE0E0O?=
 =?us-ascii?Q?rZ3foGkISiSU23n4eI+m5pDUCEeys0n+MLdH3toOb11RZWGSCM0petes8ssq?=
 =?us-ascii?Q?XLhRknKLGqpHThCfPzM1B3Otjct+OwrK+VyXG0/NCMUQZEvBBZbFfVm9Zwyv?=
 =?us-ascii?Q?n89ZnWdijpngio8jdFgWdqBW3EyIPCPrYrngr6lj/A3z1J36+Djlg2LqBbZd?=
 =?us-ascii?Q?XFEKWUBQb99P5fL/RtnO++/o0ezq6PiX6c/z7QzormYCYoH9Q8oQ3QF+XO17?=
 =?us-ascii?Q?cTAcv/d88XY8M9PLkEJ9uKrw7idzyzdcVJ11zDOchU2hTTYmO6DQBelvkCjW?=
 =?us-ascii?Q?IW43qmlwFDNewbxplzmBsqmq81aBUeEALwvRM/OrAkj7i7WgIMlt6j2qAM2i?=
 =?us-ascii?Q?IWXM2EzQcnLF+QNpQoOcceLZVdhy0lv1WHif4l14v62eMN13f8FaqZ132Erd?=
 =?us-ascii?Q?2AGbO9cVx2XfjJwdFEN10vUI6bm+lUmKUgExuQnRy+lNCX9udAmVJZaNFhQv?=
 =?us-ascii?Q?qSJFd2lSeGrwZ3qrmIIzxCQMXPcxIMOtHgt7CQHN9NwKXWM8xTeRTyPveQuk?=
 =?us-ascii?Q?8VjBNNJ2iJzv0AqkarziEdEuN5jalu1eyEdVyQknBjU9PlOX/a0f6ndN1njI?=
 =?us-ascii?Q?efVmyb+2KpPW0idJF1pYBeim3ljA6gk4w1RM6fGyJye+ymjyRc200tjQFxTi?=
 =?us-ascii?Q?t+VbHaCJ6bq1mrs/PXGAsZYUk4NP4qFmSiYuHmrSDJLI/nwwnEgh1L4d4moR?=
 =?us-ascii?Q?mONeBDHwMsD9w1YnjMbci0MK3D8cKYHSQiimVbWRA2djEvD8HhFCVkGiZ54y?=
 =?us-ascii?Q?y+aCvb32GhWeEl9a3oL3kY3iJ+cOSiF6RvZUXx/TQG1YvEW/G4qiWXX7gPM5?=
 =?us-ascii?Q?VL1XJnzCX+fetawrrIA3jGZeMskgn5jG4me1xs9wr8ej0KQ2Rm2eaeFrGp0U?=
 =?us-ascii?Q?i9Aj/26tFdl8cx3F81dV2VSJMHB6a1q9sEjKww+PbVmnM6sMlcAicMGTon44?=
 =?us-ascii?Q?ldKsQE97QEUOELYAlg++BEyBPWN32ArwmCJ5jvUT7F4HZHFG3TtgQzy4BLfr?=
 =?us-ascii?Q?ktUd0Qjce9iQOCt42ILlHmGsx1tPK7QeggPnaSaNZxXAnCX2E4gOuZD0nZtr?=
 =?us-ascii?Q?r9fE7Y3+PPbdMEOmxbDCXIJbmCg2HNaMcyDGbEIHlzWiXAg7OFnk2yVls1Qe?=
 =?us-ascii?Q?/7BJYMd65D5RnZ0bMESZdWONaYv20j1O9wnc5Iq90lD4eUYkFJqizWu1KP5p?=
 =?us-ascii?Q?KEz27omeZkAiLI1sOTqTmXOpbDULI47JQ2aCmi3B1+eUx6CSpZhHkfaBnOC+?=
 =?us-ascii?Q?Tyudude1aMTZXI40f1TgchDOR9gujLIuHePLKYW+D8FmeW77y50RF5TVsiY9?=
 =?us-ascii?Q?GXYcVFOddW52D5i4s89XHLDrW/ymc11908PfkQQpzvzFcWvKS7AeurrpnO9w?=
 =?us-ascii?Q?llsRuKzJ8cS8jbZ1am9wVUoDHpfNlQz6/e8QNETlhZ1FDeMgwSXdPKNgj/ib?=
 =?us-ascii?Q?NhnIxgcuVrzHBtKqmHq6obT6/m5OmGqSsqoWXioX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437ddaf0-3e4b-4522-5c6c-08dcf7dfa525
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:05:10.2388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejbPNzq1UmgwRi40c6EzdTm+089EiKaYpb6Rx/t/RylqG9cKE5BPMbeJLROh7Dzu7BRNyiewZZNzcoQWGMFeZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488
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

From: Alexander Stein <alexander.stein@ew.tq-group.com>

This adds DCSS + MHDP + MHDP PHY nodes. PHY mode (DP/HDMI) is selected
by the connector type connected to mhdp port@1 endpoint.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
v17->v18:
 *No change

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2b..df8ba1d5391ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1602,6 +1602,74 @@ aips4: bus@32c00000 { /* AIPS4 */
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			mdhp_phy: phy@32c00000 {
+				compatible = "fsl,imx8mq-hdptx-phy";
+				reg = <0x32c00000 0x100000>;
+				#phy-cells = <0>;
+				clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				clock-names = "ref", "apb";
+			};
+
+			mhdp: bridge@32c00000 {
+				compatible = "fsl,imx8mq-mhdp8501";
+				reg = <0x32c00000 0x100000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "plug_in", "plug_out";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				phys = <&mdhp_phy>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mhdp_in: endpoint {
+							remote-endpoint = <&dcss_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mhdp_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupt-parent = <&irqsteer>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+
+				port {
+					dcss_out: endpoint {
+						remote-endpoint = <&mhdp_in>;
+					};
+				};
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;
-- 
2.34.1

