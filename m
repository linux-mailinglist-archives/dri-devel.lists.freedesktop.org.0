Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B2A6B5BA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8810E6FB;
	Fri, 21 Mar 2025 08:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mIQIvL/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FE410E6FB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742544179;
 bh=rhsDyrz4zR+5L67y8VXAF6e+qnJE23mVLj+8WRtBdTc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mIQIvL/bkBGDqsvLGdO61e5lAjksHiMgYpD/lx7tojgtIrNFjo0CKMaqiAkFGiv7/
 d3UpG/rJFSKE8PATRzlp8EtqR+HniUSc7ZGoStM5zuXTTTwDeGZAVZ6iJQ8Ab6lbut
 DZS7kId9eHAm7QqV/MPsOWQ1JDpSjEJ/01Rh9ObQnjPY9gWF4rpem1QFRxt6nCvnCw
 2krctEMc8VLigDLiBMSb9r9H4D/mACaYE8sIiR7qZtwtBY0xe/TCEX49UZBu5jurD4
 6tYaJk/6hm4vwJ83ctA2KPy56IE2EZW8V4sw6hGXEzPNDrKCMHgv0tX0tcFkKkhpNW
 D2TMacjkNsIkQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AC18517E0C81;
 Fri, 21 Mar 2025 09:02:58 +0100 (CET)
Date: Fri, 21 Mar 2025 09:02:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple
 and extensible
Message-ID: <20250321090254.667a86cb@collabora.com>
In-Reply-To: <20250320111741.1937892-6-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-6-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 20 Mar 2025 11:17:37 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch replaces the previous panthor_model structure with a simple
> switch case based on the product_id, which is in the format of:
>         ((arch_major << 24) | product_major)
> 
> This not only simplifies the comparison, but also allows extending the
> function to accommodate naming differences based on GPU features.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>  drivers/gpu/drm/panthor/panthor_regs.h |  1 +
>  2 files changed, 18 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 4cc4b0d5382c..12183c04cd21 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -5,40 +5,6 @@
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
> -
> -static const struct panthor_model gpu_models[] = {
> -	GPU_MODEL(g610, 10, 7),
> -	{},
> -};
> -
>  static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
> @@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>  	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>  }
>  
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

I a big fan of these ever growing switch statements with nested
conditionals. Could we instead add an optional ::get_variant() callback
in panthor_model and have the following formatting:

	"Mali-%s%s%s", model->name,
		       model->get_variant ? "-" : "",
		       model->get_variant ? model->get_variant() : ""

> +
> +	return "(Unknown Mali GPU)";
> +}
> +
>  static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  {
> -	const struct panthor_model *model;
> -	u32 arch_major, product_major;
> +	const char *gpu_model_name = get_gpu_model_name(ptdev);
>  	u32 major, minor, status;
>  
>  	ptdev->hw->ops.gpu_info_init(ptdev);
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
> +		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>  		 major, minor, status);
>  
>  	drm_info(&ptdev->base,
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index ba452c1dd644..d9e0769d6f1a 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -20,6 +20,7 @@
>  #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
>  
>  #define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
>  
>  #define GPU_L2_FEATURES					0x4
>  #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))

