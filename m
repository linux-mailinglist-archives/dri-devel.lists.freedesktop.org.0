Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC09625D06
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 15:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EB010E1A3;
	Fri, 11 Nov 2022 14:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2528410E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3XREj+zIH6YYkzuHq+hFc8BOihU6L6R85Q5Czo86D2yMh9ilLGoxP2z/hBas8fJp9CxeDNciL2KzJOc3VWcBRxs0Ql+IxOxmYH8ctO7blsBZbHph8oOjxPo8+MQFs2WOvEaf4C3PF0aabpg1IPXhoFm3vHsnSfqMWbhHK/QhL2DAJglEt6JJt3vbwTRBSO/GzTMprAP5PmjhyoQil/G0AqMsWnSXxHXOxqFsO1mhP0oyC1Wedi0FBpyr+i5HaDVG+pa6+Xmj+kCr1KG1OSS7lm8uCw5NsuFjzsGLYVP6uOMALMLlJeRjMQMJ41g2dGdq4vpCDmhy4XRTZk7nKoZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YkTryQ6MfV91tc1zyN7sL+kH0gcJp0a80eVeqaRago=;
 b=aMhwc8B41fPl0tEAkDubqAWF/7K7i6qejDoihNvduQAxgySXH2BZa4z7SGcU3BqcGM2bCWpJPRiH+J+2PIEEeXJkeaZFfXx5Da1vWwST4BBIFSDznWJW+LfYZl7p3NbJ4tUthVGhtuLEYNtOUUsVe0FtJjzbowtZYU2QVNPC/SNr1AHH7ngKoXu3jTK/5zl2mD7jM4RWr7nKvQKB2xEYdxUFkvtuGhqSTP5Ews0FJw3kmGXz9r/GIJga5bHQulWUbY+M2oV5Rnho9mI0d0RpY46hDhtHZ5L0gO/EtYcskXFDPZXVfxCr3w5AWVZquq6eMXkibZoZjRnRQWo1RQUg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YkTryQ6MfV91tc1zyN7sL+kH0gcJp0a80eVeqaRago=;
 b=VwOIfn9x55lzL57Y+yl/taQiSdB3l996foquDxB89wdeXFv1BjYyTZi2P0rJuj/dJDcv17nILCxn4dqFRNdmYnV5tkyVL9ct6U1o5gvgAGZuXnMZlvJ/ECmXCwxQm/C1+DZvpgRGFfIpi2noo+QY+pYQRIe9DDJ1LPlAX1pP1wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB7248.eurprd04.prod.outlook.com
 (2603:10a6:800:1aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 11 Nov
 2022 14:27:55 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::dc6:42de:92c9:c633]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::dc6:42de:92c9:c633%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 14:27:55 +0000
Date: Fri, 11 Nov 2022 16:27:50 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/26] drm: imx/dcss: Remove #ifdef guards for PM related
 functions
