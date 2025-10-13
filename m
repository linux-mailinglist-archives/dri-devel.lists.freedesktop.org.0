Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B98BD5B6F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A961310E4B8;
	Mon, 13 Oct 2025 18:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G8fiUB8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E25710E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvekRY/rkuhuggs68cbkwYmMZZKOnVGnzz/azUIFdWi+cPJVojrSki+/4TKbHPdosXSIbuP7pbTuk6zXNKESPt/zlGkZrSr+/UorAEDgws3M32RRPAs1Zks+HAd/pQImp9tHQ19gvu+FKJa9ptySZILxImM+jwUE6dOeq1oKsXQEc2/SmMZQBUDhcnMX+Q4x84GvVLd/gc1rLaSnNEZe+lBQ1grr8GndXtveG6AoGBpSMuf28ael3YPw6mfxfpx8AfZA8HcDrBytkHpqTTQDJTvYVBYwmgFbnIF4bkT/EjVMXe+vmhb6EX1phZB/gyEYaYGgQQMkRADJYTh9dC5jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WsbFbicuODf4xLGKZTkjhRdDpwff74SRBXJKuVXE6k=;
 b=y0tIjvGrKnez3zeNlRw+GaF+CKTFRPXY+41ITcqSyKH6r+KYODO6vECNuQym8+GVZrdsmS4senYgRkhbk19pcJ5eoFdr1YbvZqI/0fqaaSi4W0215EtgMdritf48yyK+KNuwwIcSsy00oBPAEASveQvrprZrSesK1Xce4OLsOd0Er903Rg43uUtMYjvmfTDCb/2XwuALPP1+qAGGLMROJ/2FV2ZrqpUoZsNala1KxiaVX5px/gVoqKs1z6iCEGE1Ar6FYTagD4teFf4pWHweWQvvVSywNGTchjdnA5y+mWFcVJ53typGA6G1fIBpca+q+2R2bshDb9Jjkb3ieOwysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WsbFbicuODf4xLGKZTkjhRdDpwff74SRBXJKuVXE6k=;
 b=G8fiUB8RZYDgv4OwVq8Wk4HrV8+qN2luXjBSuIuA+CWsfRzIXo9SQCHjXFdkp0L6meXxLG8P1/r/bUAPvTEwH/0WQQRW4atZoJUuhxadkKAx3W5HZpLOXC7SdqfP7/gLciH0q8ydEonGUMPiGCiQ0SgiixlXDqDqXfCqNW1kve3M67y9RQfD+uD0ouQF1jQUWIhOQCQftrywRwKqcht1q14H/Jpn6rvc5SUVjbDT3NiiuM6NhFdyTIpqy28FSgKlsAybq8KReLcapNONNDMzL0KUvDilrbQ2mdEcHVu9//RUqi841y+XZzqKNcGJNfzOPbKdDzPgcVkHQRW+7XQhkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 18:29:58 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:29:58 +0000
