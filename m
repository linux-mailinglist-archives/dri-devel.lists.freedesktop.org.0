Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436CBD5C41
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3374D10E0D8;
	Mon, 13 Oct 2025 18:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UC5rhgtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763CC10E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc0SIc86pL0uVtjNsgT6Z6vFFh1tTJ1OLuPE0jYMvDuGhlksABitwf+FsoLKtjs8mTdvOB7ZLctrSdYTPf9B2r9mPDl3yxEN3idEsO83Ev/NemBXWPX6yf7Wgvy7bpLe8TawAswlDkQ7Fc3DwvNRGSeKZQPH7+YGZk+BxR7OHX4BfHQUDM9Py80Bq9TEhZZwOerXExlF3PIi3hlojGG8QaUBQQEdaFWzNhOmMIs/O+nEeQG/aiqRtT1VWEAy48ONXH9arMTeo+PrYIuP9c+VTFyjJJ+mbmD3ZCZSMQkah2YlCC6gROgPMz09Ji3ayrv0P9fvuLp6HxfKUz0HboyX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2ycyuB0567Y748aC2yxdNjzrwoaS3hUb6XlZe/qTe8=;
 b=u2MYKlAnc1/GzAYJEEeggRAZUAd/+bJC+mnu/RCB4JHcbXQdYrkomdOv6ateIkqWabjNn9qG04QdTIIU1Q7d1YNpxGmc3vxl/It1UBCnfps/ikX4ouj5k0SNqeaIItM+h/5FL/uzQwl29HXkP5IscawmuF/TzJJ2kIhZPa5rZDiYS7mqLNPs4wP50F3IDT9DASHRhj1ihvfVOtVeG+itZ46Xpf3QW/x8ssJnICi5PxqEY/OT5nnj2NEmIpBQtrQijYU2aZ/QWFIh7ZwlTaKCFRyJPxNu+X0UxYzE00LG3YDfTCyPMMBaBg6OdYxF1m7qNotUNLxL1trl0CVYgqp6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2ycyuB0567Y748aC2yxdNjzrwoaS3hUb6XlZe/qTe8=;
 b=UC5rhgtk/HBz2QZwEeUvwo7deIN8NU112IZxF297TNuTKAvzhVpNzkHIAXE1KiFd21YEizdvzz6EeZPLHVRc+sOXlfusHs3miQQhhiCRxTIToZdiQB+xhbdvBAeOIZH28puqz2M/t/p6/Hfo+YIkA9U1rZtSj7BAHBtFInuipArPdpRmkKES6vq9Uj2/7O6pPVXS5Zf7s0m4CAljOcLKexOwzDjRRCm2P229HDcOp5v/g2FsowZFA4gqdreKvzRNfh0MGiK3dUMlNV8vRayWecFUiiWguRRLBL/YVsHzchwRdGoA19P7HduwZqHX1Ji00W7aM3t0FEG4yB6FO7GZFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:45:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:45:45 +0000
Date: Mon, 13 Oct 2025 14:45:35 -0400
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
Subject: Re: [PATCH 16/39] drm/imx: dc: lb: Pass struct
 dc_lb_subdev_match_data via OF match data
