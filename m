Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E7B090B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 17:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EC810E847;
	Thu, 17 Jul 2025 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XlkkyD6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD010E847
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 15:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J73Nk8dxSt/MxL4bmS1ZDwjscPgjcS0eCwAr7Sj/ZW04SEvAG5VEeihCLzaea+w0vfzD/RZ/+UnaI6bWkVIyUd0/5EYRTk6zTrA52JbnaROeWqqKyNSU5p/uTI0Cmco4+5Pk5L+VcgWUVdu9wMtBrSGlxYNhUWRCNdi0fEYkS3n8cG11b26EPh5R9bmMpeqgDYN5bjcAQAS0pLVCrLrzRpEOpGw396VBeJCZzCH0OmCjJWVtwsFxvRPYvff62WuRMui/Ogo/4JSWjaB8gEk+ZqKE/oI6UmnTNMHTfIQG+190Kxg3qT0zR8oP5Yj9kZiL71gjauZaWzWtI2zdclwG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcGDk7oyl8cLtrQ3qrd0ata13NKrFfOstTfRAXipnVA=;
 b=j7+SEkeYdHEPIikVLvMhot/riL36K93f9Y6PDXHGtUug3rHawI3hrQ4e19tjV5zaCjij9OgCn3rUir5omFDpLLdaJ2xbDU31GQUfQCfKTJRLn9Ghpb7BCUzdqy4PHzKxl4GSAAckHoFGw39yFK7eXZDHQcvB7vncE7lxDzD1m6NV2rNGmMMq1u+XYCUWV4vvNQls3H9ym75jpwCODFn9Syg8nsfBLk9OA8QXtVZXGhOLP3G3V6o1ppi2wMV2MLacxO6VDE6vEsomXS6ZSJc8J0ojZi5ojYyEG57PSOseCe+fgJR+pIf6mrlHcdVFVEY2EzeoQqw9DOw/JMMcAMsrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcGDk7oyl8cLtrQ3qrd0ata13NKrFfOstTfRAXipnVA=;
 b=XlkkyD6l9myGPJMUx3uHZ8pjuyDAYuyP7umxqhPt1KqE6VmjQ/1PSaW6HzDRsld8pIPjPgmc5TWJsv4vKpYre11gjcPWl0gLcdi8vHr1xjy9HcAv8hRpk6aXwQgEtJPkyAlSrAa2K8k3nVYkSvCZwwYOffjDnTVWQFs/6kQQeQClGAkhjVFnO8L0moFHpDRx5M8vnkQs4IKuapAJEhWbSp7R+3sPyn+BorSWjztO73xpFh9ndpAd+EDAWm6L2QxYa1mpsRbFbYynfEZu5+Gn9q4IF2EyhUGSaupWeSWdqTnp5feMoqPRVIONURizvSlxO9SDzug/mBqRk6tvCW6wdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7250.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 15:38:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 15:38:21 +0000
Date: Thu, 17 Jul 2025 11:38:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when
 RPM routines are called
Message-ID: <aHkY51MOgl4v2Y9/@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
 <aHfvbTpQ4LmexJpA@lizhi-Precision-Tower-5810>
 <lp3m4bahzbwvb6nfu2o6hsr5cux3y4rgdasbgba2jc774iei5a@plfpzihh7pen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lp3m4bahzbwvb6nfu2o6hsr5cux3y4rgdasbgba2jc774iei5a@plfpzihh7pen>
