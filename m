Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BEB05987
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EF010E0C5;
	Tue, 15 Jul 2025 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J9natSFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012041.outbound.protection.outlook.com [52.101.71.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB410E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwMJBQSFnCh/7q+J6e8vJBq3zSg2OAg4ud1u8NK9rAN6HzXJ8ijfAwx7siHN/Qc8aDDTvhBsHTyM7rE347wSebJIFt5S0o9aRc/Uk3/hLX/cm7TYK3+3wNbm3LBMNLCcFidzeRcCrkjeUiFOJPBeXg+upTOqgGdRr6lMYLNdFtXhxgx8FJMlS6QTfZzWlaV2pAOIgAYueLyxF7ezhNYphCzoPD905VDA/3SL+bc68ohS6swLuKtr6sOx2VBRpZXSpw6M3SCtDC69NuSTEEPFeIiSedYN6OSfezBR8LD6WIKlmZF9/3kR8OhQC0FVlo6o/N5lCN+2OWoB2xmPJax3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAHN3EcAWjm97f5hJ2pnTmZHL11Upc31bl/dAVYvIFw=;
 b=J9AQxIhvnF3vTZKKz2doZ7ntRhCg+Ql4tY8K+J5nFZNG0TH9XDxrwmNkVe1S6VqTKT2YJyuK6k4ZIJNKkIdn34ATG/hU5PGWqZFCbeLRXSXGesPQMtiiaQk6e83SN8QsNT+iX26kAcDftrqTzINx9DE/C1k9gx0qUbRGVA782lNG5G/l9P5D5NZqzsSdqjs5qZ/wicZN2qCwSERyHV7LVlLLgI+SDBpXvuayd4F5bW4urUi3G6g3YQrPHU622cD9MU+EF+Qb2ZE48nKaPevkQ15WbLPt3+d2356uVQF3Hj584dMdvqBpR+OM1qZsGvjaotBt/udyrLauNnf2cCEElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAHN3EcAWjm97f5hJ2pnTmZHL11Upc31bl/dAVYvIFw=;
 b=J9natSFjtlRUhGajgxOixr50AdH7QvC0zERBXooBB0RYV85pKZ0AlJOCTIrvNi/QW27bM1yoyt+srjDE8N3F9irrE3llMcT3zO2JuD+5UsEv1vLh88XbhLVtV4VSFHijKDMr15bmisC1Ps1hnCjYpEZfQiS9mZy3e8Qhlp1dJmp18EPRqzjjfVsO4ggdvRh3lQRLa+q1zsqNMd7WOxSyEgt7hy5GF9lK04h26wmyJ3jBm+4KReefAPzu7DO3E8VlsJYGDvc6haDgXIZFOF/BzBHWX4Uix9o/j2lve9hcwVdRBe8S7FCtI1sl0ZzKkbbpyEhTOxQOBdTQlDEtBtlqvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:04:01 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 12:04:01 +0000
Date: Tue, 15 Jul 2025 15:03:57 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
 Abel Vesa <abel.vesa@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] clk: imx95-blk-ctl: Cache registers when RPM
 routines are called
