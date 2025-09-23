Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85CB9729F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 20:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3677710E15D;
	Tue, 23 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DiysRj+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220A10E157
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dli8eLTjSFRuENIeczqGsvpHmRx4SJWhsNlF0XB22IOrCMPftx6PMtA0wzsTfLvdC/RvbUm3zR9erMHy8pJHtmKy4NwY02H08T0oJsOHXJLMFRJe3ThKbyeab2x4qH9SH/JmJ/RMLnsORNVdg+HZMj9ehV+NBtrSQPnBJH6L+vvtIcAv2qCVO/8EPiTIjuVfniqQue/1hfP0Hv/i9Lw1kczoOCys6+0HqN3uxYZ149NVmm7lMrdrdFOWt10BtocyNHoKD+hefH2Kj1jj4drPfjlBKYdCW0IJ/agxvTKL7azMwhDPMzDITWTNzVz6WR8Xeq7ZoRQdfjp3LvEhyBG3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtNALJRMR58MML5TWR/be8WIIR1mw2taniKCpvP/U3k=;
 b=rybihzyKKtTd4I9yaY+XGJoR7bI7O18MRa8FnK7r0vJQpyNdVD3lrKLvwAkDOYklyYEKrMLsWlq/cjRVnYDFdBEllIwq8IYRDDEy7hWdeZFx7B0Q+FiPkNec2CiFLZkR3MinVBHEW9hglkBudAjT+A73Ea4z6ul+BZ/dz9zj2Drvke0YKbuU17mNFrMrJDq0YTXM0uliIaSY6TAKGGzTpzSswhpwm/vxyns7TWXa+tPvUw8uTr7z3rqMsavUQHBqy3SStVOH/m2vKqiUzNLU1ewwJ0/Mk5rsEQc35CUmGdW8Ap/oONV0bNJ8qMHnQ95AiZzviYJsIT94+zBo5Ih+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtNALJRMR58MML5TWR/be8WIIR1mw2taniKCpvP/U3k=;
 b=DiysRj+ixVAc7BLQF9BFfJ6pkvMHMiBdtPd5av860u6hOighg4GBw1Ey46zU2qkzTsvSX1NAqhsO+NFYudyrXA19Tl88ptMKHTvudgu1NzFLSqb7XyVL0iBMfJr8acO4MbNwadSc5PhqXnKRlorTJOThgMaxyJDxkT3NPeGQB8wJIB5mQ6P2T2aoERBtqtbWPW5uOsvbChlSlUf2bz0lPtnrAfjjoV0hwkhY2SIu84tqFZiP9+5P6sovzRfabaQKUA/GbvMLBNmUH8w/kHRmf7Lqad8Fr9qukYSid5PwTDLH4oNOmqu23x+Z11EBJgOMikq32peE/UKNuk1KroPnIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB8052.eurprd04.prod.outlook.com (2603:10a6:20b:234::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 18:08:10 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:08:09 +0000
Date: Tue, 23 Sep 2025 14:08:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/14] drm/imx: dc-crtc: Disable at boot
Message-ID: <aNLiAA0TnqfpkqTL@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-5-5d69dc9ac8b5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-imx8-dc-prefetch-v2-5-5d69dc9ac8b5@nxp.com>
X-ClientProxiedBy: PH0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c88906-0e23-45fa-e4bd-08ddfacc26fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7kW/DMaTLFX67h1ais1xWOJYKPYGwIt+nl+ROmmudJLEcBL+Avm2G3s28+7B?=
 =?us-ascii?Q?RNI0NiHncN0zX076vG7Hb0RNhYmjC2t40UPGjXRhkmEqTJgoeSccrWEFZBfU?=
 =?us-ascii?Q?FTPhyaO3QucTgCjM5nzoW/BHy3lgV+yqmvFGY4basCom377idLh9fWIbA137?=
 =?us-ascii?Q?FEIOQL4v4yYfTw4GC01I3OfCuhQHUwc93o48yJTI1Um5Z9ISwkJLhnHJ4Tp4?=
 =?us-ascii?Q?byK9Wdj9YqFP6IdgdIjV9lREabJfhqlKN76AqjWJUTkUt5sul7a0HmdsZfIZ?=
 =?us-ascii?Q?R3dSwotlfD5wpj3nGEE12m1+lQdMYhkkH70ZYjWsj1ef3ocbQGCAetSZBssR?=
 =?us-ascii?Q?DXLesbZJzx4Mc/8ZdbJURUbAzjwbmrK1apKS4svNcYS0CCu2ezrI35+iPjUG?=
 =?us-ascii?Q?VfyhDW1G/Hyuk3p/u33giQvNwS/vto/ipR+c0tJEWrVRxSHuG5ihj2UafU1m?=
 =?us-ascii?Q?ISeJAkvgDB/YknEpfhKn+ruPSghGtLtiS7xL5h345u5WAxg0Jo97OS+KQaIX?=
 =?us-ascii?Q?LbPTOZoySbf2TK0SXgsMHyloZcHhEQoNKf90uKEdBnwuRnKE1SYJzltKJ5BL?=
 =?us-ascii?Q?b96fHwPfINihTlvWEWY2hdd89SjN87ZmXw7iftNhfelu+3zMT+WXQK24oK51?=
 =?us-ascii?Q?5R3kGrPpFkNLRXsM/HjsViwAp/ge7OM24xWMt/VuhP04+An5HAdXX5iIIHLL?=
 =?us-ascii?Q?sEpkyiWIul+ZG8cz3qJxuWpdY43tFmkQ5pfJqugOyZfTS6ZurFDYQiknIrCg?=
 =?us-ascii?Q?LqgDffEzM5ryh7x3zwA/TkzyMMoYWZ0WYd1ja5VhETtQDVOa6pHYOYW2+IxA?=
 =?us-ascii?Q?OnXiJsY02lcqRuSTWxFJYZpLJ0lmZVW3SKlfzU4edecSEgAGvjX1oNCRXIiE?=
 =?us-ascii?Q?ZaqKpg7iIdIE6k7zY1lT8yxxHCtDCbpKeNsl0ISHF7cOz5Rjf/x9W2iOahvx?=
 =?us-ascii?Q?ygbQiY/fVLEHRK8PyWiCnthOs5zUaEd1DELbIaUEkGdb8J9bXkltjxnO/vLZ?=
 =?us-ascii?Q?npzqPY286Y3k6lAKJWvKtf0UoQLKAK3zcheO0Iu0T5XAky9U9gHI6U2Fa+3f?=
 =?us-ascii?Q?yiPOYLrycRsOgBNwkE4k+5lDos+27/XBNOUIED/10XEeICMowBqvetfzn98S?=
 =?us-ascii?Q?fYS8riLpElf6C4zVAsSDOq6aMv0tS+l4tQI8VVuXAEM+aWIS0zK5MtxYL+bK?=
 =?us-ascii?Q?huLc3fp4emuiEtr0MnisnK/SqImWCWNfhF7Uxf6u8WIS4MpO2mM/0g0WucUl?=
 =?us-ascii?Q?ssxrAf/2sbCOK1x8hTBWXPXUTRVe7xvNf6cOGXwZAY5e7Ui+3h3gkANxPRlj?=
 =?us-ascii?Q?jia4d+q0wr8mrLzyp6uaSatYFBeVhTzdMX4H8u+MNFoITF7NuYJ64fXg0KVt?=
 =?us-ascii?Q?yXEUWIBvmBxpoSnpY9iAMNc3+hJQS+0yDhGGvrd25MF1Vtfv8pKd97FykTBe?=
 =?us-ascii?Q?ND23995IVNmd3frHTPTE4dPSC0c5xeKI6R+te1vMnQh604yGcwB6AA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lWQdhtg1Yg1zkhILQ4c+aILTWogHObIJkDtOmYZ/gSjrlI1V7OL3RPs7SA6E?=
 =?us-ascii?Q?Vr0u3njucGQWAb2VQCAvSNXRWPrt7DkVp69juxXVAxroWgDBvJtrZXfrA1YP?=
 =?us-ascii?Q?ycd3Z7VW7Fd8u5W2FOg/VxBiON/thUySAxRTZ23momvuUDBvq/IeFGNA/Exc?=
 =?us-ascii?Q?5O6xQt0BLbNkPvq9ZnJxzCNoKlquuYA2yFkmryVJSKRsBHYCsa+rjpynWO5q?=
 =?us-ascii?Q?xwFlwTS55NboGPtVWDfPbREGU2Ga1hnCYLs3ZiUIQz8I9l8+oGagZPvm4m+T?=
 =?us-ascii?Q?IccoGc6EkJhOBZTCGwi1ihGmOOd9slt6uJUqEi2k6z/LyHi/1bySAc1Wgkun?=
 =?us-ascii?Q?KASlaLfM1+eO8F5yXg/8Ubof3GzE/IiJzhUP5udmgBE4d7ExwNWAjLtHu25p?=
 =?us-ascii?Q?nrCuWS3FHtBYNrqDMsNlVf5Tv+jERpQ5EtHmVTPKnI6a5SASb/WKEa687dzg?=
 =?us-ascii?Q?oHA9B1JUbmFaOy3G+hS5qIy0WVGJbsQt1IIW+5S8KNy8gaKFaNutD78D7LbU?=
 =?us-ascii?Q?No71Z/o7B7NSA6h89KWQzZiz+kZ/JXUK72yRvIEXFlmbCFxZy+usrt/mN0Z9?=
 =?us-ascii?Q?b/b9G30xCeGz6+Xv/rkqX5F+ln/Pg6rsfX09U4UGtmG0+GNB/w9N1Rf6n5ky?=
 =?us-ascii?Q?NjBDrclm5LQdHbCPCaQeii2Q4wSIiNtkVvAqUEa/nYhRQkVyytJP/Taa0NBr?=
 =?us-ascii?Q?lBPxYqvcU0MzPa7dkZSORNPNzgiEoJAfkdKZ0kkObSXw9n/NPdjxJk5JEyvJ?=
 =?us-ascii?Q?XpaWnVKuPPiWKdGTM9DIQ6KaJswSiFoDBLyfy/x9AEaEp6KngbQGwSbMTO+E?=
 =?us-ascii?Q?UcJSHkXtiU2CKv1PfebDwrxjJcHPCkwmoYnaXKhZ3xILNO4CWMRT2oCNFYGl?=
 =?us-ascii?Q?f8dKTOtApqsiTnI0fveOeUkSrsAWqAJtsHPYlFmAuM+12V8vtnWRIYN3V6mA?=
 =?us-ascii?Q?7+90G68w6V378oSASqHVUTLbpyPN2+CiBVns6G3+1w92qOTkW/MZsYmLsIPw?=
 =?us-ascii?Q?xMtCADfUlZI711iCydHeXx9zAfpxCLfgH+zWJtMZwk2J9Kexv4Ff3rws8Yth?=
 =?us-ascii?Q?lD0k9oGb3jeyJzZWAaAoIDaCtx9DzHZF+Zsr0TK2pQaiwyhfcqsQlRCg42xr?=
 =?us-ascii?Q?YEClEzBaD/j+cn7mbsbtP3Noa+cri0yy8rCBAW0kkmy1nSvYFSl40sYVkXBU?=
 =?us-ascii?Q?o5faEuMCajkLO42cVk5Rsh4pc/Tj5uT/ndEgbPd571wvYdhM6UZJFLPuJA2U?=
 =?us-ascii?Q?5PYGg7pARZhoiSp4pdX7i0TVeLE9GTCMMKRDjPYHoDzl1yurczyLfMcGlzAX?=
 =?us-ascii?Q?cVQF8wQbhC5LjcoB0YkKCIbQuqsVuQQUlOvN8teXa9/CcPZvaDsumiQbAPfc?=
 =?us-ascii?Q?gH/1FsS/BN0Db8asuUByngutMCpKvG6n8knMczGoQ3gKohUy+w7ikzcGLP0s?=
 =?us-ascii?Q?c+dAMOBYo/xTy1O6gXqOM3PONl2ZRAxQ38tL4W4vE7kaDu8Jg7ZU0z7Uq2CQ?=
 =?us-ascii?Q?bmHKJ2aKCfqya8/HgofCTGNK8gmiUvB6XBHZ0VUs+6JgI5YAcku3IisRfN5L?=
 =?us-ascii?Q?8GQD0j5gjHeILvxEl8QkjDt5D/Nc/hiZP7AS5qoN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c88906-0e23-45fa-e4bd-08ddfacc26fd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 18:08:09.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGTKomjrbBwsPWJUMAO3vCpIRVTpFgd/tnurwtJRo1bxmSAkPEDmjphJytJY3TNJyu6BSUg3eIpJr6CpFAyLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8052
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

