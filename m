Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A275C989A0A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA4E10E2C7;
	Mon, 30 Sep 2024 05:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hMCk2ks2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1467110E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgq0fRxnurg5acVlmzAsD+bU3hswb4u1e609MK4BhlvdM9HjqowplRWzeaeBTcaviYOn6A2FHfavql3lLI1++lq610/iTtN2rAL9NkXiHPy6AGDiE6HdyQVsHwmK90q8Z2B+8CjLia0IDm9pDI/si2SMCSTPJ21LEnE2+/5FQ7Kt9aLK7A/GorpbPyF2XusWettZef87wz1I19ehKod6/Ijo8/LPjDaFiBJppsFgjbH4i2EyA4fTfZMDseDkVCspA+fp51tBagW2nAIhMgMesW8PxJy6BJx6lQHSlK6hBycOHljSVKVO46/WOwTBXjpINPFEcWtQ2cgLAVy+Tb/iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6KeBUQwv32IvFiTA3RGW5mVEKCvk1/S6gK9nyp9zL0=;
 b=X5bhl6aIj4s+rHYA0on1YBM3SLIX0JtWX2W8RkwogvTuY0mNDOx+sFad7jz+oLw7TyT1DZJPZZ6h5BCJzB+hO5fxOtCqiS1vhf12z9Dz4iiygWGYkQeJmvTQe8BHtrN8KqVt/+b8aSojKWFLPu5kpLaSXzsBFXPLoXqltHZPpECM8f42nXlGlpQLyRTFPDJEVLa6w7lTGA/8yV9qKjT4l8AzuFZqZNxuQoPEmqJDY6LZAyxOez38GuxrnkIcWNqdoYmSFo/OedblSKmHLTySZ932wDJKSVm1zLIcgH+l5umjwO4XkHCDySZiLdsRJ65domWWJux6bO2eMCrdWl9/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6KeBUQwv32IvFiTA3RGW5mVEKCvk1/S6gK9nyp9zL0=;
 b=hMCk2ks2WY1Z1eaWjF4eGqhOtljn+BTxyAPcNfmMC3brBbg2fabGfgm+sJNcE92XLoo7iiY3kGESjnM7Gnblu2qLH/0HE3a8t/RDGkfrmCrbsn89n/kZBTu67i0HugffFJjF6Cs1VA99RX3H0rjoZ0LINZJxaOsWi318Tk0U3aXmGjb/ZRCmO4IUfEpX9rKJ22nggL3oalYjrU9fUFEq7L/JEBe3DpeiUXdRLcWAc6BbmvBqKtUsTZqVHFROuPt6XnvqnYZWVeOQOgLCVLJrdn2JXL3UgZ/todhbBnm+C5ALs4K3aX+MP5znwO50Ewi3bOtYP0Uc0M4n7jloYmztcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:29:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 2/8] arm64: dts: imx8mp-phyboard-pollux-rdk: Add panel-timing
 node to panel-lvds node
