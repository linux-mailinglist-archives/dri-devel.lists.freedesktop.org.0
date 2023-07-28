Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92904766C44
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 13:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09E910E1EA;
	Fri, 28 Jul 2023 11:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3110E1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 11:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/7sVhQRd2xxvjBCakt3SPgNS3O6FSJaL8GaF0FxbWGMM106DPd6WLIwBfrnHJKOugMoxyvL/+3yBRoEZ2CRckcgZlLk7dexhKiDMxBg6yowvAF9ZKtj7zcoRnE3aY1luZSElmzzE6il9V6FVKW29zZa+UF5hsKaxZ0TQApuFJIBPF5zsx7HnFanoEgU4u+TgH3CaKLI/FB9LIIztIA/ZETfnfqNHkUmPLhbPEHcSx8mvoq5W11/e5jOiLsijE4JZDY40Iy0HPTOElE0plE5w06S/+b6ca40wC/MmfXM7Hf5ur2ybLsFMRUzfAC6JHyDFnPCJuDQpUx0NRHSYAn4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrxNS3zMgjVrLMZd+hu4TvSU/mCPgQSGDJf8ipjoiMQ=;
 b=njJiuJCcelC5mMrBc+wp2Qlvzo93hAxUhpldctYNCKGeWcbRUhnGar1CIqvNo4QbU9Qk/jxb4//ANNFjlGbyQufSUjaZh2OFoSqoqHM+4ET09vS8vjLjixo2OkRXxOkeO2sRQgB0yLyXRKdjCh3OPvMy0+yssxvejOWwx4SxCGxXL5g/6OjjiquoUI7N00EHOytMtmjJFmfrMgqAJq/tV0SurR5b3MOf1IpqzLrHTO6P/+csI7NrOqyHSwGRP5SvnmXKyAu1cCQEUFt/6y6dULrFlRxCOdBFIKi3r9lFSu1WhRdtdHU7urHmq/tqeE6y/rBckJm9sJZ0iBg3hhMQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrxNS3zMgjVrLMZd+hu4TvSU/mCPgQSGDJf8ipjoiMQ=;
 b=YUUNE1+uxM03maEmItS73YAK8saRdISa3xXNVuIHCgmsT7GjXaTUE2PfYZDbkbHxbj1to/BJCF3n1eN3pTrps7Vp0ZYTyLj50mkP0c8rpFKCtjfFuyxmcBbeUN4nHW9gW8skXNIOGy4YY3mG7JVqbO3/cdEZt1lZjBbV4KdpJFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by DBAPR04MB7398.eurprd04.prod.outlook.com
 (2603:10a6:10:1a0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 11:59:02 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::7799:a3a4:4d84:c909]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::7799:a3a4:4d84:c909%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 11:59:01 +0000
