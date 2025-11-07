Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D921C409BF
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE0B10E052;
	Fri,  7 Nov 2025 15:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MEq4rgTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320210E052
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxYgbaWsBffjhAKxZvEbIngCcQrCYzQisOsWVwQffPSIYMFGEz4wDztPXmzqka8YGx2AOktCNQ74qolDR6dAjzdXSNRjxXFvTQw8ehTmHAV0HnzLmxyV0YD6K/SwrhgANP4oPfZcs4PahDmwZvLmnzVYzTv50HMHXiZ9qcv+OMSQtkAfvFyuvvAWNnJnzPfXR8Vgz44WJMuqWuAZjRMpQlTs1di8DJODN677R2Y9hdD+aOL97MKz+6/uSO+pZiMFUfEvhsGFxQVhtrnzCq6YMs5r4p30r+CScyndB5QL805vKZXy3R+8W01ZIDiRD1iXcBIcX0nx8i232P+w1T05hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxdY7zx2Lcq6leZZ6u+7BHY3IvlcL6bHKJEGfWYK4jg=;
 b=PZbEEY9+9cKp6lMOZfcZ3XoYJDVlJgix95vxP5Z6IgCHh2Co97mTxTj017rg8eJCk3HxR3FiJS1Ry251QIe1bPb2yUwGA5HQeClELNl+NDaq4xdhZa9NPiL5zUYYEthWVigOeMNoCpj+NiiJl+hT2XuZSUGpBn38SeKN5RfAR62bRjbJdwtDn5RY8EbfPVArQ1fOb1bLAv+RP/PNHMFn3SIf4Pr/G3H6OrHPN8x+WFd/BlZJJjNVhpFG6CRqSycrJrrXtMzaOTbjentaYy1/2T9OpH+8CirK4iyDSABnLkseX9wo7KpT1CwYxQRTVXHZtZf17th09R0EO+sDcEQqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxdY7zx2Lcq6leZZ6u+7BHY3IvlcL6bHKJEGfWYK4jg=;
 b=MEq4rgTh7ppdfkph/GGngIGaJSFdJA0zGWiLwiXoTSojPZODhhql9etQY1QJgdKON0lYQIfoZDzMM8q4hHMwBP/hikUiaHmxDN0T/ZcB4c9JJCmLzmhgho6tN9Sn/ubx4FR0eUwUxItBp/GaPFRluQ7w8mUQ7kLFm+9YpNfGfZV7BlX3BzRb9tNfmHCp+Wt1XQG+V9rm0LVbqk2Z2BNYfmx9Z9+IW+8f+UWATU7LE7eh0+W09MVUiNNrKwDe7ksSL6SOyFuCLt3WupTQxeSM+qt4W0nNil9w3v9IhVW+Cj9r9+o4GYWi59gU7P3THSNMIA9U+Z8Ui1VPcW7eA38lpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU2PR04MB8678.eurprd04.prod.outlook.com (2603:10a6:10:2dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 15:35:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:35:14 +0000
Date: Fri, 7 Nov 2025 10:35:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 supporty
Message-ID: <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
X-ClientProxiedBy: PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::28) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU2PR04MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: b91d1534-99a9-46e3-485d-08de1e133ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|19092799006|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1jjV/zd1wp+BAG12hsPVj2OBns4xmWKmaVt1g3Gt359ntAe0femZq/VJApd4?=
 =?us-ascii?Q?3M/xFgCp0sj/ANlA5ljYlnnASKEkPRuy7krO1tsv8E/V9CCrgRwDjo+A6tSa?=
 =?us-ascii?Q?P9O4rI1PbfhS81I3sD+7MruyCGVtJa0Gxag8l/XQ6CdWx7xJzED/NBJhlM0+?=
 =?us-ascii?Q?zf1XqtGJlafp8o71XtipddFb9ed7UXMimzG0u9jR8TKG8J2KKD6l0jNP9TYO?=
 =?us-ascii?Q?zUAMgZXKNY7VpjPy+L/AXfDHWMiiLXXNcB2c2QFH+ize5xCePoyPdmOsXk8o?=
 =?us-ascii?Q?ed1tXzm0OcEZMdQutGLAayawAwoE2w/ug4jbG8asIZ1gMTfgJ6wfTb2QeRCi?=
 =?us-ascii?Q?t3L0tQNKRJbMi7OJD74/DwqKn4XWfFy+F+A9OziTuy0v8jCp/ANfsTL70tkt?=
 =?us-ascii?Q?pyFe/iQH1720syvGdN6SZDzzdPY6hQwcCMRZICz+sl44ORX5bYjuUj34m+1z?=
 =?us-ascii?Q?ERZQUiwS8orogXeMGHL7/1qrbpa7xshfpYHwvUcOTsHnmXtoAV4DQXego9Kk?=
 =?us-ascii?Q?uMB0iU7N4TIQxNx9E9mcvyaRAT/N385CrqIPX5O7CCzB7Ogow0Qb0kLU8NgJ?=
 =?us-ascii?Q?eedffQKohEkdtBvVA3iZ1DMyW2A5RK4GvKOCWS8FTG4jVL8R9nv9suZfEvdv?=
 =?us-ascii?Q?6aYJVuYBtLoEnheN51glabOvqqIxRb+IJP2x4IKhn16ItiPG1aTFN4ykNpow?=
 =?us-ascii?Q?Fy7nIOcJF/R8aU9w4d2xvd53LtY3oLKFNmnTJoya0bIZ7Xxm9xpQbdMcG4OL?=
 =?us-ascii?Q?A+nW8R8T5akr1upgU3iV4fUrvLdQW7ey34c7zOnQ9YyYzUjA9froqp78ER79?=
 =?us-ascii?Q?j067vlRkMYwm6/PJpPuiiKH+M6RGUeux1ycMD9fO5GrcfaDPHBLEb8fhM2oy?=
 =?us-ascii?Q?F1j22RgVtLYc7qut3j9NqT3ZLAwnKm8QX5r1+nmpgHnD5vlPjDRe/kP4ZOKk?=
 =?us-ascii?Q?KfZiXs59m4qe78uR21qEFp58FEPigxm6mqhrOpEq+He4YhuPMaXoffEURcyC?=
 =?us-ascii?Q?TRo9yrJpOY7cY9CRXDfJUXP5H13AwmKCAlkMdKV6QdSVHD5lM5Cz3OI1cyeg?=
 =?us-ascii?Q?biY0e+MV/vOIVZuiur1S8bjPEal5OjsX+Sa99kzXiu/0uDrkFEyKkPkw0JNT?=
 =?us-ascii?Q?HZoB4c7KCEdOpANGWIDyBsVunNbgq9vNmNzQpQKBsDFIeqD0GlEQtkQ05sTg?=
 =?us-ascii?Q?sl9nWXSCLFN/wI7nH/5Y4yr4Phg3Xqvo/usmQGlvwbidRrNE5EH+Oj0fW+I+?=
 =?us-ascii?Q?N9EtoBflIlLzka/HaUgFHz//kJPeDkQxflEC2dfOy3y8quE0BlNhJGr+TRPk?=
 =?us-ascii?Q?keljw0u0VDYlOE/XZfF5V1AY+GF9mhXvbrcLV3A4Z+Ci/P1cbD3IQC1MP3DP?=
 =?us-ascii?Q?ABXIvOZg24XXLA9ESol7a6WNCN7X+KxzYwojK+MMc4+enT3OemWKvIfa1RiO?=
 =?us-ascii?Q?so+LVVtQuOGFgMZ8WlRNijeXMOJXYxvnlYVpoQZBEjDmV7uOArHJVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(19092799006)(7416014)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5yHpDm0E3kp9MZG/kEvQw+ByFUWCnpD/SLJQ//+2YgJTIqooR4e5XByiR8f0?=
 =?us-ascii?Q?kHLyWFLgnW1HAnCQQbzuLBBlUSxgOLmBEyD8vnA8tYqa82KI9yf8X2enRVuz?=
 =?us-ascii?Q?oerS5upgt50mLwgnU+WJq7EEs/+AAPlpIgUaHB0zbUEmVeKXNTmT9bNcaaKX?=
 =?us-ascii?Q?XUIvS/039ZbBNLhd+jZiJmHU/34X+nzcN2Vk7jUFvGGX9P5Tnk9C0BrbAXY6?=
 =?us-ascii?Q?29MdPSbW50UoBfQtqThF0CvESzM3LuVVNgXiea8YwsJ1MRuWcWM8tu+B5Yje?=
 =?us-ascii?Q?mw7kQJfw0uWMnyyCeq1an26D6fM5zTn7NNc6cAe7jH5uxVsWXkgUcwj145oy?=
 =?us-ascii?Q?8VYhh+u5Fb9M7yu6X3jytR+XvBTC0G+Um6517WCWwoqpHE9eA6jq1rpI28Ki?=
 =?us-ascii?Q?k79t5YVCXWCYaLcbazvYfEJ0yFGzI48/oSRRCRcwNUIrI8yk90Gf8sLZChKw?=
 =?us-ascii?Q?B10vpF/gmz9APy9DAq04cNFgYRn32w6/FmWqhY0qsOqvwq/536jOlOaeQ8F5?=
 =?us-ascii?Q?Y/f8+RUaaWKOMq3obP1KcvGhHFl7DPlJMERqAunzUwXoUv4kTSbQma9at6pB?=
 =?us-ascii?Q?buSBLGs7gHYIgrORTD6Bs32DuvecxWxzSbxmqSak2zYidehtW0V0paMvRDfE?=
 =?us-ascii?Q?syaNiUkr0bPyhV/MGGUtltNj/LNNgqh+2mQ9YU1Fm2m1e0Jr22hhP2JEjSJJ?=
 =?us-ascii?Q?LLbBYmJNP96yKtB/KUkaNcQ1+HbTQbQZrgTP3ceMBWfq5O92rdgMB4AodEXg?=
 =?us-ascii?Q?SkGrnKnGuAIfgD4Y4lrYq/AYgl9UF5q4Bxrif11hiuz//Mb50UhG7zNm92ce?=
 =?us-ascii?Q?kuT3U7sTDmYXZm5OLxEtbYg09fbKZJ+91ehkqIPh46qbNJG/ytJZvom7+yGd?=
 =?us-ascii?Q?/JUmaN59PTbUvTsku1CZ2+8btpTUmEsZnnKdc38mhzBibEqNfJc/TIBmoa+5?=
 =?us-ascii?Q?RQ9YWeZjPazeM6csXLY7ZCada4QjX1KYPBy7YeTM3BDCDYu2dpX+grV6wFIH?=
 =?us-ascii?Q?0pdSJ20iWSCwxDGpk1LoRNne73S+iwxTjt90boa/3IzdP9ql3xC6VJAPlCbu?=
 =?us-ascii?Q?m4oMdC7FGx8yHgc7CCul+DwwM3xhg3B37cbaQKqE+A9J7egy50erFtjjBUZW?=
 =?us-ascii?Q?PBfktyyyw8qozfhJXeLUv62egX3AZ9fZNFNnCQEH74tP8dxySEotQO7jjkno?=
 =?us-ascii?Q?oimfbQhf4EwMKc69kayN9qVw2/jJ+bmTLbYl+Vdl7Yq1bpVuYuAK9X7ZWi1O?=
 =?us-ascii?Q?dW2DRtDNzBvYEdn1aeJl2E18tln2V5wldvLmnt0gDZp46KyoNqrUG7D7r/6m?=
 =?us-ascii?Q?GGGzJ6b/h2Yz+y5HtsDzIlQ4gXKI81r6uRKElcyiykGgLhYQbpU2yLacxjBb?=
 =?us-ascii?Q?tT+mP68vCy2ZQK5/IKU7JRKJHgSEYkOEDooSdP0dYlXLp5vOxa6YhfNVZA7W?=
 =?us-ascii?Q?Ny3o9dc5FMKCuqsKoQ4prSW3DRweSSfKdm/oT4mg/0oDgwBDfahf57kvxSKs?=
 =?us-ascii?Q?A8ex4sHsHg7VrjjIYzYOL0sSOzzhbxW86GZgXh1f7qf3bql3UdcbjLDxyXh1?=
 =?us-ascii?Q?YXmt/8cedWSyCDzQDImpAmuJAJWj/Ek0c2xN1rej?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91d1534-99a9-46e3-485d-08de1e133ec7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:35:14.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6FxjrVkt4O6LYxbvDIz+Bn6geZHK4ShUX47ySzRizXvGgtBO1c+xZe+d1NfnLaffJhHlda3znCkFn10eeG2Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8678
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

