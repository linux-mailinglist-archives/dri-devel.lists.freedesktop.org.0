Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D0BD5599
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81210E499;
	Mon, 13 Oct 2025 17:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RQvsbm9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FAE10E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwHiWuwJVS2etjKmSTcnTHtJjGHosKtghgIbrlNTNcLLtO1z6spc/LXeG3DEsvlekNKYzBr/7vjVmbp1qnYs3riM3u/E6wSkA/PgERoCZjN2XpmOI8/hstQQexpeKn4O4Y7oD12+2a89LZQv5qX1egLhOIvBF2E9pADgp2ULVb7MIV4lBgI/OMFhYGIoe1D7+GoeNz0vcdNxlsqqXzXYWSJVmfBCoy938htDkhDXa4zo3alSBnmkguOAjgw5u99kSqoq9XRAWm5sBlgPLfeGVAbBo3jqEkGgAuQ8bdJBKaR/AnLLO0YDsJrcy3yUoZw4EMW/CuLoAaEn5VvvF5ynDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygf9JTPodTZ5YUnmkVxjIKHm5lwK+9auDCnz68qc7Kw=;
 b=yQQE/yvDdquhy4YmFYoC83n6JMlfAQAhd5bZL85TH97466OmX6xH3hXZX/PcoV+tqEriYUnAM81bGYQNM9ZC6TqFUMjJQzgsynd6XDK0bOHKvr0lSrxDhLnBWcbvIQ7vL5xPfrs7Qrh3dmaEVRI2Qs1vwsGtqBii8jv4gHWZlS884bq023q+JnV9j7fQuTkIeutb/XSKN0jiigdwMxva6VT9B0PsvljREpQVVgoYfJ7at4WCr/omBFWtml9eOExbAVQfUWwJ9PCCMnUPvOiLBA8dK2K1/Sk5gEKyNHIc83bBR0leGZeqlEf6PHBOgrOOO9lxY6MxhGQlephvEK6CSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygf9JTPodTZ5YUnmkVxjIKHm5lwK+9auDCnz68qc7Kw=;
 b=RQvsbm9lWohMx8vl1d0tTMa7y6TJs/dtGp/ZRVF9k2GAA/MWb3f/Z/2v0OVqjH60Ngt7QrWrsRucjzT8G1A8gyvxLaeioDPXQgPxyVNEcT2vxT5SOvwEkwUtZQWJphupDZqBU3FeyNYHtjoE1DevuS2Q0fp3qHQTkUsrap3OmVJz0RvTD2//HBCm+AFwSD0VuqbBhOWITGNWkBOt6FBMzbaiNN5TYVN7h/F/+XuWzcHOQ8aSAu30EugKSFosIxknL1n4KFKbBS6Yr1tzkWfk5mxB6OridYPrm6bFzPb4HVHC9fkmaL4LJyNxCKUQOCLnDDxxbgp+ZL+3Uw+ZrdQn1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI0PR04MB10590.eurprd04.prod.outlook.com (2603:10a6:800:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:06:01 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:06:00 +0000
Date: Mon, 13 Oct 2025 13:05:51 -0400
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
Subject: Re: [PATCH 08/39] drm/imx: dc: de: Pass struct
 dc_de_subdev_match_data via OF match data
