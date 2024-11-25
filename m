Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB39D8251
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2210E3B2;
	Mon, 25 Nov 2024 09:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Nbp/n0Q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAA010E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCXqY43hy4T3TJBKowadQZPL3p0fk6jK8PFafftUR78Y4wUiSsXNEgyoj9/OKm2zvlLjDrlmOedsgpfFJfEm0GFl8k0z/48fAFtK7VyYbkj17Gcjn9MHFXHSnFBU3rrbS38gKQL5vuuyO6ezNkd47L8C/RL0ZdBrcibxlxjZSb4uDrzvMkOKp7okOYKSMJCmquFpk/KFHobni48TgOKHSzk1LUFXTvnxdqpoZGddkvmskUIZtBhkFZKMGJLvs6WhCmHEtoLVV7cJkNWRZbWWYDfWigsPm3Y7VwJ+2bvF7FpgZiBworDpMlYqjU1mb1atVfH749fXtczClv1P+uYSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYmvrn33uIddjt+cJNpDrqkmjnSQ4Nxd+Va0+O73XSc=;
 b=ku30e2aam2yIJM6o2gr0KNM8eIHaUBg37EULo0riXWU4Gr24ylsa57YRK6uCkl+6+vVwXweayLbzLvbzvgbSIKE2ZFzUEPwcHSNc9z6F5qNnvl0EhRcqLK1at/mL2dEn/SMNZ3HMqEgQIx7oi+lgX6U4r6Q+zEIVOh4q+7p7QxIiaudDBg31Ct5bu3lKPgBYGVBpPX8+aBB6HvIhs7BGyyM0JGCXppM1EzpX80aFMF5L671sOizbWKeavfwYbqKCceKmsw++Kc9pSFJckbET+cTg6D/vHMMOWDaryW0DmjkhIPPu5npt39nLqDqKrMAcj6HHTW8BD35PvtKZj2ghPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYmvrn33uIddjt+cJNpDrqkmjnSQ4Nxd+Va0+O73XSc=;
 b=Nbp/n0Q3tNa9MTxH9plF2nXLFFQ20XRcjHBrBnXFbOSEL4E2bRwaO8crXanYZ9Q5EHIJ/LckHfb0GRksOOOmRGfD+TGLpwxEB6CeqP60WmeB+dW8WP2iphtfNkEO6TOKHmBlbVYaFnX1U42n6Gffzx6aU31BxUM3Vq5n6Sl3YOLfTF7ZOrOMeznvAnU8wFhWp7UEwExdoOYTuGrmdHUZ3jm0Cvjs1Ziv+7Shw4Ml+aRxVcYn6Ny1Uvvdpn5yx1W325gfd83l6w8bSzBYXylJ2MYBWCEEbmyN9pwcsAhOiyOrE+k5/DKsJYzUNgCWNBlz+D9maS+t/nSSe3P1o4uqKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Date: Mon, 25 Nov 2024 17:32:58 +0800
