Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3EB07D63
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 21:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588010E107;
	Wed, 16 Jul 2025 19:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b6+g8NlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941E410E107
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 19:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwv89xUJ/xoGL/H5Gf07ugfJwqgdvGo0VqWa/BPVQIrJAo7Na7rEq3issWtPOoL0ZmJu30pNRMbZyLaJenvXpJZgiJZ9wzppU+B/FfRw2FZzCuaIJD8Aq8Kaz8sxLRDBk8Y2Ah/2Ri+dHQTg5ZYIKalJbgOchwJgVxFY6eTykiRviOqYdUvYrQhcTHuVKicPTjTnF/jKQsdoMOiWOXkzWZv6MN+J0AyHR1h2X6jqZqv+cqCLhNHjfZTPmQTXIkJrE29WBxFUx6FCqtT+5SGaPTb0eN1q4X8gDduBvZsKuPyXAJFJUAk1Q7OrDlv0Hhc8APk9FnwXmRWdHZkSo/PH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCt64gnOUhcJeaHkttc14bicUHRNBRsAw96kmQqi3xE=;
 b=GTWX8eCzGNI1GqyCRjjQB0PzlBZ3U5+hWZE+MlbBBdgRs0+Mn0DDG4NNIZC/1H9C4UWKV5XMSjiQLUN2f4LB6wjsc7sxSOb6sAdQSkKLhSb7hCDdRoio+sJlOEQkdDjTlazCSOdbkgcN+aQp63gJqj3fMCXQaPVAkpb3I77vCBgsgSUwxZKWtehFI/7HeuescZtTDRi3zvvKCh6DlBEom5gACJL2FKdGYudVX5YgZW7/14zHxUHKWM9RPRrI3KZnlaMF2fNqbZa2jKODuci3mLWlwdbAx4aWdsFEJrBUsinfL+Qfd3UqmNxxI5d7uY8ID9yQxdbXXYZ3e2YcexJBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCt64gnOUhcJeaHkttc14bicUHRNBRsAw96kmQqi3xE=;
 b=b6+g8NlJZ3N0YgWbi4HAORWYHbWyIY5mO/rQV4GZKo6Nd4dTPPPey1GW/g4bGLtAaFt21Fs9/be4EHtbMK/JVAxcKyoN3rk6Aep/EvyQeNLH6v5piJwx8mN/1VUAgw2zmnX92uhqQKKGzTltXYz0JLn+EkiPovrGzIZ95tQrw3iX4o2v/WtfaduGqIaOsOVPAZx/j1f/oVfQUgwfXQean16XFlZheXGl79z9Rzu+z0XAjZfmcssnNd6jkpshJ7bbMWPh6IIs9WHN/ollSksLo/8JIlwDt2++K3zBNlyDz1ZnwgjJaZUBKsoXdFkm0jwmQnT8j559VjDWrkBC8WvFqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 16 Jul
 2025 19:10:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:10:07 +0000
Date: Wed, 16 Jul 2025 15:10:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: imx943-evk: Add display support
 using IT6263
