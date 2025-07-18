Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D16B0A3DE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0210E99F;
	Fri, 18 Jul 2025 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="i0+muH5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02D610E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:13:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbejvK9JHCIxIg3IAQIWhJIDPxtXiSsgC7qqcfCL978eMKdntcyJYFOKY3kZO7skrl7mUaIUnfrzPFgu6uJAQPWjxHeeI5GwAWdTNCShSeiXuSwnZaZMag+JDvN6Nfo9B2EatnMVp/yiui6weY5Tl5ecMsJ4unRqjYp5DyhrLs9KjCjB8TTXGiRsPcUvoNpknhxzgQ8bp84zH02hyvzkbG8+4HRApPN5o3dXd/3vSuivueMTVj56HPRwJAVaRb+UGuNg4PU7MWwqUStbtuMEGjCrvpg5FlQQnA/XxvsHAYM4QHj1UJ7I/sSUdDK30H5A4lrjWJPzOH/AmC+2jnK79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxFCzde9a4S2dlFTKMsqVAJzLEpoBcZ1AGIgtGJylwY=;
 b=lzyunwM7uQjWxJ48KVHPydtCxg2p3A43a8Rq8qAT5xEcEdmSENwQ6mARMmIH5CWuvrGo2xK9XLxBQC1iV0e1TxaOg2hfkchs+0KZP5pFXpIoDoAIM844omVpKVe5h0l+P+GYcyvPDzfdOQZ+KC1DrzlWCmdqhy3W1wA+CkI8FHsfcGkpdnim/luTrGDpa2djJM4jddgvtI65gyU6mAMSxCnGd1J40517JT+gk4Y6M56ltLYFSJiCRHhyziKTrw5X4V39XS8yLoDcXSDsJfNr1VgsDMkMhUelx2mdBmzlrSFSLBZSEHOJPIaLLeujY5TfdylhJN1zTbupg2p3rQd4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxFCzde9a4S2dlFTKMsqVAJzLEpoBcZ1AGIgtGJylwY=;
 b=i0+muH5ISYTeNvT/FkXA390olE8WBxjU/ZpAOPi+N2yYUdZY5qyuXixD2VRiWGMX1T7RT3BjO1BBAzdu77odx6nGG8U1F26i8I804BBtnCT8PhjB1cZPb7Qso5zUWoZjKKMK/mvK+D9Kfwsjc1LUZB/YUqye9c8DLum86oz6fJQ7Jim5DWF5dq4Bg4Bd0Pmcl4NZ39D5yzQcAHtl8LoMrW4Zz5DWxztAsvsYRsBSEJ6AIMdPAVoB6kMSgEDZOfOskjUX3ZY7VxrQdbf6k8r2IgofahVFxvLBMXpXKY6D6d17PSEDXam1RYWqdtMiCzcNQNm5b9E4q2HZn3euPBvpfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 10:13:05 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 10:13:05 +0000
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
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: [PATCH 4/4] arm64: dts: imx8mp: Add hdmi parallel audio interface node
Date: Fri, 18 Jul 2025 18:11:50 +0800
Message-Id: <20250718101150.3681002-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e0dc48-0c70-40f0-6f64-08ddc5e3af8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dDK7iWvYZsTs7Ey0gXRQZO6+26Zst1SaCOnuqjwDqFTtI6HSqea9F0aQjVnZ?=
 =?us-ascii?Q?Jd3NKUcwkc/0ZfaozLgfns5louJjlzW/+F7kqQ3IJ9eTApCrYpgzx53e83na?=
 =?us-ascii?Q?Mgv9JoeYGgn1tBVzcgdNHenbS+Dpt4+VzTWU27sjgRgHafM8AngcaESzM1Ox?=
 =?us-ascii?Q?tpBMOT0xRoRBzwwV8g9nfzpoKrehL4O1flkdLXO6uVStiUxJ2iSoew/RuNmJ?=
 =?us-ascii?Q?DZe4ufs7TCUYDknm64ilNp9R/tGyqbw/E7TyksogoCzeXuiUU/0ZXHne73QT?=
 =?us-ascii?Q?NAnLkhdyLla9kf7OuelFMlv/hyA8NFugaBjEtRzdEkgtkigLGCTna868CpE4?=
 =?us-ascii?Q?p41IQ76pVX3bTK7TTvD8DuMfdPQjOz4qShv0zKvb0jlLH3yoZiCeXVhTU583?=
 =?us-ascii?Q?Ke23/uJe1JRQ9DaCe9kNAIvKX4yai2j1w3gY1MqgQWSWajcTYWjf19fPiKwC?=
 =?us-ascii?Q?7uS2Tp9IJaIQcWCF82ORZnwwXb6t7VU2ahURlA3c5zhwEN9E0R2Cm7joB+Vl?=
 =?us-ascii?Q?SWALNo7pMMVPwPMz0iqw6LJZ/LAuhcDcRXhWIabwSQ1lUAd/TLfPOSM+gXUl?=
 =?us-ascii?Q?Vb58LvzipSfYTX73FnlD7JGcz7EgLzUnwGUqs1I+LcMG1nBP7YxL40Xy5vMY?=
 =?us-ascii?Q?8cGFLOQO0/dPDilVYKl+WwvutBLQLd3EPl0VZdIFM+1WQsiGUP1sUMFpmlMB?=
 =?us-ascii?Q?RmrRFVqiHBsf9tMd2WRLLe13ah0Pu2xNc1YAiEsmwzBKhrhhRKi2aV4yjZfY?=
 =?us-ascii?Q?zSrxEjqcXzRpSwianPm0YavkFLkrkt7q5RfXHWuBbgXJoeWp8BxoKKfW7gY3?=
 =?us-ascii?Q?vQ9K8AGxunujKM0R6c3wB2qEXuEMf8uQBqSAdlIcN3hIdXJeYKrBJbIjbZFr?=
 =?us-ascii?Q?Ls9IY74kJZ/PXeCO1gcR0UGJJwCjqhWrttKhLCj41u5E/ZOBG0w/UTEc9Nqi?=
 =?us-ascii?Q?7u/nPsBIGZ12vKbEr4nvJPFJBjQB0ZP1RRL7TFSzF55ujIXcb9QVBlWr89E8?=
 =?us-ascii?Q?pzEB0xfD3Bl5uUZWupFA1YHXNKNf0T6NzIC9eVbG0b070SvbKGRgXi1pJNAf?=
 =?us-ascii?Q?edhwGPkfj0nLYU1qVi/kM6s06XK1uZRqUvjiQUGLI5gSaTsDa6p1F4Ym8FIQ?=
 =?us-ascii?Q?pOjegnS7busy8Eng57kURZmk6wJ4HuNXOtM1J8Hmrfijpd54Hqv9J+PADvnX?=
 =?us-ascii?Q?BWLk0xC35iMYpEsAf4ew6MioPlINXp2VmBd9928DepLqtry+9Bz3y8DiKcKL?=
 =?us-ascii?Q?hrKBErL8KiYnPtSu0zkgdSbcinZvHH28T+n014XVGfvDdnPBVUS8sfJdXKuH?=
 =?us-ascii?Q?OxO8+ZMe1yqC9mWmnRrezI5irzZ1d8IWDto9CZDWGFX5KsgiL7t1tAYgk2r5?=
 =?us-ascii?Q?LIBm0f9403RqXaXnEd7uNVO7CLJzqZCIxgPHWTFsBpauFJan+CF9BlHCy/qL?=
 =?us-ascii?Q?RS4gIZWfr6WdwJEJ8axtnsLqAEcub96d09wzkdyw8vzCUwzWjsVshyfbq7GT?=
 =?us-ascii?Q?+d8ldWmXdqo3nPw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOAEg31jmwC4PR/2coy8b1p02z4rPzyyHIHi5/3l3p2bt+MgZfHUIRnY4LQj?=
 =?us-ascii?Q?EDFafXeWmrrGSJqEtsaFwaCH7yHodezd5eMxPVaF/+7M1pSMlkbnSZ8MSKk5?=
 =?us-ascii?Q?LkaAJylF/Oz20rG+dwA739DD8kn8N6+kri6sxK4Je8Fh0VeeJlT1K8hPuLmr?=
 =?us-ascii?Q?ird5DrZbpAR/kt0O7r9TJPh8+7H23scZjOVXFf15bTc4J+rW70qJGNsSM9KY?=
 =?us-ascii?Q?sG6Yxc5dGExIVdxsbEbNjply1bUjg6ObQ8y0Fkzz3bbmy5YDJOSFvmqXCktY?=
 =?us-ascii?Q?T0whw1H35kIY1RputJdcMOLBzwQoWZdC4omo8ebScBaXFS6jcEpgRO83/tDo?=
 =?us-ascii?Q?Hv84yR5zwJ4PupBvOhq9hSdbvNSYNaqXYsYJ9N3bhOzEvi5/GY/Ex8P0z5YX?=
 =?us-ascii?Q?3I5wHOGIccSlVEL2dssE5KDbQMSTX6Z8k8QkbHMofHK49XJTyaI6r4fRnlcw?=
 =?us-ascii?Q?3UzX0iWp/yTpJqLQ/UvE+As9q7yOWxHEDfmuqGfwS6RmGqACfV0o4J98PUWu?=
 =?us-ascii?Q?E8ROlvw57mB0f3KXqLyBjmqG2KvKBiN07Pju1FXNVAuSFLTc6iZYmvgYi2nY?=
 =?us-ascii?Q?L35FQSDKtltqjQBZ5HlDohD/o0tGZWFmnQL+4ZB9GdUfLw382gW1cFUowmf/?=
 =?us-ascii?Q?PezWDe37FlkA/MB85WW6Ik0Uxs3JSraDZP4tysMqnQtjLJ0fCjLb/CvoznOo?=
 =?us-ascii?Q?aFFVNgUHBFk7mZC7whK9oKzyUpIK4WIYC6LMw1XkpOOkE7320Xh47Jdknz0S?=
 =?us-ascii?Q?xJFF4Tf9dxXfWg6HEYSRDHIis3OVyXztfiHicV+IpBm/S94bSpYGoPLaG/Ef?=
 =?us-ascii?Q?QisB84RzdjxMMvBpRz9443fpF0mS+uXIDL73NcBcJLII3q28IqR1DuaVJeBy?=
 =?us-ascii?Q?JqfpBywU4dLflkfNdcfgN3FklIf60cYo9IBh07vxT44F2CKvLuGUVX8TRU/K?=
 =?us-ascii?Q?SeDzKQpxvla87zNnOKqlNR8IfJCLWZa9sFu6TzVNMEixn3lf0SHgz6bjaZuJ?=
 =?us-ascii?Q?WK0kZMVj8M/o5egs+K8yL5QsKntTAh4tZx/psKjM9Qw/MCHs8P5YXpNSU+Pd?=
 =?us-ascii?Q?pMd4OrbTrkeqwmZSug1glIVxwSG5EjggAuuchn1hu+e1YH/anrJK4jP7fEZs?=
 =?us-ascii?Q?3GgtUG5gNJMiFr92olASWidYfhDqmwG3Hmn8Cjovo8r3bO6neK1lX6riJtcE?=
 =?us-ascii?Q?TC3uutHFlvISqwb83Zhc2Paz9wChelXFGvIMc2GKg1o/X+8e8dOj8zIM0vp5?=
 =?us-ascii?Q?0TIHrTiRDMhsSlmHTQ/6JLxCquOY3WsUVgS0lidecIJA1dIdVy0KfZ9yBSky?=
 =?us-ascii?Q?eZ/bbc66WKIWbXAVUPi8F0SqtW6W9duMHJnef0ExZnmwjA9yCjZsX/4nEAlA?=
 =?us-ascii?Q?aPs1YvykrTYtlbrUMohmtV5B7KbDZNHrC5pqEJfvwfiI8y6LR+/7U0poIMlr?=
 =?us-ascii?Q?Tw4fPqrSS7ogbiVOmNSMi2wJ2DHyrarMqaeIhi1PO9x/gTLyuJPuYzY4IQvx?=
 =?us-ascii?Q?fVv9WGh8qnX7zbr4aBMEgWf1xNSHv/1zZ5aMKkcrzo2u0hUzyjRObDv54mBm?=
 =?us-ascii?Q?D5Hnr/stXOD1MJARMaZJY4ZtnMM6Sn/SP9+2q5Eo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e0dc48-0c70-40f0-6f64-08ddc5e3af8c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:13:05.2190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1CtfEr2t+/q8O67J9v9bizGomWz0Zc9nCLMYm8T/gwlG5zTz3v8qTNBy5v1Ux4TEQKIawyjUVCFVm218Ik5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.

Correct the register map of hdmi_pvi, which is overlapped with the
hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..cc9351a5bd65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..6e5a41f46309 100644
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
@@ -2089,6 +2089,22 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: hdmi@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2140,6 +2156,14 @@ port@1 {
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

