Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBCBD5CD0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB110E4CA;
	Mon, 13 Oct 2025 18:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="X3AxQMI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6BA10E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL6UDY71o4kibIWh5pMEnt0M3fSeeLeIyXwnKxq4JCkPjDqml2fvc98Lgsh7LoVr2PwSX+eJLc9yXwjKXGeyjpR2cxOpHe1LzhtzOewgRDJsbKxu57FKbfxkhxrOMRQhFrmFk4F6LybeYpMrwVtzeTYZgq//sZEBbaiBBAFWfyB0LlxRGX6CKVx1dahDygGhqgn29hueTyM6/zX3K82MuQjXjoFLuKztKryRF626dC4cZXcyZ3pvrF4MRD9YD+GGVvNA9QHWkYQ92KI4xmhOsWA9tGvjLrsuwDhiVn7ntW/rS3YnED7aivEXfacifJ0H9D+5rhSZyOBl9FX1KPqA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZOPXI42dqHPKqRNaTzT24e/+1rLo4SxsyEaHt8fCXc=;
 b=Al6+NPbmyIrZmamkbNYOk00G6+aZBffy4KLPcDawlI7A41fWfbjcqxMaLw8NjtYOEHkucI0LUAos6AA5iactTdd4x0AaX1NyJwjvl+tYTw7XeBTExix4SqK88/Qj14v58hw9QhMapvb3vAOC4uOurzd3KAsKWSyJG1FoYMUJsrGsLTYNe0jmIZC25a4TVxAcUODnhpgPuDuet+lURBa9pLvgHsf4mXYbCh1cfB8vtCGPgufCJmkWW5+92gP8l4jT43W9k482lOVwzOoD+84aY0XGv4T4tXOis45nfekYuaGxGToW5HAphI+qhyXku6hckXArwD+veF6ioc6R6lVuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZOPXI42dqHPKqRNaTzT24e/+1rLo4SxsyEaHt8fCXc=;
 b=X3AxQMI7V7QOCgCcvaeplX9YuJ3SStVz7o8Hdo1BPXJHpdtzxlFHQ8Fr3MQYC8e4qeIMM7iD+KyBxDdL9BywJFME41ahBnycio4re5Bp7i5mRrMnNmMx1ai73slUkZ7B+tsEfk1VBLnBR0AA7OxH16rszVPno40t2lDKJdDGkwzrSp5YDxukxgoaaytL7jGI7F0SiK9u8yCGHm8acxdEw/bro0+SNp3CXSwPIAXIT75tsFZ6IXyp0hghfZhYGfF/23mGzJn94iuHlOc/0Nsk56XPQHY/NU6pX5SvwBV+Q0xUlSP09XrgNdFUCjM+Bc8Q2kf8tSr6XuwqhnvjMCrSyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:54:32 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:54:32 +0000