Message-ID: <aO1IzzeZIyuNMVJ4@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-17-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-17-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e9591e-aab9-445d-a96f-08de0a88b7ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1jmMtOWoVQrANWoTh1FZg/3JW6xJLFucAxkH4IXzqOwETQvEClV4xzWuwy2O?=
 =?us-ascii?Q?qZ8YRFit8+rWs5UK01/F/IW6ZyczUj6mIqIWwcbgbDsjaSbnAi4fbutIAUUF?=
 =?us-ascii?Q?XkrGzg7QsAHaey4udTZaL/D2yA+oEA/UDkc5t6juwpiTR292/UYgtmpIrIbQ?=
 =?us-ascii?Q?7kw2tAihGH1VOPWDfHK1WdIct2O0e5U8MNX4QUtTLgyTF3VrjaMV0GAUMT3t?=
 =?us-ascii?Q?9H8OT7kjd0zXexShR414ms4568ANP3g3hgcCwX3Nn94PJUufTAhQm5VVf3fR?=
 =?us-ascii?Q?sxIU/JdKZ3vHYGDBr8wjNpu80wJD7v1mj+s+V6+0gVqYVB+RsAcqGzWKhXqM?=
 =?us-ascii?Q?6umrVOaNkji4BhTY6VENoRVG864Fk5G1igIlicMSsjWcKAg1ytBy8LIHeQCw?=
 =?us-ascii?Q?E22EX3RCUyHeD5pP8z2FWY2N9MZ2WDjExk3f/k6kmgJ15SVASk3fuqe20Btl?=
 =?us-ascii?Q?Ss70g6xaSCImbDM60phYe7cMGQJgWU5x+o+GIX9gjHiKo/tWUfO3E+FOTg4B?=
 =?us-ascii?Q?Oz8YqlyiqYkpza2fWeoFyq3UTE+RA9drLbuowM4tG1E5si0enEMnRiNQprqF?=
 =?us-ascii?Q?mgxAwT0BzvBMtFQwDnJuKaOQ8Fk0GtwkdCpaCbK7sPRYCqJRHwvXPxGsrHXM?=
 =?us-ascii?Q?l6QWixek/NSa2poLvs+YGMubZgGfKT+bXiQ1+7G6KALQDpwsQVwZxfrvC4Vz?=
 =?us-ascii?Q?DwAgFx3tks0xyEJ7hG8R6RXrtJUvS3jwAPDKrTUtwEeEH1VhiyQt8KsR8EoH?=
 =?us-ascii?Q?WgD90QSUDKHGUDm3cDvpBumjG2BM3gOUmywqwkLGHi+BSaeDt5HR+LEmpkUk?=
 =?us-ascii?Q?wuTDwZWidBOIizvgahBJoCjNDg6kYn+nwYug0ZPdPA3dVufHa9h1HH5FJTu5?=
 =?us-ascii?Q?jMfOoDR7umBaLCJKym4c3/vkXGWRMkaU/bSlbsVj1bO4r+qKEhSvkg7Aalfm?=
 =?us-ascii?Q?5uUDLujE9b+sYDRGnORTG+bXsImcKiPlbN/LjB7TeFvaUaUyUZQ6zn5xN12L?=
 =?us-ascii?Q?yX4G1/eEkB63eH2wkElGBCLeYKFPQw4Y1ZJOq9Bb8AFB/LKKmW64ViprRHIg?=
 =?us-ascii?Q?7w3lzzYkPjtSbru83WjaWmLqkJ+l/lsDk4sO+XBWVRc909Gg+UvjxcSMBAOy?=
 =?us-ascii?Q?zomOLe5yfxIBEd7nYQRECkLJXqGLoHMSe3/uFaxPROLZXGDXEEfBh6aeOknd?=
 =?us-ascii?Q?8vihbYzhF4Ym7FExFuhgwNFEljPDbkSn4Kfn7ngHCZqNy0CMNzVYO8/G1jRk?=
 =?us-ascii?Q?T3P8BVt9bwwrp2fENi7+6RfOMNFOyrgRlGQNXkSu+D8Hbn/1CPMICoFyJVPK?=
 =?us-ascii?Q?upk2PEIPkTPqhxqNo7quMq+6VQGMgEPPNyOz1v2hcMbhwIBgR6GmNjnkMCsJ?=
 =?us-ascii?Q?IMiup5LN+AMIjlSnkKwTZejunjl8fHj3D9oUsatN/zx5t/tgCtqzX5fXrYr7?=
 =?us-ascii?Q?1YIDFwv1UlKOfCqUMIiN9AaoB6vdKB5tduyz47VxxuAzpf1n/x7ZqU5l9AcM?=
 =?us-ascii?Q?1YelleaYX+ToQDzxl6X2BAkYWgGXucTfG6JN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VS4a0olMkfCysCZvHFRuGLPnvy/07gkAUgvJc1eZ6m91ZvDIZe/4Os1IUcWA?=
 =?us-ascii?Q?xfFYW79l7r3Ar2YfwFJ+QtQ3KBHG0vuRc8VOlgyQEL/P0cwfsSuryIYM9HAX?=
 =?us-ascii?Q?EiqabX7YazrUcezAnWwRKuAhBYjFT3MpDTqsv0tRD7lvuh7s0XzIXGtvPLve?=
 =?us-ascii?Q?j8dUqWMjCIigrgxr33sBFp49BUcrLl5psOPyTg5zL9C5zsDHYhjVBE0WJddk?=
 =?us-ascii?Q?ZqYDgfgFHxf6BwCNG+rnFRA711KfrRdvHnslwfqdFGsfZXkEasxpGBTfhqWA?=
 =?us-ascii?Q?wacWm6xVN89ZefVLZxlj4fWHaOcBpKUqeFH7JYkYY1Z229yTOnU0jJx5TNYx?=
 =?us-ascii?Q?LV/rmPcReHU/V59JFxN2D+zE/0w4pcKkSmb5x7aDnt6aqgQeckPqmgjDpWUN?=
 =?us-ascii?Q?kn9gUkFsI9dir9qkXhqOK0E8UbEXUkxnncJlhD9QjL375y9V6FzbXzsaniCk?=
 =?us-ascii?Q?D8XCXUljW0jJiPn8gvOQEfonm/JfHtZph7BLUo6YdWzuN/c35HReaFcc6miy?=
 =?us-ascii?Q?6RDGSHB2EZt0dicCsZhDn9GwcO0s4buNyTMlyMOTIvE2G4MINGqbbQcPB25B?=
 =?us-ascii?Q?3Jxy8wn4YyliUeU4ZVmI5a9CE1YbRIdN0ttDowbOb9irGkXKH3cB5MZLpF0k?=
 =?us-ascii?Q?WZlKAG76M9p6e2DSeFqie/D7b9FLkRoAwuESZ3aDmBES+gjd5HMJobps82jB?=
 =?us-ascii?Q?CeVNcIaW/ZAaFYf/kuxnFi3tfPm1dRVQ9T4lV1gRpK1e+x8LBcaosCHyC47Y?=
 =?us-ascii?Q?CTdtDH3pkh78eQakmSLvJcaIQ4K9nSFi0SsWaXDgwqnmKBKGMHa/V6Z7Hp0I?=
 =?us-ascii?Q?X4MM4M6FHkBlV2CohHcB9xoZLE2VM7Y8c8BvmpuRl2f+KXbR5lThLMimPnU7?=
 =?us-ascii?Q?dZ634QnSaqtwizvF8R5k5K5TF5FoTX/B8OKQ+nV3cgLDHVVrm8SSSMKe92hR?=
 =?us-ascii?Q?ObNSOrPqh9j8A5cq9cPkF7zCIhmR+DsnDw8UehknyA9bydsMeM0DLIwwEIkW?=
 =?us-ascii?Q?3udqRH7q4tWQsFcYxFNXaifZikjPV6eSr8WWFRTP6CP4go3pIt+i/5ujnfr+?=
 =?us-ascii?Q?xIDgAUZemTytv27amFY7bpfKBAVW7RrsCfSvdXRhRce6gWU9qGf9SIwVf3xh?=
 =?us-ascii?Q?/Px7DRK0rwDGSUMXcaQIKpdWwlfHanNSPAEFo9capDRCR+vwq2MC8QdogTVY?=
 =?us-ascii?Q?kmGEEYS5h82Q353iP2VMG7sCf7QU/8XfEQ2uJUtaGK3ROXXjqCEbZccnVRFH?=
 =?us-ascii?Q?UDaGafiluO6xZvWlsbh4jJeK/60ffK6SmWJT7CYWsKyRVI+BU3Rjt77UzOIg?=
 =?us-ascii?Q?CLUCV14RsFLN+x7II48cI5FmfViBR3lpw+UTipQ04QHaTkqtjP+H0YO70esm?=
 =?us-ascii?Q?mU8hyXX5cNl/40dX58C6QQUDGADDF9wT6wCZZf2pBFBY7Hhme6XaTp1XDfmC?=
 =?us-ascii?Q?WwHe7CN2hoECeF8DgReh+MW9egAMCN4jMVgbZNGpimB0djqHmmSNGMnTIl9G?=
 =?us-ascii?Q?/XjvLWzjaliZh7LQYUDVE+S3cH6kTBUwkKpHlEvISU5+7S4zPDWGzVgyPowy?=
 =?us-ascii?Q?q6LpxzgTyGra7LQwJeSjgPjCGGksENtQ1dWwVNu+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e9591e-aab9-445d-a96f-08de0a88b7ae
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:45:44.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP4KixiE8UxgoPeM3fVZlMIVrDKO+bpMl8bVhya/kqOqtiJNw97qguOlt2H9x0UIU1SukL1weSSKXnDbyayQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948
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