Message-ID: <uqkh54tsbv7pyfgfwm6i22xsnevzokyrv253bju5hbhypbckfl@qy7aqlaylp3w>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-2-laurentiu.palcu@oss.nxp.com>
 <aHCNCokZxIRNPgT6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHCNCokZxIRNPgT6@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::16) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS4PR04MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: f6483eb4-297b-4af7-a868-08ddc397afbb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yYk/a5gm7pem2j+drZ3JtnPgl5rL4rVUZUXdK8v/SuvGoMmoyB73aNqINAWw?=
 =?us-ascii?Q?24qFhSmI2U8bPMvzCkjLZ5/ZikVWcm189DY7D/R1JrfvWZkVPslWz2ZEJwEf?=
 =?us-ascii?Q?99fzI9I9wPv/3H5PLuIAXcrQ6G9+szxP0M+Bk/SB2eJORwnEonBr7UzrAghS?=
 =?us-ascii?Q?Z1F0Jp6v6X5e5vu4HRnD5MSdXg3a+qNIolhP857PqCiR6sTVgkuzEJxcPCsy?=
 =?us-ascii?Q?1VXTTczK0rkWsC3us7gxE3dlY7nHW+gSD8eWmQ0XZJKSG9JpQ04IMuAqV3Kq?=
 =?us-ascii?Q?5WMWI98CZ8hJpFm8rflACdV8wTfT0X+CS5LWykTVhBvpzjg0W0xFhn4Gl0/+?=
 =?us-ascii?Q?FsgNyLhbSOIWkYP3j89vUWXCOTCTSfKvmlRvhqKbJYSv0Hstt1l4pq0M1M1N?=
 =?us-ascii?Q?BRpvRnuM/4nzBeI3TgEhNZUGczcbRvE1/pgA/yWVUevGxwE2kF4WzDHGr/FZ?=
 =?us-ascii?Q?LY1YJu14rc/85HY9I6zgGNRc0t0yDSfVn7zLM9LaoE+7sKMW9zxUstqLyBfR?=
 =?us-ascii?Q?eq77aA/QVavNEFxn+b/PxomlDfVxhksuh8LicgzpjpDLIDUmPDq9zi+h0fkl?=
 =?us-ascii?Q?5ZpdYMPfO8bafMR+bROw/jp1FNSUBpb0Zp85KJX1oai+y9Mwz9HRfcsDq/0D?=
 =?us-ascii?Q?5KHBaCyk/olnYFjgVJ/rZFRCMaiGvbVlXz6wGDjDsjVSwrsWM1iVt6UEYDD1?=
 =?us-ascii?Q?fhkmV9bVWLPpoFIupdxmWDylfhibRNuDL/3I1tG2WHI40MA+GUMVLRZ535Qc?=
 =?us-ascii?Q?DAFqgP9xYqvb5dTCC8vuZV4cRSJwy3R/b8gncgUwf4LO/Qp4QwqI/JZpV7lk?=
 =?us-ascii?Q?4SUn+l1w2mUOlS0b9vf2jW8LArwg6JFUM4isbwipxgGO8pGnz4XLwZ9oDvz2?=
 =?us-ascii?Q?sCjKwqlK9U49CLYCVnMKejUxTOsT3nSm9y7DAsCvcZlhLxRi1gw8l1KCAWYr?=
 =?us-ascii?Q?h9jyq/3ZNbrSAHb6/gUz26j+y0282WiwVwQWlZQbz9J0vGlDPUMHSbghJCZy?=
 =?us-ascii?Q?0sCUu5EWn8hixzKXbHaEHrJvPl/QOsjTEaDlVGFOsH009/UgDdmWMpk058MW?=
 =?us-ascii?Q?YI0FaT8P8eOZZ1wL4IL33IO2t8msqYMAlZbNhdsH+zVtvhlv01ULSJyWmA22?=
 =?us-ascii?Q?xeFL1hldB6+YPUjAVvdl68QVtUcdh9Ks8Adt3MP2Z8TheAiB6267BIVFP2UX?=
 =?us-ascii?Q?WfMzmUkzkJ9skTlWKcls/jXLBpy+dXYYR9VOAnHgot0F/GfbccW+y7OujfNX?=
 =?us-ascii?Q?mX5b4KLCXVIO5BkmC5C2HLQ28C7Gv7anr+T3yOVkmkisfCGAkwkTo4AAoh1t?=
 =?us-ascii?Q?uzZ6RtIyEJrryHAmpvYHdU6tW2StmYRvjB5NIC8c3BPnNifdE5akhYoA6Nto?=
 =?us-ascii?Q?k3Sy0YxuCVHX90D1x5L2PIuEe7JwJgW45P6X3k+qSbMc/3cr2kpq1ij2pe3T?=
 =?us-ascii?Q?2g5iRLCrUgY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RnIZTbcG8S4keFw0yEdDuHzFwgCivZtCeNswD8Od2Ms4qxRpscXyTKyJG2n1?=
 =?us-ascii?Q?YioOwVyP/tJa9nYMZWgzZXlRxyf8m90DdAJxhQ/YRl1pwlZgE+zKUZpSCOCT?=
 =?us-ascii?Q?T+w4khGaAq/8SG+KeBd/t+qFbe7OXUJWQNOvUA0BK8b0/Trrbc6QX05KtlJo?=
 =?us-ascii?Q?KlalH9iJrYgSLjIIDD+4E0iP8pzXtDj7Xglp0jLeEuSof6ph1wJUPyRvH1TX?=
 =?us-ascii?Q?jPLlM4+MtXH848xDrS92kUlec8XKP5k30Ko0qq+dHt7xfccccl46NaOW94xJ?=
 =?us-ascii?Q?f5v4PO6geTV0MuzbR8qe9utGYcUMdz5TCLMQECcVVGsuw5TvspzIFF3bW1Zu?=
 =?us-ascii?Q?eEzodU6cGEDf/ZIdQrw9mOrBp0YxlT6m5j0bjLXQtyAuQhzsePc641X+zG8B?=
 =?us-ascii?Q?vnMFrhdCC+ToYvV2l+YeZVkzQqAS2o721Ks4ewMOQS2Esn9ObmdK5sRZNoYW?=
 =?us-ascii?Q?/3AbY7pUzuDBaoyqoB48SZa1yOeJHurynCoZExdkivup8ZYEWEG5uxxGtlPB?=
 =?us-ascii?Q?Tu9oklbXWTUgG82CVpNODHEZ3xZvtYMWC0vY3/9/CK4BH2j1RxbyL6pgoJlu?=
 =?us-ascii?Q?zNg5pXH9a7+Ww4d05R4ylaowJ6zRy9rSLfgSn7FlCveTaFXB+ku/pyr6Cp/L?=
 =?us-ascii?Q?lXg8WJLkJIkaTzd56eGTAV3iYQ3lAZIb0hdr9cl8TIAQK5y1w13W6v3y9pY8?=
 =?us-ascii?Q?FAK8peYpniGXsskGD0wrTRQvkXwTk0wzfw5TJuuMLzKw5ClFBeyZqImgpxTD?=
 =?us-ascii?Q?FWCo9W7MzpK+Gb8egJMIKB8oxkJ/auHtB6pLEsO4F3TFkZIOGQ4H8ezKxlZi?=
 =?us-ascii?Q?lx//hQr4I3IDbmHT47JNjpV5L52NR0JdoXnV3Stq7Xr0b4fErQin1SNkuupn?=
 =?us-ascii?Q?6k7MGo9kOUoUuotvkXwnrQ3RQ94VUad422NM62GfGa/OcRBBTb+8g4wPmY62?=
 =?us-ascii?Q?rpZz5d9bCryv50xIJRP+KsdYviuKZO6AMX5DvBQFqWODLuBds2LWy0ETfqfr?=
 =?us-ascii?Q?vYuCbDl3rtOCk2X5PZ9C4MLkejx1ElG/oOCbtwwE/vpjdMMyskX3XPy1dMo1?=
 =?us-ascii?Q?2aM4Bf4qvZu9fs+MOVIMGZ/svVFhO9GhWIol8aoE4jn0mZJN07T1RXLVEgja?=
 =?us-ascii?Q?gvS4I8SZoQSdUow4mBq0juhnwv2g4WsAAPFSyrnaZ3JaGGSvQl5igfoiukGU?=
 =?us-ascii?Q?1svh4RiKqNH10Q1qkbculk/+MDQToohid/gX7RKBZSTr3LWshQfxxlPtV4g0?=
 =?us-ascii?Q?iTbUTvGs6jlbcfGQkHC9LWsyRkabWlj7x9FbNGBw5iNmvDY9UXZxKiAM5ICQ?=
 =?us-ascii?Q?bXOaeYx4TDWM8p8blWJDeuGZE5BQDOvTjMNDDErGs6Lj1s8dMqF0VAOKfK8I?=
 =?us-ascii?Q?9GEPT4oJ6w97m6z6VfTE4/PIQehAW5HJPhvY9++qOLCMhcGSbxzeI/8VS7Oh?=
 =?us-ascii?Q?sjxspUnmV64HZ0tqFT/mo7QqWyfJvRyxr3xsbDRm08ZXRXaYSXzbGS0YhWf4?=
 =?us-ascii?Q?9yiviG6TdtaAnO28rWl8ROuiKJH7XqsS9vVRkYJeXUn+Wh7rdqrBu1caUocb?=
 =?us-ascii?Q?PuEPsessFhOdEdtf3qctiJaxr8tfnvA0noMPrABR75F/D7mY0nSxEpumuwin?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6483eb4-297b-4af7-a868-08ddc397afbb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:04:01.6741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0FOkOI7IdTTSrZ20W7XlJYehWbnTAz1Bn505j88t50o6q2e1eMykuoj1LzUOnTh44hXldZafsvipLvHoDWRXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267
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

