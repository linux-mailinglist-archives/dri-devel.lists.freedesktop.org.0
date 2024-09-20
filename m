Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFB97D597
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21B510E0CD;
	Fri, 20 Sep 2024 12:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N+KnNc9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAD510E0CD;
 Fri, 20 Sep 2024 12:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQrOSX3tIAsUxBnh5S7sICGA/mXfJARrK8d6FLUB8P3MG1NU6mxtyodd6sceHS+2+3j6RX97gzMuHniBeF0Qc/KY8vX3oYXRqYefonqpdEjW1nDL1MyrWFDZVwWJuGh0l1JFxP+S6OE5wEfN1aSKwe0Wf3OFBPP4eYjyIKR3lIieFgi87d7lJ1QNYDoCGXlxa2W+IRLg8afPwX5YTE0Eq73tB8um4ts8awptw15SC9wo/EoJ/phEA171xQ6KkCl9+uqsZj/lVnYBscp3NzB+InKP+sNv9CYIfDGGHQuFw0wTmamZplQUOsfCriJbCSHuL/2m+4QXZtvwZXovDyBLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNuGXDflSXOJJJ9luVlS4TJo37l/9M6SPKX1bdFZDzY=;
 b=i8LHYdswvuVgXuywS1VBb8MZPxRG4b7yjvI2EqnFL58lxvc87bKADZ+y+qcBmPf+04s0OEWBz6UDjoHzXfyv8YJ2AUv5QnqjZ1RA8FvvAhI1ty5lecV82yTldV8rjULVURC22DNm/U3iwmOLpdP3z/8YB5eKrYP6P3SHK/t8vQlnDFh/VL1lhP5TWsoZsHObXadzL117Rc6Fy7aBYUT/v059fcSh1CPeB9N9OEq76m8E9pJCpoG0W58/6RnSITD0YZiUkWHF/p5m4BrR5EhHVE4OQ4I3IgR60h0DeCcrusp4qeThfaVvnW0cAkqCDBAehL3RSLoZ/vcBkYyp+26hcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNuGXDflSXOJJJ9luVlS4TJo37l/9M6SPKX1bdFZDzY=;
 b=N+KnNc9HfpiV+/FZ+SgKfO65B2b0T7WWzWz3axJQ+cYS/Mrz99AWTOR6/x7ylumLVjGjZ416bsW2vZ4+vuVbJHj8amvuRulGSRIF5kuAwMZqFo3W61WhQusAqZxfFb7EyUs7wl9Suz9LJQWOwJIIgEoYt/Nbgw6vyU9K9//Xr1u6RNIrUlQ17idndmX09JmT3XsWal6RW4ONh6cTUl7Ja7z8Dr1aEeyEe5SDdVaUqrOQz4Nscqi8TXTfIacy65yGiRL+TPctSmjG45hpTgh4LHTqEA5ZJV0KjolV9ydBzY0xApyEryGOZ09x9wKjwJp9iBJVsYawE0Wy5mnFIRbiUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 12:44:15 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 12:44:15 +0000
Date: Fri, 20 Sep 2024 15:44:02 +0300
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
Subject: Re: [PATCH v2 1/5] drm/imx: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <upylfysoypn36ktq3qjkoyoshbmfp43wvu5rf66pnyxysil5qc@pwx7ljvkvc4f>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
 <20240912083020.3720233-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912083020.3720233-2-ruanjinjie@huawei.com>
