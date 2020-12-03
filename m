Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2802CDF4E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 21:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D099E6E038;
	Thu,  3 Dec 2020 20:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FCC6E038
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 20:07:18 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B63F880534;
 Thu,  3 Dec 2020 21:07:13 +0100 (CET)
Date: Thu, 3 Dec 2020 21:07:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
Message-ID: <20201203200711.GA74163@ravnborg.org>
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=BTeA3XvPAAAA:8 a=e5mUnYsNAAAA:8
 a=ZRss9xuAS5q6kMSJnlUA:9 a=CjuIK1q_8ugA:10 a=tafbbOV3vt1XuEhzTjGK:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian.

On Wed, Dec 02, 2020 at 04:47:14PM +0800, Tian Tao wrote:
> Add new api devm_drm_irq_install() to register interrupts,
> no need to call drm_irq_uninstall() when the drm module is removed.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Just a few details to fix.

	Sam

> ---
>  drivers/gpu/drm/drm_irq.c | 35 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_irq.h     |  2 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 09d6e9e..b363dec 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -214,6 +214,41 @@ int drm_irq_uninstall(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_irq_uninstall);
>  
> +static void devm_drm_irq_uninstall(void *data)
> +{
> +	drm_irq_uninstall(data);
> +}
> +
> +/**
> + * devm_drm_irq_install - install IRQ handler
> + * @dev: DRM device
> + * @irq: IRQ number to install the handler for
> + *
> + * devm_drm_irq_install is a  help function of drm_irq_install.
Drop the extra space after "is a"
> + *
> + * if the driver uses devm_drm_irq_install, there is no need
Start with capital "I" in If
> + * to call drm_irq_uninstall when the drm module get unloaded,
> + * as this will done automagically.
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
> + */
> +int devm_drm_irq_install(struct drm_device *dev, int irq)
> +{
> +	int ret;
> +
> +	ret = drm_irq_install(dev, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev->dev, devm_drm_irq_uninstall, dev);
> +	if (ret)
> +		devm_drm_irq_uninstall(dev);
devm_add_action_or_reset() will call devm_drm_irq_uninstall() if ret is
!= 0. See include/device.h.

I guess that is the "_or_reset" part of the name that can tell us that.
So you can drop the if condition as it just will cause the code to call
drm_irq_uninstall() twice.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_drm_irq_install);
> +
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
>  int drm_legacy_irq_control(struct drm_device *dev, void *data,
>  			   struct drm_file *file_priv)
> diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
> index d77f6e6..631b22f 100644
> --- a/include/drm/drm_irq.h
> +++ b/include/drm/drm_irq.h
> @@ -28,5 +28,5 @@ struct drm_device;
>  
>  int drm_irq_install(struct drm_device *dev, int irq);
>  int drm_irq_uninstall(struct drm_device *dev);
> -
> +int devm_drm_irq_install(struct drm_device *dev, int irq);
>  #endif
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
