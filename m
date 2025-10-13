Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1094BD5C76
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2F10E4C7;
	Mon, 13 Oct 2025 18:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RSToZ0S6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5C710E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFdxC/GNYTZoY0zvmQzi3AVHBqdgog5DsAzemNbg1UCL6daCnZokfPNVJ+YmLS6uL7gmKyqQpKax6nCLIyPt0soGiHtWoMWiPN5VZvqcgS456MGh3nGNvgI74bLLhBAyJg+CIFHwwCw/rxzfOrfmqeVGXDMHYm6cGQL6bL9MXwvCgSw/+3qbNu6G8G4UDw17joHQkPdviQukAL8h/AfQVnLaK4mP2CTRimTE2/Bhpr/xR/NUjtJBUwoIKRnhqtX4O4tO5u2RzMxZhQZNG6v7rjdS8WHQB7GJhW5MkdG6diUGeSo/+qBdbxvh9CzvnUAYs8hTxyuUdgJC4Ch/oY3jOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB9HEi2Fsk7fD12erfJajgipsmKmhqWGt+Brip4Re2Y=;
 b=Iv4MHxVxXrKCLmgZx5EM0oeTP8EEZY7s2fQQIhSkYSYAIQy29JrVAOeJ4rG5lxQ04xdUwnN3luBzTP7+mD4UfwqCPFCs29OL336KPMBIrOcZMM6VjwPg2VB/PvcGHmgTFLtmYHMU0xs+QWO2LW2USNHgoBo0DjI/0Tkn+ZrFzcyU7HE17SzCBCiTrVHEEnaY30K/nirI4kzFZhGpXVkIzNYlXXFJv5xoBEzq8NWigaJNg91xXgwAKlcg1HZj4seqbTvb7vWcQKHJR0d0bAr+ZCfhiffB9Y4FrhMMcsfVR+osCakJ6KUzR5oCMdI0uMtMOoO/GVlRDyNuCEBvEmxj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB9HEi2Fsk7fD12erfJajgipsmKmhqWGt+Brip4Re2Y=;
 b=RSToZ0S630e/b/kZXYG98ozX6k+IAuymQZtIJxS76/ojSY0KvMkTAwuCG8Eza29x6DpQnD2qsqH8jr65SNgqIyetJmgaAvy0no/Ry3rCxAmCbuM1/3D4Z3rfZ9A4YK/U1WxFVOvENz6oi596gokq/lU0NAPZarWtYKnIAltKo9yWAJGyAPhrZwuuJeAONXDOlF+i5HJjSRwbTjUpOoN1RxSSm0lMC/oyj+IiifBasPypsmka5rm9mA/8UnO5PIlrVFo5u6XaO8KpL4gRuodDP9y6iqpejomZ1yrtcJJKP+vkVmnA7SsY/frLDk3uw2mwS8jo/oBSKFbeRG05vJO7MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:50:35 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:50:35 +0000
