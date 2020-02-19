Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC716468A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839B56E7EC;
	Wed, 19 Feb 2020 14:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680E46E7DC;
 Wed, 19 Feb 2020 14:11:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BECCB2F9;
 Wed, 19 Feb 2020 15:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582121495;
 bh=mrNMgGmsSah0cfjOGKPD1HLUQozwUr32qMmb62eujsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pehkv4uv8ktd4JuJcbF6MCEvT49NuGDn3Iwe+lbQtkH/celGymdf4/oDqgDujD/y9
 uhdkh793diOrh77Id+KwagH1+G96lOSgDHVjgQczrGB5lMK5FKNwahcn36beofqCrR
 4AyZrZk/mZSXNeZahsTKdu9261wfyJLz6ZUmCsG4=
Date: Wed, 19 Feb 2020 16:11:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 19/52] drm/<drivers>: Use drmm_add_final_kfree
Message-ID: <20200219141116.GJ5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-20-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-20-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:20:49AM +0100, Daniel Vetter wrote:
> These are the leftover drivers that didn't have a ->release hook that
> needed to be updated.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Hans de Goede <hdegoede@redhat.com>
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

Instead of sprinkling calls to drmm_add_final_kfree() everywhere,
wouldn't it be better to pass the parent pointer to drm_dev_init() ?

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
