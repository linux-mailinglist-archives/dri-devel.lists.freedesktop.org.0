Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B059A31221
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D205C10E24B;
	Tue, 11 Feb 2025 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IHnqzz/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013031.outbound.protection.outlook.com
 [40.107.162.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806010E24B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6MURnvSxfRnnmq4ZuFGW9iMVxaBZTG8cccdJ0emqaXzZl9um6QKYLcAL62rRzavB62Gud7JbareQS/AvPmTYpOHTZJjQv0mqCM1x6HrHTFO6Emai2/z905OetMZOAJ1hEISfmULsXoi0KcPFYi4cFgHA7I52XQhDqPX344foenINTzoHWPaprtF4cdi1WbGPJR8xBn9skjNICn2J4a3YAHC6YLTNotruKq8xhOIiWVkK/sn67O1KdJqLo24vfp7JooWBSMX5slgRL0IBODaByccNtwPpdVku+0nR0a1/R3n5jAyarkT6V01EiKCehCG0/cfK2+GS86JpymL39WQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kJs0GWcupCwhbYNcmSyBjqGs/8gSSvwbOyU7KXFq6s=;
 b=KcmcbdpWfvoEtfVpbGe9qweLG06SG3WIh6qaktDGfk4SGCk3tJxCHDmlIN5WfoyTmZVdBvOvxlLGs2rELsC/Nl9Wra2z5jdAF41b6oOcvFZHvWKJZMP7vG/Qy58ofW0sZSrIc05FcWCPuYknTRiCX/MlewTAt39qqn+A2xuhvJukAXHVWBA/mUIamGA/Jb4ahQ8dWCdry4PDH+0trOxqvdMCsIgF9reiEU+vv9sTrG6tYiB72xXRrozX4/Xgo+lS7swbLxeBxbYSUb0MEi0ngEqBtMiMTlCtWqavfzwvCuVbJMAiYs74Zml53mmLGeg9huKpnur7JomGYfZw+Oahhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kJs0GWcupCwhbYNcmSyBjqGs/8gSSvwbOyU7KXFq6s=;
 b=IHnqzz/+VjO/8o+hXnD00d/3inyUUXb/zOw5gGjihQJTWeqaxY5iOAkxfHuWlG3iduSt3EzVVRP61YKADrOWPdaBZfJ6xfXHjJ/7FpthfbbdM0r5l9nPK4F4NJutfM2S4/FIhV72FVQvWCB4IKBsksIjn+V1AztmpdQ3ta2uiNXb5M03BMY2gzEcwkm9Z0+wmWvRD1B2cSXLxYADQJiZgftp+6hn2HU078XR5JMTu3O82sDLSVQpN5VBPnDRbnNEUpmoq23gnCOO/uv+HgCvfkx7OAJm/m65TU5gzfEdyiOYb/bk7sz7EsNxCypUkRuuQMEr1/eSi1mzgnMsgaO10A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 16:53:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 16:53:50 +0000
Date: Tue, 11 Feb 2025 11:53:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 Freescale i.MX91/93 DPI bridge
Message-ID: <Z6uAlTsWTKsC4oYI@lizhi-Precision-Tower-5810>
References: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
 <20250211084119.849324-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211084119.849324-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eee9535-26a6-48f1-6243-08dd4abca902
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hVDbhcsi2peAX/ju3zvuVf9A8ZNzfoqd47KlT+w+Jbl+JmjDHDPPq8jlFZP7?=
 =?us-ascii?Q?MeOWUHqrvxVDeo50UIoRa3dpnGDs4MHFLgXtfUO1Z+iJecSlZhuRITWEx73r?=
 =?us-ascii?Q?0V9IGdlGSkJFQYqTwjP/A8a2EGTAAMHPO4rFY8lzYhaOsGwXtcQCdm7y1ATX?=
 =?us-ascii?Q?jz72Ob5IhoUecgB2Bgfc6CM+XEXHRf07r8QsUOpnTPJLdRWrVtL3sqrzP2BF?=
 =?us-ascii?Q?utAThxt3jmKYN8JfFOS5Rqe5/VqiDf6KIF7fRXb7mM/lsnNF3pVu9U0jCcrs?=
 =?us-ascii?Q?43g8li8c8HzvlylYdp1qkgCO/v23Kv3xzXR7Z8omzrYpo7AoCb9BDydZUzqJ?=
 =?us-ascii?Q?0IF0BMlCstihNJib7nEm34CyIOjGtiddbTXZbMnxKKqt2zeOpeNBGMDa7XVt?=
 =?us-ascii?Q?WlQKV1LreO419F9smRx7H1RuFnqqmv5d9wKRsRasTCa12tzuugszvCxyO/6P?=
 =?us-ascii?Q?xXKBGX8PHqAvIk8HTh8cr+uKpWG+sHQX6evP6NpeKre/LnryLEnfoUYL4pFJ?=
 =?us-ascii?Q?5MHaunjbhLUCkpaTx4a9l9f7v3nRcVaI6JGfrcqIrupHMMbUxkS5SqvO6ruO?=
 =?us-ascii?Q?tKlSYdqLTAdECalnDr55h0JHY6GdXYsiGJrk7Ky6OWyBelWbLF1dFmetx2x2?=
 =?us-ascii?Q?YKJmU24IgotMtz9shr+pV4ogul/QUjE9AlSm4URoNgemJLpovhOx0/YKsIp+?=
 =?us-ascii?Q?NGFTg56WqxMROzD5TvIKhbOE/BBBe0uokQXknSk/m/95CtmPyO04qSIOs737?=
 =?us-ascii?Q?5slqSNppcrG8gZbHZA+9b+shjbphbcoLem2qje5DSU89z9Y1GRrE5gVJOtjb?=
 =?us-ascii?Q?BiZ51x3t5/TvREsZs6OVDYDjMvC7jZilxdi2zyKvXTPqKiQozQkw23y2dAAT?=
 =?us-ascii?Q?aRRbqo/Lxly45Fxor9vieZmc9/BY2ywiKl7CICc54b14UAAldTANpx9ReKUh?=
 =?us-ascii?Q?3BZZVz2lnzHiuH8NchgMXjs54Q5ARE520gQ7RdCpJsiyg3Gdi02V9VvGN9WG?=
 =?us-ascii?Q?AW/w/DK4DM+RwTvNQJSOr57IqpQYE3UsxWiPi0hUxI0EKiLA8oQbGcJixo+o?=
 =?us-ascii?Q?hZrE2Mnr6IEG+h3HfFbkvOJ4v661QHh/S9B1hHXWV6fv5uUGJ2I0Po4016bS?=
 =?us-ascii?Q?QtswiUrewqIbM1sAq5VMzK2c1oOLrPfwmboUbsOsBXaaWsjcPjSqp9xu3Sof?=
 =?us-ascii?Q?LV5yy4ABkDkjmnUusKV85wQxWXu/fadPUlOSDAm9e7UidseB+Wd9nDMCkcCF?=
 =?us-ascii?Q?iDlSjGtEkF5fmbMMt5Sx7SLyyJIJtZ/pvw3/GMDh4y80/4iDqINwOoSGkcgD?=
 =?us-ascii?Q?pJBCmsTSO+5vGWj3RAWAB17YSVbAONhJiY1icAyngo3bJOz091KtqorN/x97?=
 =?us-ascii?Q?VJsjndSimvaPkMDXdnVaTvmWN3KN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(52116014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5x2uhbqtr2wrfqBdi6pajlymCqujj7yvIWTWviOGKshz7/yveqVRYWsLUWu?=
 =?us-ascii?Q?BshmT4vo4GR6rZ1a9LvofumDDAT3LD8Ht6zd9kS4Qd5X9Bnca9+sRXhPyowq?=
 =?us-ascii?Q?HZzKymxD/gYL257lum3LLT50ozP1ic2Uy6veA6gy9+AqKJ3pyerq1UxBjdIl?=
 =?us-ascii?Q?oFTRiJyAlb5bd5rbBwVMDpQxF6Xeqs0uuKcJdYILs5bQsH6DMZfrBWEeRKkf?=
 =?us-ascii?Q?ekqeXv0V7Iup+RK6hbXOlYJfekrNJVWidHewKqO45GLbOeC3N8p+AffYWdZ3?=
 =?us-ascii?Q?OtsuDiZEIiFNeeTfq8EjEPNqJhSz1jvQ+y25O18lnrUqwYwwvCCtV+8y1QPN?=
 =?us-ascii?Q?PGw8D4WA+cRfO7R4XGvsqkjx8A2ISMecQTDad4Bh2eRf9JeuDjisbpzm8TJR?=
 =?us-ascii?Q?J9Ww7+qNm8xxVhmhJckBWutF1qdt7c1n55/Grq80o2zywS7sjpObr3IeFZQj?=
 =?us-ascii?Q?ctWgHUooctOHFjv5UBZnn8ZZPJdOsnFkFmTy0MjGUSY+f+KgDmyR7VEOFkbZ?=
 =?us-ascii?Q?hAcQChph5c6wyPvqOXxdaVn6b2S4D6W5/tdYYJNq5NpOskD0gva7cKXh2yAt?=
 =?us-ascii?Q?xt+z38uPWRasxKI74i9m3xpBoVQODcfUQLwolklmbQ73OfJ6bxsINHVKro3c?=
 =?us-ascii?Q?y1dyBGGIh4bUx18dtzWVM6r1A32KfASLbgkQq6hE/Dhi5gqXZXiRYlO7aWXs?=
 =?us-ascii?Q?kq0yV+4HEiD52WbjkDyVL+sc9To4jChnJo47H35IhjsclNw8U7zqTFA11dyp?=
 =?us-ascii?Q?+GC1nR3/oOuF7iygNrA5bhENuJvPXsERjiuxIBZ+4lBci/7MaFeFLkXI56ky?=
 =?us-ascii?Q?yfoxWiEgYnouFxJ8tiISeePvWkyfA+3DzpUai9AqOTa2K3WE/O0b6Jh8Y598?=
 =?us-ascii?Q?ZaCwdpjsJ9lVJW3BC11nwhWy7lcol31ljf++qzUoYmxh8wy3ZFGUWRF0LBFO?=
 =?us-ascii?Q?8YhnDcTDjFeHi4dCtXZg5g0nvRyBt1ZKjtm+kt94rZlnlhvBAT4nv7iYofoQ?=
 =?us-ascii?Q?VEjuCGaDkPRShw3l3iqyTpvPoJtSlRa39r4UDhNkEv8tqEJoiODThG1QGu9k?=
 =?us-ascii?Q?Eel+P4gVhssaggxDBk8HU8x2xy4lx5SoCkXg1uQIv3X9Q2yDIssVSJSGe40N?=
 =?us-ascii?Q?+B+B4uDp8PNXtCoPanO+qdCxyYIjUYkLXp284XcIf4FNrcyW3bX8wml/wSmi?=
 =?us-ascii?Q?uvfG2CQ3ZZ6yFIjbvqdPkk11f/cAV5XYdM+C65KVa5X7jX3QSVBl6ZCdrcl0?=
 =?us-ascii?Q?+JRuaM9NDfRIl6o3by7mz4C2wQXi2h9tM/oVUb7RumPraagB8XrSNfg/9xTS?=
 =?us-ascii?Q?H70ZGSkQnxKHmBEbWXnWOV6q+/UgWFu+X0ls8/iFtL7moQyUTUEBtrgItQu/?=
 =?us-ascii?Q?cVlzVDDxlSD+fSyi7V8jRsWn6jJwX6m/OjBQKfq11tLwNXrU6GZ6bycmZ8RA?=
 =?us-ascii?Q?NjXRp9EvvLQC3TImfRpdCN2ucTbMNGFomtLIiQFALfAiq21Dmab+xQ4/nR6G?=
 =?us-ascii?Q?LyZQyoQ+TCvTZQ8UW9SeQ/MSth2x3NVpveP7sVhg0Z5oo9Fxs1OWleq7HbrR?=
 =?us-ascii?Q?Mk60PWPur+p9SmaxY27TyIg67u1fs6RwPXmje/3L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eee9535-26a6-48f1-6243-08dd4abca902
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:53:50.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qfhou+CSh67XW4ogSrN1sxf4JUiHrMEZlJikjenlCXfhS86UH7uSvGNA3zY8PwDvhOY2tfbyVIYfUeNcopISJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991
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

On Tue, Feb 11, 2025 at 09:41:18AM +0100, Alexander Stein wrote:
> The i.MX91/93 contains a single syscon registers which is responsible
> for configuring DPI output format. Add DT binding which represents
> this configuration as a bridge.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../bridge/fsl,imx9-parallel-disp-fmt.yaml    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
> new file mode 100644
> index 0000000000000..54cb73b59b1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx9-parallel-disp-fmt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX91/93 DPI bridge
> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +
> +description: |

Needn't |

> +  The i.MX91/93 mediamix contains a single register which is responsible
> +  for configuring the parallel display output format. This describes
> +  this registers as bridge within the DT.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx9-parallel-display-format


look like it should belong a property in fsl,imx8mm-disp-blk-ctrl.yaml.

Rob provide similar suggestion at
https://lore.kernel.org/imx/20250203220655.GA123074-robh@kernel.org/

Or at least, uplayer mfd yaml should link to this file.

Frank
> +
> +  reg:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI output (panel or bridge).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    blk-ctrl {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        bridge@60 {
> +            compatible = "fsl,imx9-parallel-display-format";
> +            reg = <0x60 0x4>;
> +            status = "disabled";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    dpi_from_lcdif: endpoint {
> +                        remote-endpoint = <&lcdif_to_dpi>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    dpi_out: endpoint {
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.34.1
>