On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> ---
>
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 112 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..e83723224b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-supply:
> +    description: Regulator which controls the boost converter input rail.
> +
> +  pwms:
> +    maxItems: 1
> +
> +  maxim,iset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +    default: 11
> +    description:
> +      Value of the ISET field in the ISET register. This controls the current
> +      scale of the outputs, a higher number means more current.
> +
> +  led@0:
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +    $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        const: 0

If reg is const 0, why need use led@0?

Frank

> +
> +      led-sources:
> +        allOf:
> +          - minItems: 1
> +            maxItems: 4
> +            items:
> +              minimum: 0
> +              maximum: 3
> +            default: [0, 1, 2, 3]
> +
> +      default-brightness:
> +        minimum: 0
> +        maximum: 100
> +        default: 50
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        backlight@6f {
> +            compatible = "maxim,max25014";
> +            reg = <0x6f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +
> +            led@0 {
> +                reg = <0>;
> +                led-sources = <0 1 2 3>;
> +                default-brightness = <50>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..606ce086f758 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
>  F:	include/uapi/linux/max2175.h
>
> +MAX25014 BACKLIGHT DRIVER
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> +
>  MAX31335 RTC DRIVER
>  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>  L:	linux-rtc@vger.kernel.org
>
> --
> 2.51.2
>
>
