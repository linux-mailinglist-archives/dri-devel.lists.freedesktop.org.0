Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5A2DD625
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 18:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2859489733;
	Thu, 17 Dec 2020 17:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F7589733
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 17:29:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4733E8055A;
 Thu, 17 Dec 2020 18:29:46 +0100 (CET)
Date: Thu, 17 Dec 2020 18:29:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Add the CONFIG_PM_SLEEP
Message-ID: <20201217172945.GB1339623@ravnborg.org>
References: <1608110114-32024-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608110114-32024-1-git-send-email-tiantao6@hisilicon.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=BTeA3XvPAAAA:8 a=eqhiWkSdKQUePfnrP2IA:9
 a=CjuIK1q_8ugA:10 a=tafbbOV3vt1XuEhzTjGK:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian,
On Wed, Dec 16, 2020 at 05:15:14PM +0800, Tian Tao wrote:
> add the CONFIG_PM_SLEEP to isolate the function of resume and suspend.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 7e91ef1..faa664d 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -65,6 +65,7 @@ static const struct drm_driver hibmc_driver = {
>  	.irq_handler		= hibmc_drm_interrupt,
>  };
>  
> +#ifdef CONFIG_PM_SLEEP
>  static int __maybe_unused hibmc_pm_suspend(struct device *dev)
>  {
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
> @@ -78,6 +79,7 @@ static int  __maybe_unused hibmc_pm_resume(struct device *dev)
>  
>  	return drm_mode_config_helper_resume(drm_dev);
>  }
> +#endif

The __maybe_unused in combination of the use of
SET_SYSTEM_SLEEP_PM_OPS() should cover all situations and the ifdef
should not be required.

So unless you are trying to fix a warning or so then there is no reason
to do this change. The linker will drop the function in the end and the
__maybe_unused will prevent a compile-time warning.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
