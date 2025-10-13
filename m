Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05EBD5BF6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36110E4BE;
	Mon, 13 Oct 2025 18:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BlBR1fXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6AF10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVPmXkOr/ovBB6Q94KBm4Bpl9Gf2jwHtbVnOysXddMriVqbXPavl4uuz+5mlD5xG09Fs9j90Xbtk1v2KmhzdqYYM4NfkckcDywaVUo7eKtdZ/iE6zjC6/XfLXhUsrICwSljJX1i7SPpUWSyWe/pHqDnxOYjtYzyIEyDKWuIUDGt0vHE+vqsNn645DqBiP7tjba09aw2y6NFSr47LrQVzDYCrqaaGjaFgx1elB7uiDSt7e80bGmiFuhsyhpwk9vxJzMfPjnrg8s86whYWRLVK/OJGBC8DZ2ripdIBpfISXBnQntczFodqmEouECTX7wxO23eHJ5F8WkKnAjWOPyIeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz664bP9dtVPa3Oaa8mhUExr3ltiu3qt8K3/HuK9XSA=;
 b=r0isxweccUWNB9Uw1R13cXir+s7pmatLmfAp0W17GYLvC83NZA2VeRe1y5gaSzPIp1nkG28PIRgaehobaY7+oOEC8iJSFvQxKMpDTqbfgDWdlCNp7zQe62ffK9uSKIiXSdhQZ5SJ/6xTK0ZQC3gQ95z5oxXRf6EwVB3YcgXlQdvheK06thY/t7eIBvXh4rNj/vdO/dgX55e7UW8qGssQxKak2lMoUb4zibwmoeAUa5H9R0M3dpIsGYgY9g/isJXblQgKtZuMcwz1MyVlkh1QTmdqobN9jnBl+dVAmaEnIxPvvcmSaU/+DkYMVoA3PyPISKjASt/5tWtBtkZApmPeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz664bP9dtVPa3Oaa8mhUExr3ltiu3qt8K3/HuK9XSA=;
 b=BlBR1fXlFFPvndoUnshGtJKCS8Pvtuq+M+qnHO22fabGc0wQgqtcbaQEzK3Na1jDgKIhYTh3uPbYsp0+jAQ6o/ftrk/Z5MoJ0PdZwlnSEkIvMBpBBez82mh9Gvbe4LgwvK0I5baLCAuiTnYGZydY1Rg3JolBYB4znAOBbaoiKXP6VnN7XI42Ybp9X7NWrvsCAbGyvyzoF7kLsq2r3pF+B5RThW8s/TLSXwo0oAAVWvJTPDBIE+nErg91Qyglcy6tuLIOUU4deEfkDbEVY7rORW1GfxajVf27daH6YXsefkxYEioc8eZEV7Qv8M5R+jltrQChq7vs5jxOSgzkBOtRew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:40:02 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:40:02 +0000
Date: Mon, 13 Oct 2025 14:39:53 -0400
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
Subject: Re: [PATCH 14/39] drm/imx: dc: fu: Inline FRAC_OFFSET into
 FetchLayer and FetchWrap