Message-ID: <20221111142750.b6raolzxnfzxqeaf@fsr-ub1664-121.ea.freescale.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-11-paul@crapouillou.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107175106.360578-11-paul@crapouillou.net>
X-ClientProxiedBy: AM0PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::16) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f1bc0f-b75a-46ef-c46d-08dac3f0ec78
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXHRcWqvpFz4RAd/hEy5nwb6Ib1j044EQmEjntC+nG4jcwGMzxuDbnOlnSIEx67A+mQOtL6mFHZQodeAF7Cfok5HDE7iwsScBnB8vWTBjQfO//5xTVxBZkj8rbPHFaqGiH9YWYRcblEoHzl6NbA5xFmxFbnBTR/23Q12uwzhsZQqvIG2Ri6g1bBlIpL3A+b/N5I4D+ObGCFhfEB4D6X4by9cIgAO5QN6tYocSKSsSMruwwvg2JL8o4/wXgae9a0OxNhf2exP1zD8zzTzdI4kU6vjUKL24w7eMSvunuB08BVVbrINTPhywt6LafKB+FZztRkNrLluickvRURMbPZYAPfmmtMtoExUOFKHCCw6uTY1V++ZJG/GCprDo4xeqsDbl7wtel18Zw0ERsFZa/KxJlWHdgKGgsbxjGM0tmxfrjJL7dDsEnes1m5UVch+WIohlR9Mdi2AR18oVTwAitJdhj8Zh3EIT7Z8ABIVWBSgTDMVa9jzbzymt5wgVFBQRqNr8Fb5jFBfLVZ1eFpDGh0mosLwHsO96JgbVbiSp88bbNROsGspeEwrzMN6/qr0rsy79zIrWMHG9VTMjJrzWYT/ZMC7GDC1KnUbHnYiqbj+eHKaOgUuKQJBvEdXgVX/XQDYrYkvqz42xOnQkRWpyelDg91ECCltalk1HSsKtPTgi3MVP/eq1gp/rlBT14AYInXtWLn7n590pPeDp2pSLx9tsvVNldezq8Fnfjvq9fZJyq4KWfqQvR8t33uaAtdrRHQd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(316002)(8676002)(6916009)(54906003)(8936002)(4326008)(86362001)(41300700001)(186003)(1076003)(66946007)(66476007)(66556008)(7416002)(2906002)(5660300002)(83380400001)(6506007)(6666004)(6486002)(44832011)(6512007)(478600001)(26005)(9686003)(38100700002)(38350700002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zpV1XkINKZEy+/1vPWZPiVv5zXEnDeDIqt8SNFi+sfMD1zyBj0bV3D/8kZDi?=
 =?us-ascii?Q?7q42G0qC1wbtdpJVR+oYW6QGcxizEMA4aiQClj3f6CddUVNWbtQ1FcFEII6t?=
 =?us-ascii?Q?eCViIKDgQ82Cz4drrcQfUCBj1uqnPJMRmZuTrHjcSPeHKLRJ592VATfISwzv?=
 =?us-ascii?Q?A9a4VD1cp8QcKlDgsXYxTDKPgqSR3rvKiOMFyIDYSeBr5D3pZq5TKn/WU7QE?=
 =?us-ascii?Q?4s4MiHVPmW73bWc5ZSm+G8AiO1UDPQqvlm0GkL+Xz0Nd1sT8qaceA1BWru6d?=
 =?us-ascii?Q?E0H9f58UWX69uR2/AHx1b82JpZklkQ7GEZo4owGVU9sozpuZ3KkdrQKgg/gu?=
 =?us-ascii?Q?AVGyXKM0wTAtpw+hssr2CiXLJbooKx+e4pCmDdT8Oy6OPmn3UnQlIaFJ3RFX?=
 =?us-ascii?Q?yp8dr7f/tZeK+o6pbDya+hzb8HINs+AfHa6GO0I53ph5SsIiM0Ww526arbIJ?=
 =?us-ascii?Q?t4cix5EaLcMfkAF/SZ5+M6EPgssZNN80/N4tB/j+Qy7ExUzTpGC6SS0AMG9y?=
 =?us-ascii?Q?x5kn70+phXZuPxpUxqevb4QpRBBBrGjRu85241OLPT+Cg29f3Ll4IX5iUY9B?=
 =?us-ascii?Q?dAOHuEv1SXCZhvlNPld7xCtlN8raVAm0G+84HqCtIve6AR29l05hJeUEBL85?=
 =?us-ascii?Q?7nJiRHSOaaeXmviP0+5TUro892Pu9xM1EiXKI56Zk2kerU+uEgVq7XU+pNMR?=
 =?us-ascii?Q?gjOad9y1i5zZgDeIyaa8CjyKfE4FwTdDqPeapuiwqkcYuPef2/6ZoI7Ik6y4?=
 =?us-ascii?Q?ytYiIqSJMR71YfjoGNQJEXkTb8FHiNUin6mHNClM4w7jDwje9xc9HO4JQTuC?=
 =?us-ascii?Q?iF1Xu8DPatmNtBP/3NTjtkkQbg7h7uF6yClmrPKS9+WvtG5Q+Sv/1lLaXRZJ?=
 =?us-ascii?Q?3dDqcxKNo9g1iqA8Gp81gKhVkheUe4ggs8p8ULPLBdNHcilzWQT7vVeUapkj?=
 =?us-ascii?Q?XwU2dqMUaRfRHGMnnVxfY9VTpLkjomrBCs6GGd3ASaGGP1izW2QoNKxCfWk3?=
 =?us-ascii?Q?apY7r2x1CcVD/MUB8dS3VqGb1YA0zZYkmoGUYx/ly50rXxmsU/kdTTOQG3nY?=
 =?us-ascii?Q?GJKF40XbuBHzK9QVmDGOmogQkScjLoh/UDeNchozmOhOXT7NrM3kOyahPWG6?=
 =?us-ascii?Q?OIwehZe3FXEOp/OvtI89yXRLElVh3Qq3oRlDTfgwdkKa6WnBcmaxFb4d2G6u?=
 =?us-ascii?Q?OCBprdvo34JAjgcunm3dg/5hdz/9jxXYoR1nvZ2gcv2szqritO1Av2fSiCAA?=
 =?us-ascii?Q?Qeoe3cZUzTfihOmyRlKJURQ95InPtrKiRAjf6NH2FfYH2ZsXbZ+UFXMfKHFi?=
 =?us-ascii?Q?I0vL07iJjbbYsjn+d12rKWQtTEKao3/hywiLDy9icfS+GOL5GpC3iuKEZ9Z6?=
 =?us-ascii?Q?rA2cLi9W2/dVhjwEkH7IMM5gErGkFBsRWI/CaJ65yXVjC+s0DToBben/A0Ys?=
 =?us-ascii?Q?Rus8sp1a4oQks+/ISvuxU6L6L3mykywZZhNyrGGysRsu2+M4X7FYWcvo+4Pi?=
 =?us-ascii?Q?pRoV6Vld9/fSWZBruzIxEmWTGe1LmKid5OK0jdQKIjKxg9mAM9JjFkBLhA68?=
 =?us-ascii?Q?MxMYvaOb2Qk5U1ym05U3wSSNy+MvgMLTHl9N0KGcQjCPflKmHO3F1c6JvFU+?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f1bc0f-b75a-46ef-c46d-08dac3f0ec78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:27:55.5438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxQHyTPPtE9w5OdTZBiqiuaddyJ4s5uwMQ87gEf4aSB8FEd3aHJ4GNq1WSspIX6KrylMIcpwrCbxc7/wnwIWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Mon, Nov 07, 2022 at 05:50:50PM +0000, Paul Cercueil wrote:
