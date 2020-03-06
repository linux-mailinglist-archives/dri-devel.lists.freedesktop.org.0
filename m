Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E617C70B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231146ED6A;
	Fri,  6 Mar 2020 20:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453006ED6A;
 Fri,  6 Mar 2020 20:28:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CF45920020;
 Fri,  6 Mar 2020 21:28:25 +0100 (CET)
Date: Fri, 6 Mar 2020 21:28:24 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 18/51] drm/<drivers>: Use drmm_add_final_kfree
Message-ID: <20200306202824.GD14757@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-19-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-19-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7CQSdrXTAAAA:8
 a=QyXUC8HyAAAA:8 a=PHq6YzTAAAAA:8 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=maB04IDlnCp2Ca7OKHkA:9 a=cGmLYQ7tJa1KhM_i:21
 a=mte4hDfRcyZL_Emq:21 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ZKzU8r6zoKMcqsNulkmm:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:25:58PM +0100, Daniel Vetter wrote:
> These are the leftover drivers that didn't have a ->release hook that
> needed to be updated.
> 
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Hans de Goede <hdegoede@redhat.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 ++
>  drivers/gpu/drm/armada/armada_drv.c             | 2 ++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c            | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 442d4656150a..16dfd5cdb66c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_irq.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -271,6 +272,7 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  	err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
>  	if (err)
>  		goto free_kms;
> +	drmm_add_final_kfree(drm, kms);
>  
>  	drm->dev_private = mdev;
>  
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 197dca3fc84c..dd9ed71ed942 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -103,6 +104,7 @@ static int armada_drm_bind(struct device *dev)
>  		kfree(priv);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(&priv->drm, priv);
>  
>  	/* Remove early framebuffers */
>  	ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 8512d970a09f..13eaae7921f5 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  
>  #include "vbox_drv.h"
>  
> @@ -54,6 +55,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	vbox->ddev.pdev = pdev;
>  	vbox->ddev.dev_private = vbox;
>  	pci_set_drvdata(pdev, vbox);
> +	drmm_add_final_kfree(&vbox->ddev, vbox);
>  	mutex_init(&vbox->hw_mutex);
>  
>  	ret = pci_enable_device(pdev);
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
