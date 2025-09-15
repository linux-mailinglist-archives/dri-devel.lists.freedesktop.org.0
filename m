Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64988B56EDC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 05:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46C410E29B;
	Mon, 15 Sep 2025 03:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kmrrAcC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013012.outbound.protection.outlook.com
 [40.107.162.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5031010E29B;
 Mon, 15 Sep 2025 03:36:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFVU1Q9DZhB9azOpyp5ylsb3OZ5a9Fdp+rQZa7avniw3wC1kIK1bk7bI7syaDHkz3N3fNZjmP3lWJxiD9ZL3MsbhFJh5pVm3PS2UOLj2fmjiGbKJ9lCEuihhDiIVyK45Czg/f1W9v6C0Ztf8xOXlWqMXdDNz5HviYzKN4trMUYQ5xwimingW/l5ZAS/ngxR3vhZzxnyfeRL9D/k3HUHBdCoCIUsOH+1naCHXo6HTCk4a7+PcC3QLkzY+eQ6ZS6vr071w9yR5R44aSDdrBtS2q7KqOK6g+oXrRmfLAZGjyaus2q8Nzrp44Agk1DjydJCoQjDHuCWcliD6mu7dpFGi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tUnDiJ2on+MgKl5OlwpuM6z2uOqyynvbdhenF21HR8=;
 b=nyfPxhx+3BTLqO1IFQrK+AA3qmccWehJJK1hy3F6J9di+lM30lsf0gOoXHraEu+OD+KcDI7KZ52yaj2k7vrhG/yUBej9yWLpvvYmoRw6aOZo9pCOhAUTHH59QH51ZQXqJX0fNb/IdqJ4Z0g659V2PC8Bwf7+Xo0xSKTOePXJy1CnI/U3JyUbuGtYvmv0x6Bum1M/ZGqRRzd8RnPHAmU4/cC8V7ZbB5JqmFvfTC11o7wA+yTrL/UDFifbreOYavhX6d3h62RpPDozvmW6dFZYBw/95GtFyEqWFs+WmJzTE6XcDxv9z/YekF7joevEzi/iYjL81kUy1rf/XItsBjTxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tUnDiJ2on+MgKl5OlwpuM6z2uOqyynvbdhenF21HR8=;
 b=kmrrAcC35gKUTaL06Bskwm4m1f9JKVsEo/e0S1ceJc7OH69nE60I1Gs/K+ObyaDa3XqVm8FZQ3AYsLn/yxgwwZGkjzdDqBukDMOBAtKA/IPSsjv7YHcUypnZzARImYLhOsYUKQ9/NVF0jPJXGn3l+468/Rn2vc9WNnzthARa5I9C9JYIUUHeBnvNrJrmUZos1FDrOov/VJew9ZY7mALn4sgElMCLQf+8pzatgyNE2CN70Dap8E2cyeV84leAWfRR9RWmA4meLTgv4gqmCNB96x7b6G9NsOw8lUinPDal7XpA12wxPIT/t17v1lYgXD2b87sUtmlyCA6zLX1XQrU11Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 03:36:10 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 03:36:10 +0000
Date: Mon, 15 Sep 2025 12:47:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate()
 to determine_rate()
Message-ID: <20250915044736.GC1331@nxa18884-linux.ap.freescale.net>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ba0994-f83a-4855-b49c-08ddf4090289
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mcKSCJO8VA5ZTN/c7Ur99acuppU0PDXmUk/yCqpsCuUVIAKebihy+eErfd+2?=
 =?us-ascii?Q?Z6TTMq421Psv50jS4YpuSp+FuUZtYQcRKWQWT8Y7xKQdubL3Lpt78KC9gt5c?=
 =?us-ascii?Q?oxDVlKo3Hxvy5EfLFH/shZp6JgX3iNisdgyjDqzMoWZjmEVv4gWhRsgwRF49?=
 =?us-ascii?Q?4hxyQaKIYoWAcYfsZhxTrwKeHEWTkQcxpUKOkGcU+2WJaeDRwnhs83ZRYLXF?=
 =?us-ascii?Q?Q1KiU1S11XySCj9gkHevUdS4+pmvoq37bowSjNoPSO7i/rlTDhv0hYgEM6bS?=
 =?us-ascii?Q?ND/S1EN2h2XB1/zAVZsLe0loNeaW/bCMBklxhM5XMJwnMTsJHRNMAkGkw10q?=
 =?us-ascii?Q?4/tmFH7ndwt6/aFJC6I0TCZLgi20TCJXOj0k5dOqKEyT6F2NRQoX0q25Fg9O?=
 =?us-ascii?Q?WkANbJZPv9DSip2MiwUOFWFY1wjPyWZHMRN3/VRgYYyn5D6d/AD20RhH0yC8?=
 =?us-ascii?Q?Ux00QH+2W19GQg7U9CWqh3UiK7859NJbDQ38NuD93Ts6JiMDALaT1N0WrUvl?=
 =?us-ascii?Q?sLGt0EQN/604qh7f+HF8IWKr46pvgL+vsfGIDXsvwrUpF+xTCGtAihu+czgd?=
 =?us-ascii?Q?7kJqRg5u6J6Yu3H8frz7T8ONrNtnbrUqlx9RJ6b1hqqyas/rznApFbB/3qfS?=
 =?us-ascii?Q?HBEnCzHFNqJDkDw3ZNUmgOx3Vveuri2kgp71vLvsvgfh9RGnykgMrgCZszny?=
 =?us-ascii?Q?hpE2PwlhAqK0WpNvWiIPXoRIfPvD1Db6T+yDZ2PsYkhZw/5JCllq3pjNauLA?=
 =?us-ascii?Q?fM0FiB2ShVIWg32an9aUTtErBZK1rTggjb7GH7+Q6wj4xqjdH+0WV1VtkLi0?=
 =?us-ascii?Q?Ytii5N0J2ZESKVpWsE6ulPl12EuWMjU5b+az6CGYIM82ZgD9L4tAWA4vuHM0?=
 =?us-ascii?Q?RpUMBGUUc8a4PGBFGBSLyvqvmPma5Ut4eElLJKkP6bjMU8pD0NKUS4rHOAMv?=
 =?us-ascii?Q?T9peiN8Tv50HpJFVwscvZNW5PaUEwq8OB8mjJqmq3kC4CJdSBonrDRfPlI60?=
 =?us-ascii?Q?8vSBa3vSiZVfApQcUET7J+92SLzjq7d5cmsCoKpp1YgD4Jv50C3kfySXshp1?=
 =?us-ascii?Q?BjryyTaFfufTFsB2VLtWmsaH2xedCrnGAd8Bd6RDWEYnpHqEUCyCAaQ0dxsQ?=
 =?us-ascii?Q?vmoHDB0pDcbj2u8HEdxoe9HGpnU0Ew5zIO2gBJlx54orfWYKr4K/8WRT99p3?=
 =?us-ascii?Q?nBt5walLlk5J0mS5+FcXBSN6uT7MKjREeZhTxrCFVQRafABFQLJT8IT3rs4f?=
 =?us-ascii?Q?hYeb/E+hKXB6oCvt8BBjThN9IsDUD/abrb7sj+3hWJZeP2A/PqMn9OURnDL5?=
 =?us-ascii?Q?fm1Zbfx+EJmOWIFsl2I18Ri/Ck0sloXowkt2toIYkg1NnXESuYtIzOw0io3k?=
 =?us-ascii?Q?bjEWSe/aJOVTDD3KqvuKGkOTBKbmILhs6bZEv4JC+JzEQhZlFelWsQ6Nr+22?=
 =?us-ascii?Q?5DJstupWMVqHRkLtQnDjnKZQogr+vDuUu6ogffFfDYS9D/Wx7Qi+Rg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB8461.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IdD2nPTq5Jx560ogxeGDX6TPBBIUqEFbM6mMcIKT6NFAV2gb/7Qx8SXcKsMZ?=
 =?us-ascii?Q?dK7AERnkRPaGsU5YQmjXIIratG7OTqzDIZATt/G1mfqhpRlvoPHVfJ8gXysc?=
 =?us-ascii?Q?jRc5tJWafPBUd3sVx8pKGLOqV/pmk6HJ/mzY0MBmrXMa02K+JlGEwZ3aoIrD?=
 =?us-ascii?Q?qj3F++7kCPIqe1D6A7aIur7PYtzPCeppugd89WTjOAaRXFd4vnx3KLIJ+lEa?=
 =?us-ascii?Q?r9xo7FozqWWiOMk/U7Vp9lqEutuCz8iUjha5Ukri2W/EIV2ZDyQWvwsq289j?=
 =?us-ascii?Q?ES3e5HV6uREdiwp1dejtBRM6v7KM4Tc8yvpzxBHkQeNZqiWeuba/Y/Mh8heb?=
 =?us-ascii?Q?v0Ld2HAA6FkjZQXGaw5MaA02I6pPcCmUSQ3S7ZYEZ80Lt4fDJWQgudE0qpZl?=
 =?us-ascii?Q?hlztYJnOXskYGtAJUPc9fkyzYTLfsZDL9KHTaMzRPhz7lImj+vwYXM2kfsjo?=
 =?us-ascii?Q?E/+2Q1l5MmpVz7bkog+AcRwgdMKuit1UJYUmNgQDCPKCcledFGBMI2F/2F6D?=
 =?us-ascii?Q?EEo7FzLEQUW1l9VuQ0B/9x158Q6adk9WfzfyoB0vO2YNbu6cqZjI9UcxKppk?=
 =?us-ascii?Q?maxHcOZ5miLEyDN55Q75RZDgGzVCa2KFNsbQCeHEMLfInettltDL5HakzDNe?=
 =?us-ascii?Q?+sZJpqHgsIGJo3Ral91nu1kg0aid9sgAeF8RGEjH5jbIMSMP0MsxWjW4R4PA?=
 =?us-ascii?Q?WquxC64SsSCGnvSABe+w29tIrxdYeUA6CX4MXlwYpNkqD+NzdWL0UdbpMSJs?=
 =?us-ascii?Q?xzGUyJMNAWVy7OtpPKTn6n/hw6GwB3Rnf2f5W+pYsAzdBcZjL7+AC1YTjaLF?=
 =?us-ascii?Q?UlpMg1Jxy32lvbWm2I602z1cnPwnkkoqSmyd68jfWIzNqw7+ULFQQlLykuAr?=
 =?us-ascii?Q?q0AxL4svn3pwYQ+TXzM8Z1/2incSfDhZ1/GUO1pf/ocOwjlsRIzqFa5nXwEo?=
 =?us-ascii?Q?I3oz/mp7ej2NgTUawwtoCZnNQJCRKe/iFx2R5svwT4MxQmaMbrE/ZTZD+DqT?=
 =?us-ascii?Q?Evzc8htt69I2KV0kxA6iHE620u/2opqK1hl5XTIdW8a0EQjdZ/QM/KYdYaux?=
 =?us-ascii?Q?wcx20h5ubOzPzKprjvO1e6W5JfxxNsc18MzbTYsOWUO/L6fCjEIIKOltpgfo?=
 =?us-ascii?Q?iVICCljg+iOTXio0YiqCQ+lhV+7hEJGicK+W4gDv6mdtV7K3JRYWrCtJ9y+x?=
 =?us-ascii?Q?AcVkRDyprTa7HZrLaa1OlfzaZTB+srqUT1m2AGGZl7vMSbwABQdz2My7Lft6?=
 =?us-ascii?Q?YXlHGq5HjdHg4pCBz3USW1Ix1NpkaI+1PpehPQ0ORWPbHae728+up7NpNWRh?=
 =?us-ascii?Q?9lHeAHODy/fPiUPdkT3Z8ZDhVCKa/lbijFTeCWoMafD7+BH+GJ3fnd4hHOia?=
 =?us-ascii?Q?DcURbpcfbaGOOcWaSVn7WLmTadvQpj9Zq1f2Il7L+x61TMEG58yTH0cxgXpu?=
 =?us-ascii?Q?qkPP8Xl22921B2MUGCpGJu6a3fm3Z3Q34TcC0cTEKs5vla4AcG5980D2nGAp?=
 =?us-ascii?Q?GBnttE62sz4J4glXYoMltGftLyDwQNXflcKSr1cqdb3AX3O+v649/XsnMtA9?=
 =?us-ascii?Q?QOqA9pMCGE8gawxSAmboUiyssEvm+RkmOtel9vUU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ba0994-f83a-4855-b49c-08ddf4090289
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 03:36:10.3133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpY+gGP4Q7Y3zMp7KGdggBEaq/ll2GT5ShHNSt//AaUFqQpWq1AajHsG0A/Tl7mXJbOIfTWYmQ9ZJnGeE3LpGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
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

On Mon, Aug 11, 2025 at 06:56:05AM -0400, Brian Masney wrote:
>The round_rate() clk ops is deprecated, so migrate this driver from
>round_rate() to determine_rate() using the Coccinelle semantic patch
>on the cover letter of this series.
>
>Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
