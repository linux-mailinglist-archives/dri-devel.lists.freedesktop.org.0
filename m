Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69917CD7A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DFE6E12E;
	Sat,  7 Mar 2020 10:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE16E12E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 10:13:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0E64820033;
 Sat,  7 Mar 2020 11:13:41 +0100 (CET)
Date: Sat, 7 Mar 2020 11:13:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Make drm_pci_agp_init legacy
Message-ID: <20200307101340.GA32190@ravnborg.org>
References: <20200307093702.2269-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307093702.2269-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=taGs_qngAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=sWjrD0a8lrzNq-JErW0A:9
 a=CjuIK1q_8ugA:10 a=DM_PlaNYpjARcMQr2apF:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris.

On Sat, Mar 07, 2020 at 09:37:02AM +0000, Chris Wilson wrote:
> Pull the drm_pci_agp_init() underneath the legacy ifdeffry alongside its
> only caller.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

I dunno this code - but patch is obviously correct.
This diff is a bit weird as it shows that another function is moved.
But it makes sense looking at drm_pci.c

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_pci.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 5218475ad7e7..81aa21561982 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -166,6 +166,18 @@ int drm_irq_by_busid(struct drm_device *dev, void *data,
>  	return drm_pci_irq_by_busid(dev, p);
>  }
>  
> +void drm_pci_agp_destroy(struct drm_device *dev)
> +{
> +	if (dev->agp) {
> +		arch_phys_wc_del(dev->agp->agp_mtrr);
> +		drm_legacy_agp_clear(dev);
> +		kfree(dev->agp);
> +		dev->agp = NULL;
> +	}
> +}
> +
> +#ifdef CONFIG_DRM_LEGACY
> +
>  static void drm_pci_agp_init(struct drm_device *dev)
>  {
>  	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
> @@ -180,18 +192,6 @@ static void drm_pci_agp_init(struct drm_device *dev)
>  	}
>  }
>  
> -void drm_pci_agp_destroy(struct drm_device *dev)
> -{
> -	if (dev->agp) {
> -		arch_phys_wc_del(dev->agp->agp_mtrr);
> -		drm_legacy_agp_clear(dev);
> -		kfree(dev->agp);
> -		dev->agp = NULL;
> -	}
> -}
> -
> -#ifdef CONFIG_DRM_LEGACY
> -
>  static int drm_get_pci_dev(struct pci_dev *pdev,
>  			   const struct pci_device_id *ent,
>  			   struct drm_driver *driver)
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
