Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B393C2CA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 15:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D2D10E7ED;
	Thu, 25 Jul 2024 13:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JSu/hGeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B610E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 13:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C94C2CE135C;
 Thu, 25 Jul 2024 13:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B95C116B1;
 Thu, 25 Jul 2024 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721913602;
 bh=q/87njUpBTK5CKvoQbtBLNFmxeqw7l6bejSeAxR4R0o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JSu/hGeKQgbRzmREiiGHNwo67KxdHwzjqckJ/KRw83WCoW2oRq38AOO67V3P134Q0
 ef+u91iBBDrAtupGA2ksrduY3Ir87j6RunrNXQDAif62tZmd1fBoVBzIbp3M2Kf2Kz
 dJ4nMSPl7OkkAAxqYeyloAaV0hjDhWQ7OCjfjDcHMFL/+h0OUoo5vJI2kBT2/Ym6A5
 9SKBEPSNokTzt/it8bq8qtEcCGI1UVY/KEMqiayZkqYV/Nqxe54zAee9LnbUO5nE7D
 YJlwDYetVCixZOBwkf/iagBAMkTwb4yK53GwfSvTbzj6GANB4dRr52X1IuB9XuCYSR
 iqDjPA51m4gvw==
Message-ID: <67aae071-b3d4-431b-8603-92dc79caba0c@kernel.org>
Date: Thu, 25 Jul 2024 15:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/ttm: revert "Export ttm_bo_get_unless_zero()"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-6-christian.koenig@amd.com>
Content-Language: en-US
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20240723121750.2086-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/23/24 2:17 PM, Christian König wrote:
> This reverts commit 24dc64c1ba5c3ef0463d59fef6df09336754188d.
> 
> Shouldn't be needed by drivers any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Technically, this series should be a v2, right? I also still think it would be
good to add the corresponding driver maintainers to the recipient list.

Anyway, for the TTM patches: Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c          |  1 +
>   drivers/gpu/drm/ttm/ttm_bo_internal.h | 48 +++++++++++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  2 ++
>   drivers/gpu/drm/ttm/ttm_device.c      |  1 +
>   include/drm/ttm/ttm_bo.h              | 18 ----------
>   5 files changed, 52 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0131ec802066..fe4638ec0976 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -45,6 +45,7 @@
>   #include <linux/dma-resv.h>
>   
>   #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>   
>   static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>   					struct ttm_placement *placement)
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
>   #include <drm/drm_cache.h>
>   
> +#include "ttm_bo_internal.h"
> +
>   struct ttm_transfer_obj {
>   	struct ttm_buffer_object base;
>   	struct ttm_buffer_object *bo;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..2e7fa3a11dc0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -36,6 +36,7 @@
>   #include <drm/ttm/ttm_placement.h>
>   
>   #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>   
>   /*
>    * ttm_global_mutex - protecting the global state
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..31ec7fd34eeb 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -239,24 +239,6 @@ static inline void ttm_bo_get(struct ttm_buffer_object *bo)
>   	kref_get(&bo->kref);
>   }
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
>   /**
>    * ttm_bo_reserve:
>    *