Date: Mon, 13 Oct 2025 14:29:49 -0400
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
Subject: Re: [PATCH 11/39] drm/imx: dc: fg: Parametrize register access
Message-ID: <aO1FHck+8/F2psKs@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-12-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-12-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8PR22CA0001.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::16) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 101672dc-bef6-4f02-1ff8-08de0a86835a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3U3yTYdmIp2SFfLS77XGHLArXw/SqRtoYQetCG5R/QzoLg7ch2cMfQI78EXh?=
 =?us-ascii?Q?j1/WLTLRqLH1RRvAddnoXOGyFgratp8uVqernedx+PxLBWu5PM2h3j1fmGV/?=
 =?us-ascii?Q?Or5TjuL/pF27NEfUqF7PhN0Qa9lYXBPVqrUqEH1xa6OiU6KQAT+BaeBOIrOi?=
 =?us-ascii?Q?FB/BnwRgFZ3NR1opgTTXNfNN5nHlkZGwmNomOBrT6bKqJ20Kt5NJcY64iNWZ?=
 =?us-ascii?Q?YOZZ7cULZxG+kwEhi9jCjYEHk3HoD82vT4HEU4QEAUAnMVGr1AY5TvhBDfCn?=
 =?us-ascii?Q?supCjDxid8HTvK7HpmQ0LmjcWgLh6VMjFyaNOhmW1JFLOBu1hHMvYCFXccF5?=
 =?us-ascii?Q?/vyKpUrugtSOlIlI0npPqZbIYg/XHVZ9QVnox/6jTR5JhdumpYOIH6QdT4Dc?=
 =?us-ascii?Q?w8oCnLDeeg+3hgthhtQ8xJxfEzqN6eMB6JlJ0ZTbCa5WwwHA/cxivyWbAm0/?=
 =?us-ascii?Q?QWrL83u6ZLMQbFPuPXuvVMJZR25qZnaVmYdDhbMufek7Sackmg2loIwk42IJ?=
 =?us-ascii?Q?b608+CyeVLj+oS35NUNKbozRQLReUEJk/2hVj3r1YwYWgXSSJ4OAKdFcKMTW?=
 =?us-ascii?Q?wV9lXAUey2sNg/6u8NZj3pWLadbhG3ESQ+G7zGLILc5OOG2Tk0yZaBI77y+0?=
 =?us-ascii?Q?6fEe6nKmzs4KfCl8AN1Iq2M3Hek4yUWDd5zvJNOGrJY3WngoDb+YVgzvbXhu?=
 =?us-ascii?Q?QBAOliVJUMYtl9Oet0eI6WtGqY2t3rw0VohJtSPXauvzcmxcZDbc5wm1oVOk?=
 =?us-ascii?Q?uePMXS23xCxG6ebtNaVtUjK38TCLa4P1do7DNPp3zSlM1aivQklBewaC/3f8?=
 =?us-ascii?Q?M2XRUd5cL3mKY5dU/BdtQpi3WUWtLdcYZJuRwOpsaDf/BZ03Adb+qZeu+7yD?=
 =?us-ascii?Q?bSE5iPIl9NKOk6Ll5oG3H12dA9a6W6D8V0REqq59OReQN5ZDWL1h8W6L6eXc?=
 =?us-ascii?Q?8SkGFyCMWVsUIea8Zef8MXVf3hrypiFPqbE3tBKNuHcfXk+Oz/HDnYatDSt2?=
 =?us-ascii?Q?+9IE+2NzeL8vfCoKc1iaYMvkq68AL5Mjs0DRURndINHSmvUKNBadbVG8Q+vZ?=
 =?us-ascii?Q?dyNQlUqxl7dkX+NAibY2pj1URO0MbS+lhjujk7CDgk1+wHySZvW07mwfUBy8?=
 =?us-ascii?Q?aNhLM3sghjvWiiEsCcCuKYkgBphRuopD9E1KB6ncoY2Pyn0fdJU6RLhgPH8y?=
 =?us-ascii?Q?VHrS1nw+vZcgEpnsCmUUFSTC9GwG0yFfnESBFMK/iJ/pUfHEVLkad2VVcF1U?=
 =?us-ascii?Q?Sn4oJ1Z10NRciiWsoBt7mCswIpVOcZyMzEM2T+9DCSBmH/1geOldB11i9t2l?=
 =?us-ascii?Q?T6ZwlkrJGshJtE34kgdsFlzsDVwKFw00vkMH54QzOkJjFQPwvJSMjDZhrcqO?=
 =?us-ascii?Q?/N1v2GXUhZ5U2FQngkiReEN/QuTYUFSvrScnLE3WIj4Q+1+z1S55pIEIxBjR?=
 =?us-ascii?Q?qE6jUnS4alruXZ/GZhgeDSsRhWQb8ao7vm7WCmC909aJhJ+utuA9UHve0Xyc?=
 =?us-ascii?Q?YtZYNAtU+8NHf7pCNChVD7bqrTjyBYZKxjDH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qS0msKiygjVbzmg1ePJswejnGifneMMfts9/SghpWBKv2ykSWfRYAPdqfCM?=
 =?us-ascii?Q?MWDGGRTss7KBABL7GEe9Z7xV9PebLX5F6xev7rb11ose2xobs/NKvDABrvFT?=
 =?us-ascii?Q?bGMZa2xHj+sxOKj2lmFVeCTVALO9P6Yk0L3UC5viBmsfT65vrl6uBpisik+P?=
 =?us-ascii?Q?xbUI4esfqRYjX+ViPIOLe66cvN9kfMvVhzTvLh1l1dR5T4cSDqsbzRc7NhR+?=
 =?us-ascii?Q?xAMG8VmDJPwxZeyX95kh+1Kv8fcM1lAZKed33sDRpN8lqSlhQXDTPU2UBlcf?=
 =?us-ascii?Q?x9ElJXQ59x1t+gP+4ukh6n8/VIA6Bvgl84khjFdNAQsPWSGQqCv5Ff+thvg/?=
 =?us-ascii?Q?Fs1sa+YoSm65mduo3n7x/BOdSaQa6lq8D15mmEOY7GzbsqKiYdjrDQ1zXf62?=
 =?us-ascii?Q?ToESwQNQgr4n8vsaWb8/fR7RRsGrsXvB0l3F3QiwUJ0zq8mVPO4337E/WPM2?=
 =?us-ascii?Q?R3xUvAv+py5Khx2twsc9pKva8FACQ2LvmrSHVcih8ny8ccKk0n7iDd1qScS3?=
 =?us-ascii?Q?NLmjrsfUnsuJAWcD3pnSeP2w/fC6JJCz+wx6do0RCUYWQU1wokPqFH0h4+0F?=
 =?us-ascii?Q?fiprWRFNIWA/B4DRGIFwXEeTi2pKtuEVqN91dFZRFCHwn8zmq+1CihQq8DC8?=
 =?us-ascii?Q?er14xfiyWjzJl2jEZZXAz+C/h4fXy7q5JGybMAjyV5rtqiAnJN694OStChdm?=
 =?us-ascii?Q?hiBsO/JA8zhtfke9iqfE67ODBznyRm3Uh08ws8oiVqBrGgosnCFd+Eh9DGTa?=
 =?us-ascii?Q?Z33/YevUWaNWzeTbuEW6cZTuJvM8j7HVRbzBnxWWN5Fqi1XRk8g2kXyGYqs7?=
 =?us-ascii?Q?qdR1hlV56HFS/OPHQ1uuUfdKAnwxZ78CjRNEI+i3+c3Z+S/G+u2+gKZyEw1V?=
 =?us-ascii?Q?wB6/uBFf7ALSEcbfeQbvddWEN8/g4SH2uPrwNXQmyO1KI9/3nhA8f4rL/mZh?=
 =?us-ascii?Q?hnoGuzt7vLaIcpLRsPd+4DSt4A8LF8EaXmYNRsQ2zB6T+aFOkz7caXAHyrga?=
 =?us-ascii?Q?gw/vrVRyE7bzsQrWYu8UQ2P09KDu0Y1rE7SqKldweQmGIkmG2BvSNGWv2huA?=
 =?us-ascii?Q?VwcdakyacSKfnBsEFWPN1FNygfTlocb0BIWgPWPkWnBGgzKuWJiRCSOIFw6v?=
 =?us-ascii?Q?4+BsmFS0MLgGOg0mGEClz0FoJD3Ce0+VOTyapa09/bYinoxsaA3WvmHQpMh7?=
 =?us-ascii?Q?t0yymEt6tb4GJ3VICHSH8XyIns0GEPER6Tza24ErOVUwBH7RDJUPOQiq1H0K?=
 =?us-ascii?Q?4Xd7fyW+sJCHIEglTMBeqLhTSgfND18TJvlNfWID7aZMyTuFA9UuVUFcodac?=
 =?us-ascii?Q?GOkbjA2Buco4eQfK8Ja1LHn350dEt+G3Ix3nzpkDzffb+wGlKOUJLsif2fJg?=
 =?us-ascii?Q?7hB9L8jMPlPOi3TpT4nemhDW13uvwfAivj80ijV0IhnKP3I4cLm13iJJyYjY?=
 =?us-ascii?Q?V5rlHN2UM51pXHmWm48cpPo3+/R3FAwFgVj3JLdg+flg5cXVTrG+AKbSAypg?=
 =?us-ascii?Q?Cmju09HkahQYGqL75J6MsU1jSSpYMywYD9LTg3HuWZRYLI6bRbnpMiNCwQ35?=
 =?us-ascii?Q?F215h9mopy+owdzJjYahQEPynX9bR4hF4YyYoeN5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101672dc-bef6-4f02-1ff8-08de0a86835a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:29:58.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BywooSVIUQVYK4aGWgwvZ/Dx+N/QnGYQHZuvI0swKiUD8qSue/0/FGuVd7Gc6MHJrcz5ygfTTNe/nKQsT4l/KA==
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

