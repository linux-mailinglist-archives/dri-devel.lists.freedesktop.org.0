Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA84233EBA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 07:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDE16E09A;
	Fri, 31 Jul 2020 05:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323E66E09A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 05:44:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4E0E880444;
 Fri, 31 Jul 2020 07:44:33 +0200 (CEST)
Date: Fri, 31 Jul 2020 07:44:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 03/49] drm/ttm: split the mm manager init code
Message-ID: <20200731054431.GA1544844@ravnborg.org>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731040520.3701599-4-airlied@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=ue1qatrXy6fBFkQhKEEA:9 a=QQ1XJDZRuU3PgwsB:21 a=fPsYbN3QKkGywonc:21
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave.

On Fri, Jul 31, 2020 at 02:04:34PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This will allow the driver to control the ordering here better.
> 
> Eventually the old path will be removed.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
>  include/drm/ttm/ttm_bo_api.h    |  4 ++++
>  include/drm/ttm/ttm_bo_driver.h |  6 ++++++
>  3 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 041a0e73cd1b..a658fd584c6d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>  }
>  EXPORT_SYMBOL(ttm_bo_evict_mm);
>  
> -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> -			unsigned long p_size)
> +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> +			 struct ttm_mem_type_manager *man,
> +			 unsigned long p_size)
>  {

General comment for all the ttm/* changes.
It would be very nice with some nice explanations for the exported
functions, preferably in kernel-doc style.
In case someone that are more or less clueless (like me) would like
to understand how a function is to be used or maybe reviewing some
random code.

	Sam


> -	int ret;
> -	struct ttm_mem_type_manager *man;
>  	unsigned i;
>  
> -	BUG_ON(type >= TTM_NUM_MEM_TYPES);
> -	man = &bdev->man[type];
>  	BUG_ON(man->has_type);
>  	man->use_io_reserve_lru = false;
>  	mutex_init(&man->io_reserve_mutex);
>  	spin_lock_init(&man->move_lock);
>  	INIT_LIST_HEAD(&man->io_reserve_lru);
>  	man->bdev = bdev;
> -
> -	if (type != TTM_PL_SYSTEM) {
> -		ret = (*man->func->init)(man, p_size);
> -		if (ret)
> -			return ret;
> -	}
> -	man->has_type = true;
> -	man->use_type = true;
>  	man->size = p_size;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
>  	man->move = NULL;
> +}
> +EXPORT_SYMBOL(ttm_bo_init_mm_base);
>  
> +int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> +			unsigned long p_size)
> +{
> +	int ret;
> +	struct ttm_mem_type_manager *man;
> +
> +	BUG_ON(type >= TTM_NUM_MEM_TYPES);
> +	ttm_bo_init_mm_base(bdev, &bdev->man[type], p_size);
> +
> +	if (type != TTM_PL_SYSTEM) {
> +		ret = (*man->func->init)(man, p_size);
> +		if (ret)
> +			return ret;
> +	}
> +	ttm_bo_use_mm(man);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_bo_init_mm);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index a9e13b252820..0060925f507a 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -546,6 +546,10 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>   * -ENOMEM: Not enough memory.
>   * May also return driver-specified errors.
>   */
> +struct ttm_mem_type_manager;
> +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> +			 struct ttm_mem_type_manager *man,
> +			 unsigned long p_size);
>  int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
>  		   unsigned long p_size);
>  
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 7958e411269a..68e75c3b8c7a 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -678,6 +678,12 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
>  	dma_resv_unlock(bo->base.resv);
>  }
>  
> +static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
> +{
> +	man->has_type = true;
> +	man->use_type = true;
> +}
> +
>  /*
>   * ttm_bo_util.c
>   */
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
