Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5CB07019
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C28710E73A;
	Wed, 16 Jul 2025 08:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QIHgmbPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691ED10E709
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4W+5RT9lG94pa+wd4+NxBT37ERf3JyE6a4Qnk3Wpew/1f+3Lr/RPM5HFy5D7Tq0z02rQGU8+RzJvxt+o+ZIXbajf7iaQ4geKvrqlOm+PamhFKI7DF2bYHGqvitRJe9YhSSmBVAqU3iBWZmPD7KZWHPCyiLZcGHyNnOBLsYCMAOSpgNzZNl2QUE0YOz4KS996SPZtA9ppA9X7nh4lfjUWJb1OYjdsLI1bmB1itAJONAarGEv/QracT71aBIXrO4BnLeSvQOcAiUD2qajF14jsIecsmDQPctgTQZwXwVgGYH9gkMzM8NUNge1c7seNA1RB/HtZsplQaMCyA4ybBcq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/TiecW8027z/K9GBl2zRzZUDw+hXevqReIP1qk1HsI=;
 b=ra/7bIhw3R2n4bTF60dxhAWus2pNOwtlvEBM5Q/BnC8DleM+Lu2zMhbwUyQPDHYUSmsry1dcBwKiurD3qdCUk23MDCSla5nz87ranIAxy4a99BGJuxn1sISYPYucYhaFX92GAkmAue+OgY1wHjSl16x3cKfQudCHkXzGV2CFUgyNH313Hkveyc6PNPXcqFcJvK4rjxWvcx+M+SDecgcQ3Rw+2U4B2pFPjuedyKIPXQeBtbwgXvs4vMgdh8ZJLRaTnLfZcLqpj7dXjgHrXhSNhsou5fMNTnTdlnU0CYC2Ns5N66myh2vHF1r9ItU9COO93b/h2rCaW6KmVTpU/5CT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/TiecW8027z/K9GBl2zRzZUDw+hXevqReIP1qk1HsI=;
 b=QIHgmbPVcQRinnPSJr0Rx0nmdXTankTECRsnt/LhVfbHABdqQXF/0mdSYfdZK6UB/xepnqFHmMKWSqdvIwxOwptLdLr16SteIRpr/MNyhvhzLtPsUgn3v00BpEA12y05CX+1ieg2gAXcsQZselnME7y+0ENkpuCp0Pv6ypzh+ePfWHfPVg3b58za4g7RhpS9IRK+3kMM4QGMaL+rqvXVaAHyc2H3/yb+Nl+LyX7+DVirGTX+1sgqMNxT0YpzM4JL2eTanf+ezMpJmLvAJzURj7z8RKHXureT5qb8mE7t0nHDQKAQSJnrpj2p74NKyW4EgNPU7rjj8fASbKUgIG4wpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:16:09 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:16:09 +0000
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
Subject: [PATCH v2 09/10] arm64: dts: imx943-evk: Add display support using
 IT6263
