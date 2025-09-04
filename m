Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E34B43362
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F49910E984;
	Thu,  4 Sep 2025 07:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cinNpY2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011022.outbound.protection.outlook.com
 [40.107.130.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77B410E984
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAovo+JPyocgcNYxZJnPrEmOoyuqUaCRz4XOyryy54ze3hgPsEGlW6v1gAOKjUs3DcGuvPb9u5QF9cKX0+dCmp4FHZrjGmssitP11c37eMugzP7yQzzM8zY0TSy2IeWUosHLXxniIGZUuJyfWz2cKGbbjU6m27Jwss9X+LRtjfHvNw/I/ldmCMJ61Gyh6dlOga5dDiJl1KgbwjrkdzeSRXHjGSd/mVbz+m6IxHb7AaO7kDk8g/qaZofA9yrqOHjVqB1vBngMESZm/J0K2ed4m5NhXNZ5z4ImZtktHBXFnqKzZcBvm4CosR6LYg07fzcOBwf3xa0anqosE+3nVqEdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTs+g5uaDAJrkK0HHiYH3HnVvPISvsycVq9LRmt2dLA=;
 b=gClKC/9qpL5zq5GVC9dQi4SnstMGxPfjmaAP7RRkP6fxY4LTULjTXxFV34PUDAQzl07XcFCgKqTB2s685YZ2PjfP/6pcTLxKmN2pogm3qVZmHNiSExfRiFhCR2qwTIowiMn7OL5vmsifz/XXYrN5R7flO4UrKMDdIsoglVc7qwmxAz4DgTFilaHR4dmymBOOYj5I/o/1GugGQU27MEliySNtIoflXjyZg0CDDqUN3sgekV+xtcZVaeGbmJ62+eqj5+Y6pje4XzYHhrIaBww8Q7Z1KZPIwzzvFrnPP1mRE9eEqKD05lViNngLKrdmQT/LrjtmBXFqAmXs2uHn0TMp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTs+g5uaDAJrkK0HHiYH3HnVvPISvsycVq9LRmt2dLA=;
 b=cinNpY2x+3+rSNy24cNLI2mENiKJILdPPhA1utG5FO6VytnohpXfLFWSn+KlMOBFuiVcz3KzJhs0Mmfc5X8a37tPxDf64fwlJ1oNuR7o2t8pyaJEiFlhzubQ7Uw+5iKTpwhcY8UzU0Gosa/KNs35d7R2D7WdEJ9jmLDiQ/vHi4Vyv0MD09XpePBwrmU54wcFI2Mso2C7XiSKbGYz/cUJe3wJkVKmGx6zXTn/YtqoK0ndS79QVGRE1xgcNTUBL3ASmNotozGZqz+scK99Zi6GuQopUTZgoex1lh7MXiEzYx/jaPOYFp0mbL09eo3J2TALcc/JuOsuQKkkFAj2YFmLPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:07:23 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:07:23 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v6 6/7] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Thu,  4 Sep 2025 15:05:59 +0800
