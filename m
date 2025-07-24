Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C3B10FE8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FB910E12A;
	Thu, 24 Jul 2025 16:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0544210E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:49:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3931A00
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:49:49 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CEC43F66E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:49:55 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:49:53 +0100
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
Subject: Re: [PATCH v8 6/6] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
Message-ID: <aIJkMV1J41ZB1pYH@e110455-lin.cambridge.arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
 <20250724124210.3675094-7-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724124210.3675094-7-karunika.choo@arm.com>
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

On Thu, Jul 24, 2025 at 01:42:10PM +0100, Karunika Choo wrote:
> This patch adds firmware binary and GPU model naming support for
> Mali-Gx20 and Mali-Gx25 GPUs.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c |  2 ++
>  drivers/gpu/drm/panthor/panthor_hw.c | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index fa6e0b48a0b2..9bf06e55eaee 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 8c041e1074a1..4f2858114e5e 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  		fallthrough;
>  	case GPU_PROD_ID_MAKE(11, 3):
>  		return "Mali-G615";
> +	case GPU_PROD_ID_MAKE(12, 0):
> +		if (shader_core_count >= 10 && ray_intersection)
> +			return "Mali-G720-Immortalis";
> +		else if (shader_core_count >= 6)
> +			return "Mali-G720";
> +
> +		fallthrough;
> +	case GPU_PROD_ID_MAKE(12, 1):
> +		return "Mali-G620";
> +	case GPU_PROD_ID_MAKE(13, 0):
> +		if (shader_core_count >= 10 && ray_intersection)
> +			return "Mali-G925-Immortalis";
> +		else if (shader_core_count >= 6)
> +			return "Mali-G725";
> +
> +		fallthrough;
> +	case GPU_PROD_ID_MAKE(13, 1):
> +		return "Mali-G625";
>  	}
>  
>  	return "(Unknown Mali GPU)";
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