X-ClientProxiedBy: AM0PR02CA0155.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 02546a40-03e7-48fa-e1ff-08ddc547f5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?woBzS/g0ozaiWd7Xa9ubtu2QJkRwg/hatLmH5o8AvlA1Rzp1mxcqxax3zHqL?=
 =?us-ascii?Q?kDzS0aJBGTWhin2Vly7V+PZL+O2CC70mN9Od35LJijlnjSd04/BBpwuxz2Qj?=
 =?us-ascii?Q?yPsCYXfj0den94XtkWQO+MFZrvXSKDln+nR3WjNVUfRKu+BO7GCMUdf1WAEN?=
 =?us-ascii?Q?AlcYvUotVnyHrygnceo9YUgzkKmibZAA5bNkHW5I2Dfv+2cXhza3q1IjzQsv?=
 =?us-ascii?Q?uBQrP+kYBa/PkWQdu1OhQtiyqhDM+BoeLwscdP5unKY1gGXgTDQlrkmtG1Xf?=
 =?us-ascii?Q?OoETHYzcM0nQ8Qog9wO1iJ4Eql8VUfcUUzXAKxOl6OMNmk1ZjFJsQ+rXuMd/?=
 =?us-ascii?Q?HhiRSBuZKpWnjPMHzcrdLbaQxH+AXRIOPhwDgIGHMj3I2ja2+n4kgm+zH2dG?=
 =?us-ascii?Q?nC7XpNUKRdTyK4lmr4syxLBCO9pCJhsWB0ZKWajeRIX8+LcHle9KR1I0XPKT?=
 =?us-ascii?Q?tQG2dVFWjJqPTM/z7wsYHcInYJHcw38O6I7e9MPYmJpLFGniOQuSTdSk5Wn4?=
 =?us-ascii?Q?nK58T7D7MicovFVw9VnY7rmfh/nr3TSKeJUJsCbDxmWNFyfPYB023Q2gr/0Y?=
 =?us-ascii?Q?Vew2Ynjo9uEsPR6VaLOTyRFo3v5yz0dGJipNvbwZMs5Y9ozX6jRmpyoBbJIR?=
 =?us-ascii?Q?2A0Drpy24fi7nMshBT0PA5Yz6sz52lOX9TYVbye2xyiC3t2LsOdTLC5FJTcj?=
 =?us-ascii?Q?cYBoFkVEi/hQroLJ+AkelPgqjpOKijz0PrTWuzC6dE9hvtbjxzRJhkuTckqx?=
 =?us-ascii?Q?t7ZtPeu3ooFSZvxez1YBP3YuvrF+QIG97jfvxrianD0TXXBNOzdJam0dmjiE?=
 =?us-ascii?Q?aitqbQ2owZBQx7VhNhwhmIeqWr5mDhMxmUvXI7EUm7RkFTuHHbP1ADQU7BN0?=
 =?us-ascii?Q?YKV9+nQTbi5tj/0ngWyPbpBpRy3G+50nRiau4+8k35lQ+m9AFV/80+NSAmmE?=
 =?us-ascii?Q?15SZqRgh2hqI5ccshPolmjkTYCOMJtay9CcHRVgJ9DrTc+ov1tFKrWX9rzTM?=
 =?us-ascii?Q?HDYSD5XHcJoTsXc44OL+Gp/hwid8py3rveozUEL94sVAF7imxNyLyl8fwhVE?=
 =?us-ascii?Q?QMJ4di5wSYZ+yWsTA9dsoB/v+P5nUcr+bHFbgl6XuzuLXi4s3qzd7YdhVQ2p?=
 =?us-ascii?Q?u+IMeyQu43K7vXM3Ywuqln7InoAJwtY+urDF1ACedhzMGG10z/9Q9IbDrjD/?=
 =?us-ascii?Q?Zi1imMl1BqNjsw04qFYgfNUng7ZxFGkh88pD0x49bIJvXNk9s6ODBPjMIG2g?=
 =?us-ascii?Q?Mmwcrz4UjNjY0DdvE3NjU08x3tzurUNrnpaSMo4+2p6obO9NtJLg326nFLUF?=
 =?us-ascii?Q?Nxy4G0x77dAWYGsdbM2t43AA8xq1rLBN0CJ3KhMj5X+DuLdUQMxEwrzk6+T2?=
 =?us-ascii?Q?I4d/U0BYLMzetCYhvigLZyyTjcDqwvhJRIzU/547m7IIUcN+VAxDdB0v41uy?=
 =?us-ascii?Q?0pCfcKsYM9vYT9ZPhJ5TbOIT6Qdh/HP3rCYWtspgFnqO+Jzl7WvB2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XwpjlwUe/gaUoc0TS17Co42GdS2nK2w319jlrq/Ybf0H6N4la4U6javahobX?=
 =?us-ascii?Q?TFFJqYnVxARFwZEAOPhAdeCVPSu5t8WvawrdInCcl8nyJV4B82nsgK0MJTXp?=
 =?us-ascii?Q?gbB9AKuiBdUMMnsup2iufxxq5d6Jp8NCpBlbBA3VkjQWFY+NW9vHkHgfEa1/?=
 =?us-ascii?Q?vJGw9jExfO4V8mb5xSGDddb5o5oLj4DcLQUXk5cUmP6jUImHh4qp2iDJe36G?=
 =?us-ascii?Q?AV/R+0YaItb9kjjNpWMz44L1xX9/ZuAajgPz7O8eyKJPeJFS/LmiNDmt5Os/?=
 =?us-ascii?Q?Ox/EbctMNvlQIAug7W7Mn/kZiAZa8wE3jjsIdAqQEyYZsEcRHGL6ZtHSOn8E?=
 =?us-ascii?Q?hKc9PkFxA8XUn3uJJoT8mFdVh7R6nkvr8VZK79Lf0b6uIM8WS7Ah0SiuYYE5?=
 =?us-ascii?Q?EshSp3EpPoq5mBP+zO7XyxrzTLRY3bb+HMhrTQHoTzP/FRFmuR1V0Q8koe+G?=
 =?us-ascii?Q?qa9pi0VDahWfdXKhl1x4f755xPqaBPc1lkDA2o+kCvp9yTv0Ft9qZrjSdeHG?=
 =?us-ascii?Q?nZN3M0du1m6I8C/vZ8V3jXCBVyYZmbAZsMqKWJuOp0YiPTkQzI0H87ZWp78R?=
 =?us-ascii?Q?sCJC7dyIYOrrGBmIt/9bC8AXLyuwb4c6xTpXKG8OqAiU0ckUr9cDG4KtptFv?=
 =?us-ascii?Q?f03UzSwNILXKuhMcDCdp1VUddhhgBlaNkq2PXQCxxEPKh0htquY6NjY7I2nI?=
 =?us-ascii?Q?iVLiwCTTkuVhEeBvYayR0bLVKcgD7sv+j6kp/AM2b7GC3Ef17HAOEHHX/IY6?=
 =?us-ascii?Q?t8lPJWqDE/W5WfzHQLAhLoexV1Cwmiruq2eRmSaYPDx3hJogmrRqxQ/ijG0o?=
 =?us-ascii?Q?YTOSRm5ZCpUjBIuhYIrOmCOSDEsz/OhaHToBE6+3UR1D5nJAP/z1JExoFmyL?=
 =?us-ascii?Q?V8IER1AGkaVHgdz7fvHYx6DfYPuED+KYTntkB8aQRp6lDEXFiU3f0sA8doxC?=
 =?us-ascii?Q?+dA9IFbyV4qhfnlqkBWiXqKK77AKDyWDOceaJjZ4N/E2rU/DRbCITMamh5Nm?=
 =?us-ascii?Q?4MXqI/cM5FXV13KfINbMTnYZl6gGlLgWlDObpvQZTh/d8nvzSDT2wyCgvm8A?=
 =?us-ascii?Q?sZo0Yyso7yJvltUku6h/uScVTw1J5R+LOMwHjAVMdd6irCLXbubUV91BDCA4?=
 =?us-ascii?Q?IamkHS0iqGf8gO26Uqf+hxsvm53ygMOv/K9HIt6bkDxbzcXqZ95twV/BgT7e?=
 =?us-ascii?Q?AKzBewRBnSQvDlVMrFj8S3xaa2nwY2Dul4Gl2+R96+dNMJynZjASXClaHZr7?=
 =?us-ascii?Q?7JpLNJHxKU4VkBFwCc0k8czY5G9iY93WC7Ihbn4mhvupm2z9nhtLjzwdFZJH?=
 =?us-ascii?Q?1+GaPIJnc/kURa2b/BJC613ii4oArQNLAbVeffn4Gw14bqL762N0zDKR2nup?=
 =?us-ascii?Q?089KJuA2cUf0kBRiS+ZB/OtKlw6zrhZHKEglgYUU4Wfq+Ar3zyAXVR5ED05P?=
 =?us-ascii?Q?s6vqxePyy2mQR8i4eYMoFgP+d9LcocfVarHJkrDGaZVHMYzaBxHe8FCw5EkS?=
 =?us-ascii?Q?/qm3kHbiz6hzUFXnwiVMQ6cqrxKi4l01/4XRV8sgobsUn0ubIVP8dLzobXxW?=
 =?us-ascii?Q?xr1Mx6cf+mcL2e5bdTuzdsll8KKNUTze11+BummB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02546a40-03e7-48fa-e1ff-08ddc547f5c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:38:21.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBeUf3lV5HL3psW+zVxIW5vpbahGriuUYDj4nNK8fC/DvUxdFIOJK6W+Ivn5TWxP1slwOnF0xPPijyKTWPdb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7250
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

