Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF797D5AD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B6F10E831;
	Fri, 20 Sep 2024 12:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C+kX8gkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78710E831;
 Fri, 20 Sep 2024 12:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gur9fScdQkklo2boVBEwP2cviNk57QffS7qX4ONTdbgMYKDJ+uTylZvus2bMyQJF1ZSEmjGM1p+9m98+LgQ6Yqa17ITsnmVJWoFkN3CpCvLPQ1NNRp4zZs4sD7t4Koakq+6bbl1yvA/TZTBqSJriBOPG4ZXfOakPce/FqpcsLHa5lVK74uenHwT2V7Z9GxVQU74nG2YNZZMIZTZ+rH+NUOblN2LRLkx1MZ2RJUACwK9HCu8u6IEXL09a3zpODiA5925c6nMyWqWrjuKiZgh2IGo3948//49t3Xmr+6Om113+aUeSOy2XqMB/AjwOghhh4A65TsW949i0IL72QNUuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9Z+rDHx6N9yCeLmyQy3XfEdidLV0VstOIl9qSgxLgA=;
 b=VzqRL3vGXNGFpkWk1mlKJe5IpgNOV7rXPDz/Lpn9U9aDpB9dAdTs+U6OsW3X1K3YMvyYSOakqvBOSXV8tXkOXoOlXCEQm2WtJFPu+OPeA+srz5qUPQ0x25hhd4fq5an/oYYe1z3EtU0RfOx+v139XZo9vokxcadzFf0Pz94Vis4Vo7RU947MxYpfS53AQeeC8xN48UGdTnU3eTa09OZJHPmPqZJRadMXD8HBt0644D4cOT6BqxRR8k4+apLIKsE5QLdRyGD5ZLGOyBMM/8OapCKzmkcH5MTUP4p11IZ7k8JLjkKDkz+GVvyEdIwILsQEmskasHS6VExJ3Wznu2xK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9Z+rDHx6N9yCeLmyQy3XfEdidLV0VstOIl9qSgxLgA=;
 b=C+kX8gkNB+W+yL2w0c4yDSAkyyViDcqAmq2VkRIvqy7EqK5/lhfs+91N/3N3FMVZ3fDLO/pvcIUyIgn1BLXLD7YDWsGZbx9qdosGDZdmkJd9Rskz89+tNlln/klJbs47jivKl0FCXBoaEHscXplfExZYKg9DviW3kN0rAXzCO/76sYEuUIbwCexsn8YZwtPug9uVmtf8QmvdR++nkJ8cDB03em9Psp+S0l2GOBrbqzsUvXHiUzzcUxsAYmBieZMal0qTVUwuclMqzS+B3wJtDYGFHloXBBuRkcIp3MP+Ihr92bI53dB4tyjAZlxmY901lPnxBmHEH8nD/O0+ODduFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 12:45:55 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 12:45:55 +0000
Date: Fri, 20 Sep 2024 15:45:49 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: l.stach@pengutronix.de, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com,
 sean@poorly.run, 
 konradybcio@kernel.org, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
 jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <ln7wex74go42r2ghgt6i523vffc6pbm7zahxbo3c3ajexrdd2j@co7fayiij6sf>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
 <20240912083020.3720233-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912083020.3720233-3-ruanjinjie@huawei.com>