X-ClientProxiedBy: BL1PR13CA0420.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::35) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI1PR04MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d31bb3-fab0-499f-a29e-08dcd971ef2d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l6KU5pjsUgHWmSuORfk7rEz3FOYTdWNSp1Kg1NDvtiYiyOMsNIs+l0DaMO9m?=
 =?us-ascii?Q?8bcyfF6BMpwhqRM50T4Ec4KBKERj+izR/zvA40ib4YfJlCie0m/soVnfQXgu?=
 =?us-ascii?Q?mDNA5kX5ScOBoMb8lw9PR6y1WUaU0K3G7swh/feiL+olCeS4xIpvNtVpV57M?=
 =?us-ascii?Q?xDoBFZ3k2VmhJ6n5PdSLFjDzdss+KStQsgZNK6eK+EXOwMBxnwsjRNSu3C20?=
 =?us-ascii?Q?1jewCZ+FnP8BDhH2D8ZnEfdpy7FdM70NF2qCZ88XxwTjcsGquKmctVgkG9cb?=
 =?us-ascii?Q?J9l+xQKrFjFTB61PZSnQsx9CEUwuz7Ov08dBBJxbSE8aQyjZ+CkZY07YBKvt?=
 =?us-ascii?Q?/VODoRnu8yciffNJoIKHhjH+piAGN2Pa4A4RkMqZAhGK2sBNtK13l00iErEq?=
 =?us-ascii?Q?DaTn3XoBfi6DQ0TMZiATOzqvcH0tZH4b9w+gTQLS1/ZL9Nka0utoDjVPt3RD?=
 =?us-ascii?Q?xoCw7HEepWOdarQqPaBamUdZ7v07IaAzJ/VFuCX70P/gBS2MkYPzbGumoAlQ?=
 =?us-ascii?Q?bkvh/drnH8lUPJydGlZCtN9MFAqXwEtkirXKxCYSCIppZkF0xLkp0byEU0jO?=
 =?us-ascii?Q?grfMs0ykl7kiaPhgomrTLethljYoO8ey5eoHAUCCrqCQHPPRtEoavA8SbUnu?=
 =?us-ascii?Q?ZVmqSJlKDSExQgdev4PZLWiiKPQrU8cXE2Ic1IPFs8C8oFjvD9hxs1LloYm7?=
 =?us-ascii?Q?ll1Su8uG91svCyVXj3F7nS6W7ivwaEooZJAqD8V4+dPjZALlzqqDhr+gD4R3?=
 =?us-ascii?Q?ngMckox765oRksfSjwLuy7s1iKk7S5WLs/MJVWlqM4VnEv5jK+3lBynzKUuL?=
 =?us-ascii?Q?0j2nCmOi9vNmlzV7R/bpReJ3MJx9l6k56ku9K2o/Ac3AlpaMr+RVUZAWIDuc?=
 =?us-ascii?Q?/hI6vv5TLPt3EnZvD11ndi0VgDTd4AE4v2B84jK3XvyK9NpNB3JMxriB3vZs?=
 =?us-ascii?Q?L/iewvFOqiAy2pKZ+jzTV+NpFyhzo+tlucrsT7VuiG3V3cXClU4c6VN+U0eo?=
 =?us-ascii?Q?greNgbjifGPMr2iCZLfkwatnbdYATvtJpvOL86o+VCZ9kQ+SI8q+z3FHJse2?=
 =?us-ascii?Q?ubi9K660OaRHPo6w3xHkxZng+cygQ9fjwUVRjbKz4VTtEG4JBiHOvyIsClUa?=
 =?us-ascii?Q?+FikqK+xCY+5utfBhqHBRHG//AFU08xp6bMLYVgNuBAflarrJzWUCbjmE9Tg?=
 =?us-ascii?Q?2rSXMMMVeeInQE+CaiZvfJKMH0cZBeOCU/DGOwzcFTrqjPaYz09GWSxS7KCp?=
 =?us-ascii?Q?UR9ecqkDePy3o3Fv78WA9f6AGZ9SUFzKr9ftFXxzjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZLMaZZhpBGRdlo5StbEzeayDD7cVPSbGUyDI6/xNdNnoXLPv/9EmpLkVHBk?=
 =?us-ascii?Q?q9IhemMVJqxThPiqSx5lINa6dm9YrFXHsip6Mhh3NjnRpavnk9FrubvOBQXc?=
 =?us-ascii?Q?VShFbVZ7eaHT933sPf6RBgmcKe0F7bzFJ/R22rZR4MGDWrr+7eOz4Wpjvc/o?=
 =?us-ascii?Q?U2/9JDzHguyJjIvZKaaLQ/LZfPG9ilOnkEol21QGuMwJF2g2owdluBG8DhDA?=
 =?us-ascii?Q?bpNPITkfN6CeDjQ6lOaYzgDa0nUeEZwbskmDCQh0PNg6G4/j32j4938BVkDR?=
 =?us-ascii?Q?/WDuYvwPFYnrE4EZT87Mp0yKmh6WJmubs0JlNJ9tHW8RWhaH4kwLP2kWspwF?=
 =?us-ascii?Q?h8m8QKwOzhY3fzNqBZQxqVHkphHGyIjU28s9Ss4abxAEsKAQCvNdhvOELdN3?=
 =?us-ascii?Q?rOrdlAKWBBLXkqUJLHT0PXInxa9DKFK1RHvXnslzPtDYFo7GKMNPV8v4hndN?=
 =?us-ascii?Q?vKgTej3+IQpGsAlqk1hEPI2wBlBkkHJOa9VPEZCmnN6RnFoImXWd+H4UMSBL?=
 =?us-ascii?Q?sRXNkJQPCJaqqe3qJFCyzIkHfa3QkeYLr0O47+E2yUZ7Mv5rULDA1ggj5Rcj?=
 =?us-ascii?Q?/PI/5Z90PqxIh1m3HUy63sMZBtA6dJGoF7ir8aJVCVSQlzqHkzMDUCd8FNMo?=
 =?us-ascii?Q?VA4tOEEdvkKNZ+/weV1+Xspx2+bLR1cLDR5ZY+4YPWV1OZoSFshhTBcM+6/G?=
 =?us-ascii?Q?wdJf9YRK+x1x9QZ+jWokFAtdxdvABwSFLQh7XIJ3BeJbjY2gpU4Nv5yJoOsx?=
 =?us-ascii?Q?e5/VKvc3ad2WNVORTBzs55NHfcQlAO0e60kkiTdb8UJg1Ddpyh8p5K2YVYR9?=
 =?us-ascii?Q?SRZqCATxYfw6FuZI8/ndyv8Ed4IUNA9qufRutlTfVaQxRkE2JNfJyFr/HTYO?=
 =?us-ascii?Q?Ti7z96Rj40hia8UPT3yROstkJ8I55obd1rMLiSx+at0nzlwjVAxg6BUT9dfj?=
 =?us-ascii?Q?k7BRSihvoQMl1XHDDHBVwgivDurX4Ht7ze1zOiZLCc5a/OJ9W9WbEFCoGqXY?=
 =?us-ascii?Q?wIqhZGg/sPRr8QGfeQJKN/fofUTx+3Cc11oh4XTmZhib8L/JZNDomCE1JSVG?=
 =?us-ascii?Q?OgR+pumJEJhzpyEyx/o3Xiqto9xLiYR0aOHIZ5xEPvaWnXF0iROE4QiQpPhA?=
 =?us-ascii?Q?HIlVPaxE33x8XFsgpcI6R0xP3WXhh8QF2oUruxWZzj8gjbuKK710aEc6Lkne?=
 =?us-ascii?Q?QJXDn27aO5fhp8aMKlxrCpfeRk5HmapBXq1OCeR+HurxUgLQS2Z5z+JTcZVV?=
 =?us-ascii?Q?KmUQ/W1A8Z2n6DO9rnhtubtWhPQNNk46x7M34vAfD97BpAFEjkH7nqiYp0vM?=
 =?us-ascii?Q?yrMGzS5cSyoSXCBkFpZSkVY9gEHn08d9toPaeTFoth7RHOPiYhkHI8kveS3p?=
 =?us-ascii?Q?Hyxd4XcYris3Fl0mDdacU8X7hKp1LH/6dENiSBEhjAds++winWn/ogqhGHLM?=
 =?us-ascii?Q?fJi9ZyK9sYrlV9dNYf7sfl3Dxm2p4DD/BYjFWEMcZMQ/kDHifzn7B43sAH0y?=
 =?us-ascii?Q?k1dizn0bCoNZ6WEpWC+3Dqpgl4FMsL1VmUUEPkRNNhvI2tbd8Jv7E4XmQ8es?=
 =?us-ascii?Q?A3XhtisSE+z1Xk8sXVNQl4TdPW19TAEXxilLT09SR4iKHib/MuNnlJS02X1G?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d31bb3-fab0-499f-a29e-08dcd971ef2d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 12:44:15.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2Xu7SwLDN7V1ZA27P3ItK2uXikyzjmXnkdjdYoGja9F6Kjv78ha/dYfUvFiUSy84NF3LzTXx/j10gxdqQ9PMw==
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

Hi Jinjie,

On Thu, Sep 12, 2024 at 04:30:16PM +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

I think the commit subject should start with drm/imx/dcss. Not sure if
this is worth another patch set just for that. I suppose the commiter
could fix it before pushing.

Other than that:
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> v2:
> - Update the commit subject.
> ---
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> index 31267c00782f..af91e45b5d13 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> @@ -206,15 +206,13 @@ int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm)
>  	if (crtc->irq < 0)
>  		return crtc->irq;
>  
> -	ret = request_irq(crtc->irq, dcss_crtc_irq_handler,
> -			  0, "dcss_drm", crtc);
> +	ret = request_irq(crtc->irq, dcss_crtc_irq_handler, IRQF_NO_AUTOEN,
> +			  "dcss_drm", crtc);
>  	if (ret) {
>  		dev_err(dcss->dev, "irq request failed with %d.\n", ret);
>  		return ret;
>  	}
>  
> -	disable_irq(crtc->irq);
> -
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