Message-ID: <aO0xb8jkahZiSV2a@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-9-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-9-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI0PR04MB10590:EE_
X-MS-Office365-Filtering-Correlation-Id: eae8e9b9-4c9c-4f7d-18cf-08de0a7ac8dc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Id13xfHxzsFdZN98ijRICBny2dTkXZ9pSR/431NZ0RtgRK8kWZuO/Bd44GO?=
 =?us-ascii?Q?JFTdz50aKGgyweubiiFrsqv7wlbrbRXE/+m13QqKR9WI0IPG3yZzXC2lYINu?=
 =?us-ascii?Q?i8Sl8qfNerLnSpRmrT8pRmlZ6Ej4gk3q76paG73+PxvGC3/U9r4ILPDfENm2?=
 =?us-ascii?Q?jlq+fbZDXM/U4560LXjNVsVMCDekWzRZJ1iCnZv3f22v48wbFq1j6h4wXCPz?=
 =?us-ascii?Q?Ce1Ospov/40jfkndVrCjRh+SV0RI6AZ8bs8MN7UCwhVIUy5lFB+xpuDYh5Rb?=
 =?us-ascii?Q?ZJ0vc5v+KildStIoGp48d5edFfvSYllsiD2b05ghAtj8ECni94qHGDWfT7og?=
 =?us-ascii?Q?S03XwkqmWU1nKvpFTgwId4nDB6UN+0p1kyFc5YN9hPQG59QztvcLc9b/vft6?=
 =?us-ascii?Q?ddSz01WI6ecoNcS2YHhx0ps1y6wqDPmNuR1BQ4lb9aoWYMSPUl6i0ubB3ZPu?=
 =?us-ascii?Q?fWaCbMcZMqv/dOaV+DDQiS5Urf+b7YztYkM80dfm5f4W4VSOVtSDj7+kQn2q?=
 =?us-ascii?Q?5ErIjlpCc7HkWs93BmSliQG3HOtEOKjRzlA+dvBBTx0yZhldO4GYghO2Ey1T?=
 =?us-ascii?Q?HXHUBooEEU5SccHaiA9oxj9BKGWr1ZBKKFbqKfBFtfIcFZ/W5r79E1xWMVV0?=
 =?us-ascii?Q?ma7nMDbmC2drv5DLjXT6x6uHTznIvlCLX1XRYP1WqKJmfcRnoRYimUTQjoKz?=
 =?us-ascii?Q?LcZRbbeR4PzXyL298rOKDdrbr9ayB1W1TGuRgmiN7+KvhTFYJnzLQTj/tUlK?=
 =?us-ascii?Q?8hwib4Iz+VAjVIMyKAgKPq4xaj/e9SeFuWrNjJr5ftHBsli0O52FjwwPNhhu?=
 =?us-ascii?Q?UgInrtMC8SQtWRyge118PPzVHx8s9QbZn3pTv3rFk50Cb9Ia+2qiujne4iOH?=
 =?us-ascii?Q?ug4fWuCEff8KqiohIHLkNTnLZOYb5y9kBxROhT8etFq8C/r94j/ojk8mUR3p?=
 =?us-ascii?Q?EPs8/DYFWexgYHu7crSypqjZR1ZRI6q3+mfdPN8YkNFHu4AfPzYnQxW2Da2P?=
 =?us-ascii?Q?PvKheFnZmlZHDLvJmyA+I8qw3ikmJTyB0QZX39e3NagVzLGrB1EOw5c7lkho?=
 =?us-ascii?Q?FhDxqqGAHe4w7zCkRrlUqJTD/iaXrPsejSmRv7Z4DM2Gijy1bPg+O9YiahoE?=
 =?us-ascii?Q?Y1sJC8NW3VVrwez1sSDrCevJb5797WZGaNs+85m59zztkNFUuVzjJEZlBC8G?=
 =?us-ascii?Q?N0rnMSwRssHHV9/CaUiFxaBEP3JeX8XXo34nkDQjRsNva2nv5NvqraxD0Phl?=
 =?us-ascii?Q?jQrkkSP5NAo9a9gin79wMNPjfGpFE/VRyh3K9y7pYP2nGAbEElqG89qXsG1+?=
 =?us-ascii?Q?5Xt3/K2RGchgV5QHPmme8NvXr0zJ2pNSC3wRu+NNDYzHyI9q65sU2ndrwcxE?=
 =?us-ascii?Q?r6Bqj8paouE6tJ4koOJuY3n4wJZMRiqxnbOIqHMo2vnWcTojj6l1IuJ7jsNv?=
 =?us-ascii?Q?/efsuAu4c9tnsSqXxBt4G9r4Yo9XfQGEX1YzqotD1JzO2/FcfEOngCcVzQka?=
 =?us-ascii?Q?X0zGtPU3Kmv0AcgkXgtlmSMRC92foU1/X6rl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fc28F31/nnEOXlA4Eb0R2wLM8KtmjziLTleWcRYPV/68ozLMGJllhIonTUtg?=
 =?us-ascii?Q?dW/U5VC8fJP3iet0fmY8LJYlbLFeoJaAIksyJWWqBi0GNOlpkryAiIbNYtVr?=
 =?us-ascii?Q?eFeXctWCUQ5lVsaAO6Jy/vrIhe4noouBRQ3HebZDCWo0LkloDUze6W6JmPsw?=
 =?us-ascii?Q?44PHn4hkvL4zpjCzNoiJpXkKfi66EbN1Z6GvZ+kCY3aJb4sEJIaIN1hDxtL0?=
 =?us-ascii?Q?fOnXaYmDnDrDa6rUQIeZIyM1z/ncoThdvpbTENthlvtDfV8GpnTjTdt385n/?=
 =?us-ascii?Q?HULjKOHshzZMU3sYi+gin/q4ieiihLrw+/vCoZMeYfpeDxHd7TDTLsUBWZBd?=
 =?us-ascii?Q?JVqjCKKONtmSkAR1QWN2TRe8zJakVt9zPeC0uDgHXlQcA+VU6QUvTBsCOjxd?=
 =?us-ascii?Q?lKg8NkqcrNuE5Cd9xgTP796cpGRJcKSYssJpGdlGQHvQMqkZpyv9iS5ROKN1?=
 =?us-ascii?Q?/GkOobbXWhd72jIrmzDnxt4VtVjNcNbQofQM6otbuVnmxXo/fwVoI397Svcm?=
 =?us-ascii?Q?QpYb/ztxiCtdbhJVmzLCkiYGCCHF8rFgK1flAtkKyYJrbTHLuiUfWuPVFyiH?=
 =?us-ascii?Q?eEfpuWvCX/+Rt+ZII9csEjqQy7WTxtswNm0CoXw8Tz60PIg9DLVJFMr4W6pi?=
 =?us-ascii?Q?ZeXIOWa5uRWtifJG3O7M7h3CVAZluZhddAn1BkegO+FBgICpQMt/o8KlONXQ?=
 =?us-ascii?Q?g3LbbA8rwuG9JwFkS6A3ScgTtW/pSJXlycYHkv9DpkJWNfqSuuj6l8Z2G8yx?=
 =?us-ascii?Q?tRdVGbAX41WZ+zeYvt4XvjfIoPkt/r9QxSvugeh83AjK2ZjfSuq2mEwyH17t?=
 =?us-ascii?Q?DL5Kt6+vWt9mxnpXAf6VGxRAkNJ9Kjd7vzQMewJZi4F3l+abdHtpbdb0hm3a?=
 =?us-ascii?Q?zCjdR/MADBrOrsr06ZKMbTLeWOoiHTOmW4MyMQWAkXkRhrNoOyePcJ+1oZca?=
 =?us-ascii?Q?Ni4qv1rAYIvP8I+3QVo+jhGEMvr+holULx0ghPTIcLJArgNiQe/2h25XAla6?=
 =?us-ascii?Q?5YEmk6Cd8ma1MzcG1W+D2+pj1G+CVEavxSy+1t58K3DtCegxvqMtdkY7S+D3?=
 =?us-ascii?Q?/fpQFRe9ikS96+n3ed/TYnH6CExAvob/1k0DGuqCG06L/QvCmZgUGBLbE9xM?=
 =?us-ascii?Q?hJf9XPLf3rRGOwVD8zia+tR0Dpz9mV/HUhWTpSHb7kz4+xDItjnRjpAtagXF?=
 =?us-ascii?Q?VF63gGRy+inR7201irp2ZrYiCzDOkjKNB4wUfNWjG9CcnqEJzaJJQtcK9WdN?=
 =?us-ascii?Q?PByVhE6bFGS/1OEW7R7Jqk+JKIzytqQrZ4Mzl7wf2YTidC3zb3VoU6UQ7/44?=
 =?us-ascii?Q?8bfdCYG/coCxVLfLMlcHXWEo/I5kERTwscGuNoMVg5QmGBWdzQ4kBOJpLAk7?=
 =?us-ascii?Q?UL66b0c6RbM72FCK7mQwLgLZTC1cWw/llaTaGe2B+hmoCE+DzGf5Kw7utlXl?=
 =?us-ascii?Q?szlSaOJLsqCi16dwB/LMrd0Lta4kfDxNyLgNMpyntYfx3WxuRHU4LFWEd+Xy?=
 =?us-ascii?Q?sBgbQCFGeYfMR4mHmXEfffbwcKqnS6Ax5tlmWqMCnvV/eENiz18qvPv4pcak?=
 =?us-ascii?Q?lxOgaotOzy4ulYLOQa8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae8e9b9-4c9c-4f7d-18cf-08de0a7ac8dc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:06:00.8650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGL0fM3XHj7fMe610U9oRpGjqLwaOJXyF2c1KoxmFQh8Ty2FFA/lYGS4gtxGPzQUTsNnjw5ukiZsv2X4s5xkyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10590
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

On Sat, Oct 11, 2025 at 06:51:23PM +0200, Marek Vasut wrote:
> Introduce struct dc_de_subdev_match_data which describes the differences
> between i.MX8QXP and i.MX95, which in this case is one register offset
> and address space offsets, and pass it as OF match data into the driver,
> so the driver can use the match data to correctly access Display Engine
> polarity control register on each SoC. This is a preparatory patch for
> i.MX95 addition. No functional change.
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
>  drivers/gpu/drm/imx/dc/dc-de.c | 44 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/imx/dc/dc-de.h |  1 +
>  2 files changed, 31 insertions(+), 14 deletions(-)
>
...

> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
> index 1ac70b4f6276f..e054ad88190e1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.h
> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
> @@ -42,6 +42,7 @@ struct dc_de {
>  	int irq_shdload;
>  	int irq_framecomplete;
>  	int irq_seqcomplete;
> +	unsigned int reg_polarityctrl;

suggest add pointer to dc_de_subdev_match_data, in case need more in future
and avoid copy data again.

Frank

>  };
>
>  /* Domain Blend Unit */
> --
> 2.51.0
>
