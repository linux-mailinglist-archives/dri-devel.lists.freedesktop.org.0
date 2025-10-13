Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641DBD51C2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427D89067;
	Mon, 13 Oct 2025 16:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LbzQKNNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74E610E394
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxBT+efA8P9q7x6UqLFJUR9N/WhK3qNlD9WtHrEAxCAnD/LHg5Y4UyIQ1hNvLXUDlPlcuntyuCgXeGVBCQ6Xvs/0AXB5DQgsIATEd/wpJz46z7snFif8Q5uigvJ897iLoAm1Y5m/YA4yIgMyRU2gKsYk4c8s7xcJs7Wa3jAl88XVhuuZnJLOlT165xZoG9otNX9FZ7kfxjBfLT/5Hx6QwVpljdhkCvKakEL14TmWRkwY1ywJkSZZs89GaRxJBBqUABjcKXIHyOJnOU4W5OlFyjkFBq13YKidk3XtoEul34wtKFS30OuTrA2J86fGx++Trg4pMpekMnbPSgyYGw1cKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3y6XMHzJDYSiOn9Bi4+wtiY5q16nu0gZyVSaGsy0TA=;
 b=JLNkRcL4kjB8q3b6m/a1nJ6WqlOzj6pSq9M5gyaX8V9dWnIRaYiHDskJUdfnQB6LwEjiMR/JZozxUMsU1mtOEf/UIR2lQbMbMnBUBBaBsqq5dGxxtwXQXeJdz/7/sp/8TpsxkMip118zair2pmz1XcJxgt4K3jB6jErWsVNgNUJwbyX3hsnKcasTCJgDqAU3S3REYnQcoK+E9B6Uc55py/PesdA9JdTggLjEs+H2NdiJbMTcIBW1lnEc1jAw3rx1wmyQaLX9UUi41v4xsapOyklOdPEJhzYSezDYtyGHjKCtzdZUF6k7veGh26qggOqXUKBPh4btbt4tnyn6B0KboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3y6XMHzJDYSiOn9Bi4+wtiY5q16nu0gZyVSaGsy0TA=;
 b=LbzQKNNh6WRaf85YahAGnjtzg8FJJlKTYX06MHR6tL+cSiLqGYXk4bHj74Kli1h6YKaU/jWR8/OcUBN7Tzgf1wfMeaK0sEJeuct/YcOr2PPh/ohMmuG+sPKKGk30vKy6QldcDH0Wdqwf5s3JvRPTp7wMndgZqUvfSgXmDR/WXryVEuHakeR+j4pTFcjiiDKY0sEzHaInKMn2qo7aKSSVjmwnlT9lyv5V3JTfoRd0LOnPWMgmErFfvgFD7AohG4Khb8qZcEgg7vMCJzMkfRdK8aCVC4Llf4nKGdkYwkXjuxEGeasWxNKiexwg1VQ6gXM8l63Kb+7UupLwblqMdh18Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:38:35 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:38:35 +0000