On Sat, Oct 11, 2025 at 06:51:31PM +0200, Marek Vasut wrote:
> Introduce struct dc_lb_subdev_match_data which describes the differences
> between i.MX8QXP and i.MX95, which in this case link ID mapping as well
> as address space offsets, and pass it as OF match data into the driver, so
> the driver can use the match data to correctly select pixel data routing.
> This is a preparatory patch for i.MX95 addition. No functional change.
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
>  drivers/gpu/drm/imx/dc/dc-lb.c | 42 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/imx/dc/dc-pe.h |  3 +++
>  2 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index 619353456743c..ba9183b244ab3 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -56,6 +56,14 @@
>  #define  YPOS_MASK				GENMASK(31, 16)
>  #define  YPOS(x)				FIELD_PREP(YPOS_MASK, (x))
>
> +struct dc_lb_subdev_match_data {
> +	const enum dc_link_id		*pri_sels;
> +	const enum dc_link_id		*sec_sels;
> +	const enum dc_link_id		first_lb;
> +	unsigned int			last_cf;
> +	const struct dc_subdev_info	*info;
> +};
> +
>  enum dc_lb_blend_func {
>  	DC_LAYERBLEND_BLEND_ZERO,
>  	DC_LAYERBLEND_BLEND_ONE,
> @@ -119,7 +127,7 @@ static const struct regmap_config dc_lb_cfg_regmap_config = {
>  	.max_register = POSITION,
>  };
>
> -static const enum dc_link_id prim_sels[] = {
> +static const enum dc_link_id prim_sels_imx8qxp[] = {
>  	/* common options */
>  	LINK_ID_NONE,
>  	LINK_ID_CONSTFRAME0,
> @@ -137,12 +145,22 @@ static const enum dc_link_id prim_sels[] = {
>  	LINK_ID_LAYERBLEND1_MX8QXP,
>  	LINK_ID_LAYERBLEND2_MX8QXP,
>  	LINK_ID_LAYERBLEND3_MX8QXP,
> +	LINK_ID_LAST
>  };
>
> -static const enum dc_link_id sec_sels[] = {
> +static const enum dc_link_id sec_sels_imx8qxp[] = {
>  	LINK_ID_NONE,
>  	LINK_ID_FETCHWARP2,
>  	LINK_ID_FETCHLAYER0,
> +	LINK_ID_LAST
> +};
> +
> +static const struct dc_lb_subdev_match_data dc_lb_match_data_imx8qxp = {
> +	.pri_sels = prim_sels_imx8qxp,
> +	.sec_sels = sec_sels_imx8qxp,
> +	.first_lb = LINK_ID_LAYERBLEND0_MX8QXP,
> +	.last_cf = 5,
> +	.info = dc_lb_info_imx8qxp,
>  };
>
>  enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
> @@ -152,11 +170,10 @@ enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
>
>  void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
>  {
> -	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
>  	int i;
>
> -	for (i = 0; i < fixed_sels_num + lb->id; i++) {
> -		if (prim_sels[i] == prim) {
> +	for (i = 0; i < lb->last_cf + lb->id; i++) {
> +		if (lb->pri_sels[i] == prim) {
>  			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
>  					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
>  					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
> @@ -169,10 +186,10 @@ void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
>
>  void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
>  {
> -	int i;
> +	int i = 0;
>
> -	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
> -		if (sec_sels[i] == sec) {
> +	while (lb->sec_sels[i] != LINK_ID_LAST) {
> +		if (lb->sec_sels[i++] == sec) {
>  			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
>  					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
>  					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
> @@ -245,6 +262,8 @@ void dc_lb_init(struct dc_lb *lb)
>
>  static int dc_lb_bind(struct device *dev, struct device *master, void *data)
>  {
> +	const struct dc_lb_subdev_match_data *dc_lb_match_data = device_get_match_data(dev);
> +	const struct dc_subdev_info *dc_lb_info = dc_lb_match_data->info;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
>  	struct resource *res_pec;
> @@ -281,7 +300,10 @@ static int dc_lb_bind(struct device *dev, struct device *master, void *data)
>  	}
>
>  	lb->dev = dev;
> -	lb->link = LINK_ID_LAYERBLEND0_MX8QXP + lb->id;
> +	lb->link = dc_lb_match_data->first_lb + lb->id;
> +	lb->pri_sels = dc_lb_match_data->pri_sels;
> +	lb->sec_sels = dc_lb_match_data->sec_sels;
> +	lb->last_cf = dc_lb_match_data->last_cf;
>
>  	dc_drm->lb[lb->id] = lb;
>
> @@ -310,7 +332,7 @@ static void dc_lb_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id dc_lb_dt_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dc-layerblend" },
> +	{ .compatible = "fsl,imx8qxp-dc-layerblend", .data = &dc_lb_match_data_imx8qxp },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index 7928f947b0cef..492d193127bc1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -65,6 +65,9 @@ struct dc_lb {
>  	struct regmap *reg_cfg;
>  	int id;
>  	enum dc_link_id link;
> +	const enum dc_link_id *pri_sels;
> +	const enum dc_link_id *sec_sels;
> +	unsigned int last_cf;

Direct use pointer to dc_lb_subdev_match_data to avoid copy data to here.

Frank
>  };
>
>  struct dc_pe {
> --
> 2.51.0
>