On Tue, Sep 23, 2025 at 10:07:55AM +0800, Liu Ying wrote:
> CRTC(s) could still be running after the DRM device is unplugged by
> calling drm_dev_unplug(), because the CRTC disablement logic is
> protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
> Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
> driver's runtime PM) and pixel clock use count could be inbalanced
> after removing and re-installing the driver module.  To fix this,
> add a helper dc_crtc_disable_at_boot() and call it to properly
> disable all CRTCs before advertising DRM device to user-space by
> calling drm_dev_register().
>
> Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
>  drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
>  3 files changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
>
> +static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
> +{
> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +	dc_fg_disable(dc_crtc->fg);
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +}
> +
>  static void
>  dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
> @@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	if (!drm_dev_enter(crtc->dev, &idx))
>  		goto out;
>
> -	enable_irq(dc_crtc->irq_dec_seqcomplete);
> -	dc_fg_disable(dc_crtc->fg);
> -	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> -	disable_irq(dc_crtc->irq_dec_seqcomplete);
> -
> +	__dc_crtc_disable_fg(crtc);
>  	dc_fg_disable_clock(dc_crtc->fg);
>
>  	/* request pixel engine power-off as plane is off too */
> @@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
>
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
> +{
> +	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
> +	if (ret < 0) {
> +		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
> +			    ret);
> +		return;
> +	}
> +
> +	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
> +		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
> +		goto out;
> +	}
> +
> +	dc_crtc_dbg(crtc, "disabling at boot\n");
> +	__dc_crtc_disable_fg(crtc);
> +	dc_fg_disable_clock(dc_crtc->fg);
> +
> +	if (!dc_drm->pe_clk_axi_disabled) {
> +		clk_disable_unprepare(dc_drm->pe->clk_axi);
> +		dc_drm->pe_clk_axi_disabled = true;
> +	}
> +
> +out:
> +	ret = pm_runtime_put(dc_crtc->de->dev);
> +	if (ret < 0)
> +		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
> +			    ret);
> +}
> +
>  static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
>  					 bool in_vblank_irq,
>  					 int *vpos, int *hpos,
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -17,6 +17,7 @@
>
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_fourcc.h>
> @@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
>  	struct dc_priv *priv = dev_get_drvdata(dev);
>  	struct dc_drm_device *dc_drm;
>  	struct drm_device *drm;
> +	struct drm_crtc *crtc;
>  	int ret;
>
>  	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
> @@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
>  	if (ret)
>  		return ret;
>
> +	drm_for_each_crtc(crtc, drm)
> +		dc_crtc_disable_at_boot(crtc);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register drm device: %d\n", ret);
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -50,6 +50,8 @@ struct dc_drm_device {
>  	struct dc_pe *pe;
>  	/** @tc: tcon list */
>  	struct dc_tc *tc[DC_DISPLAYS];
> +	/** @pe_clk_axi_disabled: disablement flag at boot */
> +	bool pe_clk_axi_disabled;
>  };
>
>  struct dc_subdev_info {
> @@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
>  	return -EINVAL;
>  }
>
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
>  void dc_de_post_bind(struct dc_drm_device *dc_drm);
>  void dc_pe_post_bind(struct dc_drm_device *dc_drm);
>
>
> --
> 2.34.1
>