Date: Mon, 13 Oct 2025 12:38:28 -0400
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
Subject: Re: [PATCH 02/39] drm/imx: Add i.MX95 Display Controller DomainBlend
Message-ID: <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-3-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-3-marek.vasut@mailbox.org>
X-ClientProxiedBy: CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea40dcf-de5d-4b1b-f844-08de0a76f441
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvcms/qvd7BimrATUL4IJcDQQwIeFzXdHuatFpk0dI5znrNntEIqAa64Nf14?=
 =?us-ascii?Q?Kb3EWmH5I3yUcqIiBAxnpeSHAk5FqTbosJYPq6yHecF4FZ4jQy7BDTfpT6Yl?=
 =?us-ascii?Q?Bqdl1WyYe2Wy8cgY7QzfVx6MWOB+deg3FzXOKjDy1R04K4cPZ58O41MaCch8?=
 =?us-ascii?Q?rRxTuEYjz14YsVxjjTPeIDwX6+rzFBybUstYnyk32lEBZa93BTO9UtXUHnSM?=
 =?us-ascii?Q?GK7pERq1alxhwKFny2n8lUncNVuMVO0/UgvlT20kzyKK0axXE7V8PyzbJOvc?=
 =?us-ascii?Q?mLYirlSirUPaP/x+F4l3BrRTP5vrTCbx2zGEPllpgj/NPBBvSXbc7rWp/g5H?=
 =?us-ascii?Q?QIjBomPiWx8ykt3gxKATsET3Y5R6kMZWIT4mIox3+t0rkwklLc0zpSSVLd71?=
 =?us-ascii?Q?YhjkzKPOQ3WYAYxJGMUWVwq2ZnlfMHdRF2jc7s+FGcUFun8Jh9c860nz0mIp?=
 =?us-ascii?Q?zE1fNRnVJgnSRxr0AEeH9PBZuERPRUvdYYBMNRWLgKxGe3pJx9/W4vpSxlhI?=
 =?us-ascii?Q?AsP73ZOk3CC0Irh+VVmcnTltDbxM731tA2gcNgpmU6AhbmD1SrsjMUP+GxyG?=
 =?us-ascii?Q?N/lQLwZJladUnstLc3SkdjOMTBR0M7+TYd4hopTm6hTRhEj3QgXI5WE6djY0?=
 =?us-ascii?Q?wsHTbUr9nVxr5BkfdkcUeSIg9baSZuH0n7yn+ouyeybdZ8s7/wKx13CUhK/t?=
 =?us-ascii?Q?jHBprDc1WjT0JxzzFi/jkjr/aURm5ggziV4W+Hnqy2WljCBJ0D2EtUV4zeBb?=
 =?us-ascii?Q?ek3FyENG/bor0j8Exkn1irlNwQj1R9kGoGLSxAPaeP4f/zF2o9ejAL2ComVX?=
 =?us-ascii?Q?c1Pxni4uaklvZ8m/PKedbcv8i40vPmylLcSDjmbi9ekVf96YFkGRTwP2vCJn?=
 =?us-ascii?Q?vcGvkXs3r2j/6pBn8SUcdhquVYkIu6U/jpuECcaN6/7/Mo3wOmIXzScEfPbY?=
 =?us-ascii?Q?RuMBo2HUBNXdBa0HEF6SPLcchmbdSqKgfHkaUzhg+xsAGJ8Lua5CO+s+780B?=
 =?us-ascii?Q?jxtmRFMCLcEzi/aIAPbXVppmVlmpO1yf8IalC7LWITLn+Mi4TWoRKC3/Bg57?=
 =?us-ascii?Q?z9u8LovSHiPmXCc+gIQ/VsqnsakCnoinkoGpYuT5jsYwQb84QpNPr786MM1L?=
 =?us-ascii?Q?dltSIFpRmsARoF1gJBci24D9F/LjfSvN26h8mtS1AQ6i4fGN6Nacrn8d6aM0?=
 =?us-ascii?Q?/z3/wtlHKx4a0bWJpQJFHWfndsYCHF0E2nT4fB4r+vmIhCcmvd7efH0z3IXI?=
 =?us-ascii?Q?tD5qPKw8vXDqQUcRpNwL3+UK3TXxhbXdZGa3Da7QXYbNtoRSjxOWvZvXolO1?=
 =?us-ascii?Q?d7Qf+/XMRwwmMjzcllMjHoKjlbQYnbH9/tTg9GKT4NGMB3oDM5lhsgf5LEMj?=
 =?us-ascii?Q?2YHou7j20/yBqfcAOktgJsIEoQHCJTW5duCpyssCqBwDj3C2OO7b8Ttxe4Mv?=
 =?us-ascii?Q?6QgJay2Pj3DhDYZHCYw/qvCH3MUZUeciZYpgmWiqRr5kH7xAQDnvxZRt5blj?=
 =?us-ascii?Q?qSqdr2qXEhgk7Mzsk8OgxN51wbkUSp/HwPRh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/OUFL/WOySkw8dKH1lnNrI35zTLTe1wz5V1wAY8hUoQmE/YJqphC3ZY1f/o?=
 =?us-ascii?Q?2VSu5L9a2bowpz6+X7pQK6ErS8HqccGElsiR482/mYi8pp2zEb8IMAiDL48k?=
 =?us-ascii?Q?pb/JfIrZgjXB22yqLVXaSfKWHX+AXWLUU6SaKaiYAaQjTBX9dQe+gVMHYBx4?=
 =?us-ascii?Q?+WwI5sfQSJ4gbH0BJWjuthkiJ5D62KKbICiIp0lyGrgNicYKufD1Ay3x0wZY?=
 =?us-ascii?Q?tt+DMWTHNbiVJUk06vs1wZzCSfvRfMKLXFEvNN/51Ovr6kDiqKBIi96wgq4M?=
 =?us-ascii?Q?bwpfM/uQ/ny7hKcEeP6vWzYRZT8d2oKelWIYUT0pR3sTzD+kBfpHzIv5VRJu?=
 =?us-ascii?Q?ziF50X1v/O4bxv1fnrvE9Yzw6bx1hE+xv2qSNXppkFBrFhS0XORTS7+rE8GE?=
 =?us-ascii?Q?BF6JF0yBkAjzreyWGUtLhFImmb0I+XSI6WR3fK7mkH66RAg65g3305I7Ju9r?=
 =?us-ascii?Q?OPgMLslOZNW3jQhOOODDX45K1rYdiuRe1ximMr/0am3MowcT93WzFF4lmtZD?=
 =?us-ascii?Q?jHGA9/SihrYT7w2ykdjG/2XfVTrz7JMQxl0QnmrTZ8/jBC8Di93uRvzWLE4G?=
 =?us-ascii?Q?klprEJ5IhrfrYAqjrO0WgosA9PRIhm9dSQia72lL+youaALW6DX19wUwi/OO?=
 =?us-ascii?Q?wrWxZhv2o4WmteIzIQCItMTnrUjThY45tn24c8Pvd1v5nycrVetO1/FWQ0Vb?=
 =?us-ascii?Q?Wpdvpj7qAh2gpTqeFBG8EuHt9KrEBZNRbtsTPArgSokNX3PWMYHaT/QqHG2G?=
 =?us-ascii?Q?n/PXEC/ZZwviC8ZI5sCJnBA1b4wdzlJMyc55AODt589t8EBnKaRMahuFjm9z?=
 =?us-ascii?Q?Ku41mLy2sU/PlZ3wR3ofi9aZP+T/7RguXz1GEVd0FZJ/E+KQ6lRUYYDJtsUJ?=
 =?us-ascii?Q?+lOKTIkrvulvrP+tiNxf0y24+eSPSIWHIEhb7YLsIHDG3Nh4tgh+y3wLoe6W?=
 =?us-ascii?Q?SVjG7UoNq7nrhab30P+JhayEFimdfzBomlW5tqsGQAeEq40SRT2oBoEEJKL0?=
 =?us-ascii?Q?ocf8dl/NKR3+FCHVT0DSBTXIs+PZGXA4lkGWfWLlPbVeG1qwg7fFW6aLukaU?=
 =?us-ascii?Q?9Ht76xRGfx8IA5428j02+eeDJRVQ7k3FVP2iWIp1DAbjV2QibfXIqUnbBJ3d?=
 =?us-ascii?Q?mWAP3Smk1Qd9ldC5cIlQPGcL9Gvp/UlHtR8glWNxtCWhO8ua7BDE70LD+gf+?=
 =?us-ascii?Q?jtbRAQksEvPgr6d0f7n1EqI/ZM6QdLnJrk6akfEjqJFIeXJpsfBtRGXw0elN?=
 =?us-ascii?Q?i+E6KlHDvEXAknxidalQJ+1B65OE76An9e/r8jG5BQxGOdgOZ2XHDCfLLAaj?=
 =?us-ascii?Q?waxrKzyCmXs92fUjRZdqfH2i7sFdbv1/Tr++GL48P6IK0C/d1TJm8rinOq+R?=
 =?us-ascii?Q?FpDYAt2Vh085/6CTdjLm32YURzRCRN9385NUfGUiACI+wWBMAEvVeC8D30Wb?=
 =?us-ascii?Q?C1cVspgACI6qVBjZlLX0gq+mrK99kYx4ruKUYeteLObbqk/6nwA8ZRY4B2vH?=
 =?us-ascii?Q?2cQDwhLkva3mjog8i5mWoLWSU92NcirF4G+YZilN5ITHA7cN7QCCWdzNJqBJ?=
 =?us-ascii?Q?s7jqgVbo/T6RAjhOI/tb6NnT8Ob76e/LtUh8L1Xv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea40dcf-de5d-4b1b-f844-08de0a76f441
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:38:35.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sY/qPOW32r2jiokJmlGge/hTZw1gdG43WJH4dd9RtnDBRr5epWFCuFh5maf1GHRFjbymDryA0hESb0p8a2MSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521
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

