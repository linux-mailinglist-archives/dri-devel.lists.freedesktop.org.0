Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6C93C228
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810F10E7E6;
	Thu, 25 Jul 2024 12:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Rz44BXel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D094310E7E6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:36:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a7a9be21648so2726466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721911001; x=1722515801; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QpX67tPHCWzr50AIQ3LoBcemzH73grtZB2CdjvEatPI=;
 b=Rz44BXelw/Tb2cmEgdlsTusN63cs3Oz+EJ37twZTHLO+PXyP1pbyw+78mOPvNlgT/2
 fIsUY6LuHDi0NnsRPBO+Crwz5CAfstNcn/efJ9bZ05QMLhMd1rg1FgwbM3rqB0/sR7wF
 9VWYffnGPLfeDfxu4kV7hxLdhsDVgM1RlSzs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721911001; x=1722515801;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QpX67tPHCWzr50AIQ3LoBcemzH73grtZB2CdjvEatPI=;
 b=Pvw0VxjzDkh1z0peoeJAdQ3MWaxxK/NHY2BwSSV4Ohk5QIm59RkAaIvLhsBbq3Z3yy
 3DK5HX5V5k6is2SHmficrWjY3Cwlo6uJPqLM/jjjgzyE3mO1+Y9NP9ZOkDUWTvu5GvnI
 4xurDYoKCzHwYAa3zWumhtPA9FGYiw+34q9hojZeekdkojqsUVyycy4YVJdYVplt/TmM
 ESmEDGRzo24xFn6PxGDaIjvDHdqQBfuuoTWSz3O+3FHwR5iXzNQ4lemfABCM+hIp6xXb
 AnLEQxbTeOTzVaGteK7zw0wCebp4sX3ZE8v1aKiKhm9FUZU7deVQzNR229HRpmKk2x9g
 g9Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiNxM9e8aW2NDYeboxas3Hc7oLJ0LZvlnBIzC2fK+gzfyW61c4XOIoudMmOCBVRkdw9rIzbLgKcSqnPnkIKOo5I0D/8/uecLVxltu8hYa3
X-Gm-Message-State: AOJu0YwTS4tr6FU+tldma+o76WG4PH0amocl6e9cAZy2SYTfuJvOCzmt
 Wjxo+SUtKEdoMr85oYpQU4brfsuV+3S6mvWlw6Ok43kk1cq7SYcKOtiUs//oJBw=
X-Google-Smtp-Source: AGHT+IHewqbrmL3XgrpSs+fnwhPmjFHkdOdukzjiGeEOoH3ignvZTOmAdgwgvISsP6KpFJZ/W/Wsug==
X-Received: by 2002:a17:907:3fa8:b0:a7a:acae:341b with SMTP id
 a640c23a62f3a-a7ac5a9dcd0mr110492166b.9.1721911001027; 
 Thu, 25 Jul 2024 05:36:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb82e7sm68597066b.208.2024.07.25.05.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:36:40 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:36:38 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/8] drm/ttm: revert "Export ttm_bo_get_unless_zero()"
Message-ID: <ZqJG1mx3uCljGB9F@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-6-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 23, 2024 at 02:17:48PM +0200, Christian König wrote:
> This reverts commit 24dc64c1ba5c3ef0463d59fef6df09336754188d.
> 
> Shouldn't be needed by drivers any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

On the last 3 patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c          |  1 +
>  drivers/gpu/drm/ttm/ttm_bo_internal.h | 48 +++++++++++++++++++++++++++
>  drivers/gpu/drm/ttm/ttm_bo_util.c     |  2 ++
>  drivers/gpu/drm/ttm/ttm_device.c      |  1 +
>  include/drm/ttm/ttm_bo.h              | 18 ----------
>  5 files changed, 52 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0131ec802066..fe4638ec0976 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -45,6 +45,7 @@
>  #include <linux/dma-resv.h>
>  
>  #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>  
>  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>  					struct ttm_placement *placement)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> new file mode 100644
> index 000000000000..6a7305efd778
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright 2018 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + *
> + */
> +
> +#ifndef _TTM_BO_INTERNAL_H_
> +#define _TTM_BO_INTERNAL_H_
> +
> +#include <drm/ttm/ttm_bo.h>
> +
> +/**
> + * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
> + * its refcount has already reached zero.
> + * @bo: The buffer object.
> + *
> + * Used to reference a TTM buffer object in lookups where the object is removed
> + * from the lookup structure during the destructor and for RCU lookups.
> + *
> + * Returns: @bo if the referencing was successful, NULL otherwise.
> + */
> +static inline __must_check struct ttm_buffer_object *
> +ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
> +{
> +	if (!kref_get_unless_zero(&bo->kref))
> +		return NULL;
> +	return bo;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..f7143384ef1c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -37,6 +37,8 @@
>  
>  #include <drm/drm_cache.h>
>  
> +#include "ttm_bo_internal.h"
> +
>  struct ttm_transfer_obj {
>  	struct ttm_buffer_object base;
>  	struct ttm_buffer_object *bo;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..2e7fa3a11dc0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -36,6 +36,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  
>  #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>  
>  /*
>   * ttm_global_mutex - protecting the global state
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..31ec7fd34eeb 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -239,24 +239,6 @@ static inline void ttm_bo_get(struct ttm_buffer_object *bo)
>  	kref_get(&bo->kref);
>  }
>  
> -/**
> - * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
> - * its refcount has already reached zero.
> - * @bo: The buffer object.
> - *
> - * Used to reference a TTM buffer object in lookups where the object is removed
> - * from the lookup structure during the destructor and for RCU lookups.
> - *
> - * Returns: @bo if the referencing was successful, NULL otherwise.
> - */
> -static inline __must_check struct ttm_buffer_object *
> -ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
> -{
> -	if (!kref_get_unless_zero(&bo->kref))
> -		return NULL;
> -	return bo;
> -}
> -
>  /**
>   * ttm_bo_reserve:
>   *
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
