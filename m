Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44F1A5EED
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 16:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4F6E40B;
	Sun, 12 Apr 2020 14:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570B96E40B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 14:18:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 835BC804A3;
 Sun, 12 Apr 2020 16:18:49 +0200 (CEST)
Date: Sun, 12 Apr 2020 16:18:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Add the shutdown for hibmc_pci_driver
Message-ID: <20200412141842.GA12313@ravnborg.org>
References: <1586573370-41945-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586573370-41945-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=BTeA3XvPAAAA:8
 a=e5mUnYsNAAAA:8 a=AGzG8Xd3EExtzCPMGWIA:9 a=CjuIK1q_8ugA:10
 a=tafbbOV3vt1XuEhzTjGK:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, xinliang.liu@linaro.org,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian.

On Sat, Apr 11, 2020 at 10:49:30AM +0800, Tian Tao wrote:
> add the shutdown function to release the resource.
> 

Why it the release of the memory required in the shutdown method?
The memory is allocated using devm_ioremap() which
will let device management handle the release of the resources when
he driver is released.

The patch also introduces a pci_disable_device()
The better approch would be to use pcim_enable_device()
so you let the device management about releasing the
resources.

	Sam

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c2..126d4f4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -232,6 +232,21 @@ static int hibmc_hw_map(struct hibmc_drm_private *priv)
>  	return 0;
>  }
>  
> +static void hibmc_hw_unmap(struct hibmc_drm_private *priv)
> +{
> +	struct drm_device *dev = priv->dev;
> +
> +	if (priv->mmio)	{
> +		devm_iounmap(dev->dev, priv->mmio);
> +		priv->mmio = NULL;
> +	}
> +
> +	if (priv->fb_map) {
> +		devm_iounmap(dev->dev, priv->fb_map);
> +		priv->fb_map = NULL;
> +	}
> +}
> +
>  static int hibmc_hw_init(struct hibmc_drm_private *priv)
>  {
>  	int ret;
> @@ -258,6 +273,7 @@ static int hibmc_unload(struct drm_device *dev)
>  
>  	hibmc_kms_fini(priv);
>  	hibmc_mm_fini(priv);
> +	hibmc_hw_unmap(priv);
>  	dev->dev_private = NULL;
>  	return 0;
>  }
> @@ -374,6 +390,12 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
>  	drm_dev_unregister(dev);
>  	hibmc_unload(dev);
>  	drm_dev_put(dev);
> +	pci_disable_device(pdev);
> +}
> +
> +static void hibmc_pci_shutdown(struct pci_dev *pdev)
> +{
> +	hibmc_pci_remove(pdev);
>  }
>  
>  static struct pci_device_id hibmc_pci_table[] = {
> @@ -386,6 +408,7 @@ static struct pci_driver hibmc_pci_driver = {
>  	.id_table =	hibmc_pci_table,
>  	.probe =	hibmc_pci_probe,
>  	.remove =	hibmc_pci_remove,
> +	.shutdown = hibmc_pci_shutdown,
>  	.driver.pm =    &hibmc_pm_ops,
>  };
>  
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