On Thu, Jul 17, 2025 at 03:23:38PM +0300, Laurentiu Palcu wrote:
> Hi Frank,
>
> On Wed, Jul 16, 2025 at 02:29:01PM -0400, Frank Li wrote:
> > On Wed, Jul 16, 2025 at 11:15:06AM +0300, Laurentiu Palcu wrote:
> > > If runtime PM is used for the clock providers and they're part of a
> > > power domain, then the power domain supply will be cut off when runtime
> > > suspended. That means all BLK CTL registers belonging to that power
> > > domain will be reset. Save the registers, then, before entering suspend
> > > and restore them in resume.
> > >
> > > Also, fix the suspend/resume routines and make sure we disable/enable
> > > the clock correctly.
> > >
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-imx95-blk-ctl.c | 25 +++++++++++++------------
> > >  1 file changed, 13 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > > index c72debaf3a60b..3f6bcc33bbe99 100644
> > > --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > > +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > > @@ -453,7 +453,9 @@ static int imx95_bc_runtime_suspend(struct device *dev)
> > >  {
> > >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > >
> > > +	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
> > >  	clk_disable_unprepare(bc->clk_apb);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -461,7 +463,10 @@ static int imx95_bc_runtime_resume(struct device *dev)
> > >  {
> > >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > >
> > > -	return clk_prepare_enable(bc->clk_apb);
> > > +	clk_prepare_enable(bc->clk_apb);
> >
> > Need check clk_prepare_enable()'s return value!
> >
> > > +	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
> > > +
> > > +	return 0;
> > >  }
> > >  #endif
> > >
> > > @@ -469,17 +474,12 @@ static int imx95_bc_runtime_resume(struct device *dev)
> > >  static int imx95_bc_suspend(struct device *dev)
> > >  {
> > >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > > -	int ret;
> > >
> > > -	if (bc->pdata->rpm_enabled) {
> > > -		ret = pm_runtime_get_sync(bc->dev);
> > > -		if (ret < 0) {
> > > -			pm_runtime_put_noidle(bc->dev);
> > > -			return ret;
> > > -		}
> > > -	}
> > > +	if (pm_runtime_suspended(dev))
> > > +		return 0;
> > >
> > >  	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
> > > +	clk_disable_unprepare(bc->clk_apb);
> > >
> > >  	return 0;
> > >  }
> > > @@ -488,10 +488,11 @@ static int imx95_bc_resume(struct device *dev)
> > >  {
> > >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > >
> > > -	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
> > > +	if (pm_runtime_suspended(dev))
> > > +		return 0;
> > >
> > > -	if (bc->pdata->rpm_enabled)
> > > -		pm_runtime_put(bc->dev);
> > > +	clk_prepare_enable(bc->clk_apb);
> > > +	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
> > >
> > >  	return 0;
> > >  }
> >
> > Look like needn't imx95_bc_resume() and imx95_bc_suspend()
> >
> > DEFINE_RUNTIME_DEV_PM_OPS() will use pm_runtime_force_suspend(), which
> > do similar things with above logic.
>
> As I said for v1, we cannot use DEFINE_RUNTIME_DEV_PM_OPS(). This driver
> is used for various clock providers and RPM can be disabled for some of
> them (see rpm_enabled flag in platform data). When RPM is disabled and
> DEFINE_RUNTIME_DEV_PM_OPS() is used, pm_runtime_force_suspend() is
> called, as you pointed out, and suspend() is never called.

Sorry, I missed your message at v1. do you know which flag impact this?

Frank

>
> Thanks,
> Laurentiu
>
> >
> > Frank
> >
> >
> > > --
> > > 2.34.1
> > >
