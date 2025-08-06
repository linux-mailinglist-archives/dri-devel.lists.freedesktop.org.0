Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0192CB1C8B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093FC10E7A1;
	Wed,  6 Aug 2025 15:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JyCSyr2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011053.outbound.protection.outlook.com
 [40.107.130.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341A10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyQojvUFHTKBEV8PxArGBGlvci842/ks6f7DkGd7HwgE1MXEPjnVHmbTUoCiNdryzy7BcInHwK5leaC+ny570/js6I4Ch/uMvZBDlDVC4ZlIMDwA0X77DMbOSD2Bt1D4hsfQgFVBUQRH1y4CvPjXV0sHXi0UbejjhRdeGxa9ZfZuQbz9y7AovjVqu2tdi1kig9h+t8xlzl3LYV/fXqLJVQl3nVyI+u4gVh8x5fyevcWs0kEoXQQNnI4Q5M185a1TMI8Rt91f3yTlDzxupGlWyL3IqXaYpwWd1Tjggeb3EP8Li6XUQUvX02FEfdqoyZ8sbTET7NdqDf8xzcz/rYTJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGzATCLvCt/zpmTc+0dopRKmTJVKC1CuChhcgkKmqY0=;
 b=dKwdSLmnAQsqak7bsC6PCJlUJMwR4DNQmoBoF3C7bpaL4+w8hROY1DcSw4IgTgn7Kovv2kjFd0lbBG4Qslh7vnLmwu4yETr0+d77BxE4yZr9YHdOIL+WNGJMPH1ClEMyW2jysIIVDOvVFYyzb469rP1/hT3a/4ENOCfA7jVD0XCUMsBc9HdgQYSFdHYuOhGyqSW/zPCSMQbx41FZn49ixoOswC3D4O2n0+NVoPEQEhQHi3JS3IsJKLeaNcQK+jAKF/PqmMC/zeM05Fz7KMAGRcthsboJalaxIqpGDQP8KbKXcPEbbTPon004jaA86Ot/q6iJ16t1I9yvti6CIHAeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGzATCLvCt/zpmTc+0dopRKmTJVKC1CuChhcgkKmqY0=;
 b=JyCSyr2ufbWx9sux/yWkt2ReN7fkEX1KnEQxNIhU3iixMULZ/nSYrWaAzJuoJJKn2yL/A+WZga24yf21gZ75wP09TTpewc7zgi+osyHa1sLB+lIIZ0VWKBIL0jtRHBV+laUzCpDioWQT2o9TXOTc/yxKHjIkyDlaBldI/Dq44AG1wpbMO/ir7CKhI6Dl7GUjVVC7AFy+0nHziGmX/BLwme+QhdVt7sK5DgKrCV6/kFqrNGF/OyHTsa9uSN3Xff0SA+wf3/+LtoqPQ/yx8+G1o+GxyWJIbmO1PgytngVkYDXUZxG7KCnXp8+SR5vWfGd3qI5fKqa05S7BNMYnjiE2Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8865.eurprd04.prod.outlook.com (2603:10a6:20b:42c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Wed, 6 Aug
 2025 15:27:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:27:54 +0000
Date: Wed, 6 Aug 2025 11:27:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: display: imx: Add bindings for
 i.MX94 DCIF
Message-ID: <aJN0cI+VEXjI8zPC@lizhi-Precision-Tower-5810>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-5-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-5-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fb66dc-6105-4108-71b2-08ddd4fdd088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T6ctYLMaRujhyxuKLb8Bi+zGL0XxY869vgK0Tsfxe75Pvh5e6Ogiv0bS1CIe?=
 =?us-ascii?Q?2aanTRE96/nh32heH9jcOXCFaPxfuOoubSJ63t1+GfSzHBHsMSbjj0xBEI66?=
 =?us-ascii?Q?S7H+25/7KKM5c78RyeAhyAz+96vbcPjseF2sN3vFuKdk1AbT5hiJz8//TGDn?=
 =?us-ascii?Q?mk3HFO8FH4tjMhK1qo179ZFYUvkfHW/gFnJc6uOEw2Poney/qESQYgGW5fLX?=
 =?us-ascii?Q?rZ+jDAIeAv+OPy50izTiA2EKkzw5KuJpYzPCF32g2o/mHwLFZ70wHrSYZ4Ut?=
 =?us-ascii?Q?C4SldN3YIsCz5dBmiNgjyayFNGNgvcC3Go17kWSqE2naTyQtkGKwBkCishws?=
 =?us-ascii?Q?EWsFmhKjlq+Ef2BtV6mtQ6YDHdzvWG6gbMyMeVLD5Mkry6nsvrGwqTVRy3Qe?=
 =?us-ascii?Q?W0Hvbw3IQOpn01p7XGIIMdB5DlXcZ4Ga7IvkGOpaf64At1InugUQpLazG2TI?=
 =?us-ascii?Q?EsMJa6krl+kQxWrV2OwdrOSwBVTFPgdfl2coRmyo9woSCNGrfPh8q8ItdeR5?=
 =?us-ascii?Q?tgTMMX7zK1gucTmip8YAoR2fAb5xHe0yZt324YTLPF+q3ExmUOwKD7Vd3p4s?=
 =?us-ascii?Q?PdGusAxJbj4B5rMjn3vrGOqIYzQDZO1gyIoFmUetGzGHRPi8chOUTLa3peVg?=
 =?us-ascii?Q?hZbGdJA6DdGoDJuI1N0pIBsVQauEoIXyPdkCm4AbOG3477DrQ7j47L5fWISG?=
 =?us-ascii?Q?tY9A1OG+XRZiguVyFXsJFwTGgZ42mxmN+i48uzeAAjKVbsyWr3nUNIl1D9eY?=
 =?us-ascii?Q?6T/EQeYyQdHr41lI+feBb+UPG2oVRFVAu5uFyVZCd9jEJvECy4ktZZMckjbi?=
 =?us-ascii?Q?tPrlPsVSwnJRhSnkOeauTBwxQOu4i6KCeBfDi8nMO3Z/jPwUBb0EJUBaP3Iu?=
 =?us-ascii?Q?yyoYRBxRA3rWYhZF7H1FvYpzfDx9USXXSYg7J8pcGLgQpOnwhkrShQIuP5p8?=
 =?us-ascii?Q?k9LZ0OvBymWVGyEzpSpcGS54FXxb2vMzIasn2juLIppSOVzgoTMtsgAeDK9h?=
 =?us-ascii?Q?DQhID45TCbvBCF+FTSvdoQFT/sWcYw9tOpThZ6qkVyTB0trNrDMecZAD3DML?=
 =?us-ascii?Q?9vo8sEh2GSLRGZLUgC8WywGE43XcEmbPKp9oPt9B7SPUS8K6WTAfMpgoZXOl?=
 =?us-ascii?Q?tc0DeGk5jQbnCy7gQ0MkYKZ8IOC//A6/28BKq8wlQbnQEBJg0pFD/nbDpmLk?=
 =?us-ascii?Q?pe9KRgPz4zUXkEsQIxflo0O7ms+OSRBHJve/mbjRhPvJkocbifmSKJnvod6T?=
 =?us-ascii?Q?C/JKQ+oRWfor2oE78BsirEjNgLIZxBjYCTnSG3GKxvcTwlc5eSyqLzoeTXzq?=
 =?us-ascii?Q?2Y2uecjtWYJwr5zn3BZo8dzl0ZGDBiB95EolP+OCAjwTGzA2BFW1i8spmNRM?=
 =?us-ascii?Q?JVO97OKfsZM0HCzVaM5lSZ9RgoeV0KUVKEyBQOw+YDpR0A9O6r6qxAHXwfvL?=
 =?us-ascii?Q?szyNlsmUrcnyBHEUeL/SIeOOuzKM91hl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k7XQ06cj+sF68Ts9qW2DtG4qAB/5LuyGpEIQdZTreQiQAaKEfRxtb8ZyC/Ba?=
 =?us-ascii?Q?8yAs1Jg2w09Nj38BNqTalRT0L+YqdTAsirS3tOJSwQrFXCdxQHyMO5ethWCo?=
 =?us-ascii?Q?p/4JwSgH/aH+aY1urjK8JY46lCqMWEh70yxBnGwPCE053je2NYT3smh7G3Ya?=
 =?us-ascii?Q?6OCjySnArLvLtq7cNhvWPzCu4ldAIdOvEQi/DYRqo84uZZ0pSQZ8BhoHmNRC?=
 =?us-ascii?Q?GB4ckK+VvYAqHD7Z8j/FlQE5DUkGS3b1gWH+Yv/wRP+fDK7NNQVsEA0MQFsF?=
 =?us-ascii?Q?JFmzo9G6L0gx18Vy16Owf4+TX3zhO+oL53umGpDqgi10+17j1EWmHqyrMWGc?=
 =?us-ascii?Q?cDuqoPkRxNPJ12pYmMPbmaEYxZpxk4eyqWAvu3lOfHDKJHJMTFbflL4WtBZw?=
 =?us-ascii?Q?sCUNc3Z28/niw72YLm74jNjX1y19o6W8qjFTToUn09C9PNsUTn0/nWqoaS/q?=
 =?us-ascii?Q?9wWVTg70+vSPq5tCKoqKfvd/jixsPf3Lh1zrZSz40agAFxedMvZm7nndQIu6?=
 =?us-ascii?Q?3+osOnJCYw2jTon11r6ApuxN8BlkzelHVC0/Drb8LERaLTakgf7dbYhDCwCA?=
 =?us-ascii?Q?ZlqgjEEBl3smL8BuCyZKtW+lx1GurEhMDvrLrHkTNsw/8KU23+qlEAHbsGb4?=
 =?us-ascii?Q?fllwkzQPf9Fy9nHf0Djpo5H3Yd2uUey1iSZrcJ8nzfJAJJ3a9FwVebLAh1tr?=
 =?us-ascii?Q?hwmNds1LD4IVfV3PrPIvK91o2Cr+3uGRQHB4Pe2MuY8SuwE+SFUAu0AqeLJM?=
 =?us-ascii?Q?zmfB0plm1RzsW1sXkAm/6TRx9CaD5TeAAovIfsDM78Y8jvmUGbqY0HHApJCr?=
 =?us-ascii?Q?9dFPA9356Y9jKKUN2LpjNZfIqbi5K1ho9rCszEKmYjpa30zVz+LLWHWxaFZK?=
 =?us-ascii?Q?XCxuX7bTES3qVsiF7o1Ow4vzh2eXc6kOiStsBk8qpwq2u9LtbTeg+l2eAa1c?=
 =?us-ascii?Q?R7Z3+8+arb9EgU1m+NqNv7dP9FwPOuccUm7FSKdE0AcGLUErgWtgLRK8+MlI?=
 =?us-ascii?Q?8xG+i9ZU75i2rgHQnMxI4C4If19VAbGy+aIwZwlB2+TjZ6OpvKvVVTCJN2ui?=
 =?us-ascii?Q?8OMcGum67k8RMMvdyPIsEx/e4vy3n4J3A1yJrW8RRNGrtnLg6UEllMW3MRwN?=
 =?us-ascii?Q?FN4//J2YFMjfgJEG1pl6JO8P5B076tvydyrjsxLM8xX8/AZ+R4+tU6mDpcs1?=
 =?us-ascii?Q?Y5RgGkS5myztmnYeP3d7UjopHTHofS/ZhtPqxp37CFs6Y6ge2Gyak/uHXju2?=
 =?us-ascii?Q?zIhhU6CrYHQJfCIL03OLms92H5zkrdaKFOAgdaRdcUMSTlag3FNX3VAJ1+1e?=
 =?us-ascii?Q?aJSUBC4gt80WNat7Wq8Cu4HeNjuon8XwsACEHGsFDLiLFpDq7F/6vVmwq0VE?=
 =?us-ascii?Q?gEIzHe5+iwhOHPMDXJHt7hf5vwB3ezGbZCK+rkwBjrBxslUNxY/klrvZnCq4?=
 =?us-ascii?Q?4RjEVGf3JlvaOL2RK7Eh0hw1VD2swHanMgWeS0xxnrcALnaoZodhPtOTa25F?=
 =?us-ascii?Q?ELyRyZd3xIgXOX5otDZuyjlwGeBhWdoqp2gvPgEHhDTn3zNG9b7ZRt2qwtQp?=
 =?us-ascii?Q?xi37RDA2VsXM71sgS3TEZ77ICRE17mdGaeafGGWe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fb66dc-6105-4108-71b2-08ddd4fdd088
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:27:54.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak/gZPp5yP3CNlE4A7hEa8sbzlhHpssLr6k7tmRyDqCoPqHXnj1025m6R5JE223AyR9YK9xP97gY81JmxT8J8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8865
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

On Wed, Aug 06, 2025 at 06:05:11PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.

nit: wrap at 75 chars

>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> new file mode 100644
> index 0000000000000..54419c589ef74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX94 Display Control Interface (DCIF)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Display Control Interface(DCIF) is a system master that fetches graphics
> +  stored in memory and displays them on a TFT LCD panel or connects to a
> +  display interface depending on the chip configuration.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx94-dcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: CPU domain 0 (controlled by common registers group).
> +      - description: CPU domain 1 (controlled by background layer registers group).
> +      - description: CPU domain 2 (controlled by foreground layer registers group).
> +
> +  interrupt-names:
> +    items:
> +      - const: common
> +      - const: bg_layer
> +      - const: fg_layer
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: pix
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Display Pixel Interface(DPI) output port

I think need

    properties:
      endpoint:
        $ref: video-interfaces.yaml#
        unevaluatedProperties: false

Most likely need set

bus-width, hsync-active, vsync-active

Frank
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        display-controller@4b120000 {
> +            compatible = "nxp,imx94-dcif";
> +            reg = <0x0 0x4b120000 0x0 0x300000>;
> +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "common", "bg_layer", "fg_layer";
> +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> +            clock-names = "apb", "axi", "pix";
> +            assigned-clocks = <&dispmix_csr 0>;
> +            assigned-clock-parents = <&ldb_pll_pixel>;
> +            power-domains = <&scmi_devpd 11>;
> +
> +            port {
> +                dcif_out: endpoint {
> +                    remote-endpoint = <&ldb_in>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.49.0
>
