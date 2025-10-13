Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD769BD5EEE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFC410E517;
	Mon, 13 Oct 2025 19:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Yhft0EdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2410E517
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdPGLDsAGeBqtPrA6oUwABpjgHmHBAs1j7EmDtgwcIoowtsZsBYEWgNGib8rlELkgAtBuP72AkBQKFyJGa0gbf3dUqMqd0SEgoONuuVqbLoxZDTeU+ekRnaN7ERZDOOhP6HmgiTMtOpLFqNvgKBcwxuP39LGidKtDgG3Kwp/tmSHDwVTUIOc0BOFyRudaRXuSZRhcRoyojNNoy9QHVDVjEhhe5SlqMzPR7Bl32xuSMBd+OjI342i0bQMslM/y9dCgIQyr5UJTf67BnkkcClOuMrGiSOX97NqmPOW17tltLq0gJhvPUqPBjlC5sWGNJ28CKt/t7zpjz2TD6Jhy8sV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMtCrVwnsNt/zLC50DusgNCHDomYiqmHsTjEBk236Pg=;
 b=CK9jTA7jh9yGwxJaAuNTmHayqi9nwL3kcGZJXXytHpwCVzZEnY3o8CDGOIp6wvi99+4BYGqoW7nzoLnAiPgh++o/6wlfPyKXmsMu52Gtt9UlHcdV8yPAhKNtJSDeJC7q6xtuYjJQiXmTIiGZDYbt37UjRzJTgTkoBr4LcYzWjTfcDH4tpHRiqkamclQndYM814QWA5E7pZevolX2RPIgnYS7muGu1FWtIyl7mQxBr4gZMKcM8N0ieUyJoIPo34+d8MycxAFrunl5y90Ip8GR5t741Nz7B8/gKRRyZzYNK3RDleujrWSknKIT/O/gr6RX+LQ6Ow51sSEW61V0fAqB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMtCrVwnsNt/zLC50DusgNCHDomYiqmHsTjEBk236Pg=;
 b=Yhft0EdEPFw7g86zd9gdnEQGbC3nxZUItUQfuIbD92Z60oiqhM9KZ4pgWyec+dWbqlgR/gPbQxik5e88LWdeCDPMvyGmAoU4vfwzJU920Li4U0yDDFLhFtfr719NNkqSBsNKewJ+xkxmD8KNntBYyBZAGlfBTflcXx87fypFap5PsFxPjA19hzCH4hQURPEb8h0dyPA4UiUhJCzzIdbiQbs2IBeOXZkFiRGmgp6eXX1j1Brg0mePf0tKeX6kbTK4zxYrl8I0oOdVn/HM/EVIg10xsd2dtNr+95QkVwIWOg6pY0dungbKozDIibarwO7J9HQz3ISK3WOTxCo3KmYRdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:25:09 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:25:09 +0000
