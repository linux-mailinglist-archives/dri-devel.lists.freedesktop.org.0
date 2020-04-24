Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63D1B7BAE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3E06EAC5;
	Fri, 24 Apr 2020 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62126EABB;
 Fri, 24 Apr 2020 16:34:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 62C1B2002B;
 Fri, 24 Apr 2020 18:33:59 +0200 (CEST)
Date: Fri, 24 Apr 2020 18:33:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 03/59] drm/vboxvideo: Use devm_drm_dev_alloc
Message-ID: <20200424163357.GA3822@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=Bk0440REuxafkr821JAA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:39:38AM +0200, Daniel Vetter wrote:
> Straightforward conversion.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 282348e071fe..7dd25c7a3768 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -46,25 +46,19 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		return ret;
>  
> -	vbox = kzalloc(sizeof(*vbox), GFP_KERNEL);
> -	if (!vbox)
> -		return -ENOMEM;
> -
> -	ret = drm_dev_init(&vbox->ddev, &driver, &pdev->dev);
> -	if (ret) {
> -		kfree(vbox);
> -		return ret;
> -	}
> +	vbox = devm_drm_dev_alloc(&pdev->dev, &driver,
> +				  struct vbox_private, ddev);
> +	if (IS_ERR(vbox))
> +		return PTR_ERR(vbox);
>  
>  	vbox->ddev.pdev = pdev;
>  	vbox->ddev.dev_private = vbox;
>  	pci_set_drvdata(pdev, vbox);
> -	drmm_add_final_kfree(&vbox->ddev, vbox);
>  	mutex_init(&vbox->hw_mutex);
>  
>  	ret = pci_enable_device(pdev);
>  	if (ret)
> -		goto err_dev_put;
> +		return ret;
>  
>  	ret = vbox_hw_init(vbox);
>  	if (ret)
> @@ -100,8 +94,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	vbox_hw_fini(vbox);
>  err_pci_disable:
>  	pci_disable_device(pdev);
> -err_dev_put:
> -	drm_dev_put(&vbox->ddev);
>  	return ret;
>  }
>  
> @@ -114,7 +106,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
>  	vbox_mode_fini(vbox);
>  	vbox_mm_fini(vbox);
>  	vbox_hw_fini(vbox);
> -	drm_dev_put(&vbox->ddev);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