Message-ID: <aO1HeW9SvERZbt50@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-15-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-15-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: ab59fdbe-3594-402d-948a-08de0a87eb5d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4uFnn1fj8Q2Ws7juxvwoIYa1i1MTzaPfHfpuHcLCtgeg5iPhjbwJBFuJW+QQ?=
 =?us-ascii?Q?YB/gO+EyZe/T7kNRbAUO+pesOXp0RcwazqeXiZeIWZ9lOKeeZlfFNCyGKZYC?=
 =?us-ascii?Q?LTfVeXbKgDoUJkKiyiajaF14HiaCIrJn0b2pq1AsaBxSHwF1P57/qJXf3FRj?=
 =?us-ascii?Q?TeWIatKCM+DeF6G87694XzXhp80+SYQFM0CLDKhLOGKfYv4fxkNGOmxNV7A0?=
 =?us-ascii?Q?WeUOpu1AfUtaXtCbmIAnyLmglZAo3+1YIWMhh8/skg1HbQBDJhM1Cl6MG6h2?=
 =?us-ascii?Q?l4EPEUxGIX93lnSXu7WCQOQofsFdEniGcZ0MYXRIENVEnNz6qxo7dINMEFoY?=
 =?us-ascii?Q?3NiHZ8Aa2gPKf/rbv2Bce1qorSnMJgBdntLdZN3H4J7Bkk/ckVuOtqUgCVZg?=
 =?us-ascii?Q?NvAWrizYv1QchpWmQ9lNxvLR3yOGeCEn8iIGnO7oXrX0EppUSBk02RebXK+w?=
 =?us-ascii?Q?HIapZQY5x9/QczjDLYiTW/m8MNsaOKI5kgEDqPm/QRiOZA7PoLq9hZSI8EK1?=
 =?us-ascii?Q?0PKCTdJxvPpQVajlvU9ngjr/+SI7XoeeBjmtc8KyFHaY/xnl0PbpqtRJh44q?=
 =?us-ascii?Q?WD9D7BlHGQ3fBXn4BhdITZrxPuuRHDt56jfnHLst3NPHuQHH5ngCbIz6GNYC?=
 =?us-ascii?Q?5pS4sQtOBpEZj1zB5dKjVC2i3w4+5XAkYhexaXtQlkfRZCgQxiGVN7efTweD?=
 =?us-ascii?Q?kuMdhLA2Drhi5aN35g3pe1NH5/PW4JbyWw4MAoV+q/jTK3YiVeoh1iwW8+XL?=
 =?us-ascii?Q?KN6QTIer/USuxs7CLz/8ckJ4bhjo3RmiCsKWhmr6tVSn1q9J05jMXSbL4YJf?=
 =?us-ascii?Q?mv7RN0cd6DiCzQSijA5U6QlzO+13LQaEICAMXn9AUxhuk1lmStJJgPTLC8gc?=
 =?us-ascii?Q?29gSEm2g+KFqfxQCsl4ll/rvfCKG2Lqo1MvZD89aYHodl7CZ7SQieUBV7Dmb?=
 =?us-ascii?Q?Nte5+lrOwP9d+Y5H/gvJ6Jh0VgRTb/80aHU4CgP7V0QtFcOP+J3XugoiCS2R?=
 =?us-ascii?Q?NxLi77x9PKg8qSnKM219zvqSH4yBiI7Tu6meCR7uAb1mGuS5DrYN6R+uivhO?=
 =?us-ascii?Q?N/+8pu/Zg/r0OahoarVh32iwZNMPLieHPdSkXEfLmfLgVZu0VrQTQj13jrJA?=
 =?us-ascii?Q?PVhIGvKkmXfTARqoCAbuu1uun8b9qoSDI7CzcSDQpS7MABC+tPWDaTOc2pt7?=
 =?us-ascii?Q?qSjjWSW4pBiz86MKP5SRhhog/soIjRwkDr4c41LxvTUg/Q16gJ/uD3KbqlXt?=
 =?us-ascii?Q?vE0TRIZBF17CdXuxF/zgBahzFCL59AVWgAeDW9iQnrgLmtY1+w13xwWThk/k?=
 =?us-ascii?Q?E0wc6XBMPcne+MVF+H4E1TqtABh6E0HPdPlMNh3GUCPN+rXT9pd7Gy4f3VaG?=
 =?us-ascii?Q?vcUJZBX9h/Y4mpVDLhvrF1+MxLLWQxPm6PdRMWSe0b0CQw6An8CzcKjtPoQJ?=
 =?us-ascii?Q?ba+NbUFzc8VhwRWb1MhbhN0Umyxn6ct5w0E4S2LEQY3FFRIsyRbs+1Iy0OEn?=
 =?us-ascii?Q?XSEVT6fvPNNP6uTPW2rG2enqB14omzua8Lr6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVVqhkVNeED8oq9ycUokSM+3HOd1WCTnhgwS/fHPKtXefGLe39ZBuLA390CP?=
 =?us-ascii?Q?nD9zDGSTsWgEH569GUqzNKG+prPgzv4Wc/wj/yX4YFz2dqyWZ+Imk2F1JIrO?=
 =?us-ascii?Q?tPXBDd5bxZOvMusFAH3W3osA8EukgT/rvBwnMoJceVWU8stSJShDl6gHtc2E?=
 =?us-ascii?Q?f5pq0emYF1mVVXCoounQwrJghIs1Q4xZmk5YMojDyM9A1BQFswyEy2zssuxz?=
 =?us-ascii?Q?nJIMsFkSr+BHTLpHb33tbSo41jHGFQ0H1SPaVktm62AEmRIxZbrYY4Ha0jZ2?=
 =?us-ascii?Q?/bs+6UnJdiFPCW1UyC15BxO4dctGHjf/CRDtzK+ERCHBeHieZ04I955fOMW2?=
 =?us-ascii?Q?vm+EUbIO3aBiHSDwmflGcXgntVEjjnhohIUNODz82PeCnQHqfRDLUzwqJPsX?=
 =?us-ascii?Q?d2m2IP2LOq0YpzTgMi65YoAJXqENFyPbv/S5l2ZvSvpkyLIbBTe4owhwCZWk?=
 =?us-ascii?Q?qYjPNErMdWPHg73eeBs48Vh1MaVCRyxS+l+CwKmFs8ssq0yzj61tkeZ5pvh0?=
 =?us-ascii?Q?8BCZ0xRZadHzR431gcwXIDA0+96JVDYzu86NmAwCQVRo62jvWFucfJVrW+Fw?=
 =?us-ascii?Q?ON8JMX7wxdAyA6hlZgwaSDELGuzGggIEzeatytTp/RiymfZlwJ9GSTmt0CmL?=
 =?us-ascii?Q?PABvOqi0R1ytwy/PHiagOZnB8KVfoZ1mULd/NJJW6VEozx7Wg6zn+I9QtC1q?=
 =?us-ascii?Q?HWCxcBdhL8gpFMOTxfaqECu5VJ54JVdJa52fWmJ7bKExjueb0sAA9lbs3e5O?=
 =?us-ascii?Q?ZxmJtr8ZA1+BhUmAG6RCwB1NAxjNXuL0uGVlvi1EfXuNRk2KEMOeH/rjHyFU?=
 =?us-ascii?Q?XEHzUbwdFCQ0gNK1DY3uOYEux9WThvt0oSXHWUi7l64xDon8peERdZTCThFw?=
 =?us-ascii?Q?+hWxJGtPwjgrJxmBa/gHn9fT8URCyz0780cmQrtl5MTSPAd79jwGYLYSrykS?=
 =?us-ascii?Q?SKfq3yjiJN9nDl6kxXnfnmhjgckxGHI3xpoeQfdyNSLd5NLuBmlmViSC202I?=
 =?us-ascii?Q?HpHJSuxJX+jKUnTvOjWgF+Ot59Ppaol/pykJGoCQkGg/BHKfgQ8LcHIwBHdg?=
 =?us-ascii?Q?Qo4ZcuvSfeXX1jNmm8MHt7S+GkBxkrq3tqYcfzNzudAnD+rJqRkwXvp5WEyc?=
 =?us-ascii?Q?e+vJ2MbP4P3Y1WfyC3Q4AEvejGeA/5/XQtXaF6i617/TNzo4hdoEGafT4wL/?=
 =?us-ascii?Q?w1p28IG+PNqW8/UvheyBGXAOP5QfM2mo+uq2RFRVY9Rd3Z4ap0yQ+UYNgms/?=
 =?us-ascii?Q?cCaT1IBSQIEEbSgrAC6SvbJFT3zZhQnLlPVUP4c00uJVu1CLm2DeTo1C/Rcf?=
 =?us-ascii?Q?mkaEQRMDVP+Pra0TD/VQ+mPF9mutE+lD5d90T7kUOiWv1nKSRO4HqSDv3onR?=
 =?us-ascii?Q?uXeMaYGLLCb04iVq/BOPYcn2b5eL0ympN7OP2CDvl+3e5OiltcEEDDBJyNFW?=
 =?us-ascii?Q?gakdhadNrf/gFyHw+9pTSxzGcf9bxE5fH4JZrkbJ5NikHoCXD8LaZThr7ZuV?=
 =?us-ascii?Q?SY8RKJDpDfvInDuVe1e7dJryQvPdVXo5PHxyL1rzB0Hk4YSBCMX4V889o9Uq?=
 =?us-ascii?Q?DLPL4m5wDzpZbGfUGviUiWHTwSRE2AY5prd3UPy8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab59fdbe-3594-402d-948a-08de0a87eb5d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:40:02.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5L/hlnfcWY1F+adq50uVMOLANimiJ2PhJJTzuLQtT9qfOfmkPLciZNCT21dqBRzeKOBx7xYiJaY1042wAnA+jg==
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