Date: Mon, 13 Oct 2025 15:24:59 -0400
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
Subject: Re: [PATCH 36/39] drm/bridge: fsl-ldb: Add i.MX95 support
Message-ID: <aO1SC9XrP6cJXDt/@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-37-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-37-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: d222ce36-cd34-439e-daad-08de0a8e38e6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sEAz/WRsdrx3CJMBi+pHdEpbmcTjV2ZnAOP1A3QpnY85aCNyUqd8Z2HmPE0p?=
 =?us-ascii?Q?GNuchJyT1lurZgk4ySanupYp31JMDokW0Ynd8/f6o+VWg7DOjXIOyv5g7ov4?=
 =?us-ascii?Q?MDfXMUzHeQDjSuopUmNsC5rj29jDF5UQA1+rL/vFmfD68VxGEg/T+qQXdxh/?=
 =?us-ascii?Q?M5iPuwnkoPyo5ZO7AVOOQ2NvTrumW3fF8OFQOyNa9wby6qXOaBo/lcCEeoN8?=
 =?us-ascii?Q?w8Nu1TnyCKdb2OifhdTEFhON6J3aVNFa3ByGUS89pa94ApXpod2tvsr1CYkC?=
 =?us-ascii?Q?5r/5uy9YkmYFhqfIwFx6iBSOdbNR2z0UswPwIe5ilHrtzP9iSubobOrY5nHR?=
 =?us-ascii?Q?zaop50xPWRD2vfIGGUPwLCHxi8O9uBm+zAV51eNoVm7kytbMj2X+BSlo6QCZ?=
 =?us-ascii?Q?hunPbODM+vqiS//Ntm/YkctGxPFt1uH87VfNw8p1O3k3Ljn8dkEowhwfO1+Z?=
 =?us-ascii?Q?DSsJQSNhlAGphv5q+TqUSF+fyUvtQ16BhwS0ICALz8Aic2/UQOWx2jbUrrZl?=
 =?us-ascii?Q?5YYcRKcYsQ/RqH+pDc6rBcggfQ1BBwxT8vqhABdJAAlyeMLPsvYfvXFeAkMX?=
 =?us-ascii?Q?Yqo5BaoywFJbVDtwCBORVQ+t1mWEQrGzVQWnXhwPBarrm5HNH7+vN0a/3dgj?=
 =?us-ascii?Q?xaioPtZEw3VTggLMfOMR91JGdGRFeZjtxtCKvFExXBPqktTNEW0heC2g8lF3?=
 =?us-ascii?Q?f0fTTrys+bYeqZiEkjCFIJK8aIH1g5DwM1f1+dy+04LRigrc13qC2ORBY/oR?=
 =?us-ascii?Q?JGGjvXMxyGKgB9g40g1qBABM3x2gvxk62EMyNWs1x2lW9Tkg96kApbAoE+UD?=
 =?us-ascii?Q?+fb19uvkn0g3843t/Unk6G12XYQ2xfdB1RDi1hybo11pMEGGNaje5/Hd8HbL?=
 =?us-ascii?Q?sqC+BMv8rzesLsecxNQZEaMxWXBgEISyDH3HeisTXjnYClxy2vOnfsslt+h/?=
 =?us-ascii?Q?FLHoyHyvgJ2eknqiIbzg4FASy6pkGd3ykhqlZFPetC4mQk0p6xpFhi/1T97l?=
 =?us-ascii?Q?eO6pNvj35zv23Xt2jZwzos4EXl2/OHt+TJxobvpRRdZMGwFGbDUW/TfzUElg?=
 =?us-ascii?Q?FqQ5IFe1AVw3J0EJ78qyygnqjkXFpCiZyA7k4xlju00ZlhIymVB88SVLFDSB?=
 =?us-ascii?Q?w5ZDOZ6W6MEWMeRl1FJC7MnOtDGSDKsI8xbv7NJ33Phs9pm7Pme+GqMC8uTm?=
 =?us-ascii?Q?S0iiVVHMrVJAeY5AR72N+/Nr1anTDWhz+6pmYtWozOozyJZYEXsrcNLrOpYg?=
 =?us-ascii?Q?xQ2L7P2cK8Yq41vhSwJsxM1zzkGO+Fkm2ZFMRlh+zgZObcW7niiz/f4dmcAz?=
 =?us-ascii?Q?rkdEQCb3cLo9nLTZdNn1yR6ROVVORNrk/yQleM5bs1J4XCD3OZIlY+BotD6j?=
 =?us-ascii?Q?qxA9azFd4optqVxW09rwJUrpMfK/ZM73P50CHdi9/K07FM0b58gC0ijYGIka?=
 =?us-ascii?Q?axBywxE9TLbwXkvUqSGoQc8PG9Xzd3dCmfZb29u/xD4NWph/rd0+wsy/N4gL?=
 =?us-ascii?Q?7mi5J68tQdUiDw8ZGncbtVj3BomU04XOSiy2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lF5nSeVzJTUQcYwlgpZhtyO3LJruhHPkjBDqh/aDWtsF0fN7UvH0yVAKJ9ld?=
 =?us-ascii?Q?6N1yIUKvTU5q0FdNTuBmzueWnx1nVbo+H6jYn5u1r9/M+GhX978ptCWqHnR/?=
 =?us-ascii?Q?M7tEirzlvIq9iEQuoBeLiBzdTWpgYKBuvvvf6VS0U7AIT9A+oBg4HS8Jvoc3?=
 =?us-ascii?Q?Xgn9D+3Z+m/N4SNaUZtDJhgDLbeZ9AqwFj6/4CDitCU8VxeJYLB2cV5yfT9Y?=
 =?us-ascii?Q?oVBKZQEX07Yhswpk275g7oU5E5T6zGi6gsgyvy4Ftze2Y/sEL1X19HYwzQrW?=
 =?us-ascii?Q?8RRQweyPDyfLdujt7CVKmZgbDED0vtlQRMQ3xOAi4l0RwwhtTW77SCpQeNgC?=
 =?us-ascii?Q?u/Bk7U4Z4Qxd2x2B+MLA9zI0QbJwCHQtwDNGVJJF7gg0ZBqiFaPg3vrBlEQ6?=
 =?us-ascii?Q?4bhknfCPpNXZh5DlKBqoeXo6IXGpazFDqqTCDjls1l3+1jNHibIeiw5QOvOg?=
 =?us-ascii?Q?tG/6XtMGjcazdFxXT1Bs1w/c+6Su7YEswimw9iywRSxszRxEoT3N28tHl1y+?=
 =?us-ascii?Q?e04oMRbsdqe8DDEgCjoHQNiuqP1tXbXbWx/KKEMBjomA1ayeTB0jl6ZlijHy?=
 =?us-ascii?Q?xmRS60YmOGSCNIWrMRrOMlc56+ft/HcIJQ45cGYMMcYL6t8ynkDE550R1hRq?=
 =?us-ascii?Q?l6elDdxmxq9Jx8EwsamxncQMaZo3wLhJ75ryNgXOkk2aL3mrXcuy2z6/Uhrm?=
 =?us-ascii?Q?10b+BKFfmVvPb2xwLJKNND/NKasMEIdWNA/mn+maLfzdjXtHr1ItsPRbhX4V?=
 =?us-ascii?Q?kb/mgbBddbn7WPVnSxxfukFvmySVmPKnWSQo7qdLrlDuyeo8k+KcAZOcy1M7?=
 =?us-ascii?Q?l5Qy+4HMr3BvscxDdS5UHJ/FFApPH0Iy+/Ir6BLASKmWoT62D1ugxfeP79r4?=
 =?us-ascii?Q?2r8iiVT1hd+WV8ZzAXk9RwMThyutLvVJpsyR7Cu/908HjRV4DS0FZ2Pe7m2Z?=
 =?us-ascii?Q?4LnglVobHXr8ApkT4+TsazMITvbY3Ug/vRsJS13HhNlnXRe3Pxpidz6j1g+7?=
 =?us-ascii?Q?2YH6+neIEj/5L2LAq8aqPh2yWm6EenqVGBmlBuYDpi4CzaH0sWKA6xSNxsNp?=
 =?us-ascii?Q?bW8ppweOZig+ue3gFpbd62six7PcNpaFQp9+pI5YgHN/2c874DV0jmfXvLmN?=
 =?us-ascii?Q?y/W/w8WNO8zMopkC4VXfuqcEXhEFy87nC+6O2g2O/xMn+NxyXl2J3mFbjgAu?=
 =?us-ascii?Q?IS4P5aW5/Y+tCJrEtCTZYm098XrmuzwxvzU+9KEg7evGCl9OeRcqAd1hORDY?=
 =?us-ascii?Q?hOkt/aIsP8l0Vpj0Tnn3UbbdoORDo8UpfddFzAnanFfrNfcJ1V997LEfwXhR?=
 =?us-ascii?Q?7pVfxkIvzSSVvBMx8k+tKfIDD5tSirfnYndTXNyr1cPcjMKMIiktKLuK6RtB?=
 =?us-ascii?Q?1B5bFV09RJ+5ME039Xe2IGDhXJB/XMIWctqvvy3kW46XCMGBgKKH2CMDMv7h?=
 =?us-ascii?Q?c0bHB7RUeu07ia8EszWh8EVbcyZeFV17K+OpSyokrcpaj1b/+N04cutJOgAM?=
 =?us-ascii?Q?CfM7yss+TOJ3t3Uwu0J4v8Qy28zFyrulgDqiQpXBDThpzOj9dy3N5bTiSU0K?=
 =?us-ascii?Q?kBKMpcdsQKsUvA7loTk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d222ce36-cd34-439e-daad-08de0a8e38e6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:25:09.0904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/g5fzWgP28mWZyGu9HcU3kHCJVejycqETcCh5binnPb1FOMBHbx3/lc2XWE/DMu+fXDClXfms54di6/ylBUKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708
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

