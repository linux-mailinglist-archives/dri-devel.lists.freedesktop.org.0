Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04699BD5B3C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD1A10E4AD;
	Mon, 13 Oct 2025 18:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZOtmp4B7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156410E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSyti1Nb1eDFnXCVjd31ugo9ADXn3EVMUyBXJ9a8E5JprF1qAAJnTFQuME7IthpWmyP3C4RKl6144dLnC6e1oryOqm/pwAzWK5T4cXQsuLGxncuq+I8tPI2D5AeUfbD0sflEFdgfrBYF+bJuIGlNzcqQxdiYCrM1JCHB67gNMEXjTVwp5YIF3rd97GNYtQ5FVlcX5c+UHqeeplPfcbnE7QV2BorWF2n9Q/HgkYRjVYWmZWJonYaRBdoYpK+y3erTth7rynVj/uazs7AEZnA00WHOy9ithYxa9LcdjHqnnDNl8GLYXqMBdXsQ4Bd1PSQdyjB1lHUEjZJ9GVTv7jpwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHtz7e0/bpTkJd8pSNSWsGKce6NOL8si36V30BLoans=;
 b=OuNsLAqbxxSh8fDZOJOeAOCUBgBtQFA6iPb7dPXuE+EwCZDnVq2+a6dAw9pRH9ULbhlj1xcEyknEwswOUDwgahdkBPren17JxjmbfkvaJPpsyvg64xsl3KgSd3/BRfpJK2qGYqBJnJ7wxp1GHoW7Poi7DMP/VAdw2cgQbgkQ+ODUTsNYsnb8F+64xEvXRt/upFsMFY0NqUuDyJu26fI2t2B0dzpFIKvOBogJhpRESAByX+jwLXbFgZ5zdWkpXeJ9OKs9dk+dx0LipBlC+HhN05Ku213sPv1genXZLjUWuYPIkBZDrqJHYhPdcaORcPZSugg8mYrQcipji2Y1AjgJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHtz7e0/bpTkJd8pSNSWsGKce6NOL8si36V30BLoans=;
 b=ZOtmp4B7PSy6YhCYoDIKzz+Zo+LDTjt4iOEGTrJ48Djr2JwWGYArUeno4uG+l9Gd4vt3thP1aGX6wIuazR7ok9eH114Yl33DCcYBBSbpgwPKyqcXXi7j3TisyKgpQVQBiVICmDBjm8SiiJobIREh8A8+sXNQn/iCofhbwhpwU+gMMi2UC12u9OBcZw0g/rhfKzUWnxcnKuPglmLIO4UInXkAddRHaBDAxMZZLO1C1iOVG/iBzDn1Ds2Y3afF+Of1qFxNEaQhZuFv1QiCbKGCRfnnZuzGETQN4jaP/fsTxcebR8aO/6x/TRfaieg9f3yGjnNkgjyccoJLlikUGbkQfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:26:56 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:26:56 +0000
Date: Mon, 13 Oct 2025 14:26:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 10/39] drm/imx: dc: ed: Pass struct
 dc_ed_subdev_match_data via OF match data