X-ClientProxiedBy: AM0PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:208:be::20) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI1PR04MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: be88436e-ab82-47d3-ceed-08dcd9722ad7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H9qqPhsElweuoJ7tRbAKziMiEdGpa3r/Ht6wRxKn2WjtLwiDnW+s7ywZMRH/?=
 =?us-ascii?Q?2rOD9QaYl9uSzDUGEP5KV9whVyBB+e/wpmdtAHiG8ca7KYbZ9TjhHtG28mve?=
 =?us-ascii?Q?dYABZXpc4IGrt13Z+X9mR6crkjG47QpRgG+ei5awYM1OKNE7ETH9cVRIxwzF?=
 =?us-ascii?Q?i8sVO3WafI0sqJfCl9LzWIYCBlxEK+r6V2In56/RNYWUp37zqAtldjzX/CHq?=
 =?us-ascii?Q?/7QX4JQsIXppjrERvPYplP/A9IXaz9JxVZn/c7jVhP9DVyUNOJ/qq2xX6O/t?=
 =?us-ascii?Q?bHUms7rnsE21A7jMG5RCSxmM9gnCT1WiIzwvNIkwXxXBUw+LnSJMYxG5/Dv9?=
 =?us-ascii?Q?iBKDCzeD1LP/59SZgAubB825dqRo9jley9RPHtFR0pelMLsbca36wPOXDmGt?=
 =?us-ascii?Q?ozGw9avNZFxEXjsvykAKYBqtx+tZNM9o588joMEPjUM2WaXkGp5iSe2akWRk?=
 =?us-ascii?Q?EgpwLy5n5Ps/z/SWZVNa9cHH9Lu+TypYH44eT+Ky5rw+FpKdsOBgKmAI9QvJ?=
 =?us-ascii?Q?f3KX/4TzXKnOKe+yCaglz7ar+ZrzJ10UeQUpHIBf4gZE84bAha1t5kEUYXD4?=
 =?us-ascii?Q?RDrQ9WG/9oWtp9+Df7ndq7kJlrX+7D5woHQMT4i+t7H5jsVmkNbBsIMsjNhA?=
 =?us-ascii?Q?PPFUAIPeRhS85zKraqYg9ILZkDBpzhVFbKHtmjp6C/txUJoa9CqKPGhVKEaQ?=
 =?us-ascii?Q?B57f7mfPgJwLahSc0TpZ3a09KAyH/zF0o3zyMFUQIqSkNqF22MM1bEmNJcVb?=
 =?us-ascii?Q?rbJfZ9HToOI2VIsNAE/TaEO2F17xSIpSDafv0xtleesGyCwpy0maRFk4Oz3u?=
 =?us-ascii?Q?Iwbqk841bQQ7rPhisSIaWQy3F6yYW1nbkBDfuok+S7isHJd2aprujTLwF03Y?=
 =?us-ascii?Q?KK3cDsOJOoiVuISwPONaHq+/Oce5y3jGzYax9a6lVxsDuw+uRXGXCL1zINPb?=
 =?us-ascii?Q?SJDXlPDYpCG794JXDlm4GKI0FHMs7XnhNsn5NBJTR2/My7WVWTQWmRxpTTro?=
 =?us-ascii?Q?qd8prNR45m82FNxlIwNpJnpV4VgPdQP36Aj4WyGREi0TkXEJa7H5/ROtdkPD?=
 =?us-ascii?Q?qDs3rag3pFge31TXd302EqR5JyVIilOKosAmt9xbQAvLx/lFbladjR33eO3i?=
 =?us-ascii?Q?/9VixoEgNjgubjRetVJzaRp6pnk9nSVbiQoczSJJxabjI/QLOUMDaSqoyODx?=
 =?us-ascii?Q?yok/kQQGfH/2tV2ZeadEJjNQROCqwSMCUyO/tT+P7yO8jnDgRODLWpfkCqbd?=
 =?us-ascii?Q?iHKMd20QQtKMGWMxS88GWg3PxtWkge2+HzsH2V9X5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucmsqGJ+zya6O0F6hH22ZP3+E5NeqSWj3a2R7T9yH/b3iP+uUpOYS6ZsYHvc?=
 =?us-ascii?Q?j+tSunewon5V4Lw80QA2D5rtEJzC8kOk1FooDQu2CaQKcjWfbVcdRcH7L+Va?=
 =?us-ascii?Q?uE2j0ePNvtmt6tzWCvr+a6U7nW/ba5Ni/Qx78FuZWsN2WrMyvsZU//Zp8LXx?=
 =?us-ascii?Q?pfq2lSV8Gn7gmgGDiIGHTygHhafXXtwcs5Ow3chRA+CcQmO1EDRsYqjLs8uT?=
 =?us-ascii?Q?IytjejvselgGqoXnoONoWbZfPxULXtSySaR5N2XnKyqsfXy1Erls81RO6Kam?=
 =?us-ascii?Q?eVB7DeTg6Dwe22va2c1DZ3KDhRnLhDx5KIcqI6lcwW/YLdf2oLmSdDAfAZS+?=
 =?us-ascii?Q?Z7wpVOf1QyINOaad8aj/hWI6ssXIDtdb6rHs+SmJ/GvSF9MeGEyLMLG4zc2W?=
 =?us-ascii?Q?N0OvWAs9faMunSmUDGEo3CHeXWLl9spSPeDRh80TERS5GRm+QW02c3CzkLxT?=
 =?us-ascii?Q?fb655LZA13oqnlbeRZ+ELuvxsl/SKV1x5i4hy8eyFooIaMCsumgXSseZ8eHz?=
 =?us-ascii?Q?wm2JDAH4bT6nXGVk6aUAV4pVUsfRiR0BnB2gtGBmQK0MHUADZOioyqlbceVm?=
 =?us-ascii?Q?wUAmULaY+1kYIn+zkRXSTH0RGdNAAZ/4R8cXa+uvWMQ1lg6D17dxi2Q0ICpM?=
 =?us-ascii?Q?ksdsVE4SHK9F9Dp5fEB78DSrLCqbwz3FC/caFpF2mxzOOns9MVOPj/rhDHS5?=
 =?us-ascii?Q?XTRwAXf6RnCALNDjZQR4jmNaf5m6sFy1S1/w7UDkdUF4aEl3tJ7zRoP5M1HV?=
 =?us-ascii?Q?H4nqSSaHzEBKFqOm+6BKi1iWQnj18/FPSFPxE8rxsktNcsU7dRZhJfaBgNEx?=
 =?us-ascii?Q?+7QWH8qEsY0XOqwa4JDKtX8ouw5ycahHXcE2Qvi60hlQG/574l3m/wJfExLg?=
 =?us-ascii?Q?PcNvFUHHfnc40TLPxx3M9xsgib4J0719RVziDq3pxm8//+Fiw3WnMWUya1Js?=
 =?us-ascii?Q?SR/GOb4Z1ZvfXc/6w32GT3KMjdgh9O0cRCzl8woZDE79mMHJ6kY/gZk26kq3?=
 =?us-ascii?Q?8TDl38s609LwelY2z8KYVslHzWCQ41E70RY8NcibiL9zebDqyVJcjivXlgMO?=
 =?us-ascii?Q?FAXMCqYVrSpMPhc0miU/rZeszBq+YSWM+4I17s/MIy1FWdY5FpFIcASDnhMX?=
 =?us-ascii?Q?44XkMCKNAjbuK0F9SrvK5cuZIrOL7fEmZMAZt5UqtMddnAaZXiS3m83pWce7?=
 =?us-ascii?Q?ajBeQq/yAZIy17OH3cVAAo9PsSBBYXtGG3BoIKiEWeq8hDfhlJHOR0hm50di?=
 =?us-ascii?Q?W1W03Ean47VfRtCokihowjX1POqLraNybx0a7M1bY7rQs+GXP+QYF3mi5e/W?=
 =?us-ascii?Q?BI0P2H2UVNmsrGU9TmuswnwEHheprw2dy2S8Xnmp4FPAjaljuAUCccuRlNF1?=
 =?us-ascii?Q?hClwG7UHJW2hoV6PrSbtQ3P6G0V9RNkYml4YJ3s1Wohwl9bR7y+C56nQP/mY?=
 =?us-ascii?Q?gjGwGI6Fldk5JgmBK344cl/vkYDM6rd3BAH8bRM7c8oL6bURfpA56pI22gbb?=
 =?us-ascii?Q?fOdXPN+DMSHU68tiaOMFTBSHAx7IJ/rlyn1QFcOTwlQsRmYn5ujm0h/hsfkK?=
 =?us-ascii?Q?k5zeGQXz6oO7D3et52kCeSMZGDIWu8HBo+Wrzt2nWtoAw2cwc9jaqbe6r89d?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be88436e-ab82-47d3-ceed-08dcd9722ad7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 12:45:54.9419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXs81FriqQxm7DCEJrRS/pXUvqg/zBmgjzqoNTmg0/3OpsCiPRG7nxQ/DGb09y525M+2kJOwbcH789dXLZplnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847
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

On Thu, Sep 12, 2024 at 04:30:17PM +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> v2:
> - Add Reviewed-by.
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dtg.c b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> index 2968f5d5bd41..6bbfd9aa27ac 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> @@ -134,14 +134,12 @@ static int dcss_dtg_irq_config(struct dcss_dtg *dtg,
>  		    dtg->base_reg + DCSS_DTG_INT_MASK);
>  
>  	ret = request_irq(dtg->ctxld_kick_irq, dcss_dtg_irq_handler,
> -			  0, "dcss_ctxld_kick", dtg);
> +			  IRQF_NO_AUTOEN, "dcss_ctxld_kick", dtg);
>  	if (ret) {
>  		dev_err(dtg->dev, "dtg: irq request failed.\n");
>  		return ret;
>  	}
>  
> -	disable_irq(dtg->ctxld_kick_irq);
> -
>  	dtg->ctxld_kick_irq_en = false;
>  
>  	return 0;
> -- 
> 2.34.1
> 