Date: Mon, 30 Sep 2024 13:28:57 +0800
Message-Id: <20240930052903.168881-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a323e82-e9f9-4600-aa53-08dce110d00f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qo4xo2+cpz2huJ5jd8RzhX0TsQU9I69DU7UeYHTzrP4YGpatF7IerHWI0MbY?=
 =?us-ascii?Q?0N2Ndt3c1UT/q6lY0qf5FNxbjelplFubxqBYYMN790vcxlgcWWdm+v0H9XlZ?=
 =?us-ascii?Q?BHHDDi83fiIIbxbYN4QjnQxZYu7RD14qgWEI3aFy/qGBItFvkQ6q9Pz1JM6/?=
 =?us-ascii?Q?Q7litExIM+h9BiKQxsorAUqFnXzk51bvarQq9AyoyAJqF5aEIkF9QpquJaYp?=
 =?us-ascii?Q?AEBEfj6rHvAscMiBFq9KWFmQnARrHsTZeV2tCN1xX18oY3D7HqXS1YWHINuX?=
 =?us-ascii?Q?rgGNA+Vjm6Mph/2/ruSS+E0PU4sZ7duIY8fJNZdErzRcoeaCtyt8I25Qy200?=
 =?us-ascii?Q?4gfS2oa92DwhDBU3hMADJiOdEMlU8HeQIlaD2UiQdRpYbtzSEetNgxy5y+NH?=
 =?us-ascii?Q?zXD2DJws3FN8mDjqsjSp/FLhe5IUsZH9K8JWNREDAWM78uU8vfXo787R3AAW?=
 =?us-ascii?Q?b9Jq4r6mXueFTK4M61ZPbiWMXMNa2x4SNyYyEsVdjNYWZBWGBbQBMDIRLFeT?=
 =?us-ascii?Q?YbOBHXey1YKVAbvla7xdeSTIpdHMUnkb3gvNk24bJeyX6OLREJyUGn68BG0g?=
 =?us-ascii?Q?Jhr0iasz5oPZwqXI/5Bb1TPRXo04Qt+bVErE+GqhNYg6YgTltsfOf28aC4X2?=
 =?us-ascii?Q?hgWbtEjUcJQkjOEQWfH93cBVw/A0HqHyF+ifuYaRpPTbIbeDAPodDAG9vHWk?=
 =?us-ascii?Q?DRbzcTWf6P1pM5Ov1aDfZWkBNTJ+IV2unmkOedRSk+cIu3SlygLY5/JFESpE?=
 =?us-ascii?Q?dN5RBJvk2bzIViZTIkcGAtQhaM6cs88Io0Y31DwiL9qUqGxgZyn1lZh+98WL?=
 =?us-ascii?Q?uZ5XzZkR0aF1Fq9ydrsDf6vkB+0dyn1TG1AQ4PVv+PGiPCpwLO/RW9i0c8Yy?=
 =?us-ascii?Q?s+/B+dYykOQTbzcwV1rs5OxiYNulicOy7dseiOSaEEK60jw9153pT1LqMdBV?=
 =?us-ascii?Q?GhErtTQ/EJNZSKil6VXNGq2Ghg+D4eUJ+Zyo7AaRffEXXTsK+yNK3l2lvs5P?=
 =?us-ascii?Q?3LMdDkHClifLk5OhL8/hFh0fzmXY0Ak3FQTuTjt13KOmJzowHBD+5gKs2bzv?=
 =?us-ascii?Q?xjUSOzC7isKNVmfAtLP2mLJp8jKi3cJYeLgNAxl4/bc0T5JASivfIOiLomgl?=
 =?us-ascii?Q?zDZEZflXc46qy4WEN+1809BjvHzpBRZOn2UzX/L4EDrqKYN2fbz+Hj36OH5C?=
 =?us-ascii?Q?ALwv/Umlwwtbg7pDiNJMsBwaQEAwgA1PUudr41p9ajemm8CVcl12lUI+gfpq?=
 =?us-ascii?Q?02p2GcB0TOW3VivdncGrQpUgBhmhy+7Dsa0ATPDuoa4ElOLzdu+SsrCTwTaW?=
 =?us-ascii?Q?4wwMFbbBJOr8aZxI1H5I2z0TYc47/k/Nft8oVhJske8/6kUkXMcvioqXOK31?=
 =?us-ascii?Q?dduv2vWA6WoQ/NPr9niiWVwUAru/8HKHPwwPzPvDhrPuiJBhEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGoe2gn8CbsUWFinRS8C5W4Efa9lkdf81bWlrEbgVoRyMTsd3U5Fm9aRv7XJ?=
 =?us-ascii?Q?mjWMi9S9cejPDU/vKJQjpKOMdL/wKhDA90x2fCOkEtnbE3p0zdawILVvc2eD?=
 =?us-ascii?Q?dJVOS+ocZoXFOuW6va9uEW2KuF2G/MYivM6nKHfofRBQULbClDKNcEznahr+?=
 =?us-ascii?Q?lwKy/B2rTZvpXs64zjXOIZCpHsXhrahg8JePCsZiwY6dlLTHpYIcNYytx2HF?=
 =?us-ascii?Q?z2a9mQsTz59l+71eBSe7v/tUcEOsvE8tpaKUDAxQuiUkS1DWR6aRcEzmjmv/?=
 =?us-ascii?Q?xNEa+jpwjyokwq/qXzQLTeblWGg24vv8/v9bjlKSpkWj0fuO/ox0Ot/fTaV5?=
 =?us-ascii?Q?KiagzaHB/eJ0P3wuJEA2T+NfDLXR1KV68490dFrgwhP62E7YTQJh20UsiNLs?=
 =?us-ascii?Q?YHDnOluZJXj1FTgorGARPKW53IeIjsCAqT4Vmq7c4MhuML1NWtKXF8Y1BcIR?=
 =?us-ascii?Q?NdTo0ZEqErQcv+hVMUuBln+dbnK2rvnDUynxBo7dRkPEvjjeVbeNMWcoZ4aO?=
 =?us-ascii?Q?Jr2fNX5MaMYWy66OyrLLR1KQeO5QTQ8KRvH4JvHndy35ATzFbw4bo8flvQmE?=
 =?us-ascii?Q?k6o9NCIKhBMr3G6kD5bfn4Qqza8B56CT/JgIsoLMxuooXIj5zx2OMYfIdAOH?=
 =?us-ascii?Q?FSKZ8fqxR3laSabz2UKPynsOW11W/jwUfypVBAQw/IOdbei2T5A956L741h4?=
 =?us-ascii?Q?qCfCrdz7fnGqPYn7U+gHvW0EneTUInCTUIq4Ix+MPlnpx/2oFnM+9BTv0mAK?=
 =?us-ascii?Q?fK/DYAF7nEPMOszAlc6RbbiWcXQJGQCNF4TxwgnkR2EfYUGvsQ9Ucd8PX2U4?=
 =?us-ascii?Q?6iBdxf+QvvoKYG+33ujZNV198O2Nk86oSlHjXc/g2e0/2JkO6gQdkxuuqWw/?=
 =?us-ascii?Q?HkPLtlWHIyygeDVEzCLM3vNlYj12rc9LHz+bMiRjIdzqItioLH+DgBhfd1/x?=
 =?us-ascii?Q?j92sY8dMcKtegDwquuv5S+v+prGyqmIinSbqIRB1N3faOLP9xZgWmeHcx16B?=
 =?us-ascii?Q?uPuPiudfWWU/UHXQxr+BLHcPhjetqwsP5wKP7CZgrXrCm+UV5PtGt7JBzZDg?=
 =?us-ascii?Q?LCawviGIzSoeUwLmsl8+F+90DLywZEGzlgvfknPWJwEubBd/4jGA/adKsz8V?=
 =?us-ascii?Q?TpI/1f78y4PcqanYSL8XAxNHQrkAunGGdjbDUCnSXqa6xQTwZuwws5lexgHQ?=
 =?us-ascii?Q?FpCHeuuNpUidQPo0rRdWl1isH9Wh1KzYRgC9pfIR55+RiHzu6+JHGEFzKqHG?=
 =?us-ascii?Q?wwG53NeQyxoAbGxlV7tBI3rMVmNe87jGR1m/wANeexKr9cILwN0xf4P5bugH?=
 =?us-ascii?Q?n10Tr0vRxFutlchTWtjVl2OVkSV3i2ogzNrHgK8XvYIkJF7TxcfchdUPPRSG?=
 =?us-ascii?Q?4dqeP0UEp7cx4PqCQRcKCE0aW8hcyHE8DntA5WunuNVgvGk1ChOAi50bgvax?=
 =?us-ascii?Q?Qmf/d4RBp30r5z0IlJgXdn9lfz/OnRON1YhymYPFqoOTbkzcXmzbL807KfPK?=
 =?us-ascii?Q?iiYDQfHn9TqU9r/Dm3AFWgD9RX9YMAdPdUWsj88pq6yG08WkbuKjpPQx8jhy?=
 =?us-ascii?Q?QxQ10HyoLJkwZ8g2iuvO0e0yBKg1cUnHDMASv9p0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a323e82-e9f9-4600-aa53-08dce110d00f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:10.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjsMD9JQHWmSMtaN1zrE5Ng6mG3CH3edO8eFzkjEkMuz7Xbxs02sjkwiHnvesHuJM6Lc/iTR15DqE+Z62fW4rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

Add a panel-timing node to panel-lvds node to override any fixed
display modes written in a panel driver.  This way, 74.25MHz clock
frequency specified in panel-timing node may accommodate 7-fold
519.75MHz "media_ldb" clock which is derived from 1.0395GHz
"video_pll1" clock.

This should suppress this LDB driver warning:
[   17.923709] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (72400000 Hz) does not match requested LVDS clock: 506800000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Fixes: 326d86e197fc ("arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 50debe821c42..20cb5363cccb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -37,6 +37,21 @@ panel1_lvds: panel-lvds {
 		backlight = <&backlight_lvds>;
 		power-supply = <&reg_vcc_3v3_sw>;
 
+		panel-timing {
+			clock-frequency = <74250000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <72>;
+			hback-porch = <86>;
+			hsync-len = <2>;
+			vfront-porch = <15>;
+			vback-porch = <21>;
+			vsync-len = <2>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+		};
+
 		port {
 			panel1_in: endpoint {
 				remote-endpoint = <&ldb_lvds_ch1>;
-- 
2.34.1

