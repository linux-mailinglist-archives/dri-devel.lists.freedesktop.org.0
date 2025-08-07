Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD12B1D7F8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733B410E830;
	Thu,  7 Aug 2025 12:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FRj2yO3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E010E830
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 12:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkquX79G4VsUB3ROsnOWfXrvjdqt78tQdQ7uJgt+g86T27w14zl0S0G2Cs1oX6+umQlP6XpW3FauihGotO7LUu8322y8bsAdae274MGHNDImFLmwz3+i0sPLdqVkf6ziaDHD81lwqTTZttTX849jnj2fctzlxmzy7koUeVUm25QEB8r5NRPcqodXACij+gwaTXSLgfu9xOuIU6he1LdERdnmf2GnINou8LobS8uyU9VXOauTRaOCUr20TexLWwUN0ub2Ih/caPNEiByFzD5BvsyZ5avZAQqfSXwLjhq2h89c18ryxv+Gt1Orij+9eDm5Rv7HH0zOauzp7VoYVdz0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQzz+dwjhL7jxEhO9jDaLg+TwcqUJpFSv9VvX2uZ3wk=;
 b=I7mjsww8KwzUbZuauBNcNy3gguS2n8Nwc4l6ppCnVsCDIDoVZUCZkSx6sqI9l270mSak9inuFwo25YT8a+JKIVq3EnRYYKQTvovsCrtz2n8dYvqaaJGn3rxeAQz11zGLNvRltXNGVgsYgZNLzJT+1HHlLc8dqLBzUg/27eZ03rGtC0xbxw28JFF1lbXbYPb5tkAJ+OlAu1f6EEmAWrqiaF9AHjpbxSBNZCk+q/TIEW77YUnXQK0gPYejoyoLC7Oo9p3RWsDJak5AG/8fHCkw7TcF8RrVSVQLqRC3S3jNwNnlEU4Hvlx5UkcYspNJkzB/2+ERDpSkGDFHKXDBxrsEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQzz+dwjhL7jxEhO9jDaLg+TwcqUJpFSv9VvX2uZ3wk=;
 b=FRj2yO3NpV7syl1isW5FhdRVnegsixw3NCns+1SLDKcsbejfWvS0+WvTQTEc02BxmPEqc+G1JxGzqPQFD4YYz6mJ3povoYemvfUwnTVFjUzwbHBWrSEyGHrFH07APrPN/Oq72aCdTGnfxDRN96ImLNPEqXCUgMILfcm4/moqWyfrNf+KTRzjfNZwAzLnCrpI+1r9kPsIO8urLym42qPLFoJkkCSTjTC55KXFpuNv8QrdN2oAZxDhTEHBJ0bTjpawHJ6jOuG1QU8R35T4FQp1u5NtJWmGK+CmcPsA5p0lGsYNVzArYZsAkUch45U+qFhN1TCXN/N+kn1dquZb331uiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS8PR04MB8246.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 12:33:49 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:49 +0000
Date: Thu, 7 Aug 2025 15:33:45 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dt-bindings: display: imx: Add bindings for
 i.MX94 DCIF