On Sat, Oct 11, 2025 at 06:51:17PM +0200, Marek Vasut wrote:
> i.MX95 Display Controller display engine consists of all processing
> units that operate in a display clock domain. Add DomainBlend driver
> which is specific to i.MX95 and required to get any display output on
> that SoC.
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
>  drivers/gpu/drm/imx/dc/Makefile  |   2 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c |   2 +
>  drivers/gpu/drm/imx/dc/dc-db.c   | 226 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.c   |   2 +
>  drivers/gpu/drm/imx/dc/dc-de.h   |  11 ++
>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h  |   3 +
>  drivers/gpu/drm/imx/dc/dc-kms.h  |   4 +
>  8 files changed, 250 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-db.c
>
> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
> index b9d33c074984a..20386e4082e56 100644
> --- a/drivers/gpu/drm/imx/dc/Makefile
> +++ b/drivers/gpu/drm/imx/dc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
> +imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-db.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
>  		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
>  		    dc-plane.o dc-tc.o
>
...
> +
> +#include "dc-drv.h"
> +#include "dc-pe.h"
> +
> +#define PIXENGCFG_DYNAMIC			0x8
> +#define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
> +#define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
> +		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
> +#define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
> +#define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
> +		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
> +
> +#define STATICCONTROL				0x8
> +#define  SHDTOKSEL_MASK				GENMASK(6, 4)
> +#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
> +#define  SHDLDSEL_MASK				GENMASK(3, 1)
> +#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))

