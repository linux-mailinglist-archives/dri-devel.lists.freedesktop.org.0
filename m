Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C1B537D8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D3C10EB65;
	Thu, 11 Sep 2025 15:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="grSNvzO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013025.outbound.protection.outlook.com
 [52.101.83.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41EC10EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dY1AMpHeer22VPlJLf9Z+NJH3X0mGzmy6Z8gMuHau7tf/DivX9lnHFVfzkkmJr1/XU6eHIfWvenWUjcR7BIxVs69V7i+g6KAp3/aUAXcrspVgQEi3b9gCQwmoj0OXWRkmeZDGMUdNrD463xJB7OBnCWzITs+nMy+Hbvx3y3O/Yzr7h7FqHDitBuHp6ck+hX5ndjbL/YMAUJSXy1FYW+kMHFY0VQayZ+5Sjz00MfYA5TYwqRr82xq2wLz/8tl8dcYHXB1PIVc/Y0kQuR/VawZiAXsPhrbADz9x0rNAwxPmXBtmRlI7wbUkXIVj5nQYxFMfP9iZ7ay4cI5C86a2cwfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RgLBtN3sRfkPITUm64i+LaugDFtb9iMnZS2ZrSAQFc=;
 b=RoeNv8MgWFcLsyQI3vyq5N/NVi3l+Bfmo+Rfpux+f8xSJPzbUmEed5XqNx7/4PKpProkxgfQYc76VPcAmZu9Kq+kPdgFNtNW/b+N/Q4mo8tLK7g9NP+Gp/y+9XnBLVoyxz1Skn7HyQ3oDV71Sh+/a4NtoOtnhK8LCSdvgM0qVfCv6xTIYlExQpbCRFSmImRszDxhQHHEWvUHVSnCXp37y6Q2ZqnE2tM5wa0s2Szs2xT4Jsf9znyKWEGViLcA7Mff0GbSz9YI0Xb/Jns9oVDqh7kiVLxBLCxZIK294ve9B7ylk8fSLMxwDJM6Vpa+o3oZuWoyP5nSBz+7mIXfggfyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RgLBtN3sRfkPITUm64i+LaugDFtb9iMnZS2ZrSAQFc=;
 b=grSNvzO9DfVHfdR9mjvrZpfFFaXt626r+DSx76tqBlDjUA7xXpZ5tqFUXxJsqUIzd0xL0bhkz9Zgmp7pyXaIz+3FUQyu0bmlRISR9da72zDiURYWzZhrXFmETdANBRWrIa76dGKGjAKejJq3aepigvFW9EjiVlfcqCuAFhiaAyJLromLIsMpqUWdkrT4qwhTbXmCru3G3oJzscyBeNXpRQTE52YuGyatAR/hxsbgbAH0M5DidCxZWGZA3+NGrP3OZ6N9ILznjwJ7qgji0eBUpPu3KP+bekWNx79cp5XHn7k1ZZacXLn9EmrdhZEg3GzKGk8jRvnEhexRpc7flh9RWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM9PR04MB7683.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Thu, 11 Sep
 2025 15:33:11 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.015; Thu, 11 Sep 2025
 15:33:11 +0000
Date: Thu, 11 Sep 2025 11:33:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: backlight: Add max25014 bindingsy
Message-ID: <aMLrrcBZ2Kc4o84t@lizhi-Precision-Tower-5810>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM9PR04MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: b57b0f05-acd4-4a4a-bdb1-08ddf14883ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KIs6+beJRD9HGC9ssqaUPnmkoisC2ZYnJeYrcwcyeyQQhb76fZWEULB7C450?=
 =?us-ascii?Q?5VALxjkYxhvpMHpjyogrPdWBLFuUQnSLy00LCmL1GdW0hiZlUp7+RDXXF7cv?=
 =?us-ascii?Q?XnCQcldHO+lGziXAmSCu92KgyvkY8A5/NYXwY5ffynR+45bqIJjPK/2Hm69B?=
 =?us-ascii?Q?7I86F4LPTN0cMs7pUMxvmcbcNQjyofVRJbNoU4S2P55g8BXAiJBSF9lZ9r4P?=
 =?us-ascii?Q?K82qwP7+WkfclBSF1YUHzPtHUSalSbMTSPnWOvMXabZDGQTm07bIS20aNflW?=
 =?us-ascii?Q?T9F8avieFd4PdqRaDVoMMDYKPd/+3qEo8ClBNo7ykhSxk850d+01faTCOqdI?=
 =?us-ascii?Q?rckADyu13+flRreqsC90vHGmSoR4qvLxFdsBUqBJTqGDftygOWgbEWzYTTOs?=
 =?us-ascii?Q?Axz/MlDUYVmh59owEHUFkeR7bP+cs9G2VJjjjVUZ+xEhFgdE9P9ghafJ0ACw?=
 =?us-ascii?Q?fikY+x4XJQHwCpSoq1Vb7agYAY5PjEfGyyL8+bICZ64458bmamDnAB3HScv1?=
 =?us-ascii?Q?J1h2n0xPupdZU+aR2dcDa6pGGTgqOVK4liDwoYyh20B8dKle5fhmy5f9Qxzf?=
 =?us-ascii?Q?LOOg3KjEQsFdDlanELFKhjALplIufgwTFAoWpMEtd35GIQ2eqa6qq/eGslrP?=
 =?us-ascii?Q?CxkOYUfCc0ZQUeH2YRM9juIWy2P+QQ4D2+uShZqq6IpDYKsO1qAN51otUMQ3?=
 =?us-ascii?Q?q3J7g8HVvBvTcJArp6HhuS+hVLatQ6ocej7ZmL4uc5ky6RC4e63lmqm48Jd4?=
 =?us-ascii?Q?kskHRfSPOOIO57Qbnju9spfnaTbNIOXKwW/8rfgDOPsxLFO6tCjrpynxMi1P?=
 =?us-ascii?Q?9YV2pfPISCjXBVXvWFvWFv+4iCAhZLQIWEL0Be9IEDQ5sGg+ILa7SedkhCVH?=
 =?us-ascii?Q?HL8ldWq+t/GJpmMxg8rXWvhLN/WCHGpVAX9umwlEnglwe24OpF9LoEmDEN4I?=
 =?us-ascii?Q?/U96Od+Lc+YE8xJrV5kesLliJbR6Wxl4oGIOTQRdM9H6lt3ZREh37F7jnC2R?=
 =?us-ascii?Q?gLpAZwa6ScuWTyItdTQh+dgZkjekBBnNnHQL24s1LMfbeUjWHj+mBB1GUQmG?=
 =?us-ascii?Q?QEECt7lp4DMEAJU8OylRudnt6QDYMSUdDfLC4NCfsUnvmkYDQk3uEPLeOs40?=
 =?us-ascii?Q?dMLycklB8+2u4iCqQ7gxgGuyHRVbtrtUa3b5LicnwNPimMBZO8QqL7UTWRm5?=
 =?us-ascii?Q?BEDHO/44eSMEOrKv5JQUmeD1JtTkQek5X2hISvrSkmaDd1IAqHMRbAEHEHWc?=
 =?us-ascii?Q?qjq7iFE26nj8/oE20OXeWgmxRQJecg+U3c1see3WaTPjaMZtI/wkBFkd558C?=
 =?us-ascii?Q?mxptlqFDZQercbDoE6jvOOUzGI9WIzhisXr3o8mdxk5PbIykTYU+QGmPOK+h?=
 =?us-ascii?Q?oeUY1gG7k3VsnFfJmTT5pzLhz6LglVOxL6dftK0Cp+EzROPzmf6OrDsD4lnM?=
 =?us-ascii?Q?f2ItyQL0a/jJzi0slE5fzgcOaPOEXfoz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMMJrKWjImre4LXksBVuqs3VdRtdoFSyrScbOL6LcPmRCKmADBX9wsLNMpT1?=
 =?us-ascii?Q?UhfKJc6yho2rJJG9Uq4sWL6KpSwUZmdObZP+153XRS3v0dRh3OIVrySZ19jU?=
 =?us-ascii?Q?xQrRiTC/+i5e78Xs9BunA6oLWpOMeqX/HgnZuiRX61pFJHK+2fPCd/4hpxqj?=
 =?us-ascii?Q?jVvjitnh+SN2bObM495nLwl5Lgz6Hycb2OeDP9JPJsfQMecngzft/u/HbmYu?=
 =?us-ascii?Q?YmQOBcdSONZBqzPn4fWvFxPsHoKh+vK/7yhb3FIQlqNUHvv/rrkOKSJhAl8A?=
 =?us-ascii?Q?Ivs5AMxfyM/8hYPnMtM8YP7R7yopyOPAY6KPtlJG4rJbFQT0OlXOYFgpPkox?=
 =?us-ascii?Q?nyYzDnM5tIrko+Vj3s568JVi3NeKD0je5FTNnfp0FhZ75vyCG5ronvg0Bb8b?=
 =?us-ascii?Q?We1SLzSvcPNe5NgtHb2qtaVTMayC9MaiCok7H82xQF7A+j2udnE/WauS9gw5?=
 =?us-ascii?Q?2PinEpO+T3vCAWwpkwHQ3xgPNEdjUYe+doE50nfVyKzDcQ5xuD2GYTMVTMVN?=
 =?us-ascii?Q?GHMz/w/5nAmd+DTvedN3IYMyxmAmA5NngYUdPx19BIRAYhx8xktyJABOuCO5?=
 =?us-ascii?Q?TFe1G5l/9fCcSJ6NjhAGKeSoqNEp8nd+Pyq8eDtQvKth99xBRxsqLPh6xioA?=
 =?us-ascii?Q?kAppvnepUPq2nCbkcCCnM/G/iZyDVNHXY1VSyIoNat+C2BLI8FAK1exMAf2u?=
 =?us-ascii?Q?05uVpz4axa+H2qpVVQwlTy3kxGIQ5cBzQpFx0JZuMM8VE2c0X/iBPeIa+XB2?=
 =?us-ascii?Q?VGeaOVkC2/kH6gYLmUKFat4UEwb4g8OaUh0HG5uGTpqMuhkqVlkZVo1VpwJ7?=
 =?us-ascii?Q?KcIs6OVlZCWUmsa3heKWpm0tRD+vWxW6qbeNv9hCWnyPQDxnlIqzK7tcgWQw?=
 =?us-ascii?Q?82fKCXZY18lrF/KJfusd6E4gO00KcMjoAS4mA9iTCa6nDy+xGHCfif30zoiT?=
 =?us-ascii?Q?JE/xRqwnDbrrkMFW9NE0wXaJTdJwZYdD7vSeEIWDqsYS3w6PvPHFio2pn8O/?=
 =?us-ascii?Q?AwqIx0Uwn7pFB11xKAg4Saizk6oBqTlGB10aoqreRTLxGSizgnCulK64cdEW?=
 =?us-ascii?Q?CQbZs5yN4WqD7dRW7WvYJgn1MTXgflbSY4T8oiwPbj/9YzNkl4TVi8cIMSTi?=
 =?us-ascii?Q?cULUvw6M3Af9yf0f1nh0aV1d5hg2KgIZULfXyTbxohLt51Apy9LeMvIRPfAy?=
 =?us-ascii?Q?xfXwNFKYGMUMN8zixk1lNEh4oJjXeYql2+/LBWbdguPrxVKvKAsEqeaoTvJO?=
 =?us-ascii?Q?6E7c48m0uH+PsVMDDuzrdsLa+FVKUD1M3L6ffI66ULTijGJdEHJ78fqP4NNe?=
 =?us-ascii?Q?QIVRei1Fpq92e9535ES8odO7atVJIyHj2+mP7T98JoMuqmscU4R8BUFEWygz?=
 =?us-ascii?Q?2nLOjt0vkQuh0bRBDOSbPRZyrDNgp9ztOUzTPTAnG7gE4PYNtaxyOmlZhGP6?=
 =?us-ascii?Q?ky69asZuMYCpo3W+1rieeoOxVJlIh2k38snr/sk79s3Yy+opQ1aCJq6RDIw5?=
 =?us-ascii?Q?IVn5pQocHqo8x3tTU0PhE85XWwoaYx0er2+Hu/DiL2SdMz8ieLTnj0j8PItl?=
 =?us-ascii?Q?x6qvENjzI5j+bHavHH3gtMEBqUgeTumqYkFe5FVm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b0f05-acd4-4a4a-bdb1-08ddf14883ef
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:33:11.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm757OXnCdk9J6E/IVVxVQVZIiWCCFDWEcFFlXQ2triXGdQa8sUJW4bh0wWUwIdbgBI1zmxlU/MZXmvXGciEpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683
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

On Thu, Sep 11, 2025 at 09:53:18AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 86 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e113a2ad16aa74f982b9c2ea80578aed2d9424fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,81 @@
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
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
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
> +      Value of the ISET register field. This controls the current scale of the
> +      outputs, a higher number means more current.

Use standard unit. Do not use register value directly.

> +
> +  maxim,strings:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      A 4-bit bitfield that describes which led strings to turn on.
> +    minItems: 4
> +    maxItems: 4
> +    items:
> +      maximum: 1

led should have standard interface.

check  Documentation/devicetree/bindings/leds/common.yaml

Frank

> +
> +required:
> +  - compatible
> +  - reg
> +  - maxim,strings
> +
> +unevaluatedProperties: false
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
> +            default-brightness = <50>;
> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +            power-supply = <&reg_backlight>;
> +            pwms = <&pwm1>;
> +            maxim,iset = <7>;
> +            maxim,strings = <1 1 1 1>;
> +        };
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b7396ed28a700a2aab318553ce8ba1788312bff..5a592eefbe7562734aada05ab9e3aea8cee010e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15069,6 +15069,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
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
> 2.51.0
>
>