On Sat, Oct 11, 2025 at 06:51:51PM +0200, Marek Vasut wrote:
> Add support for i.MX95 SoC variant of the LDB. This variant supports
> single channel and all configuration is done via single register,
> but there are two instances of this IP preceded by another bridge,
> which handles the dual-lane configuration instead. This is also the
> reason for special-case handling of input format, where the preceding
> bridge needs the format details as well.
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
>  drivers/gpu/drm/bridge/fsl-ldb.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index c54caea0b63fc..1560438e4cb10 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -58,6 +58,7 @@ enum fsl_ldb_devtype {
>  	IMX6SX_LDB,
>  	IMX8MP_LDB,
>  	IMX93_LDB,
> +	IMX95_LDB,
>  };
>
>  struct fsl_ldb_devdata {
> @@ -73,6 +74,9 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>  	[IMX93_LDB] = {
>  		.lvds_en_bit = true,
>  	},
> +	[IMX95_LDB] = {
> +		.lvds_en_bit = true,
> +	},
>  };
>
>  struct fsl_ldb {
> @@ -235,7 +239,7 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
>
> -#define MAX_INPUT_SEL_FORMATS 1
> +#define MAX_INPUT_SEL_FORMATS 4
>  static u32 *
>  fsl_ldb_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
> @@ -244,17 +248,26 @@ fsl_ldb_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  				  u32 output_fmt,
>  				  unsigned int *num_input_fmts)
>  {
> +	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>  	u32 *input_fmts;
>
>  	*num_input_fmts = 0;
>
> -	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, MAX_INPUT_SEL_FORMATS * sizeof(*input_fmts),
>  			     GFP_KERNEL);
>  	if (!input_fmts)
>  		return NULL;
>
> -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> -	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
> +	if (of_device_is_compatible(fsl_ldb->dev->of_node, "fsl,imx95-ldb")) {

You already use drv data, why need check fsl,imx95-ldb here. put below
data into drv data.

Frank
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> +		input_fmts[1] = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> +		input_fmts[2] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +		input_fmts[3] = MEDIA_BUS_FMT_FIXED;
> +		*num_input_fmts = 4;
> +	} else {
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		*num_input_fmts = 1;
> +	}
>
>  	return input_fmts;
>  }
> @@ -396,6 +409,8 @@ static const struct of_device_id fsl_ldb_match[] = {
>  	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
>  	{ .compatible = "fsl,imx93-ldb",
>  	  .data = &fsl_ldb_devdata[IMX93_LDB], },
> +	{ .compatible = "fsl,imx95-ldb",
> +	  .data = &fsl_ldb_devdata[IMX95_LDB], },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, fsl_ldb_match);
> --
> 2.51.0
>