On Sat, Oct 11, 2025 at 06:51:29PM +0200, Marek Vasut wrote:
> Move FRAC_OFFSET into FetchLayer and FetchLayer drivers, because
> FetchLayer is present on i.MX95 with different FRAC_OFFSET and
> FetchWrap is not present. Prepare the register offset calculation
> for i.MX95 addition. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
>  drivers/gpu/drm/imx/dc/dc-fl.c | 46 +++++++++++++++++++---------------
>  drivers/gpu/drm/imx/dc/dc-fu.h |  3 ---
>  drivers/gpu/drm/imx/dc/dc-fw.c | 45 ++++++++++++++++++---------------
>  3 files changed, 51 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index 8571871c6a683..a76825dc75fe1 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -15,16 +15,19 @@
>  #include "dc-drv.h"
>  #include "dc-fu.h"
>
> -#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
> -#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
> -#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
> -#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
> -#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
> -#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
> -#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
> -#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
> -#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
> -#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
> +#define FRAC_OFFSET			0x28
> +
> +#define BURSTBUFFERMANAGEMENT		0xc
> +#define BASEADDRESS			0x10
> +#define SOURCEBUFFERATTRIBUTES		0x14
> +#define SOURCEBUFFERDIMENSION		0x18
> +#define COLORCOMPONENTBITS		0x1c
> +#define COLORCOMPONENTSHIFT		0x20
> +#define LAYEROFFSET			0x24
> +#define CLIPWINDOWOFFSET		0x28
> +#define CLIPWINDOWDIMENSIONS		0x2c
> +#define CONSTANTCOLOR			0x30
> +#define LAYERPROPERTY			0x34
>  #define FRAMEDIMENSIONS			0x150
>
>  struct dc_fl {
> @@ -98,6 +101,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct dc_drm_device *dc_drm = data;
> +	unsigned int off_base, off_regs;
>  	struct resource *res_pec;
>  	void __iomem *base_cfg;
>  	struct dc_fl *fl;
> @@ -130,16 +134,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  	fu->link_id = LINK_ID_FETCHLAYER0;
>  	fu->id = DC_FETCHUNIT_FL0;
>  	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
> -		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
> -		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
> -		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
> -		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
> -		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
> -		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
> -		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
> -		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
> -		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
> -		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
> +		off_base = i * FRAC_OFFSET;
> +		fu->reg_baseaddr[i]		  = BASEADDRESS + off_base;
> +		off_regs = i * FRAC_OFFSET;
> +		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off_regs;
> +		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off_regs;
> +		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off_regs;
> +		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT + off_regs;
> +		fu->reg_layeroffset[i]		  = LAYEROFFSET + off_regs;
> +		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET + off_regs;
> +		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS + off_regs;
> +		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off_regs;
> +		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off_regs;
>  	}
>  	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
>  	fu->reg_framedimensions = FRAMEDIMENSIONS;
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
> index 2a330c0abf6a1..3983ef23e40fb 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -15,10 +15,7 @@
>
>  #include "dc-pe.h"
>
> -#define FRAC_OFFSET			0x28
> -
>  #define STATICCONTROL			0x8
> -#define BURSTBUFFERMANAGEMENT		0xc
>
>  /* COLORCOMPONENTBITS */
>  #define R_BITS(x)			FIELD_PREP_CONST(GENMASK(27, 24), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
> index dc036121f0d23..7bbe06a840c93 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fw.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fw.c
> @@ -16,16 +16,19 @@
>
>  #define PIXENGCFG_DYNAMIC		0x8
>
> -#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
> -#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
> -#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
> -#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
> -#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
> -#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
> -#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
> -#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
> -#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
> -#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
> +#define FRAC_OFFSET			0x28
> +
> +#define BURSTBUFFERMANAGEMENT		0xc
> +#define BASEADDRESS			0x10
> +#define SOURCEBUFFERATTRIBUTES		0x14
> +#define SOURCEBUFFERDIMENSION		0x18
> +#define COLORCOMPONENTBITS		0x1c
> +#define COLORCOMPONENTSHIFT		0x20
> +#define LAYEROFFSET			0x24
> +#define CLIPWINDOWOFFSET		0x28
> +#define CLIPWINDOWDIMENSIONS		0x2c
> +#define CONSTANTCOLOR			0x30
> +#define LAYERPROPERTY			0x34
>  #define FRAMEDIMENSIONS			0x150
>  #define CONTROL				0x170
>
> @@ -130,6 +133,7 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
>  	struct resource *res_pec;
>  	void __iomem *base_pec;
>  	void __iomem *base_cfg;
> +	unsigned int off;
>  	struct dc_fw *fw;
>  	struct dc_fu *fu;
>  	int i, id;
> @@ -167,16 +171,17 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
>  	fu->link_id = LINK_ID_FETCHWARP2;
>  	fu->id = DC_FETCHUNIT_FW2;
>  	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
> -		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
> -		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
> -		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
> -		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
> -		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
> -		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
> -		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
> -		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
> -		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
> -		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
> +		off = i * FRAC_OFFSET;
> +		fu->reg_baseaddr[i]		  = BASEADDRESS + off;
> +		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off;
> +		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off;
> +		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off;
> +		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT + off;
> +		fu->reg_layeroffset[i]		  = LAYEROFFSET + off;
> +		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET + off;
> +		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS + off;
> +		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off;
> +		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off;
>  	}
>  	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
>  	fu->reg_framedimensions = FRAMEDIMENSIONS;
> --
> 2.51.0
>