On Sat, Oct 11, 2025 at 06:51:26PM +0200, Marek Vasut wrote:
> Pass register offset for the second half of the register area around.
> This is done in preparation for i.MX95 support addition, which has the

This is preparation for i.MX95 support addition...

> registers at offset 0x24 instead of 0x00. No functional change so far.
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
>  drivers/gpu/drm/imx/dc/dc-fg.c | 62 ++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
> index 5fadd67aa911b..05e635fdb4f9c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
> @@ -49,35 +49,37 @@
>  #define  ROW(x)			FIELD_PREP(GENMASK(29, 16), (x))
>  #define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
>
> -#define PACFG			0x54
> -#define SACFG			0x58
> +#define OFFSET_MX8QXP		0x00
> +
> +#define PACFG(o)		(0x54 + (o))
> +#define SACFG(o)		(0x58 + (o))
>  #define  STARTY(x)		FIELD_PREP(GENMASK(29, 16), ((x) + 1))
>  #define  STARTX(x)		FIELD_PREP(GENMASK(13, 0), ((x) + 1))
>
> -#define FGINCTRL		0x5c
> -#define FGINCTRLPANIC		0x60
> +#define FGINCTRL(o)		(0x5c + (o))
> +#define FGINCTRLPANIC(o)	(0x60 + (o))