> Use the EXPORT_GPL_DEV_PM_OPS() and pm_ptr() macros to handle the PM
> callbacks.
> 
> These macros allow the PM functions to be automatically dropped by the
> compiler when CONFIG_PM is disabled, without having to use #ifdef
> guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 17 +++++++++--------
>  drivers/gpu/drm/imx/dcss/dcss-dev.h |  7 +++----
>  drivers/gpu/drm/imx/dcss/dcss-drv.c |  8 +-------
>  3 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index 3f5750cc2673..66d9233ffb98 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -249,8 +249,7 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
>  	kfree(dcss);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -int dcss_dev_suspend(struct device *dev)
> +static int dcss_dev_suspend(struct device *dev)
>  {
>  	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
>  	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
> @@ -273,7 +272,7 @@ int dcss_dev_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -int dcss_dev_resume(struct device *dev)
> +static int dcss_dev_resume(struct device *dev)
>  {
>  	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
>  	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
> @@ -296,10 +295,8 @@ int dcss_dev_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_PM_SLEEP */
>  
> -#ifdef CONFIG_PM
> -int dcss_dev_runtime_suspend(struct device *dev)
> +static int dcss_dev_runtime_suspend(struct device *dev)
>  {
>  	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
>  	int ret;
> @@ -313,7 +310,7 @@ int dcss_dev_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -int dcss_dev_runtime_resume(struct device *dev)
> +static int dcss_dev_runtime_resume(struct device *dev)
>  {
>  	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
>  
> @@ -325,4 +322,8 @@ int dcss_dev_runtime_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_PM */
> +
> +EXPORT_GPL_DEV_PM_OPS(dcss_dev_pm_ops) = {
> +	RUNTIME_PM_OPS(dcss_dev_runtime_suspend, dcss_dev_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
> +};
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> index 1e582270c6ea..f27b87c09599 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane.h>
>  #include <linux/io.h>
> +#include <linux/pm.h>
>  #include <video/videomode.h>
>  
>  #define SET			0x04
> @@ -95,13 +96,11 @@ struct dcss_dev *dcss_drv_dev_to_dcss(struct device *dev);
>  struct drm_device *dcss_drv_dev_to_drm(struct device *dev);
>  struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output);
>  void dcss_dev_destroy(struct dcss_dev *dcss);
> -int dcss_dev_runtime_suspend(struct device *dev);
> -int dcss_dev_runtime_resume(struct device *dev);
> -int dcss_dev_suspend(struct device *dev);
> -int dcss_dev_resume(struct device *dev);
>  void dcss_enable_dtg_and_ss(struct dcss_dev *dcss);
>  void dcss_disable_dtg_and_ss(struct dcss_dev *dcss);
>  
> +extern const struct dev_pm_ops dcss_dev_pm_ops;
> +
>  /* BLKCTL */
>  int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base);
>  void dcss_blkctl_cfg(struct dcss_blkctl *blkctl);
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 1c70f70247f6..431510bd811b 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -117,19 +117,13 @@ static const struct of_device_id dcss_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, dcss_of_match);
>  
> -static const struct dev_pm_ops dcss_dev_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
> -	SET_RUNTIME_PM_OPS(dcss_dev_runtime_suspend,
> -			   dcss_dev_runtime_resume, NULL)
> -};
> -
>  static struct platform_driver dcss_platform_driver = {
>  	.probe	= dcss_drv_platform_probe,
>  	.remove	= dcss_drv_platform_remove,
>  	.driver	= {
>  		.name = "imx-dcss",
>  		.of_match_table	= dcss_of_match,
> -		.pm = &dcss_dev_pm,
> +		.pm = pm_ptr(&dcss_dev_pm_ops),
>  	},
>  };
>  
> -- 
> 2.35.1
> 
