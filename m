Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7DB5532C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB010EC8E;
	Fri, 12 Sep 2025 15:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VVI40tbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013050.outbound.protection.outlook.com
 [40.107.162.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7D10EC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWO3xLX+X+jfpz6r6hlHO4rPgmZgqmOA/NGZMFuW6elnhoxyaalnYnQgnbn34U6uZUgs0lmE75XTTrUGdPU3Y2mNXq9rQA6JKVUhkTA4OuBIxQ+3IiMMl2jxRx0r6TLdV26nO8cy1yxOIHJ6HSKYS89f9T3LPUyaRP7xMShuIIwHBD3fmfeO1vu+ECJ5gOMp5TFTML/iyKY4110nzvVOpX8vb7ey5vkMZjHmsdQ6/89QzreqV9uTSCnJ02AotTgkdMRUpWxLGCSmccCfRNgUNQs7ziWv/TA4n4gYhAXYa1Jt/FqYtfW9QJuCANT26WScLv46hG/DiZl6ejJSxUsHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qomhk/EDTtBjrE1lkeg1NIpb7rJMXA0DzPSJ7PFPv3M=;
 b=HIEiMheJ7rayEUcrI0q9yrBWihDxcNkLAG0Sz+SJMCchTRefqjj6T3bB0YP6tYNMofzLvOe9BlRPmXtB4GC2V4nZkEVUsd6tB33X22osMJ87Qqq5t66B9rHl97LL62y7/GS94ACPyuCXExtSG/DzIPWsxuEOoRAw1N8V4dxpdvRSaXTkw+LX65RJfXtuMY3OzLe9q53Q5n4yIaWEC7+l540ouJ32t9T/OyqOeoUY6afiOLlVLY+235A45OMHyufB2Mda4SdjfECMiFPLzBoL3w2BMgYOn6eI5ZYzgi5srhTbc1g3AA/0a5Uew/ANepNc3nleCnC9Ambuh5mQF8NvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qomhk/EDTtBjrE1lkeg1NIpb7rJMXA0DzPSJ7PFPv3M=;
 b=VVI40tbHOpEwMUvzZTcWnWksaeOXAGKXOZjp5BM2coeEgNuBZylhQGjjp58O/y2OxbMPFrVhsuozz+40AortixTFuRERnwz8lximPYEnN22rh1cF+YkYz9S9+H1Ux4zEO8TFfdeccYXV+NiuHMzROY/r4cdDSfwJmN1WFcfCfRxpYMG6Ao+EfI0NFc/29mF6SB12pfIIDepRPAGhmml+qeWtvalVzaqT96hDy93GEQ6Z+vgxF9WZ/LeIh6AaHwP/wC0SjIlvPjeiQjy5TvRBr7W/d5m+/Xsm8CkbJtyOA3MLNlHA3NZ4QPBYbx+1otJBjL5P5zyDplM3sumuIHUjOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Fri, 12 Sep
 2025 15:22:31 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 15:22:31 +0000
Date: Fri, 12 Sep 2025 11:22:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maud Spierings <maudspierings@gocontroll.com>
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
Message-ID: <aMQ6rZJzbMeBrrFv@lizhi-Precision-Tower-5810>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
 <aMLrrcBZ2Kc4o84t@lizhi-Precision-Tower-5810>
 <3960b845-3838-4690-b01d-21e61ccfa8fd@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3960b845-3838-4690-b01d-21e61ccfa8fd@gocontroll.com>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c15015-23bb-4ed0-c32e-08ddf21030df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ztXdxjsjfpAG43dCsavTpi3bEmIJ00seodJHxilZAVOZ1i3cVVYkWbTrYHJ1?=
 =?us-ascii?Q?AkJXu6xoyuv3SWfMcZBCFTBbs8XKsf6kS776nBbDKVec9G8DP0cYlpI/+/fS?=
 =?us-ascii?Q?GUGA5XwOQz/fHZtpbe8+fLquy0JApAt0+34BCNsFJ9QBm7AiJz8aiqwC3hrN?=
 =?us-ascii?Q?yjKn8Zq5ft6FCnVWGpm+pvbVdUAVrtanXMXfpDEd/RwmZ7C8IebaGQsc2Gk0?=
 =?us-ascii?Q?A8dD1Q/8oXQAJ2YjVWqqAGGAUO5noo+2kZQS5LTUSQaUHz81mqncad8m66oB?=
 =?us-ascii?Q?V0ZHnSK8UJyXPGN0ePRvQMp/ULiprFsWzdycZuNL9WFAQLUxt0aRMIX/xyp8?=
 =?us-ascii?Q?sB3ObG1NJqAoJVgOtIn9RSPtadi2Kh0t6EIp4viTRaeKw9XvwRnGLL+dEV9t?=
 =?us-ascii?Q?FXXUwGxkRRVVYFuMsjAmH+UqhkYkiXYIDVtpogTG2VVCn6GH6VdJJxUJaT8W?=
 =?us-ascii?Q?i+2G1rI9l7KN7XofYmDAz2ghFFNCiixVdU6zGi/HKq1x0r+YaB5Xjm8plV0/?=
 =?us-ascii?Q?+y8PjHm6lUpju3+wIqFZ7a9Q2mosLHizy9adP/2NoRLNa5uYLas84/UI0KtX?=
 =?us-ascii?Q?o/R2X50diPuY/uLO8VoZnoI/8Br3s9l5LASf9so0QP6RmqhjcD0IZUriYXcg?=
 =?us-ascii?Q?HVToK1QgXC/I8+RjCUld6IjhoWYeQvW/I1CqsLTPyr2MpF4Qrmw5mQC1hXub?=
 =?us-ascii?Q?seIs9plpN34IRn4D5PrnMz//h4L5e2g/TFH7l1kv2SxXXB0qISdDcYiqSg+V?=
 =?us-ascii?Q?MRS3vSxFpwUOBVBVnIwNFpI75/t6CmF1E5p+VkD+bNznFSC2DLQHA+sNQ1uD?=
 =?us-ascii?Q?hF6aGsZctR9HRuzehaBaqkRNNc0ebzhNd0qmb0yUkoXXSW/CU/J99dFwevB9?=
 =?us-ascii?Q?GzbFSiSfzZ8jmKnlTDGJc+OGnPDTVW7nnEDdBHJAYfc5i2DIS5QJF07X+E+b?=
 =?us-ascii?Q?qDxODGMgzKbUIuJrZrnXwOo0t0PVFXcUTBNfNuKUlKTLUEB4X0VsUbtatpRW?=
 =?us-ascii?Q?b9sUYQ1PO1TBYgAtlGvvj9oq/VVLFjOturG7rdSE2WsXZhr76P1Tvrm2VNhb?=
 =?us-ascii?Q?DK2oOLqoyRyXqqSgYDZKCgIAUPi3RE3+Ys8Zp1akXdlmjNJzJibYJYbSFX4g?=
 =?us-ascii?Q?8ldMFl45uzUk65MHhL/XaAWkySYyqZj3H2z3Me0fLNjuSWPp21PNuXF2+Byl?=
 =?us-ascii?Q?wyxHVrBhWLERJmmA2whuPbecskg4bK7TgPYtEGOIGskAW+5kx6ssCSfwAQC3?=
 =?us-ascii?Q?oYpFuMEsAJh8zfC7C5ihAGOzTR5zdEmcTKrb+yo1duadCAL1xFuNTiqFE91H?=
 =?us-ascii?Q?rHebCGaPM5rv5l3Ye+hgUU7ZrT2Ad+n/kzNmOT0Gzne9rymDFyNe/oZ+ASgs?=
 =?us-ascii?Q?seocjDt5GMUJhd2eUaJVGr8uzjvIDp5WEhFtkYiXjhBADiugjfXn7WZwtUiv?=
 =?us-ascii?Q?t5h0NRD8VPh4kp53hHLVdFb9J9q1qwIY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQJBbt8b0WuZisJNT/rsg9pf5bj0vgq2rvqPR7RFnJPZGCJFyEcM1jGNVHUm?=
 =?us-ascii?Q?jd7ouOVW9dH16duMHqRKmS8mYZWbPOrKfbYzJ/11DDV4y5it4yNhH2t7KozI?=
 =?us-ascii?Q?2pa9AurBR/s5uZcnUDQFdJWL/NDgb+ZuPqrQ2GK6Ap7VOARBQkOLGzeBq3WG?=
 =?us-ascii?Q?FQkfeXESxC+4Srz8qzpK3JXEQIP0gC+1z6g+ql6sQWZAxIdgc3f2ai5J7NpW?=
 =?us-ascii?Q?sQdpq2/05h0ChLP2PSeANEyKggHvAYyEvSQNfoPIim/FnV+e0xFeq9lYJYDo?=
 =?us-ascii?Q?d4uF4mjDonZvyd1aMcXch8YwbSnK3QdinZVnDM1loO9gvM7mWiMCK86okfpi?=
 =?us-ascii?Q?ItUmw2mADoArHNHAu+aBWA6RUlVPTEgOOni6KHMnggo3eXtnMg+yeJPBY8yc?=
 =?us-ascii?Q?m14yHN1nXdZg7SGeRIt8pMfQ3yrabitNoHM3T+4UUVKxAKfXdjw+VlBjOOUB?=
 =?us-ascii?Q?shJjTirtywfZ2B0qSx2y856DNWE7fycJ5RCTYkBafD8vAiJCsNmFPT3yUS3C?=
 =?us-ascii?Q?Y3Tzpis3QskVc9f6wMoJlorE2gRxc17eOKfw2NhpoNrBLdmYhjWAXZLpHDzc?=
 =?us-ascii?Q?dgk8cPRuhxE2gAFepjNWEpIMfXJ3ghCWrQSfovgndzityVpiN/vsTRKTFqch?=
 =?us-ascii?Q?fy/2Av6XsvAnXhCSSrSa28BN3hJ4c4KOvfAtiw9vWy8m9C7v9gF/5uwjHtfp?=
 =?us-ascii?Q?FfEdcOwQWHL1LT5mrAgQnfDK55/JwIsSVYVP8B+paIpYhiVJ4EwURujyBhLe?=
 =?us-ascii?Q?spOfES6zi9ggtXFl9Qbkgv8KcMc05SXHf1kLyIN8BzWPWA/q+s8TqOIPUr8k?=
 =?us-ascii?Q?kh4eExD0DSwFxQUflRxVtM2r35m7osCAy/Pqv16S47QGu8hrahjGeV1YmNt6?=
 =?us-ascii?Q?FKn5zrQ5D05AKvF01SS2sA33SjhZE/KRS0Altde+XirVV2bOJhqq6zVVZbwe?=
 =?us-ascii?Q?rIJno+Rq1vXEWcG1J7dUf16vBAFX+qWmPUuDpY8jq0ZCbRHSIF2HiHqy/Kvg?=
 =?us-ascii?Q?FQTacTWtCsgdaOMgMRwYzMRggXe6dyX3Ij20Mm/2ayqXXwec3r0IBmzS3lsR?=
 =?us-ascii?Q?GbB/9biOb29Xdz6MgxN2oL8mf/oHtUXMqDc2yyHkGJq+Qjx+s4r+VPJJd4Ey?=
 =?us-ascii?Q?oMC7k9c+/xSbgHfFBOfRTfMZx46b+3OybuF8NyiIdkfdgJ2oYHXGYHDk9GQA?=
 =?us-ascii?Q?ydW5sjdCE2orNb3it+8huUQAJAnGMoZ7wdru4TL3fEi8Xl9nLRP8bPyJCNkJ?=
 =?us-ascii?Q?uq/0P/G6a/ROMYQ3jK3doXv4qtN19PE7EVqtZEKb96FWIdKUHvmjF2bmrWfd?=
 =?us-ascii?Q?8sX0msiI76kMd6V8GPFfxlWl4JH9PmQdlwrLFiAeFKdWCYZHkr9Mr0TyO3S7?=
 =?us-ascii?Q?JTIi88I2YC8RDnaSS1lt/iNBdCSquTFzDMoG/5dgxIkQtTbeQZNDGmQOQ1d8?=
 =?us-ascii?Q?96GbjMdr49m2qUKx5+gFkbup5AtVMIz71j/nvadl8j1iTXmD+1x5eefIdD8t?=
 =?us-ascii?Q?llrFCarocHpNQ1thRD9ZqkMjPa6r+KN15N296eRq6vmWM3e9Ov5JvWrMmG9f?=
 =?us-ascii?Q?2OsWTBSOen5GE6mHeIRI9LWY7Qh7cU/IqzN3ETxJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c15015-23bb-4ed0-c32e-08ddf21030df
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:22:31.0673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC2UK587AmZoRR+U6eRtLs1M8LCUQqWENgXq/fpBqztPuemQkPV0SW6b+nyDdtkTmDZRF9xqM8mXAa+Xzv14Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
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

On Fri, Sep 12, 2025 at 08:17:09AM +0200, Maud Spierings wrote:
> Hi Frank,
> Thanks for the review.
>
> On 9/11/25 17:33, Frank Li wrote:
> > On Thu, Sep 11, 2025 at 09:53:18AM +0200, Maud Spierings via B4 Relay wrote:
> > > From: Maud Spierings <maudspierings@gocontroll.com>
> > >
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > ---
> > >   .../bindings/leds/backlight/maxim,max25014.yaml    | 81 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 86 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e113a2ad16aa74f982b9c2ea80578aed2d9424fe
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > > @@ -0,0 +1,81 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Maxim max25014 backlight controller
> > > +
> > > +maintainers:
> > > +  - Maud Spierings <maudspierings@gocontroll.com>
> > > +
> > > +allOf:
> > > +  - $ref: common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - maxim,max25014
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  enable-gpios:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-supply:
> > > +    description: Regulator which controls the boost converter input rail.
> > > +
> > > +  pwms:
> > > +    maxItems: 1
> > > +
> > > +  maxim,iset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    maximum: 15
> > > +    default: 11
> > > +    description:
> > > +      Value of the ISET register field. This controls the current scale of the
> > > +      outputs, a higher number means more current.
> >
> > Use standard unit. Do not use register value directly.
>
> It is unfortunately not just a value in Amps, it depends on the hardware
> design. There is a kind of "default" table with a 49.9K resistor, but
> depending on that resistor the current is different.

You should calculate in your driver. if 49.9K is dependence, you should
add xxx_ohm at dts.

Frank

>
> > > +
> > > +  maxim,strings:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description:
> > > +      A 4-bit bitfield that describes which led strings to turn on.
> > > +    minItems: 4
> > > +    maxItems: 4
> > > +    items:
> > > +      maximum: 1
> >
> > led should have standard interface.
> >
> > check  Documentation/devicetree/bindings/leds/common.yaml
>
> Thanks I will investigate, that may indeed be a better abstraction.
>
> Kind regards,
> Maud
>