Message-ID: <rivixxb2o2tvabkmvh52xm4xql6xvpfkismsfjpdvmjyxt77ll@3c3hf5hxns2d>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-5-laurentiu.palcu@oss.nxp.com>
 <aJN0cI+VEXjI8zPC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJN0cI+VEXjI8zPC@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS8PR04MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: bed3ae0a-1466-47e3-5af8-08ddd5aea8bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8NpAYb8iZoRBssMxTlq16Vvwnd5oDtndXUmj3gPazJSEu47WiylKjDpTAiyp?=
 =?us-ascii?Q?faouPKOBvjWqJtx3fzxu9pQoUHwSuQvYhCnlCMkJQbG/RmwRv8EGMCOqAk71?=
 =?us-ascii?Q?zq0YN8f8q8Q+MZli8YqUV7V3sOwFU/bBNZ5GhJm03F15Yk02vYqoe20hpOcT?=
 =?us-ascii?Q?h8+nW5789e+CdScHVeW6WRgX/BJAgPzOGhMq1tX5OcnG1HHhqKxEun+3tFkA?=
 =?us-ascii?Q?JEP9SH6ikLmvFW75M6uDO2l7WyiSVd55f6xtlvKVfvy6KXGtTIr1WSW0rybc?=
 =?us-ascii?Q?ovDGIwcFuHuWtwkHMQYoMMN+j12Qu3mVfmalyaK5ccUapi+WpiiwO+uU2SIm?=
 =?us-ascii?Q?FowQfoYoEvyFK5KUjICPa3ykF1eYWq6GI9qyVqjiVprmOVfqdFbPCEIZ1z/I?=
 =?us-ascii?Q?EdkbWcs9Iq6cScPCPRIqgOsulH5pWeadl9o/cfsO0mLsbw6Zjt/gVlcFaJ2b?=
 =?us-ascii?Q?oizepv5EWHcqucKc+xSDqnhQ1IMrrWJAVTaw8vgpfUIwd4FEOyIc3Ws+UdLd?=
 =?us-ascii?Q?2NdJSzn6hlCP6D7zpNz/xYi58e7qV4eWhG9AbRRJWOe4oCjrRDNGmPnVAlKn?=
 =?us-ascii?Q?Jr1bf3f96uJ6N+eaib5Uc7uLuaf+/VpkCOSv4cOml4yTYTq2PANFz3Ctm5vK?=
 =?us-ascii?Q?hSARKFgjcEMEnWwM+29VToKw/jXOS5gpbqXQPuYpHC36uguvbnvviAY4c2xF?=
 =?us-ascii?Q?BKQjD5lPwQq5iNQ/PFK+p2Ii4wpssXvW1N/IQ4BnV4j5ib5ZiFyrtB/R4ewn?=
 =?us-ascii?Q?uoD8rJfIrJbuz7zFg6oRiMXwhQMM/iYfPgX8FoVahDFA9mllEMcloZXeGAya?=
 =?us-ascii?Q?b8tT6pZyluI96Pf0aJh0+lmF6Tv46ka0MK79hmMORJcEsEDO5JLsNOG7/3xa?=
 =?us-ascii?Q?yEbYPuTxWix06Ndgy6eM5Wy3grYBmjD548aur/LtMBVbG3t3VrEBLenD01Zy?=
 =?us-ascii?Q?EoF7lyeiNFyRjsf+u6WqUamBnFuzvFRpVR8PI5hmsSb0PGRbvAh0ouw16pSh?=
 =?us-ascii?Q?Nam8CJmGMZiHT33NmTUfGllYXkMzvz+OYaM+2iu63rbOf1+asJWjW/lTOoAk?=
 =?us-ascii?Q?hEaYOnsu3gj2aMC7InUFLQtfXbHrRMEtm2KVyQXNHYA7OqEke0oroz59+COI?=
 =?us-ascii?Q?G1KDZGbNDhhZQxm9zVnsIZUUY7nFloXC5W6ZdYGSjo7PYKns1QdhiLezNUGZ?=
 =?us-ascii?Q?IcCzLEcoPVOCA07mowY2OwjAn9JkcAQgIOTqVx2KL1SaNMdqql8vZhCexesy?=
 =?us-ascii?Q?Z+fZB7HNkSF3c790ipe0m1ST/S3TAwcx4vSawDz24rO7IxjHeuJUyJn2Ho5d?=
 =?us-ascii?Q?Cw8zT/A4q5AW5MKFxQmkD1w6Klea0kRCvoKaD0Gj+BEyH25MdUfIkXOOEcnW?=
 =?us-ascii?Q?isJajP17fR4L5aEo3fXTB7A5bIkE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVRyTjTniHlLx81TQKCtkmVaeQdDfkLeLGo5D8nN/Xws0gaI5yQhrvrbUZTS?=
 =?us-ascii?Q?5BDIQMUFLkqwIHm2I3cfYGuR+L00NQFJGgILVGLZoppiivj144q0sq21CwKk?=
 =?us-ascii?Q?VB8ke/b4tH4Sqsx5B/v44Tbhk04AZgkwbBxQ3no9X5uHAeWl2BGmb2+ZovyL?=
 =?us-ascii?Q?247rkP2Qfn2HxfjZfkhdjGpCJduiYDoWRXF9nr2iBltdlLkxV3bJQvjCY16x?=
 =?us-ascii?Q?cVbokhFJkZoSpmJnJZXgmD3l4Psz6LW7j3GYtHGdUAVj3A6c+YF+gresSvl6?=
 =?us-ascii?Q?4WDdwZ/4ZRxDEnx3wO2wUBSxAC69KAVPZDmsRqWr2jFa7OYlbTgMEYkBqt6p?=
 =?us-ascii?Q?H6xE2RyFhgifcd/+4Rq08c36sNGDWAHQBdWNEeQez/UiWgZxQZhx8PqeAjtu?=
 =?us-ascii?Q?nhtq+FNpQ9EXv0MrqVo0HcTs0kUuELJt1hf4OGkEEAmlS9W0r6Alj5VsnBLR?=
 =?us-ascii?Q?KeNY7+CudxbhDdAlVZJnoEShY7a/bLWarDND9DR4Oe3G+YhQEUEg8OABli0H?=
 =?us-ascii?Q?px8nuD+Fbs+M8VIphwAWdqgtwDSPwSX5kzyhNUBaMXc5WLz01h6wq7agNRcU?=
 =?us-ascii?Q?+zQypPZ3a6BrKt2/nQSwuplgkB/u1VEGrPzOU61Jua1UoQg1KTNVU/CWeeya?=
 =?us-ascii?Q?nN/mYLfUQPaBcJRUt4B2QxlSj5f8vUNhV+Qy90HfsWRn6/4K//GyfJ1Qli3x?=
 =?us-ascii?Q?AI61vgZdH4BH0/90OxXCVmmE8FMKzyXYp//4MtxuVlR0eI/eswF6YZcWmjqW?=
 =?us-ascii?Q?C+DyVkUdNCG9NkvZF/6y3Pp6zY0W4uoP91UJjYPq62IUUiYJ636fy4w6eVG1?=
 =?us-ascii?Q?XNQtXPmxUW6S8p/vYcM0NdkD5uUmujVRE/USD78YFU2r+JPcZXW2jR0XdA/k?=
 =?us-ascii?Q?9/0OEEK8fKqxUFgNplFsNGPKbeMVuMkVC2JP9XyjZpQBF498pWGdLuHm4uow?=
 =?us-ascii?Q?i0y1o2FJ+pmjjEc5yFY7YvnkG7J0d56e0YbSMC6PUx8MBwkOBSdyZAwgnSyR?=
 =?us-ascii?Q?MBHwFSy3GPMrMcOQ8qPBvObM1kUC0K3mIgqtQwE/PNIzfoNd3cmlLIxvYee4?=
 =?us-ascii?Q?eevu4becPUbU6+qKHnfteGbLz4sjJ7Sug2v9INZCgHF1OatJiLh/5lBvOTRx?=
 =?us-ascii?Q?s7EVpN1HGdWZPONxPY0vabWVIaJ8ah1ko2DWdSoxEtibXIEQXLBpp7BbjD7K?=
 =?us-ascii?Q?A5ihhW6rCDJPxem38uO4tQyCBwXlX2+YfXa8cz6dpMc2sZEm+ged/S6euQIl?=
 =?us-ascii?Q?v2Wz7XagLCx/xjBqtxeqfTFrepFufk3Gq7CyEYDrhy/oMlv38lI1U4wYqi6F?=
 =?us-ascii?Q?zG4GatRQgV1loORcdjxRAM7LiCR0zX81sDu6KfV1RBgFiDzBHyKQB+7ZZweo?=
 =?us-ascii?Q?ETB9oaFQwkuac3pgYBwrN7DSdqqcRsV4flIHCBp0kZYvkWt6CWPZoJgqInX8?=
 =?us-ascii?Q?XEsuEfbA+VzzJLHcmSYrnjP1i2pCjuyaPAbNmgHuzO8ziu3ZoTITLzdfykp8?=
 =?us-ascii?Q?2RTtohqEUkRtc4/ZHPiAxbISn+qV+cbAT5YgFvd5jUnmz46mDvDsduzB7Nj3?=
 =?us-ascii?Q?TMj+2mQUtNH90PrYnKg571jBMDr27va7ZrdzzEQkKW13eoiPZ0L5e5gBtTSn?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed3ae0a-1466-47e3-5af8-08ddd5aea8bc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 12:33:49.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYakl9TrJDUPKZDcv1xRJuKa45ckDIJPcNcYSIBbmzgT8hOi1aTnnsH6dLHZ2tlEVajHGj53/0f9GiebOGiB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8246
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