Date: Mon, 13 Oct 2025 14:54:23 -0400
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
Subject: Re: [PATCH 23/39] drm/imx: dc: Add OF match data for i.MX95
Message-ID: <aO1K39BRgLSPB+kX@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-24-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-24-marek.vasut@mailbox.org>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 3335c685-e667-4d1b-0448-08de0a89f230
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?diI2aWTZzs2TMqFhytznoiWzzvArCZxk9PY5lUjxG5TG/6bbWieNt8NOVoN3?=
 =?us-ascii?Q?nAeiv6NvBoIOSa6ZS/8oFd2Jj2Y3NcRl+256yB9iPuV6W4mXT8Xbzry967dI?=
 =?us-ascii?Q?iD0PtkCswogETH9gn3IevSTuh30o6ITw/ujplwqAL546ltbJi25d7+TK9AI/?=
 =?us-ascii?Q?VeSo4/iSaoqzphGBqt0oHqP7YGa6Bg+by0giGwCj4KOFqBmosm8L3nMsan/o?=
 =?us-ascii?Q?9Jmy2Wyk6lh+SGpZv2sb7P3YsZOjoOs6wUYs0FbOPgRfw6jdtYkiOBlcPaGR?=
 =?us-ascii?Q?f2KP/qC+mH/2YB1DSZ7F1bQTNRXU0irMK+zKXv11Vpv+Dghsjyt9XptVtFFO?=
 =?us-ascii?Q?wGsLrLIWM2jx5oBPAFigBssq1btSvET/GVU1SP6Pm6ubWz+9KkcHtWsLsO+S?=
 =?us-ascii?Q?xvP7wQJGdI4M6whQJVSOSD6F4jLnfI8TofuGt3Fy9p/KNzuCytWZvNQCmlwz?=
 =?us-ascii?Q?QGtf+zrYFIu9jkkaaqu6yYD6nEJiEmMg9UTyU2cM5CONOuJ/lr5zPZALYSR4?=
 =?us-ascii?Q?xFUmdysiNroHylQ3uNv0pkS/MNH0S4j/VG/iJyd7smysr7cHMCZVI1YFCrJb?=
 =?us-ascii?Q?QKh7nKcAF1tz0kom3wHAU31OYHl/WQuQQAgt0pGddE0GH9JssDQ1Sl2K7Fco?=
 =?us-ascii?Q?NyJKtp6BQm09M61nxL5X2lXnfJErp3P0Nw2MJHrGpEQi5tluHhVvPKhXVIpd?=
 =?us-ascii?Q?H3BzxuLhd+I0bVXbsWVx6rULClN9XfIYYv5YPfHMuMQYezmPIXF3Dqv/xypY?=
 =?us-ascii?Q?a17t7QjJHzslkyEf3BRs6mNqcQrfNbh8+LJJ50sdhzVy2FHiovJWmk97KA4p?=
 =?us-ascii?Q?C95C4/LhTo+S3cRxpi8mYSLFdfIvL0njlaFKbm7eL+ObSyEzSC1OoiMRdJPh?=
 =?us-ascii?Q?agFkVAWE7IpMDS114bHXgGErxU8Vj8N2tUpU8erAMdZ71Mu+AFYD0SH3qp9I?=
 =?us-ascii?Q?qozFNFrvMsWzDiQ2471psnRKYYuvajbRyOETaAuzm81VtnmAD/8rtWw/W//Y?=
 =?us-ascii?Q?PW6Iw4XJ0OSeKXO4lXcdJ1H6rXk2Xv58JLGbihgCfNXvzBFDNR3p51DffYEA?=
 =?us-ascii?Q?9v0UWChLhZaGzBfXJ2+Y0IMwK+gG2o5HrR4BxXZIVsz/mlGZrIpCfAmFSjIx?=
 =?us-ascii?Q?zzsZKzPvo5eOm6OG2Swb5SUDtSZj2RE6UqVlllzNiIhIQ52OV9OVm+yzd0wC?=
 =?us-ascii?Q?8JYafKTRJWtpekgHlT8P8t9iGBRDtYJ8ZTBYtybFdohkT9alImXYwPDKV9aS?=
 =?us-ascii?Q?cKq/qT9box7jP7libwEAwhVgMrd3pelsbo6gx+LXGbE12ilDIywTrkTBvvCL?=
 =?us-ascii?Q?uOtJsrsujXxGgpdA2CzH0SHluHMYUXDzeuR++qBXXCM2O45ilubRJnKcQm2e?=
 =?us-ascii?Q?qSeVq8cxtf7RTphGZe2KAdnbKl6R+yXwTOMaQHLPTbzuUY1qeQjfQ35ScyXU?=
 =?us-ascii?Q?uFhyhXymz8H/X1dzB8wuSDSTprOYJKRzBO1cAOi4/gzgopMrz8Br49XvRNhr?=
 =?us-ascii?Q?lxtVbXFPqufjMg2BBh5HNhtb8mL/7T3BZQ53?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t9jw8bM/LcMXoZuLHarYaT1sB3ib4ttnPSA1IrveDAtHfPJey/LLAD2p0KHc?=
 =?us-ascii?Q?67vehzhk6SAryofZLz1YkSA32NKJsa5y76BaVPSY4jI0O87+ttkYTFFyPbek?=
 =?us-ascii?Q?mNeoUa2cz1Ifti5L7oOwrepDmLojDofMex+GpK+xuhHJJiJa86Ds1KTalyWA?=
 =?us-ascii?Q?CvGt3IPgh4YpFeXG+A+uwmdJ1GtsQnysi/RexsOFDlsOx5nl2D2bjlboY+X4?=
 =?us-ascii?Q?/cevdfhqm/m6TnyvNh1RTCpnKe+uYljZdBwuitXCmPxv3sKWS011ftUpTX+w?=
 =?us-ascii?Q?4WC3N8QS6ORUAPvS/YUWmtoZ7i0TA1pYZ1XM+WHCk1TAhaZsvRuOhjVOev7K?=
 =?us-ascii?Q?wa8hdqtnuMMKXLORkULA3/OuxuQ0hxX3KTLD+61K4KpipurzFntNjgtVMPtw?=
 =?us-ascii?Q?acy9R51sulvB5Tqk0ZljJbr8JdG+H8vsLv6IUkB649jRjd6thQIwqnsok7/t?=
 =?us-ascii?Q?8ukClkVsgmKQqOFZn4f4V/PsWZ8U4yfT9Msd29+r3tloTgq0Nw/AHoL817Dy?=
 =?us-ascii?Q?ofG0v59AWNFg2OxVqNOglvLZG81CphC9/lx9IU/f6QFAtne1VcJ41Y7ukTSH?=
 =?us-ascii?Q?JqwCdrGy1a0ix6M6ouXhkPlzt/DsqlGXat15Qh6MVIxc+K87LDSx1ONNfpvN?=
 =?us-ascii?Q?00gH7sz2kBGzEoySMSTL6p/Bn5MbZif3mee+Ac+pBye/2TTvkL5upzJwqMkQ?=
 =?us-ascii?Q?MocAJ4tyTpSWtdCoMeUdaC6pWT7lepI8i3mGrsqayz2TrAl2qsA70R1rPe85?=
 =?us-ascii?Q?Pt738xg27T/rtdjpwbbFUOcjGx1CLsM7yhtFWpFs0wvZIHCKn2bVKEahv//x?=
 =?us-ascii?Q?uO++4t9uGaET/cbPInU7fc51988mc3VGisMiIwzo7B3PcaLr0WRn2sAc2V29?=
 =?us-ascii?Q?TPtgRDkWsR9jA89k8ZULDokFbGA5jq+M7VmFropFv2UFmLcHqVidoJTbLCuh?=
 =?us-ascii?Q?dhYMocNmJy6uYEnfZj6PtojX95bKLCJttfYrrE9Vdgn+JudEOUEWpZfv/rHZ?=
 =?us-ascii?Q?9lOu5N8Rft5bIl+pGM3/THZb40bd6oCmIFfWnQzhtQYerlNcvLjriiliqfvh?=
 =?us-ascii?Q?d/szK6IIEOU3M3XNSpA7dxYwpuw/GKbpVjjdAJ4/0DIGVL2U0hPGah7lbHDl?=
 =?us-ascii?Q?4Wunew3twmfAR1bapSyxD4aD/2WXX7P/BuiMU6Ta24u8dAgg+4UQbi5qYYLV?=
 =?us-ascii?Q?KPFpC2ZR8NgWB3fiMzB9gZwmU9nDsHJRyKn75jwOrLKL+ktFRTR5RpxCIr91?=
 =?us-ascii?Q?KeJVXC6fy2nqSjzraKoJjlQcTLyIpcKNlBJTeLS8dLaCjgGuL45ZKlkcK/8O?=
 =?us-ascii?Q?o1e/pTIJ9Ebe87fh9L+JJ0Rr9Qy3jTBNT+pOo+ns9Bga0raVWodggHu+Dk14?=
 =?us-ascii?Q?Yg1YhtRsxG1IiDsE0w1yl7xNeM4+GayjeNR8kAfRMh9EnlCBzS6MAqHpW/DU?=
 =?us-ascii?Q?hJb4xTTLE+sl8nDOpfrhFWXItbewYdGkFEWULKAlaPYSNgu8nkxQBkOk2TrF?=
 =?us-ascii?Q?nIWpP/4rBi6ILD1aQvt85vHFPsQp+SJKmX4gtKlJcsBg3AFA9eOvdKwuo6Yr?=
 =?us-ascii?Q?rXhQvcegyERvwDO9tgHeLxUEKph1GjS9Xainrng8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3335c685-e667-4d1b-0448-08de0a89f230
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:54:32.6943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQ0R5qQgUjDDQ4SqNpJbC8HaeyQe6aa0Oq8jN9xeTZWuaZ+VMJbVtlThvnk2WcEPqPClPnOUi6pXQBRR72lhxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577
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