Message-ID: <aHf5CisGvyHLWy3Y@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-10-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-10-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AS4P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: c602fdd9-475a-4804-5372-08ddc49c606c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N6CuurHa48HIqaf2X3EejId0cQIqNGTkOS9xHkqWjs6gDApRRL5ZqUVaan0V?=
 =?us-ascii?Q?+gh+b9lgtCBQeC2VRSg/PQy3yPX9y+EPlI7c6ukL7bxNP3fKcxX6ELqs68xK?=
 =?us-ascii?Q?nyGQTo7idy8ltwZE4USayn22Y2Q7BhQtB/3l3uK2kQefe+XREj1ovI+ewZ2f?=
 =?us-ascii?Q?JPwO9SiBZrTzbsgxkgICTSQ53eS8hQWmX0OioPf0Og9s27Xqf1wMnLGrLkuo?=
 =?us-ascii?Q?3qjx10C0q7G8s0GnjctDP9Iv11iWmFHoVsuE3Pbf2/yPjhcnmkgrj8DONARG?=
 =?us-ascii?Q?6lKSc+AJoJVMSUcP7XCRmAgtwTv07T2hzh+aH7OMshEaV7wDhZF4RnwYQZzM?=
 =?us-ascii?Q?UCYBShMhYfh8vQt9IRrBBoe2lEbH8JT2nKwhLF6oUp81eMWUPdL4PIwul1Pd?=
 =?us-ascii?Q?2MicA1PFmoDdPolLf3EH5kJQcujAA/JvU0WHqYJHuUffByOUckcEhgsNiW2E?=
 =?us-ascii?Q?f4d3PR1G96vSUXzO5YOpwQiz6F9b23AsmX+YQejVRi9KVDlkzUhLBsT4KIVI?=
 =?us-ascii?Q?nC4m8D0J7ZQQDHYvb8pIRqETpPERMQ1eBGh1oykLzR4YPryeJB+t4CO21uv7?=
 =?us-ascii?Q?4zDJxuns9YfnrbMnB0l4vaw77RDzkBiVMFwn2c+onw8AsqtOMHwlRGJ3lOKf?=
 =?us-ascii?Q?s9Ucqsj7Z3BZ4JQ4ZwxkbM510a55as7hOFtQAdGHuyZZAOYfqcM90hvHq6pU?=
 =?us-ascii?Q?jzTADuodNQ5JHnXF12+EV4yAgcrKTyfbk/9xsjnFipju1RVUj3ZV2kCtyXEt?=
 =?us-ascii?Q?fDneAs1tvyyk5G4q+Spqw4dH25qQG+ky/Ma09pxNZNOTGxSo7s41r2HOUC9p?=
 =?us-ascii?Q?5zcFb/y4sZOeLcOOTIFf8mWmAB9jtEQu9tZDZAja7q0tyVH7GjM7xHyap/ys?=
 =?us-ascii?Q?Em+raIWLEEIF/AxDKwCxHXcG6UBzavmCkllfEMpyqKdXpXOuhi4uhsBLdHSt?=
 =?us-ascii?Q?uLvuhaQsSf6h3uWIUEPW9VsdXDhPhayhQVgv2JHVvk2ZysgNNR6E9DihliwG?=
 =?us-ascii?Q?t0aBwTh3cRSMDu2CliSyx/p20vicEMzQ63/8jh1yyb+afQJyB5z6rNesKuRP?=
 =?us-ascii?Q?Sx3f2qDr+UAefWbabr4BXzs32Udz1u2WioDsSYsaTj26aBpvchNH+1um9ns0?=
 =?us-ascii?Q?4axMqG2M6T5DbcfKF1zuDnBGq5ec5X6zZzhWnB3cQjl5SqkIyAVBVgEQ+kAm?=
 =?us-ascii?Q?gsJxR1vHjC82Ldi6yHR90XSSj17oJaoRDB8KY80g+olxMl/LFIVwQ1AtcQw5?=
 =?us-ascii?Q?h+x58DNvdcr9YB8ocwNqPNYQNML4iyV6VlOeup9qkLI53Z1atD/Q11Og8pjp?=
 =?us-ascii?Q?ss9l94XjKGGqUQYKzEvt7z6Elljwp85vEcbZ2kYYUgekIGa5DNczbRztiyBQ?=
 =?us-ascii?Q?BaWc1dOjqvEf0PmEKhqX3hUhI3R07JBd8WUNwq9WHbigSZtuTgzJoqr+qRxA?=
 =?us-ascii?Q?jHm5uLFJAaxBV1urltgYVcINwW4kQIhXGyKF0qsGyUwVtfawKWXo5ryeeOYT?=
 =?us-ascii?Q?/Dr2lrTuORn9NzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oHTLN65hxqyQgkeiPgSQD6EMcMfzA+JCKChd/fKwkdzxSbCV5D5P8Ax3IkLv?=
 =?us-ascii?Q?CqkSeXg95U1gHOZNnhNwSnVYbqNXmHpUxxVCBrXch+3QofbtsTuDh3s/ln4f?=
 =?us-ascii?Q?eMjfwHH9M6ThAQgR9rxkWd5ZEOXBRd5VCgX7m2ilDoWnbBqdf63QYP1cwVoq?=
 =?us-ascii?Q?tGktXhUJwqzRH1LWlUfj7YbWz0dtJ1xZ6OTFDTEH8DT7JYEqRePAL4BmxzGQ?=
 =?us-ascii?Q?QiTo27b5xw+lDgW8UjavNEhH9ySWQAnot5/zMP7HfUSGIJziSBFwGOcoQ1x6?=
 =?us-ascii?Q?wauHWd0Kp1Agq+MaX23s9FMFkjhoA2SE95BxDw8IRBh1CDvzjtPD1f/xoQNG?=
 =?us-ascii?Q?kkN71gkawKvY0EDowtWIIDExK+GACNFQJ7yqMYCPdZsB4Sh7l3Kga4VvJGs4?=
 =?us-ascii?Q?sXXd1WAjlz+LaNXcoLSpWHUI1c+Lmw6FA9O/W+Zo1kB5iuJTxLAtGeiF7T3W?=
 =?us-ascii?Q?9/+NgDTpknEnnc2Bc+YrjzFKM7j5Ibrgnpn7umx0l3ygxXpyNRXA3k2wBZAn?=
 =?us-ascii?Q?Iklvjlod0nA0b4U7SxOB89N3fxrHoh0Gs+/qSM1eQqZ/t0AoGjP/aY09cvrr?=
 =?us-ascii?Q?lMyIzkS9x+QID7u5WpBRyIwU9YAtvgpoi8HeoZt8pHlLgwLuk+QXb0ZwdCnZ?=
 =?us-ascii?Q?trACtSUTWnwk0fsFTsMlJ6tPWx+EuQRskjVaJ89OFnFY+Em5jbMyEJBHmrg8?=
 =?us-ascii?Q?WEFC4wQlasDujZI/N+kr+qtkLYB+rWRZORK3O7cRJeNT9TVs4qNshwETmosS?=
 =?us-ascii?Q?dbzRzi66XTSSBbrxGooVM3XNCSw2rxthol7SI3K860s4+U4Vsx2/VvrBfwMY?=
 =?us-ascii?Q?xPzagqgVsYXX6qfUNqJyLDblvzMeOpFDPrIdkazSp4ieGlZRRY6Rz7crCLbZ?=
 =?us-ascii?Q?Eh9hQgA0haDp7oDmithRSKXFYa8DuFrkuGkBJtRXjUBDLlJNOBxZb77gwSh9?=
 =?us-ascii?Q?V2htsboRGeqscX2QzyIAtzfwmPyo08mB06RznAo7DYFjXLig8wLN3BhfDzp2?=
 =?us-ascii?Q?ifZZjU2HwbtmDw5JBCsajydB2KakgoAiJ4lpEdKqO/jbDgGSwh8kjPf+ACX1?=
 =?us-ascii?Q?cSE8e33Bsv9BdfJXuC78hdjY36mLQ0EsmblIk2dOdzpFuxeB1WpmFVpwLcn9?=
 =?us-ascii?Q?EqRmLGth81QI+O9dFBcKFUCOIrOnZQ2/dhcQ72brF7k7xngkh6l17N7yjKSD?=
 =?us-ascii?Q?IbltlxRyHEk5dOgZxcPjSjIhI4Y08Mu/bEQzFt+zo1sZmFfb3xH4U6sO5cTX?=
 =?us-ascii?Q?PRKRHxeMYwrVtaFbugNUJYEaWzJieSMlb7fLRcM9bsRPBjnRwP0t/lXYtCr7?=
 =?us-ascii?Q?5HfGKlKIT/ank+dVcytCXKxQ76kShlEZzyLyB6OKzkC7BN2GD2teGno60OXs?=
 =?us-ascii?Q?36+6INBbWxiaFW2qtPm1oEiki4GkDIRXdR2xL6pKRA/2S9rpINN79VSAPDzh?=
 =?us-ascii?Q?Ug4/dWBr255DQgFySIzm6hjLvNy2wtIYxYaFIX48RPkRWta1ghVPJuRqdfbn?=
 =?us-ascii?Q?BGA44WCLU5vSm6+x+JNf3p3n5MJAPkCVlDFoNbc/Quk87wd6SYmRhmHEmJoF?=
 =?us-ascii?Q?wP6/GBAhefHZKIAcz+11IWPnN6looZlhcUnzdSUe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c602fdd9-475a-4804-5372-08ddc49c606c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:10:07.3396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLWlLdig+L4KVyXHP7r3s+EUDqhixzESStdPYKu5ysocYyXN/JP2hlUpMZyAsAQ/czM5tgaZ4M3LY/LsypVO7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564
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