Date: Mon, 13 Oct 2025 14:50:25 -0400
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
Subject: Re: [PATCH 21/39] drm/imx: dc: crtc: Do not check disabled CRTCs
Message-ID: <aO1J8QX5hJ/+CZut@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-22-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-22-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: e625e0a7-5c6b-4a52-3bdb-08de0a8964df
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5muIdH1enOGuLNoPxH8vsa58zmowWRZkl9w/ShxfbAUozD9e+SM2ZlF6tI2g?=
 =?us-ascii?Q?PciiARu/3WeTwW6xk2naEwDt3wG0eQpmISIxL3Q7Yy6gSKSgrf4LT+HL3nFH?=
 =?us-ascii?Q?PXm6S+eTjkMMcYZRMMFTziUqhv8min6wdjETa5dh39uLIkK1Kjnyt1zWML6H?=
 =?us-ascii?Q?XuU9DdhDRAvoOm8mvUYQ0Hoe4etQ7T8DJvjbvYiRMjZT/6ZSL1VSj0KZHiy7?=
 =?us-ascii?Q?YFdbHS1il4M6hRBPNj/JyFAvQvEn3jTFLiRo08GBlM2N7We+kqlNANad4suQ?=
 =?us-ascii?Q?3sj9X3D8DROjmQS3rTGcC3f7ZIco6s6ytwBSXfmckeRoYYVSb1uZaW1vTA+n?=
 =?us-ascii?Q?PYOhXhCf/F9J0+6hSzyHZU9394ZoyvBuAhvaZ3X6FKLtbOQCG8QMPx7qHDnS?=
 =?us-ascii?Q?Pgkl81sxA9NWB6I0mDasnHsmCWOwp2KYDVojcgMqnKD5SRXt+sTI/yMWPB7x?=
 =?us-ascii?Q?0+RG18T3OYMYv3Ta+JoygiMZEv9+ccmIUJv2gnhw4Jfotn+OsAe79tdEy1z6?=
 =?us-ascii?Q?naNXUoG7dopDKABXydnQwcXgTddrKST4eOfp9TOfBGbNcQocCDpuVlzVwB8F?=
 =?us-ascii?Q?+qc5hFFYoz+2a16bTsMi5+uJyRqO10B9kPdr8707i9cVQv7BO2kZeeqGQxmG?=
 =?us-ascii?Q?f5KvqKKXkAWUoHZvAP0Bo7qims97nkkGh8DFQaPe14ZjmmuMeQedsBFvTaK0?=
 =?us-ascii?Q?x0Xev5g9fyfMClaywqta4FQpw92T4jQZ5KOctrbisefNQMb+JIhXnwOuxy0d?=
 =?us-ascii?Q?dWhUZtMyRUvc4SdEyJCND2P3KX3A/F9FJUGctJDbLBgcU9r+CFsffCuTx7hP?=
 =?us-ascii?Q?kl2OqkcayUdDCdvKOrxuszelaDHvDXjD09GwAv3ejMvrf/RMR6guPVq16fXb?=
 =?us-ascii?Q?SBoGVIoO6ATrm4xI95ZSGDghxtUg4QEEaY5xt9myr6xhQkdc3vzqMVXdNpmC?=
 =?us-ascii?Q?FnR4R0LLoFysujJb3p8DSz4qkDnmyHoAXGJv69hJ0bC6M+snCJ8LDXZPNOIT?=
 =?us-ascii?Q?ZCtiGJXXc+hJrLDuOaJrADzevoMaN9kdi3vgNZ4VaPt4v8Ho0C0qBzTt3F27?=
 =?us-ascii?Q?ZEdw/u7bq68kDsMaQXd9d9POhEc9IzCHexbp6wCD4DcooOp1P0RR4/O/dSLH?=
 =?us-ascii?Q?DKAX+yY95UJInsBwlwiQ95GHRBVuDjU3ANSg5i+Na907/Io4Nzz0F9eaNbIs?=
 =?us-ascii?Q?I8EA+bjR0tGCfDXdy/W3Lvav4K7tiUiYxWHdCVKBOtbhzUJ37rraL03TgJis?=
 =?us-ascii?Q?u4oqDx3Q8X1yXYMiCAhfu4wyW6U8QKt2caRQ9vCx1NG56X4LpYqR4SJCA6TJ?=
 =?us-ascii?Q?ibpZ2tzT/baI92fjzKM4qMEycszmR+3Iltgh/DU/ZZ8NgPi3bcf6I7bxQayK?=
 =?us-ascii?Q?EABgSBwClSyLXr5xYiQlnhOhFt2CH2yz8LFYpHblYrqvGNKlu/Kfkz6KmQ/Z?=
 =?us-ascii?Q?HchXOCAqtAUzmkLVfAXzSo/T5coOyi8Mpi2u/beX4CyhggaLMYd82m5d4+Pp?=
 =?us-ascii?Q?UJe2E3pWW39SR8BzYYfzDUezOz2LDlMqICrM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTc7dtNtIZDqu061K/7gDlx1WnO6Y9dnY0efX0gP5e70NsHGGAjEQYk7Jyrd?=
 =?us-ascii?Q?vfWbdwk8pshHUyMO3ZhGfzQCx/DtlTkWLQcgu6/TyWgmCd4OdtGlc2UhnzjC?=
 =?us-ascii?Q?L6bV9DoEp4Q1afFaEiDcI0btgUQccOpkd9npmSmT5/pQDSc46OkMR6aBi0aB?=
 =?us-ascii?Q?aAIDazhXUoWKELvz5wRca28f+5JuCnJ0vT3UPPW+cLuTPs86MEz0LQKsY/Qg?=
 =?us-ascii?Q?PihuwV/6n/ACUOoRnMibwAION1lRvNfXeFSu7tbej7/73yzssgmOY8BrEMOL?=
 =?us-ascii?Q?1hGPyEYamAaOW3QRJlgp6l+L5/KJK29+CJh+jbuCg1Od7hN1gV/93uIg8mI4?=
 =?us-ascii?Q?GT/4dWmyGOVDu0L4FTw/ZtWHe4JUOC7hQanahqZNvugIJ4bMJ4xNuH7e5ND3?=
 =?us-ascii?Q?MkmdnLdAS61+TLsceXedYvfeh3F7aVEnLI/CK7cswSyntiXkKmEBspQ3DxHV?=
 =?us-ascii?Q?/HzxmLG7SxqdsWQx8IuSgeb6fEQdfws0INBOyEkLqRdvWVMSzmkjirzkn4Os?=
 =?us-ascii?Q?w/lu+w1dAAy4m35L1IWRz1K6CgmajaFbLCGg3NXk/FZL7l1j2El1yQlhiilU?=
 =?us-ascii?Q?UYHoS9KHoerbIHntbo7DGzP/0NwJMdZLt//SPLpA+rniS9QOFDnnsdcF6T7w?=
 =?us-ascii?Q?zfB8KRAWBpwTYrmkOgAEqlHKxh8zKD6CRPqptjH1JwVGwperVqMp5Et/EJur?=
 =?us-ascii?Q?nk0lyFZAG+C1QyaFGD6X+ZRYxQjY0mUAJ6oO7NnAg8gNk3O0A07QgFLKust1?=
 =?us-ascii?Q?eYsUc0lQt16bCZv39y+WsOUFkz7C7dOpHpASgIOwhx9HOoPp8APKfRxaclTt?=
 =?us-ascii?Q?OU4uZvcUtPxy3gzztxwKW9zgz2zD45b9I7hbvOU7nPlhow5i5HABmNFXOxAD?=
 =?us-ascii?Q?yzfkRRM9GWO12ccCnyoxf7FoqvlcZe12bFQiyrYlEt5jW5WPVRi3MGoRUphw?=
 =?us-ascii?Q?S2WuGZmHRPHi8Dg9C5I6Rjv5HzSmCCDDx8g9NXm0ZwhS077EChxNPDuAZVr2?=
 =?us-ascii?Q?bJtI5pdKInzXbh/m7tBgx1k+Sb3LoJ7n/7bBKXD+qTGaSEbEOx0AMOuOkVZ4?=
 =?us-ascii?Q?KLMwMzvV/u2XMe6RbhpXt6K2+3npjKNs5Ste7JdHd/LnLdY9m3wYPexcjJFz?=
 =?us-ascii?Q?aFQmZzDfDb4BdhKhQG5yBE5wsRXjLxOCH5KQu0cjmk/ywHhTB0JQ/PAtx+fI?=
 =?us-ascii?Q?btYnKhGmIGcqfxnvGR35A0wmg2dAn6fzdDPrqEmU2lq3Yod7+lJ8/caXCFsG?=
 =?us-ascii?Q?K0fAmNJnWd25o9pRgCuaVxaQhnz5wg2NMU7mp4m5frXmqp73v4+QxE2t9nwQ?=
 =?us-ascii?Q?+UzEKQIZ96SqGEWmONuloqODgr2Fmsc5fv44RBUT39dQUTihORn8UNgMYeV5?=
 =?us-ascii?Q?fgU1iA1zD/uFdB9R/iSPGD05X+KlmQYF2u8sXvb8dkzs+sMankmzBotIOA0c?=
 =?us-ascii?Q?MIuW1r6URIVULzGZEi6k6sr2F0gkii7fp3f6dB706z6D0os1+8pNJtdOoEq/?=
 =?us-ascii?Q?x0Fd0HX3qyZ62yWoCxS2bwFwWs1N7VRser330aeh2Ukol9wO/CUXWrRvmaaP?=
 =?us-ascii?Q?SqYS1SzsyBHNNV7PlzTgnBlJFsiAQL/QD0h78aWk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e625e0a7-5c6b-4a52-3bdb-08de0a8964df
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:50:35.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFnfepP5/g78dXEzvzSSouP/Zc9RYT0IpGNb9VwaBNIRTFIP2AF8WjcpOvETLby/Cbo+VVYVg9IXTAhuMFxeIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410
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

On Sat, Oct 11, 2025 at 06:51:36PM +0200, Marek Vasut wrote:
> If the CRTC is disabled, do not check it, as the check will fail.
> Skip over the disabled CRTC.

sorry, I have not understand what means.

Frank

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
>  drivers/gpu/drm/imx/dc/dc-crtc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 56991cb033945..4955f519db917 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -156,6 +156,10 @@ dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>  	enum drm_mode_status status;
>
> +	/* If we are not active we don't care */
> +	if (!new_crtc_state->active)
> +		return 0;
> +
>  	status = dc_crtc_check_clock(dc_crtc, adj->clock);
>  	if (status != MODE_OK)
>  		return -EINVAL;
> --
> 2.51.0
>