Message-ID: <aO1EaAcArCszx71F@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-11-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-11-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::6) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 1090a3e5-6793-41f6-3fad-08de0a861736
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U+4mINm2/BHPMYsTWNZwOdtyciJ2IA7CJ6y9x/by7HT/Xlgd1a9Bmt2gu36Z?=
 =?us-ascii?Q?yxQdyglcjnkI30S1XZP+HiGvJh7/b6lgB30Xr70olruZRQ4adTXaKlCaLFpu?=
 =?us-ascii?Q?LRAWWfQVzfxG6IvepYxH72q8xLLAGPFjbhzyRHbWqsB9C7rrCt6FZ+rmpisq?=
 =?us-ascii?Q?T5EKgMHl3yWMoAnG05ATRm4trHLepQESneuxtqqJfsyip8qh49zL5ZpTqNyg?=
 =?us-ascii?Q?vX1iJYg95/J7c5XnT8T3Bg5qx6mZ4S5Ob1RfinP9wFo9n4ceYITkpj8u8stS?=
 =?us-ascii?Q?KDhkj91VEGxMw3vVLmqa0LN6v4v9BkBXKl4oQNmMrKtwzriDXBu0G6MmLvPj?=
 =?us-ascii?Q?IctOj1XCmKhFXjdnSQLXact/qDsqpbVWUNuoEDc1Fvy1Dw6ZLFQNAOOtO3MP?=
 =?us-ascii?Q?UsnpIenvCYGlNSb82wjwnvK6iUlAxLf8qtLGqY6auutATagmjSUzUv0YtXNY?=
 =?us-ascii?Q?LuM8JfCsi69bSWVCVHJBWGlBXdr5tcetxWnsWGtlYMLt0o8IzhutCCJhJcob?=
 =?us-ascii?Q?XYzMNrGW2pfrlfw2WyNQm7FUHANbAtyJB67NXgF+MdB6zAQG+judN3iY/yxv?=
 =?us-ascii?Q?DfMuNKCQ9OPcrid7nh9IeBe4Xa67J6LOUX6DvtdBqHSA7xcv1UJusNe40bZX?=
 =?us-ascii?Q?5IjbgnoqMsXDPYWdObVWp9VrpdS5pjvKiAG6/CZhb2iqKy6HNMeHXOXWj6Yp?=
 =?us-ascii?Q?vQ59uetziDo2QwP/oLbEFH5nI4FtYGOE7sFbtEmH96eLPZnbSdP+JQ5QdUDj?=
 =?us-ascii?Q?V3RVmQflUFstZNKZFRnwvbsuBYF1m5n9UlFW5i62dXmOOEeFjnsclMmvbSpr?=
 =?us-ascii?Q?yjZIjoIqaOog8+VGSFwNykXvmkNFuhP4G3sll4pQ1E9OLWR4pXKqB6fUEzin?=
 =?us-ascii?Q?Mw6QowOzyJpFqqZ74mtwPaFe+QZy/R9UOrZH6FRvs/+puaId8GyeIBenQzR0?=
 =?us-ascii?Q?G44Pz2zRL7Xb6rlL14b66TToHeskd2jwUBR9xmBrFRQ4LNvD55mMwiAkG1Dn?=
 =?us-ascii?Q?4MLJMoSS+Fq96uJjVOnlQ5cGL3UTGhimKlQIJh2iedjZ6mF+BL8CmQGNfwUw?=
 =?us-ascii?Q?gk+36ZpFJ4/GsKqxsEhS/MfzHSUvaz0DgGzl0nKjdVLVUMLdDucSNTovRcRf?=
 =?us-ascii?Q?TrOfA0NpPmcoISJ8Ut1wWH4W7E4Q7vzCOkCv3DJhdLJIGjHgYNsJ84C9VuvW?=
 =?us-ascii?Q?mivEOhlGbM4+sNGv7daJ3UTWJWarTdx7Mi1VEbyx38x+KxoSgSBT5jJPQZna?=
 =?us-ascii?Q?bRMRg15KVTDHpkfu+1gFtFvgVVEi8BR11dtwASyE7hYQ3b+IRlWdnSH0aQKM?=
 =?us-ascii?Q?9pLl6PCy5n+vO7Ae5zwDGkM9Ssa6bMxaciwbyStcqUK2ZDIu/UPjPCAS6zuG?=
 =?us-ascii?Q?NcN1IskbrMFWAlHqiPZRUFMugi94Xg+AGcI69rR+Xd16dyxqlYmIS6rWEDcm?=
 =?us-ascii?Q?Er3U2tQAaX/15kVBaTL1OWviWSqOcBRq3mpAnmL7OkqBC8UMKbaIyHH0kOlK?=
 =?us-ascii?Q?yQSdx9u019BQidPszD07M3to+tck3ZKaOGWZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?56kZ8gqYU2n9+UtDiA0YraYPclMPNXfd6VURfG80eLKKUWdodgZZu1/7+UE7?=
 =?us-ascii?Q?lAcLZWfTAb2jfUOp6zvvvTYKYC4z6PXzCX/8KHTE/NuoV8bkWSS43oh8wlT5?=
 =?us-ascii?Q?eCMHQogtkhI68+2mgZyBSojuSpYWcfqgv+nKtsAnwQXo/pYAabpfUpGT8F55?=
 =?us-ascii?Q?xY0lj/tBv5fnWzUsSZc/9EuJ8mm4DY3wGM8v5/uNNFEaztgkRQYtQlmHZTGQ?=
 =?us-ascii?Q?S82FPAqBu9lTsUGPpjRTzNydQlNz91pfhzpGNZhDFuLmpZcRrUxQ6D/SaESY?=
 =?us-ascii?Q?K9O+S1/Q0RVvC3/s6s0Kvot+5yek4hvQBboueUK03OZAx2s+h4Y+uefMl9HB?=
 =?us-ascii?Q?vasZk4zoOAX7z8pPLOUDEIKbpb6JN7Vu7UmYSjroL9C6R4K817dWPsZzvWvA?=
 =?us-ascii?Q?oug69Tc8Ez45ICU9K4ZGOfCyB0shrq4bWUQhkQAPTWaqFdI+o6V6jf03cJqR?=
 =?us-ascii?Q?hFCAtwSkslZUSW960BSqT3B4e0CSBn7ZFCfG+wwmSTXmf1NR3REiDg9snxs2?=
 =?us-ascii?Q?V1U09tVROL59lcuZ3whPoZOe6SuhyspE9FIxLB4fRzvqSpoG5ck9pAs3uZTV?=
 =?us-ascii?Q?moxGNqjHlPSHS1LYzzMRX9p/3KHlkR2wjJaTZ8C97ekyQ9gCM38xxLvbEnJd?=
 =?us-ascii?Q?8tC/PL/KvtcVDzUCy9Wier8b7dwC3OILZFHVNq1+fOQco5NR3gja+14sjJfW?=
 =?us-ascii?Q?NZDz/GIojnXW+eQyyoc1RyoqafyGmt3+c8lRaRXRLbZwVA/+iuYgye9mhX7N?=
 =?us-ascii?Q?sWE8X4pszdk90k2kpLQL5UCaYRcpnxsBErvNnuTpTnrAJVY2sGPZUSCFVnqM?=
 =?us-ascii?Q?xjp2O6+HNQc7sQ010YklhN4JYGRWqZkgvO4okTwnH/Ho6h9H3CzjgCYNMV19?=
 =?us-ascii?Q?IXYuBnxJ1v5OyEpX8EhLXMb+La/1SWFAkZxf6lnU7ky0ljlZYEdnfjdW/pVw?=
 =?us-ascii?Q?371HBZp+WIpPt4ArIROlgOoEjROyk4klhvSe5oOV6+jiPDexKxeXrsdHWpRD?=
 =?us-ascii?Q?rRbf1iNgPWNibk5ZHOE4egvxXgeK93byu7jJYJF5YupKG4KDev0yO/NUjJW7?=
 =?us-ascii?Q?DqrMzeuSqmuPHMyZrVE7SyG8XvdxL+C9ENqlC67lwUfG6EtMQnFKv1cj5dGD?=
 =?us-ascii?Q?zHe6LONrfCupBvvEUlc1xjHKFOA1GwjB5lkGTtRr3T3ZSGKxhasjEGF2pb6f?=
 =?us-ascii?Q?1eRvnBkcsah6cNeeVEHB56q5YWyKSJy9FOuUmwpLrzkwiOndQ9SYcRweJAdh?=
 =?us-ascii?Q?8ezQ1vWtC8zr4dET9d5rigbZu/4g8NlTHfRPHf252jvVhe1vtocwEg387WMq?=
 =?us-ascii?Q?egheVuJGbPGRsZ5pneoxqvbkGow5pJNCnzow0a8g/hlJTrjJDemroyszVRcD?=
 =?us-ascii?Q?IMoaQQM0j+4QZ0DJUTBDGvDk+IOKV4NXBeVlB2WVUBCLWL4NXWUKNjthyDLO?=
 =?us-ascii?Q?ky7V+8TZWfgTDe8313hUDGTQPYhFhup0ydgrniv8aJ3Ns+a5asJQfvOeeR5E?=
 =?us-ascii?Q?kaVxBEUeVsaPq6j04Swsol/aYoRhOdoNV00ealONx471xlpQKhrMipPn6P2o?=
 =?us-ascii?Q?9I3HsCUX+0xMv0KQmChvvL7hCoco5A7G2Pp+KUyj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090a3e5-6793-41f6-3fad-08de0a861736
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:26:56.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mA8nnCWYNBPLRRoobJYvXTj3vOvSs7Jx+rCLw0aCC5GK36Nw9e00tSQ/H7kM5T/LQuJfuJ+wVx3nu6IpwCspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383
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

