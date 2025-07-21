Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91EB0C6A2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DD110E553;
	Mon, 21 Jul 2025 14:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C31010E553
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:41:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27538153B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:41:17 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5A873F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:41:22 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:41:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/panthor: Simplify getting the GPU model name
Message-ID: <aH5RkcSdkApS4Nd4@e110455-lin.cambridge.arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-3-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721111344.1610250-3-karunika.choo@arm.com>
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

On Mon, Jul 21, 2025 at 12:13:40PM +0100, Karunika Choo wrote:
> This patch replaces the panthor_model structure with a simple switch
> case based on the product_id which is in the format of:
>         ((arch_major << 24) | product_major)
> 
> This simplifies comparison and allows extending of the function to
> accommodate naming differences based on supported GPU features.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
>  1 file changed, 17 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 3f7175cb0ab4..f39010c0ca86 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -5,39 +5,22 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> -/**
> - * struct panthor_model - GPU model description
> - */
> -struct panthor_model {
> -	/** @name: Model name. */
> -	const char *name;
> -
> -	/** @arch_major: Major version number of architecture. */
> -	u8 arch_major;
> -
> -	/** @product_major: Major version number of product. */
> -	u8 product_major;
> -};
> -
> -/**
> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
> - * by a combination of the major architecture version and the major product
> - * version.
> - * @_name: Name for the GPU model.
> - * @_arch_major: Architecture major.
> - * @_product_major: Product major.
> - */
> -#define GPU_MODEL(_name, _arch_major, _product_major) \
> -{\
> -	.name = __stringify(_name),				\
> -	.arch_major = _arch_major,				\
> -	.product_major = _product_major,			\
> -}
> +#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
> +	(((arch_major) << 24) | (prod_major))
> +
> +static char *get_gpu_model_name(struct panthor_device *ptdev)
> +{
> +	const u32 gpu_id = ptdev->gpu_info.gpu_id;
> +	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
> +						GPU_PROD_MAJOR(gpu_id));
> +
> +	switch (product_id) {
> +	case GPU_PROD_ID_MAKE(10, 7):
> +		return "Mali-G610";
> +	}
>  
> -static const struct panthor_model gpu_models[] = {
> -	GPU_MODEL(g610, 10, 7),
> -	{},
> -};
> +	return "(Unknown Mali GPU)";
> +}
>  
>  static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
> @@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
>  {
> -	const struct panthor_model *model;
> -	u32 arch_major, product_major;
>  	u32 major, minor, status;
>  
>  	panthor_gpu_info_init(ptdev);
>  
> -	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> -	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>  	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>  	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>  	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>  
> -	for (model = gpu_models; model->name; model++) {
> -		if (model->arch_major == arch_major &&
> -		    model->product_major == product_major)
> -			break;
> -	}
> -
>  	drm_info(&ptdev->base,
> -		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> +		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
>  		 major, minor, status);
>  
>  	drm_info(&ptdev->base,
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