Message-Id: <20250904070600.1361165-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: e48247ef-5ce1-4448-212c-08ddeb81b27d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1rGMxRP5Dx1F8QhqBb1Wl3jQB1S/PwW1nRH2iE2xqC2xXJb2Mh/VkcJEnNBz?=
 =?us-ascii?Q?Cpu8X7uznzW0B6032bbK/QPjacgiwZ60L+e8qdmqYE4PJsgIL13/pmWa4jg0?=
 =?us-ascii?Q?JeSqUYKouiOKj3g64pk8RwG9pHUyfwhr7R3gqr68j5HJIYM9drmJXpVKUTi7?=
 =?us-ascii?Q?vurap1pNGRtkO86knjdF74yTRbmNkYbA/xEf8xtKvpT/i+kSBmai0b0U6+zp?=
 =?us-ascii?Q?fESaNeiuhJz58aqLH44hlEROpsqKEuK6s9iO+dUmyxclZkpPH2geGHWPZ8Pr?=
 =?us-ascii?Q?f6OwTvG+p/NpTDBw87hDZBJY4yRBl1LqdkMu3Iil8HEahrcC/Jgd0uPhLTAK?=
 =?us-ascii?Q?83UPo963TME/PFNqKuCu1MW7hjX+v3L8MSqhKEocvOkkMQEtmh/oLXTDDVfb?=
 =?us-ascii?Q?2JRN/dJTB6LSQu2qLPPdpFdFF7XSl4PaBeTEEW6G2pqdnhTTeS0/X2HD0g6d?=
 =?us-ascii?Q?puGfbQr4icphY5OaKjokU/8oD5sZs+JiHn1aPwHgEsyrb6FYr5Ai0vwplgQN?=
 =?us-ascii?Q?775AfLxMkWsNLw+P4HgI6ovfPU8QRFOEwF4X6GSSGeQKJgl/QqCVfjVJcbxm?=
 =?us-ascii?Q?Za6+fhvr5RAfXazHnNPYjRsV5k2gZ331Y0IiRgrnkEW6tpI57u3dbnZPMAKH?=
 =?us-ascii?Q?UAFKJHJTQ1bZMmZU43691cILtOwa2t0ZEapoCnQr4EJ3RGZE45UtZdG8DCdh?=
 =?us-ascii?Q?GbYkWEJU2VlnkjbQ0GQYK9baI/XZkPUbqgbYOLtRxFovt8cro7n8cPiYLOi1?=
 =?us-ascii?Q?x9YSiBl1Nd9K10goXEQGznzKseqeuW29rGL90WZkL4AU1o/KC5GkBRJ0XN7I?=
 =?us-ascii?Q?XP+TcxsHBn3U0GtSaFkTX062Ofk0viNeZ/XKB6cte7ckS8njW5wb42LGFeXU?=
 =?us-ascii?Q?nItuY0Id1sGbyGX+Uv8TlMhnkE9ZuXodP5QzN/LJ6sP0+1tXC3d1mExxW0Hd?=
 =?us-ascii?Q?ZyVbCHxJ0muhpKsA1fEmwEgLtHQ4Dlwnm5sPoMW4vtCH/x5D0b7EnVWTrL3p?=
 =?us-ascii?Q?9auHf0gWiSKvyveyqrLHsOXN/gRyROTqyeMnIlxpHTEMcf00HwogQt8Q7fGN?=
 =?us-ascii?Q?zndWYQWlp5opmeq4ItCAB2qNhEr2038RsopI6TnclQuUZBmi5ClhSZ17QCsP?=
 =?us-ascii?Q?11X7xBu4FyTAJvrN/cjxiXYXUOGhBsS/+/6BuLbAMlssQTzd2OlEZN9uKX7m?=
 =?us-ascii?Q?y3tvCnvbper0rVXw9jbYY65lDru04WdVyA+KMFUjOGi2PPJWdzwLy+VfjH9A?=
 =?us-ascii?Q?XslSEI1HAeLxj6jDTsaBQKUHX8vPUqxT5RQE7uO1A5Vk0B4krnaAbmQOSKEH?=
 =?us-ascii?Q?ZWc7zoeAdrDtQbgcxVXh50jvsjdtd8MDaWy1QeI+euwClQC30pIaKrggDuvy?=
 =?us-ascii?Q?t4CVofhOFczEjHCCqKBhWGeY1EyaqEWT5FoBQHnDdJGZZ8vt8/DqSKJrtPp9?=
 =?us-ascii?Q?YWkZb5DB+2m4Op5X5BY+woUqO1FS9ViSyqgQULI530zSqwVYaTqeL3VjApPh?=
 =?us-ascii?Q?BvVnywNAR26w0wo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9z65OHx/8kZFV/my8BJC5XrUZO/V8ePTnyYt3aOClIV2bgyL0k6bEZNoUs7s?=
 =?us-ascii?Q?KbZbl9sZfxcfk5tyCwyvQ2M/KpQ48TmYE0ylTjxXripuplAYG6K8tTWb2syB?=
 =?us-ascii?Q?JbU0cxO4G0FGEB4FacfQJoGdy8mdK2+cwUjGxhghVGQyKHMMRkR3+OzXuAxN?=
 =?us-ascii?Q?ubiAlgZb1HFSyysg3PXbYur5C5m6eJBFL0Od80Mpnqo3WfL9czcums2OVNS6?=
 =?us-ascii?Q?m+70qSHhX1h4+k8J6AcdIPKBuRhUAjej6mhaShLmdPoQUMTnhR2EvNlfLp26?=
 =?us-ascii?Q?yAiCTf1J0UgPwbR2+1K07pj8rNlV6st4e9gPYr4LdcVMbyi3lRtN0qRrUCjp?=
 =?us-ascii?Q?GwjenriAVfgQvzSXIWlWj1aRPemou7zCzLef0x9NAyYuhMNh55/EahoZ7e+v?=
 =?us-ascii?Q?pecykZ+wzOcZ7ZvB3vvYiGjrCC43qDPOAzk8mbOLIbbx2BELRNB2RwcoCefq?=
 =?us-ascii?Q?igrqaRX56wiQDZDjTRw9bjrxKgoyC4L1cxxiZpLihJCbTIGJut+fDX5NdD10?=
 =?us-ascii?Q?S+NpsNuaHeJgVRt9Zr37A/AxuFmg1xr3Jxq4bNZ/b97ygOGsEZIgLAQv6XdS?=
 =?us-ascii?Q?r0ayHYk8tDUbe6wgwNLD/4M6eIEtkhva2alWeehdFyGk/5VzE3+WjUn/Jzxe?=
 =?us-ascii?Q?JRDtpT/tHIYSihQvkWiEuivo4aZxni5TNkG5Q386nSVHSWNfzuaHaCL3iXaL?=
 =?us-ascii?Q?8oyw+aZev+6bFuQowpkJ7eNRVFv+c6Q4+4hUzbUp4aAYiu9MgJAss/WgE350?=
 =?us-ascii?Q?6wApcu8P3ty360JAC5z3mu+SWkrqxRCpgPyXGc/+YdH4EFPlZ6IQ32kJw/dx?=
 =?us-ascii?Q?tttaD/90KViMgJI+M1t9t3nWDGKoFs6Ug0kUG2rniIzQlcVKI4po+vszV/DA?=
 =?us-ascii?Q?Hf/hXWMBt7EUrwnJPsTfbhG03TcxSvIrnr/+8Q48HhHhPI86YbhZCHfc9CQ2?=
 =?us-ascii?Q?dIjDMgEd6JSBBCz+AeAku00T7wZSH9Bk0ireE++dwEBm2r3/wqs0L68y+YdL?=
 =?us-ascii?Q?yfiwXnvODd+P8y1hUpl7EstHDgzsENATvqCB+SawWRh3Gb0aGF4j/i+LLHrq?=
 =?us-ascii?Q?crAe3Ujr5foTRwSGp41C5yk8NiXUCBxmpdU9E93jI8OrACPOdusfErQeMdIK?=
 =?us-ascii?Q?Efgh0dU/08aawHLK96qu2Wyn+vAGq8Xvid5xLNoAzexseGFRPTQica9w2rsY?=
 =?us-ascii?Q?9ck5atR91vgYdU/Tbr4s5t9LDz66ee23u7rrQuAYTAHAEmY2BjaX7F5ctpKC?=
 =?us-ascii?Q?GIRYaxNZsI/KF+UN1HCdPGpI1+BA0/jJzEU2EfYC2zcxbiee6nVIAvAM+WxM?=
 =?us-ascii?Q?Cu+bsoI4gKoTFUBZ0ZoyrDYD+dYeKNV1srNPGd++TiZrkClfiMPmGWUCHksu?=
 =?us-ascii?Q?edxkMe8foUFSGamw9qPRK8+Xncvhi19nax87d7RxbIhKbGO7lBJWUuBeMART?=
 =?us-ascii?Q?/DSDrzsp9bVhXMru/7Wx+1lqqpSGZJnK/6GW1LGWZZmYJ5WZgN05o8hHIwUl?=
 =?us-ascii?Q?nTvm0y2sYmOts74PPr21BHDEvWLjJCE/KK/Vk9IYM352Ew6NaaWmS0udiSYL?=
 =?us-ascii?Q?iKIOfAgyxADOZ1IdRs/lTQ7m1xKTaEHnofn7ZwAL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48247ef-5ce1-4448-212c-08ddeb81b27d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:07:23.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAgGWTyaW2WHmZnn/lZYY+qrg2Mtq4Vb1bD9CKDU7BJalDCXHrUTqrCkAq6uOKI29q1bh0XHRoQ1S2CfaxBjuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
Audio Subsystem to the HDMI TX Controller.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 27 ++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5d10de3950c3..710b90bf0c7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2069,7 +2069,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2095,6 +2095,23 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: audio-bridge@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "apb";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2146,6 +2163,14 @@ port@1 {
 						reg = <1>;
 						/* Point endpoint to the HDMI connector */
 					};
+
+					port@2 {
+						reg = <2>;
+
+						hdmi_tx_from_pai: endpoint {
+							remote-endpoint = <&pai_to_hdmi_tx>;
+						};
+					};
 				};
 			};
 
-- 
2.34.1

