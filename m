Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C648FB537A6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E82210EB5B;
	Thu, 11 Sep 2025 15:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VT7lSmYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB9E10EB5B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6ffL1C49vqNtkqAdiz/aGRWyLQiMFnNHxgkgRsnhYHasJWb/8Xbf0ezowkb0koV+E2GZSPn6A0tcPqHevtZ7R0JTVbe8UbtiqrVYvk6eOGhobkyEi7fbYoJdYdFhiMo8w8bY2F77YQyhMAswkF6MElIV23qM3COQifUmyDJXKJiivlahgTSNODBYves67wOPoSt0SUbF8ib7yd6xm7eUi1YKwiW0SyWDgu9mnC6SyeeRpsuOVgOYp7PSOTk1y0M4RusJG63zx+NH0bH6MXfwgzWfRSG0yDERr8XSywouyYycI3M1HsVwPqKX3zDj+iifwk5sflA2b4zeqZLSx9CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luw3n0HGnbk6EOotgfISXWmF8HW9Fb8HNQ5maEZKycU=;
 b=M+OA3S00TkirPX4ddzaQ+aXwmjtxiKNa8wiD3v+bydRuFws+GvjuwRXBiQbss4WNQHxyI3JEzva4nSRXaYiLDj+XBpKZp6ydLod9j9ihiPo/81Xqd8q1DxXo+mwbIDft6CGB6YML5glJ168rav1xnpvvfPxPt/Eg8YfXZctZlo5PuwglIS5wq9Hyj3WTH+KSho2s2OX5uDkCgkKMUW0Qf62BNl59l/BWbqcg05XeXmf//l7QSoTQ9gQsVOwaPbQ7J/OkrHBzRL4cDDWOWSSVBJ66Ym+AyOrS3Dw3GbbRBbWeZkuTA9n+JY21ebx0I17M8xwIAhq37R0/vLabVZ2otA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luw3n0HGnbk6EOotgfISXWmF8HW9Fb8HNQ5maEZKycU=;
 b=VT7lSmYmgJW7CzlOPmN2JskKBgFCWwYz7FqbRLnf9dmAry0XuHLAhc7TqKzSEpRzEAUr48YaJGyWtqe7aZHt36sMnfeXaAHXaXGSj58W+BHQrBa+mvUKVdrhndJ+aGvE3FY3GQKmUlMSAJj4ZsyfkoADazkO+EBUWLv7X1bJ+I/k2RtLSznLtchEKv8Ct9XS1jZu5zdALNQ8UAboKpfscYmt51oNP3SjQZEDZop4YEKsxl3Pgo9HxZJRhR1CpmlZ+roKmr1uRMniYoHtbB737lDzzq7CHwbwARMy4HmWd/N828yKN2ZDJw8IyLE4cyifs0LYicmIGkQ1dC4ocAJQUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA6PR04MB11779.eurprd04.prod.outlook.com (2603:10a6:102:521::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:26:26 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.015; Thu, 11 Sep 2025
 15:26:26 +0000
Date: Thu, 11 Sep 2025 11:26:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Message-ID: <aMLqGJVAVnBYkuvv@lizhi-Precision-Tower-5810>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA6PR04MB11779:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d3f085-c520-4ff2-af7a-08ddf1479290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?thhKcy9WkvB5D8/T0A5wpRLi56pFHFjWlMplhFGiZeFraYTbjMZAk02nV731?=
 =?us-ascii?Q?QulXva+yQ5l3RwR6ydtDbpq3S3MGmPsXC5wE9+6MtQ3sJjzC3d5I54ddNBYt?=
 =?us-ascii?Q?O2VfNLxvbykkDt8YWVinhUuhidaYk0VwGbsQOuvXGY3KToK9+TtzQWO9I3qk?=
 =?us-ascii?Q?+etXu6WKGgjLAqnr8/LzJ4H8PL7SjDMpxc0Hv4RV6RsS1X4dF1RB79k9OysO?=
 =?us-ascii?Q?pejZC4yP3UCrCqcB4Jt15MDb248AZ7im5otApydvcUxbAxjDhQJHSxrmzrl2?=
 =?us-ascii?Q?9jEOYBuOeYqRJwpS0Xe5+wYa8n/QfjIm8ICq3LoG44mk3cidEAvJcRIMv3Kn?=
 =?us-ascii?Q?YnVZmyQZvyOke23wPC7mvBxds9c60puM8Y4WcEQmfLOz8D3Kd1AaTeTF3SYW?=
 =?us-ascii?Q?ZF/TrMZBHL0A83FwtTIF7aPc2ReHk873QLDvMQoEBz4HVr12D2ZQcMvSt79j?=
 =?us-ascii?Q?Uffk4mDTpOWPFcGV+MwhkQqWIcN8Hj+DqWaIeXdtk+KU/XIooXBs1DSay12V?=
 =?us-ascii?Q?3pd1WhiZhQiSLOL5hRQolErfti7AfaMSCMqoljnIpIlKsuSP3zMDz8ET/wi4?=
 =?us-ascii?Q?5WW4gKkMfub4Y4QlUeIWiG9+8DIWb1RN34syku4QhLFVPxr37lrVgOcnVpXl?=
 =?us-ascii?Q?wHp1yjQ/VSYrjVCd0hwOrCHkmFASntIZq1NLAV509ptMbRzjn8bhUONjas3z?=
 =?us-ascii?Q?XXIvWfNBZ2zkOZLPbFsjxreaK1qSS8rqBKoGLl/IqO6T4aKwR1uwtm68wSvV?=
 =?us-ascii?Q?euMdj/ffkqZiadsVRAUTWCP6d/m/Yet4VI2meBnWinugWK+MlTLzqqZ27IN1?=
 =?us-ascii?Q?e/moLD/NtiDvNQod2krI+T1QNc5+dhoD8DaCNHsBFN8d9AVaa7+M4HiZxENc?=
 =?us-ascii?Q?5QhIZFaEmFeLrxSxet/eBCWL9GWw5eaznpfqSL5nFl1SF54kXOgdyj0S6Xj4?=
 =?us-ascii?Q?eeYpSVdXyq7buzIQjYawwrrwSzFBirhrVGOrutQk6Vg5462lP5aaQI5JqsId?=
 =?us-ascii?Q?nVRlhq0+uGPi/1sNAFZMQ8Z6qEntcX/qulKpu09mGLYWJJaR4UKgZ99vEe4Y?=
 =?us-ascii?Q?eVCVBYY3UIpvKMju3xPu1a4zhzoc7wAR5UlA2y6AOhbPuovDvozQar3663B/?=
 =?us-ascii?Q?y4KnJ91dAZmrjoMnmhe9WMeG+W0CGh2lCysAs7oI5JuqUzi2g8kuHH+0/jcz?=
 =?us-ascii?Q?DVbXfhVm5X19bkLpEk2NGWFw+C5g5OJGB7fZcxkUzjtsnZ1wQ5uf/4g46AZK?=
 =?us-ascii?Q?ecuZH8aHtLnKTMCQ1HinO+1gwK3Sp7pd2lX17XVn1LItnXkfxD6qyAQ9lPx0?=
 =?us-ascii?Q?6Zg01Fc1msv6Qhn8zpXWUyl4jEZpgJWjU9iMlTQjqDvJigOqewpfRK8xR1F0?=
 =?us-ascii?Q?t4bftYy6KuTh+Wt4tGxHN6t0bXCCgKKxTxUsUOrDi0CShArkHWK3R7Qcz2c/?=
 =?us-ascii?Q?96iYDajk0EIQ0MC/L1xFlNP6XxyBBx4h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6j1vPtvOB/b7bQc4rf3uscp9jobo8CfbX/LWu3yH6mhC5HyfHwe/EGKuIs+J?=
 =?us-ascii?Q?+3leioSVnKtHaPLrMND5ZppLpbw5ArVaMt4Lr6cGf9WiJ55hpCCmg/nfAVpS?=
 =?us-ascii?Q?11nDcb9eWE9UsjDKA6sTk/Qx4sKk5r/JlZTBCJSu0IQ99Dn/3B5ZvkpsubFy?=
 =?us-ascii?Q?g4wY/OFXr+dIvlEMBq/5brNGancslYLuQjJ7gsMHxW+M/OA7ZpXiXtaLSrpR?=
 =?us-ascii?Q?qcPnC++jRwfqcg287anuLGztR3tzRgNa4b/kU2mFHoNzZ2PsKp9lxr7l+ySq?=
 =?us-ascii?Q?qQIU5jrAzVnke6frI5zDwrrxWr9eFR3bweCL4sqKRV2UQ2riKGPkEkKJfap1?=
 =?us-ascii?Q?Mlq7t23PjAVz1qeENwqiNLSkn/yHmWb+o/dqe/r3xKDYhiHWBJ0XMTDHZJ0n?=
 =?us-ascii?Q?WTPg4OQRgkejwUOV8RejO5nhbIZ6ffEyEKBpdCH+7gc65vdlH+YQ+T1W9hMX?=
 =?us-ascii?Q?KJiBcq4yqoq2ivISNtXZRP7pC4i1BTEyqilbrxL/01nWiFIRPKBjh/cJntaj?=
 =?us-ascii?Q?wrn7C3eXc7xZUelhQ3JEXPmnBn7IqpFxZ80MHhQI0od7qNoMf+BEZxGBhG7U?=
 =?us-ascii?Q?U9wPFfO56Au4F9ALtfdhITUUfL1cahqY7ctL7pvhPHf/MM/QiDL6LziQbCYU?=
 =?us-ascii?Q?tqawe7rUi866ibcdBMhzp8+qT3xLBXyqUwxE/YxRjCNyceq1K3+dgTg6YOL2?=
 =?us-ascii?Q?s8Wx8Ce5CLM3fUyDYpznETlWjZW8/bwVshCC9WzG8aSlW69iG14HbsdwtleN?=
 =?us-ascii?Q?N1kqy5AtWs3hX6YpRh4wxTBFhZ3D5CIXcvSy55G2Jhct0utsUy+A/zMNQIcu?=
 =?us-ascii?Q?1lf0RiJ9pJ/TGnxJh/DBQ4F/GRkRaWYyH7exd6JuQrSHCuMHdH0cyVIsYMWl?=
 =?us-ascii?Q?nKdzrYuvBxhA7EWiaOro+kr8i7lYfs0uaCknlNwtLoHlrNNAFDjFFl3cR0wc?=
 =?us-ascii?Q?/ptlMQ3XPV9Czuv+8ugCuaBRvBYmDOxBO3n3KtaUab7Dc3iTO0MecDZwZIpt?=
 =?us-ascii?Q?ESHWKprb+cQokTnlDVPS6e5IGzuOwtjwa5cuvUPe3/QDOFKE0w2+nxYiHAxo?=
 =?us-ascii?Q?5cGA1sUfbmq4WGhaF/P/CT0e3WGecppG3k0imZOUeqqG5nsNPIrWoQfXs2bX?=
 =?us-ascii?Q?rpZmKQsOC5yKnXKXmwNQWj3ktDime3kpSjycfeqSYAm4pZdb1r0q0Ciz/NVT?=
 =?us-ascii?Q?55bw8/sPHhij1WX5/wpK4ndV83A3BN+qxnb4td0WO2OjTCE3UbDftgcyrR2J?=
 =?us-ascii?Q?gTPllc91Xs2nt1eWsc7s/QZwa+930O1XPL+MVE6e2kmZRRWy/QfAxoTLeRJw?=
 =?us-ascii?Q?0cnJRLu/Lkm8LfHA3tif3mzYV9CWAML5gvAe+XOKSFBTcIf0iD5OlfSVgie7?=
 =?us-ascii?Q?nkUWA7DcfHpOMJgMEkGmGUiLeM/D2qEMuWuq4zSWwjJTDkYg8XKb/1tYlMtq?=
 =?us-ascii?Q?S+vpvkUIE8Pb+NFKiMdLWUnFU5Z81nVlZB+nhdBq8fMkAUZBoN3bSR7UFU9I?=
 =?us-ascii?Q?/nx5NYSck2umtygJJgG/EgUvjHpGXC3ga3eCFPQ666B5eNhxJxtpDz6CuF88?=
 =?us-ascii?Q?BotePo9y/f8PS77dHJydCS2xyxGnrJbqf7QhgDy+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d3f085-c520-4ff2-af7a-08ddf1479290
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:26:26.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSUIW+esuWA/EbOj7cXbJrub0LDXdQF4SgliHxj3ZELwJSgLSs+YHiavqRVfVfaeVMg5iRCL/ydZf4DLJO+4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11779
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

On Thu, Sep 11, 2025 at 02:37:04PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fb25300e25529699adeb4caad9837d7af23a3581
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

I remember dt use -, not _, bg-layer

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
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: Display Pixel Interface(DPI) output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display-controller@4b120000 {
> +        compatible = "nxp,imx94-dcif";
> +        reg = <0x4b120000 0x300000>;
> +        interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "common", "bg_layer", "fg_layer";
> +        clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> +        clock-names = "apb", "axi", "pix";
> +        assigned-clocks = <&dispmix_csr 0>;
> +        assigned-clock-parents = <&ldb_pll_pixel>;
> +        power-domains = <&scmi_devpd 11>;

nit: need empty line here.

> +        port {
> +            dcif_out: endpoint {

needn't need label dcif_out

Frank
> +                remote-endpoint = <&ldb_in>;
> +            };
> +        };
> +    };
>
> --
> 2.49.0
