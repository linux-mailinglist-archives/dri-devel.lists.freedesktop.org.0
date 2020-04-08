Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95D1A1C7E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77F6E97B;
	Wed,  8 Apr 2020 07:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1C6E977;
 Wed,  8 Apr 2020 07:21:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EDB9180512;
 Wed,  8 Apr 2020 09:21:47 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:21:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/44] drm/vboxvidoe: use managed pci functions
Message-ID: <20200408072146.GG14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-10-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=5f0EG9r70SJPuSumHAIA:9
 a=hHI8y3FQYHU1GQY2:21 a=v_aV3BSb6LtSlo_t:21 a=CjuIK1q_8ugA:10
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

On Fri, Apr 03, 2020 at 03:57:53PM +0200, Daniel Vetter wrote:
> Allows us to drop the cleanup code on the floor.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

With this change we avoid calling pci_disable_device()
twise in case vbox_mm_init() fails.
Once in vbox_hw_fini() and once in the error path.

Which is just a small extra bonus.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index d34cddd809fd..c80695c2f6c0 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_drvdata(pdev, vbox);
>  	mutex_init(&vbox->hw_mutex);
>  
> -	ret = pci_enable_device(pdev);
> +	ret = pcim_enable_device(pdev);
>  	if (ret)
>  		return ret;
>  
>  	ret = vbox_hw_init(vbox);
>  	if (ret)
> -		goto err_pci_disable;
> +		return ret;
>  
>  	ret = vbox_mm_init(vbox);
>  	if (ret)
> @@ -93,8 +93,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	vbox_mm_fini(vbox);
>  err_hw_fini:
>  	vbox_hw_fini(vbox);
> -err_pci_disable:
> -	pci_disable_device(pdev);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 9dcab115a261..1336ab9795fc 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox)
>  
>  	for (i = 0; i < vbox->num_crtcs; ++i)
>  		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> -
> -	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>  }
>  
>  /* Do we support the 4.3 plus mode hint reporting interface? */
> @@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>  	vbox->guest_pool = gen_pool_create(4, -1);
>  	if (!vbox->guest_pool)
> -		goto err_unmap_guest_heap;
> +		return -ENOMEM;
>  
>  	ret = gen_pool_add_virt(vbox->guest_pool,
>  				(unsigned long)vbox->guest_heap,
> @@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
>  
>  err_destroy_guest_pool:
>  	gen_pool_destroy(vbox->guest_pool);
> -err_unmap_guest_heap:
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>  	return ret;
>  }
>  
> @@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
>  {
>  	vbox_accel_fini(vbox);
>  	gen_pool_destroy(vbox->guest_pool);
> -	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
>  }
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
