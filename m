Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68BC6A4D4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70B10E362;
	Tue, 18 Nov 2025 15:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G5f9l7J1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8653410E362
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QguYBYRPvtuSupeSJ2d6sM9kg9jppBu4WevU2ZBHdTAb/vX9nq4yPwLqOtEQbua4GkPf+x0KK2tAKcpuD+bhFUtw8iD23pR9dGyNdYFeOxPdX/Vh3zPcGBXrh0WBwjauR8PlMFNTdIK03T1VYdMYIfofuobohXJCCK10ntub0N+UX9buhFzxcs75iQG409fnrVis+LJQTIY7wp66/2HrfcbTzkTIZTOyIiPAftDoCrq7pYOXj3OM/XHLTWk1SutvLaYIca406dhLKn5LI5oE465D2wlfRqV0lAlJ76+LcL14IgOvmMlyJvmpwa2ZFmukh1iYdkcxUotOzK+IFgresg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76rwl0ex5vM5BpDavEDUnBUNTWO3o0/XftCvz1D5+Ts=;
 b=aDus5kZt1kYSRGVgvKIIW6duAQS/2M71EBJg+hUwhbHCqwz3FiWzAN7NWRJZIZbQkQBW4nvp/xdRwad4fpuqPt4G5Z/UKM4/5wuDUia+Lz0sW/czoD+RiybBJ/6fYh2IqZ/kV4t/gnyP8IYWkDAqFElLcd6HxwaiM51iI60h+cfwWAXyXXQsrJBA1Tvli62G0zrqFVH12MM2uGsUhueJmzz+zYW/hlcFeRT564wapI5L+a+ieadI98jwyksgi+Sv/3LbkbzNMQGQFdIrxB+B7ZGy3zr2u+xoPhIuWtV5ph+HwkaZGuWXfbquM2T8Dw5XAqRrBmHfpakrR9tKNWQF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76rwl0ex5vM5BpDavEDUnBUNTWO3o0/XftCvz1D5+Ts=;
 b=G5f9l7J1wxDkzt9fSmEBfYSnTJqp9I0sZIbgBHqmPza6pnLxSJx3yIkGUTipMMmpSyW1H7PIvFh+upne2/tke36GXCteY3RQjpRNYUEUodsVJGayuEdQ6MB2gjeIIcax599U2kKiXryVhWIOHxKiBgwlNv3jMutONYSltW2P8+h1ShxQ+KgFHQiABNUU3AlDraswZs1nDS6ydf1SiLs7gNhceg50+muJQCYagD8P7eyYo0g8srYKXAF2NZc7W62823pLNxT03yuXrJo6ALzf8YfnmM42PMsSmie013T7kiabRz0WiIQmjHLMpPT167nE9WryPavIgG6WnK6uV7jYSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB12052.eurprd04.prod.outlook.com (2603:10a6:20b:745::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 15:28:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:28:30 +0000
Date: Tue, 18 Nov 2025 10:28:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,termination-resistor
Message-ID: <aRyQkxNEZ/XkItXm@lizhi-Precision-Tower-5810>
References: <20251118132208.143315-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118132208.143315-1-festevam@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB12052:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1edfc7-5769-4311-a85f-08de26b7205b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bbEGR9Z90xy+F41M/pTY424wBYs/dqqrH4o5af3dhNiLVIjMu8zB02Ti6+mG?=
 =?us-ascii?Q?0ARerhBE49ZrgHND+XBsRbOFZ79Vz4SWMlaRXt0a1Qd9Y37IEkxIHEcDsC+S?=
 =?us-ascii?Q?0ci8Hi+ApCxWOON8/ULgrt7AZV4JVTDHX6pbxTNeNYcb7ws7UkdYiqbM1DcV?=
 =?us-ascii?Q?iT5msxhL+LgkYCeF/IRmAOZ2CzXbYxr9Inu5qsJ3z+ulcoXB9xhrZZ19zpxm?=
 =?us-ascii?Q?Ddn4QQLbEMff3RxbhA3npdeT3kV19fnRk+OtIVTAk18h6uGFUUVydhjqooeS?=
 =?us-ascii?Q?8+SMZyi7QY5gPvvxuLk5A2oEof2QUEErmI68fiJe9rJI2R6mVd6mLMwa+PsX?=
 =?us-ascii?Q?TFQSn7xzrk0WikoKCaiTDfB+vxhL4hJBYNo1bmJMbs/GAHVdXNIXosYdaEih?=
 =?us-ascii?Q?Dn7m+xpYTsNgewQ07CF3UcQMzE8+JdKt0N0BEm4RAlSY7B2HZJTlok6RWXrY?=
 =?us-ascii?Q?GtuEZecGpxM0seikdCQfZjHichzI1g1gbtGjshC69O1wYV404xZBDe+0vJ9F?=
 =?us-ascii?Q?tYVP81Ub9NAGUVzKbfD4eeTyfGOmh6/cTIlIx4AYE+WMpDdkMbBWjEiuoSNl?=
 =?us-ascii?Q?mqZD+gBALMwX6Ly96ytcwtUpKgsyWWPnIiYMPoF5rfUj2yW4vbbGFiQ/LXya?=
 =?us-ascii?Q?9cCOfMzpa5JXS8U/vdvzuSkeT8Es/tSWjxcZatOpI6nkm7In6eQFeHhwbKgI?=
 =?us-ascii?Q?sRR48+B0UvX9oHjYKo0RthfnA3lh8+x4GK2c5+AT92J+sVehI6k06ibK79kH?=
 =?us-ascii?Q?BHppRdXG1S5U/hBTkojqALyt4iquTVoAcUgtVW0HW4epW/baB2OVx0kYTBcX?=
 =?us-ascii?Q?a759oZOfGXEw9FIjtCVdlKFT4bdIpPpcwlzHmZKEJkf7KJL+FZBGXaVEONi9?=
 =?us-ascii?Q?k3U8nR443HE+hBTuR3Wao5JSCohcNTyi8cBHHW0Jc1xiYQYieiA0tKGG9pZL?=
 =?us-ascii?Q?xXblL95hMU8e+aNnz2ItWas9SmD84de3OenQ2m4RQ1V+7GQmOc02yi6C8KaF?=
 =?us-ascii?Q?zbYVo1X68NDw+ldpGBjbvia+mKrcsFCGSooeTlQBd7ElKz2NgV4VT+0cWchn?=
 =?us-ascii?Q?x+2E+63xOU+3U6JBlHGyVEVkznl6eA50SyGefSaHi8GQg/9gFjmA+0TLNZe/?=
 =?us-ascii?Q?XAW9hpQ9ppgcJj5DjW/E7WGwyez5XtZckgv4LAs26bd1XnXb/oMSnX2O1kRS?=
 =?us-ascii?Q?eVbu1ERGNsiQaad1gZjqGzpglfmpaTrTRQ+ArJf/YP9erEhNOwP28VAfo75S?=
 =?us-ascii?Q?3/+/8Jaoqh8PVNnVXxUWQn+nXY4jhPvdqZuD0weZmhzxxAXvBOHK/LshzPTG?=
 =?us-ascii?Q?qVtuBRuK2THLzryc8ga2KvTt+7I/BodoXEEu6pq7RBKbV/WQCIcnFAeRbdAD?=
 =?us-ascii?Q?ahUS9ykN/H3xsxNivnRVAHYCFZFgI5Afxp9m/40P0s37ey6RhAS6YCcQksLA?=
 =?us-ascii?Q?ToeYsu1CAGfhoPS2aii1brj7jhXISzKBbmD6AAUydrn9KyKvwheMjmcSqmwV?=
 =?us-ascii?Q?eop3oyBYVK8vqrj0O1AsMcAEIsTXZS6uvAns?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hlc5BXbO1eWvu1xySalPo8VHW7I1PERMlx753JjhIw4fLbOg4Nd/Xe38E8Mk?=
 =?us-ascii?Q?wrmbIMTQy5KyIU27IHZby60sTgkDvZCscGiy4WTnDUQV0VxJg3yZHwmsNH+9?=
 =?us-ascii?Q?ME2EmWac3b6sj18ICAkF/dIDAo5Iysvv5psYpg8cIpMQslAJM87/T9zlhM/2?=
 =?us-ascii?Q?mMfvVLjiPiaOjALB3ATcvagLyMUL8NFyLwjoecVlLpJOZik/OlqInAfAW2Zr?=
 =?us-ascii?Q?GuezJ5daIo+ATeSCLNMUjqzyPzVtAs34TdVvbiL9J2S/GJh5IrNYZDRSIqNr?=
 =?us-ascii?Q?mNwXC8oYH2igtBX2AINhKQTjOx37iMJMiihuN0XTElv1iKFVqdbZUbBxqIHc?=
 =?us-ascii?Q?S6tRXeqDubatIdZP/pIBubsXBYVvWp5L5hI9A/1ssCYyVTqc/mDaqEkTzWUv?=
 =?us-ascii?Q?T8tJp1EMvfNuvMReItgpK/17LAJqNsthNDBV0jVDwJuseiObCtOC57atken6?=
 =?us-ascii?Q?ND6W/B674yf3bl33RoP7Lv0dXkgD0ETR6kIYfc6tCx74jA8d+cWv6t2Dwx47?=
 =?us-ascii?Q?l9V475PSfahriEVSupFkH4BxQH8MhNvibPWbnfY6vgU+78zlE/ofeO6iv0Bz?=
 =?us-ascii?Q?RXe6Hz1LFUrDDP+qw4LPH4dvljg5Ipqb7KXRJnXHDNpvwLuN4vvEhqrZTRlv?=
 =?us-ascii?Q?Pf8ilLErKfNqYDJLUTYqQLsoBEVrF7svy21S2S2/TnV0xV+Edh4pstdqdQ2A?=
 =?us-ascii?Q?KcLF2Hj6w6Y5WVMIQ47VIotK1QR3p2lhfMQabsWYMUERZQX90DSZctLNot32?=
 =?us-ascii?Q?t7rAxryPQX5OYPDT3RMiHcXcOV2fIUIiv7EBFKrOx17NQty4tL8s3WDNld/R?=
 =?us-ascii?Q?kOy6o/OXZfcvMaJHLY5waobM4ktTYy3ydOJqPfyKmxInC6zrobqeCXB3tEy1?=
 =?us-ascii?Q?hEke/CxVETLnnKDx7jV8B6TP/z4UFIz4JTLqtlD9eJqD/diL3sHhBVSRy6W0?=
 =?us-ascii?Q?sWmFCOUWiH/PYVObmO/3aKBKbje8BjHy9nxCtYZ/TSdGEvlUBYUfjlsp1b+q?=
 =?us-ascii?Q?E6EHleqxfsmsJaOkQlbC3IMts4EPNd/3VQzBIXBmpeZhWY7AO45nvQdDKnEa?=
 =?us-ascii?Q?KLDPM3zfEKoC9SIVAi8tmkK4bdus2/RHUq70pJnk6ZYyvBnyGCLN/0qwNYDX?=
 =?us-ascii?Q?MX0+TgLdmioN9olOl3Wnsnw3PjXsHZqo8/FnBDGgi3ktvl5akhaUhnBjLrp6?=
 =?us-ascii?Q?AIKjgw80fef7AJG5JuHxYynNz7gDQpTgRCedq8suKx/Ut56MZ20y/ZAi9XBr?=
 =?us-ascii?Q?OR05We2Pc39RuBDoRBKnh6Oau+O+pgVNMGXGgzWRGw2U/hZLYZCWYn8R15GV?=
 =?us-ascii?Q?45qYsU+q2iJCgEem3MpVVkpGyLqDn5ykJTkaHehnJv4XVoBpKxQsMK6nQobx?=
 =?us-ascii?Q?cydg8Sgn608MAneWulRfD7ZK+/05gfrc2B+BhDpKqw0RdzSDLKatPMGk8dI5?=
 =?us-ascii?Q?HVISnNeSU0xP/8H88zgYHi+qIftz6R1MgRMYgZx9G9egmYbgrEoW/JpzRHL3?=
 =?us-ascii?Q?b/lxz0Ttue0s2EwQJbQbWiFSdly1BSd1uqPsL8SkfX61+17209dXhIOBgY5L?=
 =?us-ascii?Q?LH8sVVbTnaRkkAuFYgeSv5rn/KZ4hjQ0AN7BaxVC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1edfc7-5769-4311-a85f-08de26b7205b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:28:29.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y6+qTqJF/uaPpx0p1xO9HH7te0YiTB/DZV/4wQP92Jzh33NNCj3dw23zm6kt56lhrQBUZT2d298lQ59yp0m6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12052
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

On Tue, Nov 18, 2025 at 10:22:07AM -0300, Fabio Estevam wrote:
> Document the optional nxp,termination-resistor property for the
> i.MX LVDS display bridge.
>
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 07388bf2b90d..6bc786204e65 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -35,6 +35,15 @@ properties:
>        - const: ldb
>        - const: lvds
>
> +  nxp,termination-resistor:

the name looks like resistor value, how about nxp,term-resistor-en?

Frank

> +    type: boolean
> +    description:
> +      Indicates that the built-in 100 Ohm termination resistor on the LVDS
> +      output is enabled. This property is optional and controlled via the
> +      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
> +      quality and prevent visual artifacts on some boards, but increases
> +      power consumption.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> --
> 2.34.1
>