On Wed, Jul 16, 2025 at 11:15:13AM +0300, Laurentiu Palcu wrote:
> The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
> i.MX943 EVK board LVDS port using the mini-SAS connector.

Generally, attached devices should be overlay file. You'd better mention
it is default configuration for shipped EVK board in commit message.

>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 123 +++++++++++++++++++
>  1 file changed, 123 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8c3eff9df1a2..636913782f983 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -125,6 +125,129 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
>  	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&it6263_out>;
> +			};
> +		};
> +	};

Please run https://github.com/lznuaa/dt-format to keep all node correct
orderred i.mx943's dts file already keep order when upstream.

I remember hdmi-connector should before memory@80000000.

> +};
> +
> +&dcif {
> +	status = "okay";
> +};
> +
> +&ldb {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
> +			  <&scmi_clk IMX94_CLK_LDBPLL>;
> +	assigned-clock-rates = <4158000000>, <1039500000>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;

reg = <1> already set in dtsi file. So needn't set again.

Frank
> +
> +			lvds_out: endpoint {
> +				remote-endpoint = <&it6263_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pca9548_i2c3: i2c-mux@77 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lvds-to-hdmi-bridge@4c {
> +				compatible = "ite,it6263";
> +				reg = <0x4c>;
> +				data-mapping = "jeida-24";
> +				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						it6263_in: endpoint {
> +							remote-endpoint = <&lvds_out>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						it6263_out: endpoint {
> +							remote-endpoint = <&hdmi_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
>  };
>
>  &lpi2c3 {
> --
> 2.34.1
>