Can you keep bit fields as consistent order,  from 31..0 or 0..31.

> +
> +#define CONTROL					0xc
> +#define  SHDTOKGEN				BIT(0)
> +
...
> +
> +enum dc_db_blend_func {
> +	DC_DOMAINBLEND_BLEND_ZERO,
> +	DC_DOMAINBLEND_BLEND_ONE,
> +	DC_DOMAINBLEND_BLEND_PRIM_ALPHA,
> +	DC_DOMAINBLEND_BLEND_ONE_MINUS_PRIM_ALPHA,
> +	DC_DOMAINBLEND_BLEND_SEC_ALPHA,
> +	DC_DOMAINBLEND_BLEND_ONE_MINUS_SEC_ALPHA,
> +	DC_DOMAINBLEND_BLEND_CONST_ALPHA,
> +	DC_DOMAINBLEND_BLEND_ONE_MINUS_CONST_ALPHA,
> +};
> +
> +enum dc_db_shadow_sel {
> +	SW = 0x4,
> +	SW_PRIM = 0x5,
> +	SW_SEC = 0x6,
> +};
> +
> +static const struct dc_subdev_info dc_db_info[] = {
> +	{ .reg_start = 0x4b6a0000, .id = 0, },
> +	{ .reg_start = 0x4b720000, .id = 1, },
> +};

Not sure why need map register address to id? Does graphic link or use
dt cells pass it as argument.

I have find use .id at this driver.

> +
> +static const struct regmap_range dc_db_regmap_ranges[] = {
> +	regmap_reg_range(STATICCONTROL, BLENDCONTROL),
> +};
> +
...
> +
> +static inline void dc_db_enable_shden(struct dc_db *db)
> +{
> +	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDEN, SHDEN);
> +}
> +
> +static inline void dc_db_shdtoksel(struct dc_db *db, enum dc_db_shadow_sel sel)
> +{
> +	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDTOKSEL_MASK,
> +			  SHDTOKSEL(sel));
> +}
> +
> +static inline void dc_db_shdldsel(struct dc_db *db, enum dc_db_shadow_sel sel)
> +{
> +	regmap_write_bits(db->reg_cfg, STATICCONTROL, SHDLDSEL_MASK,
> +			  SHDLDSEL(sel));
> +}
> +
> +void dc_db_shdtokgen(struct dc_db *db)
> +{
> +	regmap_write(db->reg_cfg, CONTROL, SHDTOKGEN);
> +}
> +
> +static void dc_db_mode(struct dc_db *db, enum dc_db_mode mode)
> +{
> +	regmap_write(db->reg_cfg, MODECONTROL, mode);
> +}
> +
> +static inline void dc_db_alphamaskmode_disable(struct dc_db *db)
> +{
> +	regmap_write_bits(db->reg_cfg, ALPHACONTROL, ALPHAMASKENABLE, 0);
> +}