Date: Wed, 16 Jul 2025 11:15:13 +0300
Message-Id: <20250716081519.3400158-10-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::17) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 23392400-02fb-440a-64c8-08ddc44104b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iQRXjY7miMUC+I14EI309kbcx9dPB5ux4FKgvXbEjSyV/Xf0MuaA3ky9Frmw?=
 =?us-ascii?Q?lpFqMyY4CdfxrLOAFCp93IgCEDAy873PpkLErgu79iJ/kke7Il0RTZFQT0/I?=
 =?us-ascii?Q?bpCMR6McsxIBk3U+TaeZG9PV0e4C0ZFj0cc80iz3H7nMlZeziyd6gqr1M9SZ?=
 =?us-ascii?Q?ixcasdywg7xo29nl93rQpgjf4RoxakN6S2+N0XMLFsYFox1TGkL6kH9YBNyO?=
 =?us-ascii?Q?g7RGgAISfPm+4BYmX/7MKJXNYFO3U4vuRL1b2EmfboqSDEY9CCJean8xZfsm?=
 =?us-ascii?Q?hFoSOS/ZMyxwf9WyXAqKWphavSta3SiHskUYR7Xo4Tuxd1baffP1MuKB3FIj?=
 =?us-ascii?Q?LdjUuqs8oemvdLzx1HedXC+kTcKW/p/7uxB71UL6zFDPKVSFZ6BJG0sI/QMN?=
 =?us-ascii?Q?ajxUFLDUPEn9akdD0AjAmxhzSKRUUekNmiP/LZHWAIAmcxXRqTfsfY1su83A?=
 =?us-ascii?Q?ein1i0JdtAK4mXnyJZ9uuJZLsbz2Q4+aaiyJaMQMtY/XUCqvvhiFyrPWyOK7?=
 =?us-ascii?Q?wnnSEgHbsoQRmWUxaqTjbGaQN4MWPg2nxIkhzFy1q6BtkO4FOmkV2RqltZKI?=
 =?us-ascii?Q?SUn1Vz4U2TcyiRKJPKabSRNws49nUEwZBASgen1OdgEp97GCnZTokSjAd4av?=
 =?us-ascii?Q?MP8dcljmeLY+ykLlHBp8Xf8p7oiKBdFTlSqTAfxEfNtfxsJ9UX5tt0gNLww2?=
 =?us-ascii?Q?FhKQZuwSzM8pUJ314SiInjNh2nKu2/jDLYXnQSMFZMxHTytvB6bhYGAHWyxu?=
 =?us-ascii?Q?N6y7XVFPln02QR3t9ixz62ZNfRNE/VsSl1+bCnABYXxTvQcXsEyk94DoIfo/?=
 =?us-ascii?Q?FlZSTn5ts0rUxNviHd5jccIRcIaNHu/tP4zv/79rEWfNJiMbnlOBVyw+K2lm?=
 =?us-ascii?Q?iUfwpsiiwjoUrbIrU26WNegQi+7WZP58aWnDbQ/hfUI4zGMSdqMhEpXJssXX?=
 =?us-ascii?Q?0daWYkPgzVojm+sC5WKt4yBl1T7QkWxl/2MPA5mYoHADSSHmCk9vA2f4VLkv?=
 =?us-ascii?Q?Ll1vwV4wVWEf5A1Xf30ncB2tcxzTDCGeKuzuE7BB0ootXckET1+b4KRvCxyv?=
 =?us-ascii?Q?UNxoQxs+5U3UsBHhKF5wo0j7AOab6CfhRGqpT4LIEHM9rzKrUcxXkMVz6e0d?=
 =?us-ascii?Q?8hj/wEmhilQdY5324wdNQkA9eCaVvlO29VW0lmLSWlq/poOWrHGWo1rXETSL?=
 =?us-ascii?Q?aztjw87UL735dAMWIte4P4iwbfYPV0GhgialRfCGtRP3u0dEta1pZnw6sRpI?=
 =?us-ascii?Q?oILnr/Nf8bQ479WQ6pE6t/ggLHyN2FRne+r4X1Me9NG773OZteFbyvNMK1G/?=
 =?us-ascii?Q?IvtogdTw3HsvNd7HQ7dc3N6c1inyf2ZrUCGrYZubrc58Dr9h8yh90vFPcsHI?=
 =?us-ascii?Q?p5ZN1sWbATQdlovVtaSObCiXsMLrAaO01/jQ2eWO2cU5HY9Ek12psyAJhDYW?=
 =?us-ascii?Q?qsALux+QU+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFsKx0YNSQNs+P0SmVpuWDzXrJwiTtc0Akm+ULrxUNuEgkOPVG5I5I4yqjDM?=
 =?us-ascii?Q?kFhenQmLYw4ex4v92zGibQN/pXIEGf5RVSMzRMIDWHuKBIz13nearrfyatsu?=
 =?us-ascii?Q?3rwmANXLfR8iyosqGPJE8MFQknKg7Nyx1TRa2qe5Nxrbgh7AUWgw7fc/3ROM?=
 =?us-ascii?Q?HxWGVODio3rYa03+haKG3IMZUjiGQCb8pi9reSWZGmRN96rgLiF3xVrwsOXa?=
 =?us-ascii?Q?lx9Net7WnB/7Im4lysIITDpba9cjQOWNeu/Uo/41awGPNLlCsTt3d8XvmPXJ?=
 =?us-ascii?Q?hFX13/cksL49QraxJm7CJZ9zXHxh+XPhZED7P4AwgzpLZGZNIo+GKmB60yLq?=
 =?us-ascii?Q?FsJpGv0HAyaPzS/PG+Spb+9bpEz4a3LT17lwZL/Qr0MGy5oJ2/yeuKk254Y3?=
 =?us-ascii?Q?E5dfKIGLFo8H0JK1ca4gHQSdpYHI+So9cR1zAvNcpT5qjXMDTRZsMcSsHs7A?=
 =?us-ascii?Q?uT7KWUYxPxSLsn9gF5edCzDRI89H/MixqZmkHkm3IHIIxIdZiCQcgO75T1Vp?=
 =?us-ascii?Q?KM+YutcjFEjrv9dd4Qqa6Mr1m/RLsi/v2vrhGY9DC8xcrxSfZVZm9IvNCp8K?=
 =?us-ascii?Q?kHCiSGgp41Vy1pStSSrXjaxmqW/CDaefDXd2Km+61pGnL68bDsAcwQz94bPL?=
 =?us-ascii?Q?8X/iPc5tyBVNgpV69o9+yI0sFVAMw4GhyOewmFbF7SR0lcIQWOXScPULNpDS?=
 =?us-ascii?Q?Xze9eHL7zxKdMpVKbLRM8NBhqEHLP/PMc1fR5DaGy2l/jlugkGdVCBA+NV5n?=
 =?us-ascii?Q?6zNQrla7dLJV6wdtA+aBG+CesiYvEX9kAnXyN/M0z4ZE99vQplVGhqxwbUNe?=
 =?us-ascii?Q?8KPtcK0h26if/jRI+siqX8Qkug/BpzqdWsjmy7JVyBmMgF1ZaPolBtbddwsF?=
 =?us-ascii?Q?O6Vv+gjAr5uZ8m5dt2U/SU8U7MVa9fhS073PbmGYeNF5PKVBfeoD1hsTL99N?=
 =?us-ascii?Q?3sevWaEif+HcD2/oh8MeXoXzmyxDzUh7riHVqDg8sUYr0+qLUdOZnf1V2MPf?=
 =?us-ascii?Q?7au9P/WN2z3lECMRHWgEnTCdGjF+o8F6IU6NWjseF23otudNTtf02egbfAQh?=
 =?us-ascii?Q?oAflabqZa+UfFRI/UC3srFghpQ4eBFqaEsN0g/adC4AeZnWTJOrtSrP19iKm?=
 =?us-ascii?Q?neRpsDBo+DRc2WklrXaPuS2N43XgA/6WfBxyZNIenOvP2fr6Z5C7NgQPiQeG?=
 =?us-ascii?Q?SFe66XD26zjuU+uDaXY7dUr1BKQxSqWT8/+XT3q7dtJW8JcGELAhgWcwG8ZV?=
 =?us-ascii?Q?Pgluw5ghMJT+4zrtpVos/dhnd0l88gfGKOmxXyYnnx+h1ulsNmuLe3x/0E+B?=
 =?us-ascii?Q?/2nNh7XX4hx5FLd4OETQHFBsOWqfd+HpAHwdaDBT8Up6uPdg11LfUPq+GIeR?=
 =?us-ascii?Q?+xtTfmRCugvqu7ud4pMglLB17Azvq2sRHsJFuBdC571T/qEuC/OIDl3tqm/V?=
 =?us-ascii?Q?TxcLFpv7xPIXyiOHfP4fRLBtk6hBScVhd7jyXjxZ77vEl99TFkzShh4zCoSA?=
 =?us-ascii?Q?HGj1+1xB63Jxy6DRVA0nNva/BUq+/okU3wdthm6e5hNU+YIw8p7/SqADPs9z?=
 =?us-ascii?Q?D8qQ2fFH60A+4ir36nwJkZHUa/pNgmwwQf2rFQ8eTE+0YWSxwA/AdBYcgJ3k?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23392400-02fb-440a-64c8-08ddc44104b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:16:09.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgySF+Uimx40mxuGtRGeG4BRkCkfcd26qJqwyy4Lek1eVpeE7x+bADUD48iXqmj41b/v8vPN/6GbHjvBxIhnvA==
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

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 123 +++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a2..636913782f983 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -125,6 +125,129 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&dcif {
+	status = "okay";
+};
+
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &lpi2c3 {
-- 
2.34.1

