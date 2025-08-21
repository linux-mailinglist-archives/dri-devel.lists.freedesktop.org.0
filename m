Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED044B2EFBC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CB910E88F;
	Thu, 21 Aug 2025 07:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KzfC6D5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF5E10E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhVB+utG6YSQEe7XWayQBX+hsSrexWPi7s/zDP9a0aSen99zwWutYOkVgXSYsrBiefwybJHNoNX3IMYOCUBD+VQfp9PTKVCkt71sLxQz/VnB4K/x3Lz1DV0Zde4V2N3DldI0f2l5HB1TnLf2ctKzmciC+ylsViC6UyrUvF0YW9l7dQcqmkC/m3OilAl9k3Zm0vClsfzZKaRUGlRifKbHTXvs9g+xtJc/Jq8oTA4zzFPibOEa0+TmkBAM25lziEv+8SDtAHAGBY7vrvcso443M73LzbfdOm2YFM3Po/G+QC9W5u4QZNKIYrPSLXSx9WnrZPLSVYXJ/aSMvuaahTCbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tGyFt5VVHQuzwwReOdCxKLQ0ZZc1ZZkIz2xMnMzatY=;
 b=PcWLIRHtPt2ACx5HVrm5pjBXtZ1DGgYR+V0rr9AosT8HqS8qNXu2KAdYcp673hG8VPEnHacMPfl2GPo6R+2ofMXmCGmxhHouem9rESdIwIXFIA2JqdoPzE+j5p4NYZF6QLklGXrp718lVeyGRS0h9MWybMtUjkVI6lHzCR5q9oY37D1vBW4sWxe9kwNWze5jk5yF8l41Y6eHOj2UZqw4bWSSW3bFFGRWsMc5DeFckuE84uMCCCyv/Zcyrol2a00BvZdPTcHytLrLjz9Brgj5LfAcqNsiwVXgJWcM6gmERqoe2/iuCuZkPEN6uVSHODe73UCBP8fDdgla3Kffd527JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tGyFt5VVHQuzwwReOdCxKLQ0ZZc1ZZkIz2xMnMzatY=;
 b=KzfC6D5IFHeTlsLJmvvyYgcOVFtjrKMlTlAnNq0X4hiTLQ1PsbvvA52NmrStL1FkXBQcCfu7tzyNFynaWF3dyq4FpCD4+3x565LJ/FKjeqOMmWrW5ps3fmcK25xNlpeZ+iOhn3tANiWSK2pD/BysD2iUshHtWgXconSxCOHHNjTorKuHqRbhDB83EM+18iXx6Jw9pVaV+kMlcK62JoVFGqBFTFVUsxgkbSItntqHFXu966CKuxfrAS93qLzhQNELnwIZ0CT2tXhugwx58Tj/D/12RDBxk0nfKC/Z7BCLx6eFIF9m9c+zEPYfeIXskTqJNrmrf3AjAOeq1UVLvmeylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10607.eurprd04.prod.outlook.com (2603:10a6:150:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 07:33:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:33:26 +0000
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
Subject: [PATCH v5 6/7] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Thu, 21 Aug 2025 15:31:30 +0800
Message-Id: <20250821073131.2550798-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10607:EE_
X-MS-Office365-Filtering-Correlation-Id: c6783b11-7b47-436b-1dc1-08dde0850469
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6sS4PvrhOxvFnuaqftOG6s+sxE9uU3qVp9jUr57bu8fzDPGs8EKsVFxZxrVY?=
 =?us-ascii?Q?KIQH7NFQJkGqFOnYl9rUgpTmJQhCAe82LXuFWdAp+bUJNNHWlYKq6ZmUmGfg?=
 =?us-ascii?Q?1DSRGEYO0j+PXBfEctTaCxLrHMgTDtdQSNCFFHpQxIganLHNpbBb7I2OH3Qg?=
 =?us-ascii?Q?xlkH3/tVHskNH+jVBLdhDladKBzvgRXTKTwOsIU3Nev6nBE7JLRZSw0rpyqY?=
 =?us-ascii?Q?nE+iOM1tg4F4tvKUaQ1sAgvbD2oy+0uabS9a1V0dOUJRVOwzeFH72XnovmRy?=
 =?us-ascii?Q?8HhWBcMGbC8gNU4oc8m38PetGkl0JtFUONeSgajmgvQnW2ENTyRoTP8x/8Mp?=
 =?us-ascii?Q?i32St35TYkeg+sbfvXbFZ4V1p6JcshbiWYrj8EtyLg35ZzWxFN6tGUHD+ooA?=
 =?us-ascii?Q?JjpceoxhP6VmUFrKfjACPtraHmvjJMeFQVd0bLka1/Rm4MMj0Tfjd7+Da7wo?=
 =?us-ascii?Q?scviRtUHUK4DuHlO6IBPG1yB2XcdYIf3FOHCzpOZaT2y9SUqqHpUT/EozVBV?=
 =?us-ascii?Q?yuhBUZ/ap+Y4Xmvs2y3nf4HKd9yMSrBKmvlqTmw3bn5nr4rUVro4jpnIcNcg?=
 =?us-ascii?Q?qTa4Uj+udI+fKcQg7MWOS5HP95+9WAUPSa65LroP5o1ohjEUYD+yQUmzl80x?=
 =?us-ascii?Q?4XiU9ZjcSPhFahv4FUHpf1EJT3eMoPMfvTJhl9fUNT1XN8OGBozSJH2ZWMVI?=
 =?us-ascii?Q?e7L2ehZGOzam/G8NrQmwR965PsaVheXl9Odk1WY5kVtKbKJaOtxJUZCQ37OX?=
 =?us-ascii?Q?W7/4rRABIdEpF6wAXA9ValJf7suD2CMMI5mFlEsYKSaT/XErC9kaNXvykJGN?=
 =?us-ascii?Q?Ts8sYUdWBzRTP9Sv383Xn42L7eTn9qLMcUSrhwSQuYScxMTKzGwLhP7VLRjf?=
 =?us-ascii?Q?upRO6NhlZNu6Wcx72XcJXsCPXPQtmGd2UtZOIVfPub59W77ZpKqo0oHe9nP+?=
 =?us-ascii?Q?nQE4kYn3Y5GvLWGQ8KO8n//ookzguKVnWqITF7qPCVk6ChucVtoamZ7o/rz5?=
 =?us-ascii?Q?uSMylUHsxYjS1fY/p50lSp0Ylrf65atEo5IPrGwVOCmMh7ADdtitcySoXbXE?=
 =?us-ascii?Q?/dp6Pyu0PV/9jLHUT52KAmlrnYJqsSZDMfAjmkvA6ApJYrbMIEsD9qQf4RkS?=
 =?us-ascii?Q?++B9mksfLJ7epGkCdHKaXTmSQ+/RbkaViyUtum+o58JYcj+rKI8QwksWvoQQ?=
 =?us-ascii?Q?YRMgaDsN/y/msKLd+eGQ3v1vJDqC4m4Dalu1ar1z9vtgPlVDHkQ/BT0gpuLA?=
 =?us-ascii?Q?UF6FSRy/D+1x+8qO/m5RswAogKOa2n3xblz69B/XO3Z9B34DkTE2XprIVPfW?=
 =?us-ascii?Q?IRGdAPjb1B+MIoj24PBMGyzeaIOA2DlLWJwiTk2XOmhWo7ZW6NaAQKRuEIs2?=
 =?us-ascii?Q?9ocIrspvVZFPsu5EKNfq+hJMFGtPPL8pa6WHYqD3tUWH4kNQWuxsIHmaMeWa?=
 =?us-ascii?Q?BEoJiIcL3RGnD3hrUqncbwZsJHTRtXE0ejNf3aWJy/6TYkd0adJ3mFb3gujp?=
 =?us-ascii?Q?+5cTj9USYEsX/pE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGrfN2IdW6vtz0f0mkNQ2MvAK+fyU5KTS+uxWmsadqLxJSFc5Q2UpKhUXiAB?=
 =?us-ascii?Q?0EMPA9wjnuM0S2IX/1OsCKE94GLMmBnFCbrDap64xIczyqRzGpsEPF/s6T5B?=
 =?us-ascii?Q?E8zexh2tZGSSL+tq0MA2x0ZiMh2pK1FgagmKA/IJLVOfmOSW7Hl3GEgEx/GT?=
 =?us-ascii?Q?PUMd0LKNzzU/+lkzqcfCkHEKI12bQCzCMV6ATeTGjjhBAPrgJqaFo5j+U9su?=
 =?us-ascii?Q?OaomXQL9lYSb1ULPDBXlNJb/07EkoKU/NDv5SsUI6Z3NwaSMpUVRUnWfeSG7?=
 =?us-ascii?Q?Hg8cTq/+Y0BtdYdgr1lCGrb58Z3NQMkEnvaCBPw7kbR7Gus/F2W9l3cwZRzz?=
 =?us-ascii?Q?farGvPkdFn+j0/9EpHEI185u4OpQCuOQ4DsNwtV/vpGiySL3vLi2R5ka5Idi?=
 =?us-ascii?Q?nBSaRimrikKzLCsxkEWaSlppDiybNMBMQHzPcXqDaeYjGyIegfacvVOYeL6h?=
 =?us-ascii?Q?9UdMThetobpzssQFrd231fTx7wl1uj8bTJiAflo+J0Jbq5ZgKHT/CjKgXqZZ?=
 =?us-ascii?Q?U+VZUxaXXXUZQtWZddGqflh+3cleqN/CDP8ai1Tz7Bjmle8/3B6j9+/PMgMC?=
 =?us-ascii?Q?JYJTjmL1KlMZ8ab/8ZaoPFc9cUc7HEvwqf2Yv0VVZwu8vXDtLYunYF+n1uF/?=
 =?us-ascii?Q?XJ2oCKZ/ocobgoC1JkYLjgVdNU1BElLEJJ46NsGMEKtemHmH/+KGu7WYrU/z?=
 =?us-ascii?Q?yc9z02I7X6+A2n60GTn0bYydfPlHCW9UH8D99Et205hVB5V/p723iDwRvG5x?=
 =?us-ascii?Q?NqOJuThX9nxhvRYY4p5k1vN9ej82xDWePSAZipo6pDpDy0rwf7893DecAXU4?=
 =?us-ascii?Q?sOx3Z4pGhhRaAOYzgN8l1ekG3nZfWOua0gZNQn8qmKPVJGCA1MFKqAJJfD9g?=
 =?us-ascii?Q?RbWKiTmVMd8G3JCy0UYZTNl5UaCrR9Mgt3nwsHyx16c1dGNY/OyT9imUXqKg?=
 =?us-ascii?Q?HLTuoZslfEJ3eKwQ87Tpfy2kGkMTNU6T0ddsNBrr0V4H0bntX7jFT6EUWZhn?=
 =?us-ascii?Q?KlQ5wfcYq+WCna47knAx86Ynsi5UmhpMjE2KnsHOUly4UkfviTE0axdkwaO9?=
 =?us-ascii?Q?UtXEWg5AIMxXu1q+Z7EK+etNNHMh+WezRvx2tzI7T0B+gJ7xkHb0ajTvTtOi?=
 =?us-ascii?Q?JcCV2KlwnFocac7slyJdKj1zojcU2qR97fd/GJkv0Fs3QbZyBVdib36VcFzP?=
 =?us-ascii?Q?vHm0D63UCXYb7uY2JCPRqtMD/vjpJKd2GueXawHxdLyEOgfQR4pxW8oXYs39?=
 =?us-ascii?Q?nUwhWmJtX3TDGpOeeWxpSLIqd2GJ8yHu0tHMB5O+rGHu0eSEMmOXFi9a0C1L?=
 =?us-ascii?Q?uXvZfoOxDz5ONTEWnC+epXkfhIwXOnhz2ZRfnyCHdOQFMtR7G0GQvmcVLY99?=
 =?us-ascii?Q?JCp4FAWZdpv0YkqaADJgg7WtM90JrqyrzOWev3WSJzQuvZwLAA+lb6YkZD2r?=
 =?us-ascii?Q?4PGgSBUs7amIaY5BrlUAfpOuepnCeoT5Foh+m1JAim/BdNcc41xwzRQDui9O?=
 =?us-ascii?Q?+//sPkncHIDnYfumYcKpHnd0M3NLgBN0Zp9JyCwshOJAj5tsoMvaaLLv9wBh?=
 =?us-ascii?Q?nTsrTE3vHmnx/Vk+FIDZLhRfDLcNacEGgJWXsrxa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6783b11-7b47-436b-1dc1-08dde0850469
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:33:26.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TTyyxaFEBygvAXkC6c7bqeyptEGd5yUMlDkLP/7z/PM6Mea4EwVyVOaq1oLjhvC/Vy6B455foiJ/ShrRXs/4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10607
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
index bb24dba7338e..b733ec7ff3a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2089,6 +2089,23 @@ pvi_to_hdmi_tx: endpoint {
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
@@ -2140,6 +2157,14 @@ port@1 {
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

