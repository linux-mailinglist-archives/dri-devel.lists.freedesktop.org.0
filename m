Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0319D811
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4646E128;
	Fri,  3 Apr 2020 13:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83686E128
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:56:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6E7A92003E;
 Fri,  3 Apr 2020 15:56:47 +0200 (CEST)
Date: Fri, 3 Apr 2020 15:56:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/pci: Move drm_pci_alloc/free under
 CONFIG_DRM_LEGACY
Message-ID: <20200403135645.GA1549@ravnborg.org>
References: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=t0KrP7e3x-nvVacQwPwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel
On Fri, Apr 03, 2020 at 01:06:09PM +0200, Daniel Vetter wrote:
> All other users have been removed, yay!
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_pci.c |  3 +++
>  include/drm/drm_legacy.h  | 15 +++++++++++++++
>  include/drm/drm_pci.h     | 26 --------------------------
>  3 files changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 81aa21561982..131b7a139fda 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -36,6 +36,8 @@
>  #include "drm_internal.h"
>  #include "drm_legacy.h"
>  
> +#ifdef CONFIG_DRM_LEGACY
> +
>  /**
>   * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
>   * @dev: DRM device
> @@ -93,6 +95,7 @@ void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>  }
>  
>  EXPORT_SYMBOL(drm_pci_free);
> +#endif
>  
>  static int drm_get_pci_domain(struct drm_device *dev)
>  {
> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> index dcef3598f49e..b53c3686c5fc 100644
> --- a/include/drm/drm_legacy.h
> +++ b/include/drm/drm_legacy.h
> @@ -194,11 +194,26 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
>  
>  #ifdef CONFIG_PCI
>  
> +struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
> +				     size_t align);
> +void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
                                                                    ^
checkpatch rightfully complains about this.

With this detail fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> +
>  int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
>  void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
>  
>  #else
>  
> +static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
> +						   size_t size, size_t align)
> +{
> +	return NULL;
> +}
> +
> +static inline void drm_pci_free(struct drm_device *dev,
> +				struct drm_dma_handle *dmah)
> +{
> +}
> +
>  static inline int drm_legacy_pci_init(struct drm_driver *driver,
>  				      struct pci_driver *pdriver)
>  {
> diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
> index 3941b0255ecf..1bf31131960e 100644
> --- a/include/drm/drm_pci.h
> +++ b/include/drm/drm_pci.h
> @@ -34,30 +34,4 @@
>  
>  #include <linux/pci.h>
>  
> -struct drm_dma_handle;
> -struct drm_device;
> -struct drm_driver;
> -struct drm_master;
> -
> -#ifdef CONFIG_PCI
> -
> -struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
> -				     size_t align);
> -void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
> -
> -#else
> -
> -static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
> -						   size_t size, size_t align)
> -{
> -	return NULL;
> -}
> -
> -static inline void drm_pci_free(struct drm_device *dev,
> -				struct drm_dma_handle *dmah)
> -{
> -}
> -
> -#endif
> -
>  #endif /* _DRM_PCI_H_ */
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
