Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E42A486A0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AB510EB50;
	Thu, 27 Feb 2025 17:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="c2SffFz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790010EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZLNHI8yMUO0s7j4BeL+7EBqMx/hevUlRSSHU0xnUhjfR/4rMZzcRaIMLLumXBnQuSb5tqTR5HVYai6Nly0zsXebA7ne64H/5dXUc/ucxyIK1J6p+3Fz1wpPYj5ZLvMfb6q9SixVdbfubjm+jEdeS8bqOarr+pMUtaAxl1iUeTePVIA8Pwd7Q8xXbl2Z5w5Ti0ppXb4GjKo290vWfWv1p5VXirJWK9IlSxAEsz0OWOVy0Hd1xM2oxZPd9aZ12v6KyUAmTGVGIpZmZnTHSb3EfMYlkuNap51ba7CWK7Ao9r1CIfihXWJH9wqGOcYN2pE2s94kTLII38vLvhVZ1UH/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPsgJgqusIdrVebwN3zxgEMQHjpJf1X9+FNf7FrwDiQ=;
 b=HY19uiu9h1Ep5HdG2ihEC0L8ptkAas1LmPEWXqsceFzAUyVuGxwh7TN32q9VIUFJ5lVrEyC5PBLZWTel7Z5Aj6sg/6mcR4fJq3lv5kq/F7FpDbg5Rr5kZGg3yC0wf3YrSvv1NxrfUPGKq/Et4lajihvg71pWFMO1xFXbwjpLe3bkDpPjGJGwwSP6kZkdirvCY2q8hvSB9bc5a3x+bycO5Kg1hWcIY5VOezW+dgmGr0Q6KNe2zRDwuh95n3JsGWCqHeylnw8H8A10FPE8TldMgbWNRQyJazpJ4kadyyCm1pTMGiAsHYahfzYESkWdPm+1lkaQyXSIrx1nT7ZVf2KWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPsgJgqusIdrVebwN3zxgEMQHjpJf1X9+FNf7FrwDiQ=;
 b=c2SffFz7cGM28Jth2+/kMlFylBlOJMWjhvk17X9ygat5iNQg6PZRieEVYNaMvTLfQltVugxSJuRc8DJAYWGIFSNAW/Jl9p1w32YvgQG7aBLHs58YIYfZd/8pVEfPK9HEnuvIuWFWZa1IPadvR41Ft43Aq/1jrLSfjExOCT9IjSMYuqu3mmXtbcUY9z87F59zXVeo2udUsqdsPibhynGuwqPwXsuT47dlgjYNvvUQdiY+eZmvbbl9llIjJ1lacAzW93BQTegfBm7SJDILN7mGZurhGiP0H1VcaLyF2yATqwIvU+KOCDYRTZts8/eiO3Ly6zT2VlOd06QWB2k/9k/+bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8828.eurprd04.prod.outlook.com (2603:10a6:20b:40b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:31:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:31:04 +0000
Date: Thu, 27 Feb 2025 12:30:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
Message-ID: <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-2-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-2-marex@denx.de>
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e84833a-d821-47c4-7a44-08dd57548311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|1800799024|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SGSefgpytZhob/w/P2/gGENNOac8Y+t7mGfMyuxQAUePdF/JXFFxPK+Vxtpx?=
 =?us-ascii?Q?P9YO3yQ5N9jkLBwxeARUU28ODxzQURJbZd5Qku9crjqcIX66qCI5bbZrzBDK?=
 =?us-ascii?Q?KXCGv3hppQzhXfAOtdhm5n4ytxaG5JcBT3dYTTc7p3Lmwk/Apy/bDWMZZBWs?=
 =?us-ascii?Q?JtXbCcMCWCv4amHS2t93Co/dAk+gXND8oMcslWimwID9oHAFNmcPsS361O7k?=
 =?us-ascii?Q?DBd1pUgWXUVcnZwSXXAe3iHQHbv7o2CPGXkbBznPY8BxcWhvih0rbrZA1Yq5?=
 =?us-ascii?Q?5aaiPLgfQmmvKtZYYdaoJqeoVh1DKzLB1Wi2fkQhyr8Jq9RPUmcjFUQMnVPz?=
 =?us-ascii?Q?hVIDdt4kU0p4qHuFsWIpr0ysttXTASGwVTyEJgmR4aQlDtE3ixvRWglPhcvn?=
 =?us-ascii?Q?LJ1GvI8tQ8Oc50S7Kp7lZscGzGUBqMr+F6YGxKFAZ8veVJiDTAGg/z15oepZ?=
 =?us-ascii?Q?TjmDv3p8KJ08g9FA5s1lvcIVbD4ByEDtifJAeVDL8uvoK9C8lhtP52/dRjw/?=
 =?us-ascii?Q?D0mWPMgU0i8H4kpIdELtBZSIL8BZW+N3m/62WGrUL1fj/r2GsgYqQ2KZSsYA?=
 =?us-ascii?Q?Qie6jst+4nZ9GMq2EtGvS6P0jBuheb/I4febthcrcIe5LiqRUrfVFcIbWjjR?=
 =?us-ascii?Q?COvnejuKWGeKrYZGBugcjCex54dFbN++ZlZmDvr142qN0M7nazLlnPfOxjrk?=
 =?us-ascii?Q?loHX469hvde55x7DqwD+RuFtrb+J/ggcV+jDLo6CHVOISEkf0zTBbxikL7z5?=
 =?us-ascii?Q?K1WFCrzla3j0oBtX//o3pwmOis9tII0x6X6fjTgZLT2xCruWLMu5APzIs02K?=
 =?us-ascii?Q?4/B8kfiPWzwiqScbUMpn/TND4Qhod6oG8UOAmRDjzFCgbqNjy0Y1kqx+EbTR?=
 =?us-ascii?Q?bqFWyECK5+x9scol0WrTOnVen5SMCMvUi/1msc3weyTF310/V8mzJ7NZ7J+P?=
 =?us-ascii?Q?IPRP1j75uZEl9MAGzuZ56TB8lKzVV4rkrBiYX24Qic7YC4Hw6AsJ26RrciXv?=
 =?us-ascii?Q?ZycnK/UzfvQQuQzcI5ANMhhlDtCr50l4jyWpwE1ItpbUebYHYX0KRfUtEhtd?=
 =?us-ascii?Q?Vk4K2s37UjKjPsOf7KWZrrijYCTrdkByZ8U2Fp0ANYVwKc1IALv+gAQjXXZw?=
 =?us-ascii?Q?EH1Il4uAojcBWmre41d+VRo54T08qlMqkKiJie9Rt1IXU76eW6UyN97cFBtK?=
 =?us-ascii?Q?gf4M6rqeBTcldU50P6kfbVaeJIHrC26ihV4hI0GEkvSFY+ZmaRvbDWcdHJOW?=
 =?us-ascii?Q?oApw4wDrh88/3ea2k8GTSbXrr3Br7OcBHVTUGsIGHTTE+Zu52NbNoSj9v4YQ?=
 =?us-ascii?Q?3pyjjjU0doRk60BS/S1gMU0Kyh+QNGBG2w676Ssu0BvTc7EiE7ZGOr7zesMV?=
 =?us-ascii?Q?q71MlFxWZOyeq8s4G8FxBPNi+itp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cekgM+9b2IOFC0XpWgSY1YpMbbpnoxg1Spm9N58iuQ0RLaurJ6u3bBe1Hgl+?=
 =?us-ascii?Q?deF33XMeClDLEY+hyHn44h/AJR0UQ0jgiyfWZA/kEGjSCodxxKnyZc3cQaVK?=
 =?us-ascii?Q?FD+VGKMqXQ+3BymJY+mR1l1oAW3a+myRlWYpludVSbJtVrstLDJ9B6igwx4Q?=
 =?us-ascii?Q?3/4WJi98Hb/q8hKow5OiKXEs6PIGUaStmANt1UGxHsf7l73gbPMMLdPkR/dI?=
 =?us-ascii?Q?bIq78uYfyU2YgHaPORb11iNWAa79tRI4MBxxI+2hw5JvXL0ffqjdxfE3KhvV?=
 =?us-ascii?Q?ncgrYf0MxVOvB33kAkN/fDhtKLBJG4AGrMiN6eHenooyvkREa0qyEWermwQZ?=
 =?us-ascii?Q?iuEL6vrauIJK7CIETLA1gJ+KYuGQbaTXypbBgTXAREy5IIOV1d6ZE97pajmu?=
 =?us-ascii?Q?IJVoYEE6etZpEJPK6Kk2JB8CeCa3zXAFEMRA4zlU0q9uMu0JhiF1YG1giKRr?=
 =?us-ascii?Q?gpYyOztS8tC6IBEaCZ3b/5SMSYPLQkxtJBASRvgdJhmNq3kCeGn7Sn+p7KD2?=
 =?us-ascii?Q?GVKq8uTyvupZN0ThpaqqRIC5rbu0zLSRJUfiiXSmpHGk+/PFevtuY+nG2y8D?=
 =?us-ascii?Q?UqvCpsxSSlHjjqZnOAQhPEMZZxnl62UDjP4j5ddYUS6bXoWwoaWVwTcUJJdm?=
 =?us-ascii?Q?79ap3xEDVg1hteDbHky0oYl3FMmeE65FWDBTw3yHqmSrNLuhcQC2wNZGOSs7?=
 =?us-ascii?Q?xddrKxI5UwyRugX6POOU9leNIqr0pb3xQk1O2H668vsYJvv1ZDPdNefdB9s6?=
 =?us-ascii?Q?sZms6we+YmKC9zG7RGlW6oA27T52mB94HytuYBsf/cEU56N4XH0Fw05WqYd9?=
 =?us-ascii?Q?K9I6KIeCnNviQ6W5gOeKo3dLccj3taVHhWYfaS4VbRlr3HVJbGKV9Ta5TzH/?=
 =?us-ascii?Q?zvXPaO/IpRLx9BeCT6/5FwVmml/yc6LEBiJ3rDxmLEG+fr263cQ5+Bg9FybZ?=
 =?us-ascii?Q?TDp1GrY+nrN1sfNTx9XQf/NcOk45QovUm+UkIHtWs9+tySTI9hHpLcJZUsRf?=
 =?us-ascii?Q?jscnbehApC4huesFQT1bF3cJI9tF757nBTDliUXfeYvxWAbPvYXoxjbSL0xx?=
 =?us-ascii?Q?rf7I+WPDWWptXYP7GZrL3czU/w9kvBpv8Pwpksqs9iqXO06wbaeCSaQ/QdnT?=
 =?us-ascii?Q?13JZASDguL7J94A227BT268HMy09INNIt4riq2WsR2BeyoNo2Y2Of2oMGhCd?=
 =?us-ascii?Q?fzZ8LMYXwThLo++ra9HbcmAf0/fy5le4GohfSuskduO2QXM0CPtyS0CsvZ0+?=
 =?us-ascii?Q?iZQUXni9BEwGbkCrAtI+4i5F9d+fH4V0nDkxGzT/jcnWPdVIDH9HQaTAHjbP?=
 =?us-ascii?Q?VQW5VANf6Kug22GgH9XfwmizZRFFyGeQ1UPVqwoPwbJQQiH12Q8+7cbH4wQV?=
 =?us-ascii?Q?za2YE5Zi2hX52Wdl292wev0WmYXDyLRZ0K/hF3+kgcDAS4UV1nHSlMTzPBAP?=
 =?us-ascii?Q?/VqDYZfn1pWT/o5v/Qt5JICY9XfaCNxkUNVB7QRiHvVN77oANp2Rz2/PLs2r?=
 =?us-ascii?Q?4FScnW03g4bbZsOQjyws5LrmlgctG4wTr6qmknG0nlYdvy2gdQ14uLvcczeq?=
 =?us-ascii?Q?hEIir0AfaEDBqiSALeg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e84833a-d821-47c4-7a44-08dd57548311
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:31:04.5416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ia+1Fdra4Z/4Ek2CZhhAK1YVhd366GjHnVwmcNs5YJJ+nrNNAcRTv2dLGhCg9b8NrEn1pC80WtpMZ7Aw7OzPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8828
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

On Thu, Feb 27, 2025 at 05:58:01PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for this reset register.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
>
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
> new file mode 100644
> index 0000000000000..dc701bd556c0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/fsl,imx95-gpu-blk-ctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 GPU Block Controller
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |

Needn't |

> +  This reset controller is a block of ad-hoc debug registers, one of
> +  which is a single-bit GPU reset.
> +
> +properties:
> +  compatible:
> +    - const: fsl,imx95-gpu-blk-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller@4d810000 {
> +        compatible = "fsl,imx95-gpu-blk-ctrl";
> +        reg = <0x0 0x4d810000 0x0 0xc>;

No sure if it pass dt_binding_check, I remember default 32bit address
reg = <0x4d810000 0xc>

> +        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;

suppose you missed dt-binding include file for IMX95_CLK_GPUAPB

Frank
> +        power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +        #reset-cells = <1>;
> +    };
> --
> 2.47.2
>