This helper function just write value to one register, not helper much
at all.

> +
> +static inline void dc_db_blendcontrol(struct dc_db *db)
> +{
> +	u32 val = PRIM_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
> +		  SEC_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
> +		  PRIM_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
> +		  SEC_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ONE);
> +
> +	regmap_write(db->reg_cfg, BLENDCONTROL, val);
> +}
> +
> +void dc_db_init(struct dc_db *db)
> +{
> +	dc_db_enable_shden(db);
> +	dc_db_shdtoksel(db, SW);
> +	dc_db_shdldsel(db, SW);
> +	dc_db_mode(db, DB_PRIMARY);
> +	dc_db_alphamaskmode_disable(db);
> +	dc_db_blendcontrol(db);
> +}
> +
...
>
> +struct dc_db {
> +	struct device *dev;
> +	struct regmap *reg_cfg;
> +	int id;

where actually use this id?

Frank

> +};
> +
>  struct dc_fg {
>  	struct device *dev;
>  	struct regmap *reg;
> @@ -30,6 +36,7 @@ struct dc_tc {
>  struct dc_de {
>  	struct device *dev;
>  	struct regmap *reg_top;
> +	struct dc_db *db;
>  	struct dc_fg *fg;
>  	struct dc_tc *tc;
>  	int irq_shdload;
> @@ -37,6 +44,10 @@ struct dc_de {
>  	int irq_seqcomplete;
>  };
>
> +/* Domain Blend Unit */
> +void dc_db_init(struct dc_db *db);
> +void dc_db_shdtokgen(struct dc_db *db);
> +
>  /* Frame Generator Unit */
>  void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
>  void dc_fg_enable(struct dc_fg *fg);
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index 04f021d2d6cfc..f108964bf89f4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -263,6 +263,7 @@ static struct platform_driver dc_driver = {
>
>  static struct platform_driver * const dc_drivers[] = {
>  	&dc_cf_driver,
> +	&dc_db_driver,
>  	&dc_de_driver,
>  	&dc_ed_driver,
>  	&dc_fg_driver,
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index eb61b8c762693..17ce2d748262b 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -40,6 +40,8 @@ struct dc_drm_device {
>  	struct dc_ed *ed_safe[DC_DISPLAYS];
>  	/** @ed_cont: extdst list(content stream) */
>  	struct dc_ed *ed_cont[DC_DISPLAYS];
> +	/** @lb: domainblend list */
> +	struct dc_db *db[DC_DISPLAYS];
>  	/** @fg: framegen list */
>  	struct dc_fg *fg[DC_DISPLAYS];
>  	/** @fu_disp: fetchunit list(used by display engine) */
> @@ -71,6 +73,7 @@ void dc_kms_uninit(struct dc_drm_device *dc_drm);
>  int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
>
>  extern struct platform_driver dc_cf_driver;
> +extern struct platform_driver dc_db_driver;
>  extern struct platform_driver dc_de_driver;
>  extern struct platform_driver dc_ed_driver;
>  extern struct platform_driver dc_fg_driver;
> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
> index cd7860eff986a..3e61dbb87afe7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-kms.h
> +++ b/drivers/gpu/drm/imx/dc/dc-kms.h
> @@ -48,6 +48,8 @@ struct dc_crtc {
>  	struct dc_ed *ed_cont;
>  	/** @ed_safe: safety stream extdst */
>  	struct dc_ed *ed_safe;
> +	/** @db: domain blend */
> +	struct dc_db *db;
>  	/** @fg: framegen */
>  	struct dc_fg *fg;
>  	/**
> @@ -122,6 +124,8 @@ struct dc_plane {
>  	struct dc_fu *fu;
>  	/** @cf: content stream constframe */
>  	struct dc_cf *cf;
> +	/** @db: domainblend */
> +	struct dc_db *db;
>  	/** @lb: layerblend */
>  	struct dc_lb *lb;
>  	/** @ed: content stream extdst */
> --
> 2.51.0
>