I think off is better to read compared o

Frank

>  #define  FGDM_MASK		GENMASK(2, 0)
>  #define  ENPRIMALPHA		BIT(3)
>  #define  ENSECALPHA		BIT(4)
>
> -#define FGCCR			0x64
> +#define FGCCR(o)		(0x64 + (o))
>  #define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
>
> -#define FGENABLE		0x68
> +#define FGENABLE(o)		(0x68 + (o))
>  #define  FGEN			BIT(0)
>
> -#define FGSLR			0x6c
> +#define FGSLR(o)		(0x6c + (o))
>  #define  SHDTOKGEN		BIT(0)
>
> -#define FGTIMESTAMP		0x74
> +#define FGTIMESTAMP(o)		(0x74 + (o))
>  #define  FRAMEINDEX(x)		FIELD_GET(GENMASK(31, 14), (x))
>  #define  LINEINDEX(x)		FIELD_GET(GENMASK(13, 0), (x))
>
> -#define FGCHSTAT		0x78
> +#define FGCHSTAT(o)		(0x78 + (o))
>  #define  SECSYNCSTAT		BIT(24)
>  #define  SFIFOEMPTY		BIT(16)
>
> -#define FGCHSTATCLR		0x7c
> +#define FGCHSTATCLR(o)		(0x7c + (o))
>  #define  CLRSECSTAT		BIT(16)
>
>  enum dc_fg_syncmode {
> @@ -98,15 +100,15 @@ static const struct dc_subdev_info dc_fg_info[] = {
>  static const struct regmap_range dc_fg_regmap_write_ranges[] = {
>  	regmap_reg_range(FGSTCTRL, VTCFG2),
>  	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
> -	regmap_reg_range(PACFG, FGSLR),
> -	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
> +	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGSLR(OFFSET_MX8QXP)),
> +	regmap_reg_range(FGCHSTATCLR(OFFSET_MX8QXP), FGCHSTATCLR(OFFSET_MX8QXP)),
>  };
>
>  static const struct regmap_range dc_fg_regmap_read_ranges[] = {
>  	regmap_reg_range(FGSTCTRL, VTCFG2),
>  	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
> -	regmap_reg_range(PACFG, FGENABLE),
> -	regmap_reg_range(FGTIMESTAMP, FGCHSTAT),
> +	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGENABLE(OFFSET_MX8QXP)),
> +	regmap_reg_range(FGTIMESTAMP(OFFSET_MX8QXP), FGCHSTAT(OFFSET_MX8QXP)),
>  };
>
>  static const struct regmap_access_table dc_fg_regmap_write_table = {
> @@ -126,7 +128,7 @@ static const struct regmap_config dc_fg_regmap_config = {
>  	.fast_io = true,
>  	.wr_table = &dc_fg_regmap_write_table,
>  	.rd_table = &dc_fg_regmap_read_table,
> -	.max_register = FGCHSTATCLR,
> +	.max_register = FGCHSTATCLR(OFFSET_MX8QXP),
>  };
>
>  static inline void dc_fg_enable_shden(struct dc_fg *fg)
> @@ -172,15 +174,15 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
>  	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
>
>  	/* primary and secondary area position configuration */
> -	regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
> -	regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
> +	regmap_write(fg->reg, PACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
> +	regmap_write(fg->reg, SACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
>
>  	/* alpha */
> -	regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
> -	regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
> +	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
> +	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
>
>  	/* constant color is green(used in panic mode)  */
> -	regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
> +	regmap_write(fg->reg, FGCCR(OFFSET_MX8QXP), CCGREEN(0x3ff));
>
>  	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
>  	if (ret < 0)
> @@ -189,34 +191,34 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
>
>  static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>  {
> -	regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
> +	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), FGDM_MASK, mode);
>  }
>
>  static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
>  {
> -	regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
> +	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), FGDM_MASK, mode);
>  }
>
>  void dc_fg_enable(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGENABLE, FGEN);
> +	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), FGEN);
>  }
>
>  void dc_fg_disable(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGENABLE, 0);
> +	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), 0);
>  }
>
>  void dc_fg_shdtokgen(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGSLR, SHDTOKGEN);
> +	regmap_write(fg->reg, FGSLR(OFFSET_MX8QXP), SHDTOKGEN);
>  }
>
>  u32 dc_fg_get_frame_index(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGTIMESTAMP, &val);
> +	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
>
>  	return FRAMEINDEX(val);
>  }
> @@ -225,7 +227,7 @@ u32 dc_fg_get_line_index(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGTIMESTAMP, &val);
> +	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
>
>  	return LINEINDEX(val);
>  }
> @@ -249,21 +251,21 @@ bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
>  {
>  	u32 val;
>
> -	regmap_read(fg->reg, FGCHSTAT, &val);
> +	regmap_read(fg->reg, FGCHSTAT(OFFSET_MX8QXP), &val);
>
>  	return !!(val & SFIFOEMPTY);
>  }
>
>  void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
>  {
> -	regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
> +	regmap_write(fg->reg, FGCHSTATCLR(OFFSET_MX8QXP), CLRSECSTAT);
>  }
>
>  int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
>  {
>  	unsigned int val;
>
> -	return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
> +	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(OFFSET_MX8QXP), val,
>  					val & SECSYNCSTAT, 5, 100000);
>  }
>
> --
> 2.51.0
>