Message-Id: <20241125093316.2357162-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ce9b5a-15b7-4463-8d6c-08dd0d342f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?64cQcs0lqb1Sav5ruAozL7as/2omijNmhDmMIua9SRRB6cFVA+NGr5ULdEj5?=
 =?us-ascii?Q?JsMr+zdu/rPCzEI+yi6u+KuWzigiICFB46l9r8l/SD6x6CgnMOfi4Yc3ixmx?=
 =?us-ascii?Q?j34xjYfTXK2ZGRMIeN8+NR0lOESFinfBSoQ/Xh8aBzh4T90bKhau3NHR59pu?=
 =?us-ascii?Q?b3EY40J6/giBu8v2iMoFfMf/cZXEyAQC1PQSctdEGedpXI8KUI/p4tVK8KCD?=
 =?us-ascii?Q?zI2Fxjh3LrEhW1SX9p2qe/2CDuneoAKZ8xavAflXYUXK92A+b3IEVcVrfBYL?=
 =?us-ascii?Q?RzZOYYKkccL5D4HLynZwf+SXqoSngZpwEQRRsl0McIg0UEsQvcmVfYaEN7FD?=
 =?us-ascii?Q?5/r8Qfje1kSJK72FCC8uAy7Ll9jzuj3fEJpjyQoUvSljkxxyQJewCg87Gr32?=
 =?us-ascii?Q?Xu8GCAsdL+UoyZWb3ahtY/DqH/DXudQ/hTj1FBPlJtM+5bhVBd/315KC3NNg?=
 =?us-ascii?Q?6J8svMF+INH3XsRttRU4IhYqw7qLwAYqtjitzVZD8Z4bJzAzDRhUJwtmsevK?=
 =?us-ascii?Q?Bkz0HYQ2wMq77cL4yTGgo5w7s+JtwSFxHMKuSeta+sWA16ROYKnd+1O1wHi5?=
 =?us-ascii?Q?P60pkYv5gk5WGGDncpgaNe5rhUAo6Pe2A4JZEPYQiMasGByFyjvkdtZ1Ao0t?=
 =?us-ascii?Q?fsI0owNC7kKB1XQJO/Fbz0f4wBVyUNXmhKx+u6dMbNZBvVBn3QVupIYLZeWA?=
 =?us-ascii?Q?aU9doVekeVnELWP5SZoK7xuPI9CpgbHsxrr1xyoEE36Z3HiFuVfzV+r/Y4tg?=
 =?us-ascii?Q?aDw/3EpV2T6SjtmBbhIpGv179K02TBsxhfbbrd7DcKWZFBwCfIegYcHn5zBd?=
 =?us-ascii?Q?QNSGeO/aU3gZJp85ytkUnfUcqdsbVc/jn82mWVi310SKSS7DjQ/eXYowcnqg?=
 =?us-ascii?Q?j98bYVP5BFalrsj1PzaqN+u7veQMu1LDUMDgT/NiNQycRJTjZg/Ht1Aq5y5Z?=
 =?us-ascii?Q?xTJu+849IjXfUh9bTksvLnkQ7d4ukKYu8fWDmZberIUP5yN6oI2mHvjN61ta?=
 =?us-ascii?Q?FDC5TsGHOlMNcXl8rhazk6l0UE3mGfve04gr04A/bFtCRKKn4UI45kYfXe3+?=
 =?us-ascii?Q?S1Pog2y2HK6lzdye2wTe4KEXo6jcFrEB/o/jcK4z4ogRAWedpBNy531nQa35?=
 =?us-ascii?Q?xLrOupgoN2Jd7h7wzfBBMg0j1i+qo2Nurzpw7SZKeHlPQPzh1D2GbX8fIWSG?=
 =?us-ascii?Q?4x18H4IN+G3v77iIeJ+ocpAqDaUyQ2geiKTO+tzupn4UxLuI4Pgt9W9Ct1vk?=
 =?us-ascii?Q?Xu2lphPrHaOyaP9F6DY62MumW/eQSChOAcb91KwqOYyufLvKWH4xJvr84lgm?=
 =?us-ascii?Q?VBQaD/ceuIsxHIscQUVP4hqK+/I8OhpOeyMRAxgHz46GRLg5gBlSsZuyjwdk?=
 =?us-ascii?Q?ZLMMgJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTj07+AsBTuIY7qXJS5zkUEtc39+ZX5TmaePZrZTdhpyN4St7IQ2RzRzhJpr?=
 =?us-ascii?Q?XWU6kvP9e4+8MRGmQwrgzia1aiyK6rJtUewFNNgo5e1thOdukL5atqq0QjcN?=
 =?us-ascii?Q?CcG4CpJ0j3Ye6Jio4NOOOy5h0jJc28F/dc/oU+BLaJM45DXLLMZpLDwB4Mf4?=
 =?us-ascii?Q?Bd4aPRFnnhm3wEZvx1FxEXNeka+ac4VzAAyLRAGJ9zC07LzTtgPbSYLPxbmX?=
 =?us-ascii?Q?A/dwCBKreQvxatB3vO1/FmyO5UJMeLDHkh4iLkjnuByIBSsrIDKWWrS+XXCa?=
 =?us-ascii?Q?LEWLwtFO0Sb8VWWPWOBX2krnDe3LoxDQ2kexUv+iSnTIerOe7VzOPrcxPbAS?=
 =?us-ascii?Q?lFVpVv4hzky0q9M72RS28DROFhP6JPWuHG6BVQWeL9YI/Fbw8wtzATPephJP?=
 =?us-ascii?Q?OK3vuSzoDqzfnOCq0bce3GHaKNVytJ887oo2AgMjf7rOSIAf3p8HHgvso8WW?=
 =?us-ascii?Q?j05du8qordPxurVmaY/01fDMjK3S2M8jusFnuIt4v95OdBb3gQoOUDsrJC6U?=
 =?us-ascii?Q?8dPtizwJbp12SdwOy+TqGXaF49tOW+xoyn8IBScUFWsag/5Y3zyf3zwBEaY9?=
 =?us-ascii?Q?bleNhQTeUYncgrJcW75VNT7XLMP29NPK3vL5eAtOpjFx+i0Q8Drefg9FEBnX?=
 =?us-ascii?Q?fheRxET5SdqIqswLNsuOLWvc5rY1yv+FZmJqK9OKjJhBm5+/V79HcdloBn35?=
 =?us-ascii?Q?309WvRRVl2ERl1nd0dVCsCgeMIOf8l8N35EB2/4MVP+VjHEAjM6QcKyuxO+3?=
 =?us-ascii?Q?//zvo/baqEEAsN6Vqdkr2XYQ+gefEhpK293y2RzmEPo17G/LfA2169RGFWGS?=
 =?us-ascii?Q?LraviFR46xJXePp+jKql/NERy3RLZHo/BSDRinm2LU7cB5Xe3S1xcPmo7Jvi?=
 =?us-ascii?Q?0kWL14+WyJu12ZVbCuKPnyT4ZhPZmGJDGD6RkXgVaul0XjpXq2Z7Sn0Bv20Z?=
 =?us-ascii?Q?Cbx8szK7FnUOQWrnUWGfJ3T+H42OdT4Ru/wDqYlL8yUCS2LwC4mhfWjDEiX1?=
 =?us-ascii?Q?OPgZxTbqW6KIrcJheRNtrJrjnr/WIDw6QPG1YYMC/RqCn0XCdp6+gy71+PjR?=
 =?us-ascii?Q?/+QcRpc/suEcw7YvIIvbS1DBF8aUt2tLyv57Uiuv0/wZNjvN+6LLeM2V/YJG?=
 =?us-ascii?Q?84e1ZQ/1FYEO8+fXEZYY2VCkR81pySv8dKOMOTRfYAWfht9+Tvu6HSKOKjUK?=
 =?us-ascii?Q?b96yQqqxOJMkq+OMutxdTTysYdTuVHiz7Fe+R7uF3bwSq0wC4iGwBBL6SNe1?=
 =?us-ascii?Q?84X++9W0QAapV+L1f4+kmgyC0BWbxKGeC8bCCG06+hbuvcpnr9TBlQeyQvZt?=
 =?us-ascii?Q?G284/RHE6mBqlAmICqxcPs0gF99Wub8F/+M9oj4duAQuTH8TQprOhDXMuoV6?=
 =?us-ascii?Q?5HNy/Ii546GRp6DwG8ttgAFEVt7gWa27nt2Wv5yFg9Ua8QU3o5IminmmBZTv?=
 =?us-ascii?Q?RD1lGlYsRukFJ7fb2Q3yMgJr7mqX71NIve+/eCGKW7xvsy6UvaOwUwwHr8MM?=
 =?us-ascii?Q?QDmGgXlAYJ4Xt6ytPS1b5mKBMopnkRPRD0Bv/DO1ov1bAEyF5qOx3+5eZyzt?=
 =?us-ascii?Q?vmHBQcAyrlF69+XR1rygBc6cxJ8OyvRGf6ULwUEC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ce9b5a-15b7-4463-8d6c-08dd0d342f51
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:14.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Aec6o6x2Ca9G3itg1dbUm3dNIUmAUxnKpGcxiTuLlgzp+3vasL9zV/op3mnekQQaJgGHrj5egJg+3//0JkyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.  Document
all existing processing units.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* Collect Rob's R-b tag.