Hi Frank,

On Fri, Jul 11, 2025 at 12:03:22AM -0400, Frank Li wrote:
> Subject:
> save and store registers at suspend()/resume() function
> 
> On Wed, Jul 09, 2025 at 03:23:20PM +0300, Laurentiu Palcu wrote:
> > If runtime PM is used for the clock providers and they're part of a
> > power domain, then the power domain supply will be cut off when runtime
> > suspended. That means all BLK CTL registers belonging to that power
> > domain will be reset. Hence, the clock settings will revert to default
> > values messing up the consumer clock settings.
> 
> Needn't "hence ..."
> 
> Save/restore register value at suspend/resume functions to fix this problem.
> 
> >
> > Also, fix the suspend/resume routines as well, as the clock was left ON
> > when going to suspend.
> 
> Do you means fix the problem clock left ON after suspend?
> 
> Pomain cut off, why clock can left on?

I'm referring to the BLK_CTL clock supplier here. We need to call
clk_disable_unprepare() in suspend() too.

> 
> >
> > Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx95-blk-ctl.c | 55 ++++++++++++++++++-----------
> >  1 file changed, 34 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > index 7e88877a62451..7f9bbca517284 100644
> > --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > @@ -448,12 +448,36 @@ static int imx95_bc_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >
> > +static void __maybe_unused imx95_bc_save_reg(struct imx95_blk_ctl *bc)
> > +{
> > +	const struct imx95_blk_ctl_dev_data *bc_data;
> > +
> > +	bc_data = of_device_get_match_data(bc->dev);
> > +	if (!bc_data)
> > +		return;
> > +
> > +	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> > +}
> > +
> > +static void __maybe_unused imx95_bc_restore_reg(struct imx95_blk_ctl *bc)
> > +{
> > +	const struct imx95_blk_ctl_dev_data *bc_data;
> > +
> > +	bc_data = of_device_get_match_data(bc->dev);
> 
> Generally, bc_data should in imx95_blk_ctl_dev_data and set once at probe.
> 
> So imx95_bc_save_reg() and imx95_bc_restore_reg() will be simpfied.

Agree, I'll do this in a separate patch though for easier review.

> 
> > +	if (!bc_data)
> > +		return;
> > +
> > +	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> > +}
> > +
> >  #ifdef CONFIG_PM
> >  static int imx95_bc_runtime_suspend(struct device *dev)
> >  {
> >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> >
> > +	imx95_bc_save_reg(bc);
> 
> this help function just one line. direct use
> 
> writel(bc->clk_reg_restore, bc->base + bc->bc_data->clk_reg_offset);

ok.

> 
> >  	clk_disable_unprepare(bc->clk_apb);
> > +
> >  	return 0;
> >  }
> >
> > @@ -461,7 +485,10 @@ static int imx95_bc_runtime_resume(struct device *dev)
> >  {
> >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> >
> > -	return clk_prepare_enable(bc->clk_apb);
> > +	clk_prepare_enable(bc->clk_apb);
> 
> Need check ret value;
> 
> > +	imx95_bc_restore_reg(bc);
> > +
> > +	return 0;
> >  }
> >  #endif
> >
> > @@ -469,22 +496,12 @@ static int imx95_bc_runtime_resume(struct device *dev)
> >  static int imx95_bc_suspend(struct device *dev)
> >  {
> >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > -	const struct imx95_blk_ctl_dev_data *bc_data;
> > -	int ret;
> >
> > -	bc_data = of_device_get_match_data(dev);
> > -	if (!bc_data)
> > +	if (pm_runtime_suspended(dev))
> >  		return 0;
> >
> > -	if (bc_data->rpm_enabled) {
> > -		ret = pm_runtime_get_sync(bc->dev);
> > -		if (ret < 0) {
> > -			pm_runtime_put_noidle(bc->dev);
> > -			return ret;
> > -		}
> > -	}
> > -
> > -	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> > +	imx95_bc_save_reg(bc);
> > +	clk_disable_unprepare(bc->clk_apb);
> >
> >  	return 0;
> >  }
> > @@ -492,16 +509,12 @@ static int imx95_bc_suspend(struct device *dev)
> >  static int imx95_bc_resume(struct device *dev)
> >  {
> >  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> > -	const struct imx95_blk_ctl_dev_data *bc_data;
> >
> > -	bc_data = of_device_get_match_data(dev);
> > -	if (!bc_data)
> > +	if (pm_runtime_suspended(dev))
> >  		return 0;
> >
> > -	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> > -
> > -	if (bc_data->rpm_enabled)
> > -		pm_runtime_put(bc->dev);
> > +	clk_prepare_enable(bc->clk_apb);
> > +	imx95_bc_restore_reg(bc);
> >
> >  	return 0;
> >  }
> 
> look like imx95_bc_suspend(resume) is simple enough
> 
> Can you use DEFINE_RUNTIME_DEV_PM_OPS?

Not really. Some clocks provided by BLK_CTL use RPM, others don't. If we
use DEFINE_RUNTIME_DEV_PM_OPS, then suspend()/resume() routines will
never be called when rpm_enable is false.

Thanks,
Laurentiu

> 
> Frank
> 
> > --
> > 2.46.1
> >