Date: Fri, 28 Jul 2023 14:58:57 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/imx/dcss: Use dev_err_probe
Message-ID: <20230728115857.ijwy3iyxy4ssf5ik@fsr-ub1664-121.ea.freescale.net>
References: <20230717092950.448823-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717092950.448823-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: AS4PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::19) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|DBAPR04MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b39e40-3286-4015-5416-08db8f620882
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ad0lls4srm0R/WpfCglTYE92G3PL/8hN/fewkfCdY1o2mtlsRPp9cDfMogtdr8Rgq9g03dlLbzZ2Z6Wkyju8PKAUQKK+ZbO550ZANXBORcmdBg/HjsFsk1J0jRi3sQ6427McOnbQgVn9jLaBl4tNx1jK0o/62g6ZJipElYwmTrANYqI+GGAkP+I2yEqh8IgavMmvko1kC9s2LIDU/XEFMDaGcWzTzcmu4IL9NusXzVNdxVxpJzMPdDupFQW5AsZ/dlUb9TwCWgILRjpVLTYyeknLmw1oJc1k/LjjBk3XoxdobcqdUFOmBBoOfFIRqARe5lJ4sR62nlwS7ZxVMk2Hns+2EJ7FnYAUnJfbWKZbpvVRZ9axqC81dT7FvNbXoPyvK0RL1Q9J9OOExEMEFo9Rqm9Eh1Ig73gzFFOZyIWWyHydma+ovgoOdVY6dmWeSp1C1htAoJOik/W66WWG6sg4LPhYsqVS5PcVEO9Hpc+JafcvDqRyNvMOXVr0gPmoP0osCFH+uxQZ/Y3IGIrlYPi9cnAyFBmetCFDjXCdtEjyfWGF/qHjU3vZS7CeAWnDtTbQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(7416002)(41300700001)(316002)(66476007)(54906003)(66556008)(66946007)(8676002)(44832011)(4326008)(5660300002)(8936002)(6916009)(2906002)(4744005)(478600001)(9686003)(6486002)(6666004)(6512007)(86362001)(186003)(6506007)(1076003)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H1e1VIAznJBSzby/QDK/E5uFYND031Gwi6DJ+/pmC4UOO0fzch6P75WaIfrE?=
 =?us-ascii?Q?tdl7mWLrg/xI4MyWvj1lCsrHXaLGVVqxQFshu6hrxxuY/0KsmogNV4bKkQWc?=
 =?us-ascii?Q?5g8zCav9D79UmY8s6xku52VixQwicEs5JNeWf1mAZzeWoW6vivn14QMOLAsg?=
 =?us-ascii?Q?RGJ9Mcrpy9POO/hybaDWlHYt+rYP+o0Agz/3e9A31+2RW73diZZhxbGXQjjB?=
 =?us-ascii?Q?vNNX3zfKTHub2sqABhnBP9I1Nd1gZRXZrMQfZv+gG8PHePF8/O64fbSzr5+h?=
 =?us-ascii?Q?sEQKtjQAaJjgWY1LF43JGkYjAB1S8J7C8itR0fk4AoCSOu2hwjQ/AFyw14zk?=
 =?us-ascii?Q?WYfieemVkfdw37y113dGDyRj8sQzRgxqQPNjIdm1vfvfaYZ5YrR64Y33dBpq?=
 =?us-ascii?Q?MEAwmpcuSH8AsuZgMGuQ4fRlRzoY8eEM/KSCe/BXQoV5PrVVwCwDUMEekEe9?=
 =?us-ascii?Q?3Yiipig1+eDM4biB9tY+I/RBjgXb1Ki8cdhJM595NzM90nbsGnYQyc3LKGXN?=
 =?us-ascii?Q?Vgi7nCMICvmggTBsF13g4+dSuHrwyBv/2psewkRDHLpz7Tb8r6Hd1wfva+yg?=
 =?us-ascii?Q?rnbVkmJUh7m+/Z5PPP7rxIvlqcpP1IY7qn4cbZrnZftAKdbiNY2Ui39BIKrr?=
 =?us-ascii?Q?HaAQ8PhV69F16Jrp0tpYZNUi/67RSPOdujTbkg26ETXieCqvjk1jThnApkG/?=
 =?us-ascii?Q?1rbpm1sDyI5Okalxpm12kOIsLfsWgBz+bn0sDz5UDqfxDMeZu0AMsLK5WH4u?=
 =?us-ascii?Q?axVG0+67dMvgmV6L/OxPIOKFlss+LPO502ATgAPszthlaT75xshllJe6tQ+V?=
 =?us-ascii?Q?7X4eHcxoPtGpLvd3PqYdsNZzOOE779lekf8oksniKTZ9ZIKvEkckyndS1Co8?=
 =?us-ascii?Q?5cSQpgXSsQ7bbNQ7ED7jiwtYSVJUeK5/1H4noCEBgUnxL0y/v853FVVNXrWO?=
 =?us-ascii?Q?sCqiwnDhlXQ2gV2DbnraZRoEqKo9F+gjqdOBLFSRUzvp6zsilxJBX4Z2ZaMM?=
 =?us-ascii?Q?RHeeDRXxaI51UvJU/0l/Hf9AyVqaHKY41lvrbK/489ZDbVKl/21n/lPmqlgB?=
 =?us-ascii?Q?rYdDtdtF38QuLBHz/fsBuOZ4eKe8iFYeI9vifLaiqfU586Dtl4TDqbmAAs/f?=
 =?us-ascii?Q?CH4YBM29619mODEVl8Ak/dDIQAY9Q8zL6E0+iFWG2WrBp+y7hlCfAtlyCJAr?=
 =?us-ascii?Q?1eSf+/JZ9aq7cSqAUYhiLXSgflrGSr7NLcm23h6la3lzON9KvsbaCSLKb2g7?=
 =?us-ascii?Q?zsmcgOFDI7DLreSJtAe63V22T/85A7OIvBrEA6iSNjyI8p4MnJ9rI6HFvJbk?=
 =?us-ascii?Q?GwzjbgO7vkWWVmX8lXppZBdt4L7xUaWid54kb49zqWXV1l9m2z8IRcT35hCz?=
 =?us-ascii?Q?Lo2xxJUBjaDAcUe9WeHk5sHBM0/O+0UythOoq54UHZ8or7CySVPSiApb5Oz0?=
 =?us-ascii?Q?QQWRfRJ6aD+4cJ3YeXAA7bx0qnoTUwsK39Fijt9X95OFSOh3N4IgCOPaKh/m?=
 =?us-ascii?Q?S6Uf2OMI50y4q7kJQ63AnF2+JGrPRiJy2xd75h6wgWQYuTT+z77tCue+1j+C?=
 =?us-ascii?Q?T5WR6M9jeh137R/WqB09dKCdmUiU05mtmtsr+5AxAiyxkOQfvXomtJkq5I/c?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b39e40-3286-4015-5416-08db8f620882
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 11:59:01.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THr/yhRUj4g+evCd0kqo7BrVBKmvTMYvbZ0epI4202Xj0fYWIUvZYFzYToHaopErrvW6HFnqJFNqnQt5RkGrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 17, 2023 at 11:29:50AM +0200, Alexander Stein wrote:
> This helps identifying problems with downstream pipeline devices, like
> HDMI/DP output.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Pushed to drm-misc-next.

Thanks,
Laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 4f2291610139..c68b0d93ae9e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -66,6 +66,7 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>         mdrv->kms = dcss_kms_attach(mdrv->dcss);
>         if (IS_ERR(mdrv->kms)) {
>                 err = PTR_ERR(mdrv->kms);
> +               dev_err_probe(dev, err, "Failed to initialize KMS\n");
>                 goto dcss_shutoff;
>         }
> 
> --
> 2.34.1
> 