On Wed, Aug 06, 2025 at 11:27:44AM -0400, Frank Li wrote:
> On Wed, Aug 06, 2025 at 06:05:11PM +0300, Laurentiu Palcu wrote:
> > DCIF is the i.MX94 Display Controller Interface which is used to
> > drive a TFT LCD panel or connects to a display interface depending
> > on the chip configuration.
> 
> nit: wrap at 75 chars
> 
> >
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> > new file mode 100644
> > index 0000000000000..54419c589ef74
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2025 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX94 Display Control Interface (DCIF)
> > +
> > +maintainers:
> > +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > +
> > +description:
> > +  The Display Control Interface(DCIF) is a system master that fetches graphics
> > +  stored in memory and displays them on a TFT LCD panel or connects to a
> > +  display interface depending on the chip configuration.
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx94-dcif
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: CPU domain 0 (controlled by common registers group).
> > +      - description: CPU domain 1 (controlled by background layer registers group).
> > +      - description: CPU domain 2 (controlled by foreground layer registers group).
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: common
> > +      - const: bg_layer
> > +      - const: fg_layer
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: axi
> > +      - const: pix
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Display Pixel Interface(DPI) output port
> 
> I think need
> 
>     properties:
>       endpoint:
>         $ref: video-interfaces.yaml#
>         unevaluatedProperties: false
> 
> Most likely need set
> 
> bus-width, hsync-active, vsync-active

We don't set these in DTS for DCIF. Hence, we don't need a specialiazed
binding for the endpoint. 

Laurentiu

> 
> Frank
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        display-controller@4b120000 {
> > +            compatible = "nxp,imx94-dcif";
> > +            reg = <0x0 0x4b120000 0x0 0x300000>;
> > +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "common", "bg_layer", "fg_layer";
> > +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> > +            clock-names = "apb", "axi", "pix";
> > +            assigned-clocks = <&dispmix_csr 0>;
> > +            assigned-clock-parents = <&ldb_pll_pixel>;
> > +            power-domains = <&scmi_devpd 11>;
> > +
> > +            port {
> > +                dcif_out: endpoint {
> > +                    remote-endpoint = <&ldb_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.49.0
> >