On Sat, Oct 11, 2025 at 06:51:25PM +0200, Marek Vasut wrote:
> Introduce struct dc_ed_subdev_match_data which describes the differences
> between i.MX8QXP and i.MX95, which in this case is src_sels mapping and
> address space offsets, and pass it as OF match data into the driver, so
> the driver can use the match data to apply correct src_sels value to the
> IP registers on each SoC. This is a preparatory patch for i.MX95 addition.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c | 24 +++++++++++++++++++-----
>  drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
>  2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 2fdd22a903dec..63dcad30ecced 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>
>  #include "dc-drv.h"
> @@ -35,7 +36,12 @@
>  #define CONTROL			0xc
>  #define  GAMMAAPPLYENABLE	BIT(0)
>
> -static const struct dc_subdev_info dc_ed_info[] = {
> +struct dc_ed_subdev_match_data {
> +	const enum dc_link_id		*src_sels;
> +	const struct dc_subdev_info	*info;
> +};
> +
> +static const struct dc_subdev_info dc_ed_info_imx8qxp[] = {
>  	{ .reg_start = 0x56180980, .id = 0, },
>  	{ .reg_start = 0x56180a00, .id = 1, },
>  	{ .reg_start = 0x561809c0, .id = 4, },
> @@ -106,7 +112,7 @@ static const struct regmap_config dc_ed_cfg_regmap_config = {
>  	.max_register = CONTROL,
>  };
>
> -static const enum dc_link_id src_sels[] = {
> +static const enum dc_link_id src_sels_imx8qxp[] = {
>  	LINK_ID_NONE,
>  	LINK_ID_CONSTFRAME0,
>  	LINK_ID_CONSTFRAME1,
> @@ -119,6 +125,11 @@ static const enum dc_link_id src_sels[] = {
>  	LINK_ID_LAST	/* sentinel */
>  };
>
> +static const struct dc_ed_subdev_match_data dc_ed_match_data_imx8qxp = {
> +	.src_sels = src_sels_imx8qxp,
> +	.info = dc_ed_info_imx8qxp,
> +};
> +
>  static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
>  {
>  	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
> @@ -144,8 +155,8 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
>  {
>  	int i = 0;
>
> -	while (src_sels[i] != LINK_ID_LAST) {
> -		if (src_sels[i++] == src) {
> +	while (ed->src_sels[i] != LINK_ID_LAST) {
> +		if (ed->src_sels[i++] == src) {
>  			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
>  			return;
>  		}
> @@ -192,6 +203,8 @@ void dc_ed_init(struct dc_ed *ed)
>
>  static int dc_ed_bind(struct device *dev, struct device *master, void *data)
>  {
> +	const struct dc_ed_subdev_match_data *dc_ed_match_data = device_get_match_data(dev);
> +	const struct dc_subdev_info *dc_ed_info = dc_ed_match_data->info;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
>  	struct resource *res_pec;
> @@ -227,6 +240,7 @@ static int dc_ed_bind(struct device *dev, struct device *master, void *data)
>  		return ed->irq_shdload;
>
>  	ed->dev = dev;
> +	ed->src_sels = dc_ed_match_data->src_sels;
>
>  	id = dc_subdev_get_id(dc_ed_info, res_pec);
>  	if (id < 0) {
> @@ -274,7 +288,7 @@ static void dc_ed_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id dc_ed_dt_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dc-extdst" },
> +	{ .compatible = "fsl,imx8qxp-dc-extdst", .data = &dc_ed_match_data_imx8qxp },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index 1e1e04cc39d4b..7928f947b0cef 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -56,6 +56,7 @@ struct dc_ed {
>  	struct regmap *reg_pec;
>  	struct regmap *reg_cfg;
>  	int irq_shdload;
> +	const enum dc_link_id *src_sels;

Pointer to dc_ed_subdev_match_data, in case need more data in future.

Frank

>  };
>
>  struct dc_lb {
> --
> 2.51.0
>