v3:
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units. (Rob)

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Fix register range sizes in examples.

 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 +++++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++++++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++++++++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 ++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 +++++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++++++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 +++++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++++++++++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 +++++++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 ++++++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++++++
 17 files changed, 963 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
new file mode 100644
index 000000000000..095e65939fba
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Blend Unit
+
+description:
+  Combines two input frames to a single output frame, all frames having the
+  same dimension.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blitblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    blitblend@56180920 {
+        compatible = "fsl,imx8qxp-dc-blitblend";
+        reg = <0x56180920 0x10>, <0x56183c00 0x3c>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
new file mode 100644
index 000000000000..21d42aa11b52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-clut.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Lookup Table
+
+description: |
+  The unit implements 3 look-up tables with 256 x 10 bit entries each. These
+  can be used for different kinds of applications. From 10-bit input values
+  only upper 8 bits are used.
+
+  The unit supports color lookup, index lookup, dithering and alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-clut
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clut@56180880 {
+        compatible = "fsl,imx8qxp-dc-clut";
+        reg = <0x56180880 0x10>, <0x56182400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
new file mode 100644
index 000000000000..94f678563608
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-constframe
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe";
+        reg = <0x56180960 0xc>, <0x56184400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
new file mode 100644
index 000000000000..8e4468d91836
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-dither.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Dither Unit
+
+description: |
+  The unit can increase the physical color resolution of a display from 5, 6, 7
+  or 8 bits per RGB channel to a virtual resolution of 10 bits. The physical
+  resolution can be set individually for each channel.
+
+  The resolution is increased by mixing the two physical colors that are nearest
+  to the virtual color code in a variable ratio either by time (temporal
+  dithering) or by position (spatial dithering).
+
+  An optimized algorithm for temporal dithering minimizes noise artifacts on the
+  output image.
+
+  The dither operation can be individually enabled or disabled for each pixel
+  using the alpha input bit.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-dither
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dither@5618c400 {
+        compatible = "fsl,imx8qxp-dc-dither";
+        reg = <0x5618c400 0x14>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
new file mode 100644
index 000000000000..dfc2d4f94f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-extdst
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst";
+        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
new file mode 100644
index 000000000000..97fb6a4598d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-fetchdecode
+      - fsl,imx8qxp-dc-fetcheco
+      - fsl,imx8qxp-dc-fetchlayer
+      - fsl,imx8qxp-dc-fetchwarp
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer";
+        reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
new file mode 100644
index 000000000000..5c54d5179ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-filter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Filter Unit
+
+description: |
+  5x5 FIR filter with 25 programmable coefficients.
+
+  Typical applications are image blurring, sharpening or support for edge
+  detection algorithms.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-filter
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    filter@56180900 {
+        compatible = "fsl,imx8qxp-dc-filter";
+        reg = <0x56180900 0x10>, <0x56183800 0x30>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
new file mode 100644
index 000000000000..9d1dc3a9de90
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description:
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-framegen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen";
+        reg = <0x5618b800 0x98>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
new file mode 100644
index 000000000000..25ad85742912
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-gammacor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Gamma Correction Unit
+
+description: The unit supports non-linear color transformation.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-gammacor
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gammacor@5618c000 {
+        compatible = "fsl,imx8qxp-dc-gammacor";
+        reg = <0x5618c000 0x20>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
new file mode 100644
index 000000000000..2a6ab8a0ed7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-layerblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend";
+        reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
new file mode 100644
index 000000000000..d773389dd0dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Matrix
+
+description:
+  The unit supports linear color transformation, alpha pre-multiply and
+  alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-matrix
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    oneOf:
+      - const: cfg      # matrix in display engine
+      - items:          # matrix in pixel engine
+          - const: pec
+          - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix@5618bc00 {
+        compatible = "fsl,imx8qxp-dc-matrix";
+        reg = <0x5618bc00 0x3c>;
+        reg-names = "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
new file mode 100644
index 000000000000..7115950ecae0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-rop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Raster Operation Unit
+
+description: |
+  The unit can combine up to three input frames to a single output frame, all
+  having the same dimension.
+
+  The unit supports logic operations, arithmetic operations and packing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-rop
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rop@56180860 {
+        compatible = "fsl,imx8qxp-dc-rop";
+        reg = <0x56180860 0x10>, <0x56182000 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
new file mode 100644
index 000000000000..66c12948ab09
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-safety.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Safety Unit
+
+description:
+  The unit allows corresponding processing units to be configured in a path
+  leading to multiple endpoints.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-safety
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    safety@56180800 {
+        compatible = "fsl,imx8qxp-dc-safety";
+        reg = <0x56180800 0x1c>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
new file mode 100644
index 000000000000..76cbe11a6364
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Scaling Engine
+
+description: |
+  The unit can change the dimension of the input frame by nearest or linear
+  re-sampling with 1/32 sub pixel precision.
+
+  Internally it consist of two independent blocks for horizontal and vertical
+  scaling. The sequence of both operations is arbitrary.
+
+  Any frame dimensions between 1 and 16384 pixels in width and height are
+  supported, except that the vertical scaler has a frame width maximum
+  depending of the system's functional limitations.
+
+  In general all scale factors are supported inside the supported frame
+  dimensions. In range of scale factors 1/16..16 the filtered output colors
+  are LSBit precise (e.g. DC ripple free).
+
+                       +-----------+
+                       |   Line    |
+                       |  Buffer   |
+                       +-----------+
+                             ^
+                             |
+                             V
+                 |\    +-----------+
+           ------+ |   |           |
+          |      | +-->| Vertical  |----
+          |  ----+ |   |  Scaler   |    |
+          | |    |/    +-----------+    |
+          | |                           |
+          | |                           |
+          | |                           |     |\
+          |  ------------- -------------+-----+ |
+  Input --+               X                   | +--> Output
+          |  ------------- -------------+-----+ |
+          | |                           |     |/
+          | |                           |
+          | |    |\    +-----------+    |
+          |  ----+ |   |           |    |
+          |      | +-->| Horizontal|----
+           ------+ |   |  Scaler   |
+                 |/    +-----------+
+
+  The unit supports downscaling, upscaling, sub pixel translation and bob
+  de-interlacing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-hscaler
+      - fsl,imx8qxp-dc-vscaler
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hscaler@561808c0 {
+        compatible = "fsl,imx8qxp-dc-hscaler";
+        reg = <0x561808c0 0x10>, <0x56183000 0x18>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
new file mode 100644
index 000000000000..c495822fdc80
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-signature.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Signature Unit
+
+description: |
+  In order to control the correctness of display output, signature values can
+  be computed for each frame and compared against reference values. In case of
+  a mismatch (signature violation) a HW event can be triggered, for example a
+  SW interrupt.
+
+  This unit supports signature computation, reference check, evaluation windows,
+  alpha masking and panic modes.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-signature
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: valid
+      - const: error
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    signature@5618d000 {
+        compatible = "fsl,imx8qxp-dc-signature";
+        reg = <0x5618d000 0x140>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <22>, <23>, <24>;
+        interrupt-names = "shdload", "valid", "error";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
new file mode 100644
index 000000000000..42d1b10906be
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-store.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Store Unit
+
+description: |
+  The Store unit is the interface between the internal pixel processing
+  pipeline, which is 30-bit RGB plus 8-bit Alpha, and the AXI bus for
+  destination buffer access. It is used for the destination of Blit Engines.
+  It comprises a set of built-in functions to generate a wide range of buffer
+  formats. Note, that these are exactly inverse to corresponding functions in
+  the Fetch Unit.
+
+  +------X-------------------------+
+  |      |              Store Unit |
+  |      V                         |
+  |  +-------+                     |
+  |  | Gamma | Gamma apply         |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Color | RGB to YUV          |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Chroma| YUV444 to 422       |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Reduce| Bit width reduction |
+  |  |       | dithering           |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Pack  | RGBA/YUV to RAW     |
+  |  | Encode| or Compression      |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  +------X-------------------------+
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-store
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  fsl,lts:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Linear Tile Store associated with the Store Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    store@56180940 {
+        compatible = "fsl,imx8qxp-dc-store";
+        reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <0>, <1>, <2>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
new file mode 100644
index 000000000000..7a3b77ea92c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description:
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-tcon
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon";
+        reg = <0x5618c800 0x588>;
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