On Sat, Oct 11, 2025 at 06:51:38PM +0200, Marek Vasut wrote:
> Fill in OF match data for i.MX95, so the drivers can bind on this SoC.

Add i.MX95 support by filling OF match data.

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
>  drivers/gpu/drm/imx/dc/Kconfig  |  4 +--
>  drivers/gpu/drm/imx/dc/dc-cf.c  | 15 ++++++++
>  drivers/gpu/drm/imx/dc/dc-de.c  | 34 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  4 ++-
>  drivers/gpu/drm/imx/dc/dc-ed.c  | 25 ++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 48 ++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c  | 41 +++++++++++++++++++++-
>  drivers/gpu/drm/imx/dc/dc-ic.c  | 61 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/imx/dc/dc-lb.c  | 52 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/imx/dc/dc-pe.h  | 11 +++++-
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 12 +++++++
>  11 files changed, 299 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
> index 415993207f2e3..95fddf38066b0 100644
> --- a/drivers/gpu/drm/imx/dc/Kconfig
> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> @@ -1,5 +1,5 @@
>  config DRM_IMX8_DC
> -	tristate "Freescale i.MX8 Display Controller Graphics"
> +	tristate "Freescale i.MX8Q/i.MX95 Display Controller Graphics"
>  	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>  	select DRM_CLIENT_SELECTION
>  	select DRM_GEM_DMA_HELPER
> @@ -10,4 +10,4 @@ config DRM_IMX8_DC
>  	select REGMAP
>  	select REGMAP_MMIO
>  	help
> -	  enable Freescale i.MX8 Display Controller(DC) graphics support
> +	  enable Freescale i.MX8Q/i.MX95 Display Controller(DC) graphics support
> diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
> index 1d3602c5d4230..1d409146f8b99 100644
> --- a/drivers/gpu/drm/imx/dc/dc-cf.c
> +++ b/drivers/gpu/drm/imx/dc/dc-cf.c
> @@ -39,12 +39,26 @@ static const struct dc_subdev_info dc_cf_info_imx8qxp[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_cf_info_imx95[] = {
> +	{ .reg_start = 0x4b4f1000, .id = 0, },
> +	{ .reg_start = 0x4b531000, .id = 1, },
> +	{ .reg_start = 0x4b501000, .id = 4, },
> +	{ .reg_start = 0x4b541000, .id = 5, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct dc_cf_subdev_match_data dc_cf_match_data_imx8qxp = {
>  	.link_cf4 = LINK_ID_CONSTFRAME4_MX8QXP,
>  	.link_cf5 = LINK_ID_CONSTFRAME5_MX8QXP,
>  	.info = dc_cf_info_imx8qxp,
>  };
>
> +static const struct dc_cf_subdev_match_data dc_cf_match_data_imx95 = {
> +	.link_cf4 = LINK_ID_CONSTFRAME4_MX95,
> +	.link_cf5 = LINK_ID_CONSTFRAME5_MX95,
> +	.info = dc_cf_info_imx95,
> +};
> +
>  static const struct regmap_range dc_cf_regmap_ranges[] = {
>  	regmap_reg_range(STATICCONTROL, CONSTANTCOLOR),
>  };
> @@ -173,6 +187,7 @@ static void dc_cf_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_cf_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-constframe", .data = &dc_cf_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-constframe", .data = &dc_cf_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_cf_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
> index 6331b2f3b622c..5ee54c65e23f6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.c
> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
> @@ -16,6 +16,7 @@
>  #include "dc-de.h"
>  #include "dc-drv.h"
>
> +#define POLARITYCTRL_IMX95	0x8
>  #define POLARITYCTRL_IMX8QXP	0xc
>  #define  POLEN_HIGH		BIT(2)
>
> @@ -57,6 +58,38 @@ static const struct dc_de_subdev_match_data dc_de_match_data_imx8qxp = {
>  	.info = dc_de_info_imx8qxp,
>  };
>
> +static const struct dc_subdev_info dc_de_info_imx95[] = {
> +	{ .reg_start = 0x4b711000, .id = 0, },
> +	{ .reg_start = 0x4b771000, .id = 1, },
> +	{ /* sentinel */ },
> +};
> +
> +static const struct regmap_range dc_de_regmap_ranges_imx95[] = {
> +	regmap_reg_range(POLARITYCTRL_IMX95, POLARITYCTRL_IMX95),
> +};
> +
> +static const struct regmap_access_table dc_de_regmap_access_table_imx95 = {
> +	.yes_ranges = dc_de_regmap_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges_imx95),
> +};
> +
> +static const struct regmap_config dc_de_top_regmap_config_imx95 = {
> +	.name = "top",
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +	.wr_table = &dc_de_regmap_access_table_imx95,
> +	.rd_table = &dc_de_regmap_access_table_imx95,
> +	.max_register = POLARITYCTRL_IMX95,
> +};
> +
> +static const struct dc_de_subdev_match_data dc_de_match_data_imx95 = {
> +	.regmap_config = &dc_de_top_regmap_config_imx95,
> +	.reg_polarityctrl = POLARITYCTRL_IMX95,
> +	.info = dc_de_info_imx95,
> +};
> +
>  static inline void dc_dec_init(struct dc_de *de)
>  {
>  	regmap_write_bits(de->reg_top, de->reg_polarityctrl, de->reg_polarityctrl, POLEN_HIGH);
> @@ -180,6 +213,7 @@ static const struct dev_pm_ops dc_de_pm_ops = {
>
>  static const struct of_device_id dc_de_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-display-engine", .data = &dc_de_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-display-engine", .data = &dc_de_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index dec8ad19bad42..b09fd8d6a2c52 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -64,7 +64,8 @@ dc_add_components(struct device *dev, struct component_match **matchptr)
>
>  	for_each_available_child_of_node(dev->of_node, child) {
>  		/* The interrupt controller is not a component. */
> -		if (of_device_is_compatible(child, "fsl,imx8qxp-dc-intc"))
> +		if (of_device_is_compatible(child, "fsl,imx8qxp-dc-intc") ||
> +		    of_device_is_compatible(child, "fsl,imx95-dc-intc"))
>  			continue;
>
>  		drm_of_component_match_add(dev, matchptr, component_compare_of,
> @@ -274,6 +275,7 @@ static const struct dev_pm_ops dc_pm_ops = {
>
>  static const struct of_device_id dc_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc", },
> +	{ .compatible = "fsl,imx95-dc", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 63dcad30ecced..a2f89dabd2b58 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -49,6 +49,14 @@ static const struct dc_subdev_info dc_ed_info_imx8qxp[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_ed_info_imx95[] = {
> +	{ .reg_start = 0x4b511000, .id = 0, },
> +	{ .reg_start = 0x4b551000, .id = 1, },
> +	{ .reg_start = 0x4b521000, .id = 4, },
> +	{ .reg_start = 0x4b561000, .id = 5, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct regmap_range dc_ed_pec_regmap_write_ranges[] = {
>  	regmap_reg_range(PIXENGCFG_STATIC, PIXENGCFG_STATIC),
>  	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
> @@ -125,11 +133,27 @@ static const enum dc_link_id src_sels_imx8qxp[] = {
>  	LINK_ID_LAST	/* sentinel */
>  };
>
> +static const enum dc_link_id src_sels_imx95[] = {
> +	LINK_ID_NONE,
> +	LINK_ID_LAYERBLEND5_MX95,
> +	LINK_ID_LAYERBLEND4_MX95,
> +	LINK_ID_LAYERBLEND3_MX95,
> +	LINK_ID_LAYERBLEND2_MX95,
> +	LINK_ID_LAYERBLEND1_MX95,
> +	LINK_ID_LAYERBLEND0_MX95,
> +	LINK_ID_LAST	/* sentinel */
> +};
> +
>  static const struct dc_ed_subdev_match_data dc_ed_match_data_imx8qxp = {
>  	.src_sels = src_sels_imx8qxp,
>  	.info = dc_ed_info_imx8qxp,
>  };
>
> +static const struct dc_ed_subdev_match_data dc_ed_match_data_imx95 = {
> +	.src_sels = src_sels_imx95,
> +	.info = dc_ed_info_imx95,
> +};
> +
>  static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
>  {
>  	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
> @@ -289,6 +313,7 @@ static void dc_ed_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_ed_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-extdst", .data = &dc_ed_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-extdst", .data = &dc_ed_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
> index e13b057a92ffb..b2477461faff5 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fg.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fg.c
> @@ -51,6 +51,7 @@
>  #define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
>
>  #define OFFSET_MX8QXP		0x00
> +#define OFFSET_MX95		0x24
>
>  #define PACFG(o)		(0x54 + (o))
>  #define SACFG(o)		(0x58 + (o))
> @@ -104,6 +105,12 @@ static const struct dc_subdev_info dc_fg_info_imx8qxp[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_fg_info_imx95[] = {
> +	{ .reg_start = 0x4b6b0000, .id = 0, },
> +	{ .reg_start = 0x4b730000, .id = 1, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct regmap_range dc_fg_regmap_write_ranges_imx8qxp[] = {
>  	regmap_reg_range(FGSTCTRL, VTCFG2),
>  	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
> @@ -144,6 +151,46 @@ static const struct dc_fg_subdev_match_data dc_fg_match_data_imx8qxp = {
>  	.info = dc_fg_info_imx8qxp,
>  };
>
> +static const struct regmap_range dc_fg_regmap_write_ranges_imx95[] = {
> +	regmap_reg_range(FGSTCTRL, VTCFG2),
> +	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
> +	regmap_reg_range(PACFG(OFFSET_MX95), FGSLR(OFFSET_MX95)),
> +	regmap_reg_range(FGCHSTATCLR(OFFSET_MX95), FGCHSTATCLR(OFFSET_MX95)),
> +};
> +
> +static const struct regmap_range dc_fg_regmap_read_ranges_imx95[] = {
> +	regmap_reg_range(FGSTCTRL, VTCFG2),
> +	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
> +	regmap_reg_range(PACFG(OFFSET_MX95), FGENABLE(OFFSET_MX95)),
> +	regmap_reg_range(FGTIMESTAMP(OFFSET_MX95), FGCHSTAT(OFFSET_MX95)),
> +};
> +
> +static const struct regmap_access_table dc_fg_regmap_write_table_imx95 = {
> +	.yes_ranges = dc_fg_regmap_write_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges_imx95),
> +};
> +
> +static const struct regmap_access_table dc_fg_regmap_read_table_imx95 = {
> +	.yes_ranges = dc_fg_regmap_read_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges_imx95),
> +};
> +
> +static const struct regmap_config dc_fg_regmap_config_imx95 = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +	.wr_table = &dc_fg_regmap_write_table_imx95,
> +	.rd_table = &dc_fg_regmap_read_table_imx95,
> +	.max_register = FGCHSTATCLR(OFFSET_MX95),
> +};
> +
> +static const struct dc_fg_subdev_match_data dc_fg_match_data_imx95 = {
> +	.regmap_config = &dc_fg_regmap_config_imx95,
> +	.reg_offset = OFFSET_MX95,
> +	.info = dc_fg_info_imx95,
> +};
> +
>  static inline void dc_fg_enable_shden(struct dc_fg *fg)
>  {
>  	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
> @@ -380,6 +427,7 @@ static void dc_fg_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_fg_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-framegen", .data = &dc_fg_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-framegen", .data = &dc_fg_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
> index 53647e3a395b4..3aa437120b11d 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fl.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fl.c
> @@ -8,6 +8,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>
>  #include <drm/drm_fourcc.h>
> @@ -27,6 +28,7 @@
>  #define CONSTANTCOLOR			0x30
>  #define LAYERPROPERTY			0x34
>  #define FRAMEDIMENSIONS_IMX8QXP		0x150
> +#define FRAMEDIMENSIONS_IMX95		0x1d8
>
>  struct dc_fl {
>  	struct dc_fu fu;
> @@ -47,6 +49,12 @@ static const struct dc_subdev_info dc_fl_info_imx8qxp[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_fl_info_imx95[] = {
> +	{ .reg_start = 0x4b5d1000, .id = 0, },
> +	{ .reg_start = 0x4b5e1000, .id = 1, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct regmap_range dc_fl_regmap_ranges_imx8qxp[] = {
>  	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX8QXP),
>  };
> @@ -77,6 +85,36 @@ static const struct dc_fl_subdev_match_data dc_fl_match_data_imx8qxp = {
>  	.info = dc_fl_info_imx8qxp,
>  };
>
> +static const struct regmap_range dc_fl_regmap_ranges_imx95[] = {
> +	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX95),
> +};
> +
> +static const struct regmap_access_table dc_fl_regmap_access_table_imx95 = {
> +	.yes_ranges = dc_fl_regmap_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges_imx95),
> +};
> +
> +static const struct regmap_config dc_fl_cfg_regmap_config_imx95 = {
> +	.name = "cfg",
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +	.wr_table = &dc_fl_regmap_access_table_imx95,
> +	.rd_table = &dc_fl_regmap_access_table_imx95,
> +	.max_register = FRAMEDIMENSIONS_IMX95,
> +};
> +
> +static const struct dc_fl_subdev_match_data dc_fl_match_data_imx95 = {
> +	.regmap_config = &dc_fl_cfg_regmap_config_imx95,
> +	.reg_offset_bbm = 0x4,
> +	.reg_offset_base = 0x8,
> +	.reg_offset_rest = 0x14,
> +	.reg_framedimensions = FRAMEDIMENSIONS_IMX95,
> +	.reg_frac_offset = 0x38,
> +	.info = dc_fl_info_imx95,
> +};
> +
>  static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
>  			  const struct drm_format_info *format)
>  {
> @@ -152,7 +190,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>  	}
>
>  	fu->link_id = LINK_ID_FETCHLAYER0;
> -	fu->id = DC_FETCHUNIT_FL0;
> +	fu->id = DC_FETCHUNIT_FL0 + id;
>  	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
>  		off = i * dc_fl_match_data->reg_frac_offset;
>  		off_base = off + dc_fl_match_data->reg_offset_base;
> @@ -202,6 +240,7 @@ static void dc_fl_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_fl_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-fetchlayer", .data = &dc_fl_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-fetchlayer", .data = &dc_fl_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
> index c3d7e5aa4ae23..ac83642cbe4c8 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ic.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ic.c
> @@ -24,8 +24,13 @@
>  #define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
>  #define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
>
> -#define IRQ_COUNT_MAX	49
> -#define REG_NUM_MAX	2
> +#define INTERRUPTENABLE_MX95(n)	(0x8 + 4 * (n))
> +#define INTERRUPTPRESET_MX95(n)	(0x14 + 4 * (n))
> +#define INTERRUPTCLEAR_MX95(n)	(0x20 + 4 * (n))
> +#define INTERRUPTSTATUS_MX95(n)	(0x2c + 4 * (n))
> +
> +#define IRQ_COUNT_MAX	86
> +#define REG_NUM_MAX	3
>
>  struct dc_ic_data {
>  	struct regmap		*regs;
> @@ -109,6 +114,57 @@ static const struct dc_ic_subdev_match_data dc_ic_match_data_imx8qxp = {
>  	.reserved_irq = 35,
>  };
>
> +static const struct regmap_range dc_ic_regmap_write_ranges_imx95[] = {
> +	regmap_reg_range(INTERRUPTENABLE_MX95(0), INTERRUPTCLEAR_MX95(2)),
> +};
> +
> +static const struct regmap_access_table dc_ic_regmap_write_table_imx95 = {
> +	.yes_ranges = dc_ic_regmap_write_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges_imx95),
> +};
> +
> +static const struct regmap_range dc_ic_regmap_read_ranges_imx95[] = {
> +	regmap_reg_range(INTERRUPTENABLE_MX95(0), INTERRUPTENABLE_MX95(2)),
> +	regmap_reg_range(INTERRUPTSTATUS_MX95(0), INTERRUPTSTATUS_MX95(2)),
> +};
> +
> +static const struct regmap_access_table dc_ic_regmap_read_table_imx95 = {
> +	.yes_ranges = dc_ic_regmap_read_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges_imx95),
> +};
> +
> +static const struct regmap_range dc_ic_regmap_volatile_ranges_imx95[] = {
> +	regmap_reg_range(INTERRUPTPRESET_MX95(0), INTERRUPTCLEAR_MX95(2)),
> +};
> +
> +static const struct regmap_access_table dc_ic_regmap_volatile_table_imx95 = {
> +	.yes_ranges = dc_ic_regmap_volatile_ranges_imx95,
> +	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges_imx95),
> +};
> +
> +static const struct regmap_config dc_ic_regmap_config_imx95 = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +	.wr_table = &dc_ic_regmap_write_table_imx95,
> +	.rd_table = &dc_ic_regmap_read_table_imx95,
> +	.volatile_table = &dc_ic_regmap_volatile_table_imx95,
> +	.max_register = INTERRUPTSTATUS_MX95(2),
> +};
> +
> +static const struct dc_ic_subdev_match_data dc_ic_match_data_imx95 = {
> +	.regmap_config = &dc_ic_regmap_config_imx95,
> +	.reg_enable = INTERRUPTENABLE_MX95(0),
> +	.reg_clear = INTERRUPTCLEAR_MX95(0),
> +	.reg_status = INTERRUPTSTATUS_MX95(0),
> +	.reg_count = 3,
> +	.irq_count = 86,
> +	.user_irq = false,
> +	.unused_irq = { 0x00000000, 0x00000000, 0xffc00000 },
> +	.reserved_irq = -1,
> +};
> +
>  static void dc_ic_irq_handler(struct irq_desc *desc)
>  {
>  	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
> @@ -304,6 +360,7 @@ static const struct dev_pm_ops dc_ic_pm_ops = {
>
>  static const struct of_device_id dc_ic_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-intc", .data = &dc_ic_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-intc", .data = &dc_ic_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
> index ba9183b244ab3..f38f338e48c4c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-lb.c
> +++ b/drivers/gpu/drm/imx/dc/dc-lb.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>
>  #include <drm/drm_blend.h>
> @@ -79,7 +80,7 @@ enum dc_lb_shadow_sel {
>  	BOTH = 0x2,
>  };
>
> -static const struct dc_subdev_info dc_lb_info[] = {
> +static const struct dc_subdev_info dc_lb_info_imx8qxp[] = {
>  	{ .reg_start = 0x56180ba0, .id = 0, },
>  	{ .reg_start = 0x56180bc0, .id = 1, },
>  	{ .reg_start = 0x56180be0, .id = 2, },
> @@ -87,6 +88,16 @@ static const struct dc_subdev_info dc_lb_info[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_lb_info_imx95[] = {
> +	{ .reg_start = 0x4b571000, .id = 0, },
> +	{ .reg_start = 0x4b581000, .id = 1, },
> +	{ .reg_start = 0x4b591000, .id = 2, },
> +	{ .reg_start = 0x4b5a1000, .id = 3, },
> +	{ .reg_start = 0x4b5b1000, .id = 4, },
> +	{ .reg_start = 0x4b5c1000, .id = 5, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct regmap_range dc_lb_pec_regmap_access_ranges[] = {
>  	regmap_reg_range(PIXENGCFG_DYNAMIC, PIXENGCFG_DYNAMIC),
>  };
> @@ -163,6 +174,44 @@ static const struct dc_lb_subdev_match_data dc_lb_match_data_imx8qxp = {
>  	.info = dc_lb_info_imx8qxp,
>  };
>
> +static const enum dc_link_id prim_sels_imx95[] = {
> +	/* common options */
> +	LINK_ID_NONE,
> +	LINK_ID_CONSTFRAME0,
> +	LINK_ID_CONSTFRAME1,
> +	LINK_ID_CONSTFRAME4_MX95,
> +	LINK_ID_CONSTFRAME5_MX95,
> +	/*
> +	 * special options:
> +	 * layerblend(n) has n special options,
> +	 * from layerblend0 to layerblend(n - 1), e.g.,
> +	 * layerblend3 has 3 special options -
> +	 * layerblend0/1/2.
> +	 */
> +	LINK_ID_LAYERBLEND0_MX95,
> +	LINK_ID_LAYERBLEND1_MX95,
> +	LINK_ID_LAYERBLEND2_MX95,
> +	LINK_ID_LAYERBLEND3_MX95,
> +	LINK_ID_LAYERBLEND4_MX95,
> +	LINK_ID_LAYERBLEND5_MX95,
> +	LINK_ID_LAST
> +};
> +
> +static const enum dc_link_id sec_sels_imx95[] = {
> +	LINK_ID_NONE,
> +	LINK_ID_FETCHLAYER0,
> +	LINK_ID_FETCHLAYER1_MX95,
> +	LINK_ID_LAST
> +};
> +
> +static const struct dc_lb_subdev_match_data dc_lb_match_data_imx95 = {
> +	.pri_sels = prim_sels_imx95,
> +	.sec_sels = sec_sels_imx95,
> +	.first_lb = LINK_ID_LAYERBLEND0_MX95,
> +	.last_cf = 7,
> +	.info = dc_lb_info_imx95,
> +};
> +
>  enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
>  {
>  	return lb->link;
> @@ -333,6 +382,7 @@ static void dc_lb_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_lb_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-layerblend", .data = &dc_lb_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-layerblend", .data = &dc_lb_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_lb_dt_ids);
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index 492d193127bc1..c7a50749db38f 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -19,16 +19,25 @@
>  #define CLKEN(n)		((n) << CLKEN_MASK_SHIFT)
>
>  #define DC_DISP_FU_CNT		2
> -#define DC_LB_CNT		4
> +#define DC_LB_CNT		6
>
>  enum dc_link_id {
>  	LINK_ID_NONE			= 0x00,
>  	LINK_ID_CONSTFRAME0		= 0x0c,
> +	LINK_ID_CONSTFRAME4_MX95	= 0x0d,
>  	LINK_ID_CONSTFRAME4_MX8QXP	= 0x0e,
>  	LINK_ID_CONSTFRAME1		= 0x10,
> +	LINK_ID_CONSTFRAME5_MX95	= 0x11,
>  	LINK_ID_CONSTFRAME5_MX8QXP	= 0x12,
> +	LINK_ID_LAYERBLEND0_MX95	= 0x14,
> +	LINK_ID_LAYERBLEND1_MX95	= 0x15,
> +	LINK_ID_LAYERBLEND2_MX95	= 0x16,
> +	LINK_ID_LAYERBLEND3_MX95	= 0x17,
> +	LINK_ID_LAYERBLEND4_MX95	= 0x18,
> +	LINK_ID_LAYERBLEND5_MX95	= 0x19,
>  	LINK_ID_FETCHWARP2		= 0x14,
>  	LINK_ID_FETCHLAYER0		= 0x1a,
> +	LINK_ID_FETCHLAYER1_MX95	= 0x1b,
>  	LINK_ID_LAYERBLEND0_MX8QXP	= 0x21,
>  	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
>  	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
> diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
> index 1f287706e8706..9a08fcabc625a 100644
> --- a/drivers/gpu/drm/imx/dc/dc-tc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-tc.c
> @@ -37,6 +37,12 @@ static const struct dc_subdev_info dc_tc_info_imx8qxp[] = {
>  	{ /* sentinel */ },
>  };
>
> +static const struct dc_subdev_info dc_tc_info_imx95[] = {
> +	{ .reg_start = 0x4b711000, .id = 0, },
> +	{ .reg_start = 0x4b771000, .id = 1, },
> +	{ /* sentinel */ },
> +};
> +
>  static const struct regmap_range dc_tc_regmap_ranges[] = {
>  	regmap_reg_range(TCON_CTRL, TCON_CTRL),
>  	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
> @@ -72,6 +78,11 @@ static const struct dc_tc_subdev_match_data dc_tc_match_data_imx8qxp = {
>  	.info = dc_tc_info_imx8qxp,
>  };
>
> +static const struct dc_tc_subdev_match_data dc_tc_match_data_imx95 = {
> +	.need_config = false,
> +	.info = dc_tc_info_imx95,
> +};
> +
>  void dc_tc_init(struct dc_tc *tc)
>  {
>  	if (!tc->need_config)
> @@ -149,6 +160,7 @@ static void dc_tc_remove(struct platform_device *pdev)
>
>  static const struct of_device_id dc_tc_dt_ids[] = {
>  	{ .compatible = "fsl,imx8qxp-dc-tcon", .data = &dc_tc_match_data_imx8qxp },
> +	{ .compatible = "fsl,imx95-dc-tcon", .data = &dc_tc_match_data_imx95 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
> --
> 2.51.0
>
